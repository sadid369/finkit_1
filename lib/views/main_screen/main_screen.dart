import 'dart:math';
import 'package:finkit/data/templates_data.dart';
import 'package:finkit/data/templates_items_widget.dart';
import 'package:finkit/routes/pages.dart';
import 'package:finkit/utils/custom_color.dart';
import 'package:finkit/utils/basic_widget_imports.dart';
import 'package:finkit/utils/dimensions.dart';
import 'package:finkit/views/main_screen/drawer_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finkit/utils/strings.dart';

import '../../templates/mastcard/routes/mastcard_routes.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      key: scaffoldKey,

      //>>>>>>>>>> app bar
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          StringsMain.finkit,
          style: GoogleFonts.roboto(
            fontSize: Dimensions.headingTextSize1,
            color: CustomColor.primaryLightColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed(Mainroutes.settingScreenFinkit);
            },
            child: Padding(
              padding: EdgeInsets.only(
                right: Dimensions.paddingSize * 0.8,
              ),
              child: const Icon(
                Icons.settings,
                color: CustomColor.blackColor,
              ),
            ),
          )
        ],
      ),

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize * 0.6,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              verticalSpace(Dimensions.heightSize * 0.8),
              //>>>>>>>> top container
              // Container(
              //   padding: const EdgeInsets.all(10),
              //   height: MediaQuery.sizeOf(context).height * 0.18,
              //   decoration: BoxDecoration(
              //     color: const Color.fromARGB(255, 48, 46, 46).withOpacity(0.2),
              //     borderRadius: BorderRadius.circular(Dimensions.radius),
              //   ),
              //   // child: Image.asset("assets/logo/basic_logo.png"),
              // ),
              verticalSpace(Dimensions.heightSize * 1.1),
              //! full app
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: Dimensions.paddingSize * 0.12,
              //   ),
              //   child: Text(
              //     StringsMain.fullApp,
              //     style: GoogleFonts.roboto(
              //       fontSize: Dimensions.headingTextSize2,
              //       color: CustomColor.blackColor,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1 / 1,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final randomColor =
                      Color((Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(1.0);
                  return GridItemWidget(
                      title: items[index].title,
                      image: items[index].image,
                      onTap: items[index].onTap,
                      backgroundColor: randomColor,
                      color: CustomColor.whiteColor.withOpacity(0.7));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
