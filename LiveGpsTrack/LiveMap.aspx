<%@ Page Title="Live Map" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LiveMap.aspx.cs" Inherits="LiveMap.LiveMap" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="~/favicon.ico" rel="st" type="image/x-icon" />

    <link rel="stylesheet" href="/Content/oltest.css" type="text/css">
    <link rel="stylesheet" href="/Content/font-awesome.css" type="text/css">
    <script src="/Scripts/ol-debug.js" type="text/javascript"></script>
    <div id="map" class="full-map" style="border-radius: 40px;"></div>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:Button ID="Button1" runat="server" Text="Button" />

    <asp:ListBox ID="ListBox1" runat="server">
        <asp:ListItem>zzxz</asp:ListItem>
    </asp:ListBox>
    
    <div id="location" class="marker"><span class="icon-arrow-up"></span></div>
    <script>
                var events = [<%= this.eloc %>];

        var baseLayer = new ol.layer.Tile({
            source: new ol.source.OSM()
        });
        var london = ol.proj.transform([-0.12755, 51.507222], 'EPSG:4326', 'EPSG:3857');
        var view = new ol.View({
            center: london,
            zoom: 19
        });
        map = new ol.Map({
            target: 'map',
            layers: [baseLayer/*, trackLayer*/],
            view: view
        });
        //var vctLayer = new ol.layer.Vector("Overlay");

    </script>
</asp:Content>

