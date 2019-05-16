<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Web.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Register Page</title>
    <link rel="stylesheet" href="~/Assets/fonts/material-icon/css/material-design-iconic-font.min.css"/>
    <link rel="stylesheet" href="~/Assets/css/style.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">        
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <div class="register-form" id="register-form">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="first" runat="server" placeholder="First Name"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="last" runat="server" placeholder="Last Name"/>
                            </div>
                            <div class="form-group">
                                <label for="user"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" name="user" id="user" runat="server" placeholder="Your Account"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="pass" runat="server" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" runat="server" placeholder="Repeat your password"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group form-button">
                                <asp:Button ID="btnRegister" runat="server" CssClass="form-submit" Text="Register" OnClick="btnRegister_Click" />
<%--                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>--%>
                            </div>
                        </div>
                    </div>
                    <div class="signup-image">
                        
                        <figure><img src="Assets/images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="Login.aspx" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>
            
        </div>
    </form>
    <script src="~/Assets/vendor/jquery/jquery.min.js"></script>
    <script src="~/Assets/js/main.js"></script>
</body>
</html>
