import 'package:flutter/material.dart';
import 'package:food2023/main.dart';
import 'package:food2023/utility/my_style.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: ListView(padding: EdgeInsets.all(30.0),
        children: <Widget>[
          signupLogo(),
          MyStyle().mySizeBox(),
          appName(),
          MyStyle().mySizeBox(),
          userForm(),
          MyStyle().mySizeBox(),
          passwordForm(),



        ],
      ),
   );
  }

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
    children: <Widget> [
      MyStyle().showLogo(),
    ],
  );

Widget userForm() => Container(width: 250.0,
   child: TextField(
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
   child: TextField(obscureText: true,
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



