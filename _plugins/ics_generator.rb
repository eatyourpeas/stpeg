require 'date'

module Jekyll
  class IcsGenerator < Generator
    safe true
    priority :low

    def generate(site)
      site.collections['events'].docs.each do |event|
        next unless event.data['is_current'] == 'true' && event.data['date']

        event_date = event.data['date']
        start_time_str, end_time_str = event.data['time'].split(' - ')

        start_datetime = DateTime.parse("#{event_date} #{start_time_str} +0000")
        end_datetime = DateTime.parse("#{event_date} #{end_time_str} +0000")

        uid = "#{start_datetime.strftime('%Y%m%dT%H%M%S')}-#{event.data['title'].gsub(/[^a-zA-Z0-9]/, '')}@stpeg.org"
        
        ics_content = <<~ICS
        BEGIN:VCALENDAR
        VERSION:2.0
        PRODID:-//stpeg.org//NONSGML v1.0//EN
        BEGIN:VEVENT
        UID:#{uid}
        DTSTAMP:#{Time.now.utc.strftime('%Y%m%dT%H%M%SZ')}
        DTSTART:#{start_datetime.strftime('%Y%m%dT%H%M%S')}
        DTEND:#{end_datetime.strftime('%Y%m%dT%H%M%S')}
        SUMMARY:#{event.data['title']}
        DESCRIPTION:Hosted by #{event.data['host_name']} from #{event.data['host_hospital']}. More details at #{site.config['url']}#{event.url}
        LOCATION:#{event.data['location']}
        END:VEVENT
        END:VCALENDAR
        ICS

        # Create a file for the ICS
        ics_dir = File.join(site.dest, 'assets', 'ics')
        FileUtils.mkdir_p(ics_dir) unless Dir.exist?(ics_dir)
        
        ics_filename = "#{File.basename(event.path, '.md')}.ics"
        ics_path = File.join(ics_dir, ics_filename)
        
        File.open(ics_path, 'w') do |f|
          f.write(ics_content)
        end

        # Add the static file to the site's list of static files
        # site.static_files << Jekyll::StaticFile.new(site, site.dest, File.join('assets', 'ics'), ics_filename)

        # Update the event's data to include the calendar link
        event.data['calendar_link'] = "/assets/ics/#{ics_filename}"
      end
    end
  end
end
