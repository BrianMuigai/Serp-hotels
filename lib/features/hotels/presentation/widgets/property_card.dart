import 'package:buenro_hotels/features/hotels/data/models/search_response.dart';
import 'package:buenro_hotels/features/hotels/presentation/widgets/image_slider_corousel.dart';
import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  final List<HotelImage> hotelImages;
  final String name;
  final String price;
  final String dates;
  final String locationRating;

  const PropertyCard({
    super.key,
    required this.hotelImages,
    required this.name,
    required this.price,
    required this.dates,
    required this.locationRating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: ImageSliderCarousel(
                  hotelImages: hotelImages,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.pin_drop,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(width: 5),
                      Text(
                        locationRating,
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      dates,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Spacer(),
                    IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
