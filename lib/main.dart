import 'package:eseo_s9_tp/blocs/company_cubit.dart';
import 'package:eseo_s9_tp/repositories/preferences_repository.dart';
import 'package:eseo_s9_tp/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Instanciation du Cubit
  final CompanyCubit companyCubit = CompanyCubit(PreferencesRepository());

  // Chargement des entreprises
  companyCubit.loadCompanies();

  runApp(BlocProvider<CompanyCubit>(
    create: (_) => companyCubit,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: AppRouter.routes,
      initialRoute: AppRouter.homePage,
    );
  }
}
