import 'package:desafio02/src/models/pokemon_model.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatefulWidget {
  final PokemonModel pokemons;
  final Function() ontap;

  const ListTileWidget({
    Key? key,
    required this.pokemons,
    required this.ontap,
  }) : super(key: key);

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: ListTile(
          dense: true,
          isThreeLine: true,
          onTap: widget.ontap,
          contentPadding: const EdgeInsets.all(12),
          leading: Stack(
            children: [
              Container(
                width: 50,
                height: 150,
                decoration: BoxDecoration(
                  color: widget.pokemons.backGroundColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Image.asset(
                  widget.pokemons.avatarImage,
                ),
              ),
            ],
          ),
          title: Text(
            widget.pokemons.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  widget.pokemons.type,
                  style: const TextStyle(fontSize: 13, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  widget.pokemons.descripton,
                  style: const TextStyle(fontSize: 11),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(widget.pokemons.localization),
                ],
              ),
            ],
          ),
          trailing: IconButton(
              onPressed: () {
                setState(() {
                  widget.pokemons.isFavorite = !widget.pokemons.isFavorite;
                });
              },
              icon: Icon(
                widget.pokemons.isFavorite 
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: widget.pokemons.isFavorite  ? Colors.red : Colors.grey,
                size: 30,
              )),
        ),
      ),
    );
  }
}
