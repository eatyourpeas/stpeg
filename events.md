---
layout: default
title: Events
---

# Current Event

{% assign current_event = site.events | get_current_event %}
{% assign next_placeholder = site.events | generate_next_meeting_placeholder %}

{% if current_event %}
<div class="current-event-card">
    <h2><a href="{{ current_event.url | relative_url }}">{{ current_event.title }}</a></h2>
    <div class="event-summary">
        <p><strong>{{ current_event.date | date: "%A, %B %d, %Y" }}</strong> at <strong>{{ current_event.time }}</strong></p>
        <p><strong>{{ current_event.location }}</strong></p>
        <p>Hosted by {{ current_event.host_name }}, {{ current_event.host_hospital }}</p>
        
        {% assign links_disabled = current_event | should_disable_event_links %}
        {% assign is_tba = current_event | event_is_tba %}
        {% unless links_disabled %}
        <div class="event-actions">
            {% if current_event.calendar_link and current_event.calendar_link != "#" %}
            <a href="{{ current_event.calendar_link }}" class="btn btn-primary"><i class="fa-solid fa-calendar-plus"></i> Save to Calendar</a>
            {% endif %}
            {% if current_event.eventbrite_link and current_event.eventbrite_link != "#" %}
            <a href="{{ current_event.eventbrite_link }}" class="btn btn-secondary"><i class="fa-solid fa-ticket"></i> Book on Eventbrite</a>
            {% endif %}
        </div>
        {% else %}
            {% if is_tba %}
            <p class="event-tba-notice"><em>📅 Programme details and registration will be announced soon.</em></p>
            {% else %}
            <p class="event-past-notice"><em>This event has concluded. Registration is no longer available.</em></p>
            {% endif %}
        {% endunless %}
    </div>
</div>
{% elsif next_placeholder %}
<div class="upcoming-event-placeholder">
    <h2>{{ next_placeholder.title }}</h2>
    <p class="placeholder-status">📅 <strong>To be announced</strong></p>
    <p>Details for our next {{ next_placeholder.season | capitalize }} meeting will be published soon.</p>
    <p>Please check back regularly or follow our updates for venue, date, and registration information.</p>
</div>
{% else %}
<div class="no-event-placeholder">
    <h2>Upcoming STPEG Meeting</h2>
    <p class="placeholder-status">📅 <strong>To be announced</strong></p>
    <p>Details for our next meeting will be published soon.</p>
    <p>Please check back regularly for updates on venue, date, and registration information.</p>
</div>
{% endif %}

# Previous Events

{% assign past_events = site.events | get_past_events: current_event %}

{% if past_events.size > 0 %}
<div class="past-events">
    {% for event in past_events %}
    <div class="past-event-card">
        <div class="past-event-banner">
            <h3><a href="{{ event.url | relative_url }}">{{ event.title }}</a></h3>
            <p>{{ event.date | date: "%B %Y" }}</p>
            <p><small>{{ event.location }}</small></p>
        </div>
    </div>
    {% endfor %}
</div>
{% else %}
<p>No previous events to display.</p>
{% endif %}