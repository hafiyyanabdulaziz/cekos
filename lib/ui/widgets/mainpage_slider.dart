part of 'widgets.dart';

class MainPageSlider extends StatefulWidget {
  @override
  _MainPageSliderState createState() => _MainPageSliderState();
}

class _MainPageSliderState extends State<MainPageSlider> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      child: Stack(
        children: [
          Builder(
            builder: (context) {
              final double height = MediaQuery.of(context).size.height * 0.65;
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
                items: mainPageSlider,
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
                  children: dataMainPageSlider.map(
                    (data) {
                      int index = dataMainPageSlider.indexOf(data);
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

  final List<Widget> mainPageSlider = dataMainPageSlider
      .map(
        (item) => Stack(
          children: <Widget>[
            Image.network(item.link, fit: BoxFit.cover, width: 1000.0),
            Container(
              margin: EdgeInsets.only(left: 22, right: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      item.judul,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 30,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                            color: const Color(0xff000000),
                            offset: Offset(4, 4),
                            blurRadius: 8,
                          )
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Text(
                      item.deskripsi,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 15,
                        color: const Color(0xffffffff),
                        shadows: [
                          Shadow(
                            color: const Color(0xff000000),
                            offset: Offset(4, 4),
                            blurRadius: 8,
                          )
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Color(0xffaf8d19),
                    child: Text(
                      'Selengkapnya',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
      .toList();
}
