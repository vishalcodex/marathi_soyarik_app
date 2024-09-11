import '../middlewares/onboarding_middleware.dart';
import '../screens/account/views/my_profile.dart';
import '../components/congrats_screen.dart';
import '../screens/auth/views/forgot_password_screen.dart';
import '../screens/auth/views/login_screen.dart';
import '../screens/auth/views/register_screen.dart';
import '../screens/chat/binding/chat_binding.dart';
import '../screens/chat/views/chat_screen.dart';
import '../screens/home/views/about_us_view.dart';
import '../screens/matches/binding/matches_binding.dart';
import '../screens/matches/views/blocked_profiles_screen.dart';
import '../screens/matches/views/interests_screen.dart';
import '../screens/matches/views/profile_details_screen.dart';
import '../screens/matches/views/profile_visitors_screen.dart';
import '../screens/settings/views/my_package_screen.dart';
import '../screens/settings/views/success_stories_screen.dart';
import '../screens/signup/views/search_screen.dart';
import '../screens/settings/binding/settings_binding.dart';
import '../screens/settings/views/change_password_screen.dart';
import '../screens/settings/views/news_n_update_screen.dart';
import '../screens/settings/views/packages_screen.dart';
import '../screens/settings/views/settings_view.dart';
import '../screens/settings/views/subscription_screen.dart';
import '../screens/signup/binding/sign_up_binding.dart';
import '../screens/signup/views/Partner_preference_screen.dart';
import '../screens/signup/views/sign_up_screen.dart';

import 'package:get/get.dart';
import '../components/splash.dart';
import '../screens/auth/binding/auth_binding.dart';
import '../screens/auth/views/auth_screen.dart';
import '../screens/auth/views/verify_otp_screen.dart';
import '../screens/home/binding/home_binding.dart';
import '../screens/home/views/dashboard_screen.dart';
import '../screens/signup/views/upload_docs_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      // binding: OnboardBinding(),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.HOME,
      page: () => MainScreen(),
      binding: HomeBinding(),
      middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => SignUpScreen(),
      binding: SignUpBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.UPLOAD_DOCS,
      page: () => UploadDocumentsScreen(),
      binding: SignUpBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PARTNER_PREFERENCE,
      page: () => PartnerPreferenceScreen(),
      binding: SignUpBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.OTP_VERIFY,
      page: () => VerifyOTPScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.MY_PROFILE,
      page: () => MyProfileScreen(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.CONGRATS,
      page: () => CongratsScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    // GetPage(
    //   name: Routes.CREATE_VPIN,
    //   page: () => CreateVpinScreen(),
    //   binding: AuthBinding(),
    //   // middlewares: [OnBoardingMiddleWare()],
    // ),
    // GetPage(
    //   name: Routes.CREATE_PASSWORD,
    //   page: () => CreatePasswordScreen(),
    //   binding: AuthBinding(),
    //   // middlewares: [OnBoardingMiddleWare()],
    // ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchScreen(),
      binding: SignUpBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PROFILE_VISITORS,
      page: () => ProfileVisitorScreen(),
      binding: MatchBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.INTERESTS,
      page: () => InterestsScreen(),
      binding: MatchBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.BLOCKED_PROFILES,
      page: () => BlockedProfilesScreen(),
      binding: MatchBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PROFILE_DETAILS,
      page: () => ProfileDetailsScreen(),
      binding: MatchBinding(),
      //
    ),
    GetPage(
      name: Routes.NEWS_UPDATES,
      page: () => NewsNUpdateScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => ChatScreen(),
      binding: ChatBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.ABOUT_US,
      page: () => AboutUsView(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => SettingsScreen(),
      binding: SettingsBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PACKAGES,
      page: () => PackagesScreen(),
      binding: SettingsBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.SUBSCRIPTIONS,
      page: () => SubscriptionScreen(),
      binding: SettingsBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.CHNAGE_PASSWORD,
      page: () => ChangePasswordScreen(),
      binding: SettingsBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.SUCCESS_STORIES,
      page: () => SuccessStoriesScreen(),
      binding: SettingsBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.MY_PACKAGE,
      page: () => MyPackageScreen(),
      binding: SettingsBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
  ];
}
