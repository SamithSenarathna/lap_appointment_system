<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin-top: 50px;
        }

        form {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        input[type="file"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        #back-btn {
            text-align: center;
            margin-top: 20px;
        }

        .back-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #f44336; /* Changed button color */
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .back-btn:hover {
            background-color: #d32f2f; /* Changed hover color */
        }
    </style>
</head>
<body>
    <h1>Add Report</h1>
    <form action="AddReportServlet" method="post" enctype="multipart/form-data">
		<label for="userId">User ID:</label>
		<input type="number" id="userId" name="userId" required><br><br>
        
        <label for="patientName">Patient Name:</label>
        <input type="text" id="patientName" name="patientName" required><br><br>
        
        <label for="reportFile">Upload Report:</label>
        <input type="file" id="reportFile" name="reportFile" accept=".pdf" required><br><br>
        
        <input type="submit" value="Submit">
    </form>
    <div id="back-btn">
	    <a href="dochome.jsp" class="back-btn">back</a>
	</div>
</body>
</html>
