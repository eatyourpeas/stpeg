# Event Template

This file provides a template for creating new STPEG events. Copy this template when creating new events in the `_events/` folder.

**Filename format:** `season-year.md` (e.g., `spring-2026.md`, `autumn-2026.md`)

---

```yaml
---
title: "STPEG [Season] Meeting [Year]"
date: YYYY-MM-DD  # Spring: 4th Friday in April, Autumn: 2nd Friday in October
time: "To be announced"  # Update with actual times when confirmed
location: "Robens Suite, 29th Floor, Tower Wing, Guy's Hospital, Great Maze Pond, London, SE1 9RT"
host_name: "To be announced"  # Update with actual host details
host_hospital: "To be announced"  # Update with host's hospital/trust
is_current: true  # Set to false for past events
calendar_link: "#"  # Update with actual calendar link when available
eventbrite_link: "#"  # Update with actual booking link when available
schedule:
  - time: "TBC"
    title: "Registration and Coffee/Tea and networking"
    description: "Welcome and networking"
  - time: "TBC"
    title: "Welcome and Introduction"
    speaker: "Host Name TBC"
    description: "Host institution TBC"
  # Add more schedule items as needed
  # Template items:
  # - time: "HH:MM"
  #   title: "Presentation Title"
  #   speaker: "Speaker Name"
  #   description: "Speaker title and institution"
  # - time: "HH:MM-HH:MM"
  #   title: "Break/Coffee/Tea"
  # - time: "HH:MM"
  #   title: "Case: Case Title"
  #   speaker: "Presenter Name"
  #   description: "Presenter grade and institution"
  # - time: "HH:MM"
  #   title: "Business and Updates"
  #   speaker: "STPEG Committee Member"
  #   description: "Role and institution"
  # - time: "HH:MM-HH:MM"
  #   title: "Drinks reception and Dinner"
sponsors: []
# Add sponsors when confirmed:
# sponsors:
#   - name: "Sponsor Name"
#     logo: "/assets/images/sponsor-logo.png"
acknowledgements: ""  # Update with sponsor acknowledgements
---

## STPEG [Season] Meeting [Year]

**Date:** [Day], [Month] [Date]th, [Year] ([nth] Friday in [Month])  
**Venue:** Robens Suite, 29th Floor, Tower Wing, Guy's Hospital  
**Address:** Great Maze Pond, London, SE1 9RT

[Update with current status - either "Details to be announced" or actual programme information]

## About This Event

**Learning Aim:** This study-day helps delegates develop an approach to manage paediatric endocrine conditions.

Our [Season] [Year] meeting takes place at the Robens Suite on the 29th floor of Guy's Hospital with spectacular views over London. The event features:

- [Update with actual programme highlights when available]
- Networking opportunities with colleagues
- Industry exhibition stands (if applicable)
- [Evening programme if applicable]

## Target Audience

- Paediatric trainees
- Specialty doctors (SAS)
- Paediatric consultants with special interest in endocrinology/diabetes
- Healthcare professionals in paediatric endocrinology

## Venue Details

**Robens Suite, 29th Floor, Tower Wing**  
Guy's Hospital  
Great Maze Pond  
London SE1 9RT

For detailed directions and travel information, please see our [Getting There](../getting-there/) page.

## Registration

[Update with registration information when available]

## Accreditation

This event provides continuing professional development for all attendees. Certificates of attendance will be available.
```

## Instructions for Use

1. **Copy this template** when creating a new event
2. **Update the filename** to match the event (e.g., `spring-2026.md`)
3. **Replace all placeholder text** with actual event details
4. **Update the YAML frontmatter** with:
   - Correct date (following the 4th Friday in April / 2nd Friday in October pattern)
   - Actual host details when confirmed
   - Programme schedule
   - Sponsor information
5. **Set `is_current`** appropriately:
   - `true` for the upcoming/current event
   - `false` for past events
6. **Update content sections** with event-specific information

## Key Fields to Update

### YAML Frontmatter
- `title`: Event title
- `date`: Event date (YYYY-MM-DD format)
- `time`: Event timing
- `host_name`: Event host(s)
- `host_hospital`: Host institution
- `schedule`: Complete programme
- `sponsors`: Sponsor details
- `acknowledgements`: Sponsor acknowledgements

### Content Sections
- Event description
- Programme highlights
- Registration information
- Any special features or notes

## Date Calculation

- **Spring meetings:** 4th Friday in April
- **Autumn meetings:** 2nd Friday in October

Use online date calculators to determine exact dates for future years.
