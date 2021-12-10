import 'package:flutter/material.dart';
import'package:kooli_test/Model/random_number.dart';
import'package:kooli_test/Services/random_number_api.dart';
import 'dart:core';
import 'dart:convert';

class HomePage extends StatefulWidget{
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  List<RandomNumber> number = <RandomNumber>[];

  void getData() async {
    RandomNumberApi.getNumbers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        number = list.map((model) => RandomNumber.fromJson(model)).toList();
      });
    });
  }


  @override
  void initState() {
    super.initState();
    getData();
  }


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Random numbers"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: getData,
              child: const Text(' Get new random number'),
              color: Colors.lightBlue.shade300,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              height: 500,
             // padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                  itemCount: number.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(number[index].random.toString()),
                    );
                  }),
            )

          ],

        ));
  }
}


