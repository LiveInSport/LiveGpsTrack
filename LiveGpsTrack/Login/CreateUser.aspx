<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="LiveGpsTrack.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" />
            <asp:CompleteWizardStep runat="server" />
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>
