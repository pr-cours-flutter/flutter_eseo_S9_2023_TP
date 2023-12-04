import 'dart:async';

import 'package:eseo_s9_tp/models/address.dart';
import 'package:eseo_s9_tp/repositories/address_repository.dart';
import 'package:flutter/material.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({super.key});

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  List<Address> _addresses = [
    Address('Place du Ralliement', 'Angers', '49000'),
    Address('19 rue André le Notre', 'Angers', '49066'),
  ];

  final TextEditingController _controller = TextEditingController();

  Timer? _debounce;

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (value.length > 2) {
        final addressRepository = AddressRepository();
        addressRepository.fetchAddresses(value).then((value) {
          setState(() {
            _addresses = value;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rechercher une adresse'),
      ),
      body: Column(
        children: [
          TextField(
              controller: _controller,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.location_on),
                labelText: 'Rechercher une adresse',
              ),
              onChanged: _onSearchChanged),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final address = _addresses[index];
                  return ListTile(
                    leading: const Icon(Icons.location_on),
                    title: Text(address.street),
                    subtitle: Text('${address.city} ${address.postCode}'),
                    onTap: () {
                      Navigator.of(context).pop(address);
                    },
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: _addresses.length),
          )
        ],
      ),
    );
  }
}
