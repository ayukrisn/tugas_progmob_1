import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_progmob_1/home_page.dart';
import 'package:tugas_progmob_1/buddies_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar( 
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.calendar_month), label: 'Calendar'),
            NavigationDestination(icon: Icon(Icons.group), label: 'Buddies'),
            NavigationDestination(icon: Icon(Icons.settings), label: 'Settings')
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomePage(),
    Container(color: Colors.blue),
    BuddiesPage(),
    Container(color: Colors.black),
  ];
}