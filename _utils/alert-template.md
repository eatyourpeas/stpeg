# Alert Template

This file provides a template for creating new STPEG alerts. Copy this template when creating new alerts in the `_alerts/` folder.

**Filename format:** `descriptive-name-YYYY-MM-DD.md` (e.g., `website-update-2025-10-12.md`, `meeting-cancelled-2025-11-01.md`)

**Note:** Alert display is automatically managed based on published_date and end_date. No manual intervention required.

---

```yaml
---
title: "Alert Title Here"
subtitle: "Optional subtitle or context"  # Optional - can be omitted
published_date: YYYY-MM-DD  # When the alert should start showing
end_date: YYYY-MM-DD        # When the alert should stop showing
type: "info"                # Options: info, success, warning, error/danger
priority: 1                 # Lower numbers = higher priority (1 = highest, 999 = lowest)
---

Your alert message content goes here in **Markdown format**.

You can include:
- Lists and bullet points
- **Bold** and *italic* text
- [Links](https://example.com)
- Multiple paragraphs

Keep messages concise but informative for the best user experience.
```

## Instructions for Use

1. **Copy this template** when creating a new alert
2. **Update the filename** to be descriptive and include the date
3. **Fill out the YAML frontmatter** with:
   - `title`: Clear, concise alert title
   - `subtitle`: Optional additional context
   - `published_date`: When alert should start appearing (YYYY-MM-DD)
   - `end_date`: When alert should stop appearing (YYYY-MM-DD)
   - `type`: Alert type (determines styling and icon)
   - `priority`: Display order (1 = highest priority)
4. **Write the alert content** in Markdown format below the frontmatter
5. **Commit and push** - the alert will automatically appear on the homepage

## Alert Types

### `info` (Default)
- **Use for**: General information, updates, announcements
- **Color**: Blue
- **Icon**: Info circle
- **Example**: Website updates, general announcements

### `success`
- **Use for**: Positive news, completions, achievements
- **Color**: Green  
- **Icon**: Check circle
- **Example**: Successful event completions, new features launched

### `warning`
- **Use for**: Important notices, changes, upcoming deadlines
- **Color**: Orange
- **Icon**: Exclamation triangle
- **Example**: Registration deadlines, schedule changes

### `error` or `danger`
- **Use for**: Critical issues, cancellations, urgent matters
- **Color**: Red
- **Icon**: Exclamation circle
- **Example**: Event cancellations, system issues

## Priority Guidelines

- **Priority 1-3**: Critical/urgent alerts (errors, cancellations)
- **Priority 4-6**: Important notices (deadlines, changes)  
- **Priority 7-9**: General information (updates, announcements)
- **Priority 10+**: Low priority notices

Alerts are sorted by priority (lowest number first), then by published date (newest first).

## Date Guidelines

- **published_date**: Set to current date or future date when alert should appear
- **end_date**: Consider the relevance period:
  - Event-specific: Set to event date or shortly after
  - General updates: 2-4 weeks from publication
  - Critical issues: Until resolved + grace period
  - Seasonal content: End of relevant season

## Content Guidelines

- **Keep it concise**: Alerts should be scannable
- **Use clear language**: Avoid jargon when possible
- **Include actions**: Tell users what to do if relevant
- **Be specific**: Include dates, times, and links where helpful
- **Consider mobile**: Content should work on small screens

## Examples

### Info Alert (Website Update)
```yaml
---
title: "Website Updated with New Features"
subtitle: "Automated event management now active"
published_date: 2025-10-12
end_date: 2025-11-30
type: "info"
priority: 5
---
```

### Warning Alert (Registration Deadline)
```yaml
---
title: "Registration Closing Soon"
subtitle: "Spring 2026 Meeting"
published_date: 2026-03-01
end_date: 2026-04-15
type: "warning"
priority: 2
---
```

### Error Alert (Event Cancellation)
```yaml
---
title: "Meeting Cancelled"
subtitle: "Autumn 2025 Meeting"
published_date: 2025-09-15
end_date: 2025-10-15
type: "error"
priority: 1
---
```

## Automated Features

Once published, the alert system will automatically:

- Show alerts on the homepage when within the date range
- Hide alerts once the end_date passes
- Sort alerts by priority and publication date
- Apply appropriate styling based on type
- Display correct icons for each alert type
- Format dates consistently

No manual maintenance required - the system manages alert lifecycle automatically.