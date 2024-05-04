// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsScreen extends StatefulWidget {
const MapsScreen({Key? key}) : super(key: key);

@override
State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  List<Marker> marker = [
    Marker(
      point: LatLng(-6.9028626, 107.6661486),
      width: 80,
      height: 80,
      builder: (context) => FlutterLogo(),
    ),
  ];
  
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text("Dashboard"),
actions: const [],
),
body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: FlutterMap(
                options: MapOptions(
                  onTap: (tapPosition, point) {
                    setState(() {
                      marker.add(
                        Marker(
                          point: LatLng(point.latitude, point.longitude),
                          width: 80,
                          height: 80,
                          builder: (context) => FlutterLogo(),
                        ),
                      );
                    });

                    print("kamu nge klik posisi latlng $point");
                  },
                  center: LatLng(-6.9028626, 107.6661486),
                  zoom: 18,
                ),
                nonRotatedChildren: [
                  RichAttributionWidget(attributions: [
                    TextSourceAttribution(
                      'OpenStreetMap contributors',
                      onTap: () => launchUrl(
                          Uri.parse('https://openstreetmap.org/copyright')),
                    ),
                  ])
                ],
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: marker,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
);
}
}
