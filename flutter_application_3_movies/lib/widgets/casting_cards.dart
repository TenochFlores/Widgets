import 'package:flutter/material.dart';
import 'package:flutter_application_3_movies/models/models.dart';
import 'package:flutter_application_3_movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {

  final int movieId;

  const CastingCards(this.movieId);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: ( _ , AsyncSnapshot<List<Cast>> snapshot) {

        if(!snapshot.hasData){
          return Container(
            height: 180,
            child: Center(
              child: CircularProgressIndicator(color: Colors.white54),
            ),
          );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
          width: double.infinity,
          height: 180,
          // color: Colors.cyan,
          margin: EdgeInsets.only(bottom: 20),
          child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: ( _ , int index) => _CastCard(cast[index]),
          itemCount: 10,
          ),
        );

      },
    );
  }
}

class _CastCard extends StatelessWidget {

  final Cast actor;

  const _CastCard(this.actor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.only(top: 5),
      width: 110,
      height: 100,
      // color: Colors.red,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage(actor.fullProfilePath),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 3),
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}