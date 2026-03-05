import 'package:flutter/material.dart';
import 'package:foody_submission/detail_screen.dart';
import 'package:foody_submission/model/food_data.dart';
 
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  //Logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'images/logo.png',
                          width: 70,
                          height: 70,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Food of Indonesia',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 45,
                        child: ListCategory(),
                      )
                      //List of food
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.79,
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        if (constraints.maxWidth <= 600) {
                          return const FoodDataListView();
                        } else if (constraints.maxWidth <= 1200) {
                          return const FoodDataGrid(gridCount: 4);
                        } else {
                          return const FoodDataGrid(gridCount: 6);
                        }
                      }//FoodDataListView(),  
                    )                  
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListCategory extends StatelessWidget {
  ListCategory({Key? key}) : super(key: key);

  final distinctCategory = foodDataList.map((e) => e.category).toSet().toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // final CategoryData category = categoryList[index];

          return Container(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black38, // red as border color
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      distinctCategory[index],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: distinctCategory.length,
      ),
    );
  }
}

class FoodDataGrid extends StatelessWidget {
  final int gridCount;

  const FoodDataGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: foodDataList.map((foodData) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(foodData: foodData);
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      foodData.imageAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      foodData.name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(
                      foodData.price,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class FoodDataListView extends StatelessWidget {
  const FoodDataListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final FoodData foodData = foodDataList[index];
        return Card(
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            onTap: () {
              // print(foodData.name);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailScreen(
                      foodData: foodData,
                    );
                  },
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                ClipRRect(
                  child: Image.asset(
                    foodData.imageAsset,
                    width: 150,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    bottom: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        foodData.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        foodData.category,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        foodData.price,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: foodDataList.length,
    );
  }
}