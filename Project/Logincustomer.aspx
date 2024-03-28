<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logincustomer.aspx.cs" Inherits="Project.Logincustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous" />
    <style>
        body {
            background-image: url('Image/library2.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            height: 100vh;
            margin: 0;
        }

        .welcome-container,
        .login-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            margin: 20px;
        }

        .login-buttons {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }

        .btn-login {
            margin-right: 5px;
        }

        .btn-register {
            background-color: red;
            color: white;
        }
    </style>
</head>
<body>
    <div class="welcome-container">
        <h1>Online Book</h1>
    </div>

    <div class="container-fluid d-flex justify-content-center align-items-center flex-column">
        <form id="form1" runat="server" class="login-container">
            <h2 class="mb-4">User Login</h2>
            <div class="mb-3">
                <asp:Label runat="server" for="username" class="form-label">Username</asp:Label>
                <asp:TextBox runat="server" class="form-control" id="Username" name="username" required=""></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" ID="rfvName" ControlToValidate="username" ErrorMessage="Enter Username" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <asp:Label runat="server" for="password" class="form-label">Password</asp:Label>
                <asp:TextBox runat="server" class="form-control" id="Password" name="password" required=""></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" ID="rfvPass" ControlToValidate="password" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
             <asp:Label id="lblStatus" ForeColor="Red" runat="server"></asp:Label>
            <div class="login-buttons">
                <asp:Button runat="server"  Text="Login" class="btn btn-primary btn-login" onclick="btnLogin_Click" />

            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua/CJ7OBbbZXBwFt2TKXy5s4SPARx3S6oBlF7pPbzq4C+LBefzeD0tZwD" crossorigin="anonymous"></script>
</body>
</html>
