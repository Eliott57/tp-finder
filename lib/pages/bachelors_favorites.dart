import 'package:finder/providers/bachelors_favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/bachelor_preview.dart';

class BachelorsFavorites extends StatefulWidget {
  const BachelorsFavorites({super.key});

  @override
  State<BachelorsFavorites> createState() => _BachelorsFavoritesState();
}

class _BachelorsFavoritesState extends State<BachelorsFavorites> {
  @override
  Widget build(BuildContext context) {
    final providerBachelorsLiked = Provider.of<BachelorsFavoritesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('My matches'),
          backgroundColor: Colors.purple,
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BachelorsFavorites(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.favorite,
                    size: 26.0,
                  ),
                )
            ),
          ],
        ),
        body:
        ListView.builder(
          itemBuilder: (context, index) {
            return BachelorPreview(providerBachelorsLiked.bachelorsLiked[index]);
          },
          itemCount: providerBachelorsLiked.bachelorsLiked.length,
        )
    );
  }
}