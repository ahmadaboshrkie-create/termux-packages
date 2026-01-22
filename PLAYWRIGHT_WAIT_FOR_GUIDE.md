# Playwright browser_wait_for Guide

## Overview

The `browser_wait_for` tool in Playwright allows you to wait for specific conditions before proceeding with your automation tasks. This is essential for handling dynamic content, asynchronous operations, and ensuring elements are in the expected state.

## Function Signature

```
browser_wait_for(text, textGone, time)
```

## Parameters

### text (optional)
- **Type:** string
- **Description:** Wait for this text to appear on the page
- **Use case:** When you need to wait for content to load or appear

### textGone (optional)
- **Type:** string
- **Description:** Wait for this text to disappear from the page
- **Use case:** When you need to wait for loading messages to disappear or content to be removed

### time (optional)
- **Type:** number
- **Description:** Wait for a specific number of seconds
- **Use case:** When you need a fixed delay between operations

## Usage Examples

### Example 1: Wait for Text to Appear

```javascript
// Wait for success message to appear after form submission
await browser_wait_for({ text: "Content loaded successfully!" });
```

**Scenario:** After triggering an action that loads content asynchronously, wait for a specific message to confirm the operation completed.

### Example 2: Wait for Text to Disappear

```javascript
// Wait for loading indicator to disappear
await browser_wait_for({ textGone: "Loading..." });
```

**Scenario:** Wait for a loading spinner or message to disappear before proceeding with the next action.

### Example 3: Wait for a Fixed Time

```javascript
// Wait for 5 seconds
await browser_wait_for({ time: 5 });
```

**Scenario:** Add a fixed delay when you know the operation takes a specific amount of time.

### Example 4: Combined Workflow

```javascript
// 1. Click a button that triggers content loading
await browser_click({ element: "Load Content button", ref: "[...]" });

// 2. Wait for loading message to appear
await browser_wait_for({ text: "Loading content..." });

// 3. Wait for loading message to disappear
await browser_wait_for({ textGone: "Loading content..." });

// 4. Wait for success message
await browser_wait_for({ text: "Content loaded successfully!" });
```

## Best Practices

### 1. Prefer Text-Based Waits Over Time-Based Waits
```javascript
// ❌ Bad: Fixed time wait might be too short or unnecessarily long
await browser_wait_for({ time: 10 });

// ✅ Good: Wait for actual condition
await browser_wait_for({ text: "Data loaded" });
```

### 2. Wait for Content Removal
```javascript
// When dealing with loading states
await browser_click({ element: "Submit", ref: "[...]" });
await browser_wait_for({ text: "Submitting..." }); // Confirm loading started
await browser_wait_for({ textGone: "Submitting..." }); // Wait for completion
```

### 3. Sequence Multiple Waits for Complex Scenarios
```javascript
// Multi-step process
await browser_wait_for({ text: "Step 1 complete" });
await browser_wait_for({ text: "Step 2 complete" });
await browser_wait_for({ text: "All steps finished" });
```

### 4. Use Appropriate Wait Times
```javascript
// Short waits for animations (1-2 seconds)
await browser_wait_for({ time: 1 });

// Medium waits for API calls (3-5 seconds)
await browser_wait_for({ time: 3 });

// Longer waits only when necessary (5-10 seconds)
await browser_wait_for({ time: 10 });
```

## Common Use Cases

### 1. Form Submission
```javascript
await browser_fill_form({ fields: [...] });
await browser_click({ element: "Submit", ref: "[...]" });
await browser_wait_for({ text: "Form submitted successfully" });
```

### 2. Dynamic Content Loading
```javascript
await browser_click({ element: "Load More", ref: "[...]" });
await browser_wait_for({ text: "Showing 50 items" });
```

### 3. Page Transitions
```javascript
await browser_click({ element: "Next Page", ref: "[...]" });
await browser_wait_for({ textGone: "Page 1" });
await browser_wait_for({ text: "Page 2" });
```

### 4. AJAX Operations
```javascript
await browser_click({ element: "Refresh Data", ref: "[...]" });
await browser_wait_for({ text: "Refreshing..." });
await browser_wait_for({ textGone: "Refreshing..." });
await browser_wait_for({ text: "Data updated" });
```

## Testing the Functionality

Use the provided test HTML file (`playwright-browser-wait-for-test.html`) to test various wait scenarios:

1. **Open the test page:**
   ```javascript
   await browser_navigate({ url: "file:///path/to/playwright-browser-wait-for-test.html" });
   ```

2. **Test automatic content appearance:**
   ```javascript
   // Wait for auto-loaded content (appears after 3 seconds)
   await browser_wait_for({ text: "This content appeared automatically" });
   ```

3. **Test button-triggered content:**
   ```javascript
   await browser_click({ element: "Show message button", ref: "[...]" });
   await browser_wait_for({ text: "Content loaded successfully!" });
   ```

4. **Test content disappearance:**
   ```javascript
   await browser_click({ element: "Hide message button", ref: "[...]" });
   await browser_wait_for({ text: "This message will disappear" });
   await browser_wait_for({ textGone: "This message will disappear" });
   ```

## Troubleshooting

### Issue: Wait times out
**Solution:** Increase wait time or verify the text string matches exactly

### Issue: Text never appears
**Solution:** 
- Check for typos in the text parameter
- Verify the text is visible in the DOM
- Consider partial text matches if the full text is dynamic

### Issue: Page loads but wait doesn't detect text
**Solution:**
- Ensure text is rendered in the visible viewport
- Check if text is inside an iframe
- Verify JavaScript has executed to render the content

## Notes

- The `browser_wait_for` tool is non-blocking and works with Playwright's async operations
- You can only specify one parameter at a time (text, textGone, or time)
- Text matching is case-sensitive
- The tool waits for visible text in the page content
