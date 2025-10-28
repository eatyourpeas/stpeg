# STPEG Website

This is the official website for the South Thames Paediatric Endocrine Group (STPEG), built with Jekyll and automatically deployed to GitHub Pages.

## About STPEG

The South Thames Paediatric Endocrine Group organises biannual conferences attended by approximately 100 healthcare professionals working in paediatric endocrinology across hospitals in South East England, from King's and Guy's in London to Margate on the east coast and Brighton and Hastings on the south coast.

## Website Features

- **Events**: Current and historical conference information
- **Speakers**: Biographical information for conference presenters
- **Host Pack**: Comprehensive guidance for event organizers
- **Getting There**: Travel information for conference venues
- **Responsive Design**: Mobile-friendly interface
- **Professional Styling**: Medical, professional, child and family-friendly design
- **Automated Event Management**: Smart event lifecycle handling (see below)

## Automated Event Management

⚠️ **Important**: Event closing and lifecycle management is now **fully automated** based on event dates. No manual intervention is required.

### How It Works

The website includes an intelligent event automation system (`_plugins/event_automation.rb`) that automatically:

1. **Detects Current Events**: Identifies which event should be featured as "current" based on dates
2. **Archives Past Events**: Automatically moves events to the "Past Events" section when their date passes
3. **Disables Registration**: Removes Eventbrite and calendar download links for past events
4. **Generates Placeholders**: Creates "To Be Announced" entries for the next season when no future events are scheduled
5. **Maintains Continuity**: Ensures the site always displays meaningful content

### Event States

The system recognizes three event states:

- **Current Event**: The next upcoming event, or most recent if no future events exist
- **Past Events**: Events whose dates have passed (automatically archived)
- **TBA Events**: Placeholder events for future seasons marked with `status: "to-be-announced"`

### What This Means for Content Management

- **No more manual `is_current` flags**: The system ignores these and uses date-based logic instead
- **Automatic transitions**: Events move to past status without any file edits
- **Smart fallbacks**: If no future events exist, the system generates next season placeholders
- **Professional presentation**: Past events show "Event has concluded" notices; TBA events show appropriate messaging

### Technical Details

The automation is powered by:

- Custom Jekyll plugin with Liquid filters
- Date comparison logic that runs on every build
- Season detection (Spring/Autumn) for intelligent placeholder generation
- CSS styling for different event states

### Benefits

- **Zero maintenance**: Events automatically transition without manual updates
- **Always current**: Site never shows outdated "current" events
- **Professional appearance**: Appropriate messaging and link states for all event types
- **Future-proof**: Automatically handles upcoming seasons and scheduling gaps

## Alert System

⚠️ **Important**: Alert display and lifecycle management is **fully automated** based on publication and end dates. No manual intervention is required.

### How It Works

The website includes an intelligent alert system that automatically displays important notices, updates, and announcements on the homepage. The system:

1. **Date-Based Display**: Shows alerts only within their active date range
2. **Automatic Expiry**: Removes alerts when their end date passes
3. **Priority Sorting**: Orders alerts by priority level and publication date
4. **Type-Based Styling**: Applies appropriate colors and icons based on alert type
5. **Responsive Design**: Ensures alerts display well on all devices

### Alert Types

The system supports four alert types with distinct styling:

- **Info** (Blue): General information, updates, announcements
- **Success** (Green): Positive news, completions, achievements  
- **Warning** (Orange): Important notices, changes, upcoming deadlines
- **Error/Danger** (Red): Critical issues, cancellations, urgent matters

### Creating Alerts

Alerts are stored in the `_alerts/` collection and use standard Jekyll Markdown format:

```yaml
---
title: "Alert Title"
subtitle: "Optional subtitle"
published_date: YYYY-MM-DD
end_date: YYYY-MM-DD
type: "info"  # info, success, warning, error/danger
priority: 1   # Lower numbers = higher priority
---
Alert content in **Markdown** format.
```

### Alert Lifecycle

- **Automatic Display**: Alerts appear on homepage when `published_date` is reached
- **Automatic Removal**: Alerts disappear when `end_date` passes
- **No Manual Management**: System handles all timing automatically
- **Date Validation**: Only alerts with valid date ranges are shown

### Priority System

- **1-3**: Critical/urgent (errors, cancellations)
- **4-6**: Important notices (deadlines, changes)
- **7-9**: General information (updates, announcements)  
- **10+**: Low priority notices

Alerts are sorted by priority (lowest number first), then by publication date (newest first).

### Technical Implementation

The alert system is powered by:
- Custom Jekyll collection (`_alerts/`)
- Extended automation plugin with alert filtering functions
- CSS classes for each alert type with appropriate styling
- Font Awesome icons for visual clarity
- Responsive design for mobile compatibility

### Benefits

- **Always Current**: Only relevant alerts are displayed
- **Professional Presentation**: Consistent styling and appropriate urgency levels
- **Zero Maintenance**: Alerts automatically appear and disappear based on dates
- **Flexible Content**: Full Markdown support for rich content
- **Mobile Friendly**: Responsive design works on all devices

## Local Development

To run this site locally:

1. Install Ruby and Bundler
2. Clone this repository
3. Run `bundle install`
4. Run `bundle exec jekyll serve --baseurl=""` (note: empty baseurl for local development)
5. Visit `http://localhost:4000`

## GitHub Pages Deployment

This site is configured to deploy automatically to GitHub Pages via GitHub Actions using the `gh-pages` branch approach. The site is available at: <https://stpeg.org>

Configuration notes:

- `baseurl: ""` in `_config.yml` (empty for custom domain deployment)
- `url: "https://stpeg.org"` in `_config.yml` (custom domain)
- `CNAME` file contains the custom domain name
- GitHub Actions workflow builds to `gh-pages` branch automatically

## Structure

```text
├── _config.yml          # Jekyll configuration
├── _layouts/            # Page templates
├── _events/             # Event content (markdown)
├── _speakers/           # Speaker biographies (markdown)
├── assets/css/          # Stylesheets
├── host-pack/           # Host guidance pages
├── .github/workflows/   # GitHub Actions for deployment
└── *.md                 # Main pages
```

## Adding Content

### New Events

Create a new file in `_events/` with the following format:

```yaml
### New Events

Create a new file in `_events/` with the following format:

```yaml
---
title: "Event Title"
date: YYYY-MM-DD
time: "9:00 AM - 5:00 PM"
location: "Venue Name"
host_name: "Dr. Name"
host_hospital: "Hospital Name"
calendar_link: "link-to-calendar"
eventbrite_link: "link-to-eventbrite"
schedule:
  - time: "09:00-09:30"
    title: "Session Title"
    speaker: "Speaker Name"
    speaker_link: "/speakers/speaker-slug"
---
Event description in markdown...
```

**Note**: The `is_current` field is no longer needed. Events are automatically managed based on their date.

#### Steps

Follow these steps to add a new event that builds its own page and appears in the listings.

##### 1. Name the file (controls the URL)

In the `_events/` folder, create a new markdown file named like `spring-2026.md` or `autumn-2026.md`.
The URL will be `/events/<filename-without-extension>/` (e.g. `spring-2026.md` → `/events/spring-2026/`).
Changing the event date later will NOT change the URL.

##### 2. Start from the template

Open `_utils/event-template.md` and copy the YAML front‑matter and content skeleton into your new file.

##### 3. Fill out the YAML front‑matter

Required fields and guidance:

- `title`: A clear event title.
- `date`: In `YYYY-MM-DD` format. Convention: Spring = 4th Friday in April; Autumn = 2nd Friday in October.
- `time`: Either a range like `"14:30 - 21:00"` or `"2:30 PM - 9:00 PM"`. A single start time also works.
- `location`: Full venue details.
- `host_name`, `host_hospital`: Host info for the event.
- `eventbrite_link` (optional but recommended): Paste the Eventbrite link. In Eventbrite, open your event's draft list, click the three dots, and select "Copy link".
- `calendar_link`: Leave as `#` or omit. The site will auto‑generate an `.ics` link for the current event during the build.
- `schedule`: Add programme items. You can include optional `speaker_link` fields that point to speaker pages (e.g., `/speakers/jane-doe`).

**Automated fields** (no longer needed):
- ~~`is_current`~~: Events are automatically detected as current/past based on their date.

##### 4. Add the page content

Below the YAML, add a brief event description, highlights, and any notes attendees should know.

##### 5. Commit and push

Commit the new file to `main`. The site will build and:

- Automatically determine if the event is current or past based on its date.
- Feature the most appropriate event on `/events.html` (next upcoming, or most recent if none upcoming).
- Generate an `.ics` file for the current event at `/assets/ics/<filename>.ics` and link it automatically.
- Disable registration links for past events automatically.

##### 6. Optional: Creating placeholder events

For future seasons where details aren't yet known, create an event with:
```yaml
status: "to-be-announced"
```
This will display appropriate "TBA" messaging and styling.

##### 7. No maintenance required

Once events are created, the system will:
- Automatically move past events to the "Past Events" section
- Disable registration links when events conclude
- Generate next season placeholders as needed
- Always display the most relevant current event
```

#### Steps

Follow these steps to add a new event that builds its own page and appears in the listings.

##### 1. Name the file (controls the URL)

In the `_events/` folder, create a new markdown file named like `spring-2026.md` or `autumn-2026.md`.
The URL will be `/events/<filename-without-extension>/` (e.g. `spring-2026.md` → `/events/spring-2026/`).
Changing the event date later will NOT change the URL.

##### 2. Start from the template

Open `_utils/event-template.md` and copy the YAML front‑matter and content skeleton into your new file.

##### 3. Fill out the YAML front‑matter

Required fields and guidance:

- `title`: A clear event title.
- `date`: In `YYYY-MM-DD` format. Convention: Spring = 4th Friday in April; Autumn = 2nd Friday in October.
- `time`: Either a range like `"14:30 - 21:00"` or `"2:30 PM - 9:00 PM"`. A single start time also works.
- `location`: Full venue details.
- `host_name`, `host_hospital`: Host info for the event.
- `is_current`: Set to `true` (boolean, no quotes) for the upcoming event; set previous events to `false`. The site also accepts quoted strings, but booleans are recommended.
- `eventbrite_link` (optional but recommended): Paste the Eventbrite link. In Eventbrite, open your event’s draft list, click the three dots, and select “Copy link”.
- `calendar_link`: Leave as `#` or omit. The site will auto‑generate an `.ics` link for the current event during the build.
- `schedule`: Add programme items. You can include optional `speaker_link` fields that point to speaker pages (e.g., `/speakers/jane-doe`).

##### 4. Add the page content

Below the YAML, add a brief event description, highlights, and any notes attendees should know.

##### 5. Commit and push

Commit the new file to `main`. The site will build and:

- Publish the event at `/events/<filename>/`.
- Highlight the event on `/events.html` if `is_current: true`.
- Generate an `.ics` file for the current event at `/assets/ics/<filename>.ics` and link it automatically.

##### 6. Optional checks

- Ensure previous events have `is_current: false` so only one current event is highlighted.
- If you add new speakers, place their pages under `_speakers/` and reference them from the event `schedule` using `speaker_link`.

### New Speakers

Create a new file in `_speakers/` with:

```yaml
---
name: "Dr. Full Name"
title: "Professional Title"
hospital: "Hospital Name"
specialties:
  - "Specialty 1"
  - "Specialty 2"
---
Biography in markdown...
```

### New Alerts

Create a new file in `_alerts/` with:

```yaml
---
title: "Alert Title"
subtitle: "Optional subtitle"
published_date: YYYY-MM-DD  # When alert should start showing
end_date: YYYY-MM-DD        # When alert should stop showing
type: "info"                # Options: info, success, warning, error/danger
priority: 1                 # Lower numbers = higher priority
---
Alert content in **Markdown** format...
```

#### Alert Creation Steps

1. **Choose filename**: Use descriptive name with date (e.g., `meeting-update-2025-10-15.md`)
2. **Set dates carefully**: 
   - `published_date`: When alert should appear
   - `end_date`: When alert should disappear
3. **Choose appropriate type**:
   - `info`: General updates, announcements
   - `success`: Positive news, achievements  
   - `warning`: Important notices, deadlines
   - `error`/`danger`: Critical issues, cancellations
4. **Set priority**: Lower numbers show first (1 = highest priority)
5. **Write clear content**: Use Markdown for formatting

**Important**: Use the template in `_utils/alert-template.md` for detailed guidance and examples.

### Custom Ruby Gem

The `_plugins` folder contains a custom `_ics_generator.rb` which generates a `.ics` file for the active event and stores this in the `ics` folder. It adds the link to the event automatically

## Deployment

The site automatically deploys to GitHub Pages when changes are pushed to the main branch via GitHub Actions.

## Creating a New Event on EventBrite

Use EventBrite to manage registrations and tickets, then link that event from this site:

1. Create the event in EventBrite.
2. In the EventBrite events list (draft or published), click the three dots next to your event and choose “Copy link”.
3. In your `_events/<filename>.md` file, paste that URL into the `eventbrite_link` field in the YAML front‑matter.
4. Commit and push. On deploy, the EventBrite link (and the generated `.ics` link for the current event) will be available on the site.

## Adding a new committee minute

1. add a new date above the previous dates in `committee.md`
2. create a corresponding file in `_meeting_minutes`.  

## License

This website is maintained by STPEG for the paediatric endocrinology community in South East England.
