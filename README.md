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
---
title: "Event Title"
date: YYYY-MM-DD
time: "9:00 AM - 5:00 PM"
location: "Venue Name"
host_name: "Dr. Name"
host_hospital: "Hospital Name"
is_current: true/false
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
