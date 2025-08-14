// Route imports for all screens in the app
import '../features/authentication/login_screen.dart';
import '../features/authentication/signup_screen.dart';
import '../features/authentication/password/forgot_password.dart';
import '../features/authentication/password/new_password.dart';
import '../features/authentication/password/password_success_screen.dart';
import '../features/home/home_screen.dart';
import '../features/report/report_detail_screen.dart';
import '../features/report/attachment_screen.dart';
import '../features/report/final_step_screen.dart';
import '../features/report/report_history_screen.dart';
import '../features/navigation/navigation_screen.dart';
import '../features/navigation/profile_screen.dart';
import '../features/security/security_screen.dart';
import '../features/settings/setting_screen.dart';
import '../features/settings/password_setting_screen.dart';
import '../features/language/language_screen.dart';
import '../features/faq/faq_screen.dart';
import '../features/authentication/terms_view_screen.dart';
import '../features/authentication/choice_screen.dart';
import '../features/authentication/splash_screen.dart';

import '../features/security/change_pin_screen.dart';
import '../features/security/pin_success_screen.dart';

import '../features/navigation/edit_profile_screen.dart';

// AppRoutes: Central place for all route names and route widgets
// If you add a new screen, don't forget to add it here!
abstract class AppRoutes {
  // Route names (used for navigation)
  static const String pinSuccess = '/pin-success';
  static const String splash = '/';
  static const String choice = '/choice';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String terms = '/terms';
  static const String forgot = '/forgot';
  static const String newpass = '/newpass';
  static const String success = '/success';
  static const String home = '/home';
  static const String reportDetail = '/report-detail';
  static const String attachment = '/attachment';
  static const String finalStep = '/final-step';
  static const String navigation = '/navigation';
  static const String profile = '/profile';
  static const String security = '/security';
  static const String settings = '/settings';
  static const String passwordSettings = '/password-settings';
  static const String language = '/language';
  static const String faq = '/faq';
  static const String changePin = '/change-pin';
  static const String reportHistory = '/report-history';
  static const String editProfile = '/edit-profile';

  // Map of route names to widget builders
  static final routes = {
    splash: (context) => const SplashScreen(),
    choice: (context) => const ChoiceScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),
    terms: (context) => const TermsViewScreen(),
    forgot: (context) => const ForgotPasswordScreen(),
    newpass: (context) => const NewPasswordScreen(),
    success: (context) => const PasswordSuccessScreen(),
    home: (context) => const HomeScreen(),
    reportDetail: (context) => const ReportDetailScreen(),
    attachment: (context) => const AttachmentScreen(),
    finalStep: (context) => const FinalStepScreen(),
    navigation: (context) => const NavigationScreen(),
    profile: (context) => const ProfileScreen(),
    security: (context) => const SecurityScreen(),
    settings: (context) => const SettingsScreen(),
    passwordSettings: (context) => const PasswordSettingsScreen(),
    language: (context) => const LanguageScreen(),
    faq: (context) => const FaqScreen(),
    changePin: (context) => const ChangePinScreen(),
    pinSuccess: (context) => const PinSuccessScreen(),
    editProfile: (context) => const EditProfileScreen(),
    reportHistory: (context) => const ReportHistoryScreen(),
  };
  // TODO: Add deep linking support for mobile
}