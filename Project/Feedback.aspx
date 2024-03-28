<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="Project.Feedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            margin: 30px; /* Adjust the margin as needed */
            max-width: 500px; /* Set the maximum width of the form */
        }

        .form-container label {
            display: block;
            margin-bottom: 5px;
        }

        .form-container input[type="text"],
        .form-container textarea {
            width: 100%;
            box-sizing: border-box;
            margin-bottom: 10px;
        }
       .submit-button {
            margin-top: 10px; 
        }
    </style>
</head>
<body>
    <form runat="server">
        <div class="sidebar">
            <div class="logo_details">
                <i class="bx bxl-audible icon"></i>
                <div class="logo_name">Menu</div>
                <i class="bx bx-menu" id="btn"></i>
            </div>
            <ul class="nav-list" style="margin-left:-30px;">
                <li>
                    <a href="Dashboard.aspx">
                        <i class="bx bx-book"></i>
                        <span class="link_name">Home</span>
                    </a>
                    <span class="tooltip">Home</span>
                </li>
                <li>
                    <a href="Books.aspx">
                        <i class="bx bx-book-reader"></i>
                        <span class="link_name">Book</span>
                    </a>
                    <span class="tooltip">Book</span>
                </li>
               <li>
                    <a href="Feedback.aspx">
                        <i class="bx bx-comment"></i>
                        <span class="link_name">Feedback</span>
                    </a>
                    <span class="tooltip">Feedback</span>
                </li>
                <li class="profile">
                    <div class="profile_details">
                        <asp:Image ID="profileImage" runat="server" ImageUrl="pp.jpg" AlternateText="profile image" />
                        <div class="profile_content">
                            <div class="designation"><asp:Literal ID="lblUsername" runat="server" Text="Admin"/></div>
                        </div>
                    </div>
                    <i class="bx bx-log-out" id="log_out" runat="server" />
                </li>
            </ul>
        </div>
        <section class="home-section">
            <div class="text">Feedback</div>
                <div class="form-container">
                <label for="txtUsername">Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="Username is required" CssClass="error-message"></asp:RequiredFieldValidator>

                <label for="txtContactNumber">Contact Number:</label>
                <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvContactNumber" runat="server" ControlToValidate="txtContactNumber" Display="Dynamic" ErrorMessage="Contact Number is required" CssClass="error-message"></asp:RequiredFieldValidator>

                <label for="txtComment">Comment:</label>
                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvComment" runat="server" ControlToValidate="txtComment" Display="Dynamic" ErrorMessage="Comment is required" CssClass="error-message"></asp:RequiredFieldValidator>

                <div class="submit-button">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
                </div>
            </div>
        </section>
         </form>
    <script src="script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua/CJ7OBbbZXBwFt2TKXy5s4SPARx3S6oBlF7pPbzq4C+LBefzeD0tZwD" crossorigin="anonymous"></script>
</body>
</html>
