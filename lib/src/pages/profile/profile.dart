import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/src/model/user_model.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Username',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Consumer<UserDetailModal>(builder: (context, user, child) {
                      return Text(user.userName);
                    }),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.black,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Consumer<UserDetailModal>(builder: (context, user, child) {
                      return Text(user.email);
                    }),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.black,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Address',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Consumer<UserDetailModal>(builder: (context, user, child) {
                      return Text(user.address);
                    }),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.black,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Zipcode',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Consumer<UserDetailModal>(builder: (context, user, child) {
                      return Text(user.zipCode);
                    }),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.black,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
