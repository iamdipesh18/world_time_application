import 'package:flutter/material.dart';
import 'package:world_time_application/pages/home.dart';
import 'package:world_time_application/pages/loading.dart';
import 'package:http/http.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async {
    //simulate a network request for a user name
    String? username = await Future.delayed(Duration(seconds: 3), () {
      return ('Dipesh');
    });
    //simulate network request to get the bio of the user name
    String? bio = await Future.delayed(Duration(seconds: 2), () {
      print('Vegan,Mugician,egg');
    });

    print("Statement");
  }

  //int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("Init State Function Ran");
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // print("Build State Function Ran");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      // body: ElevatedButton(
      //   onPressed: () {
      //     setState(() {
      //       counter += 1;
      //     });
      //   },
      //   child: Text('counter is $counter'),
      // ),
    );
  }
}
