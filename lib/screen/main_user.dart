import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MainUser extends StatefulWidget {
  const MainUser({super.key});

  @override
  State<MainUser> createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  String nameUser ='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUser();
  }
  
  Future<Null> findUser() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameUser = preferences.getString('Name')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('สวัสดี $nameUser'),
      ),
    );
  }
}