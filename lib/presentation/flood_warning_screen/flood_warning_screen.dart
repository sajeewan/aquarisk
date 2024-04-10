import 'package:aquarisk/widgets/custom_elevated_button.dart';
import 'package:aquarisk/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:aquarisk/core/app_export.dart';
import 'controller/flood_warning_controller.dart';

// ignore_for_file: must_be_immutable
class FloodWarningScreen extends GetWidget<FloodWarningController> {
  const FloodWarningScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 30.h,
            top: 142.v,
            right: 30.h,
          ),
          child: Column(
            children: [
              Text(
                "lbl_flood_warning".tr,
                style: CustomTextStyles.titleLargeRedA100,
              ),
              Text(
                "msg_there_could_be_a".tr,
                style: CustomTextStyles.bodySmallPoppinsOnPrimary,
              ),
              SizedBox(height: 1.v),
              Text(
                "msg_take_necessary_precautions".tr,
                style: CustomTextStyles.bodySmallPoppinsOnPrimary,
              ),
              SizedBox(height: 35.v),
              CustomElevatedButton(
                text: "lbl_verify".tr,
              ),
              SizedBox(height: 20.v),
              CustomOutlinedButton(
                text: "msg_find_nearest_shelter".tr,
                buttonStyle: CustomButtonStyles.outlinePrimary,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigation(),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomNavigation() {
    return Padding(
      padding: EdgeInsets.only(
        left: 37.h,
        right: 37.h,
        bottom: 15.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildFrameSixtySeven(
            image: ImageConstant.imgNavHomeGray700,
            history: "lbl_home".tr,
          ),
          Spacer(
            flex: 37,
          ),
          _buildFrameSixtySeven(
            image: ImageConstant.imgNavHistory,
            history: "lbl_history".tr,
          ),
          Spacer(
            flex: 32,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgNavNotification,
                height: 26.adaptSize,
                width: 26.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.v),
                child: Text(
                  "lbl_notification".tr,
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
          Spacer(
            flex: 30,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgNavSettings,
                height: 27.adaptSize,
                width: 27.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.v),
                child: Text(
                  "lbl_settings".tr,
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFrameSixtySeven({
    required String image,
    required String history,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomImageView(
          imagePath: image,
          height: 27.adaptSize,
          width: 27.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.v),
          child: Text(
            history,
            style: theme.textTheme.bodySmall!.copyWith(
              color: appTheme.gray700,
            ),
          ),
        ),
      ],
    );
  }
}
