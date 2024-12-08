
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<style>
    /* General reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        font-family: 'Poppins', sans-serif;
        
    }

    .form-container {
        background: #ffffff;
        padding: 25px 30px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        width: 450px;
        animation: fadeIn 1.2s ease;
        text-align: left;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    h3 {
        margin-bottom: 20px;
        font-size: 1.8em;
        color: #333;
        text-align: center;
    }

    table {
        width: 100%;
        margin-top: 10px;
    }

    td {
        padding: 10px 5px;
    }

    label {
        display: block;
        font-weight: 600;
        color: #555;
        font-size: 0.9em;
    }

    input, textarea {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 14px;
        background-color: #f9f9f9;
        transition: border-color 0.3s, background-color 0.3s;
    }

    input:focus, textarea:focus {
        border-color: #2575fc;
        background-color: #ffffff;
        outline: none;
    }

    textarea {
        resize: none;
        height: 100px;
    }

    .button-container {
        text-align: center;
        margin-top: 20px;
    }

    input[type="submit"], input[type="reset"] {
        padding: 12px 25px;
        border: none;
        border-radius: 8px;
        color: #ffffff;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
    }

    input[type="submit"] {
        background: linear-gradient(135deg, #6a11cb, #2575fc);
    }

    input[type="reset"] {
        background: #f44336;
    }

    input[type="submit"]:hover {
        background: linear-gradient(135deg, #5b0ecb, #1f65fc);
        transform: scale(1.05);
    }

    input[type="reset"]:hover {
        background: #e53935;
        transform: scale(1.05);
    }

    span#error {
        color: red;
        font-size: 12px;
        margin-top: 5px;
        display: block;
    }

    /* Responsive design */
    @media (max-width: 500px) {
        .form-container {
            width: 100%;
            padding: 20px;
        }

        h3 {
            font-size: 1.5em;
        }
    }
</style>
</head>
<body>
    <div class="form-container">
        <h3><u>Contact Us</u></h3>
        <form method="post" action="sendemail">
            <table>
                <tr>
                    <td><label for="name">Student Name</label></td>
                    <td><input type="text" id="name" name="name" required /></td>
                </tr>
                <tr>
                    <td><label for="email">Send Email To</label></td>
                    <td>
                        <input type="email" id="email" name="email" required " />
                          <span id="emailError" style="color: red;"></span>
                    </td>
                </tr>
                <tr>
                    <td><label for="subject">Subject</label></td>
                    <td><input type="text" id="subject" name="subject" required /></td>
                </tr>
                <tr>
                    <td><label for="message">Message</label></td>
                    <td><textarea name="message" id="message" required></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Send" />
                        <input type="reset" value="Clear" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
    
</body>
</html>