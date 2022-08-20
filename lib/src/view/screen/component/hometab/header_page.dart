import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget {
  List<String> listImage = [
    'https://cdn.discordapp.com/attachments/958362266540060756/1010620283675230349/DINO.jpg',
    'https://cdn.discordapp.com/attachments/958362266540060756/1010620283675230349/DINO.jpg',
    'https://cdn.discordapp.com/attachments/958362266540060756/1010620283675230349/DINO.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1.0,
        autoPlay: true,
        enlargeCenterPage: false,
        // autoPlay: false,
      ),
      items: listImage
          .map((e) => Image.network(
                e,
                fit: BoxFit.cover,
              ))
          .toList(),
    );
  }
}
