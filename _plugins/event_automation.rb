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
    
  end
end

Liquid::Template.register_filter(Jekyll::EventAutomation)