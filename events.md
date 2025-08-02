---
layout: default
title: Events
---

# Current Event

<!-- Debug: Let's see all event URLs -->
{% for event in site.events %}
  Event: {{ event.title }} - URL: {{ event.url }} - is_current: {{ event.is_current }}
{% endfor %}

{% assign current_event = site.events | where: "is_current", "true" | first %}

{% if current_event %}
<div class="current-event-card">
    <h2><a href="{{ current_event.url | relative_url }}">{{ current_event.title }}</a></h2>
    <div class="event-summary">
        <p><strong>{{ current_event.date | date: "%A, %B %d, %Y" }}</strong> at <strong>{{ current_event.time }}</strong></p>
        <p><strong>{{ current_event.location }}</strong></p>
        <p>Hosted by {{ current_event.host_name }}, {{ current_event.host_hospital }}</p>
        <div class="event-actions">
            <a href="{{ current_event.calendar_link }}" class="btn btn-primary">📅 Save to Calendar</a>
            <a href="{{ current_event.eventbrite_link }}" class="btn btn-secondary">🎟️ Book on Eventbrite</a>
        </div>
    </div>
</div>
{% else %}
<p>No current event scheduled. Please check back soon for updates on our next conference.</p>
{% endif %}

# Previous Events

{% assign past_events = site.events | where: "is_current", "false" | sort: "date" | reverse %}
{% if past_events.size > 0 %}
<div class="past-events">
    {% for event in past_events %}
    <div class="past-event-card">
        <div class="past-event-banner">
            <h3><a href="{{ event.url | relative_url }}">{{ event.date | date: "%B %Y" }}</a></h3>
            <p>{{ event.location }}</p>
        </div>
    </div>
    {% endfor %}
</div>
{% else %}
<p>No previous events to display.</p>
{% endif %}