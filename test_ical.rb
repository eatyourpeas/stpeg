require 'icalendar'
require 'date'

puts "Ruby version: #{RUBY_VERSION}"
puts "Icalendar gem path: #{Gem.loaded_specs['icalendar'].full_gem_path}"

begin
  cal = Icalendar::Calendar.new

  event_obj = Icalendar::Event.new
  event_obj.dtstart     = Icalendar::Values::DateTime.new(DateTime.now)
  event_obj.dtend       = Icalendar::Values::DateTime.new(DateTime.now + 1)
  event_obj.summary     = "Test Event"
  event_obj.description = "This is a test event."
  event_obj.location    = "Test Location"

  cal.add_event(event_obj)
  cal.publish

  ics_content = cal.to_ical
  puts "\nICS content generated successfully:"
  puts ics_content
rescue => e
  puts "\nAn error occurred: #{e.class}"
  puts "Message: #{e.message}"
  puts "Backtrace:"
  puts e.backtrace
end
