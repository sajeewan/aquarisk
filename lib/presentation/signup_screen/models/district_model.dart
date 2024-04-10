
import '../../../core/app_export.dart';

/// This class defines the variables used in the [signup_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DistrictModel {
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
