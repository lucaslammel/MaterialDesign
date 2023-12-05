import 'package:flutter/material.dart';
import 'examples_carousel.dart';

class ExamplesContent {
  final String title;
  final List<Widget> carouselItems;

  ExamplesContent(this.title, this.carouselItems);
}

ExamplesContent examplesContent = ExamplesContent(
  'Exemplos',
  getExamplesCarouselItems(),
);
