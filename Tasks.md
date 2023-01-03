# Planned Tasks

## UI Forms

1. Finance: Form for adding budget - 5 budget headings, and number entries. Submit button. A button to include files. A button to include snapshots. Some way to display attached files and snapshots - A list of file names. + Submit button
2. Finance: Form for adding expenditure report - Dropdown for category. A text field for title, Text box for details. A button to include files. A button to include snapshots. Some way to display attached files and snapshots - A list of file names. + Submit button
3. Form for adding advance request - Dropdown for category. A text field for title, Text box for details. A button to include files. A button to include snapshots. Some way to display attached files and snapshots - A list of file names. + Submit button
4. Form for adding Goal description - A form for adding goals for each category. Academic, Learning, Personal, Social: List of widgets - each widget with a title, description and target number
5. Form for adding Goald update: Each goal in the goals page is a button. Click that to show the goal update page. Student can add what he did today for that goal. Title, Description, Time spent, attach file or snapshot. Submit button.
6. Form for adding Academic and Ahawal update: 7 questions - one button for each question. one column. click on the question to give the details in a text box. Submit button.

7. Social media for student interaction.

---

There are two APIs exported from the cloud:
- https://api.vsm.svcx.org - REST
- wss://websocket.vsm.svcx.org - WebSocket

The mobile app should use the WebSocket for all communication, unless there is a reason that demands a REST Api.

When you invoke the REST API, the actual method invoked will depend upon the path: https://api.vsm.svcx.org/event, etc

When you invoke the WebSocket API, the actual method invoked will depend on the field `action` in the payload.

List down the required APIs required, with their name/action.
