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
  bool _gridViewMode = false;

  void toggleGridViewMode(){
    setState(() {
      _gridViewMode = !_gridViewMode;
    });
  }

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
                    providerBachelorsLiked.bachelorsLiked = [];
                  },
                  child: const Icon(
                    Icons.playlist_remove,
                    size: 26.0,
                  ),
                )
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    toggleGridViewMode();
                  },
                  child: Icon(
                    _gridViewMode ?
                      Icons.list :
                      Icons.grid_4x4,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
                _gridViewMode ?
                  GridView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return  Image(
                          image: AssetImage(
                              providerBachelorsLiked.bachelorsLiked[index].avatar
                          ),
                          height: 50,
                          fit:BoxFit.fill
                      );
                    },
                    itemCount: providerBachelorsLiked.bachelorsLiked.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                  ) :
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        background: Container(
                          color: Colors.red,
                        ),
                        key: ValueKey<int>(index),
                        onDismissed: (DismissDirection direction) {
                          providerBachelorsLiked.bachelorsLiked.remove(providerBachelorsLiked.bachelorsLiked[index]);
                        },
                        child: BachelorPreview(providerBachelorsLiked.bachelorsLiked[index]),
                      );
                    },
                    itemCount: providerBachelorsLiked.bachelorsLiked.length,
                  )
              ],
            )
        )
    );
  }
}