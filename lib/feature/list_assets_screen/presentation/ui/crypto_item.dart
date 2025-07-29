import 'package:flutter/material.dart';
import 'package:list_assets/core/data/crypto_asset.dart';

class CryptoItem extends StatelessWidget {
  final CryptoAsset asset;

  CryptoItem({super.key, required this.asset});

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
              color: asset.color,
            ),
          ),
          const SizedBox(width: 16),

          // Название валюты
          Expanded(
            child: Text(
              asset.datum.symbol,
              style: const TextStyle(
                fontSize: 17,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Стоимость
          Text(
            asset.formattedPrice,
            style: const TextStyle(
                fontSize: 17,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
