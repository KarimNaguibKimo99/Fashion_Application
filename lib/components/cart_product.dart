import 'package:flutter/material.dart';

class Card_products extends StatefulWidget {
  @override
  _Card_productsState createState() => _Card_productsState();
}

class _Card_productsState extends State<Card_products> {
  var Products_on_the_cart = [
    {
      "name": "Blazer One",
      "picture": "images/products/blazer1.jpeg",
      "price": 85,
      "size": "M",
      "color": "Black",
      "quantity": 4
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "price": 50,
      "size": "7",
      "color": "Pink",
      "quantity": 2
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Products_on_the_cart.length,
      itemBuilder: (context, index) {
        return Single_cart_product(
          cart_product_name: Products_on_the_cart[index]["name"],
          cart_product_color: Products_on_the_cart[index]["color"],
          cart_product_qty: Products_on_the_cart[index]["quantity"],
          cart_product_size: Products_on_the_cart[index]["size"],
          cart_product_price: Products_on_the_cart[index]["price"],
          cart_prdocut_picture: Products_on_the_cart[index]["picture"],
        );
      },
    );
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_prdocut_picture;
  final cart_product_price;
  final cart_product_size;
  final cart_product_color;
  final cart_product_qty;

  const Single_cart_product(
      {Key key,
      this.cart_product_name,
      this.cart_prdocut_picture,
      this.cart_product_price,
      this.cart_product_size,
      this.cart_product_color,
      this.cart_product_qty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: new Image.asset(
              cart_prdocut_picture,
              width: 80.0,
              height: 80.0,
            ),
          ),
          //image

          //title && subtitle
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    cart_product_name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  // row inside column
                  new Row(
                    children: <Widget>[
                      new Text(
                        "Size:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 17.0),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      new Text(
                        cart_product_size,
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Color:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 17.0),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        cart_product_color,
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),

                  new Text(
                    "\$$cart_product_price",
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
          // icon button with text
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
                  new Text("$cart_product_qty"),
                  IconButton(
                      icon: Icon(Icons.arrow_drop_down), onPressed: () {}),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
