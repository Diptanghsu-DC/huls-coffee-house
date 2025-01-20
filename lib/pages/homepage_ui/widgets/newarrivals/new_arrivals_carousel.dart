import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../controllers/services/user/user_controller.dart';
import '../../../../models/models.dart';
import '../../../view_product_page/viewproduct.dart';

class NewArrivalsCarousel extends StatelessWidget {
  final List<ProductModel> products ;
  const NewArrivalsCarousel({super.key,required this.products});

  @override
  Widget build(BuildContext context) {


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
          items: products.map((product) {
            return GestureDetector(
              onTap: () {
                if ((!product.isDisabled) && !UserController.currentUser!.isSeller) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewProduct(
                        product: product,
                      ),
                    ),
                  );
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Rounded corners for entire carousel item
                child: Stack(
                  children: [
                    Image.network(
                      product.imageURL,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 250, // Increased height for a more dynamic effect
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
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
                            product.itemName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22, // Larger title for better visibility
                              letterSpacing: 1.2,
                            ),
                          ),
                          Text(
                            "Only at Rs ${product.price}",
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
              ),
            );
          }).toList(),
          options: CarouselOptions(
            enableInfiniteScroll: products.length==1 ? false : true,
            height: 250, // Increased height for the carousel
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.8, // Slightly smaller items for spacing
            aspectRatio: 16 / 9,
            autoPlayInterval: const Duration(seconds: 4), // Longer interval
            enlargeFactor: 0.3, // More zoom on the center item
            autoPlayAnimationDuration: const Duration(milliseconds: 800), // Smooth animation
            scrollPhysics: const BouncingScrollPhysics(), // Smooth, bouncing effect
          ),
        ),
      ],
    );
  }
}
