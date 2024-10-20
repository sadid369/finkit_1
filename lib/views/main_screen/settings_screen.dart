import 'package:finkit/utils/custom_color.dart';
import 'package:finkit/utils/basic_widget_imports.dart';
import 'package:finkit/utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finkit/utils/strings.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Get.close(1);
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: Dimensions.paddingSize,
              ),
              child: CircleAvatar(
                child: Padding(
                  padding: EdgeInsets.only(left: Dimensions.paddingSize * 0.36),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: CustomColor.primaryDarkColor,
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            StringsMain.setting,
            style: GoogleFonts.roboto(
              fontSize: Dimensions.headingTextSize1,
              color: CustomColor.blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: _bodyWidget(context));
  }

  _bodyWidget(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.paddingSize * 0.6,
          horizontal: Dimensions.paddingSize * 0.65,
        ),
        child: Column(
          children: [
            _documentationWidget(context),
            verticalSpace(14),
            _buttonWidget(context),
          ],
        ));
  }

  _documentationWidget(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xFFccccff),
        ),
        child: const Icon(
          Icons.note,
          color: Color(0xFF6666ff),
        ),
      ),
      title: Text(
        StringsMain.documentation,
        style: GoogleFonts.roboto(
          fontSize: Dimensions.headingTextSize2,
          color: CustomColor.blackColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6666ff),
      ),
      child: Text(
        StringsMain.buyNow,
        style: GoogleFonts.roboto(
          fontSize: Dimensions.headingTextSize4,
          color: CustomColor.whiteColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
