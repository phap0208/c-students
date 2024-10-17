<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="webadmin2.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
    .login-container {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        width: 300px;
        margin: auto; /* Căn giữa hộp */
        margin-top: 100px; /* Khoảng cách từ trên */
    }
    h2 {
        text-align: center;
        color: #333;
    }
    label {
        margin-bottom: 5px;
        color: #555;
        display: block;
    }
    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px;
        cursor: pointer;
        border-radius: 3px;
        width: 100%;
        font-size: 16px;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
    .error-message {
        color: red;
        text-align: center;
    }
    .register-link {
        text-align: center;
        margin-top: 15px;
    }
    .eye-icon {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        color: #555;
    }
    .input-container {
        position: relative;
    }
</style>

<div class="login-container">
    <h2>Đăng Nhập</h2>
    <label for="txtMaSinhVien">Mã Sinh Viên:</label>
    <asp:TextBox ID="txtMaSinhVien" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator 
        ID="rfvMaSinhVien" 
        runat="server" 
        ControlToValidate="txtMaSinhVien" 
        ErrorMessage="Mã Sinh Viên không được để trống." 
        CssClass="error-message" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    <br />

    <label for="txtPassword">Mật Khẩu:</label>
    <div class="input-container">
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <span class="eye-icon" onclick="togglePasswordVisibility()">👁️</span>
    </div>
    <asp:RequiredFieldValidator 
        ID="rfvPassword" 
        runat="server" 
        ControlToValidate="txtPassword" 
        ErrorMessage="Mật Khẩu không được để trống." 
        CssClass="error-message" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    <br />

    <asp:Button ID="btnLogin" runat="server" Text="Đăng Nhập" OnClick="btnLogin_Click" />
    <br />
    <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>
    
    <div class="register-link">
        <p>Chưa có tài khoản? <a href="Register.aspx">Đăng ký tại đây</a></p>
    </div>
</div>

<script>
    function togglePasswordVisibility() {
        var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
        var eyeIcon = document.querySelector('.eye-icon');
        if (passwordField.type === "password") {
            passwordField.type = "text";
            eyeIcon.innerHTML = "🙈";
        } else {
            passwordField.type = "password";
            eyeIcon.innerHTML = "👁️"; 
        }
    }
</script>
</asp:Content>
