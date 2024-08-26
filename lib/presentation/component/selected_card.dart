// selectable_card.dart
import 'package:flutter/material.dart';
import 'package:push/model/ItemModel.dart';

// selectable_card.dart

import 'package:flutter/material.dart';

class SelectableCard extends StatelessWidget {
  final ItemModel item;
  final VoidCallback onTap;

  const SelectableCard({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: item.isSelected ? Colors.deepOrange : Colors.deepPurple,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: item.isSelected ? Colors.deepOrange : Colors.deepPurple,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    item.name.toString().toUpperCase() ?? '',
                    style: TextStyle(
                      color: item.isSelected ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    item.email ?? '',
                    style: TextStyle(
                      color: item.isSelected ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    item.company?.name ?? '',
                    style: TextStyle(
                      color: item.isSelected ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child:Text(
                item.address!.city ?? '',
                style: TextStyle(
                  color: item.isSelected ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            item.isSelected
                ? const Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.indigo,
                      size: 24,
                    ),
                  )
                : const Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
