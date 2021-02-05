part of 'pages.dart';

// ignore: must_be_immutable
class Lokasi extends StatefulWidget {
  double lat;
  double lng;

  Lokasi({
    this.lat,
    this.lng,
  });
  @override
  _LokasiState createState() => _LokasiState();
}

class _LokasiState extends State<Lokasi> {
  MapboxMapController controllerMapBox;
  //final LatLng center = const LatLng(32.080664, 34.9563837);

  void onMapCreated(MapboxMapController controller) {
    this.controllerMapBox = controller;
  }

  void onStyleLoaded(MapboxMapController controller) {
    controller.addSymbol(
      SymbolOptions(
        geometry: LatLng(
          widget.lat,
          widget.lng,
        ),
        iconImage: "lib/assets/images/maps/marker.png",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lokasi'),
        centerTitle: true,
        backgroundColor: Color(0xFF23243B),
      ),
      body: Stack(
        children: [
          MapboxMap(
            compassEnabled: false,
            //tiltGesturesEnabled: false,
            myLocationEnabled: false,
            //zoomGesturesEnabled: false,
            accessToken:
                'pk.eyJ1IjoiaGFmaXl5YW5hYmR1bGF6aXoiLCJhIjoiY2trcmt5aWZoMDE3YjJucWZ4NW5kcDR3cyJ9.meyD9GfXFecIiq-Yl65pRQ',
            onMapCreated: onMapCreated,
            onStyleLoadedCallback: () => onStyleLoaded(controllerMapBox),
            initialCameraPosition: CameraPosition(
              target: LatLng(
                widget.lat,
                widget.lng,
              ),
              zoom: 15.0,
            ),
            // gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
            //   Factory<OneSequenceGestureRecognizer>(
            //     () => ScaleGestureRecognizer(),
            //   ),
            // ].toSet(),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            padding: EdgeInsets.all(5),
            //color: Colors.amber,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff23243b),
            ),
            child: Center(
              child: Text(
                'Detail lokasi akan diberitahukan ketika survey',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  //fontSize: 20,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
