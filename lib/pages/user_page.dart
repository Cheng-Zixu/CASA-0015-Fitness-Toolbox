import 'package:fitness_toolbox/config/Configs.dart';
import 'package:fitness_toolbox/config/toast_util.dart';
import 'package:fitness_toolbox/model/user.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserPage();

}
class _UserPage extends State<UserPage> {
  Future<void> _initialization;
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  // context.watch<User>().height

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _heightController.text = '${Provider.of<User>(context, listen: false).height}';
    _weightController.text = '${Provider.of<User>(context, listen: false).weight}';
    _ageController.text = '${Provider.of<User>(context, listen: false).age}';
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
              image: AssetImage('assets/images/user.jpg'),
            )
        ),
      child: Column(
      children: [
        SizedBox(height: 20,),
        Row(
          children: [
            SizedBox(width: 40,),
            Container(
              //加载网络图片
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  image: DecorationImage(
                    image: NetworkImage("${context.watch<User>().photoUrl}"),
                    fit:BoxFit.cover,
                  )
              ),
            ),
            SizedBox(width: 10,),
            Text('${context.watch<User>().displayName}', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black
            ),),
          ],
        ),
        SizedBox(height: 20,),
        Divider(color: Colors.black, thickness: 2,),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "${Configs.info}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
        ),
        Divider(color: Colors.black, thickness: 1, indent: 20, endIndent: 20,),
        SizedBox(height: 20,),
        Container(
          width: double.infinity,
          height: 40,
          child: Row(
            children: [
              SizedBox(width: 20,),
              Text(Configs.height, style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),),
              Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 39,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.only(left: 0, right: 20),
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
                            controller: _heightController..text='${context.watch<User>()?.height??""}',
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
                            )
                        ),
                      ),
                    ),
                  )
              ),

            ],
          ),
        ),
        SizedBox(height: 20,),
        Container(
          width: double.infinity,
          height: 40,
          child: Row(
            children: [
              SizedBox(width: 20,),
              Text(Configs.weight, style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),),
              Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 39,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.only(left: 0, right: 20),
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
                            controller: _weightController..text = '${context.watch<User>()?.weight??""}',
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText: "${Configs.weight_1}",
                              hintStyle: TextStyle(
                                color: Color(0x42000000),
                                fontSize: 13,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.52,
                              ),
                              border: InputBorder.none,
                            )
                        ),
                      ),
                    ),
                  )
              ),

            ],
          ),
        ),
        SizedBox(height: 20,),
        Container(
          width: double.infinity,
          height: 40,
          child: Row(
            children: [
              SizedBox(width: 20,),
              Text(Configs.Aeg, style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),),
              Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 39,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.only(left: 0, right: 20),
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
                            controller: _ageController..text = '${context.watch<User>()?.age??""}',
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText: "${Configs.Aeg_1}",
                              hintStyle: TextStyle(
                                color: Color(0x42000000),
                                fontSize: 13,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.52,
                              ),
                              border: InputBorder.none,
                            )
                        ),
                      ),
                    ),
                  )
              ),

            ],
          ),
        ),
        SizedBox(height: 40,),

        Divider(color: Colors.black, thickness: 1, indent: 20, endIndent: 20,),
        SizedBox(height: 80,),
        Container(
          width: double.infinity,
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    String height = _heightController.value.text.toString();
                    String weight = _weightController.value.text.toString();
                    String age = _ageController.value.text.toString();
                    double heightDouble, weightDouble;
                    int ageInt;
                    try {
                      heightDouble = double.parse(height);
                      weightDouble = double.parse(weight);
                      ageInt = int.parse(age);
                    } catch (e) {
                      ToastUtil.showToast(Configs.INPUT_ERR);
                    }

                    bool aa = await Provider.of<User>(context,listen: false).upUser(heightDouble, weightDouble, ageInt);
                    if (aa) {
                      ToastUtil.showToast("Save success");
                    } else {
                      ToastUtil.showToast("Save failed");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    width: double.infinity,
                    child: Center(
                        child: Text(
                          "SAVE",
                          style:
                          TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ),
              Expanded(
                  child: InkWell(
                    onTap: _handleSignOut,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      width: double.infinity,
                      child: Center(
                          child: Text(
                            Configs.LOGOUT,
                            style:
                            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ],
    ));
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

  Future<void> _handleSignOut() async {
    await _ensureInitialized();
    await GoogleSignInPlatform.instance.disconnect();
    Navigator.of(context).pushReplacementNamed("login_in");
  }

}