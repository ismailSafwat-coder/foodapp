import 'package:ecommercerapp/models/food.dart';

class CartItem {
  final Food food;
  final List<Addon> selectedaddons;
  int quntity;

  CartItem({
    required this.food,
    required this.selectedaddons,
    this.quntity = 1,
  });

  double get totalprice {
    double addonsPrice =
        selectedaddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonsPrice) * quntity;
  }
}
