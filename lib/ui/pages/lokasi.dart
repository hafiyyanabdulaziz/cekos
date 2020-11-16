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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lokasi'),
        centerTitle: true,
        backgroundColor: Color(0xFF23243B),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.lat, widget.lng),
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId("1"),
            position: LatLng(widget.lat, widget.lng),
            icon: BitmapDescriptor.defaultMarker,
          )
        },
        zoomControlsEnabled: false,
        mapToolbarEnabled: false,
      ),
    );
  }
}
