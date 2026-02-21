
import 'package:flutter/material.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapController extends GetxController {}

class MapControllerImp extends MapController {
  String? titlelocation;
  double? lang;
  double? lat;

  List<Marker> marker = [
    //   Marker(markerId: MarkerId("1"),position: LatLng(55, 44.407071))
  ];
  //final Completer<GoogleMapController> _controller =
  //  Completer<GoogleMapController>();
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(33.22, 44.407071),
    zoom: 12.4746,
  );
  GoogleMapController? controllerr;






  showmap(lat,lang,titlelocation) {
    // ignore: prefer_const_constructors
    marker.add(Marker(markerId: MarkerId('1'), position: LatLng(lang!, lat!)));

    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: 600,
        height: 450,
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: AppColor.fspucolor),
              child: Center(
                child: Text(
                  titlelocation!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
            )),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                width: 600,
                child: GoogleMap(
                  markers: marker.toSet(),
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController mapcontroller) async {
                    controllerr =  mapcontroller;
                    controllerr!.animateCamera(
                        CameraUpdate.newLatLng(LatLng(lang!, lat!)));
                    //       _controller.complete(controller);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
