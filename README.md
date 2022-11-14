# VSM Students App

Mobile App for Students of Vidyadaan

## Goal:

- Automate the Accounts process, eventually all student processes as VSM grows.
- Enable better visibility into the Student-KP interaction so that the Management Committee can track
- Enable transparancy in the cash flow through the system
- Live data dashboard for the management
- Minimize the data hops in the system
- Ensure very high scalability

## Timeline

- Mid February - Alpha trial with 10 students
- April 2023 - All VSM students using the app to track accounts
- July 2023 - Fix any issues noticed and have a stable system
- September 2023 - Tally Integration

## Data Flow

- Students initiate all transactions
- KP gets an email with two buttons for Approve / Reject
- The request moves through a chain of approvals
- The Account team sees final approved request in a dashboard. Clicks "Complete" when the money is transfered.
- Anyone in the chain can send request back to the previous entity

## Constraints

- The system should be in sync with Tally. VSM should have one set of numbers. This is initially ensured by the accounts team when they click Complete, only after adding entry to Tally.
-

## Requirements

Donor - Student mapping
Donor - expense head mapping
Donation Portal - Tally

## Technology

This mobile app is implemented in Flutter.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
