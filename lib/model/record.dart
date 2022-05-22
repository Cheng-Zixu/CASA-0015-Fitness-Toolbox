import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Exercise {
  String _email;
  String _date;
  int _seconds;
  String _name;
  int _weight;
  int _calories;
  int _type;

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get date => _date.substring(0, 19);

  set date(String value) {
    _date = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get seconds => _seconds;

  set seconds(int value) {
    _seconds = value;
  }

  int get weight => _weight;

  set weight(int value) {
    _weight = value;
  }

  int get type => _type;

  set type(int value) {
    _type = value;
  }

  Exercise.fromJson(Map<String, dynamic> json) {
    _date = json['date'];
    _email = json['email'];
    _seconds = json['seconds'] ?? 0;
    _name = json['name'] ?? 0;
    _weight = json['weight'] ?? 0;
    _calories = json['calories'] ?? 0;
    _type = json['type'] ?? 1;
  }

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   // TODO: implement debugFillProperties
  //   super.debugFillProperties(properties);
  //   properties.add(StringProperty('email', email));
  //   properties.add(StringProperty('date', date));
  //   properties.add(StringProperty('name', name));
  //   properties.add(IntProperty('seconds', seconds));
  //   properties.add(IntProperty('weight', weight));
  //   properties.add(IntProperty('calories', calories));
  //   properties.add(IntProperty('type', type));
  //
  // }

  int get calories => _calories;

  set calories(int value) {
    _calories = value;
  }

  fromJson(Map<String, dynamic> json) {
    _date = json['date'];
    _email = json['email'];
    _seconds = json['seconds'] ?? 0;
    _name = json['name'] ?? 0;
    _weight = json['weight'] ?? 0;
    _calories = json['calories'] ?? 0;
    _type = json['type'] ?? 0;
  }
}

class ExerciseModel with ChangeNotifier, DiagnosticableTreeMixin {
  List<Exercise> data = [];
  int kcal = 0;
  int time = 0;
  String today = DateTime.now().toString().substring(0, 10);

  fetch(String email) async {
    time = 0;
    kcal = 0;
    data.clear();
    var querySnapshot =
        await FirebaseFirestore.instance.collection('${email}_exercise').get();
    if (querySnapshot != null && querySnapshot.docs.isNotEmpty) {
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        Exercise item = Exercise.fromJson(querySnapshot.docs[i].data());
        data.add(item);
        if (item._date.substring(0, 10) != today) continue;
        if ((item?.type ?? 1) == 1) {
          time = time + (item?.seconds ?? 0);
        } else {
          kcal = kcal + (item?.calories ?? 0);
        }
      }
      notifyListeners();
    }
    data.sort((a, b) => b._date.compareTo(a._date));
  }

  addExercise(String email, _date, _name, int _seconds) async {
    var value =
        await FirebaseFirestore.instance.collection('${email}_exercise').add({
      "email": email,
      "date": _date,
      "name": _name,
      "seconds": _seconds,
      "type": 1,
    });
    var myData = await value.get();
    data.add(Exercise.fromJson(myData.data()));
    await fetch(email);
    notifyListeners();
  }

  addExerciseCalories(
      String email, _date, _name, int _weight, int _calories) async {
    var value =
        await FirebaseFirestore.instance.collection('${email}_exercise').add({
      "email": email,
      "date": _date,
      "name": _name,
      "weight": _weight,
      "calories": _calories,
      "type": 2,
    });
    var myData = await value.get();
    data.add(Exercise.fromJson(myData.data()));
    await fetch(email);
    notifyListeners();
  }

  removeExercise(Exercise exercise) async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('${exercise.email}_exercise')
        .get();
    String path = "";
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      Exercise item = Exercise.fromJson(querySnapshot.docs[i].data());
      if (item.date == exercise.date.substring(0,19)) {
        path = querySnapshot.docs[i].reference.path;
        break;
      }
    }
    if (path != "") {
      // print('path: ${path}');
      path = path.split('/')[1];
      await FirebaseFirestore.instance
          .collection('${exercise.email}_exercise')
          .doc(path)
          .delete();
      await fetch(exercise.email);
      notifyListeners();
    }
  }
}
