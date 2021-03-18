import 'dart:developer';

import 'package:counter_with_getx/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'other_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final Controller c = Get.put(Controller());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Counter App"),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(flex: 1,child: SizedBox()),
              Obx(() => Text("Value: " + "${c.count}", style: TextStyle(fontSize: 20),)),
              SizedBox(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () => Get.to(OtherPage()), child: Text("Go to Other Page", style: TextStyle(fontSize: 10),)),
              Expanded(flex: 1,child: SizedBox()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: SizedBox()),
                    FloatingActionButton(
                      backgroundColor: Colors.purpleAccent,
                      heroTag: "minus",
                      child: Icon(Icons.exposure_minus_1), onPressed: c.decrement,
                    ),
                    SizedBox(width: 10),
                    FloatingActionButton(
                      backgroundColor: Colors.purpleAccent,
                      heroTag: "plus",
                      child: Icon(Icons.plus_one_outlined), onPressed: c.increment,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



