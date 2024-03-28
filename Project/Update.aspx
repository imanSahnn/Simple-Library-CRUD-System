<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="Project.Update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .welcome-message {
                            font-size: 24px; 
                            font-weight: bold;
                            color: #333; 
                            margin-top: 50px; 
                            margin-inline-start:600px;
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
                    <a href="Admin.aspx">
                        <i class="bx bx-book"></i>
                        <span class="link_name">Dashboard</span>
                    </a>
                    <span class="tooltip">Dashboard</span>
                </li>
                <li>
                    <a href="View.aspx">
                        <i class="bx bx-book-reader"></i>
                        <span class="link_name">View</span>
                    </a>
                    <span class="tooltip">View</span>
                </li>
                <li>
                    <a href="Add.aspx">
                        <i class="bx bx-book-add"></i>
                        <span class="link_name">Add</span>
                    </a>
                    <span class="tooltip">Add</span>
                </li>
                <li>
                    <a href="Report.aspx">
                        <i class="bx bx-printer"></i>
                        <span class="link_name">Report</span>
                    </a>
                    <span class="tooltip">Report</span>
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
            <div class="text">Update Book</div>
            <div class="container mt-5" style="margin-right: 50px;">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="txtTitle" class="col-form-label">Title:</label>
                        <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control" placeholder="Enter Title"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtAuthor" class="col-form-label">Author:</label>
                        <asp:TextBox runat="server" ID="txtAuthor" CssClass="form-control" placeholder="Enter Author"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtGenre" class="col-form-label">Genre:</label>
                        <asp:TextBox runat="server" ID="txtGenre" CssClass="form-control" placeholder="Enter Genre"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtPublicationYear" class="col-form-label">Publication Year:</label>
                        <asp:TextBox runat="server" ID="txtPublicationYear" CssClass="form-control" placeholder="Enter Publication Year"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtISBN" class="col-form-label">ISBN:</label>
                        <asp:TextBox runat="server" ID="txtISBN" CssClass="form-control" placeholder="Enter ISBN"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtQuantity" class="col-form-label">Quantity:</label>
                        <asp:TextBox runat="server" ID="txtQuantity" CssClass="form-control" placeholder="Enter Quantity"></asp:TextBox>
                    </div>
                    <div class="text-center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary ml-2" OnClick="btnCancel_Click" />
                    </div>
                    <asp:Label runat="server" ID="lblStatus" CssClass="text-danger mt-3"></asp:Label>
                </div>
            </div>
        </section>
    </form>

    <script>
        document.getElementById("<%= log_out.ClientID %>").addEventListener("click", function () {
            window.location.href = "Default.aspx";
        });
    </script>
    <script src="script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua/CJ7OBbbZXBwFt2TKXy5s4SPARx3S6oBlF7pPbzq4C+LBefzeD0tZwD" crossorigin="anonymous"></script>
</body>
</html>

