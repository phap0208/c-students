<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="webadmin2.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Quản lí sinh viên</h1>
<p>
    <asp:Label ID="Label1" runat="server" Text="Mã sinh viên"></asp:Label>
    <asp:TextBox ID="txtStudentCode" runat="server"></asp:TextBox>
</p>
<p>
    <asp:Label ID="Label2" runat="server" Text="Họ và tên"></asp:Label>
    <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
</p>
<p>
    <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
</p>
<p>
    <asp:Label ID="Label4" runat="server" Text="Số điện thoại"></asp:Label>
    <asp:TextBox ID="txtMobilePhone" runat="server"></asp:TextBox>
</p>
<p>
    <asp:Label ID="Label5" runat="server" Text="Mật khẩu"></asp:Label>
    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
</p>
<p>
    <asp:Label ID="Label6" runat="server" Text="Vai trò"></asp:Label>
    <asp:TextBox ID="txtRoles" runat="server"></asp:TextBox>
</p>
<p>
    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
    <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete" />
</p>
<p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceStudent" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass ="table">
        <Columns>
            <asp:BoundField DataField="masinhvien" HeaderText="masinhvien" HtmlEncode="False" SortExpression="masinhvien" />
            <asp:BoundField DataField="hovaten" HeaderText="hovaten" HtmlEncode="False" SortExpression="hovaten" />
            <asp:BoundField DataField="email" HeaderText="email" HtmlEncode="False" SortExpression="email" />
            <asp:BoundField DataField="sodt" HeaderText="sodt" HtmlEncode="False" SortExpression="sodt" />
            <asp:BoundField DataField="matkhau" HeaderText="matkhau" HtmlEncode="False" SortExpression="matkhau" />
            <asp:BoundField DataField="roles" HeaderText="roles" HtmlEncode="False" SortExpression="roles" />
            <asp:CommandField SelectText="Chọn" ShowSelectButton="True" ButtonType="Button" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceStudent" runat="server" ConnectionString="Data Source=DESKTOP-M126M0V;Initial Catalog=QLSV3;Persist Security Info=True;User ID=sa;Password=123456; " DeleteCommand="DELETE FROM Student WHERE (masinhvien = @masinhvien)" InsertCommand="INSERT INTO Student(masinhvien, hovaten, email, sodt, matkhau, roles) VALUES (@masinhvien, @hovaten, @email, @sodt, @matkhau, @roles)" ProviderName="<%$ ConnectionStrings:QLSV3ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Student]" UpdateCommand="UPDATE Student SET hovaten = @hovaten, email = @email, sodt = @sodt, matkhau = @matkhau, roles = @roles WHERE (masinhvien = @masinhvien)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="txtStudentCode" Name="masinhvien" PropertyName="Text" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtStudentCode" Name="masinhvien" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtFullName" Name="hovaten" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtMobilePhone" Name="sodt" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtPassword" Name="matkhau" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtRoles" Name="roles" PropertyName="Text" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtFullName" Name="hovaten" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtMobilePhone" Name="sodt" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtPassword" Name="matkhau" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtRoles" Name="roles" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtStudentCode" Name="masinhvien" PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>

</asp:Content>
