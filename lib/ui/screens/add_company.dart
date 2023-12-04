import 'package:eseo_s9_tp/models/address.dart';
import 'package:eseo_s9_tp/models/company.dart';
import 'package:eseo_s9_tp/router.dart';
import 'package:flutter/material.dart';

class AddCompany extends StatefulWidget {
  const AddCompany({super.key});

  @override
  State<AddCompany> createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  // Controller pour le champ de texte (name)
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  // Clé pour le formulaire
  final GlobalKey<FormState> _formKey = GlobalKey();

  Address? _address;

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
              TextFormField(
                controller: _addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une adresse';
                  }
                  return null;
                },
                readOnly: true,
                onTap: () async {
                  _address = await Navigator.of(context).pushNamed(AppRouter.searchAddress) as Address?;
                  if (_address != null) {
                    _addressController.text = '${_address!.street}, ${_address!.postCode} ${_address!.city}';
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                  labelText: 'Adresse de l\'entreprise',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    // Vérification que le formulaire est valide
                    if (_formKey.currentState?.validate() ?? false && _address != null) {
                      final name = _nameController.text;
                      final company = Company(name, _address!);

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
