<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LiveGpsTrack._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<%--    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />--%>
    <div class="jumbotron w3-display-container">
        <a class="mySlides" href="http://localhost:49882/GpsTrack">
            <img border="0" src="Img/1.jpg" style="width: 100%">
        </a>
        <a class="mySlides" href="https://www.w3schools.c">
            <img border="0" src="/Img/2.jpg" style="width: 100%">
        </a>
        <a class="mySlides" href="https://www.w3schools.co">
            <img border="0" src="/Img/3.jpg" style="width: 100%">
        </a>
        <button type="button" class="jumbotron-btn-left <%--w3-button w3-display-left--%>" onclick="plusDivs(-1);">&#10094;</button>
        <button type="button" class="jumbotron-btn-right <%--w3-button w3-display-right--%>" onclick="plusDivs(+1)">&#10095;</button>

        <h1 class="w3-display-bottomright" style="color:rgba(255, 255, 255, 0.5)">LiveINsport</h1>
       
    </div>
    <script>
            var time = true;
        var myIndex = 0;

        ShowDiv();
        function plusDivs(n) {
            ShowDivs(myIndex += n);
            time = false;
            setTimeout(time = true, 5000);
        }
        function ShowDivs(n) {
            var i;
            var x = document.getElementsByClassName("mySlides");
            if (n > x.length - 1) { myIndex = 0 }
            if (n < 0) { myIndex = x.length - 1 };
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            x[myIndex].style.display = "block";
        }
        function ShowDiv() {
            var i;
            var x = document.getElementsByClassName("mySlides");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            myIndex++;
            if (myIndex > x.length - 1) {
                myIndex = 0
            }
            x[myIndex].style.display = "block";
            if (time) {
                setTimeout(ShowDiv, 5000); // Change image every 5 seconds
            }
        }
    </script>
    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                You can specify an interesting activity for you 
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Live MAP view</h2>
            <p>
                You can easily search an interesting event nearby on the map view.
            </p>
            <p>
                <a class="btn btn-default" href="http://localhost:49882/LiveMap">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
