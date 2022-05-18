import 'package:fitness_toolbox/config/Configs.dart';
import 'package:fitness_toolbox/model/exercise.dart';
import 'package:fitness_toolbox/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';


class ExercisePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ExercisePageState();

}

class _ExercisePageState extends State<ExercisePage> {

  List images_url = [
    "assets/images/exercise.jpg",
    "assets/images/yoga.jpg",
    "assets/images/meditation.jpg"
  ];
  int labelIndex = 0;
  List data0 = [
    {
      "name":Configs.g,
      "url":"https://raw.githubusercontent.com/Cheng-Zixu/cheng-zixu.github.io/main/15%20MIN%20GOOD%20MORNING%20WORKOUT%20-%20Stretch%20%26%20Train%20(No%20Equipment).mp4"
    },
    {
      "name":Configs.h,
      "url":"https://raw.githubusercontent.com/Cheng-Zixu/cheng-zixu.github.io/main/10%20MIN%20BODYWEIGHT%20WORKOUT%20(NO%20EQUIPMENT%20HOME%20WORKOUT!).mp4"
    },
    {
      "name":Configs.i,
      "url":"https://raw.githubusercontent.com/Cheng-Zixu/cheng-zixu.github.io/main/ZUMBA%20Dance%20Fitness%20Tutorial-%20Full%20Cardio.mp4"
    },
  ];
  List data1 = [
    {
      "name":Configs.j,
      "url":"https://raw.githubusercontent.com/Cheng-Zixu/cheng-zixu.github.io/main/10%20min%20Morning%20Yoga%20Stretches%20%E2%80%93%20Day%20%233%20(10%20MIN%20FULL%20BODY%20YOGA).mp4"
    },
    {
      "name":Configs.k,
      "url":"https://raw.githubusercontent.com/Cheng-Zixu/cheng-zixu.github.io/main/10%20min%20Morning%20Yoga%20Full%20Body%20Stretch.mkv"
    },
    {
      "name":Configs.l,
      "url":"https://raw.githubusercontent.com/Cheng-Zixu/cheng-zixu.github.io/main/15%20min%20After%20Work%20Yoga%20-%20All%20Levels%20STRETCH%20%26%20RELAX%20Class.mp4"
    },
  ];
  List data2 = [
    {
      "name":Configs.m,
      "url":"https://raw.githubusercontent.com/Cheng-Zixu/cheng-zixu.github.io/main/10-Minute%20Meditation%20For%20Beginners.mp4"
    },
    {
      "name":Configs.n,
      "url":"https://raw.githubusercontent.com/Cheng-Zixu/cheng-zixu.github.io/main/5-Minute%20Meditation%20You%20Can%20Do%20Anywhere.mp4"
    },
    {
      "name":Configs.o,
      "url":"https://raw.githubusercontent.com/Cheng-Zixu/cheng-zixu.github.io/main/Easy%20Guided%20Meditation%20for%20Beginners%20-%2015%20min%20Meditation%20for%20Clarity%20%26%20Relaxation.mp4"
    },
  ];
  List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = data0; //
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.dstATop),
            image: AssetImage(images_url[labelIndex]),
          )
      ),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 40,),
              Container(
                //Loading images
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    image: DecorationImage(
                      image: NetworkImage("${context
                          .watch<User>()
                          .photoUrl}"),
                      fit: BoxFit.cover,
                    )
                ),
              ),
              SizedBox(width: 10,),
              Text('${Configs.b} \n ${context.watch<ExerciseModel>().time}s', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ),),
            ],
          ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            height: 2,
            color: Colors.black,
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        labelIndex = 0;
                        data = data0;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: double.infinity,
                      child: Text(Configs.d, style: TextStyle(
                          fontSize: 18,
                          color: labelIndex == 0 ? Colors.red : Colors.black
                      ),),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: double.infinity,
                  color: Colors.black,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        labelIndex = 1;
                        data = data1;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: double.infinity,
                      child: Text(Configs.e, style: TextStyle(
                          fontSize: 18,
                          color: labelIndex == 1 ? Colors.red : Colors.black
                      ),),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: double.infinity,
                  color: Colors.black,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        labelIndex = 2;
                        data = data2;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: double.infinity,
                      child: Text(Configs.f, style: TextStyle(
                          fontSize: 18,
                          color: labelIndex == 2 ? Colors.red : Colors.black
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.black,
          ),
          Expanded(child: ListView.builder(
              itemCount: data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ItemPage(url: data[index]['url'],)));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${data[index]['name']}")
                      ],
                    ),
                  ),
                );
              }))

        ],
      ));
  }

}