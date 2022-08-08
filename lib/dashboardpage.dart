import 'package:burger_app_ui/burgerpage.dart';
import 'package:burger_app_ui/foodtabs.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 6,
                      spreadRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Color(0xFFC6E7FE),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/tuxedo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'SEARCH FOR',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.w800),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'RECIPES',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.w800),
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Container(
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(fontSize: 14),
                border: InputBorder.none,
                fillColor: Colors.grey.withOpacity(0.5),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'Recommended',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildListItem(
                'Pizza',
                'assets/pizza.png',
                '15',
                Color(0xFFFFE900),
                Color(0xFFFF9000),
              ),
              _buildListItem(
                'Taco',
                'assets/taco.png',
                '18',
                Color(0xFFC2E3FE),
                Color(0xFF6A8CAA),
              ),
              _buildListItem(
                'Sandwich',
                'assets/sandwich.png',
                '13',
                Color(0xFFD7FADA),
                Color(0xFF56CC7E),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TabBar(
            controller: tabController,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.withOpacity(0.5),
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              Tab(
                child: Text('FEATURED'),
              ),
              Tab(
                child: Text('RECOMMENDED'),
              ),
              Tab(
                child: Text('FAVORITES'),
              ),
              Tab(
                child: Text('OFFERS'),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 450,
          child: TabBarView(controller: tabController, children: [
            FoodTab(),
            FoodTab(),
            FoodTab(),
            FoodTab(),
          ]),
        ),
      ]),
    );
  }

  _buildListItem(String foodName, String imagePath, String price, Color bgColor,
      Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BurgerPage(
                    heroTag: foodName,
                    foodName: foodName,
                    pricePerItem: price,
                    imgPath: imagePath,
                  )));
        },
        child: Container(
          height: 175,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: bgColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: foodName,
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      imagePath,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                foodName,
                style: TextStyle(fontSize: 15, color: textColor),
              ),
              Text(
                '\$' + price,
                style: TextStyle(fontSize: 15, color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
