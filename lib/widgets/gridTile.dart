import 'package:flutter/material.dart';
import 'package:ricky_and_morty_simple_project/Functions/color_status.dart';
import 'package:ricky_and_morty_simple_project/Screens/character_screen.dart';
import 'package:ricky_and_morty_simple_project/data/model/data_model.dart';

class GridTileWidget extends StatelessWidget {
  final Result data;

  const GridTileWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRect(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return CharactersScreen(data: data);
            }));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0), // Add padding to the card
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(data.image),
                ),
                const SizedBox(
                    width:
                        8.0), // Add some spacing between the avatar and the text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1, // Ensure it stays on one line
                      ),
                      Text(
                        data.status
                            .toString()
                            .split('.')
                            .last, // Convert Status to String
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: ColorStatus().colorStatus(
                              data.status.toString().split('.').last, context),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
