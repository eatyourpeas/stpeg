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

This site is configured to deploy automatically to GitHub Pages via GitHub Actions. The site is available at: <https://eatyourpeas.github.io/stpeg>

Configuration notes:

- `baseurl: "/stpeg"` in `_config.yml` (matches repository name)
- `url: "https://eatyourpeas.github.io"` in `_config.yml` (GitHub Pages domain)

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

## Deployment

The site automatically deploys to GitHub Pages when changes are pushed to the main branch via GitHub Actions.

## License

This website is maintained by STPEG for the paediatric endocrinology community in South East England.
