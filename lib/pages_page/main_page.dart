import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: Center(
        child: Column(children: [
          SizedBox(height: 100,),
           const Text("ĐĂNG NHẬP",)
        ]),
      )));
}}