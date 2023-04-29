import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rocket_app_assignment/constants.dart';
import '../models/rocket_model.dart';

//this class is cretaed for used custom List Tile
class CustomCard extends StatelessWidget {
  CustomCard({
    Key? key,
    required this.rocket,
    required this.onTap,
  }) : super(key: key);

  final RocketModel rocket;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: rocket.flickrImages.first,
                  height: 100,
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(color: primaryColor)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rocket.name,
                      maxLines: 1,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Country: ${rocket.country.toString()}",
                      style:
                          const TextStyle(fontSize: 13, color: Colors.black54),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Engine: ${rocket.engines.number.toString()}",
                      style:
                          const TextStyle(fontSize: 13, color: Colors.black54),
                      maxLines: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
