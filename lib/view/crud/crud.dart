import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shrimps/view/crud/post.dart';
import 'package:shrimps/view/crud/update.dart';

import '../../constant/constant.dart';
import '../../model/User.dart';
import '../../navigator/drawer.dart';
import '../home/home.dart';
import 'delete.dart';

class Crud extends StatefulWidget {
  // final UserModel user;
  int user;
  Crud({Key? key, required this.user}) : super(key: key);

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: orangeAccent,
          elevation: 0,
          title: const Text(
            'Shrimps',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: 'Poppins Bold',
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: white,
            ),
            onPressed: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                            user: widget.user,
                          )));
            },
          ),
        ),
        drawer: DrawerWidget(
          user: widget.user,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Post(
                                user: widget.user,
                              )));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: const Text("POST",
                    style: TextStyle(
                      fontFamily: 'Poppins SemiBold',
                      fontSize: 18,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Update(
                                  user: widget.user,
                                )));
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: const Text("UPDATE",
                    style: TextStyle(
                      fontFamily: 'Poppins SemiBold',
                      fontSize: 18,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Delete(
                                  user: widget.user,
                                )));
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: const Text("DELETE",
                    style: TextStyle(
                      fontFamily: 'Poppins SemiBold',
                      fontSize: 18,
                    )),
              ),
            ],
          ),
        ));
  }
}
