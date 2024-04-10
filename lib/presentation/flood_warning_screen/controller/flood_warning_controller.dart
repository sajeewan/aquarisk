import '../../../core/app_export.dart';
import '../models/flood_warning_model.dart';

/// A controller class for the FloodWarningScreen.
///
/// This class manages the state of the FloodWarningScreen, including the
/// current floodWarningModelObj
class FloodWarningController extends GetxController {
  Rx<FloodWarningModel> floodWarningModelObj = FloodWarningModel().obs;

  String district = '';
  String waterLevel = "";
  String rainfall = "";
  String temperature = "";
  bool result = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Map<String, dynamic>? args = Get.arguments as Map<String, dynamic>?;

    if (args != null) {
      district = args['district'];
      waterLevel = args['waterLevel'];
      rainfall = args['rainfall'];
      temperature = args['temperature'];
      result = args['prediction'];

      // Use the retrieved arguments as needed
      print(district);
      print(waterLevel);
      print(rainfall);
      print(temperature);
      print(result.toString());
    }
  }
}
