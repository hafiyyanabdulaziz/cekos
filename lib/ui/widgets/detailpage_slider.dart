part of 'widgets.dart';

// ignore: must_be_immutable
class DetailPageSlider extends StatefulWidget {
  List<String> dataPhotos;

  DetailPageSlider({@required this.dataPhotos});
  @override
  _DetailPageSliderState createState() => _DetailPageSliderState();
}

class _DetailPageSliderState extends State<DetailPageSlider> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(
        children: [
          Builder(
            builder: (context) {
              final double height = MediaQuery.of(context).size.height * 0.5;
              return CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  height: height,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        _current = index;
                      },
                    );
                  },
                ),
                items: widget.dataPhotos.map((item) {
                  return GestureDetector(
                    onTap: () {
                      print('Halo Ini foto dipencet');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PhotoFullScreen(item);
                          },
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'imageHero',
                      child:
                          Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    ),
                    // Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  );
                }).toList(),
              );
            },
          ),

          //TITIK-TITIK
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: widget.dataPhotos.map(
                    (data) {
                      int index = widget.dataPhotos.indexOf(data);
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Color.fromRGBO(255, 255, 255, 0.9)
                              : Color.fromRGBO(255, 255, 255, 0.4),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
