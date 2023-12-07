import 'package:eseo_s9_tp/blocs/company_cubit.dart';
import 'package:eseo_s9_tp/models/company.dart';
import 'package:eseo_s9_tp/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des entreprises'),
      ),
      body: BlocBuilder<CompanyCubit, List<Company>>(builder: (context, companies) {
        if (companies.isEmpty) {
          return const Center(
            child: Text(
              'Aucune entreprise',
            ),
          );
        }
        return ListView.separated(
            itemCount: companies.length,
            itemBuilder: (context, index) {
              final company = companies[index];
              return ListTile(
                leading: const Icon(Icons.business_outlined),
                title: Text(company.name),
                subtitle: Text('${company.address.street}, ${company.address.postCode} ${company.address.city}'),
              );
            },
            separatorBuilder: (context, index) => const Divider());
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRouter.addCompanyPage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
