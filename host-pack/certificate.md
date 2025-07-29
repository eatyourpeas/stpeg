---
layout: default
title: Certificate - Host Pack
---

# Certificate of Attendance

<div class="certificate-container">
    <div class="certificate">
        <div class="certificate-header">
            <h1>CERTIFICATE OF ATTENDANCE</h1>
            <div class="certificate-logo">
                <!-- Logo placeholder -->
                <div class="logo-placeholder">STPEG</div>
            </div>
        </div>
        
        <div class="certificate-body">
            <p class="certificate-text">This is to certify that</p>
            
            <div class="name-field">
                <input type="text" id="delegate-name" placeholder="Enter delegate name" class="name-input">
            </div>
            
            <p class="certificate-text">attended the</p>
            
            <h2 class="event-title">STPEG Conference</h2>
            
            <p class="event-date">April 15, 2025</p>
            <p class="event-location">King's College Hospital, London</p>
            
            <div class="certificate-footer">
                <div class="signature-section">
                    <div class="signature-line"></div>
                    <p class="signature-label">Event Host</p>
                </div>
                
                <div class="date-section">
                    <div class="date-line"></div>
                    <p class="date-label">Date</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="certificate-controls">
    <button onclick="printCertificate()" class="btn btn-primary">Print Certificate</button>
    <button onclick="generatePDF()" class="btn btn-secondary">Generate PDF</button>
</div>

<script>
function printCertificate() {
    const name = document.getElementById('delegate-name').value;
    if (!name.trim()) {
        alert('Please enter the delegate name before printing.');
        return;
    }
    window.print();
}

function generatePDF() {
    const name = document.getElementById('delegate-name').value;
    if (!name.trim()) {
        alert('Please enter the delegate name before generating PDF.');
        return;
    }
    // PDF generation would be implemented here
    alert('PDF generation feature would be implemented with a PDF library.');
}
</script>

## Instructions for Hosts

1. **Enter the delegate name** in the text field above
2. **Print directly** using the Print Certificate button
3. **Generate PDF** for digital distribution (requires additional setup)

## Customization Notes

- The certificate is pre-populated with the current event date
- The event location updates automatically based on the current event
- Hosts can modify the certificate template by editing this page
- For bulk generation, consider using a spreadsheet with mail merge functionality

## Print Settings

For best results when printing:
- Use A4 or Letter size paper
- Select landscape orientation
- Use high-quality print settings
- Consider using heavier paper (cardstock) for a professional look
