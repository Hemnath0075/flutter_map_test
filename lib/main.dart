import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapApp(),
    );
  }
}

class MapApp extends StatefulWidget {
  @override
  _MapAppState createState() => _MapAppState();
}

class _MapAppState extends State<MapApp> {
  double long = 49.5;
  double lat = -0.09;
  // LatLngBounds point = LatLngBounds();
  LatLng point = LatLng(12.990927, 80.231328);
  var location = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            center: LatLng(12.990927, 80.231328),
            zoom: 5.0,
          ),
          children: [
            TileLayer(
                urlTemplate:
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayer(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: point,
                  builder: (ctx) => Container(
                    child: ModelViewer(
                      src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
                      alt: "A 3D model of an astronaut",
                      // ar: true,
                      touchAction: TouchAction.none,
                      orientation: '2 2 2',
                      autoRotate: false,
                      // cameraControls: true,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        // ModelViewer(
        //   src: 'assets/vehicle.glb',
        //   alt: "A 3D model of an astronaut",
        //   ar: true,
        //   autoRotate: true,
        //   cameraControls: true,
        // ),
      ],
    );
  }
}

