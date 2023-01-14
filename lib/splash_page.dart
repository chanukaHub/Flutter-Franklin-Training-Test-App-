import 'package:flutter/material.dart';
import 'package:ui_design_class/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToLoginScreen(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          child: Image.asset('assets/trash_truck.png'),
        ),
      ),
    );
  }
  
  void navigateToLoginScreen(BuildContext context){
    Future.delayed( Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }
}
