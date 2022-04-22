import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:posts/app/models/post.dart';
import 'package:posts/app/ui/pages/comments/comments.dart';
import 'package:posts/app/ui/widgtes/pagination.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final int limit = 10;
  int selectedPage = 1;

  Future<dynamic> fetchAlbum() async {
    var response = await http.get(
      Uri.parse(
          'http://jsonplaceholder.typicode.com/posts?_page=$selectedPage&_limit=$limit'),
    );

    return jsonDecode(response.body).map((e) => Post.fromJson(e)).toList();
  }

  void setPage(int actualPage) {
    setState(() {
      selectedPage = actualPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Page'),
      ),
      body: FutureBuilder(
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
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(
                                  3, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CommentsPage(
                                  postId: data[index].id,
                                ),
                              ),
                            );
                          },
                          child: Center(
                            child: Text(data[index].title),
                          ),
                        ),
                      ),
                      index == limit - 1
                          ? Pagination(
                              selectedPage: selectedPage,
                              limit: limit,
                              totalItems: 100,
                              onChange: (actualPage) {
                                setPage(actualPage);
                              },
                            )
                          : Container(),
                    ],
                  );
                },
              );
          }
        },
      ),
    );
  }
}
