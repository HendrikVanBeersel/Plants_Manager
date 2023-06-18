import 'package:flutter/material.dart';
import 'package:plants_manager/stores/plants_store.dart';
import 'package:plants_manager/themes/app_colors.dart';
import 'package:provider/provider.dart';
import 'screens/thirsty_plants_screen.dart';
import 'screens/add_plant_screen.dart';
import 'screens/rooms_screen.dart';
import 'screens/all_plants_screen.dart';
import 'themes/app_theme.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PlantsStore()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PlantsStore>().loadState();
    return MaterialApp(
      title: 'Flutter App',
      theme: AppTheme.mainTheme(),
      home: const BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ThirstyPlantsScreen(),
    AllPlantsScreen(),
    RoomsScreen(),
    AddPlantScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: AppColors.primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.pageview),
              label: 'all plants',
              backgroundColor: AppColors.primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.pages),
              label: 'rooms',
              backgroundColor: AppColors.primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'add Plant',
              backgroundColor: AppColors.primaryColor),
        ],
      ),
    );
  }
}
