import 'widgets/home_item_widget.dart';
import 'models/home_item_model.dart';
import 'package:aquarisk/widgets/custom_text_form_field.dart';
import 'package:aquarisk/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:aquarisk/core/app_export.dart';
import 'controller/home_controller.dart';
import 'models/home_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key})
      : super(
          key: key,
        );

  HomeController controller = Get.put(HomeController(HomeModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 29.h),
                  child: Text(
                    "lbl_nearest_shelter".tr,
                    style: CustomTextStyles.titleMediumOnPrimary,
                  ),
                ),
              ),
              SizedBox(height: 7.v),
              _buildHome(),
              SizedBox(height: 45.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 29.h),
                  child: Text(
                    "msg_previous_predications".tr,
                    style: CustomTextStyles.titleMediumOnPrimary,
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHome() {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 121.v,
        child: Obx(
          () => ListView.separated(
            padding: EdgeInsets.only(left: 29.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 22.h,
              );
            },
            itemCount: controller.homeModelObj.value.homeItemList.value.length,
            itemBuilder: (context, index) {
              HomeItemModel model =
                  controller.homeModelObj.value.homeItemList.value[index];
              return HomeItemWidget(
                model,
              );
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPredictionCounter() {
    return CustomTextFormField(
      controller: controller.predictionCounterController,
      hintText: "lbl_prediction_1".tr,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 5.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.fillGray,
      filled: true,
      fillColor: appTheme.gray200,
    );
  }

  /// Section Widget
  Widget _buildPredictionCounter1() {
    return CustomTextFormField(
      controller: controller.predictionCounterController1,
      hintText: "lbl_prediction_2".tr,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 5.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.fillGray,
      filled: true,
      fillColor: appTheme.gray200,
    );
  }

  /// Section Widget
  Widget _buildPredictionCounter2() {
    return CustomTextFormField(
      controller: controller.predictionCounterController2,
      hintText: "lbl_prediction_3".tr,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 5.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.fillGray,
      filled: true,
      fillColor: appTheme.gray200,
    );
  }

  /// Section Widget
  Widget _buildPredictionCounter3() {
    return CustomTextFormField(
      controller: controller.predictionCounterController3,
      hintText: "lbl_prediction_4".tr,
      textInputAction: TextInputAction.done,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 5.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.fillGray,
      filled: true,
      fillColor: appTheme.gray200,
    );
  }

  /// Section Widget
  Widget _buildFrameEighty() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 29.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                _buildPredictionCounter(),
                SizedBox(height: 11.v),
                _buildPredictionCounter1(),
                SizedBox(height: 11.v),
                _buildPredictionCounter2(),
                SizedBox(height: 11.v),
                _buildPredictionCounter3(),
              ],
            ),
          ),
          Container(
            height: 156.v,
            width: 5.h,
            margin: EdgeInsets.only(left: 32.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 156.v,
                    child: VerticalDivider(
                      width: 3.h,
                      thickness: 3.v,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 32.v,
                    child: VerticalDivider(
                      width: 5.h,
                      thickness: 5.v,
                      color: appTheme.blueGray400,
                      indent: 8.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
