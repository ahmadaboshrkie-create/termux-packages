# Quick Start: Playwright browser_wait_for

## Installation & Setup

1. Ensure Playwright is installed and configured
2. Use the test page: `playwright-browser-wait-for-test.html`

## Quick Reference

### Wait for text to appear
```javascript
await browser_wait_for({ text: "Success message" });
```

### Wait for text to disappear
```javascript
await browser_wait_for({ textGone: "Loading..." });
```

### Wait for specific time (seconds)
```javascript
await browser_wait_for({ time: 3 });
```

## Common Patterns

### Form Submission
```javascript
// Submit form
await browser_click({ element: "Submit", ref: "..." });

// Wait for success message
await browser_wait_for({ text: "Saved successfully" });
```

### Loading States
```javascript
// Trigger action
await browser_click({ element: "Refresh", ref: "..." });

// Wait for loader to appear
await browser_wait_for({ text: "Loading..." });

// Wait for loader to disappear
await browser_wait_for({ textGone: "Loading..." });

// Confirm data loaded
await browser_wait_for({ text: "Data loaded" });
```

### Page Navigation
```javascript
// Click next page
await browser_click({ element: "Next", ref: "..." });

// Wait for old page indicator to disappear
await browser_wait_for({ textGone: "Page 1" });

// Wait for new page indicator
await browser_wait_for({ text: "Page 2" });
```

## Testing

Run the test suite:
```bash
python3 test-browser-wait-for.py
```

## Full Documentation

See `PLAYWRIGHT_WAIT_FOR_GUIDE.md` for complete documentation.
