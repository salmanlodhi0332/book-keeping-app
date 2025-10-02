import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CommonBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavItem(
            icon: Icons.assessment,
            label: 'Measurement',
            isSelected: selectedIndex == 0,
            onTap: () => onItemTapped(0),
          ),
          BottomNavItem(
            icon: Icons.location_on,
            label: 'Location',
            isSelected: selectedIndex == 1,
            onTap: () => onItemTapped(1),
          ),
          BottomNavItem(
            icon: Icons.camera_alt,
            label: 'GPS Camera',
            isSelected: selectedIndex == 2,
            onTap: () => onItemTapped(2),
          ),
          BottomNavItem(
            icon: Icons.settings,
            label: 'Settings',
            isSelected: selectedIndex == 3,
            onTap: () => onItemTapped(3),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.black : Colors.black.withOpacity(0.5),
            size: 24.sp,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.black.withOpacity(0.5),
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}