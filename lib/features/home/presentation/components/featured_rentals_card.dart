import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homzes_app/features/get_rentals/domain/entities/rentals.dart';

class FeaturedRentalsHomeCardView extends StatelessWidget {
  final List<RentalsEntity> featuredRentals;
  final VoidCallback? onViewAllPressed;
  const FeaturedRentalsHomeCardView(
      {super.key, required this.featuredRentals, this.onViewAllPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Featured",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: onViewAllPressed,
                  child: Text(
                    "View all",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featuredRentals.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                              imageUrl: featuredRentals[index].images[0],
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Center(child: Icon(Icons.error)),
                              width: 120,
                              height: 130,
                              fit: BoxFit.cover),
                          Positioned(
                            bottom: 8,
                            left: 50, // Adjusted for centering
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "\$",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    '${featuredRentals[index].price}'.length > 3
                                        ? '${featuredRentals[index].price}..'
                                        : '${featuredRentals[index].price}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 120,
                      child: Text(
                        featuredRentals[index].title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
