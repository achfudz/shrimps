import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:shrimps/constant/constant.dart';

import '../../model/User.dart';
import '../../viewmodel/shrimp_service.dart';
import '../home/home.dart';

class Post extends StatefulWidget {
  int user;
  Post({Key? key, required this.user}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  TextEditingController Image = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController kingdom = TextEditingController();
  TextEditingController phylum = TextEditingController();
  TextEditingController klass = TextEditingController();
  TextEditingController ordo = TextEditingController();
  TextEditingController family = TextEditingController();
  TextEditingController genus = TextEditingController();
  TextEditingController species = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 23),
            child: Column(
              children: [
                TextField(
                  controller: Image,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Image',
                    hintText: 'Image',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: name,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Name',
                    hintText: 'Name',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: kingdom,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Kingdom',
                    hintText: 'Kingdom',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: phylum,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Phylum',
                    hintText: 'Phylum',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: klass,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Class',
                    hintText: 'Class',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: ordo,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'ordo',
                    hintText: 'ordo',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: family,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Family',
                    hintText: 'Family',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: genus,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Genus',
                    hintText: 'Genus',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: species,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Species',
                    hintText: 'Species',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: description,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Description',
                    hintText: 'Description',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                    onPressed: () {
                      submit();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        minimumSize: Size(300, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
              ],
            )),
      ),
    );
  }

  submit() async {
    Dio dio = Dio();

    var baseUrlApi = shrimpservice().baseUrlApi;

    Map<String, dynamic> uploadDataData = {
      'Image': 'assets/images/Image/${Image.text}',
      'name': name.text,
      'kingdom': kingdom.text,
      'phylum': phylum.text,
      'class': klass.text,
      'ordo': ordo.text,
      'family': family.text,
      'genus': genus.text,
      'species': species.text,
      'description': description.text
    };
    var responseApi =
        await dio.post('$baseUrlApi/shrimps', data: uploadDataData);
    debugPrint(responseApi.data.toString());

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Home(user: widget.user)));
  }
}
