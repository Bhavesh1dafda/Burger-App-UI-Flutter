import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodTab extends StatefulWidget {
  FoodTab({Key? key}) : super(key: key);

  @override
  State<FoodTab> createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        _buildListItem('Delicious Hot Dog', '4.0', '6', 'assets/burger.png'),
        _buildListItem('Delicious Doughn', '6.0', '12', 'assets/doughnut.png'),
      ],
    ));
  }

  _buildListItem(String foodName, rating, String price, String imgPath) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 210,
            child: Row(
              children: [
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color(0xFFFFE3DF)),
                  child: Center(
                    child: Image.asset(
                      imgPath,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      foodName,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rating 4.5',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFF68D7F),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$' + '8',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFF68D7F),
                          ),
                        ),
                        Text(
                          '\$' + '18',
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            heroTag: foodName,
            mini: true,
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            backgroundColor: Color(0xFFFE7D6A),
          ),
        ],
      ),
    );
  }
}
