import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../model/Shrimps.dart';
import '../../model/User.dart';

import '../../viewmodel/shrimp_service.dart';
import '../profile/profile.dart';

class DetailShrimp extends StatefulWidget {
  final ShrimpModel shrimp;
  int user;
  DetailShrimp({Key? key, required this.shrimp, required this.user})
      : super(key: key);

  @override
  State<DetailShrimp> createState() => _DetailShrimpState();
}

class _DetailShrimpState extends State<DetailShrimp> {
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFA630),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 395,
                      height: 470,
                      child: Image.asset(
                        widget.shrimp.Image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(255, 252, 242, 209),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("${widget.shrimp.name}",
                                    style:
                                        Theme.of(context).textTheme.headline6),
                              ),
                              Text(
                                "Kingdom : ${widget.shrimp.kingdom}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 49, 49),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Phylum : ${widget.shrimp.phylum}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 49, 49),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Class : ${widget.shrimp.klass}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 49, 49),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Order : ${widget.shrimp.ordo}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 49, 49),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Family : ${widget.shrimp.family}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 49, 49),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Genus : ${widget.shrimp.genus}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 49, 49),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Species : ${widget.shrimp.species}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 49, 49, 49),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Color(0xffFFD151),
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "${widget.shrimp.description}",
                        style: Theme.of(context).textTheme.bodyText1,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
