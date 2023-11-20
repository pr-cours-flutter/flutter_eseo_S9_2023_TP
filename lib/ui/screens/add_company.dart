import 'package:eseso_s9_tp/models/company.dart';
import 'package:flutter/material.dart';

class AddCompany extends StatelessWidget {
  AddCompany({super.key});

  // Controller pour le champ de texte (name)
  final TextEditingController _nameController = TextEditingController();

  // Clé pour le formulaire
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une entreprise'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nom';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.business_outlined),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _nameController.clear();
                    },
                  ),
                  labelText: 'Nom de l\'entreprise',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    // Vérification que le formulaire est valide
                    if (_formKey.currentState?.validate() ?? false) {
                      final name = _nameController.text;
                      final company = Company(name);

                      Navigator.pop(context, company);
                    }
                  },
                  child: const Text('Valider'))
            ],
          ),
        ),
      ),
    );
  }
}
