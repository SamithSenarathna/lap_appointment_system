<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pay Bill</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
            color: #333;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }
        input[type="text"],
        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .back-btn {
            display: block;
            width: 100px;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #f44336;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s;
        }

        .back-btn:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <h1>Pay Bill</h1>
    <form id="paymentForm" action="PayBillServlet" method="post">
        <label for="patientName">Patient Name:</label>
        <input type="text" id="patientName" name="patientName" required>
        
        <label for="testName">Test Name:</label>
        <select id="testName" name="testName" required>
            <option value="">Select Test</option>
            <option value="Blood Test">Blood Test</option>
            <option value="Urinalysis">Urinalysis</option>
            <option value="X-Ray">X-Ray</option>
            <!-- Add more test options as needed -->
        </select>
        
        <label for="amount">Amount:</label>
        <input type="number" id="amount" name="amount" min="0" step="0.01" required readonly>
        
        <label for="billingDate">Billing Date:</label>
        <input type="date" id="billingDate" name="billingDate" required>
        
        <label for="paymentMethod">Payment Method:</label>
        <select id="paymentMethod" name="paymentMethod" required>
            <option value="">Select Payment Method</option>
            <option value="Credit Card">Credit Card</option>
            <option value="Debit Card">Debit Card</option>
            <option value="Cash">Cash</option>
            <!-- Add more payment options as needed -->
        </select>
        
        <input type="submit" value="Pay">
    </form>
    <a href="home.jsp" class="back-btn">Back</a>
               
    <script>
        document.getElementById('testName').addEventListener('change', function() {
            var testName = this.value;
            var amountInput = document.getElementById('amount');
            switch (testName) {
                case 'Blood Test':
                    amountInput.value = '2500';
                    break;
                case 'Urinalysis':
                    amountInput.value = '2000';
                    break;
                case 'X-Ray':
                    amountInput.value = '5000';
                    break;
                default:
                    amountInput.value = '';
            }
        });
    </script>
</body>
</html>
