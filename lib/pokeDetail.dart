import 'package:flutter/material.dart';
import 'package:pokemon_app/Pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      fontSize: 28.0,
                      fontFamily: "KronaOne",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Height : ${pokemon.height}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "KronaOne",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Weight : ${pokemon.weight}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "KronaOne",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Types :",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "KronaOne",
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((t) => FilterChip(
                            label: Text(
                              t,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontFamily: "KronaOne",
                              ),
                            ),
                            backgroundColor: Colors.amber,
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  Text("Weaknesses :",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "KronaOne",
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        .map((t) => FilterChip(
                            label: Text(
                              t,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: "KronaOne",
                              ),
                            ),
                            backgroundColor: Colors.red,
                            onSelected: (b) {}))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: pokemon.id,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(pokemon.img), fit: BoxFit.cover),
                  ),
                )),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          pokemon.name,
        ),
        elevation: 0.0,
      ),
      body: bodyWidget(context),
    );
  }
}
