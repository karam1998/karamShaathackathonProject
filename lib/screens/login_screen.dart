import 'package:flutter/material.dart';
import 'package:hackathon/helpers/helpers.dart';
import 'package:hackathon/widget/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  late TextEditingController _phoneTextController;
  late TextEditingController _passwordTextController;

  // late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    // _tapGestureRecognizer = TapGestureRecognizer();
  }

  // void navigateToRegisterScreen() {
  //   Navigator.pushNamed(context, '/register_screen');
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,

      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text('LOGIN'),
      //   centerTitle: true,
      //   elevation: 0,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      // ),

      body: Stack(
        children: [
          // SizedBox(height: 80,),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF6392CB),
                    Color(0xFF61A4F1),
                    Color(0xFF7DAAE2),
                  ],
                  stops: [
                    0.9,
                    0.5,
                    0.8
                  ]),
              // color: Colors.white,
            ),
            child: Container(
              color: Colors.white,
              height: double.infinity,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    const SizedBox(
                      height: 29.7,
                    ),
                    const Text(
                      'UCAS Events',
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico-Regular'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              alignment: Alignment.topLeft,
                              child: Text(
                                'welcome back',
                                style: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    wordSpacing: 1,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(height: 25),
                            AppTextField(
                              hint: 'phone',
                              controller: _phoneTextController,
                              prefixIcon: Icons.email, label: 'Phone',
                            ),
                            const SizedBox(height: 30),
                            AppTextField(
                              hint: 'password',
                              controller: _passwordTextController,
                              prefixIcon: Icons.lock,
                              obscureText: true, label: 'Password',
                            ),
                            const SizedBox(height: 85),
                            ElevatedButton(
                              onPressed: () => performLogin(),
                              child: const Text(
                                'sign in',
                                style: TextStyle(
                                    fontSize: 22,
                                    ),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 10,
                                enabledMouseCursor: MouseCursor.defer,
                                shadowColor: Colors.white,
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //SOLID - Single Responsibility
  void performLogin() {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    if (_phoneTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      checkErrors();
      return true;
    }
    checkErrors();
    showMessage(message: 'Enter required fields!', error: true);
    return false;
  }

  void checkErrors() {
    setState(() {});
  }

  void login() {
    showMessage(message: 'Logged in successfully');
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/categories_Screen');
    });
  }

  void showMessage({required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsetsDirectional.only(
          bottom: 20,
          start: 30,
          end: 30,
        ),
        // onVisible: () => print('Visible'),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // padding: EdgeInsets.symmetric(
        //   horizontal: 20,
        //   vertical: 20,
        // ),
        // action: SnackBarAction(
        //   onPressed: () {},
        //   label: 'DONE',
        //   textColor: Colors.orange,
        // ),
      ),
    );
  }
}
