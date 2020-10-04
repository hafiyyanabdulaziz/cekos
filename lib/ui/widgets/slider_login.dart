part of 'widgets.dart';

class SliderLogin extends StatefulWidget {
  @override
  _SliderLoginState createState() => _SliderLoginState();
}

class _SliderLoginState extends State<SliderLogin> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Builder(
            builder: (context) {
              final double height = MediaQuery.of(context).size.height;
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
                items: imageSliders,
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: dataLogin.map(
                  (data) {
                    int index = dataLogin.indexOf(data);
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 25.0, horizontal: 2.0),
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
        ],
      ),
    );
  }
}

final List<Widget> imageSliders = dataLogin
    .map(
      (item) => Stack(
        children: <Widget>[
          Image.network(item.link, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            left: 22.0,
            right: 22.0,
            top: 70.00,
            child: Container(
              child: Text(
                item.judul,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            left: 22.0,
            right: 22.0,
            top: 230.00,
            child: Container(
              child: Text(
                item.deskripsi,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    )
    .toList();
