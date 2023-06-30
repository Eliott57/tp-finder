import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/bachelor_details.dart';
import '../models/bachelor.dart';
import '../providers/bachelors_favorites_provider.dart';
import '../providers/bachelors_provider.dart';

class BachelorPreview extends StatefulWidget{
  final Bachelor bachelor;

  const BachelorPreview(this.bachelor, {super.key});

  @override
  State<BachelorPreview> createState() => _BachelorPreviewState();
}

class _BachelorPreviewState extends State<BachelorPreview>{
  @override
  Widget build(BuildContext context) {
    final providerBachelorsLiked = Provider.of<BachelorsFavoritesProvider>(context);
    final providerBachelors = Provider.of<BachelorsProvider>(context);

    return Card(
      shape: const RoundedRectangleBorder(),
      margin: EdgeInsets.zero,
      color: Colors.white70,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                    children: <Widget>[
                      Image(
                          image: AssetImage(
                              widget.bachelor.avatar
                          ),
                          height: 50,
                          fit:BoxFit.fill
                      ),
                      Text(
                        '${widget.bachelor.firstname} ${widget.bachelor.lastname}',
                      ),
                      if(providerBachelorsLiked.isLiked(widget.bachelor))
                        const Icon(
                            Icons.favorite,
                            size: 15,
                            color: Colors.red
                        )
                    ]
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BachelorDetails(widget.bachelor),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        providerBachelorsLiked.isLiked(widget.bachelor) ?
                          providerBachelorsLiked.remove(widget.bachelor) :
                          providerBachelorsLiked.add(widget.bachelor);
                      },
                      child: Icon(
                        providerBachelorsLiked.isLiked(widget.bachelor) ?
                          Icons.heart_broken :
                            Icons.favorite,
                        color: Colors.red,
                        size: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        providerBachelors.remove(widget.bachelor);
                        providerBachelorsLiked.remove(widget.bachelor);
                      },
                      child: const Icon(
                        Icons.block,
                        color: Colors.red,
                        size: 15,
                      ),
                    )
                  ]
                )
              ]
          )
      ),
    );
  }
}