import 'package:fitness_toolbox/config/Configs.dart';
import 'package:fitness_toolbox/model/record.dart';
import 'package:fitness_toolbox/model/user.dart';
import 'package:fitness_toolbox/config/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
          image: AssetImage('assets/images/history.jpg'),
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
                  //load image..
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
                Column(
                  children: [
                    Text(
                      '${Configs.cc} \n ${context.watch<ExerciseModel>().kcal}   kcal',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '${Configs.dd} \n ${(context.watch<ExerciseModel>().time / 60).toStringAsFixed(2)} min(s)',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.black,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: context.watch<ExerciseModel>().data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Exercise itemDate =
                          context.watch<ExerciseModel>().data[index];
                      return Dismissible(
                        key: UniqueKey(),
                        //key: Key("'key${index}'"),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  '${itemDate.date},   ${itemDate.type == 1 ? (itemDate.seconds / 60).toStringAsFixed(2) : itemDate.calories}${itemDate.type == 1 ? " min(s)" : '  kcal'}'),
                              Divider(
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              ),
                            ],
                          ),
                        ),
                        onDismissed: (direction) async {
                          await Provider.of<ExerciseModel>(context,
                                  listen: false)
                              .removeExercise(itemDate);
                          ToastUtil.showToast(Configs.jj_1);
                        },
                      );
                    })),
          ],
        ));
  }
}
