import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewArrivalsCarousel extends StatelessWidget {
  const NewArrivalsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> newArrivals = [
      {
        'image': 'https://example.com/new-arrival1.jpg',
        'title': 'Special Cappuccino',
        'subtitle': 'Limited Edition',
      },
      {
        'image': 'https://example.com/new-arrival2.jpg',
        'title': 'Vanilla Latte',
        'subtitle': 'New Flavor',
      },
      {
        'image': 'https://example.com/new-arrival3.jpg',
        'title': 'Chocolate Muffin',
        'subtitle': 'Freshly Baked',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "New Arrivals",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'SofiaPro', // Adjust this to your preferred font
              color: Colors.deepPurple, // New color for text
            ),
          ),
        ),
        CarouselSlider(
          items: newArrivals.map((arrival) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20), // Rounded corners for entire carousel item
              child: Stack(
                children: [
                  Image.network(
                    arrival['image']!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250, // Increased height for a more dynamic effect
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black54, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(20), // Same rounded corners
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          arrival['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22, // Larger title for better visibility
                            letterSpacing: 1.2,
                          ),
                        ),
                        Text(
                          arrival['subtitle']!,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontStyle: FontStyle.italic, // Adds emphasis
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 250, // Increased height for the carousel
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.8, // Slightly smaller items for spacing
            aspectRatio: 16 / 9,
            autoPlayInterval: const Duration(seconds: 4), // Longer interval
            enlargeFactor: 0.3, // More zoom on the center item
            autoPlayAnimationDuration: const Duration(milliseconds: 800), // Smooth animation
            scrollPhysics: BouncingScrollPhysics(), // Smooth, bouncing effect
          ),
        ),
      ],
    );
  }
}
