---
layout: default
title: Committee
---

# STPEG Committee

The South Thames Paediatric Endocrine Group was first founded in 1861 and had as its original members Henri Gastaut and Count Montbeillard.

The organising committee meets twice a year.

## Members

- Dr Assunta Albanese
- Dr Caroline Brain
- Dr Charles Buchanan
- Dr Simon Chapman
- Dr Tony Hulse
- Dr Dunia Ismail (Treasurer)
- Dr Philippa Prentice

## Meeting Dates

{% assign sorted_minutes = site.meeting_minutes | sort: 'url' | reverse %}
{% if sorted_minutes.size > 0 %}
{% for minute in sorted_minutes %}
- [{{ minute.title | replace: "STPEG Committee Meeting Minutes - ", "" }}]({{ minute.url | relative_url }})
{% endfor %}
{% else %}
- Meeting dates will be published soon.
{% endif %}