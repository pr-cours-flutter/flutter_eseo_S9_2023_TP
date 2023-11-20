import 'package:eseso_s9_tp/ui/screens/add_company.dart';
import 'package:eseso_s9_tp/ui/screens/home.dart';

class AppRouter {
  static const String homePage = '/home';
  static const String addCompanyPage = '/add_company';

  static final routes = {
    homePage: (context) => const Home(),
    addCompanyPage: (context) => AddCompany(),
  };
}
