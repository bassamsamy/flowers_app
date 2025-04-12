import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // Light background
      body: Stack(
        children: [
          // Status Bar (iOS style)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 48,
              padding: const EdgeInsets.fromLTRB(35, 16, 20, 16),
              decoration: const BoxDecoration(
                color: Color(0xFFF9ECF0), // Light pink
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Clock
                  Row(
                    children: [
                      Text(
                        '10',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0C1015),
                        ),
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0C1015),
                        ),
                      ),
                      Text(
                        '30',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0C1015),
                        ),
                      ),
                    ],
                  ),
                  // Icons
                  Row(
                    children: [
                      Icon(Icons.signal_cellular_alt,
                          size: 18, color: Color(0xFF0C1015)),
                      SizedBox(width: 8),
                      Icon(Icons.wifi, size: 16, color: Color(0xFF0C1015)),
                      SizedBox(width: 8),
                      Icon(Icons.battery_full,
                          size: 24, color: Color(0xFF0C1015)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Product details
          Positioned(
            top: 48,
            left: 0,
            right: 0,
            child: Container(
              height: 400,
              decoration: const BoxDecoration(
                color: Color(0xFFF9ECF0), // Light pink
              ),
            ),
          ),
          const Positioned(
            top: 464,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EGP 1,500',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0C1015),
                  ),
                ),
                Text(
                  'All prices include tax',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF535353),
                  ),
                ),
                Text(
                  '15 Pink Rose Bouquet',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0C1015),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD21E6A), // Main color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              onPressed: () {
                // Add to cart functionality
              },
              child: const Text(
                'Add to cart',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFF9F9F9),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
