import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shrimps/constant/constant.dart';
import '../../viewmodel/shrimp_service.dart';
import '../home/home.dart';

class Delete extends StatefulWidget {
  int user;
  Delete({Key? key, required this.user}) : super(key: key);

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  TextEditingController id = TextEditingController();

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
                const SizedBox(height: 25),
                TextField(
                  controller: id,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Masukkan ID Shrimps',
                    hintText: 'Masukkan ID Shrimps',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 18),
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
                      'Delete',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                const SizedBox(height: 18),
              ],
            )),
      ),
    );
  }

  submit() async {
    Dio dio = Dio();
    var baseUrlApi = shrimpservice().baseUrlApi;
    var responseApi = await dio.delete('$baseUrlApi/shrimps/${id.text}');
    debugPrint(responseApi.data.toString());

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Home(user: widget.user)));
  }
}
