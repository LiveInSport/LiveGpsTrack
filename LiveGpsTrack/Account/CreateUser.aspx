<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="LiveGpsTrack.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="hi align: middle">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser">
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" Title="&lt;h1&gt;Sign Up for Your New Account&lt;/h1&gt;" />
            <asp:CompleteWizardStep runat="server" />
        </WizardSteps>
    </asp:CreateUserWizard>mysqlliv.den1.mysql6.gear.host
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
        </div>
</asp:Content>
