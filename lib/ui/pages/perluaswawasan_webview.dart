part of 'pages.dart';

class PerluasWawasanWebView extends StatelessWidget {
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
        title: Text('Perluas Wawasan'),
      ),
      body: WebView(
        initialUrl: 'https://www.kitahukomputer.com',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
