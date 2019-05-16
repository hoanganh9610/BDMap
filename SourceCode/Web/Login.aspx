<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Login Page</title>
    <link rel="stylesheet" href="~/Assets/fonts/material-icon/css/material-design-iconic-font.min.css"/>
    <link rel="stylesheet" href="~/Assets/css/style.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        
                        <figure><img src="Assets/images/signin-image.jpg" alt="sing up image"></figure>
                        <a href="Register.aspx" class="signup-image-link">Create an account</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign up</h2>
                        <div  class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>

                                <input type="text" name="your_name" id="txtUserName" runat="server" placeholder="Your Name" />
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="your_pass" id="txtPass" runat="server" placeholder="Password" />
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember
                                    me</label>
                            </div>
                            <div class="form-group form-button">

                                <asp:Button ID="btnLogin" CssClass="form-submit" runat="server" Text="Log in" OnClick="btnLogin_Click" />
<%--                                <input type="submit" name="signin" id="signin" class="form-submit" value="Log in" />--%>
                            </div>
                        </div>
                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>
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
