<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="LiveGpsTrack.WebForm2" %>
<script runat="server">
    private bool autent(string UserName, string Password)
    {
        //Here the autentication
        return false;
    }

    private void OnAutenticate(object sender, AuthenticateEventArgs e)
    {
        bool Autenticated = false;
        Autenticated = autent(Login1.UserName, Login1.Password);
        e.Authenticated = Autenticated;
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Account/CreateUser.aspx" runat="server">Register User</asp:HyperLink>
    <asp:Login ID="Login1" runat="server" OnAuthenticate="OnAutenticate">
    </asp:Login>
</asp:Content>
