# SQUARE — How to Install and Use the App

A short guide to set up the database, place the PHP APIs on your local server, and run the SQUARE app on Windows.

## Prerequisites

- A local web server (offline) such as XAMPP, AMPPS, or similar — recommended to install on Local Disk C (e.g., `C:\\xampp`).
- Project files: `sqlconnect` folder, `square.sql` file, and the `SQUARE` app folder (contains `SQUARE.exe`).

## Setup Steps

1. Open your web server Control Panel (XAMPP/AMPPS/etc.) and start Apache and MySQL.
2. Open phpMyAdmin: http://localhost/phpmyadmin
3. Create a new database:
	- Click the "New" button on the left panel.
	- Name the database `square` and create it.
4. Import the database schema and data:
	- Locate `square.sql` in your project folder.
	- In phpMyAdmin, open the "SQL" tab, paste the entire contents of `square.sql`, then click "Go".
	  - Alternative: use the "Import" tab, select the `square.sql` file, and run the import.
5. Deploy the API/PHP to the web server (htdocs):
	- From the project folder, copy the `sqlconnect` folder.
	- Paste it into your server's `htdocs`, e.g., for XAMPP: `C:\\xampp\\htdocs\\sqlconnect`.
6. Run the application:
	- Open the `SQUARE` folder and run `SQUARE.exe`.
	- If Windows SmartScreen shows a warning, choose "More info" -> "Run anyway".
7. In-app usage:
	- It's recommended to Register first.
	- Use a mouse for a better gameplay experience.

## Quick Verification (Optional)

- Check the local server/API by opening: http://localhost/sqlconnect/webtest.php
  - If the page opens without errors, the `sqlconnect` folder is placed correctly.

## Notes & Troubleshooting

- Make sure Apache (port 80) and MySQL (port 3306) are not conflicting with other apps.
- If http://localhost/phpmyadmin won't load, verify Apache & MySQL are running.
- If importing `square.sql` fails, ensure the `square` database exists before running the query/import.
- If APIs are inaccessible (404/500), re-check that `sqlconnect` is inside `htdocs`.

Enjoy the game :)
