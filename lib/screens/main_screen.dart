import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/home/home_bloc.dart';
import 'package:movie_app/screens/home_screen/home_screen.dart';
import 'package:movie_app/screens/search/search_scree.dart';
import 'package:movie_app/screens/watch_list_screen/watch_list_screen.dart';

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
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: FlashyTabBar(
          backgroundColor: const Color(0xff1F2722),
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
              icon: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.white,
              icon: const Icon(Icons.search),
              title: const Text('Search'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.white,
              icon: const Icon(Icons.theaters),
              title: const Text('watch list'),
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
    SearchScreen(),
    WatchListScreen()
  ];
}
