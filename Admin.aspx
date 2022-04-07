<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="LicenceViewer.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Conduent License Management System</title>
<%--    <link rel="stylesheet" type="text/css" href="style/style_admin.css"/>--%>
        <link rel="icon" href="style/cndtlogo.png" type="image/icon type"/>
	
    
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type='text/css' />
	<link href="assets/css/font-awesome.min.css" rel="stylesheet" type='text/css' />
	<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'/>
    
    <script src="assets/js/jquery-slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="assets/js/bootstrap.min.js"></script>
      <script type="text/javascript">
      function ShowProgressBar() {
        document.getElementById('dvProgressBar').style.visibility = 'visible';
      }

      function HideProgressBar() {
        document.getElementById('dvProgressBar').style.visibility = "hidden";
      }
    </script>

    <style>
        .dropdown-toggle::after {
    display:none;
}
        .loader {
		border: 16px solid #f3f3f3;
		border-radius: 50%;
		border-top: 16px solid #3498db;
		width: 120px;
		height: 120px;
		animation: spin 2s linear infinite;
		position:absolute;
        visibility: hidden;
		top:50%;
		left:45%;
		background-color: rgba(0, 0, 0, 0.4);
		}
        @-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
	  .topControl1 {
      position: absolute;
      margin: 0;
      color: #fff;
      z-index: 2;
	  left: 79%;
	  top:18%;
      }
      .topControl2 {
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
                          <img src="./assets/img/conduent-logo.png" class="img-responsive" alt="Conduent Logo" style ="height: 40px;"/>

                      </a>
                </div>
                <div class="col-lg-4" style="margin-top : 5px;">
                    <h3 class="text-center text-white ml-auto font-weight-normal mb-0">LICENSE MANAGEMENT SYSTEM</h3>
                </div>
                <div class="col-lg-2">
                    <asp:UpdatePanel ID="updatepnl2" runat="server">
                        <ContentTemplate>
                             <h3 class="topControl1">
                                 <asp:imagebutton ID="newEntry" runat="server"  ImageUrl="style\\edit.png" Width="28" Height="28" ToolTip="New Entry" OnClick="Button_save_Click"/>
                             </h3>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                             <h3 class="topControl2">
                                 <asp:imagebutton ID="exportXLS" runat="server"  ImageUrl="style\\exportXLS.png" Width="28" Height="28" ToolTip="Export to Excel" OnClick="Button_Export"/>
                             </h3>
                </div>
                <div class="col-lg-2">
                    <ul class="text-right" style="list-style-type:none; margin-left:15px;">
<%--                    <div class="topbar-divider d-none d-sm-block"></div>--%>
                      <!-- Nav Item - User Information -->
                      <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle"  class="nav-link" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                          <span class="mr-2 d-none d-lg-inline text-white"><%:Session["New"]%><i class="fa fa-chevron-down"></i></span>
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                          <asp:UpdatePanel ID="updatepnl" runat="server">     
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
        <div class="btn-block">
        <br/>
<%--            <asp:Button ID="Button3" runat="server" OnClick="Button_Logout" Text="Logout" Width="180px" class="btn" />--%>

        </div>
        <div id="dvProgressBar" class="loader" >
              
        </div>
        <div class="item">
            <asp:SqlDataSource ID="SqlDataSourceRegistration" runat="server" ConnectionString="<%$ ConnectionStrings:Licence_viewerConnectionString %>" SelectCommand="SELECT [Id], [Subscriber_Flag], [Software], [Vendor], [Client_Name], [Domain], [License_Expiry_Date], [Expiry_Type] FROM [Licence_Info] ORDER BY [License_Expiry_Date]" OnSelecting="SqlDataSourceRegistration_Selecting"></asp:SqlDataSource>
<%--            <asp:GridView ID="datagrid" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass ="header" RowStyle-CssClass="rows" AllowPaging="True" OnPageIndexChanging="datagrid_PageIndexChanging" DataSourceID="SqlDataSourceRegistration">--%>
            <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-striped text-center" runat="server" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSourceRegistration" DataKeyNames="Id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" PageSize = "7" AllowSorting="True" >
                <Columns>
                    
                    <asp:BoundField DataField="Id" HeaderText="ID" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Subscriber_Flag" HeaderText="Subscriber_Flag" SortExpression="Subscriber_Flag" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Software" HeaderText="Software" SortExpression="Software" />
                    <asp:BoundField DataField="Vendor" HeaderText="Vendor" SortExpression="Vendor" />
                    <asp:BoundField DataField="Client_Name" HeaderText="Client Name" SortExpression="Client_Name" />
                    <asp:BoundField DataField="Domain" HeaderText="Domain" SortExpression="Domain" />
                    <asp:BoundField DataField="License_Expiry_Date" HeaderText="License Expiry Date" SortExpression="License_Expiry_Date" />
                    <asp:BoundField DataField="Expiry_Type" HeaderText="Expiry Type" SortExpression="Expiry_Type" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                           <asp:imagebutton ID="subBtn" runat="server" Width="28" Height="28" OnClick="btnSubs_Click" OnClientClick="javascript:ShowProgressBar()" CommandArgument='<%#Eval("Id") %>' CommandName='<%# Eval("Subscriber_Flag") %>' ImageUrl='<%# Eval("Subscriber_Flag").ToString()=="1"?"style\\unsub.png":"style\\sub.png"%>' ToolTip='<%# Eval("Subscriber_Flag").ToString()=="1"?"Unsubscribe":"Subscribe"%>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="More">
                    <ItemTemplate>
                        <asp:Button runat="server" OnClick="btnDownload_Click" CommandArgument='<%#Eval("Id") %>' Text="View Details" CssClass="btn btn-primary"/>
                    </ItemTemplate> 
                </asp:TemplateField>
                </Columns>
                <%--<FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />--%>
                <HeaderStyle BackColor="#343a40" Font-Bold="True" ForeColor="#FFFFFF" />
                <PagerSettings Mode="NumericFirstLast" />
                <PagerStyle  HorizontalAlign="Right" />
                <%--<RowStyle BackColor="White" ForeColor="#330099" />--%>
                <%--<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />--%>
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>

             <div class="footer bg-dark text-white text-center" style="height:30px; position:fixed;bottom:0px;width:100% !important; ">
  <span style="font-size:10px;">© 2021 Conduent, Inc. All rights reserved. Designed and maintained by CTPO DEV OCC L3 Support. </span>
</div>
    </form>
       
</body>
</html>
