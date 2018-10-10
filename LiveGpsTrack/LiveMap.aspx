<%@ Page Title="Live Map" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LiveMap.aspx.cs" Inherits="LiveMap.LiveMap" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="~/favicon.ico" rel="st" type="image/x-icon" />

    <link rel="stylesheet" href="/Content/oltest.css" type="text/css">
    <link rel="stylesheet" href="/Content/font-awesome.css" type="text/css">
    <script src="/Scripts/ol-debug.js" type="text/javascript"></script>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <div class="jumbotron w3-display-container">
        <input id="Button1" class="btn btn-default" type="button" style="position: absolute; right: 10px; margin-left: 10px;" value="Hide map" onclick="ShowMap()" />
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="False" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:HyperLinkField DataTextField="name" DataNavigateUrlFormatString="~/Event.aspx?id={0}" DataNavigateUrlFields="id" NavigateUrl="~/Event.aspx" ItemStyle-CssClass="h1" />
                <asp:HyperLinkField DataTextField="lat" DataNavigateUrlFormatString="~/Event.aspx?id={0}" DataNavigateUrlFields="id" NavigateUrl="~/Event.aspx" />
                <asp:HyperLinkField DataTextField="date" DataTextFormatString="{0:d}" DataNavigateUrlFormatString="~/Event.aspx?id={0}" DataNavigateUrlFields="id" NavigateUrl="~/Event.aspx" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <div id="map" class="full-map"></div>

    </div>
    <script>                
        var baseLayer = new ol.layer.Tile({
            source: new ol.source.OSM()
        });
        var london = ol.proj.transform([-0.12755, 51.507222], 'EPSG:4326', 'EPSG:3857');
        var view = new ol.View({
            center: london,
            zoom: 3
        });
        map = new ol.Map({
            target: 'map',
            layers: [baseLayer],
            view: view
        });

        function ShowMap() {
            if (document.getElementById("Button1").value == "Hide map") {// if map hidden then show
                document.getElementById("Button1").value = "Show map";
                document.getElementById("map").style = "display: none;";
            } else {
                document.getElementById("map").style = "display: block;";
                document.getElementById("Button1").value = "Hide map";
            }
        }//show map and button
    </script>
</asp:Content>

