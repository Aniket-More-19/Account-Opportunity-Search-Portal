
# Account & Opportunity Search Portal

## Overview

A learning project built using Salesforce Lightning Web Components (LWC) and a Salesforce Lightning Web Runtime (LWR) site. It allows users to search Accounts by partial name and view account details alongside their related Opportunities.

An Apex controller uses SOQL queries to retrieve Account and Opportunity data. A parent component manages search requests and passes the results to child components for display.

## Features

- Search Accounts using partial name matching.
- Display Account details and related Opportunities.
- Retrieve Salesforce records using Apex and SOQL.
- Implement parent-child component communication.

## Tech Stack

- Apex
- Lightning Web Components (LWC)
- SOQL
- Salesforce LWR Site

## Security Notice

**This project is for learning purposes only and is not production-ready.**

The current implementation has a potential data-exposure vulnerability because it displays internal Account and related Opportunity details. Proper sharing enforcement and object- and field-level security checks are necessary before production use.

The live site URL is intentionally not public to avoid exposing internal business data.

## Implementation


https://github.com/user-attachments/assets/aed6bc3f-95da-4062-b5fb-8d059b0eac51


