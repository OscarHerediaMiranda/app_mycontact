import 'package:flutter/material.dart';

class MyContactDetails extends StatelessWidget {
  MyContactDetails(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("* * * Contact detail * * *"),
      ),
      body: Center(
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: NetworkImage(data['picture']['large']),
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.all(Radius.circular(75.0)),
            border: Border.all(
              color: Colors.red,
              width: 4.0
            )
          ),
        ),
      ),
    );
  }
}
