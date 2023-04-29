// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:native_scaffold/native_scaffold.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: NativeScaffold(
        title: "Title",
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
        },
        action: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        ),
        appBarEnabled: true,
        backgroundColor: Colors.white,
        bottomFloatingBar: SizedBox(
          height: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.red,
              ),
            ],
          ),
        ),
        sliverAppBarWidget: Image.network(
          "https://user-images.githubusercontent.com/102783954/235310805-89819d0c-617f-41f8-8795-681cd98faa41.png",
          fit: BoxFit.cover,
        ),
        sliverAppBarPinned: true,
        sliverAppBarWidgetHeight: 300,
        showLoargeTitleInIOS: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        appBarCenterWidget: Text("Center"),
        child: Column(
          children: [
            SizedBox(
              height: 2000,
            ),
          ],
        ),
      ),
    );
  }
}
