import 'package:flutter/material.dart';
import 'package:Fashion_Application/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer One",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "cool hills",
      "picture": "images/products/hills1.jpeg",
      "old_price": 12,
      "price": 14,
    },
    {
      "name": "Blazer Two",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 24,
      "price": 14,
    },
    {
      "name": "Black Dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 140,
      "price": 60,
    },
    {
      "name": "Red Shoe",
      "picture": "images/products/hills2.jpeg",
      "old_price": 25,
      "price": 20,
    },
    {
      "name": "Grey Shoe",
      "picture": "images/products/shoe1.jpg",
      "old_price": 100,
      "price": 60,
    },
    {
      "name": "Milton Pants",
      "picture": "images/products/pants1.jpg",
      "old_price": 80,
      "price": 40,
    },
    {
      "name": "Grey Pants",
      "picture": "images/products/pants2.jpeg",
      "old_price": 140,
      "price": 100,
    },
    {
      "name": "Flower Skirt",
      "picture": "images/products/skt1.jpeg",
      "old_price": 130,
      "price": 60,
    },
    {
      "name": "Short Skirt ",
      "picture": "images/products/skt2.jpeg",
      "old_price": 300,
      "price": 100,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              product_name: product_list[index]['name'],
              prdocut_picture: product_list[index]['picture'],
              product_old_price: product_list[index]['old_price'],
              product_price: product_list[index]['price'],
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final product_name;
  final prdocut_picture;
  final product_old_price;
  final product_price;

  const Single_prod(
      {Key key,
      this.product_name,
      this.prdocut_picture,
      this.product_old_price,
      this.product_price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: new Text("hero 1"),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(

                  // here we are passing the values of the product to the product details page
                  builder: (context) => new ProductDetails(
                        product_detail_name: product_name,
                        product_detail_new_price: product_price,
                        product_detail_old_price: product_old_price,
                        product_detail_picture: prdocut_picture,
                      ))),
              child: GridTile(
                  footer: Container(
                      color: Colors.white,
                      child: new Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              product_name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                          ),
                          new Text(
                            "\$${product_price}",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  child: Image.asset(
                    prdocut_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
