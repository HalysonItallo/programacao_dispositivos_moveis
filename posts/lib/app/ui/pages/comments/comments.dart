import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:posts/app/models/comment.dart';

class CommentsPage extends StatelessWidget {
  final int postId;
  const CommentsPage({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<dynamic> fetchComment() async {
      var response = await http.get(
        Uri.parse(
            'http://jsonplaceholder.typicode.com/comments?postId=$postId'),
      );

      return jsonDecode(response.body).map((e) => Comment.fromJson(e)).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments Page'),
      ),
      body: FutureBuilder(
        future: fetchComment(),
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
                shrinkWrap: true,
                itemCount: data.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 250,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset:
                              const Offset(3, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 200,
                        width: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name: ${data[index].name}",
                              style: const TextStyle(color: Colors.blue),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Email: ${data[index].email}",
                              style: const TextStyle(color: Colors.blue),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Body: ${data[index].body}",
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
