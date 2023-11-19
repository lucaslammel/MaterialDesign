import 'package:flutter/material.dart';
import 'actions_carousel.dart';

class CategoryContent {
  final String title;
  final List<Widget> carouselItems;

  CategoryContent(this.title, this.carouselItems);
}

// Crie instâncias da classe para cada categoria
CategoryContent actionsContent = CategoryContent(
  'Actions',
  getActionsCarouselItems(),
);
