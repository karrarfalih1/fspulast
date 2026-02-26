import 'package:flutter/material.dart';
import 'package:fspulast/core/class/handlingdataview.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:fspulast/core/constant/imagesasset.dart';
import 'package:fspulast/core/constant/routesname.dart';
import 'package:fspulast/mvc/controller/home_controller.dart';
import 'package:fspulast/mvc/view/widget/home/card_home.dart';
import 'package:fspulast/mvc/view/widget/home/cart_home.dart';
import 'package:fspulast/mvc/view/widget/home/drower_costam.dart';
import 'package:fspulast/mvc/view/widget/home/silder_image_home.dart';
import 'package:fspulast/mvc/view/widget/home/webviewlist.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controllerhome = Get.put(HomeControllerImp());

    return SafeArea(
      child: Scaffold(
        key: controllerhome.scaffoldkey,

        drawer: const Drawer(
          child: DrowerCostam()
        ),
        body: GetBuilder<HomeControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SizedBox(
              //  padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  const SilderImageHome(),

                  const CartHome(),

                  SizedBox(
                    child: controller.dataActivity.isEmpty
                        ? const Text("لا توجد بيانات")
                        : CardHome(
                            ontap: controller.gotoactivity,
                            title: controller.dataActivity[0]["activity_title"],

                            icons: Icons.date_range,
                            trailtext: controller
                                .dataActivity[0]["activity_date_start"],
                          ),
                  ),

                  InkWell(
                    onTap: () {
                      Get.toNamed(Approuts.roomView);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        child: ListTile(
                          leading: Image.asset(AppImagesasset.build),
                          title: const Text("حجز القاعات"),
                          subtitle: const Text(
                            "تتوفر قاعات  كبيرة للحجز",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                  ),
 SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "المواقع الرسمية",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.fspucolor,
                          ),
                        ),

                        Spacer(),
                        InkWell(
                          onTap: ()=>Get.toNamed(Approuts.webpage),
                          child: Container(
                          
                            padding: const EdgeInsets.symmetric(
                              vertical: 3,
                              horizontal: 10,
                            ),
                            child: Text("عرض الكل", style: TextStyle(fontSize: 12))),
                        ),
                      ],
                    ),
                  
                  ),
                  SizedBox(height: 5),
                  Webviewlist(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  
  }
}
