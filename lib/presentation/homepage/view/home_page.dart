import 'package:faizal_mobile_dev/presentation/homepage/controller/home_page_controller.dart';
import 'package:faizal_mobile_dev/presentation/homepage/widget/home_page_loading.dart';
import 'package:faizal_mobile_dev/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomepageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}

class HomePage extends StatelessWidget {
  static const routeName = "/homepage";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.timeGreeting(), style: const TextStyle(color: Colors.white),),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: controller.timeGreeting() == "Good night" ? const Color(0XFF2b4372) : fancyBlue,
          body: RefreshIndicator(
            onRefresh: () => controller.getCurrentWeather(),
            child: controller.loadingShimmer.value ? const HomepageLoadingWidget() : ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.verticalSpace,
                      Text(controller.locationModel?.name ?? "", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400, color: Colors.white),),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${controller.tempConvert(controller.locationModel?.main.temp ?? 0)}", style: const TextStyle(fontSize: 86, fontWeight: FontWeight.bold, color: Colors.white),),
                              Padding(
                                padding: EdgeInsets.only(top: 25.h),
                                child: Text(" °C", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.normal, color: Colors.white),),
                              )
                            ],
                          ),
                          controller.timeGreeting() == "Good morning" 
                          ? Image.asset("assets/image/sunrise_img.png", height: 150, width: 150)
                          : Image.asset("assets/image/moon_img.png", height: 150, width: 150),
                        ],
                      ),
                      5.verticalSpace,
                      Text(controller.timestampToDateTime(controller.locationModel?.dt ?? 0), style: TextStyle(color: Colors.white, fontSize: 26.sp, fontWeight: FontWeight.w400),),
                      10.verticalSpace,
                    ],
                  ),
                ),
                
                SizedBox(
                  height: 115.h,
                  width: double.infinity,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Container(
                        width: 120.w,
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: controller.timeGreeting() == "Good night" ? const Color(0XFF314b7e) : dailyBlue,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            5.verticalSpace,
                            Image.asset("assets/icon/sunrise.png", height: 40.h, width: 40.w, color: Colors.white,),
                            15.verticalSpace,
                            Text(controller.locationModel?.weather[0].description ?? "", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal, color: Colors.white),),
                            Text(controller.timestampToTime(controller.locationModel?.dt ?? 0), style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white),)
                          ],
                        ),
                      ),
                      15.horizontalSpace,
                      Container(
                        width: 120.w,
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: controller.timeGreeting() == "Good night" ? const Color(0XFF314b7e) : dailyBlue,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            5.verticalSpace,
                            Image.asset("assets/icon/windy.png", height: 35.h, width: 35.w, color: Colors.white,),
                            15.verticalSpace,
                            Text("Wind", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal, color: Colors.white),),
                            Text("${controller.locationModel?.wind.speed}m/s E", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white),)
                          ],
                        ),
                      ),
                      15.horizontalSpace,
                      Container(
                        width: 120.w,
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: controller.timeGreeting() == "Good night" ? const Color(0XFF314b7e) : dailyBlue,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            5.verticalSpace,
                            Image.asset("assets/icon/thermometer.png", height: 35, width: 35, color: Colors.white,),
                            15.verticalSpace,
                            Text("Tempature", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal, color: Colors.white),),
                            Text("${controller.tempConvert(controller.locationModel?.main.temp ?? 0)}°", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                30.verticalSpace,

                Container(
                  height: 230.h,
                  width: double.infinity,
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                    color: controller.timeGreeting() == "Good night" ?  const Color(0XFF385795) : Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      5.verticalSpace,
                      Center(
                        child: Container(
                          height: 5.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.sp),
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ),
                      15.verticalSpace,
                      Text("Hourly Forecast", style: TextStyle(fontSize: 16.sp, color: controller.timeGreeting() == "Good night" ? Colors.white : darkBlue, fontWeight: FontWeight.w500),),
                      15.verticalSpace,

                      SizedBox(
                        height: ScreenUtil().setHeight(150),
                        width: double.infinity,
                        child: ListView.separated(
                          itemCount: controller.daysAgoList.length,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => 15.horizontalSpace, 
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Container(
                                  height: 130.h,
                                  width: 90.w,
                                  padding: EdgeInsets.all(8.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: controller.timeGreeting() == "Good night" ? const Color(0XFF5d82cb) : fancyBlue.withOpacity(0.2),
                                  ),
                                  child: Column(
                                    children: [
                                      25.verticalSpace,
                                      Image.asset(controller.clouds(controller.daysAgoList[index]["weather"][0]['description']), height: 45),
                                      15.verticalSpace,
                                      Text("${controller.tempConvert(controller.daysAgoList[index]['main']['temp'])}°C", style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: controller.timeGreeting() == "Good night" ? Colors.white : darkBlue),)
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 30.h,
                                  width: 90.w,
                                  padding: EdgeInsets.all(5.sp),
                                  alignment: Alignment.topCenter,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.r),
                                      topRight: Radius.circular(10.r),
                                    ),
                                    color: controller.timeGreeting() == "Good night" ? const Color(0XFF273b64) : transitionBlue
                                  ),
                                  child: Text(controller.timestampToTime(controller.daysAgoList[index]['dt']), style: TextStyle(color: Colors.white, fontSize: 16.sp),),
                                ),
                              ],
                            );
                          }, 
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        );
      }
    );
  }
} 