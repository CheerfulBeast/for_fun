import 'package:flutter/material.dart';
import 'package:ricky_and_morty_simple_project/Functions/color_status.dart';
import 'package:ricky_and_morty_simple_project/Functions/text_slicing.dart';
import 'package:ricky_and_morty_simple_project/data/model/data_model.dart';

class CharactersScreen extends StatelessWidget {
  final Result data;
  const CharactersScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
      ),
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image(
                image: NetworkImage(data.image),
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              'Status: ${textSlicing.slice(data.status.toString())}',
              style: TextStyle(
                  color: ColorStatus().colorStatus(
                      textSlicing.slice(data.status.toString()), context)),
            ),
            Text('Species: ${textSlicing.slice(data.species.toString())}'),
            Text('Type: ${data.type}'),
            Text('Gender: ${textSlicing.slice(data.gender.toString())}'),
          ],
        ),
      ),
    );
  }
}
