import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fspulast/mvc/controller/home_controller.dart';
import 'package:get/get.dart';
class DartLighMode extends GetView<HomeControllerImp> {
  const DartLighMode({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        child: DefaultTextStyle.merge(
          style: const TextStyle(
              color: Colors.white,
              fontSize: 13.0,
              fontWeight: FontWeight.bold),
          child: IconTheme.merge(
            data: const IconThemeData(color: Colors.white),
            child: AnimatedToggleSwitch<bool>.dual(
              current: controller.positive!,
              first: false,
              second: true,
              spacing: 90.0,
              animationDuration: const Duration(milliseconds: 600),
              style: const ToggleStyle(
                borderColor: Colors.transparent,
                backgroundColor: Colors.black,
              ),
              customStyleBuilder: (context, local, global) {
           if(global.position<=0){
            return const ToggleStyle(
              indicatorColor: Colors.white,
              backgroundColor: Colors.black);
           }     return ToggleStyle(
                  indicatorColor: Color.lerp(
                      Colors.black, Colors.white, 1.0 - global.position),
                  backgroundGradient: LinearGradient(
                    colors: const [Colors.white, Colors.black],
                    stops: [ 
                      max(0.0, global.position - 0.5) * 2.0,
                      
                      global.position,
                    ],
                  ),
                );
              },
              borderWidth: 3.0,
              height: 50.0,
              loadingIconBuilder: (context, global) =>
                  CupertinoActivityIndicator(
                      color: Color.lerp(
                          Colors.white, Colors.black, global.position)),
              onChanged: (b) => controller.positivef(b),
              iconBuilder: (value) => value
                  ? const Icon(Icons.light_mode,
                      color: Colors.white, size: 25)
                  : const Icon(Icons.dark_mode,
                      color: Colors.black, size: 25),
              textBuilder: (value) => value
                  ? const Center(
                      child: Text(
                        'الوضع النهاري',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  : const Center(
                      child: Text('الوضع الليلي'),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
