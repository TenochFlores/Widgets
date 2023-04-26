import 'package:flutter_application_3_movies/models/models.dart';
import 'package:flutter_application_3_movies/widgets/casting_cards.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie),
              _Overview( movie ),
              SizedBox(height: 5),
              CastingCards(movie.id)
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomAppBar(this.movie);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar( // AppBar con comportamiento con el Scroll
      backgroundColor: Colors.indigo,
      expandedHeight: 200,  //Tamaño maximo
      floating: false, //True: El AppBar esta por encima 
      pinned: true, //Nunca desaparece al hacer scroll solo se reduce
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsetsDirectional.only(start: 10,end: 10),
        title: Container(
          child: Text(movie.title),
          color: Colors.black12,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsetsDirectional.only(bottom: 10),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final Movie movie;

  const _PosterAndTitle(this.movie);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage(movie.fullPosterImg),
              height: 150,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox( //Titulo
                child: Text( 
                  movie.title,
                  style:textTheme.headline5, //Modifica segun headline4, headline3, etc.
                  overflow: TextOverflow.ellipsis, //Tres puntos
                  maxLines: 2, 
                ),
                constraints: BoxConstraints(maxWidth: size.width - 200),
              ),

              SizedBox(height: 2),

              ConstrainedBox( //Titulo original
                child: Text( 
                  'Título original: ${movie.originalTitle}',
                  // style:textTheme.subtitle1,
                  style: textTheme.caption,
                  overflow: TextOverflow.ellipsis, //Tres puntos
                  maxLines: 2, 
                ),
                constraints: BoxConstraints(maxWidth: size.width - 230)
              ),

              SizedBox(height: 2),

              Text('Estreno:  ${movie.releaseDate}',style: textTheme.caption), //Fecha
            
              Row( //Calificacion
                children: [
                  Text('Calificacion:  ',style: textTheme.caption),
                  Text(movie.voteAverage.toString(),style: textTheme.caption),
                  SizedBox(width: 2),
                  Icon(Icons.star_outline, size: 12, color: Colors.grey,),

                ],
              ),
            ],
          )
        ]
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  final Movie movie;

  const _Overview(this.movie);

  // @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}