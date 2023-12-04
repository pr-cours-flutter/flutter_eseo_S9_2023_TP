import 'package:eseo_s9_tp/ui/screens/add_company.dart';
import 'package:eseo_s9_tp/ui/screens/home.dart';
import 'package:eseo_s9_tp/ui/screens/search_address.dart';

class AppRouter {
  static const String homePage = '/home';
  static const String addCompanyPage = '/add_company';
  static const String searchAddress = '/search_address';

  static final routes = {
    homePage: (context) => const Home(),
    addCompanyPage: (context) => const AddCompany(),
    searchAddress: (context) => const SearchAddress(),
  };
}
