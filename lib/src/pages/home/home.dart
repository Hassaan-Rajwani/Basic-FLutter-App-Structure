// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:task/src/components/button_component.dart';
import 'package:task/src/pages/posts/posts.dart';
import 'package:task/src/pages/profile/profile.dart';
import 'package:task/src/pages/signin/signin.dart';
import 'package:task/src/utils/index.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                child: const Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              AppButtonComponent(
                title: 'Logout',
                onPress: () async {
                  await deleteDataFromStorage('token');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignIn(),
                    ),
                  );
                },
                isLoading: false,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          title: const Text('Lorem Ipsum'),
          backgroundColor: const Color.fromARGB(255, 236, 19, 19),
        ),
        body: Column(
          children: const [
            Material(
              elevation: 10,
              color: Color.fromARGB(255, 236, 19, 19),
              child: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(
                    text: 'ALL POSTS',
                  ),
                  Tab(
                    text: 'PROFILE',
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MyPosts(),
                  MyProfile(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
