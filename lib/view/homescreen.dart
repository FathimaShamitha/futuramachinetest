import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../model/foodcategorymodel.dart';
import '../model/fooditemmodel.dart';
import 'package:http/http.dart' as http;

class HomeScreenClass extends StatelessWidget {
  const HomeScreenClass({Key? key}) : super(key: key);

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

  Future<FoodCategoryModel> getCategories() async {
    var response = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));
    if (response.statusCode == 200) {
      var data = FoodCategoryModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception("Api Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.food_bank,
          color: Colors.white,
        ),
        title: const Text(
          'Home Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen,
        actions: const [
          Icon(
            Icons.logout,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        height: ht,
        width: wth,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                "Today's Meal",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: getFoodItems(),
                builder: (BuildContext context,
                    AsyncSnapshot<FoodItemModel> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.lightGreen,
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    List<Meals>? mealsList = snapshot.data!.meals;
                    return CarouselSlider.builder(
                        itemCount: 6,
                        itemBuilder: (context, index, realindex) {
                          final meal = mealsList![index];
                          return Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 150,
                                  width: wth,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(meal.strMealThumb!),
                                          fit: BoxFit.fitWidth)),
                                ),
                                Text(
                                  meal.strMeal!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          );
                        },
                        options: CarouselOptions(autoPlay: true));
                  } else {
                    return const Center(
                      child: Text('Something Went Wrong'),
                    );
                  }
                }),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Popular Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              child: FutureBuilder(
                  future: getCategories(),
                  builder: (BuildContext context,
                      AsyncSnapshot<FoodCategoryModel> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      List<Categories>? categoryList =
                          snapshot.data!.categories;
                      return GridView.builder(
                          itemCount: categoryList!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 1,
                                  crossAxisSpacing: 1),
                          itemBuilder: (context, index) {
                            final category = categoryList[index];
                            return Card(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CircleAvatar(
                                    radius: 60,
                                    backgroundImage: NetworkImage(
                                        category.strCategoryThumb!),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    category.strCategory!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            );
                          });
                    } else {
                      return Center(
                        child: Text('Something Went Wromg'),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
