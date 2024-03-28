<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Project.Admin" %>

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
            margin-inline-start: 400px;
        }

        .clock {
            font-size: 40px; /* Adjust the font size for the clock */
            margin-top: 20px;
            margin-inline-start: auto; /* Center the clock horizontally */
            margin-inline-end: auto;
            text-align: center; /* Center the text within the div */
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
            <div class="text">Dashboard</div>
            <div class ="mx-auto text-center fw-bold " style="font-size: 80px;" >WELCOME TO TAMAN U-115 BOOK STORE</div>
             <div class="clock" id="clock"></div>
        </section>
    </form>

    <script>
        document.getElementById("<%= log_out.ClientID %>").addEventListener("click", function () {
            window.location.href = "Logincustomer.aspx";
        });
    </script>
      <script>
          document.getElementById("<%= log_out.ClientID %>").addEventListener("click", function () {
              window.location.href = "Logincustomer.aspx";
          });

          // Function to update the clock
          function updateClock() {
              var now = new Date();
              var hours = now.getHours();
              var minutes = now.getMinutes();
              var seconds = now.getSeconds();

              // Add leading zeros if needed
              hours = (hours < 10 ? "0" : "") + hours;
              minutes = (minutes < 10 ? "0" : "") + minutes;
              seconds = (seconds < 10 ? "0" : "") + seconds;

              // Display the time
              document.getElementById("clock").innerHTML = hours + ":" + minutes + ":" + seconds;

              // Update every second
              setTimeout(updateClock, 1000);
          }

          // Initial call to set up the clock
          updateClock();
      </script>
    <script src="script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua/CJ7OBbbZXBwFt2TKXy5s4SPARx3S6oBlF7pPbzq4C+LBefzeD0tZwD" crossorigin="anonymous"></script>
</body>
</html>
