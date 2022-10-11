import 'package:flutter/material.dart';

class Autorization extends StatefulWidget {
  const Autorization({super.key});

  @override
  State<Autorization> createState() => _AutorizationState();
}

class _AutorizationState extends State<Autorization> {
  String nameUser = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Авторизація'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              nameUser = value;
            },
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Як тебе звати?',
              labelText: 'Name *',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home',
                    arguments: {'nameUser': nameUser});
              },
              child: Text('Продовжити'))
        ],
      ),
    );
  }
}
