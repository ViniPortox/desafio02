import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';

class ListTileWidget extends StatefulWidget {
  final PokemonModel pokemon;
  final Function() ontap;
  const ListTileWidget({
    Key? key,
    required this.pokemon,
    required this.ontap,
  }) : super(key: key);

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  late final Color backgroundColor;
  @override
  void initState() {
    super.initState();
    switch (widget.pokemon.backgroundAvatarColor) {
      case BackgroundAvatarColor.green:
        backgroundColor = Colors.green[100]!;

        break;
      case BackgroundAvatarColor.blue:
        backgroundColor = Colors.blue[100]!;

        break;
      case BackgroundAvatarColor.brown:
        backgroundColor = Colors.brown[200]!;

        break;
      case BackgroundAvatarColor.orange:
        backgroundColor = Colors.orange[200]!;

        break;
      case BackgroundAvatarColor.purple:
        backgroundColor = Colors.purple[100]!;

        break;
      case BackgroundAvatarColor.yellow:
        backgroundColor = Colors.yellow[200]!;

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 135,
                    width: 130,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Image.asset(widget.pokemon.avatarImage),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      width: 110,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        boxShadow: const [BoxShadow(blurRadius: 10)],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    Text(
                      widget.pokemon.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Text(
                        widget.pokemon.type,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SizedBox(
                        width: 140,
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          text: TextSpan(
                            text: widget.pokemon.descripton,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ),
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
                        Text(
                          widget.pokemon.localization,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.pokemon.isFavorite = !widget.pokemon.isFavorite;
                  });
                },
                icon: Icon(
                  widget.pokemon.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: widget.pokemon.isFavorite ? Colors.red : Colors.grey,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
