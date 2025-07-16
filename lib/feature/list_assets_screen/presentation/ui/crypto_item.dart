import 'dart:math';

import 'package:flutter/material.dart';
import 'package:list_assets/core/data/assets.dart';
import 'package:list_assets/core/util/format.dart';

class CryptoItem extends StatelessWidget {
  final Datum asset;
  final Color containerColor;

   CryptoItem({super.key, required this.asset}) : containerColor = _generateRandomColor();

  static Color _generateRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256), // Red: 0-255
      random.nextInt(256), // Green: 0-255
      random.nextInt(256), // Blue: 0-255
      1.0, // Opacity
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          // Контейнер для иконки
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: containerColor,
            ),
          ),
          const SizedBox(width: 16),

          // Название валюты
          Expanded(
            child: Text(
              asset.symbol,
              style: const TextStyle(
                fontSize: 17,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Стоимость
          Text(
            formatCurrency(asset.priceUsd),
            style: const TextStyle(
              fontSize: 17,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}