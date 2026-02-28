module Jekyll
  module EventAutomation
    
    # Generate next meeting placeholder based on the last event
    def generate_next_meeting_placeholder(events)
      return unless events && events.length > 0
      
      # Get the latest event by date
      latest_event = events.max_by { |e| e.data['date'] }
      return unless latest_event
      
      latest_date = latest_event.data['date']
      latest_year = latest_date.year
      
      # Determine if latest was Spring (Mar-Jun) or Autumn (Sep-Dec)
      latest_month = latest_date.month
      
      if latest_month >= 3 && latest_month <= 6
        # Latest was Spring, next is Autumn
        next_season = "Autumn"
        next_year = latest_year
      elsif latest_month >= 9 && latest_month <= 12
        # Latest was Autumn, next is Spring  
        next_season = "Spring"
        next_year = latest_year + 1
      else
        # Fallback - assume next is based on current time
        current_month = Time.now.month
        if current_month >= 1 && current_month <= 6
          next_season = "Autumn"
          next_year = Time.now.year
        else
          next_season = "Spring"
          next_year = Time.now.year + 1
        end
      end
      
      {
        'title' => "STPEG #{next_season} Meeting #{next_year}",
        'season' => next_season.downcase,
        'year' => next_year,
        'status' => 'to-be-announced'
      }
    end
    
    # Check if an event is in the past
    def event_is_past?(event)
      return false unless event && event.data['date']
      event.data['date'] < Time.now
    end
    
    # Get current event (not past, marked as current, or next upcoming)
    def get_current_event(events)
      return nil unless events && events.length > 0
      
      # First, try events explicitly marked as current that aren't past
      current_marked = events.find do |e|
        (e.data['is_current'] == true || e.data['is_current'] == 'true') && 
        !event_is_past?(e)
      end
      return current_marked if current_marked
      
      # If no current marked event, get next upcoming event by date
      upcoming = events
        .select { |e| e.data['date'] && !event_is_past?(e) }
        .min_by { |e| e.data['date'] }
      
      return upcoming
    end
    
    # Get past events
    def get_past_events(events, current_event = nil)
      return [] unless events && events.length > 0
      
      past = events
        .select { |e| e.data['date'] && event_is_past?(e) }
        .reject { |e| current_event && e.url == current_event.url }
        .sort_by { |e| e.data['date'] }
        .reverse
        
      return past
    end
    
    # Check if event links should be disabled (past events or TBA events)
    def should_disable_event_links?(event)
      return true if event_is_past?(event)
      return true if event.data['status'] == 'to-be-announced'
      false
    end
    
    # Check if an event should show TBA message instead of action buttons
    def event_is_tba?(event)
      return true if event.data['status'] == 'to-be-announced'
      false
    end

    # ALERT MANAGEMENT FUNCTIONS

    # Get active alerts (within date range and not expired)
    def get_active_alerts(alerts)
      return [] unless alerts && alerts.length > 0
      
      current_date = Date.today
      
      active = alerts.select do |alert|
        published_date = alert.data['published_date']
        end_date = alert.data['end_date']
        
        # Must have both dates
        next false unless published_date && end_date
        
        # Convert to Date objects if they aren't already
        published_date = published_date.to_date if published_date.respond_to?(:to_date)
        end_date = end_date.to_date if end_date.respond_to?(:to_date)
        
        # Must be currently active (published and not expired)
        published_date <= current_date && end_date >= current_date
      end
      
      # Sort by priority (lower numbers = higher priority), then by published date (newest first)
      active.sort_by { |a| [a.data['priority'] || 999, -(a.data['published_date'].to_date.to_time.to_i)] }
    end

    # Check if alert is currently active
    def alert_is_active?(alert)
      return false unless alert && alert.data['published_date'] && alert.data['end_date']
      
      current_date = Date.today
      published_date = alert.data['published_date'].to_date
      end_date = alert.data['end_date'].to_date
      
      published_date <= current_date && end_date >= current_date
    end

    # Get alert icon class based on type
    def get_alert_icon(type)
      case type.to_s.downcase
      when 'info'
        'fa-info-circle'
      when 'warning'
        'fa-exclamation-triangle'
      when 'error', 'danger'
        'fa-exclamation-circle'
      when 'success'
        'fa-check-circle'
      else
        'fa-info-circle'  # default
      end
    end

    # Format alert date for display
    def format_alert_date(date)
      return '' unless date
      date.strftime("%B %d, %Y")
    end

  end
end

# Register hook to populate current event data
Jekyll::Hooks.register :site, :pre_render do |site|
  events = site.collections['events'].docs
  return unless events && events.length > 0
  
  # Find current event (marked as current or next upcoming)
  current_event = events.find do |e|
    (e.data['is_current'] == true || e.data['is_current'] == 'true') && 
    e.data['date'] && e.data['date'] >= Time.now
  end
  
  # If no current marked event, get next upcoming event by date
  unless current_event
    current_event = events
      .select { |e| e.data['date'] && e.data['date'] >= Time.now }
      .min_by { |e| e.data['date'] }
  end
  
  site.data['current_event'] = current_event.data if current_event
end

Liquid::Template.register_filter(Jekyll::EventAutomation)