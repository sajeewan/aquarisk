import 'package:aquarisk/widgets/custom_drop_down.dart';
import 'package:aquarisk/widgets/custom_text_form_field.dart';
import 'package:aquarisk/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:aquarisk/core/app_export.dart';
import 'controller/predict_flood_controller.dart';
import 'models/predict_flood_model.dart';

class PredictFloodPage extends StatelessWidget {
  PredictFloodPage({Key? key})
      : super(
          key: key,
        );

  PredictFloodController controller =
      Get.put(PredictFloodController(PredictFloodModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillWhiteA,
            child: Column(
              children: [
                Text(
                  "msg_predict_flood_possibility".tr,
                  style: CustomTextStyles.titleMediumOnPrimary,
                ),
                SizedBox(height: 22.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "lbl_district".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                SizedBox(height: 8.v),
                CustomDropDown(
                  icon: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 12.v, 16.h, 12.v),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgArrowdown,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    ),
                  ),
                  hintText: "Select District",
                  items: controller
                      .predictFloodModelObj.value.dropdownItemList.value,
                  onChanged: (value) {
                    controller.onSelected(value);
                  },
                ),
                SizedBox(height: 16.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "lbl_water_level".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                SizedBox(height: 6.v),
                _buildMeasurement(),
                SizedBox(height: 16.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "lbl_rainfall".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                SizedBox(height: 6.v),
                _buildInput(),
                SizedBox(height: 18.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "lbl_temperature".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                SizedBox(height: 4.v),
                _buildInput1(),
                SizedBox(height: 40.v),
                _buildPredictNow(),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMeasurement() {
    return CustomTextFormField(
      textInputType: TextInputType.number,
      controller: controller.waterLevelController,
      hintText: "Eg:3.13".tr,
    );
  }

  /// Section Widget
  Widget _buildInput() {
    return CustomTextFormField(
      textInputType: TextInputType.number,
      controller: controller.rainFallController,
      hintText: "Eg:85.12".tr,
    );
  }

  /// Section Widget
  Widget _buildInput1() {
    return CustomTextFormField(
      textInputType: TextInputType.number,
      controller: controller.temperatureController,
      hintText: "Eg:45.15",
      textInputAction: TextInputAction.done,
    );
  }

  /// Section Widget
  Widget _buildPredictNow() {
    return CustomElevatedButton(
      text: "Predict",
      onPressed: () {
        controller.predictFlood();
      },
    );
  }
}
