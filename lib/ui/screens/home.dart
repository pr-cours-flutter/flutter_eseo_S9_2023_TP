import 'package:eseso_s9_tp/models/company.dart';
import 'package:eseso_s9_tp/router.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Liste des entreprises
  final List<Company> _companies = [
    const Company('Entreprise 1'),
    const Company('Entreprise 2'),
    const Company('Entreprise 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des entreprises'),
      ),
      body: ListView.separated(
          itemCount: _companies.length,
          itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.business_outlined),
                title: Text(_companies[index].name),
              ),
          separatorBuilder: (context, index) => const Divider()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Récupération de l'objet company
          final Company? newCompany = (await Navigator.of(context).pushNamed(AppRouter.addCompanyPage)) as Company?;

          // Vérification que l'objet renvoyé n'est pas null (cas si l'utilisateur a appuyé sur le bouton retour)
          if (newCompany != null) {
            // Ajout de l'objet à la liste avec setState
            setState(() {
              _companies.add(newCompany);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
