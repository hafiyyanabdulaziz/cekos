part of 'pages.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SliderLogin(),
          Positioned(
            bottom: 80.0,
            left: 22.0,
            right: 22.0,
            child: Container(
              height: 50,
              child: SignInButton(
                Buttons.Google,
                onPressed: () {
                  CekosGoogleSignIn.signInWithGoogle().then((result) {
                    if (result != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return MainPage();
                          },
                        ),
                      );
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
