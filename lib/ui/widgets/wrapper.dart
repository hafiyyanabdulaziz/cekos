part of 'widgets.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool isUser = false;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  void _initCheck() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getString('user_uid') != null) {
      isUser = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return isUser ? ButtonNavigationBarPage() : SignInPage();
  }
}
