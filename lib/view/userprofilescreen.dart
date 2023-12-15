import 'package:flutter/material.dart';
import 'package:foodapp/view/userdetailsscreen.dart';
import 'package:provider/provider.dart';

import '../controller/usercontroller.dart';

class UserProfileClass extends StatelessWidget {
  const UserProfileClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserController>(context, listen: false);
    userProvider.getUsers();

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.food_bank,
          color: Colors.white,
        ),
        title: const Text(
          'User List',
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
      body: Consumer<UserController>(
        builder: (BuildContext context, userController, child) {
          if (userController.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.lightGreen,
              ),
            );
          } else {
            return ListView.builder(
                itemCount: userController.userList.length,
                itemBuilder: (context, index) {
                  final user = userController.userList[index];
                  return Card(
                    elevation: 2,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(user.name!),
                      subtitle: Text(user.email!),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserDetailsClass(
                                      user: user,
                                    )));
                      },
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
