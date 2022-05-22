import 'package:fitness_toolbox/config/toast_util.dart';
import 'package:fitness_toolbox/model/record.dart';
import 'package:flutter/material.dart';

import 'package:fitness_toolbox/config/Configs.dart';
import 'package:fitness_toolbox/model/user.dart';
import 'package:provider/provider.dart';

class CaloriesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CaloriesPageState();
}

class _CaloriesPageState extends State<CaloriesPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _goalCaloriesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fitHeight,
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.7), BlendMode.dstATop),
          image: AssetImage('assets/images/calorie.jpg'),
        )),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                Container(
                  //loading image...
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                      image: DecorationImage(
                        image:
                            NetworkImage("${context.watch<User>().photoUrl}"),
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${Configs.a} \n ${context.watch<ExerciseModel>().kcal} kcal',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "${Configs.ff}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${Configs.gg}',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    height: 39,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0x237e7a7a),
                        width: 1,
                      ),
                      color: Color(0xd8e7e7e7),
                    ),
                    child: Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 6),
                        child: TextField(
                            controller: _nameController,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText: "${Configs.gg_1}",
                              hintStyle: TextStyle(
                                color: Color(0x42000000),
                                fontSize: 13,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.52,
                              ),
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${Configs.hh}',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    height: 39,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0x237e7a7a),
                        width: 1,
                      ),
                      color: Color(0xd8e7e7e7),
                    ),
                    child: Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 6),
                        child: TextField(
                            controller: _weightController,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText: "${Configs.hh_1}",
                              hintStyle: TextStyle(
                                color: Color(0x42000000),
                                fontSize: 13,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.52,
                              ),
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${Configs.ii}',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    height: 39,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0x237e7a7a),
                        width: 1,
                      ),
                      color: Color(0xd8e7e7e7),
                    ),
                    child: Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 6),
                        child: TextField(
                            controller: _goalCaloriesController,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText: "${Configs.ii_1}",
                              hintStyle: TextStyle(
                                color: Color(0x42000000),
                                fontSize: 13,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.52,
                              ),
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () async {
                String name = _nameController.value.text;
                String weight = _weightController.value.text;
                String goalCalories = _goalCaloriesController.value.text;
                int weightInt = 0, goalCaloriesInt = 0;
                if (name == "") {
                  ToastUtil.showToast(Configs.hhh);
                  return;
                }
                try {
                  if (weight != "") weightInt = int.parse(weight);
                  if (goalCalories != "")
                    goalCaloriesInt = int.parse(goalCalories);
                } catch (e) {
                  ToastUtil.showToast(Configs.hhh_1);
                  return;
                }
                await Provider.of<ExerciseModel>(context, listen: false)
                    .addExerciseCalories(
                        Provider.of<User>(context, listen: false).email,
                        DateTime.now().toString(),
                        name,
                        weightInt,
                        goalCaloriesInt);
                _nameController.text = "";
                _weightController.text = "";
                _goalCaloriesController.text = "";
                // await context.read()<ExerciseModel>().addExerciseCalories(context.watch<User>().email, DateTime.now().toString(), name, weightInt, goalCaloriesInt);
                ToastUtil.showToast(Configs.hhh_2);
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  margin: EdgeInsets.symmetric(horizontal: 100),
                  height: 50,
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    Configs.jj,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            )

            // Text("${Configs.b}", )
          ],
        ));
  }
}
