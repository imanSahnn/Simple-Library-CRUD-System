<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedbackForm.aspx.cs" Inherits="Project.FeedbackForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Feedback Form</title>
    <style>
        table {
            border-collapse: collapse;
            width: 300px;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="border: 1px dotted #ccc; padding: 10px; width: 300px;">

                <h2 style="text-align: center;">Customer Feedback</h2>
            </div>

            <table>
                <tr>
                    <th>Feedback ID:</th>
                    <td>
                        <asp:TextBox runat="server" ID="txtFeedbackId"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvFeedbackId" ControlToValidate="txtFeedbackId" Text="*" ErrorMessage="Feedback ID is required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <th>Room Type:</th>
                    <td>
                        <asp:DropDownList runat="server" ID="ddlRoomType">
                            <asp:ListItem Text="Regular" Value="Regular"></asp:ListItem>
                            <asp:ListItem Text="Family" Value="Family"></asp:ListItem>
                            <asp:ListItem Text="Luxury" Value="Luxury"></asp:ListItem>
                            <asp:ListItem Text="Suite" Value="Suite"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <th>E-mail:</th>
                    <td>
                        <asp:TextBox runat="server" ID="txtEmail"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvEmail" ControlToValidate="txtEmail" Text="*" ErrorMessage="E-mail is required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ID="revEmail" ControlToValidate="txtEmail" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" Text="*" ErrorMessage="Invalid E-mail format"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <th>Phone Number:</th>
                    <td>
                        <asp:TextBox runat="server" ID="txtPhone"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvPhone" ControlToValidate="txtPhone" Text="*" ErrorMessage="Phone Number is required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ID="revPhone" ControlToValidate="txtPhone" ValidationExpression="^\d{10}$" Text="*" ErrorMessage="Invalid Phone Number format"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <th>Customer Satisfaction:</th>
                    <td>
                        <asp:RadioButtonList runat="server" ID="rblSatisfaction">
                            <asp:ListItem Text="Excellent" Value="Excellent"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="Good"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="Bad"></asp:ListItem>
                            <asp:ListItem Text="Horrible" Value="Horrible"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>

            <asp:Button runat="server" ID="btnSubmit" Text="Submit"/>
        </div>
    </form>
</body>
</html>
