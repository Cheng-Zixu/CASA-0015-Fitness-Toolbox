import 'package:fitness_toolbox/model/user.dart';
import 'package:fitness_toolbox/model/exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  Future<void> _initialization;

  @override
  void initState() {
    super.initState();
    _signIn();
  }

  Future<void> _ensureInitialized() {
    return _initialization ??= GoogleSignInPlatform.instance.init(
      scopes: <String>[
        'email',
        // 'https://www.googleapis.com/auth/contacts.readonly',
      ],
    )..catchError((dynamic _) {
        _initialization = null;
      });
  }

  void _setUser(GoogleSignInUserData user) {
    if (user != null) {
      // _handleGetContact(user);
      Provider.of<User>(context, listen: false)
          .initUser(user.displayName, user.email, user.photoUrl);
      Provider.of<ExerciseModel>(context, listen: false).fetch(user.email);
      Navigator.of(context).pushReplacementNamed("home");
    }
  }

  Future<void> _signIn() async {
    await _ensureInitialized();
    final GoogleSignInUserData newUser =
        await GoogleSignInPlatform.instance.signInSilently();
    _setUser(newUser);
  }

  Future<void> _handleSignIn() async {
    try {
      await _ensureInitialized();
      _setUser(await GoogleSignInPlatform.instance.signIn());
    } catch (error) {
      final bool canceled =
          error is PlatformException && error.code == 'sign_in_canceled';
      if (!canceled) {
        print(error);
      }
    }
  }

  Future<void> _handleSignOut() async {
    await _ensureInitialized();
    await GoogleSignInPlatform.instance.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.7), BlendMode.dstATop),
          image: AssetImage('assets/images/splash.jpg'),
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Text(
                  "FITNESS TOOLBOX",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: _handleSignIn,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        'Google Sign In',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                )
              ],
            )));
  }
}
