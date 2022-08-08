import 'package:flutter/material.dart';

class BurgerPage extends StatefulWidget {
  const BurgerPage(
      {Key? key, this.imgPath, this.foodName, this.pricePerItem, this.heroTag})
      : super(key: key);
  final imgPath, foodName, pricePerItem, heroTag;

  @override
  State<BurgerPage> createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  var netPrice = 0.0;
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Stack(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    color: Colors.transparent,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFFE7D6A),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFE7D6A).withOpacity(0.3),
                          blurRadius: 6,
                          spreadRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1,
                    right: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: 7,
                            color: Color(0xFFFE7D6A),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'SUPER',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.w800),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            widget.foodName.toString().toUpperCase(),
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.w800),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
                tag: widget.heroTag,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.imgPath), fit: BoxFit.cover),
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 45,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0XFFFE7D6A).withOpacity(0.1),
                              blurRadius: 6,
                              spreadRadius: 6,
                              offset: Offset(5, 11),
                            ),
                          ]),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.favorite_border,
                          size: 25,
                          color: Color(0xFFFE7D6A),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35),
                Stack(
                  children: [
                    Container(
                      height: 45,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0XFFFE7D6A).withOpacity(0.1),
                              blurRadius: 6,
                              spreadRadius: 6,
                              offset: Offset(5, 11),
                            ),
                          ]),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.restore,
                          size: 25,
                          color: Color(0xFFFE7D6A),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 75,
              width: 125,
              color: Colors.white,
              child: Center(
                child: Text(
                  '\$' + (int.parse(widget.pricePerItem) * quantity).toString(),
                  style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFF5E6166),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              height: 60,
              width: 225,
              decoration: BoxDecoration(
                  color: Color(0XFFFE7D6A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    width: 105,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        IconButton(
                            iconSize: 17,
                            onPressed: () {
                              adjustQuntity('MINUS');
                            },
                            icon: Icon(
                              Icons.remove,
                              color: Color(0XFFFE7D6A),
                            )),
                        Text(
                          quantity.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0XFFFE7D6A),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              adjustQuntity('PlUS');
                            },
                            iconSize: 17,
                            icon: Icon(
                              Icons.add,
                              color: Color(0XFFFE7D6A),
                            )),
                      ],
                    ),
                  ),
                  Text(
                    'Add To Cart',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'FEATURED',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          height: 225,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildItem('1'),
              _buildItem('2'),
            ],
          ),
        )
      ],
    );
  }

  _buildItem(String columnNumber) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(children: [
        if (columnNumber == '1')
          builColumnItem(
              'assets/cheese.png', 'Sweet Cheese', '11', Color(0xFFFBD6F5)),
        if (columnNumber == '1') SizedBox(height: 15),
        if (columnNumber == '1')
          builColumnItem(
              'assets/burger.png', 'Deilicius Burger', '13', Color(0xFFFBD6F5)),
        if (columnNumber == '2')
          builColumnItem(
              'assets/taco.png', 'Sweet Taco', '15', Color(0xFFC2E3FE)),
        if (columnNumber == '2') SizedBox(height: 15),
        if (columnNumber == '2')
          builColumnItem('assets/sandwich.png', 'Cruncy Sandwich', '10',
              Color(0xFFD7FADA)),
      ]),
    );
  }

  builColumnItem(String imgPath, String foodName, String price, Color bgColor) {
    return Row(
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
                  color: bgColor,
                ),
                child: Center(
                  child: Image.asset(
                    imgPath,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodName,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    '\$' + price,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFE7D6A),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  adjustQuntity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;
      case 'MINUS':
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
          }
        });
    }
  }
}
