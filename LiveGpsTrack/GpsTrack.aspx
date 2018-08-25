<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GpsTrack.aspx.cs" Inherits="LiveGpsTrack.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="http://openlayers.org/en/v3.16.0/css/ol.css" type="text/css">
    <script src="http://openlayers.org/en/v3.16.0/build/ol.js" type="text/javascript"></script>
    <input type="submit" name="Button" id="start_tracking" value="Start Tacking" />
    <label id="latit"></label>
    <label id="longit"></label>
    <label id="spd"></label>
    <div id="map" class="map">
    </div>

    <script>//uses geolocation for locating and shoving the current location

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude,
                    spd: position.coords.speed
                };
                document.getElementById('latit').innerText = 'Latitude ' + pos.lat;
                document.getElementById('longit').innerText = 'Longitude ' + pos.lng;
                if (pos.spd = 'NaN') {
                    document.getElementById('spd').innerText = '';
                } else {
                    document.getElementById('spd').innerText = 'Speed ' + pos.spd;
                };
                ShowMap(pos);
            });
            } else {
                            document.getElementById('latit').innerText = 'Location isent possible';

        };
        function ShowMap(pos) {
            var view = new ol.View({
                center: ol.proj.fromLonLat([pos.lng, pos.lat]),
                zoom: 19
            });
            var map = new ol.Map({
                target: 'map',
                layers: [
                    new ol.layer.Tile({
                        source: new ol.source.OSM()
                    })
                ],
                view: view
            });

        };

    </script>
</asp:Content>
