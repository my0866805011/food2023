// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food2023/screen/main_rider.dart';
import 'package:food2023/screen/main_shop.dart';
import 'package:food2023/screen/main_user.dart';
import 'package:food2023/utility/normal_dialog.dart';
import 'package:food2023/utility/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utility/my_style.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

String mcUser ='*';
String mcPassword = '*';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignIn'),
      ),
      body: Container(decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: <Color>[Colors.white,MyStyle().primaryColor],
          center: Alignment(0,-0.5),
          radius: 1.0,
          )
      ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyStyle().showLogo(),
                MyStyle().mySizeBox(),
                MyStyle().showTitle('app food2023'),
                useForm(),
                MyStyle().mySizeBox() ,
                passwordForm(),
                MyStyle().mySizeBox(),
                LoginButton(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget LoginButton() => Container(
    width: 250.0,
    child: ElevatedButton(    
      onPressed: () {
        print('mcUser = $mcUser');
        print('mcPassword = $mcPassword');
        if (mcUser == null || mcUser.isEmpty || mcPassword == null ||mcPassword.isEmpty) {
          normalDialog(context, 'ข้อมูลไม่ถูกต้อง');
        } else {
          checkAuthen();

        }

      }, 
      child: Text('Login',
      style: TextStyle(color: Colors.white),
      ),
    ),
  );

Future<Null> checkAuthen() async {
  String url='https://www.57ans.com/appfood/getUserWhereUser.php?isAdd=true&user=$mcUser';
  try {
    Response response = await Dio().get(url);
    print('res = $response');
    var result = json.decode(response.data);
    print('result = $result');
    for (var map in result) {
      UserModel muserModel = UserModel.fromJson(map);
      if (mcPassword == muserModel.password) {
        String? mcType = muserModel.type;
        if (mcType == 'User') {
          routeToService(MainUser(),muserModel);
        } else if (mcType == 'shop'){
          routeToService(MainShop(),muserModel);
        } else if(mcType == 'Rider'){
          routeToService(MainRider(),muserModel);
        } else {
          normalDialog(context, 'Error');
        }


      } else {
        normalDialog(context, 'Password ไม่ถูกต้อง');
      }
    }

  } catch (e) {
  }

}

Future<Null> routeToService(Widget myWidget,UserModel muserModel) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('id', muserModel.id.toString());
  preferences.setString('type',muserModel.type.toString() );
  preferences.setString('name',muserModel.name.toString() );


  MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => myWidget,
   );
  Navigator.pushAndRemoveUntil(context, route, (route) => false);
}
 
Widget useForm() => Container(width: 250.0,
   child: TextField(onChanged: (value) => mcUser =value.toString().trim(),
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.account_box,
      color: MyStyle().darkColor,        
      ),
      labelStyle: TextStyle(color: MyStyle().darkColor),
      labelText: 'User :',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyStyle().darkColor)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyStyle().primaryColor),
      ),
    ),
  ),
 );



Widget passwordForm() => Container(width: 250.0,
   child: TextField(onChanged: (value) => mcPassword = value.toString().trim(),
    obscureText: true,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.lock,
      color: MyStyle().darkColor,        
      ),
      labelStyle: TextStyle(color: MyStyle().darkColor),
      labelText: 'Password :',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyStyle().darkColor)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyStyle().primaryColor),
      ),
    ),
  )
 );

}
