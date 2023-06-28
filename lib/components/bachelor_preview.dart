import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/bachelor_details.dart';
import '../models/bachelor.dart';
import '../providers/bachelors_favorites_provider.dart';

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
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BachelorDetails(widget.bachelor),
                          ),
                        );
                      },
                      child: const Text('Details'),
                    ),
                    if(providerBachelorsLiked.isLiked(widget.bachelor))
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                        ),
                        onPressed: () {
                          providerBachelorsLiked.remove(widget.bachelor);
                        },
                        child: const Text(
                            'Unlike',
                            style: TextStyle(
                              color: Colors.red
                            )
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