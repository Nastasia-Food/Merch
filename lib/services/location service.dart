import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:foodbank_marchantise_app/utils/font_size.dart';
import 'package:foodbank_marchantise_app/utils/theme_colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'goofle_map_api.dart';

class LocationTracking extends StatefulWidget {
  const LocationTracking({Key? key}) : super(key: key);

  @override
  _LocationTrackingState createState() => _LocationTrackingState();
}

class _LocationTrackingState extends State<LocationTracking> {
  LatLng sourceLocation = LatLng(28.432864, 77.002563);
  LatLng destinationLatlng = LatLng(23.8122, 90.3469);

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _marker = Set<Marker>();

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints? polylinePoints;

  StreamSubscription<LocationData>? subscription;

  LocationData? currentLocation;
  LocationData? destinationLocation;
  Location? location;

  @override
  void initState() {
    super.initState();

    location = Location();

    polylinePoints = PolylinePoints();

    subscription = location!.onLocationChanged.listen((clocation) {
      currentLocation = clocation;

      print("..................................................$clocation");

      updatePinsOnMap();
    });

    setInitialLocation();
  }

  void setInitialLocation() async {
    await location!.getLocation().then((value) {
      setState(() {
        currentLocation = value;
      });
    });

    destinationLocation = LocationData.fromMap({
      "latitude": destinationLatlng.latitude,
      "longitude": destinationLatlng.longitude,
    });
  }

  void showLocationPins() {
    var sourceposition = LatLng(
        currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

    _marker.add(Marker(
      markerId: MarkerId('sourcePosition'),
      position: sourceposition,
    ));

    var destinationposition = LatLng(destinationLocation!.latitude ?? 0.0,
        destinationLocation!.longitude ?? 0.0);

    _marker.add(Marker(
      markerId: MarkerId('destinationPosition'),
      position: destinationposition,
    ));

    setPolylinesInMap();
  }

  void setPolylinesInMap() async {
    var result = await polylinePoints!.getRouteBetweenCoordinates(
      //api key
      GoogleMapApi().url,
      PointLatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),

      PointLatLng(destinationLatlng.latitude, destinationLatlng.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((pointLatLng) {
        polylineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }

    setState(() {
      _polylines.add(Polyline(
        polylineId: PolylineId('polyline'),
        patterns: [PatternItem.dash(10), PatternItem.gap(10)],
        color: Colors.red,
        visible: true,
        points: polylineCoordinates,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        width: 5,
      ));
    });
  }

  void updatePinsOnMap() async {
    CameraPosition cameraPosition = CameraPosition(
      zoom: 20,
      tilt: 80,
      bearing: 30,
      target: LatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
    );

    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    setState(() {
      var sourcePosition = LatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

      var destinationPosition = LatLng(destinationLocation!.latitude ?? 0.0,
          destinationLocation!.longitude ?? 0.0);

      _marker.removeWhere((marker) => marker.mapsId.value == 'sourcePosition');
      print(currentLocation!.latitude);
      print(currentLocation!.latitude);
      _marker.add(Marker(
        markerId: MarkerId('sourcePosition'),
        infoWindow: InfoWindow(title: 'inilabs'),
        position: sourcePosition,
      ));

      print(destinationLocation!.latitude);
      _marker.add(Marker(
        markerId: MarkerId('destinationPosition'),
        infoWindow: InfoWindow(title: 'Monipur'),
        position: destinationPosition,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: 16,
      tilt: 80,
      bearing: 30,
      target: currentLocation != null
          ? LatLng(currentLocation!.latitude ?? 0.0,
              currentLocation!.longitude ?? 0.0)
          : LatLng(0.0, 0.0),
    );

    return currentLocation == null
        ? Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Get Direction",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: FontSize.xLarge,
                      color: ThemeColors.scaffold_bg_Color),
                ),
                backgroundColor: Colors.white54,
                centerTitle: true,
                elevation: 0.0,
              ),
              body: GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                // compassEnabled: true,
                markers: _marker,
                polylines: _polylines,
                mapType: MapType.normal,
                initialCameraPosition: initialCameraPosition,
                onMapCreated: (GoogleMapController? controller) {
                  _controller.complete(controller);

                  showLocationPins();
                },
              ),
            ),
          );
  }

  @override
  void dispose() {
    subscription!.cancel();
    super.dispose();
  }
}
