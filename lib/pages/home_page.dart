import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:string_scanner/string_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  final PosterList = const <String> [
    'assets/images/ramadhan-kareem.png'
    'assets/images/ idl-fitr.png'
    'assets/images/idl-adh.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildCarouselSection(),
            _buildCarouselSection()
          ],
        ),

      ),
    );
  }
  
  Widget _buildMenuItem(String iconpath, String title, String routename){
    return Column(
      children: [
        Image.asset(iconpath),
        Text(title)
      ],
    );
  }
  
  Widget _buildMenuGridSection(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildMenuItem(),
          _buildMenuItem(),
          _buildMenuItem(),
          _buildMenuItem(),
        ],
      ),
    );
  }

  Widget _buildCarouselSection() {
    return Column(
      children: [
        const SizedBox(height: 20,),
        CarouselSlider.builder(
          itemCount: PosterList.length,
          itemBuilder: (context, index, realIndex) {
            final poster = PosterList[index];
            return Container(
              margin: EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: Image.asset(
                  poster,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
            );
        },
          options: CarouselOptions(
            autoPlay: true,
            height: 300,
            enlargeCenterPage: true,
            viewportFraction: 0.7,
            onPageChanged: (index, reason) {
              setState(()=> _currentIndex = index);
            }
          )),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: PosterList.asMap().entries.map((entry){
              return GestureDetector(
                onTap: () => _currentIndex.animatetoPage(entry.key),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key
                        ? Colors.amber
                        : Colors.grey
                  ),
                ),
              );
            }).toList()
          )
      ],
    );
  }
}

extension on int {
  void animatetoPage(int key) {}
}