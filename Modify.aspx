<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="LicenceViewer.Modify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Conduent License Management System</title>
<%--     <link rel="stylesheet" type="text/css" href="style/style_licence.css"/>--%>
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


        <asp:ScriptManager ID="scriptmanager1" runat="server"> 
        </asp:ScriptManager> 

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
                          
       
                            <asp:UpdatePanel ID="updatepnl" runat="server" UpdateMode="Conditional">     
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
            <div class="banner"   style="margin-top:15px;">
        <h3>LICENSE DETAILS</h3>
        
        <asp:UpdatePanel ID="updatepnl1" runat="server" UpdateMode="Conditional">     
        <ContentTemplate>
<%--        <h4><asp:imagebutton id="Homelink" ImageUrl="style\homeicon2.png" Width="40" Height="40" runat="server" OnClick="go_Home"/></h4>           --%>
    </ContentTemplate> 
        </asp:UpdatePanel>  

      </div>

            <div class="col-lg-12" style="border : 1px solid #343a40; padding:25px; margin-bottom:40px;">
        <div class="row">
          <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
                Software<sup class="text-danger"></sup>
              </label>
              <asp:DropDownList ID="DropDownList_Software" runat="server" CssClass="form-control" >
                            <asp:ListItem>Select Software</asp:ListItem>
                            <asp:ListItem>Rubika</asp:ListItem>
                            <asp:ListItem>CIS</asp:ListItem>
                            <asp:ListItem>Solfusion</asp:ListItem>
                            <asp:ListItem>SEFAS</asp:ListItem>
                            <asp:ListItem>SPDE</asp:ListItem>
                            <asp:ListItem>SSE</asp:ListItem>
                            <asp:ListItem>SDX Designer</asp:ListItem>

                        </asp:DropDownList>
           <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
          <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
                Vendor<sup class="text-danger"></sup>
              </label>
              <asp:DropDownList ID="DropDownList_Vendor" runat="server" CssClass="form-control" >
                            <asp:ListItem>Select Vendor</asp:ListItem>
                            <asp:ListItem>Solimar</asp:ListItem>
                            <asp:ListItem>Racami</asp:ListItem>
                            <asp:ListItem>SEFAS</asp:ListItem>
                        </asp:DropDownList>
          <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
          <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
                Client Name (Ctrl + Click for Multiselect)<sup class="text-danger"></sup>
              </label>
               <asp:ListBox ID="Listbox_Client" runat="server" CssClass="form-control" SelectionMode="Multiple">
                            <asp:ListItem>Assurant</asp:ListItem>
                            <asp:ListItem>BOA_Claims</asp:ListItem>
                            <asp:ListItem>PacifiCorp</asp:ListItem>
                            <asp:ListItem>Metlife</asp:ListItem>
                            <asp:ListItem>MDEZ</asp:ListItem>
                            <asp:ListItem>BOA_LockBox</asp:ListItem>
                            <asp:ListItem>Optum</asp:ListItem>
                            <asp:ListItem>Aetna</asp:ListItem>
                            <asp:ListItem>Anthem</asp:ListItem>
                        </asp:ListBox>
          <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
        </div>

            <div class="row">
          <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
                Environment/Tier<sup class="text-danger"></sup>
              </label>
              <asp:TextBox ID="TextBox_Tier" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
          <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
                Location<sup class="text-danger"></sup>
              </label>
              <asp:DropDownList ID="DropDownList_Location" runat="server" CssClass="form-control" >
                            <asp:ListItem>Select Location</asp:ListItem>
                            <asp:ListItem>USA</asp:ListItem>
                            <asp:ListItem>India</asp:ListItem>
                        </asp:DropDownList>
          <asp:Label ID="Label5" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
          <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
                Domain<sup class="text-danger"></sup>
              </label>
              <asp:DropDownList ID="DropDownList_Domain" runat="server" CssClass="form-control">
                            <asp:ListItem>Select Domain</asp:ListItem>
                            <asp:ListItem>ACSHCP</asp:ListItem>
                            <asp:ListItem>XRXSS</asp:ListItem>
                            <asp:ListItem>ITOC</asp:ListItem>
                        </asp:DropDownList>
          <asp:Label ID="Label6" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
        </div>
        
        <div class="row">
            <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
                IP Address<sup class="text-danger"></sup>
              </label>
              <asp:TextBox ID="TextBox_IP" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:Label ID="Label7" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
            <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
                HTTP Port<sup class="text-danger"></sup>
              </label>
              <asp:TextBox ID="TextBox_HTTP" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:Label ID="Label8" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
            <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
                HTTPS Port<sup class="text-danger"></sup>
              </label>
              <asp:TextBox ID="TextBox_HTTPS" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:Label ID="Label9" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
        </div>
        <div class="row">
            <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
               License Expiry Date<sup class="text-danger"></sup>
              </label>
              <input type="date" id="TextBox_Annual" name="TextBox_Annual" runat="server" class="form-control"/>
                <asp:Label ID="Label10" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
            <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
                Expiry Type<sup class="text-danger"></sup>
              </label>
              <asp:DropDownList ID="DropDownList_Extype" runat="server" CssClass="form-control" >
                            <asp:ListItem>Select Type</asp:ListItem>
                            <asp:ListItem>Annual</asp:ListItem>
                            <asp:ListItem>Temporary</asp:ListItem>
                            
                        </asp:DropDownList>
          <asp:Label ID="Label11" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
            <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
                URLs<sup class="text-danger"></sup>
              </label>
              <asp:TextBox ID="TextBox_URL" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:Label ID="Label12" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
        </div>
            <div class="row">
            <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
                Price<sup class="text-danger"></sup>
              </label>
              <asp:TextBox ID="TextBox_Price" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:Label ID="Label13" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
            <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
                New Quote<sup class="text-danger"></sup>
              </label>
              <asp:TextBox ID="TextBox_Quote" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:Label ID="Label14" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
            <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
                PO<sup class="text-danger"></sup>
              </label>
               <asp:TextBox ID="TextBox_PO" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:Label ID="Label15" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
        </div>
            <div class="row">
            <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
                Invoice<sup class="text-danger"></sup>
              </label>
               <asp:TextBox ID="TextBox_Invoice" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:Label ID="Label16" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
            <div class="col-12 col-sm-4">
            <div class="form-group ">
              <label>
                Estimated trip amount<sup class="text-danger"></sup>
              </label>
              <asp:TextBox ID="TextBox_Payment" runat="server" CssClass="form-control" OnTextChanged="TextBox_Payment_TextChanged"></asp:TextBox>
          <asp:Label ID="Label17" runat="server" ForeColor="Red"></asp:Label>
            </div>
          </div>
           
        </div>
        <div class="d-flex justify-content-center btn-toolbar my-3">
            <asp:Button ID="Button_save" runat="server" OnClick="Button_save_Click" Text="Save"  class="btn btn-success px-4 mx-2" CausesValidation="true" ValidationGroup="license"/>
          <input id="Reset1" class="btn btn-secondary px-4 mx-2" type="reset" value="Reset" />
            <input id="Cancel" class="btn btn-primary px-4 mx-2" type="button" value="Cancel" onclick="location.href='Admin.aspx'"/>
        </div>
            </div>
            </div>
         <div class="footer bg-dark text-white text-center" style="height:30px; position:fixed;bottom:0px;width:100% !important; ">
  <span style="font-size:10px;">© 2021 Conduent, Inc. All rights reserved. Designed and maintained by CTPO DEV OCC L3 Support. </span>
</div>
    </form>

</body>
</html>
