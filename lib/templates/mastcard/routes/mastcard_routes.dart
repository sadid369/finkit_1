import 'package:finkit/routes/routes.dart';
import 'package:get/get.dart';
import '../binding/splash_binding.dart';
import '../views/auth/Sign_in_screen.dart';
import '../views/auth/congratulation_screen.dart';
import '../views/auth/email_congratulation_screen.dart';
import '../views/auth/email_otp_screen.dart';
import '../views/auth/otp_verification_screen.dart';
import '../views/auth/reset_password_screen.dart';
import '../views/auth/sign_up_screen.dart';
import '../views/drawer_menu_screen/aboutus_screen.dart';
import '../views/drawer_menu_screen/deposit_history_screen.dart';
import '../views/drawer_menu_screen/support_screen.dart';
import '../views/drawer_menu_screen/transaction_history_screen.dart';
import '../views/my_cards/detils_screen.dart';
import '../views/my_cards/fund_screen.dart';
import '../views/navigation/navigation_screen.dart';
import '../views/onboard/onboard_screen.dart';
import '../views/profile/change_password_screen.dart';
import '../views/profile/edit_profile_screen.dart';
import '../views/profile/two_factor_screen.dart';
import '../views/splash_screen/splash_screen.dart';
import '../views/welcome_screen.dart';
import '../widgets/dashboard/buy_card_screen.dart';
import '../widgets/preview_widget.dart';

class Mascardroutes extends Baseroutes {

static const String splashScreenMastCard = '/splashScreenMastCard';
  static const String mastcardOnboardScreenMastCard =  '/mastcardOnboardScreenMastCard';
  static const String mastcardWelcomeScreenMastCard = '/mastcardWelcomeScreenMastCard';
  static const String mastcardSignInScreenMastCard =  '/mastcardSignInScreenMastCard';
  static const String oTPVerificationScreenMastCard =   '/oTPVerificationScreenMastCard';
  static const String resetPasswordScreenMastCard =   '/resetPasswordScreenMastCard';
  static const String congratulationScreenMastCard = '/congratulationScreenMastCard';
  static const String mastcardSignUpScreenMastCard =  '/mastcardSignUpScreenMastCard';
  static const String oTPEmailVerificationScreenMastCard = '/oTPEmailVerificationScreenMastCard';
  static const String emailCongratulationScreenMastCard = '/emailCongratulationScreenMastCard';
  static const String mastcardNavigationScreenMastCard =  '/mastcardNavigationScreenMastCard';
  static const String transactionHistoryScreenMastCard = '/transactionHistoryScreenMastCard';
  static const String depositHistoryScreenMastCard = '/depositHistoryScreenMastCard';
  static const String aboutUsScreenMastCard = '/aboutUsScreenMastCard';
  static const String supportScreenMastCard = '/supportScreenMastCard';
  static const String editProfileScreenMastCard = '/editProfileScreenMastCard';
  static const String twoFactorScreenMastCard = '/twoFactorScreenMastCard';
  static const String changePasswordScreenMastCard =
      '/changePasswordScreenMastCard';
  static const String cardDetailsScreenMastCard = '/cardDetailsScreenMastCard';
  static const String fundScreenMastCard = '/fundScreenMastCard';
  static const String customPreviewWidgetMastCard =
      '/customPreviewWidgetMastCard';
  static const String buyCardScreenMastCard = '/buyCardScreenMastCard';


  static void initialize() {
    Baseroutes.list.addAll([
   GetPage(
        name: splashScreenMastCard,
        page: () => const SplashScreen(),
        binding: SplashBinding(),
      ),
      GetPage(
        name: mastcardOnboardScreenMastCard,
        page: () => const OnboardScreen(),
      ),
      GetPage(
        name: mastcardWelcomeScreenMastCard,
        page: () => const WelcomeScreen(),
      ),
// sign in section
      GetPage(
        name: mastcardSignInScreenMastCard,
        page: () => SignInScreen(),
      ),
      GetPage(
        name: oTPVerificationScreenMastCard,
        page: () => OTPVerificationScreen(),
      ),
      GetPage(
        name: resetPasswordScreenMastCard,
        page: () => ResetPasswordScreen(),
      ),
      GetPage(
        name: congratulationScreenMastCard,
        page: () => CongratulationScreen(),
      ),
      GetPage(
        name: mastcardSignUpScreenMastCard,
        page: () => SignUpScreen(),
      ),
      GetPage(
        name: oTPEmailVerificationScreenMastCard,
        page: () => OTPEmailVerificationScreen(),
      ),
      GetPage(
        name: emailCongratulationScreenMastCard,
        page: () => EmailCongratulationScreen(),
      ),
      GetPage(
        name: mastcardNavigationScreenMastCard,
        page: () => NavigationScreen(),
      ),
      GetPage(
        name: transactionHistoryScreenMastCard,
        page: () => const TransactionHistoryScreen(),
      ),
      GetPage(
        name: depositHistoryScreenMastCard,
        page: () => const DepositHistoryScreen(),
      ),
      GetPage(
        name: aboutUsScreenMastCard,
        page: () => const AboutUsScreen(),
      ),
      GetPage(
        name: supportScreenMastCard,
        page: () => SupportScreen(),
      ),
      GetPage(
        name: editProfileScreenMastCard,
        page: () => EditProfileScreen(),
      ),
      GetPage(
        name: twoFactorScreenMastCard,
        page: () => const TwoFactorScreen(),
      ),
      GetPage(
        name: changePasswordScreenMastCard,
        page: () => ChangePasswordScreen(),
      ),
      GetPage(
        name: cardDetailsScreenMastCard,
        page: () => const CardDetailsScreen(),
      ),
      GetPage(
        name: fundScreenMastCard,
        page: () => FundScreen(),
      ),
      GetPage(
        name: customPreviewWidgetMastCard,
        page: () => CustomPreviewWidget(),
      ),
      GetPage(
        name: buyCardScreenMastCard,
        page: () => BuyCardScreen(),
      ),

    ]);
  }
}
