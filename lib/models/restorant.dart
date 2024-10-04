import 'package:collection/collection.dart';
import 'package:ecommercerapp/models/cart_item.dart';
import 'package:ecommercerapp/models/food.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Restorant extends ChangeNotifier {
  final List<Food> _menu = [
    // Burgers
    Food(
      id: 'burger1',
      Foodcategory.burgers,
      [
        Addon(name: 'extra cheese ', price: 0.2),
        Addon(name: 'extra patty', price: 0.8),
      ],
      name: 'Classic Cheeseburger',
      description:
          'Juicy beef patty with cheese, lettuce, and tomato on a toasted bun. A satisfying classic for burger lovers!',
      imagepath: "lib/images/burgers/1.jpg", // Ensure path is correct
      price: 2.5,
    ),
    Food(
      id: 'burger2',
      Foodcategory.burgers,
      [
        Addon(name: 'extra bacon', price: 0.3),
        Addon(name: 'extra sauce', price: 0.2),
      ],
      name: 'Bacon Burger',
      description:
          'Crispy bacon on a beef patty with cheddar and special sauce. A smoky and flavorful treat!',
      imagepath: "lib/images/burgers/2.jpg", // Ensure path is correct
      price: 3.0,
    ),
    Food(
      id: 'burger3',

      Foodcategory.burgers,
      [
        Addon(name: 'extra avocado', price: 0.5),
        Addon(name: 'extra cheese', price: 0.2),
      ],
      name: 'Avocado Burger',
      description:
          'Beef patty topped with fresh avocado and cheese, served on a toasted bun. A delicious and healthy option!',
      imagepath: "lib/images/burgers/3.jpg", // Ensure path is correct
      price: 3.5,
    ),

    // Salads
    Food(
      id: 'salads1',
      Foodcategory.salads,
      [
        Addon(name: 'extra dressing', price: 0.2),
        Addon(name: 'extra veggies', price: 0.5),
      ],
      name: 'Caesar Salad',
      description:
          'Crisp romaine, crunchy croutons, and parmesan with creamy Caesar dressing. A fresh and classic choice!',
      imagepath: "lib/images/salads/1.jpg", // Ensure path is correct
      price: 3.5,
    ),
    Food(
      id: 'salads2',

      Foodcategory.salads,
      [
        Addon(name: 'extra olives', price: 0.2),
        Addon(name: 'extra feta', price: 0.5),
      ],
      name: 'Greek Salad',
      description:
          'Juicy tomatoes, cucumbers, olives, and feta tossed in olive oil. A refreshing Mediterranean delight!',
      imagepath: "lib/images/salads/2.jpg", // Ensure path is correct
      price: 3.0,
    ),
    Food(
      id: 'salads3',

      Foodcategory.salads,
      [
        Addon(name: 'extra dressing', price: 0.2),
        Addon(name: 'extra avocado', price: 0.8),
      ],
      name: 'Avocado Salad',
      description:
          'Fresh avocado slices and greens tossed with a light vinaigrette. A healthy and tasty option!',
      imagepath: "lib/images/salads/3.jpg", // Ensure path is correct
      price: 3.8,
    ),

    // Sides
    Food(
      id: 'sides1',
      Foodcategory.sides,
      [
        Addon(name: 'extra ketchup', price: 0.1),
        Addon(name: 'extra sauce', price: 0.3),
      ],
      name: 'French Fries',
      description:
          'Crispy golden fries seasoned to perfection. The perfect side for any meal!',
      imagepath: "lib/images/sides/1.jpg", // Ensure path is correct
      price: 1.5,
    ),
    Food(
      id: 'sides2',

      Foodcategory.sides,
      [
        Addon(name: 'extra dip', price: 0.2),
        Addon(name: 'extra garlic sauce', price: 0.3),
      ],
      name: 'Mozzarella Sticks',
      description:
          'Fried mozzarella sticks served hot with marinara for dipping. A cheesy, crispy delight!',
      imagepath: "lib/images/sides/2.jpg", // Ensure path is correct
      price: 2.5,
    ),
    Food(
      id: 'sides3',

      Foodcategory.sides,
      [
        Addon(name: 'extra sauce', price: 0.2),
        Addon(name: 'extra chili', price: 0.3),
      ],
      name: 'Chicken Wings',
      description:
          'Spicy fried chicken wings, crispy outside and juicy inside. Perfect for sharing or indulging!',
      imagepath: "lib/images/sides/3.jpg", // Ensure path is correct
      price: 3.0,
    ),

    // Desserts
    Food(
      id: 'desserts1',
      Foodcategory.desserts,
      [
        Addon(name: 'extra chocolate', price: 0.2),
        Addon(name: 'extra cream', price: 0.8),
      ],
      name: 'Classic Gateau',
      description:
          'Rich chocolate cake with decadent frosting. A must-have for chocolate lovers!',
      imagepath: "lib/images/desserts/1.jpg", // Ensure path is correct
      price: 2.5,
    ),
    Food(
      id: 'desserts2',

      Foodcategory.desserts,
      [
        Addon(name: 'extra caramel', price: 0.2),
        Addon(name: 'extra nuts', price: 0.5),
      ],
      name: 'Brownie',
      description:
          'Fudgy chocolate brownie with caramel drizzle. Chewy and delicious!',
      imagepath: "lib/images/desserts/2.jpg", // Ensure path is correct
      price: 3.0,
    ),
    Food(
      id: 'desserts3',

      Foodcategory.desserts,
      [
        Addon(name: 'extra syrup', price: 0.2),
        Addon(name: 'extra whipped cream', price: 0.3),
      ],
      name: 'Cheesecake',
      description:
          'Creamy cheesecake with a graham cracker crust. Classic and indulgent!',
      imagepath: "lib/images/desserts/3.jpg", // Ensure path is correct
      price: 3.5,
    ),

    // Drinks
    Food(
      id: 'drinks1',

      Foodcategory.drinks,
      [
        Addon(name: 'extra ice', price: 0.1),
        Addon(name: 'lemon', price: 0.2),
      ],
      name: 'Cola',
      description: 'Classic cola served ice-cold. Refreshing and satisfying!',
      imagepath: "lib/images/drinks/1.jpg", // Ensure path is correct
      price: 1.0,
    ),
    Food(
      id: 'drinks2',
      Foodcategory.drinks,
      [
        Addon(name: 'extra syrup', price: 0.2),
        Addon(name: 'whipped cream', price: 0.5),
      ],
      name: 'Iced Coffee',
      description:
          'Smooth iced coffee made with premium beans. A perfect pick-me-up!',
      imagepath: "lib/images/drinks/2.jpg", // Ensure path is correct
      price: 2.5,
    ),
    Food(
      id: 'drinks3',

      Foodcategory.drinks,
      [
        Addon(name: 'extra lemon', price: 0.2),
        Addon(name: 'extra mint', price: 0.3),
      ],
      name: 'Lemonade',
      description:
          'Freshly squeezed lemonade, sweet and tangy. A delightful drink for warm days!',
      imagepath: "lib/images/drinks/3.jpg", // Ensure path is correct
      price: 2.0,
    ),
  ];

  /*
  G E T T E R
  */
  List<Food> get menu => _menu;
  List<CartItem> get usercart => _cart;

  //create cart

  final List<CartItem> _cart = [];

  void addtocart(Food food, List<Addon> selectedaddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //if there is same food with same addons
      bool issamefood = item.food.id == food.id;
      bool issameaddon =
          const ListEquality().equals(item.selectedaddons, selectedaddons);
      return issameaddon && issamefood;
    });
    if (cartItem != null) {
      cartItem.quntity++;
    } else {
      _cart.add(
          CartItem(food: food, selectedaddons: selectedaddons, quntity: 1));
    }
    notifyListeners();
  }

  //remove form cart
  void removefromcart(CartItem cartitem) {
    int cartindex = _cart.indexOf(cartitem);
    if (cartindex != -1) {
      if (_cart[cartindex].quntity > 1) {
        _cart[cartindex].quntity--;
      } else {
        _cart.removeAt(cartindex);
      }
    }
    notifyListeners();
  }

  //total price

  double totalprice() {
    double totalprice = 0.0;

    for (CartItem item in _cart) {
      totalprice += item.food.price;
      for (Addon addon in item.selectedaddons) {
        totalprice += addon.price;
      }
    }
    return totalprice;
  }

  //geting total item count

  int totalitemcount() {
    int totalitemcount = 0;
    for (CartItem item in _cart) {
      totalitemcount += item.quntity;
    }
    return totalitemcount;
  }

  int itemsyouhave(CartItem item, cart) {
    int count = 0;
    // ignore: unused_local_variable
    for (CartItem item in cart) {
      count++;
    }
    return count;
  }

  //cleat cart
  void clearcart() {
    _cart.clear();
    notifyListeners();
  }

  //convert price to string  user toStringAsFixed to formate duoble number  0.'00'  toStringAsFixed('2')ال2 دي بتاعت الارقام العشريه

  String _formatprice(double price) {
    return '\$ ${price.toStringAsFixed(2)}';
  }

  //formate list of addons
  String formatAddon(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name}  (${_formatprice(addon.price)})")
        .join(', ');
  }

  String displayTheRecepit() {
    final recepit = StringBuffer();
    recepit.writeln('Here is the recepit');
    recepit.writeln('');

    //formate date
    String formatedate =
        DateFormat('yy:mm:dd  hh:mm:ss').format(DateTime.now());

    recepit.writeln(formatedate);
    recepit.writeln();
    recepit.writeln('-------------------');
    for (CartItem cartItem in _cart) {
      recepit.writeln(
          '${cartItem.quntity} x ${cartItem.food.name} - ${_formatprice(cartItem.food.price)} ');

      if (cartItem.selectedaddons.isNotEmpty) {
        recepit.writeln(' add ons:\n ${formatAddon(cartItem.selectedaddons)} ');
      }
      recepit.writeln();
      recepit.writeln('---------------------------');
    }
    recepit.writeln();
    recepit.writeln();
    recepit.writeln('total order items ${totalitemcount()}');
    recepit.writeln('total price ${_formatprice(totalprice())}');
    return recepit.toString();
  }
}
