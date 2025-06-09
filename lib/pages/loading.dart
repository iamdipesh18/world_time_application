import 'package:flutter/material.dart';
import 'package:world_time_application/pages/home.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Text('Loading Screen'),
    );
  }
}