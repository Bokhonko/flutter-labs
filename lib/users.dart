import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  bool _loading = false;
  List<dynamic> _users = [];

  getUsers() async {
    setState(() {
      _loading = true;
    });
    var client = http.Client();
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      if (result.isNotEmpty) {
        setState(() {
          _users = result;
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Залікова робота"),
        ),
        body: _users.isNotEmpty
            ? ListView.builder(
                itemCount: _users.length,
                itemBuilder: ((context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(_users[index]['id'].toString() + '. '),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name:' + ' ' + _users[index]['name']),
                              Text('Email:' + ' ' + _users[index]['email']),
                              Text('City:' +
                                  ' ' +
                                  _users[index]['address']['city']),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              )
            : Center(
                child: _loading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        child: const Text("Users"),
                        onPressed: getUsers,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                      ),
              ));
  }
}
