import 'package:flutter/material.dart';
import 'package:ricky_and_morty_simple_project/Functions/color_status.dart';
import 'package:ricky_and_morty_simple_project/Functions/text_slicing.dart';
import 'package:ricky_and_morty_simple_project/data/model/data_model.dart';

class CharacterTile extends StatelessWidget {
  final Result data;
  const CharacterTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    String status = textSlicing.slice(data.status.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
      child: Card(
        child: ListTile(
          visualDensity: const VisualDensity(vertical: 4),
          contentPadding: const EdgeInsets.only(right: 8),
          leading: Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              child: Expanded(
                child: Image(
                  image: NetworkImage(data.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(data.name), Text(data.species)],
          ),
          trailing: Text(
            status,
            style: TextStyle(color: colorStatus.colorStatus(status, context)),
          ),
        ),
      ),
    );
  }
}
