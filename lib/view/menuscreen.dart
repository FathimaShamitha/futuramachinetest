import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/fooditemmodel.dart';
import 'package:http/http.dart' as http;

import 'fooddetails.dart';

class MenuScreenClass extends StatelessWidget {
  const MenuScreenClass({Key? key}) : super(key: key);

  Future<FoodItemModel> getFoodItems() async {
    var res = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?f=b"));
    if (res.statusCode == 200) {
      var data = FoodItemModel.fromJson(jsonDecode(res.body));
      return data;
    } else {
      throw Exception("Api Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.food_bank,
          color: Colors.white,
        ),
        title: const Text(
          'Menu Screen',
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
      body: FutureBuilder(
        future: getFoodItems(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.lightGreen,
              ),
            );
          }
          if (snapshot.hasData) {
            List<Meals>? mealsList = snapshot.data!.meals;
            return GridView.builder(
                itemCount: mealsList!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 1, crossAxisSpacing: 1),
                itemBuilder: (context, index) {
                  final meals = mealsList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodDetailsClass(
                                    meals: meals,
                                  )));
                    },
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(mealsList![index].strMealThumb!),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            mealsList![index].strMeal!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: Text("Something Went Wromg"),
            );
          }
        },
      ),
    );
  }
}
