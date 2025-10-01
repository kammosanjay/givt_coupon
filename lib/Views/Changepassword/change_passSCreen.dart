import 'package:flutter/material.dart';

class ChangePassscreen extends StatefulWidget {
  const ChangePassscreen({super.key});

  @override
  State<ChangePassscreen> createState() => _ChangePassscreenState();
}

class _ChangePassscreenState extends State<ChangePassscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Change Password Screen")));
  }
}
