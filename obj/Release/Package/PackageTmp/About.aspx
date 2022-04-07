<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="LicenceViewer.About" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Conduent License Management System</title>
<%--     <link rel="stylesheet" type="text/css" href="style/style_About.css"/>--%>
        <link rel="icon" href="style/cndtlogo.png" type="image/icon type"/>

     <link href="assets/css/bootstrap.min.css" rel="stylesheet" type='text/css' />
	<link href="assets/css/font-awesome.min.css" rel="stylesheet" type='text/css' />
	<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
    
    <script src="assets/js/jquery-slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <style>
        .dropdown-toggle::after {
    display:none;
}
        .topControl {
        position: absolute;
        margin: 0;
        color: #fff;
        z-index: 2;
        left: 99%;
        top:18%;
        }
        </style>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="scriptmanager1" runat="server" EnablePartialRendering="true">  </asp:ScriptManager>
     
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="col-lg-12">
            <div class="row">
                <div class="col-lg-4">
                      <a class="navbar-brand" href="#">
                          <img src="./assets/img/conduent-logo.png" class="img-responsive" alt="Conduent Logo" style ="height: 40px;">

                      </a>
                </div>
                <div class="col-lg-4" style="margin-top : 5px;">
                    <h3 class="text-center text-white ml-auto font-weight-normal mb-0">LICENSE MANAGEMENT SYSTEM</h3>
                </div>
                
               <div class="col-lg-2 text-right ">
<%--                   <a class="nav-link text-white" href="#">Home</a>--%>
                <h3 class="topControl">
                   <asp:imagebutton ID="homePage" runat="server"  ImageUrl="style\\home.png" Width="28" Height="28" ToolTip="Back to Home Page" OnClick="go_Home"/>
                </h3>
               </div>
                <div class="col-lg-2">

                    <ul class="text-right" style="list-style-type:none; margin-left:15px;">
                      <!-- Nav Item - User Information -->
                      <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle"  class="nav-link" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                          <span class="mr-2 d-none d-lg-inline text-white"><%:Session["New"]%> <i class="fa fa-chevron-down"></i></span>
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                          
       
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">     
                            <ContentTemplate>
                            <asp:LinkButton OnClick="Button_Logout" runat="server" CssClass="dropdown-item">
                               <i class="fa fa-sign-out text-danger"></i>
                              Logout
                          </asp:LinkButton>
                         </ContentTemplate> 
                            </asp:UpdatePanel> 
                        </div>
                      </li>
                    </ul>
                </div>
                          
            </div>
        </div>
</nav>
        <div class="col-lg-12">
      <div class="banner"  style="margin-top:15px;">
        <h3>LICENSE DETAILS</h3>
        
        <asp:UpdatePanel ID="updatepnl" runat="server">     
        <ContentTemplate>
<%--            <h4><asp:imagebutton id="Homelink" ImageUrl="style\homeicon2.png" Width="40" Height="40" runat="server" OnClick="go_Home"/></h4>           --%>
        </ContentTemplate> 
        </asp:UpdatePanel>  
      </div>
      
        <div class="row">    
      <div class="col-lg-6">
         <table class="table table-bordered">
        <tr><td><b>Software:</b>&nbsp;&nbsp;</td>
              <td><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
          </tr>
        <tr><td><b>Vendor:</b>&nbsp;&nbsp;</td>
             <td> <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
            </tr>
        
        <tr><td><b>Client Name:</b>&nbsp;&nbsp;</td>
              <td><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
          </tr>
        <tr><td><b>Environment/Tier:</b>&nbsp;&nbsp;</td>
            <td>  <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr><td><b>Location:</b>&nbsp;&nbsp;</td>
              <td><asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr><td><b>Domain:</b>&nbsp;&nbsp;</td>
             <td> <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr><td><b>IP Address:</b>&nbsp;&nbsp;</td>
             <td> <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr><td><b>HTTP Port:</b>&nbsp;&nbsp;</td>
            <td>  <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></td>
        </tr>

        <tr><td><b>HTTPS Port:</b>&nbsp;&nbsp;</td>
             <td><asp:Label ID="Label9" runat="server" Text="Label"></asp:Label></td>
            </tr>
        </table>
      </div>
      <div class="col-lg-6">
        <table class="table table-bordered">
        <tr><td><b>License Expiration Date:</b>&nbsp;&nbsp;</td>
              <td><asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr><td><b>Expiry Type:</b>&nbsp;&nbsp;</td>
              <td><asp:Label ID="Label11" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr><td><b>URLs:</b>&nbsp;&nbsp;</td>
<%--              <td><asp:Label ID="Label12" runat="server" Text="Label" Width="50px"></asp:Label></td>--%>
            <td><asp:HyperLink ID="HyperLink1" runat="server" Text="Visit" Target="_blank"></asp:HyperLink></td>
        </tr>
        <tr><td><b>Price:</b>&nbsp;&nbsp;</td>
             <td> <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr><td><b>New Quote:</b>&nbsp;&nbsp;</td>
              <td><asp:Label ID="Label14" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr><td><b>PO:</b>&nbsp;&nbsp;</td>
            <td>  <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr><td><b>Invoice:</b>&nbsp;&nbsp;</td>
              <td><asp:Label ID="Label16" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr><td><b>Estimated trip amount:</b>&nbsp;&nbsp;</td>
              <td><asp:Label ID="Label17" runat="server" Text="Label"></asp:Label></td>
          </tr>
            </table>
      </div>
   </div>
            <div class="d-flex justify-content-center btn-toolbar" style="margin-bottom:40px;">

                <asp:Button ID="Button1" runat="server" OnClick="Button_edit_Click" autopostback="false" xmlns:asp="#unknown" Text="Edit" class="btn btn-primary px-4 mx-2" />
        <asp:Button ID="Button2" runat="server" OnClick="Button_delete_Click" Text="Delete"  class="btn btn-danger px-4 mx-2" />
        </div>
       
        </div>

        <div class="footer bg-dark text-white text-center" style="height:30px; position:fixed;bottom:0px;width:100% !important; ">
  <span style="font-size:10px;">© 2021 Conduent, Inc. All rights reserved. Designed and maintained by CTPO DEV OCC L3 Support. </span>
</div>
    </form>
</body>
</html>
