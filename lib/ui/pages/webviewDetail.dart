part of 'pages.dart';

class WebviewDetail extends StatelessWidget {
  final String link;
  final String textAppBar;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  WebviewDetail({Key key, @required this.link, @required this.textAppBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF23243B),
        title: Text(textAppBar),
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
