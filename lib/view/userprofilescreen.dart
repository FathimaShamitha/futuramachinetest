import 'package:flutter/material.dart';

class UserProfileClass extends StatelessWidget {
  const UserProfileClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.food_bank,
          color: Colors.white,
        ),
        title: const Text(
          'User Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen,
        actions: [
          Icon(
            Icons.logout,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Center(child: CircleAvatar(radius: 80,child: Icon(Icons.person,color: Colors.white,size: 60,),))
        ],
      ),
    );
  }
}
