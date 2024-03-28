<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="Project.Books" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Books</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        .centered-table {
            margin: 0 auto; 
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 8px; /* Adjust as needed */
            text-align: left;
            border-bottom: 1px solid #ddd;
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
                            <div class="designation"><asp:Literal ID="lblUsername" runat="server"/></div>
                        </div>
                    </div>
                    <i class="bx bx-log-out" id="log_out" runat="server" />
                </li>
            </ul>
        </div>
        <section class="home-section">
            <div class="text">Books</div>
            <h2 style="text-align:center">Feel free to browse the available books!</h2>
                <div>
                    <asp:TextBox ID="txtSearchISBN" runat="server" placeholder="Search by ISBN"></asp:TextBox>
                    <asp:TextBox ID="txtSearchTitle" runat="server" placeholder="Search by Title"></asp:TextBox>
                    <asp:TextBox ID="txtSearchGenre" runat="server" placeholder="Search by Genre"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                    <asp:Button ID="btnClearFilter" runat="server" Text="Clear Filter" OnClick="btnClearFilter_Click" />

                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped centered-table" >
                <HeaderStyle BackColor="#6C757D" ForeColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Book ID" SortExpression="BookID" ItemStyle-CssClass="text-center" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" ItemStyle-CssClass="text-center" />
                    <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" ItemStyle-CssClass="text-center" />
                    <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre" ItemStyle-CssClass="text-center" />
                    <asp:BoundField DataField="Year" HeaderText="Publication Year" SortExpression="Publication Year" ItemStyle-CssClass="text-center" />
                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" ItemStyle-CssClass="text-center" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="text-center" />
                </Columns>
                
            </asp:GridView>
                 
        </section>
    </form>
    
    <script>
        document.getElementById("<%= log_out.ClientID %>").addEventListener("click", function () {
            window.location.href = "Logincustomer.aspx";
        });
    </script>
    <script src="script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua/CJ7OBbbZXBwFt2TKXy5s4SPARx3S6oBlF7pPbzq4C+LBefzeD0tZwD" crossorigin="anonymous"></script>
    <script>
        document.getElementById("<%= log_out.ClientID %>").addEventListener("click", function () {
            window.location.href = "Logincustomer.aspx";
        });
    </script>
</body>
</html>
