<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Project.Dashboard" %>

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
                    <a href="Dashboard.aspx">
                        <i class="bx bx-grid-alt"></i>
                        <span class="link_name">Home</span>
                    </a>
                    <span class="tooltip">Home</span>
                </li>
                <li>
                    <a href="Books.aspx">
                        <i class="bx bx-home-alt-2"></i>
                        <span class="link_name">Book</span>
                    </a>
                    <span class="tooltip">Book</span>
                </li>
                
                <li class="profile">
                    <div class="profile_details">
                        <asp:Image ID="profileImage" runat="server" ImageUrl="pp.jpg" AlternateText="profile image" />
                        <div class="profile_content">
                            <div class="designation"><asp:Literal ID="lblUsername" runat="server"/></div>
                        </div>
                    </div>
                    <i class="bx bx-log-out" id="log_out" runat="server" />
                </li>
            </ul>
        </div>
        <section class="home-section">
            <div class="text">HomePage</div>
            <h2 style="text-align:center">Welcome to Online Book Repository</h2>
            <div style="text-align:center">   
                Welcome to Book Repository Online! Dive into a world of endless stories, knowledge, and adventure. Explore our vast collection of books, 
                uncover hidden gems, and embark on literary journeys that captivate your imagination. You can download the books for FREE! We're thrilled to have you here. Happy reading! 
            </div>
                 
        </section>
    </form>
    
    <script>
        document.getElementById("<%= log_out.ClientID %>").addEventListener("click", function () {
            window.location.href = "Logincustomer.aspx";
        });
    </script>
    <script src="script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua/CJ7OBbbZXBwFt2TKXy5s4SPARx3S6oBlF7pPbzq4C+LBefzeD0tZwD" crossorigin="anonymous"></script>
</body>
</html>
