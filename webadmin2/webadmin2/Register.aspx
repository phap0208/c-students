<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="webadmin2.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
         <style>
        .register-container {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
        }
        .form-title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .btn-register {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        .btn-register:hover {
            background-color: #45a049;
        }
        .message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
        .error-message {
            color: red;
            font-size: 12px;
            margin-top: 5px;
            display: none; /* Ẩn thông báo lỗi theo mặc định */
        }
        .Login-link {
        
        margin-top: 15px;
        }
    </style>

    <div class="register-container">
        <div class="form-title">Đăng Ký</div>

        <asp:Label ID="lblMessage" runat="server" CssClass="message" Text=""></asp:Label>

        <div class="form-group">
            <asp:Label ID="lblTenSinhVien" runat="server" Text="Tên Sinh Viên: "></asp:Label>
            <asp:TextBox ID="txtTenSinhVien" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTenSinhVien" runat="server" ControlToValidate="txtTenSinhVien" 
                ErrorMessage="Chưa nhập tên sinh viên! " CssClass="error-message" Display="Dynamic" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblMaSinhVien" runat="server" Text="Mã Sinh Viên: "></asp:Label>
            <asp:TextBox ID="txtMaSinhVien" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMaSinhVien" runat="server" ControlToValidate="txtMaSinhVien" 
                ErrorMessage="Chưa nhập mã sinh viên !" CssClass="error-message" Display="Dynamic" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblPhone" runat="server" Text="Số điện thoại: "></asp:Label>
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" 
                ErrorMessage="Chưa nhập số điện thoại !" CssClass="error-message" Display="Dynamic" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                ErrorMessage="Chưa nhập Email !" CssClass="error-message" Display="Dynamic" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblPassword" runat="server" Text="Mật khẩu: "></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" 
                ErrorMessage="Chưa nhập Mật khẩu !" CssClass="error-message" Display="Dynamic" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblConfirmPassword" runat="server" Text="Nhập Lại Mật khẩu: "></asp:Label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" 
                ErrorMessage="Chưa nhập lại mật khẩu !" CssClass="error-message" Display="Dynamic" />
        </div>
        <div class="form-group">
            <asp:Label ID="lblRoles" runat="server" Text="Quyền (Roles): "></asp:Label>
            <asp:TextBox ID="txtRoles" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvRoles" runat="server" ControlToValidate="txtRoles" 
                ErrorMessage="Chưa nhập quyền (roles)!" CssClass="error-message" Display="Dynamic" />
        </div>
        

        <div>
            <asp:Button ID="btnRegister" runat="server" Text="Đăng Ký" CssClass="btn-register" OnClick="btnRegister_Click" />
        </div>
        <div class="Login-link">
    <p>Nếu đã có tài khoản  <a href="Login.aspx">Đăng nhập tại đây</a></p>
</div>
    </div>
</asp:Content>
