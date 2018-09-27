<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="LiveGpsTrack.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Login/CreateUser.aspx" runat="server">Register User</asp:HyperLink>
<asp:Login ID="Login1" runat="server"></asp:Login>
</asp:Content>
