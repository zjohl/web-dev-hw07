# Task Tracker: Part 2
## Zamir Johl



### Managers
When a user is created, they can select a manager. Only admins can edit or delete users, but so an admin would have to change the manager for a user if they made a mistake. This prevents users from maliciously deleting other user's accounts.

Only a user's manager can assign them a task. If they don't have a manager they can't be assigned tasks. Managers are also mandatory (on user creation). This means that the normal way to start up this app is to create a manager-less admin user who can manage the rest of the users.

Mangers have access to a task report page that will show them the tasks assigned to their underlings. A manager's profile page will show their own manager and a list of their underlings.

### Detailed Time Spent
Users can "clock in"  and "clock out" by hitting the "start working" and "stop working" buttons on the task page. As one would expect, they can't start working once they've clocked in, and vice versa. The user's timecard history is listed below the buttons. Users can delete an individual entry but they can't edit an entry to prevent them from falsifying their timecard.

Users can also manually enter a date and time they were working on the current task. If they make a mistake, they can enter the correct time and delete the previous entry.