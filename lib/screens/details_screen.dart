import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocket_app_assignment/constants.dart';
import '../controllers/rocket_controller.dart';
import '../models/rocket_model.dart';

//this class created for showing rocket details
class RocketDetailScreen extends StatelessWidget {
  const RocketDetailScreen({Key? key, required this.rocket}) : super(key: key);
  final RocketModel rocket;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(rocket.name),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 26),
              //use single child scrollview widget for scroll images
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      rocket.flickrImages.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: defaultPadding),
                        child: Center(
                          child: SizedBox(
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: rocket.flickrImages[index],
                                height: 250,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                        color: primaryColor)),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 20),
              Text(
                'Active Status: ${rocket.active.toString()}',
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Cost per launch: ${rocket.costPerLaunch.toString()}',
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Success Rate : ${rocket.successRatePct.toString()}%',
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              Divider(),
              Text(
                'Description: ${rocket.description.toString()}',
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              Divider(),
              Text(
                'Wikipedia: ${rocket.wikipedia.toString()}',
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              Divider(),
              Text(
                'Height : ${rocket.height.meters.toString()}m ${rocket.height.feet.toString()}ft',
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Diameter: ${rocket.height.meters.toString()}m ${rocket.height.feet.toString()}ft',
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
