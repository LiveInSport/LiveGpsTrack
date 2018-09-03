<%@ Page Title="Tracking" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GpsTrack.aspx.cs" Inherits="LiveGpsTrack.WebForm1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="~/favicon.ico" rel="st" type="image/x-icon" />

    <link rel="stylesheet" href="/Content/oltest.css" type="text/css">
<%--    <link rel="stylesheet" href="/Content/samplestest.css" type="text/css">
    <link rel="stylesheet" href="/Content/styletest.css" type="text/css">--%>
    <link rel="stylesheet" href="/Content/font-awesome.css" type="text/css">
<%--    <script src="http://openlayers.org/en/v3.16.0/build/ol.js" type="text/javascript"></script>--%>
    <script src="/Scripts/ol-debug.js" type="text/javascript"></script>
        <div>
        <input type="submit" name="Button" class="btn-large" id="tracking" value="Start Tacking" onclick="return false;" />
        <input type="submit" name="Button" class="btn-large" id="BoI" value="Boint of Intrest" onclick="return false;" />
        <label id="latit"></label>
        <label id="longit"></label>
        <label id="spd"></label>
    </div>
       <div id="map" class="full-map"></div>
    <div id="location" class="marker"><span class="icon-arrow-up"></span></div>


    <script>//uses geolocation for locating and shoving the current location
        // create a style to display our position history (track)
        var trackStyle = new ol.style.Style({
            stroke: new ol.style.Stroke({
                color: 'rgba(0,0,255,1.0)',
                width: 3,
                lineCap: 'round'
            })
        });
        // use a single feature with a linestring geometry to display our track
        var trackFeature = new ol.Feature({
            geometry: new ol.geom.LineString([])
        });
        // we'll need a vector layer to render it
        var trackLayer = new ol.layer.Vector({
            source: new ol.source.Vector({
                features: [trackFeature]
            }),
            style: trackStyle
        });
        var baseLayer = new ol.layer.Tile({
            source: new ol.source.OSM()
        });
        var london = ol.proj.transform([-0.12755, 51.507222], 'EPSG:4326', 'EPSG:3857');
        var view = new ol.View({
            center: london,
            zoom: 19
        });
        var map = new ol.Map({
            target: 'map',
            layers: [baseLayer, trackLayer],
            view: view
        });
        // set up the geolocation api to track our position
        var geolocation = new ol.Geolocation({
           
            tracking: true
        });
        // bind the view's projection
        geolocation.bindTo('projection', view);
        // when we get a position update, add the coordinate to the track's
        // geometry and recenter the view
        geolocation.on('change:position', function () {
            var coordinate = geolocation.getPosition();
            var direction = geolocation.getHeading();
            view.setCenter(coordinate);
            document.getElementById('latit').innerText = coordinate;
            document.getElementById('longit').innerText = 'Heading ' + direction + ' Altitude ' + geolocation.getAltitude();
            document.getElementById('spd').innerText = 'Accuracy ' + geolocation.getAccuracy() + 'm Speed ' + geolocation.getSpeed();
            trackFeature.getGeometry().appendCoordinate(coordinate);
        });
        // put a marker at our current position
        var marker = new ol.Overlay({
            element: document.getElementById('location'),
            positioning: 'center-center'
        });
        map.addOverlay(marker);
        marker.bindTo('position', geolocation);
        // rotate the view to match the device orientation
        var deviceOrientation = new ol.DeviceOrientation({
            tracking: true
        });
        deviceOrientation.on('change:heading', onChangeHeading);
        function onChangeHeading(event) {
            var heading = event.target.getHeading();
            view.setRotation(-heading);
        }

    </script>
</asp:Content>
