import 'package:flutter/material.dart';

class SliderItemModel{
  String imageUrl;
  String title;
  String description;
  String shortDescription;

  SliderItemModel({this.imageUrl, this.title, this.description, this.shortDescription});
}

final slideList = [
  SliderItemModel(
      //imageUrl: 'assets/images/slider/Businessman-watering-a-money-tree.png',
      title: 'Become the best version of yourself, starting today.',
      description: 'Access expert knowledge tailored to your goals.',
      shortDescription:'asd'
  ),
  SliderItemModel(
      //imageUrl: 'assets/images/slider/Businessman-watering-a-money-tree.png',
      title: 'Learn by being involved.',
      description: 'Build rapport and grow through interactions in a positive environment.',
      shortDescription:'asd'
  ),
  SliderItemModel(
      //imageUrl: 'assets/images/slider/Businessman-watering-a-money-tree.png',
      title: 'Shop practical products and services',
      description: 'Access created life-improving products from value conscuous brand.',
      shortDescription:'asd'
  ),
];
