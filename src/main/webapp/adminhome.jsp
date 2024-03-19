<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        h1 {
            text-align: center;
            margin-top: 50px;
        }

        .admin-tasks {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .admin-tasks h2 {
            margin-bottom: 20px;
        }

        .admin-tasks ul {
            list-style: none;
            padding: 0;
        }

        .admin-tasks li {
            margin-bottom: 10px;
        }

        .admin-tasks a {
            display: block;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
        }

        .admin-tasks a:hover {
            background-color: #0056b3;
        }

        #logout-btn {
            display: block;
            margin-top: 20px;
            text-align: center;
        }

	    .logout-btn {
	        display: inline-block;
	        padding: 10px 20px;
	        background-color: #f44336;
	        color: white;
	        text-decoration: none;
	        border: none;
	        border-radius: 5px;
	        cursor: pointer;
	        transition: background-color 0.3s;
	    }
	
	    .logout-btn:hover {
	        background-color: #d32f2f;
	    }
    </style>
</head>
<body>
    <h1>Welcome to Admin Dashboard</h1>
    <div class="admin-tasks">
        <h2>Admin Tasks</h2>
        <ul>
            <li><a href="manage_users.jsp">Manage Users</a></li>
            <li><a href="view_appointments.jsp">View Appointments</a></li>
            <!-- Add more links/buttons for other admin tasks as needed -->
        </ul>
    </div>
	<div id="logout-btn">
	    <a href="login.jsp" class="logout-btn">Logout</a>
	</div>
</body>
</html>
