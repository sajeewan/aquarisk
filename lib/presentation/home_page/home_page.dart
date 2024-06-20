import 'package:aquarisk/presentation/home_page/widgets/list_item_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'widgets/home_item_widget.dart';
import 'models/home_item_model.dart';

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
  final Stream<QuerySnapshot> _predictionStream = FirebaseFirestore.instance.collection('prediction').snapshots();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Center(child: Text("Welcome")),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: SingleChildScrollView(
            child: Column(
              children: [

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
                _buildPredictionList()

              ],
            ),
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

  Widget _buildPredictionList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _predictionStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<DocumentSnapshot> predictions = snapshot.data!.docs;

        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: predictions.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> data = predictions[index].data() as Map<String, dynamic>;
            String district = data['District'] ?? '';
            DateTime date = (data['Date'] as Timestamp).toDate();
            bool isFlooded = data['Flood Prediction'] ?? false;

            // Return the CustomFloodInfoTile widget using extracted data
            return Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
              child: CustomFloodInfoTile(
                district: district,
                date: date,
                isFlooded: isFlooded,
              ),
            );
          },
        );
      },
    );
  }

}
