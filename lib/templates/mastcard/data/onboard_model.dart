import '../utils/strings.dart';

class OnboardModel {
  final String backgroundImage;
  final String imagePath;
  final String title;

  OnboardModel(
      {required this.imagePath,
      required this.title,
      required this.backgroundImage});
}

List<OnboardModel> onBoardModePages = [
  OnboardModel(
    title: Strings.onboardText1,
    imagePath: Strings.onboard1ImagePath,
    backgroundImage: Strings.onboard1bgImagePath,
  ),
  OnboardModel(
    title: Strings.onboardText2,
    imagePath: Strings.onboard2ImagePath,
    backgroundImage: Strings.onboard2bgImagePath,
  ),
  OnboardModel(
    title: Strings.onboardText3,
    imagePath: Strings.onboard3ImagePath,
    backgroundImage: Strings.onboard3bgImagePath,
  ),
];
