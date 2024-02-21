import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({Key? key, this.onChanged, required this.selectedIndex})
      : super(key: key);

  Function(BottomBarEnum)? onChanged;
  final int selectedIndex;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHomeSmall,
      activeIcon: ImageConstant.imgNavHomeOnprimary,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgProfBig,
      title: "Profile",
      type: BottomBarEnum.Profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 413.h,
          child: const Divider(),
        ),
        Container(
          height: 79.v,
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30.h),
            ),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary,
                spreadRadius: 2.h,
                blurRadius: 2.h,
                offset: const Offset(
                  0,
                  4,
                ),
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            elevation: 0,
            currentIndex: widget.selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: List.generate(bottomMenuList.length, (index) {
              return BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: bottomMenuList[index].icon,
                      height: 33.v,
                      width: 34.h,
                      color: theme.colorScheme.onPrimary,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.v),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: theme.colorScheme.primary.withOpacity(1),
                        ),
                      ),
                    ),
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: bottomMenuList[index].activeIcon,
                      height: 33.v,
                      width: 34.h,
                      color: theme.colorScheme.onPrimary,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.v),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: theme.colorScheme.primary.withOpacity(1),
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgLine22,
                      height: 3.v,
                      width: 32.h,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ],
                ),
                label: '',
              );
            }),
            onTap: (index) {
              widget.onChanged?.call(bottomMenuList[index].type);
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}

enum BottomBarEnum {
  Home,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
