import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class User with ChangeNotifier, DiagnosticableTreeMixin {
  String _displayName;
  String _email;
  String _photoUrl;
  double _height;
  double _weight;
  int _age;

  String get displayName => _displayName;
  String get email => _email;
  String get photoUrl => _photoUrl;
  double get height => _height;
  double get weight => _weight;
  int get age => _age;

  set displayName(String value) {
    _displayName = value;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    // TODO: implement debugFillProperties
    super.debugFillProperties(properties);
    properties.add(StringProperty('displayName', displayName));
    properties.add(StringProperty('email', email));
    properties.add(StringProperty("photoUrl", photoUrl));
    properties.add(DoubleProperty('height', height));
    properties.add(DoubleProperty('weight', weight));
    properties.add(IntProperty('age', age));
  }

  fromJson(Map<String, dynamic> json) {
    _displayName = json['displayName'];
    _email = json['email'];
    _height = json['height'] ?? 0;
    _weight = json['weight'] ?? 0;
    _photoUrl = json['photoUrl'];
    _age = json['age'] ?? 0;
  }

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set height(double value) {
    _height = value;
    notifyListeners();
  }

  set weight(double value) {
    _weight = value;
    notifyListeners();
  }

  set age(int value) {
    _age = value;
    notifyListeners();
  }

  set photoUrl(String value) {
    _photoUrl = value;
    notifyListeners();
  }

  Future upUserHeight(double height) async {
    var value = await FirebaseFirestore.instance.collection(email).add({
      "displayName": displayName,
      "email": email,
      "photoUrl": photoUrl,
      "height": height,
      "weight": weight,
      "age": age,
    });
    var data = await value.get();
    fromJson(data.data());
    notifyListeners();
  }

  Future upUserWeight(double weight) async {
    var value = await FirebaseFirestore.instance.collection(email).add({
      "displayName": displayName,
      "email": email,
      "photoUrl": photoUrl,
      "height": height,
      "weight": weight,
      "age": age,
    });
    var data = await value.get();
    fromJson(data.data());
    notifyListeners();
  }

  Future upUser(double height, double weight, int age) async {
    try {
      var snapShot = await FirebaseFirestore.instance.collection(email).get();
      await snapShot.docs.first.reference.update({
        "height": height,
        "weight": weight,
        "age": age,
      });
      _weight = weight;
      _height = height;
      _age = age;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future upUserAge(int age) async {
    var value = await FirebaseFirestore.instance.collection(email).add({
      "displayName": displayName,
      "email": email,
      "photoUrl": photoUrl,
      "height": height,
      "weight": weight,
      "age": age,
    });
    var data = await value.get();
    fromJson(data.data());
    notifyListeners();
  }

  void initUser(String displayName, String email, String photoUrl) async {
    var querySnapshot =
        await FirebaseFirestore.instance.collection(email).get();
    if (querySnapshot != null && querySnapshot.docs.isNotEmpty) {
      fromJson(querySnapshot.docs.last.data());
      notifyListeners();
    } else {
      FirebaseFirestore.instance.collection(email).add({
        "displayName": displayName,
        "email": email,
        "photoUrl": photoUrl,
      }).then((value) async {
        var data = await value.get();
        fromJson(data.data());
        notifyListeners();
        print('${value.toString()}');
      }).catchError((e) {
        print('${e.toString()}');
      });
    }
    // notifyListeners();
  }
}
