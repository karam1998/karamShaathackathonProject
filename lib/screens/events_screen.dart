
import 'package:flutter/material.dart';
import 'package:hackathon/api/controllers/auth_api_controller.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                alignment: AlignmentDirectional.bottomCenter,
                height: 152,
                width: 375,
                color: Colors.blue,
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/Group.jpg'),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 13, left: 90, right: 89),
            child: Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'Category Name',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 14, left: 165, right: 164),
            child: Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  '12 Event',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: Colors.red),
                )),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              childAspectRatio: 343 / 103,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 5, right: 16, left: 16),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Container(
                          height: 79,
                          width: 97,
                          child: Image.asset('images/Group.jpg')),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 19),
                            child: Container(
                                height: 15,
                                width: 89,
                                child: Text(
                                  '12:00am - 2hours',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.pink),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Container(
                                height: 15,
                                width: 89,
                                child: const Text(
                                  'Event Name',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.indigo),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Container(
                                height: 15,
                                width: 89,
                                child: const Text(
                                  '12/12/2020',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.blueAccent),
                                )),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(top: 16, right: 36),
                        child: Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(4)),
                            width: 48,
                            height: 20,
                            child: const Text(
                              'Active',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: () => performLogout(),
            child: const Text(
              'sign out',
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
          )
        ],
      ),
    );
  }

  Future performLogout() async {
    bool logout = await AuthApiController().logout();

    if (logout) {
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
  }
}
