import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/home/home_bloc.dart';
import 'package:movie_app/bloc/magazine/magazine_bloc.dart';
import 'package:movie_app/bloc/search/search_bloc.dart';
import 'package:movie_app/screens/home_screen/home_screen.dart';
import 'package:movie_app/screens/search_screen/search_screen.dart';
import 'package:movie_app/screens/watch_list/watch_list_screen.dart';

import 'magazine_screen/magazine_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff131312).withOpacity(0.7),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
        child: FlashyTabBar(
          backgroundColor: const Color(0xff131312),
          height: 55,
          iconSize: 22,
          selectedIndex: _selectedIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              activeColor: Colors.white,
              icon: const Icon(
                Icons.home_filled,
                size: 30,
              ),
              title: const Text('Home'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.white,
              icon: const Icon(Icons.search, size: 30),
              title: const Text('Search'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.white,
              icon: const Icon(Icons.theaters, size: 30),
              title: const Text('watch list'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.white,
              icon: const Icon(Icons.menu_book_rounded, size: 30),
              title: const Text('Magazine'),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: getScreen(),
      ),
    );
  }
}

List<Widget> getScreen() {
  return <Widget>[
    BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => SearchBloc(),
      child: SearchScreen(),
    ),
    const WatchScreen(),
    BlocProvider(
      create: (context) => MagazineBloc(),
      child: const MagazineScreen(),
    ),
  ];
}
