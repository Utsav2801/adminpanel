import 'package:flutter/material.dart';

class DashboardModel {
  String name;
  String imageUrl;
  Widget child;

  DashboardModel({
    required this.name,
    required this.imageUrl,
    required this.child,
  })  : assert(name != null),
        assert(imageUrl != null),
        assert(child != null);
}
