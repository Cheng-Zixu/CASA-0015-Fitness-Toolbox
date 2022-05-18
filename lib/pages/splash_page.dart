import 'package:fitness_toolbox/model/user.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:provider/provider.dart';

import '../model/exercise.dart';

class SplashPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SplashPage();

}
class _SplashPage extends State<SplashPage> {
  Future<void> _initialization;


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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),() async {
      _signIn();
    });

  }

  Future<void> _signIn() async {
    await _ensureInitialized();
    try {
      final GoogleSignInUserData newUser =
      await GoogleSignInPlatform.instance.signInSilently();
      _setUser(newUser);
    } catch (e) {
      Navigator.of(context).pushReplacementNamed("login_in");
    }

  }

  void _setUser(GoogleSignInUserData user) {

    if (user != null) {
      Provider.of<User>(context,listen: false).initUser(user.displayName, user.email, user.photoUrl);
      Provider.of<ExerciseModel>(context,listen: false).fetch(user.email);
      Navigator.of(context).pushReplacementNamed("home");
    } else {
      Navigator.of(context).pushReplacementNamed("login_in");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/splash.jpg'),
          )
        ),
        child: Center(
          child: Text("FITNESS TOOLBOX", style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),),
        ),
      );
    });
  }

}