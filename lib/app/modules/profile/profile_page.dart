import 'package:flutter/material.dart';
import 'package:pokedex/pokedex.dart';

import '../../app_config.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Pokemon? _pokemon;

  @override
  void initState() {
    super.initState();
    Pokedex().pokemon.get(id: int.parse(widget.id)).then((value) {
      setState(() {
        _pokemon = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _pokemon == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: AppConfig.maxPageWidth,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.network(
                        '${_pokemon?.sprites.frontDefault}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  const Text('Nome'),
                                  const Spacer(),
                                  Text(_pokemon!.name),
                                ],
                              ),
                              const Divider(
                                height: 32,
                              ),
                              Row(
                                children: [
                                  const Text('Tamanho'),
                                  const Spacer(),
                                  Text(_pokemon!.height.toString()),
                                ],
                              ),
                              const Divider(
                                height: 32,
                              ),
                              Row(
                                children: [
                                  const Text('Experiência'),
                                  const Spacer(),
                                  Text(_pokemon!.baseExperience.toString()),
                                ],
                              ),
                              const Divider(
                                height: 32,
                              ),
                              Row(
                                children: [
                                  const Text('Ordem'),
                                  const Spacer(),
                                  Text(_pokemon!.order.toString()),
                                ],
                              ),
                              const Divider(
                                height: 32,
                              ),
                              Row(
                                children: [
                                  const Text('Peso'),
                                  const Spacer(),
                                  Text(_pokemon!.weight.toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
