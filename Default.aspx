<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Project.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }

        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #007bff;
            color: #fff;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .card-footer {
            background-color: #f8f9fa;
        }

        .form-group a {
            color: #007bff;
        }
    </style>
</head>
<body>
    <form runat="server">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="text-center">Login</h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtUsername" CssClass="font-weight-bold">Username:</asp:Label>
                                <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvName" ControlToValidate="txtUsername" ErrorMessage="Enter Username" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="font-weight-bold">Password:</asp:Label>
                                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvPass" ControlToValidate="txtPassword" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:Button runat="server" ID="btnLogin" Text="Login" CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click" />
                            </div>
                            <div>
                                <asp:Label id="lblStatus" ForeColor="Red" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="card-footer text-center">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and Popper.js (required for Bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
