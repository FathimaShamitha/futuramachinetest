import 'package:flutter/material.dart';

import '../model/usermodel.dart';

class UserDetailsClass extends StatelessWidget {
  const UserDetailsClass({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UserDetails',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
                  'Personal Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                )),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text('Name : ${user.name}'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('UserNmae : ${user.username}'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Email : ${user.email}'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Phone : ${user.phone}'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Website : ${user.website}'),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                'Adress :',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('${user.address?.street}'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('${user.address?.suite}'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('${user.address?.city}'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('${user.address?.zipcode}'),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                'Company :',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('${user.company?.name}'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('${user.company?.catchPhrase}'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('${user.company?.bs}'),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
