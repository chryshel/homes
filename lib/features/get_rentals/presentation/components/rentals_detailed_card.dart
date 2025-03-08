import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:homzes_app/features/get_rentals/domain/entities/rentals.dart';

class RentalCard extends StatefulWidget {
  final RentalsEntity rental;
  const RentalCard({super.key, required this.rental});

  @override
  RentalCardState createState() => RentalCardState();
}

class RentalCardState extends State<RentalCard> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  String _city = 'Unknown';
  String _country = 'Unknown';

  @override
  initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _getLocationFromGeoPoint();
  }

  void _getLocationFromGeoPoint() async {
    double latitude = widget.rental.location.latitude;
    double longitude = widget.rental.location.longitude;

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          _city = place.administrativeArea ?? "Unknown";
          _country = place.country ?? "Unknown";
        });
      }
    } catch (e) {
      setState(() {
        _city = "Unknown";
        _country = "Unknown";
      });
    }
  }

  void _startImageSlideshow() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentPage < widget.rental.images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _stopImageSlideshow() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              SizedBox(
                width: screenWidth * 2,
                height: 200,
                child: GestureDetector(
                  onLongPress:
                      _startImageSlideshow, // Start animation when user holds
                  onLongPressUp:
                      _stopImageSlideshow, // Stop when user lifts finger
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.rental.images.length,
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                        imageUrl: widget.rental.images[index],
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Center(child: Icon(Icons.error)),
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: screenWidth * 0.02, // Adjusted for centering
                right: screenWidth * 0.74,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.rental.bedRoomCount}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Beds',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Baths
              Positioned(
                bottom: 8,
                left: screenWidth * 0.2, // Adjusted for centering
                right: screenWidth * 0.45,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.rental.bathRoomCount}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Bathrooms',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
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
        Row(
          children: [
            Text(
              widget.rental.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const Spacer(),
            const Text(
              '\$',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              '${widget.rental.price}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(width: screenWidth * 0.01),
            const Text(
              '/ mo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
        Text(
          '$_country,$_city',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
