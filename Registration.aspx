<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="LicenceViewer.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Conduent License Management System</title>
    <link rel="stylesheet" type="text/css" href="style/style_regn.css"/>
        <link rel="icon" href="style/cndtlogo.png" type="image/icon type"/>

    <link href="styles.css" rel="stylesheet" />
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" type='text/css' />
	<link href="assets/css/main.css" rel="stylesheet" type='text/css' />
	<link href="assets/css/font-awesome.min.css" rel="stylesheet" type='text/css' />
	<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
    <style>
        body {
            background: -webkit-linear-gradient(left, #002d6b, #015183)!important;
        }
    </style>

</head>
<body>

    <div class="anthem-registration" >
        <form id="form1" runat="server">
			<div class="col-lg-12 register">
				<div class="row">
						<div class="top-row">
							<!-- Start Log -->
							<div class="brand">
								<img src="./assets/img/conduent-logo.png" class="img-responsive" alt="Conduent Logo">
							</div>
							<!-- end logo -->
						</div>
                    <div class="col-lg-12" style="margin-top:100px;">
                        <div class="row">
						<div class="col-md-3 register-left">
							<img src="" alt="" />
							<h3 class="register-welcome"> Conduent License Management System</h3>
							<%--<p class="mb-0">Already Registered?</p>
							<p>Select Login below</p>
							<input type="submit" name="" value="Login" />
							<br/>--%>
						</div>
						<div class="col-md-9 register-right">
							<div class="tab-content" id="">
								<div class="" id="home" role="tabpanel" aria-labelledby="home-tab">
									<h3 class="register-heading">User Registration</h3>

									<div class="row register-form">
										<!-- left-side-form-fields -->
										<div class="col-md-6">
											<div class="form-group">
                                                <asp:TextBox CssClass="form-control" placeholder="User Name *" ID="TextBoxUserName" runat="server"></asp:TextBox>
												<!-- validation message -->
												<div class="invalid-field">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUserName" ErrorMessage="User Name is Required" ForeColor="Red"></asp:RequiredFieldValidator>
												</div>
												<!--End validation message -->
											</div>
											
											<div class="form-group input-group">
												<asp:TextBox CssClass="form-control" placeholder="Password *" ID="TextBoxPassword" runat="server" TextMode="Password" ></asp:TextBox>
                                                <%--<div class="input-group-append">
													<span class="input-group-text">
														<i class="fa fa-eye-slash" aria-hidden="true"></i>
													</span>
												</div>--%>
												<!-- validation message -->
												<div class="invalid-field password-error">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
												</div>
												<!--End validation message -->
											</div>
                                            											
										</div>
										<!--End left-side-form-fields -->
										<!-- right-side-form-fields -->
										<div class="col-md-6">
											<div class="form-group">
                                                <asp:TextBox class="form-control" placeholder="Email Address *" ID="TextBoxEmail" runat="server"></asp:TextBox>
												<!-- validation message -->
												<div class="invalid-field">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Email is required" ForeColor="Red"></asp:RequiredFieldValidator>
												<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="You must enter the valid E-mail ID" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                </div>
												<!--End validation message -->
											</div>

											<div class="form-group input-group">
                                                <asp:TextBox CssClass="form-control" placeholder="Confirm Password *" ID="TextBoxCpassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>

												<%--<div class="input-group-append">
													<span class="input-group-text">
														<i class="fa fa-eye-slash" aria-hidden="true"></i>
													</span>
												</div>--%>
												<!-- validation message -->
												<div class="invalid-field password-error">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxCpassword" ErrorMessage="Confirm password is required " ForeColor="Red"></asp:RequiredFieldValidator>
<br />
<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxCpassword" ErrorMessage="Both password must be same" ForeColor="Red"></asp:CompareValidator>
												</div>
												<!--End validation message -->
											</div>


											<%--<div class="form-group">
												<input type="number" class="form-control" placeholder="Cost Center ID*" disabled value="" />
											</div>--%>
										</div>
										<!-- right-side-form-fields -->
										<!-- Add cost center button and fields mandatory grey-panel -->
										<div class="col-lg-12 align-middle mt-3">

											<div class="col-lg-8 text-muted">
												<div class="row">Fields marked with * are mandatory</div>
											</div>
											<div class="col-lg-4 text-right">
												<div class="row float-right">
													<!-- this button has to be disabled use commented line in cse of disabled and below that one for enable -->
													<!-- <input type="submit" disabled class="btnRegister" value="Add Cost Center" /> -->
                                                   <div class="col-lg-6">
                                                    <input id="Reset1" type="reset" value="Reset" class="btnRegister btn-enabled"/>
                                                       </div>
                                                    <div class="col-lg-6">
                                                    <asp:Button ID="Button_Submit" runat="server" OnClick="Button_Submit_Click" Text="Submit" CssClass="btnRegister btn-enabled" />
                                                        </div>
												</div>
											</div>
										</div>
									</div>
									<!-- Add cost center button and fields mandatory grey-panel -->
								</div>
							</div>
						</div>
                     </div>
                        </div>
				</div>
			</div>
             </form>
		</div>
             

                

       

</body>
</html>
