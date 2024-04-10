import 'package:aquarisk/core/app_export.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [predict_flood_page],
/// and is typically used to hold data that is passed between different parts of the application.
class PredictFloodModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Badulla",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Colombo",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Batticaloa",
    )
  ]);
}
