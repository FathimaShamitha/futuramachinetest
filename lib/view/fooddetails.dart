import 'package:flutter/material.dart';
import 'package:foodapp/model/fooditemmodel.dart';

class FoodDetailsClass extends StatelessWidget {
  const FoodDetailsClass({Key? key, required this.meals}) : super(key: key);

  final Meals meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(meals.strMealThumb!),
          ),
          Center(
            child: Text(
              meals.strMeal!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text('Category : ${meals.strCategory}',style: TextStyle(fontSize: 18),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text('Area : ${meals.strArea}',style:  TextStyle(fontSize: 18),),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Instructions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(meals.strInstructions!),
        ],
      ),
    );
  }
}
