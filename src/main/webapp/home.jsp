<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Patient</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #007bff;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        nav {
            background-color: #f4f4f4;
            padding: 10px 0;
            text-align: center;
        }
        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin-right: 20px;
        }
        main {
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        .button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome Patient</h1>
    </header>
        <nav>
        <ul>
            <li><a href="login.jsp">Logout</a></li>
        </ul>
    </nav>
    <main>
        <div class="container">
            <h2>Available Actions</h2>
            <p>Welcome to the Lab Appointment System. You can perform the following actions:</p>
            <a href="make_appointment.jsp" class="button">Make Appointments</a>
            <a href="download_reports.jsp" class="button">Download Lab Reports</a>
            <a href="pay_bill.jsp" class="button">Pay Bill</a>
        </div>
    </main>
</body>
</html>
