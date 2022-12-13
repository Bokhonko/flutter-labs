import 'package:flutter/material.dart';
import '../data.dart';

class Autorization extends StatefulWidget {
  const Autorization({super.key});

  @override
  State<Autorization> createState() => _AutorizationState();
}

class _AutorizationState extends State<Autorization> {
  String nameUser = '';
  late List<String> groups;
  String? selectedGroup;

  _AutorizationState() {
    ScheduleData scheduleData = ScheduleData();
    groups = scheduleData.getGroupsNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Авторизація'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                nameUser = value;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Як тебе звати?",
                labelText: "Ім'я *",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: DropdownButton<String>(
                value: selectedGroup,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: groups
                    .map((group) => DropdownMenuItem(
                          value: group,
                          child: Text(group),
                        ))
                    .toList(),
                onChanged: (String? newGroup) {
                  setState(() {
                    selectedGroup = newGroup;
                  });
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home', arguments: {
                    'nameUser': nameUser,
                    'selectedGroup': selectedGroup
                  });
                },
                child: Text('Продовжити'))
          ],
        ),
      ),
    );
  }
}
