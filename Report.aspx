<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Project.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <form runat="server">
        <div class="sidebar">
            <div class="logo_details">
                <i class="bx bxl-audible icon"></i>
                <div class="logo_name">Menu</div>
                <i class="bx bx-menu" id="btn"></i>
            </div>
            <ul class="nav-list">
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
                <li>
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
            <div class="text">Report</div>
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
