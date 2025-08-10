---
layout: default
title: Events
---

# Current Event

{% assign current_event = site.events | where_exp: "e", "e.is_current == true or e.is_current == 'true'" | first %}
{% if current_event == nil %}
    {%- comment -%} Fallback: pick the next upcoming event by date {%- endcomment -%}
    {% assign upcoming_events = site.events | where_exp: "e", "e.date and e.date >= site.time" | sort: "date" %}
    {% assign current_event = upcoming_events | first %}
{% endif %}

{% if current_event %}
<div class="current-event-card">
    <h2><a href="{{ current_event.url | relative_url }}">{{ current_event.title }}</a></h2>
    <div class="event-summary">
        <p><strong>{{ current_event.date | date: "%A, %B %d, %Y" }}</strong> at <strong>{{ current_event.time }}</strong></p>
        <p><strong>{{ current_event.location }}</strong></p>
        <p>Hosted by {{ current_event.host_name }}, {{ current_event.host_hospital }}</p>
        <div class="event-actions">
            <a href="{{ current_event.calendar_link }}" class="btn btn-primary"><i class="fa-solid fa-calendar-plus"></i> Save to Calendar</a>
            <a href="{{ current_event.eventbrite_link }}" class="btn btn-secondary"><i class="fa-solid fa-ticket"></i> Book on Eventbrite</a>
        </div>
    </div>
</div>
{% else %}
<p>No current event scheduled. Please check back soon for updates on our next conference.</p>
{% endif %}

# Previous Events

{%- comment -%}
List all events in the past by date, excluding the current/upcoming event. This works even if is_current is missing or boolean/string.
{%- endcomment -%}
{% assign past_events = site.events | where_exp: "e", "e.date and (current_event == nil or e.url != current_event.url) and e.date < site.time" | sort: "date" | reverse %}
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