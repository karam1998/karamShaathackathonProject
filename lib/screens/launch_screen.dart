import 'package:flutter/material.dart';
import 'package:hackathon/prefs/shared_pref_controller.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if(SharedPrefController().loggedIn){
        Navigator.pushReplacementNamed(context, "/login_screen");
      } else {
        Navigator.pushReplacementNamed(context, "/category_Screen");

      }
    });
  }
  //Navigator.pushReplacementNamed(context, '/login_screen');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                Colors.indigo.shade900,
                Colors.indigo.shade900,
              ]),
        ),
        child: const Text(
          'Events',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: "Pacifico-Regular",
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
