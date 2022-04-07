<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LicenceViewer.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Conduent License Management System</title>
	<link href="styles.css" rel="stylesheet" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" type='text/css' />
	<link href="assets/css/main.css" rel="stylesheet" type='text/css' />
	<link href="assets/css/font-awesome.min.css" rel="stylesheet" type='text/css' />
	<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>

<%--    <title>Conduent License Management System</title>--%>
<%--    <link rel="stylesheet" type="text/css" href="style/style_login.css"/>--%>
    <link rel="icon" href="style/cndtlogo.png" type="image/icon type"/>
<%--    <style type="text/css">
        #Reset1 {
            height: 38px;
        }--%>
<%--    </style>--%>
</head>

<body>
   <%-- <div> 
		<h1>
			LICENSE MANAGEMENT SYSTEM
		</h1>
	</div>   --%>
<div class="login">
    <div class="col-lg-12 col-sm-12 col-12 login-wrapper">
        <!-- Logo and Title -->
			<div class="top-row">
                <!-- Start Log -->
				<div class="brand">
					<img src="./assets/img/conduent-logo.png" class="img-responsive" alt="Conduent Logo">
				</div>
				<!-- end logo -->
				<!-- start Heading -->
				<div class="login-heading text-center">
					LICENSE MANAGEMENT SYSTEM
				</div>
				<!-- end heading -->
			</div>
			<!-- End Logo and Anthem Title -->


             <form id="form1" runat="server" align="center">

                 <!-- Start card -->
			<div class="d-flex justify-content-center card-wrapper">
				<div class="card border-0">
					<div class="card-header border-0 py-3">
						<h3 class="my-0">Login</h3>
					</div>
					<div class="card-body">
							<div class="input-group form-group">
                                <asp:TextBox CssClass="form-control" placeholder="User Name" ID="TextBoxUserName" runat="server" ></asp:TextBox>
								
								<div class="input-group-append">
										<span class="input-group-text">
											<i class="fa fa-user"></i>
										</span>
									</div>
									<!-- validation message -->
									<div class="invalid-field">
										<%--<span>User Name is required</span>--%>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BorderColor="Black" ControlToValidate="TextBoxUserName" CssClass="auto-style11" ErrorMessage="User Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
									</div>
									<!--End validation message -->
							</div>

							<div class="input-group form-group">
                                <asp:TextBox CssClass="form-control" placeholder="Password" ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
								
                                <div class="input-group-append">
										<span class="input-group-text">
											<i class="fa fa-lock"></i>
										</span>
									</div>
									<!-- validation message -->
									<div class="invalid-field">
										<%--<span>Password is required</span>--%>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" CssClass="auto-style11" ErrorMessage="Please enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
									</div>
									<!--End validation message -->
							</div>
							

                        <div class="d-flex justify-content-between">
              <input class="btn btn-link p-0 text-white" id="Reset1" type="reset" value="Reset" />
              <asp:Button ID="Button_Login" runat="server" CssClass="btn float-right login_btn" Height="40px" OnClick="Button_Login_Click1" Text="Login" Width="100px" />
            </div>

                        <div class="text-center col-12 p-0 my-4">
            <span class="mr-2 text-white">Don't have an account?</span>
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="orange" NavigateUrl="~/Registration.aspx">Sign Up</asp:HyperLink>
          </div>
						
					</div>
					
				</div>
			</div>
			<!-- end card -->


                 </form>
         
        </div>
        </div>
</body>
</html>
