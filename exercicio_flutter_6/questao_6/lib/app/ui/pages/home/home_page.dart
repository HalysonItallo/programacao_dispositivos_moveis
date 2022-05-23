import 'package:flutter/material.dart';
import 'package:questao_6/app/ui/widgets/autocomplete.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Amanda", "age": 29},
    {"id": 2, "name": "Barbara", "age": 35},
    {"id": 3, "name": "Carla", "age": 21},
    {"id": 4, "name": "Daniel", "age": 12}
  ];

  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    results = _allUsers
        .where((user) =>
            user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
        .toList();
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            AutocompleteWidget(
              onSelected: (String selection) {
                _runFilter(selection);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.amberAccent,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(_foundUsers[index]['name']),
                      subtitle: Text('${_foundUsers[index]["age"]} years old'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.clear_all),
        onPressed: () => {
          setState(() {
            _foundUsers = _allUsers;
          })
        },
      ),
    );
  }
}
