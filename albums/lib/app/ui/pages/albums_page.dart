import 'dart:convert';

import 'package:albums/app/models/album.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlbumsPage extends StatelessWidget {
  const AlbumsPage({Key? key}) : super(key: key);

  Future<dynamic> fetchAlbum() async {
    var response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    );

    return jsonDecode(response.body).map((e) => Album.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums Page'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            padding: const EdgeInsets.all(8),
            child: FutureBuilder(
              future: fetchAlbum(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return const SizedBox(
                      height: 400,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case ConnectionState.done:
                    List data = snapshot.data;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Álbum $index clicado."),
                              ),
                            );
                          },
                          child: Text(data[index].title),
                        );
                      },
                    );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
