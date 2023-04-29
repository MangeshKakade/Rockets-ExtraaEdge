import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocket_app_assignment/constants.dart';
import '../components/custom_card.dart';
import '../controllers/rocket_controller.dart';
import 'details_screen.dart';

//this class created for showing rocket list
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //created for showing rocket
    final controller = Provider.of<RocketController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(controller.isLoading ? 'Loading...' : 'Rockets'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          controller.isLoading
              //before load rocket list showing circular progress indicator
              ? const Center(
                  child: CircularProgressIndicator(color: primaryColor),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: controller.rockets.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final rocket = controller.rockets[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CustomCard(
                            rocket: rocket,
                            onTap: () {
                              //navigate to rocket details screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RocketDetailScreen(
                                    rocket: rocket,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                ),
        ],
      ),
    );
  }
}
