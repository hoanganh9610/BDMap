<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #map {
            width: 1690px;
            height: 900px;
        }

        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .mb-4, .my-4 {
            margin-bottom: unset !important;
        }

        .pac-container {
            z-index: 10000 !important;
            font-family: Arial, sans-serif;
        }
    </style>
    <div id="map"></div>
    <div id="infowindow-content">
        <span id="place-name" class="title"></span>
        <br>
        <strong>Place ID:</strong> <span id="place-id"></span>
        <br>
        <span id="place-address"></span>
    </div>
    <script>
        var k = 0;
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 10.980304, lng: 106.674457 },
                zoom: 13
            });

            var input = document.getElementById('txtSearch');

            var autocomplete = new google.maps.places.Autocomplete(input);
            autocomplete.bindTo('bounds', map);


            // Specify just the place data fields that you need.
            autocomplete.setFields(['place_id', 'geometry', 'name']);

            var infowindow = new google.maps.InfoWindow();
            var infowindowContent = document.getElementById('infowindow-content');
            infowindow.setContent(infowindowContent);

            var marker = new google.maps.Marker({ map: map });

            marker.addListener('click', function () {
                infowindow.open(map, marker);
            });

            autocomplete.addListener('place_changed', function () {
                infowindow.close();

                var place = autocomplete.getPlace();

                if (!place.geometry) {
                    return;
                }

                if (place.geometry.viewport) {
                    map.fitBounds(place.geometry.viewport);
                } else {
                    map.setCenter(place.geometry.location);
                    map.setZoom(17);
                }

                // Set the position of the marker using the place ID and location.
                marker.setPlace({
                    placeId: place.place_id,
                    location: place.geometry.location
                });

                marker.setVisible(true);

                infowindowContent.children['place-name'].textContent = place.name;
                infowindowContent.children['place-id'].textContent = place.place_id;
                infowindowContent.children['place-address'].textContent =
                    place.formatted_address;
                infowindow.open(map, marker);
            });
            var infowindow = new google.maps.InfoWindow();
            function search(autocomplete) {
                
                
                var marker = new google.maps.Marker({
                    map: map
                });
                
                
                marker.setVisible(true);
                marker.addListener('click', function () {
                    infoWindow.open(map, marker);
                });
            }
            var start = document.getElementById('InputFrom');
            var searchBoxStart = new google.maps.places.SearchBox(start);

            var end = document.getElementById('InputTo');
            var searchBoxEnd = new google.maps.places.SearchBox(end);


            var directionsDisplay = new google.maps.DirectionsRenderer;
            var directionsService = new google.maps.DirectionsService;

            var travelMode = "";

            document.getElementById('iconChiDuong').style.background = '#4169E1';
            travelMode = "DRIVING";

            document.getElementById('iconChiDuong').addEventListener('click', function () {
                travelMode = "DRIVING"
                document.getElementById('iconChiDuong').style.background = '#4169E1';
                document.getElementById('iconOto').style.background = '';
                document.getElementById('iconXebus').style.background = '';
                document.getElementById('iconDibo').style.background = '';
                document.getElementById('iconXedap').style.background = '';

                directionsDisplay.setMap(map);
                directionsDisplay.setPanel(document.getElementById('huongdan'));
                calculateAndDisplayRoute(directionsService, directionsDisplay, travelMode);
            });
            document.getElementById('iconOto').addEventListener('click', function () {
                travelMode = "DRIVING";
                document.getElementById('iconChiDuong').style.background = '';
                document.getElementById('iconOto').style.background = '#4169E1';
                document.getElementById('iconXebus').style.background = '';
                document.getElementById('iconDibo').style.background = '';
                document.getElementById('iconXedap').style.background = '';

                directionsDisplay.setMap(map);
                directionsDisplay.setPanel(document.getElementById('huongdan'));
                calculateAndDisplayRoute(directionsService, directionsDisplay, travelMode);
            });
            document.getElementById('iconXebus').addEventListener('click', function () {
                travelMode = "TRANSIT";
                document.getElementById('iconChiDuong').style.background = '';
                document.getElementById('iconOto').style.background = '';
                document.getElementById('iconXebus').style.background = '#4169E1';
                document.getElementById('iconDibo').style.background = '';
                document.getElementById('iconXedap').style.background = '';

                directionsDisplay.setMap(map);
                directionsDisplay.setPanel(document.getElementById('huongdan'));
                calculateAndDisplayRoute(directionsService, directionsDisplay, travelMode);
            });
            document.getElementById('iconDibo').addEventListener('click', function () {
                travelMode = "WALKING";
                document.getElementById('iconChiDuong').style.background = '';
                document.getElementById('iconOto').style.background = '';
                document.getElementById('iconXebus').style.background = '';
                document.getElementById('iconDibo').style.background = '#4169E1';
                document.getElementById('iconXedap').style.background = '';

                directionsDisplay.setMap(map);
                directionsDisplay.setPanel(document.getElementById('huongdan'));
                calculateAndDisplayRoute(directionsService, directionsDisplay, travelMode);
            });
            document.getElementById('iconXedap').addEventListener('click', function () {
                travelMode = "DRIVING";
                document.getElementById('iconOto').style.background = '';
                document.getElementById('iconXebus').style.background = '';
                document.getElementById('iconDibo').style.background = '';
                document.getElementById('iconXedap').style.background = '#4169E1';

                directionsDisplay.setMap(map);
                directionsDisplay.setPanel(document.getElementById('huongdan'));
                calculateAndDisplayRoute(directionsService, directionsDisplay, travelMode);
            });

            directionsDisplay.setMap(map);
            directionsDisplay.setPanel(document.getElementById('huongdan'));

            var start_autocomplete = new google.maps.places.Autocomplete(start);
            start_autocomplete.bindTo('bounds', map);
            var end_autocomplete = new google.maps.places.Autocomplete(end);
            end_autocomplete.bindTo('bounds', map);

            function calculateAndDisplayRoute(directionsService, directionsDisplay, travelMode) {
                map.setZoom(12);
                var origin = null;
                var des = end_autocomplete.getPlace();
                if (k === 1) {
                    if (kt === 1) {
                        origin = getPlace;
                        directionsService.route({
                            origin: { placeId: origin.place_id },
                            destination: { placeId: des.place_id },
                            travelMode: travelMode
                        }, function (response, status) {
                            if (status === 'OK') {
                                directionsDisplay.setDirections(response);
                            }
                        });
                    }
                    else if (kt === 0) {
                        origin = positionStart
                        directionsService.route({
                            origin: origin,
                            destination: { placeId: des.place_id },
                            travelMode: travelMode
                        }, function (response, status) {
                            if (status === 'OK') {
                                directionsDisplay.setDirections(response);
                            }
                        });
                    }

                }
                else if (k === 0) {
                    origin = start_autocomplete.getPlace();
                    directionsService.route({
                        origin: { placeId: origin.place_id },
                        destination: { placeId: des.place_id },
                        travelMode: travelMode
                    }, function (response, status) {
                        if (status === 'OK') {
                            directionsDisplay.setDirections(response);
                        }
                    });
                }

            }
            start_autocomplete.addListener('place_changed', function () {
                search(start_autocomplete);
                calculateAndDisplayRoute(directionsService, directionsDisplay, travelMode);
            });
            end_autocomplete.addListener('place_changed', function () {
                search(end_autocomplete);
                calculateAndDisplayRoute(directionsService, directionsDisplay, travelMode);
            });

        }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCXSz1F7B7igDLX7pDVDl6p6NLRjz32qDQ&libraries=places&callback=initMap" async defer></script>

</asp:Content>
