import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_mycontact/MyContactDetails.dart';

class MyContactList extends StatefulWidget {
  const MyContactList({Key? key}) : super(key: key);

  @override
  State<MyContactList> createState() => _MyContactListState();
}

class _MyContactListState extends State<MyContactList> {
  String url = 'https://randomuser.me/api/?results=20';
  List data=[];

  Future<String> makeRequest() async{
    var response = await http.get(Uri.parse(url),
    headers: {'Accept': 'aplication/json'});

    setState(() {
      var extractData = json.decode(response.body);
      data = extractData['results'];
    });

    //print(response.body);
    print('Nombre: '+ data[0]['name']['title']);
    print('Nombre: '+ data[0]['name']['first']);
    print('Nombre: '+ data[0]['email']);
    return response.body;
  }

  @override
  void initState(){
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("* * * My Contact List * * *"),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, i){
          return ListTile(
            title: Text(data[i]['name']['title'] +
                " " +
                data[i]['name']['first'] +
                " " +
                data[i]['name']['last']),
            subtitle: Text(data[i]['phone']),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data[i]['picture']['medium']),
            ),
            onTap: (){
              // Aqui se pone el codigo para pasar la info al otro "route"
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyContactDetails(data[i])));
            },
          );
          })
    );
  }
}
