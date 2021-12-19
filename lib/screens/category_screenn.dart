import 'package:flutter/material.dart';
import 'package:hackathon/api/controllers/auth_api_controller.dart';
import 'package:hackathon/api/controllers/user_api_controller.dart';
import 'package:hackathon/models/category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<Category>> _future;
  List<Category> _categories = <Category>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = UserApiController().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Categories",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            // IconButton(
            //     onPressed: () {
            //       Navigator.pushNamed(context, "/event_tap_screen");
            //     },
            //     icon: Icon(
            //       Icons.add,
            //       color: Colors.black,
            //     )),
            // IconButton(
            //   onPressed: () async {
            //     await logout(context);
            //   },
            //   icon: const Icon(
            //     Icons.logout,
            //     color: Colors.black,
            //   ),
            // ),
          ],
        ),
        body: FutureBuilder<List<Category>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              _categories = snapshot.data ?? [];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 164 / 184,
                    crossAxisSpacing: 10,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          color: Colors.black12,
                          height: 140,
                          width: 148,
                          child: Stack(
                            children: [
                              SizedBox(
                                  height: 140,
                                  width: 148,
                                  child:
                                      Image.network(_categories[index].image)),
                              Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 10, right: 40, bottom: 7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.grey.withOpacity(.5),
                                  ),
                                  height: 35,
                                  width: 90,
                                  padding: const EdgeInsets.all(7),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(Icons.ac_unit),
                                        Text(
                                          _categories[index]
                                              .eventsCount
                                              .toString(),
                                          style: const TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Information Technology",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: Column(
                  children: const [
                    Icon(Icons.warning, size: 80),
                    Text(
                      'NO DATA',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }

  Future<void> logout(BuildContext context) async {
    bool logOut = await AuthApiController().logout();
    if (logOut) Navigator.pushReplacementNamed(context, '/login_screen');
  }
}
