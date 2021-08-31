import 'package:flutter/material.dart';
import '../models/cart_item.dart';
class Cart with ChangeNotifier{
  Map<String, CarItem> _items = {};

  Map<String, CarItem> get items  {
    return {..._items};
  }
}