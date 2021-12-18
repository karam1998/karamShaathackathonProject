import 'package:flutter/material.dart';
import 'package:hackathon/helpers/helpers.dart';
import 'package:hackathon/widget/app_text_field.dart';

class NewEventScreen extends StatefulWidget {
  const NewEventScreen({Key? key}) : super(key: key);

  @override
  _NewEventScreenState createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> with Helpers {
  late TextEditingController _phoneTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _textEditingController = TextEditingController();
    // _tapGestureRecognizer = TapGestureRecognizer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'New event',
          style: TextStyle(fontSize: 18, color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25, left: 16),
            child: Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 5),
            child: AppTextField(
              label: 'Name',
              controller: _textEditingController,
              hint: 'Enter event name',
              prefixIcon: Icons.code,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 25,
                          ),
                          child: Text(
                            'Data',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        AppTextField(
                          label: '',
                          hint: '21 December 2021',
                          controller: _textEditingController,
                          prefixIcon: Icons.code,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 25, left: 16),
                          child: Text(
                            'Time',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        AppTextField(
                          label: '',
                          hint: '21 December 2021',
                          controller: _textEditingController,
                          prefixIcon: Icons.title,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, left: 16),
            child: Text(
              'Hours',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 5),
            child: AppTextField(
              label: 'Hours',
              controller: _textEditingController,
              hint: 'Enter event name',
              prefixIcon: Icons.lock_clock,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 16),
            child: Text(
              'Category',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 5),
            child: AppTextField(
              label: 'Category',
              controller: _textEditingController,
              hint: 'Enter event name',
              prefixIcon: Icons.category,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, left: 16),
            child: Text(
              'Location',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 5),
            child: Container(
                child: AppTextField(
              label: 'Location',
              controller: _textEditingController,
              hint: 'Enter event name',
              prefixIcon: Icons.info,
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 79, left: 25, right: 25),
            child: TextButton(
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16)),
                height: 58,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  //async => await performLogin(),

                  child: const Text(
                    'Create new event ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
