import 'package:flutter/cupertino.dart';
import 'package:rocket_app_assignment/models/rocket_model.dart';
import '../services/api_service.dart';

//this class created for manage app state using provider package
class RocketController extends ChangeNotifier {
  bool isLoading = false;
  List<RocketModel> rockets = [];
  RocketController() {
    fetchRockets();
  }

  Future<void> fetchRockets() async {
    isLoading = true;
    notifyListeners();
    rockets = await RemoteServices.fetchRockets();
    isLoading = false;
    notifyListeners();
  }
}
