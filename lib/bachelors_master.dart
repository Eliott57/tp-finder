import 'package:flutter/material.dart';

import 'database/seeders/bachelor_seeder.dart';
import 'models/bachelor.dart';

class BachelorsMaster extends StatefulWidget{
  BachelorsMaster() : super(key: GlobalKey());

  @override
  State<BachelorsMaster> createState() => _BachelorsMasterState();
}

class _BachelorsMasterState extends State<BachelorsMaster> {
  final List<Bachelor> _bachelors = BachelorSeeder();
  Bachelor? _bachelorToShow;
  final List<Bachelor> _bachelorsLiked = [];

  _setBachelorToShow({Bachelor? bachelor}){
    setState(() {
      _bachelorToShow = bachelor;
    });
  }

  _toggleBachelorFromBachelorsLiked({Bachelor? bachelor}){
    setState(() {
      if(_bachelorsLiked.contains(bachelor)) {
        _bachelorsLiked.remove(bachelor);
        return;
      }

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

      _bachelorsLiked.add(bachelor!);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget BachelorPreview({required Bachelor bachelor}) {
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
                            bachelor.avatar
                        ),
                        height: 50,
                        fit:BoxFit.fill
                    ),
                    Text(
                      '${bachelor.firstname} ${bachelor.lastname}',
                    ),
                    if(_bachelorsLiked.contains(bachelor))
                      const Icon(
                          Icons.favorite,
                          size: 15.0,
                          color: Colors.red
                      )
                  ]
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                ),
                onPressed: () {
                  _setBachelorToShow(bachelor: bachelor);
                },
                child: const Text('Details'),
              )
            ]
          )
        ),
      );
    }

    Widget BachelorDetails() {
      return Container(
          height: MediaQuery.of(context).size.height,
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
                            _bachelorToShow!.avatar
                        ),
                        height: 150,
                        fit:BoxFit.fill
                    ),
                    Icon(
                      Icons.favorite,
                      size: 100.0,
                      color: _bachelorsLiked.contains(_bachelorToShow) ?
                      Colors.red.withOpacity(0.75) :
                      Colors.white.withOpacity(0.75),
                    )
                  ]
              ),
              Text(
                '${_bachelorToShow!.firstname} ${_bachelorToShow!.lastname}',
              ),
              Text(
                'Job : ${_bachelorToShow!.job}',
              ),
              Text(
                'About : ${_bachelorToShow!.description}',
              ),
              OutlinedButton(
                onPressed: () {
                  _toggleBachelorFromBachelorsLiked(bachelor: _bachelorToShow);
                },
                style: ButtonStyle(
                  foregroundColor: _bachelorsLiked.contains(_bachelorToShow) ?
                    MaterialStateProperty.all<Color>(Colors.white) :
                    MaterialStateProperty.all<Color>(Colors.red),
                  backgroundColor: _bachelorsLiked.contains(_bachelorToShow) ?
                    MaterialStateProperty.all<Color>(Colors.red) :
                    MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                ),
                child: _bachelorsLiked.contains(_bachelorToShow) ?
                const Text('Liked') :
                const Text('Like to have a match'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                ),
                onPressed: () {
                  _setBachelorToShow(bachelor: null);
                },
                child: const Text('Go back'),
              )
            ]
          )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find your bachelor'),
        backgroundColor: Colors.purple,
      ),
      body:
        _bachelorToShow == null ?
          ListView.builder(
            itemBuilder: (context, index) {
              return BachelorPreview(bachelor: _bachelors[index]);
            },
            itemCount: _bachelors.length,
          ) :
            BachelorDetails()
    );
  }
}