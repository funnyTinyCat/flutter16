import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  TextStyle getDefaultTextStyle() {

    return const TextStyle(
      fontSize: 32,
      backgroundColor: Colors.black,
      color: Colors.white,
    );
  }

  Container buildTextWidget(String word) {

    return Container(
      alignment: Alignment.center,
      child: Text(
        word, 
        textAlign: TextAlign.center,
        style: getDefaultTextStyle(),
      ),
    );
  }

  Marker buildMarker(LatLng coordinates, String word) {

    return Marker(
      point: coordinates,
      width: 1100,
      height: 32,
      child: buildTextWidget(word),
    //  child: child
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(44.53284100, 18.67050000),
              initialZoom: 3.2,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                urlTemplate: 'https://tile.stamen.com/terrain-background/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.map_app03',
              ),
              // MarkerLayer(markers: [
              //     buildMarker(LatLng(44.53284100, 18.67050000), "Tuzla"),
              //     buildMarker(LatLng(41.902782, 12.496366), "Rim"),
              //     buildMarker(LatLng(40.416775, -3.703790), "Madrid"),
              //   ], 
              // ),
              
              //           LatLng(41.902782, 12.496366),
              //           LatLng(40.416775, -3.703790),, word)
              // MarkerLayer(
              //   markers: [
              //     Marker(
              //       point: LatLng(44.53284100, 18.67050000),
              //       width: 80,
              //       height: 80,
              //       child: Icon(
              //         Icons.flutter_dash,
              //         size: 80,
              //       ),
              //     ),
              //   ],
              // ),
              // CircleLayer(
              //   circles: [
              //       CircleMarker(
              //         point: LatLng(44.53284100, 18.67050000), 
              //         radius: 155000,
              //         useRadiusInMeter: true,
              //         color: Colors.red.withOpacity(0.4),
              //         borderColor: Colors.red.withOpacity(0.6),
              //         borderStrokeWidth: 2,
              //       ),
              //     ],
              //   ),
              // PolylineLayer(
              //   polylines: [
              //     Polyline(
              //     points: [
              //           LatLng(44.53284100, 18.67050000),
              //           LatLng(41.902782, 12.496366),
              //           LatLng(40.416775, -3.703790),
              //       ],
              //       color: Colors.blue,
              //       strokeWidth: 2,
              //     ),
              //   ],
              // ),
              PolygonLayer(
                polygons: [
                  Polygon(
                    points: [
                      LatLng(44.53284100, 18.67050000),
                      LatLng(50.53284100, 18.67050000),
                      LatLng(50.53284100, 15.67050000),
                      LatLng(44.53284100, 15.67050000),
                    ],
                    color: Colors.blue.withOpacity(0.3),
//                    borderStrokeWidth: 2,
//                    borderColor: Colors.blue,
                    isFilled: true,

                  ),
                ]
              ),
            ],
          )
        ],
      ),


    );
  }
}
