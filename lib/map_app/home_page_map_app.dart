// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:latlong2/latlong.dart';

// class HomePageMapApp extends StatefulWidget {
//   const HomePageMapApp({super.key});

//   @override
//   State<HomePageMapApp> createState() => _HomePageMapAppState();
// }

// class _HomePageMapAppState extends State<HomePageMapApp> {
//   MapController _mapController = MapController();

//   List<Marker> markers = [];

//   Future<void> determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     Position position = await Geolocator.getCurrentPosition();

//     _mapController.move(LatLng(position.latitude, position.longitude), 14);

//     _mapController.move(LatLng(position.latitude, position.longitude), 10);
//     markers.add(
//       Marker(
//         point: LatLng(position.latitude, position.longitude),
//         builder: (context) => Icon(
//           Icons.location_on,
//           color: Colors.blue,
//           size: 50,
//         ),
//       ),
//     );
//   }

//   @override
//   void initState() {
//     determinePosition();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: FlutterMap(
//           mapController: _mapController,
//           options: MapOptions(
//             center: LatLng(35.730527, 51.8462604),
//             zoom: 14,
//             onTap: (tapPosition, point) {
//               if (markers.length > 1) {
//                 markers.clear();
//               } else {
//                 markers.add(
//                   Marker(
//                     point: point,
//                     builder: (context) => Icon(
//                       Icons.location_on,
//                       color: markers.length == 1 ? Colors.blue : Colors.red,
//                       size: 50,
//                     ),
//                   ),
//                 );
//               }

//               setState(() {});
//             },
//           ),
//           children: [
//             TileLayer(
//               urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//             ),
//             MarkerLayer(
//               markers: markers,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
