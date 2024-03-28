<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="Project.Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet' />
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style>

    .scrollable-table {
     overflow: auto;
     max-height: 400px; /* Set the maximum height as needed */
        }
    .row-spacing td {
        padding: 30px; /* Adjust the padding as needed */
    }
     .row-spacing td {
        padding: 30px; /* Adjust the padding as needed */
    }

    .form-container {
        margin-left: 30px; /* Move the form to the left by 30px */
        max-width: 300px; /* Set the maximum width of the form */
    }

    .form-container label {
        display: block;
        margin-bottom: 5px;
    }

    .form-container input[type="text"] {
        width: 100%; /* Make the textboxes fill the available width */
        box-sizing: border-box; /* Include padding and border in the total width */
        margin-bottom: 10px;
    }

    .button-container {
        margin-top: 10px; /* Adjust the top margin of the button container */
    }
    .row-spacing td {
        padding: 30px; /* Adjust the padding as needed */
    }

    .form-container {
        margin-left: 30px; /* Move the form to the left by 30px */
        max-width: 300px; /* Set the maximum width of the form */
    }

    .form-container label {
        display: block;
        margin-bottom: 5px;
    }

    .form-container input[type="text"] {
        width: 100%; /* Make the textboxes fill the available width */
        box-sizing: border-box; /* Include padding and border in the total width */
        margin-bottom: 10px;
    }

    .button-container {
        margin-right: 10px;
        
        /* Adjust the top margin of the button container */
    }

    .table {
        font-size: 14px; /* Adjust the font size of the table */
        margin-top: 20px; /* Adjust the top margin of the table */
    }

        .table th, .table td {
            padding: 8px; /* Adjust the padding of table cells */
        }
        .table-container {
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }

        .table {
            font-size: 14px;
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .table th, .table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .table th {
            background-color: #507CD1;
            color: white;
        }
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
                    <a href="FeedbackA.aspx">
                        <i class="bx bx-comment"></i>
                        <span class="link_name">Customer Feedback</span>
                    </a>
                    <span class="tooltip">Customer Feedback</span>
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
        <section class="home-section" style="margin-right:500px;">
            <div class="text">List of Books</div>
    
            <div class="form-table-container">
                <div class="form-container" style="margin-left: 30px;">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="txtTitle">Title:</label>
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Columns="2" Rows="4"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle" Display="Dynamic" ErrorMessage="Title is required" CssClass="error-message"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtAuthor">Author:</label>
                            <asp:TextBox ID="txtAuthor" runat="server" CssClass="form-control" Columns="2" Rows="4"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAuthor" runat="server" ControlToValidate="txtAuthor" Display="Dynamic" ErrorMessage="Author is required" CssClass="error-message"></asp:RequiredFieldValidator>
                        </div>
                    </div>
        
                    <div class="form-row">
                        <div class="form-group">
                            <label for="txtGenre">Genre:</label>
                            <asp:TextBox ID="txtGenre" runat="server" CssClass="form-control" Columns="2" Rows="4"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvGenre" runat="server" ControlToValidate="txtGenre" Display="Dynamic" ErrorMessage="Genre is required" CssClass="error-message"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtPublicationYear">Publication Year:</label>
                            <asp:TextBox ID="txtPublicationYear" runat="server" CssClass="form-control" Columns="2" Rows="4"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPublicationYear" runat="server" ControlToValidate="txtPublicationYear" Display="Dynamic" ErrorMessage="Publication Year is required" CssClass="error-message"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="txtISBN">ISBN:</label>
                            <asp:TextBox ID="txtISBN" runat="server" CssClass="form-control" Columns="2" Rows="4"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvISBN" runat="server" ControlToValidate="txtISBN" Display="Dynamic" ErrorMessage="ISBN is required" CssClass="error-message"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtQuantity">Quantity:</label>
                            <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" Columns="2" Rows="4"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="Quantity is required" CssClass="error-message"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="button-container text-left mt-3" style="margin-left: 30px;">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary mx-2" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary mx-2" CausesValidation="false" OnClientClick="clearForm();" />
                </div>

            </div>
        </section>

    </form>
    <script>
        document.getElementById("<%= log_out.ClientID %>").addEventListener("click", function () {
            window.location.href = "Default.aspx";
        });
    </script>
    <script>
        function clearForm() {
            // Clear all input boxes
            document.getElementById("<%= txtTitle.ClientID %>").value = "";
            document.getElementById("<%= txtAuthor.ClientID %>").value = "";
            document.getElementById("<%= txtGenre.ClientID %>").value = "";
            document.getElementById("<%= txtPublicationYear.ClientID %>").value = "";
            document.getElementById("<%= txtISBN.ClientID %>").value = "";
            document.getElementById("<%= txtQuantity.ClientID %>").value = "";

            return false; // Prevent the form from submitting
        }

        document.getElementById("<%= log_out.ClientID %>").addEventListener("click", function () {
            window.location.href = "Default.aspx";
        });
    </script>
    <script src="script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua/CJ7OBbbZXBwFt2TKXy5s4SPARx3S6oBlF7pPbzq4C+LBefzeD0tZwD" crossorigin="anonymous"></script>
</body>
</html>
