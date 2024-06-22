import 'package:aquarisk/core/app_export.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [predict_flood_page],
/// and is typically used to hold data that is passed between different parts of the application.
class PredictFloodModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Colombo",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Gampaha",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Kalutara",
    ),
    SelectionPopupModel(
      id: 4,
      title: "Kandy",
    ),
    SelectionPopupModel(
      id: 5,
      title: "Matale",
    ),
    SelectionPopupModel(
      id: 6,
      title: "Nuwara Eliya",
    ),
    SelectionPopupModel(
      id: 7,
      title: "Galle",
    ),
    SelectionPopupModel(
      id: 8,
      title: "Matara",
    ),
    SelectionPopupModel(
      id: 9,
      title: "Hambantota",
    ),
    SelectionPopupModel(
      id: 10,
      title: "Jaffna",
    ),
    SelectionPopupModel(
      id: 11,
      title: "Kilinochchi",
    ),
    SelectionPopupModel(
      id: 12,
      title: "Mannar",
    ),
    SelectionPopupModel(
      id: 13,
      title: "Mullaitivu",
    ),
    SelectionPopupModel(
      id: 14,
      title: "Vavuniya",
    ),
    SelectionPopupModel(
      id: 15,
      title: "Batticaloa",
    ),
    SelectionPopupModel(
      id: 16,
      title: "Ampara",
    ),
    SelectionPopupModel(
      id: 17,
      title: "Trincomalee",
    ),
    SelectionPopupModel(
      id: 18,
      title: "Kurunegala",
    ),
    SelectionPopupModel(
      id: 19,
      title: "Puttalam",
    ),
    SelectionPopupModel(
      id: 20,
      title: "Anuradhapura",
    ),
    SelectionPopupModel(
      id: 21,
      title: "Polonnaruwa",
    ),
    SelectionPopupModel(
      id: 22,
      title: "Badulla",
    ),
    SelectionPopupModel(
      id: 23,
      title: "Moneragala",
    ),
    SelectionPopupModel(
      id: 24,
      title: "Ratnapura",
    ),
    SelectionPopupModel(
      id: 25,
      title: "Kegalle",
    ),
  ]);
}
