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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 47, 141, 133),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Image.asset('assets/images/ic_menu_doa.png'),
                                Text(
                                  'Doa & Zikir',
                                style:  TextStyle(
                                  fontFamily: 'poppinsRegular',
                                  color: Colors.white,
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                        InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Image.asset('assets/images/ic_menu_jadwal_sholat.png'),
                                Text(
                                  'Jadwal Sholat',
                                style:  TextStyle(
                                  fontFamily: 'poppinsRegular',
                                  color: Colors.white,
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                        InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Image.asset('assets/images/ic_menu_video_kajian.png'),
                                Text(
                                  'Video kajian',
                                style:  TextStyle(
                                  fontFamily: 'poppinsRegular',
                                  color: Colors.white,
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                        InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Image.asset('assets/images/ic_menu_zakat.png'),
                                Text(
                                  'zakat',
                                style:  TextStyle(
                                  fontFamily: 'poppinsRegular',
                                  color: Colors.white,
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column()
          ],
        ),
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