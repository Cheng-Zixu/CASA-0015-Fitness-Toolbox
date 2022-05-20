import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_toolbox/model/user.dart';
import 'package:fitness_toolbox/model/exercise.dart';
import 'package:fitness_toolbox/pages/home_page.dart';
import 'package:fitness_toolbox/pages/splash_page.dart';
import 'package:fitness_toolbox/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => User()),
      ChangeNotifierProvider(create: (_) => ExerciseModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Toolbox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        "login_in": (BuildContext context) => LoginPage(),
        "home": (BuildContext context) => HomePage(),
      },
      home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SplashPage();
            }
            return FullScreenText(text: "Loading...");
          }),
    );
  }
}

class FullScreenText extends StatelessWidget {
  final String text;

  const FullScreenText({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Column(children: [Expanded(child: Center(child: Text(text)))]));
  }
}
