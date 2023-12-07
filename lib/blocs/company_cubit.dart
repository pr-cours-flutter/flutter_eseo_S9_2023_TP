import 'package:eseo_s9_tp/models/company.dart';
import 'package:eseo_s9_tp/repositories/preferences_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Déclaration d'un "Cubit" pour stocker la liste d'entreprise
class CompanyCubit extends Cubit<List<Company>> {
  /// Constructeur + initialisation du Cubit avec un tableau vide d'entreprise
  CompanyCubit(this.preferencesRepository) : super([]);

  final PreferencesRepository preferencesRepository;

  /// Méthode pour charger la liste d'entreprise
  Future<void> loadCompanies() async {
    final companies = await preferencesRepository.loadCompanies();
    emit([...companies]);
  }

  /// Méthode pour ajouter une entreprise
  void addCompany(Company company) {
    emit([...state, company]);
    preferencesRepository.saveCompanies(state);
  }
}
