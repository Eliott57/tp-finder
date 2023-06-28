import 'package:finder/providers/bachelors_favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/bachelor.dart';

class BachelorDetails extends StatefulWidget {
  final Bachelor bachelor;

  const BachelorDetails(this.bachelor, {super.key});

  @override
  State<BachelorDetails> createState() => _BachelorDetailsState();
}

class _BachelorDetailsState extends State<BachelorDetails> {
  @override
  Widget build(BuildContext context) {
    final providerBachelorsLiked = Provider.of<BachelorsFavoritesProvider>(context);

    MaterialStateProperty<Color> getBackgroundColor(){
      return providerBachelorsLiked.isLiked(widget.bachelor)
          ? MaterialStateProperty.all<Color>(Colors.red) :
          MaterialStateProperty.all<Color>(Colors.white);
    }

    MaterialStateProperty<Color> getForegroundColor(){
      return providerBachelorsLiked.isLiked(widget.bachelor)
          ? MaterialStateProperty.all<Color>(Colors.white) :
          MaterialStateProperty.all<Color>(Colors.red);
    }

    void updateBachelorsLiked(){
      if(providerBachelorsLiked.isLiked(widget.bachelor)){
        providerBachelorsLiked.remove(widget.bachelor);
        return;
      }

      providerBachelorsLiked.add(widget.bachelor);

      ScaffoldMessenger
          .of(context)
          .showSnackBar(
          const SnackBar(
            content: Text(
                'Match on the road !',
                style: TextStyle(
                    color: Colors.white
                )
            ),
            backgroundColor: Colors.red,
          )
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
              '${widget.bachelor.firstname} ${widget.bachelor.lastname}'
          ),
          backgroundColor: Colors.purple,
        ),
        body:
        Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Image(
                            image: AssetImage(
                                widget.bachelor.avatar
                            ),
                            height: 150,
                            fit: BoxFit.fill
                        ),
                        Icon(
                          Icons.favorite,
                          size: 50,
                          color: providerBachelorsLiked.isLiked(widget.bachelor) ?
                            Colors.red.withOpacity(0.75) :
                            Colors.white.withOpacity(0.75),
                        )
                      ]
                  ),
                  Text(
                    '${widget.bachelor.firstname} ${widget.bachelor.lastname}',
                  ),
                  Text(
                    'Job : ${widget.bachelor.job}',
                  ),
                  Text(
                    'About : ${widget.bachelor.description}',
                  ),
                  OutlinedButton(
                    onPressed: () {
                      updateBachelorsLiked();
                    },
                    style: ButtonStyle(
                      foregroundColor: getForegroundColor(),
                      backgroundColor: getBackgroundColor(),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    child: providerBachelorsLiked.bachelorsLiked.contains(widget.bachelor) ?
                      const Text('Liked') :
                      const Text('Like to have a match'),
                  ),
                ]
            )
        )
    );
  }
}