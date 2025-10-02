import 'package:boiler_plate_app/components/common_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


Widget buildAnimatedDropdown({
    required String title,
    required bool showOptions,
    required VoidCallback onTap,
    required List<String> options,
    required String selectedOption,
    required Function(String) onOptionSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Column(
          key: ValueKey(showOptions),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: TextStyle(fontSize: 16.sp)),
                    Icon(
                      showOptions
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 22,
                    ),
                  ],
                ),
              ),
            ),
            if (showOptions)
              ...options.map((opt) {
                final isSelected = opt == selectedOption;
                return GestureDetector(
                  onTap: () => onOptionSelected(opt),
                  child: Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? CommonColors.primaryColor.withOpacity(0.2)
                          : Colors.white,
                      border: Border.all(
                        color: isSelected
                            ? CommonColors.primaryColor
                            : Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(opt.capitalizeFirst!,
                            style: TextStyle(fontSize: 15.sp)),
                        if (isSelected)
                          Icon(Icons.check, color: Colors.green, size: 20),
                      ],
                    ),
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }
