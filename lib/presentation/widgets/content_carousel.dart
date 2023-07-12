import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrls;

  const ImageCarousel({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: false,
            aspectRatio: 1,
            enableInfiniteScroll: false, // allows infinite scrolling
            scrollDirection: Axis.horizontal, // sets the swipe direction
            viewportFraction: 1, // sets the amount of the image to show
            initialPage: 0,
          ),
          items: imageUrls.map((imageUrl) {
            return CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Text("There was an error loading this image.."),
              ),
              fit: BoxFit.cover,
            );
          }).toList(),
        ),
      ),
    );
  }
}
