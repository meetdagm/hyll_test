import 'package:flutter/material.dart';
import 'package:hyll_test_project/presentation/widgets/content_carousel.dart';
import 'package:hyll_test_project/shared/helper_widgets.dart';

class FeedCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> imageUrls;
  final int likeCount;
  const FeedCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.likeCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageCarousel(
            imageUrls: imageUrls,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 7.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.bookmark,
                    size: 17,
                  ),
                  tinyHorizontalSpace,
                  Text(
                    "$likeCount",
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              )
            ],
          ),
          smallVerticalSpace,
          Text(
            description,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          largeVerticalSpace,
        ],
      ),
    );
  }
}
