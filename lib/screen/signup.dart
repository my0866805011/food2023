// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food2023/utility/my_style.dart';
import 'package:food2023/utility/normal_dialog.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String mcType = '*';
  String mcName = '*';
  String mcUser = '*';
  String mcPassword = '*';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          signupLogo(),
          MyStyle().mySizeBox(),
          appName(),
          MyStyle().mySizeBox(),
          nameForm(),
          MyStyle().mySizeBox(),
          userForm(),
          MyStyle().mySizeBox(),
          passwordForm(),
          MyStyle().mySizeBox(),
          MyStyle().showTitle2('เลือกประเภท สมาชิก'),
          userRadio(),
          shopRadio(),
          riderRadio(),
          MyStyle().mySizeBox(),
          registerButton(),
        ],
      ),
    );
  }

Widget registerButton() => Container(
    width: 250.0,
    child: ElevatedButton(    
      onPressed: () {
        print('name = $mcName, User = $mcUser, password = $mcPassword, type =$mcType');
        if (mcName == '*' || mcUser == '*' || mcPassword == '*' || mcType=='*') 
          {
          normalDialog(context, 'กรุณาตรวจสอบข้อมูล ไม่ถูกต้อง');
        }

        if (mcName.isEmpty || mcUser.isEmpty || mcPassword.isEmpty || mcType.isEmpty)
        {
          normalDialog(context, 'กรุณาตรวจสอบข้อมูล ไม่ถูกต้อง');
        }  
        checkUser();
      }, 
      
      child: const Text('Registor',
      style: TextStyle(color: Colors.white),
      ),
    ),
  );

//
//String url='https://www.57ans.com/appfood/getUserWhereUser.php?isAdd=true&user=$mcUser';
//
 // String url = 'https://www.57ans.com/appfood/insertuser.php?isAdd=true&name=$name&type=$chooseType&user=$user&password=$password';

Future<Null> checkUser()async{
  String url='https://www.57ans.com/appfood/getUserWhereUser.php?isAdd=true&user=$mcUser';
  try {
    Response response = await Dio().get(url);
    print('res = $response');

    if (response.toString().trim() == 'null') {
      registerThread();
    }else {
      normalDialog(context, 'User = $mcUser ซ้ำ');

    }
    
  } catch (e) {
    
  }

}



Future<Null> registerThread()async{
 String url = 'https://www.57ans.com/appfood/insertuser.php?isAdd=true&name=$mcName&type=$mcType&user=$mcUser&password=$mcPassword';

try {
  Response response = await Dio().get(url);
  print('res = $response');
  if (response.toString().trim() == 'true') {
        Navigator.pop(context);
        
      } else {
        normalDialog(context, 'Error ลองใหม่');
      }  
  } catch (e) {
  
  }

}

  Widget userRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'User',
                  groupValue: mcType,
                  onChanged: (value) {
                    setState(() {
                      mcType = value.toString().trim();
                    });
                  },
                ),
                Text(
                  'ผู้ัสั่งอาหาร',
                  style: TextStyle(color: MyStyle().darkColor),
                ),
              ],
            ),
          ),
        ],
      );

  Widget shopRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'Shope',
                  groupValue: mcType,
                  onChanged: (value) {
                    setState(() {
                      mcType = value.toString().trim();
                    });
                  },
                ),
                 Text('ร้านค้า Shop ',
                    style: TextStyle(color: MyStyle().darkColor),
                 ),
              ],
            ),
          ),
         
        ],
      );

  Widget riderRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'Rider',
                  groupValue: mcType,
                  onChanged: (value) {
                    setState(() {
                      mcType = value.toString().trim();
                    });
                  },
                ),
                Text('Riderrs',
                style: TextStyle(color: MyStyle().darkColor),
                ),
              ],
            ),
          ),
        ],
      );

  Row appName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyStyle().showTitle('App Food2023'),
      ],
    );
  }

  Widget signupLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyStyle().showLogo(),
        ],
      );

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(onChanged: (value) => mcName = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.face,
                  color: MyStyle().darkColor,
                ),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'Name:',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().darkColor)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().primaryColor),
                ),
              ),
            ),
          ),
        ],
      );

  Widget userForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(onChanged: (value) => mcUser = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.account_box,
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
          ),
        ],
      );

  Widget passwordForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 250.0,
              child: TextField(onChanged: (value) => mcPassword = value.trim(),
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
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
              )),
        ],
      );
}