import 'dart:io';

import 'package:flutter/material.dart';
import 'package:task/src/api/posts_api.dart';
import 'package:task/src/components/loader_component.dart';
import 'package:task/src/utils/index.dart';

class MyPosts extends StatefulWidget {
  const MyPosts({super.key});

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  bool loader = true;
  List<dynamic> postList = [];
  final PostsAPI _postAPI = PostsAPI();
  String id = '';

  @override
  void initState() {
    posts();
    super.initState();
  }

  Future posts() async {
    id = (await getDataFromStorage('id'))!;
    try {
      final response = await _postAPI.getPosts();
      if (response != null) {
        setState(() {
          loader = false;
          postList = response;
        });
      }
    } on HttpException catch (e) {
      debugPrint(e.message);
      setState(() {
        loader = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return loader
        ? const LoaderComponent()
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: postList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    postList[index]['userId'] == int.parse(id)
                        ? Text(
                            postList[index]['title'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 236, 19, 19)),
                          )
                        : Text(
                            postList[index]['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    Text(postList[index]['body']),
                    const Divider(
                      color: Colors.black,
                    )
                  ],
                );
              },
            ),
          );
  }
}
