import 'package:flutter/material.dart';

class HalamanUtamaScreen extends StatefulWidget {
  const HalamanUtamaScreen({super.key, this.title});
  final String? title;

  @override
  State<HalamanUtamaScreen> createState() => _HalamanUtamaScreenState();
}

class _HalamanUtamaScreenState extends State<HalamanUtamaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: const Text("Dashboard"),
    actions: const [],
    ),
    body: SingleChildScrollView(
    child: Container(
    padding: const EdgeInsets.all(10.0),
    child: const Column(
    children: [],
    ),
    ),
    ),
    );
  }
}