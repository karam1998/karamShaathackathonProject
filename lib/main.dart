import 'package:flutter/material.dart';
import 'package:hackathon/prefs/shared_pref_controller.dart';
import 'package:hackathon/screens/categories_screen.dart';
import 'package:hackathon/screens/category_screenn.dart';
import 'package:hackathon/screens/eventname_screen.dart';
import 'package:hackathon/screens/events_screen.dart';
import 'package:hackathon/screens/launch_screen.dart';
import 'package:hackathon/screens/login_screen.dart';
import 'package:hackathon/screens/newevent_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/events_Screen',
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/categories_Screen': (context) => const CategoriesScreen(),
        '/category_Screen': (context) => const CategoryScreen(),
        '/events_Screen': (context) => const EventScreen(),
        '/eventsNames_Screen': (context) => const EventNameScreen(),
        '/newEvent_Screen': (context) => const NewEventScreen(),
      },
    );
  }
}
