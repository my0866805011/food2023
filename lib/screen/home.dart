import 'package:flutter/material.dart';
import 'package:food2023/screen/signin.dart';
import 'package:food2023/screen/signup.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHeadDrawer(),
            signInMenu(),
            signOutMenu(),
          ],
        ),
      );
ListTile signInMenu() {
    return ListTile(
        leading: Icon(Icons.android),
        title: Text('Sign In'),
          onTap: () {
          Navigator.pop(context);
          MaterialPageRoute route = MaterialPageRoute(
            builder: (Value)=>SignIn());
            Navigator.push(context, route);
        } ,
      );
  }
 ListTile signOutMenu() {
    return ListTile(
        leading: Icon(Icons.android),
        title: Text('Sign Out'),
          onTap: () {
          Navigator.pop(context);
          MaterialPageRoute route = MaterialPageRoute(
            builder: (Value)=>SignUp());
            Navigator.push(context, route);
        } ,
      );
  }



  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
        accountName: Text('Guest'),
         accountEmail: Text('Please Login')
      );
  }
}
