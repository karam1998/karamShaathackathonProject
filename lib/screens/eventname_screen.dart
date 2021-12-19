import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventNameScreen extends StatefulWidget {
  const EventNameScreen({Key? key}) : super(key: key);

  @override
  _EventNameScreenState createState() => _EventNameScreenState();
}

class _EventNameScreenState extends State<EventNameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Name'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/newEvent_Screen");
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              )),
          IconButton(
            onPressed: ()  {},
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(
          start: 28,
          end: 28,
        ),
        children: [
          const SizedBox(
            height: 20,
          ),
          AspectRatio(
            aspectRatio: 15 /10,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                  "https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455_960_720.jpg",
                ),),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Event Name Apper Here ",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.lock_clock,
                color: Colors.grey,
              ),
              const Text(
                '09.00am',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.grey,
                  ),
                  Text(
                    '12/12/2020',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.image,
                    color: Colors.grey,
                  ),
                  Text(
                    '10',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Icon(
                Icons.location_on,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'location',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Icon(
                Icons.info,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'info',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. "),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Comment   (22)"),
              Text('seeAll'),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Image.network(
                  'https://www.youloveit.com/uploads/posts/2020-01/1579295763_youloveit_com_frozen_2_official_hd_art_big_images01.jpg',
                  height: 80,
                  width: 80,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: const [
                  Text('Karam shaat'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Comment will appear hear'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('12/12/2020  -  12:18am'),
                ],
              )
            ],
          ),
          const Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          Row(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Image.network(
                  'https://www.youloveit.com/uploads/posts/2020-01/1579295763_youloveit_com_frozen_2_official_hd_art_big_images01.jpg',
                  height: 80,
                  width: 80,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: const [
                  Text('Karam shaat'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Comment will appear hear'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('12/12/2020  -  12:18am'),
                ],
              )
            ],
          ),
          const Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          Row(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Image.network(
                  'https://www.youloveit.com/uploads/posts/2020-01/1579295763_youloveit_com_frozen_2_official_hd_art_big_images01.jpg',
                  height: 80,
                  width: 80,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: const [
                  Text('Karam shaat'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Comment will appear hear'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('12/12/2020  -  12:18am'),
                ],
              )
            ],
          ),
          const Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          Row(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Image.network(
                  'https://www.youloveit.com/uploads/posts/2020-01/1579295763_youloveit_com_frozen_2_official_hd_art_big_images01.jpg',
                  height: 80,
                  width: 80,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: const [
                  Text('Karam shaat'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Comment will appear hear'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('12/12/2020  -  12:18am'),
                ],
              )
            ],
          ),
          const Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          Row(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Image.network(
                  'https://www.youloveit.com/uploads/posts/2020-01/1579295763_youloveit_com_frozen_2_official_hd_art_big_images01.jpg',
                  height: 80,
                  width: 80,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: const [
                  Text('Karam shaat'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Comment will appear hear'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('12/12/2020  -  12:18am'),
                ],
              )
            ],
          ),
          const Divider(
            thickness: 2,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
