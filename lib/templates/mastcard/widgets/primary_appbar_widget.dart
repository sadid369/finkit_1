import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:flutter/material.dart';

// custom appbar
class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({
    Key? key,
     this.appBar,
    required this.title,
    required this.backgroundColor,
    required this.elevation,
    required this.autoLeading,
    required this.appbarColor,
    this.action,
    this.leading,
    this.bottom,
    this.toolbarHeight,
    this.appbarSize = 56,
  }) : super(key: key);

  final Widget title;
  final AppBar? appBar;
  final Color backgroundColor;
  final double elevation;
  final List<Widget>? action;
  final Widget? leading;
  final bool autoLeading;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final double? appbarSize;
  final Color appbarColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: title,
      actions: action,
      leading: leading,
      bottom: bottom,
      elevation: elevation,
      toolbarHeight: toolbarHeight,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: autoLeading,
      iconTheme: const IconThemeData(
        color: CustomColor.primaryColor,
        size: 30,
      ),
    );
  }

  @override
  // Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
  Size get preferredSize => Size.fromHeight(appbarSize!);
}
