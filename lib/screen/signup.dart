import 'package:flutter/material.dart';
import 'package:food2023/main.dart';
import 'package:food2023/utility/my_style.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String mcType = '';
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
      onPressed: () {}, 
      child: Text('Registor',
      style: TextStyle(color: Colors.white),
      ),
    ),
  );


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
                      mcType = value!;
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
                      mcType = value!;
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
                      mcType = value!;
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
            child: TextField(
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
            child: TextField(
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
              child: TextField(
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
