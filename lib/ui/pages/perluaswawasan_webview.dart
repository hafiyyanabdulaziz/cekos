part of 'pages.dart';

// ignore: must_be_immutable
class PerluasWawasanWebView extends StatelessWidget {
  String link;
  PerluasWawasanWebView({@required String link}) {
    this.link = link;
  }

  /* final String selectedUrl; */

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  /* PerluasWawasanWebView({
    @required this.selectedUrl,
  }); */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF23243B),
        title: Text('Perluas Wawasan'),
      ),
      body: WebView(
        initialUrl: link,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
