import 'package:flutter/material.dart';

import 'bachelors_master.dart';
import 'models/bachelor.dart';

class BachelorDetails extends StatefulWidget {
  final Bachelor bachelor;

  BachelorDetails(this.bachelor, {super.key});

  @override
  State<BachelorDetails> createState() => _bachelorDetailsState();
}

class _bachelorDetailsState extends State<BachelorDetails> {
  bool _isLiked = false;

  _like() {
    setState(() {
      _isLiked = !_isLiked;

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
    });
  }

  MaterialStateProperty<Color> _getButtonColor(bool isLiked){
    return isLiked ? MaterialStateProperty.all<Color>(Colors.red) : MaterialStateProperty.all<Color>(Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Find your bachelor'),
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
                          color: _isLiked ?
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
                      _like();
                    },
                    style: ButtonStyle(
                      foregroundColor: _getButtonColor(!_isLiked),
                      backgroundColor: _getButtonColor(_isLiked),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    child: _isLiked ?
                    const Text('Liked') :
                    const Text('Like to have a match'),
                  ),
                ]
            )
        )
    );
  }
}