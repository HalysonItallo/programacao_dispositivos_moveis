import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();
  late String _selectedCity;
  final Dio dio = Dio();

  Future<dynamic> fetchSuggestions() async {
    var response = await dio.get(
        'https://api.addsearch.com/v1/suggest/cfa10522e4ae6987c390ab72e9393908?term=casa');

    print(response.data);
    return jsonDecode(response.data);
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
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Qual a sua cidade favorita?'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: _textController,
                          onEditingComplete: () {
                            fetchSuggestions();
                          },
                        ),
                      ),
                      _textController.text.isNotEmpty
                          ? SizedBox(
                              width: 200,
                              child: DropdownButton(
                                items: <String>[
                                  'One',
                                  'Two',
                                  'Free',
                                  'Four'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {},
                              ),
                            )
                          : Container(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        child: const Text('Enviar'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Your Favorite City is $_selectedCity'),
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
