---
name: content-security-policy-bypass-techniques
description: This skill teaches how to bypass Content Security Policy (CSP) on a web application, allowing for injecting malicious scripts, using techniques such as 'style' and 'script' meta tags, JavaScript injection via HTML forms or inline event handlers. It's essential to understand these techniques when testing the security posture of a web application.
category: security
subcategory: web-app-security
tools_needed: Burp Suite, Chrome DevTools

# Content Security Policy Bypass Techniques

## Purpose
Content Security Policy (CSP) is designed to prevent malicious scripts from being executed within a web application. However, CSP can be bypassed using various techniques such as manipulating meta tags, JavaScript injection, or exploiting browser vulnerabilities.

## Prerequisites
- Basic knowledge of HTML, CSS, and JavaScript.
- Familiarity with Burp Suite for manual testing.

## Procedure

### Step 1: Manipulating Meta Tags to Bypass CSP

Open Chrome DevTools and inspect the `meta` tags in the application's header. Look for a meta tag that defines the `style-src` directive, which can be used to inject malicious scripts.

```bash
# In Burp Suite, intercept the request to the application's login page
# Replace 'http://example.com/login' with the actual URL of the login page

# Open Chrome DevTools and inspect the meta tags in the header
// chrome://extensions/
# Enable Developer Tools
# Switch to the Elements tab
```

Look for a meta tag that defines the `style-src` directive, such as:

```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'unsafe-inline'">
```

Modify the meta tag to include a new source value, such as `'example.com'`, which is not defined in the CSP policy.

```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; style-src 'unsafe-inline' example.com">
```

### Step 2: JavaScript Injection via HTML Forms

Open Burp Suite and intercept a request to the application's login form. Look for an input field that can be used to inject malicious JavaScript code.

```bash
# In Burp Suite, intercept the request to the application's login page
# Replace 'http://example.com/login' with the actual URL of the login page

# Open Burp Suite and switch to the Inspector tab
# Select the form element in the inspector
```

Use Burp's `Manipulate Request Body` feature to inject malicious JavaScript code into the input field.

```bash
# In Burp Suite, manipulate the request body to include malicious JavaScript code
# Replace 'http://example.com/login' with the actual URL of the login page
```

### Expected Results

After bypassing CSP using these techniques, the application should execute malicious scripts or allow unauthorized access.

### Common Pitfalls

- Manipulating meta tags can cause unintended side effects, such as breaking layout or functionality in the application.
- JavaScript injection via HTML forms can be detected by modern web applications using Content Security Policy (CSP) directives.

## References
- OWASP: Content Security Policy (CSP)
- Mozilla Developer Network: Content Security Policy