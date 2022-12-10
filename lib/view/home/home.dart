import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../model/Shrimps.dart';

import '../../navigator/drawer.dart';
import '../../viewmodel/shrimp_service.dart';
import '../crud/crud.dart';
import '../detail/detail.dart';

class Home extends StatefulWidget {
  // final UserModel user;
  int user;
  Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xffFFA630),
        elevation: 0,
        title: const Text(
          'Shrimps',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Poppins Bold',
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Crud(user: widget.user),
                  ));
                },
                child: const Icon(
                  Icons.add,
                  size: 26.0,
                ),
              )),
        ],
      ),
      drawer: DrawerWidget(
        user: widget.user,
      ),
      body: FutureBuilder<List<ShrimpModel>>(
        future: shrimpservice().fetchDataShrimp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Container(
                color: Color.fromARGB(255, 252, 242, 209),
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailShrimp(
                                        shrimp: snapshot.data![index],
                                        user: widget.user,
                                      )));
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 190,
                              width: 400,
                              child: Image.asset(
                                snapshot.data![index].Image,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                                padding: const EdgeInsets.only(right: 250),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot.data![index].name,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff1C110A)),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      snapshot.data![index].species,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1C110A),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                )),
                          ],
                        ),
                      );
                    }),
              );
            }
          }
        },
      ),
    );
  }
}
