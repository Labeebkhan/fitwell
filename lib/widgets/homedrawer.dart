import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/Drawer.dart';
import '../SettingPage/dashboard.dart';
import '../SettingPage/home.dart';
import '../SettingPage/Profile.dart';
import '../SettingPage/setting.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return Drawer(
          backgroundColor: Colors.black,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                color: Colors.white10,
                height: 100,
                child: const Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),

              // Profile item
              _buildDrawerItem(
                context,
                'Profile',
                Icons.person,
                navigationProvider.selectedItem,
                () => _navigateToPage(context, 'Profile'),
              ),

              // Settings item
              _buildDrawerItem(
                context,
                'Settings',
                Icons.settings,
                navigationProvider.selectedItem,
                () => _navigateToPage(context, 'Settings'),
              ),

              // Dashboard item
              _buildDrawerItem(
                context,
                'Dashboard',
                Icons.dashboard,
                navigationProvider.selectedItem,
                () => _navigateToPage(context, 'Dashboard'),
              ),

              // Home item
              _buildDrawerItem(
                context,
                'Home',
                Icons.home,
                navigationProvider.selectedItem,
                () => _navigateToPage(context, 'Home'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    String title,
    IconData icon,
    String selectedItem,
    VoidCallback onTap,
  ) {
    bool isSelected = selectedItem == title;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isSelected ? Border.all(color: Colors.orange, width: 1) : null,
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? Colors.orange : Colors.white),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.orange : Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  void _navigateToPage(BuildContext context, String pageName) {
    // Update selected item
    Provider.of<NavigationProvider>(
      context,
      listen: false,
    ).selectItem(pageName);

    // Close drawer
    Navigator.pop(context);

    // Navigate to specific page based on selection
    switch (pageName) {
      case 'Profile':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
        break;
      case 'Settings':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        break;
      case 'Dashboard':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
        break;
      case 'Home':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Setting()),
        );
        break;
    }
  }
}
