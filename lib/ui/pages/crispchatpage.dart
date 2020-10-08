part of 'pages.dart';

class CrispChatPage extends StatefulWidget {
  @override
  _CrispChatPageState createState() => _CrispChatPageState();
}

class _CrispChatPageState extends State<CrispChatPage> {
  @override
  void initState() {
    super.initState();

    crisp.initialize(
      websiteId: '833d1569-3130-4ff3-8846-4245931f7daf',
      locale: 'ID-ID',
    );

    crisp.register(
      CrispUser(
        email: "hafiyyan.123@gmail.com",
        avatar: 'https://avatars2.githubusercontent.com/u/16270189?s=200&v=4',
        nickname: "Vanty",
        phone: "5511987654321",
      ),
    );

    //crisp.setMessage("Hello world");
  }

  @override
  Widget build(BuildContext context) {
    return CrispView(
      loadingWidget: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
