part of 'pages.dart';

class PhotoFullScreen extends StatefulWidget {
  final String photoURL;
  PhotoFullScreen(this.photoURL);
  @override
  _PhotoFullScreenState createState() => _PhotoFullScreenState();
}

class _PhotoFullScreenState extends State<PhotoFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(
        heroAttributes: PhotoViewHeroAttributes(tag: 'imageHero'),
        onTapUp: (context, _, controllerValue) => Navigator.pop(context),
        imageProvider: NetworkImage(
          widget.photoURL,
        ),
      ),
    );
  }
}
