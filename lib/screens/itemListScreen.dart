import 'package:arcore_flutter_plugin_example/models/ItemModel.dart';
import 'package:arcore_flutter_plugin_example/screens/arViewScreen.dart';
import 'package:flutter/material.dart';

class itemListScreen extends StatelessWidget {
  List<ItemModel> chairs = [
    ItemModel(
      'Black Chair',
      'Double Bed with 2 Lamps',
      'items/black_chair.jpg',
      'black_chair.sfb',
    ),
    ItemModel(
      'White Chair',
      'White Sofa For Your Home',
      'items/white_chair.jpg',
      'white_chair.sfb',
    ),
  ];
  List<ItemModel> sofas = [
    ItemModel(
      'Roundable Sofa',
      'Roundable Sofa For Your Home',
      'items/round_sofa.jpg',
      'round_sofa.sfb',
    ),
    ItemModel(
      'Brown Sofa',
      'Brown Sofa For Your Home',
      'items/brown_sofa.jpg',
      'brown_sofa.sfb',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'AR Mebellar',
                  style: TextStyle(fontSize: 48, color: Colors.white),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 6),
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: Colors.red,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(
                              child: Text(
                                "Chairs",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Sofas",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Chairs
                            ListView.separated(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              itemBuilder: (ctx, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ARViewScreen(
                                          itemModel: sofas[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Image.asset(
                                          "${chairs[index].pic}",
                                          width: 60,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              chairs[index].name,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              chairs[index].detail,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black87),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (ctx, int index) => Divider(),
                              itemCount: chairs.length,
                            ),
                            // Sofas
                            ListView.separated(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              itemBuilder: (ctx, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ARViewScreen(
                                          itemModel: sofas[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Image.asset(
                                          "${sofas[index].pic}",
                                          width: 60,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              sofas[index].name,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              sofas[index].detail,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black87),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (ctx, int index) => Divider(),
                              itemCount: sofas.length,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
