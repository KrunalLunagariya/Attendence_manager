import 'package:flutter/material.dart';
import '../custom_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Krunal", "age": 18},
    {"id": 2, "name": "Dharmik", "age": 19},
    {"id": 3, "name": "Sahil", "age": 20},
    {"id": 4, "name": "Bhavil", "age": 21},
    {"id": 5, "name": "Chirag", "age": 22},
    {"id": 6, "name": "KRUNAL", "age": 18},
    {"id": 7, "name": "SAHIL", "age": 19},
    {"id": 8, "name": "DHARMIK", "age": 20},
    {"id": 9, "name": "BAHVIL", "age": 21},
    {"id": 10, "name": "CHIRAG", "age": 22},
    {"id": 11, "name": "KrunAL", "age": 22},
    {"id": 12, "name": "DHarMik", "age": 22},
    {"id": 13, "name": "BhavIL", "age": 22},
    {"id": 14, "name": "SahiL", "age": 22},
    {"id": 15, "name": "ChiRaG", "age": 22},
  ];

  List<Map<String, dynamic>> _foundUsers = [];

  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Listview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
           CustomTextField(hintText: "Search", prefixIcon: const Icon(Icons.search),
            onChanged: (value) => _runFilter(value),
          ),
          const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]["id"]),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Text(
                      _foundUsers[index]["id"].toString(),
                      style: const TextStyle(fontSize: 24, color:Colors.black),
                    ),
                    title: Text(_foundUsers[index]['name'], style:const TextStyle(
                        color:Colors.black
                    )),
                    subtitle: Text(
                        '${_foundUsers[index]["age"].toString()} years old',style:const TextStyle(
                        color:Colors.black
                    )),
                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}