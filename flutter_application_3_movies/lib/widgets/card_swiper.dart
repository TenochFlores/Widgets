import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_application_3_movies/models/models.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

  const CardSwiper({
    Key? key, 
    required this.movies
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if(this.movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height*0.51,
        child: Center(
          child: CircularProgressIndicator(color: Colors.black12,),
        ),
      );
    }

    return Container(
      width: double.infinity, //Toma lo maximo posible no infinito
      height: size.height*0.51,  //Adaptamos a la mitad de la pantalla
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.46,
        itemBuilder: ( _ , int index){  //El guion bajo significa que aunque ahi va el BuildContext context, no lo vamos a usar
          
          final Movie movie = movies[index]; //Pelicual segun el index

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect( //Nos permite añadir el BorderRadious
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}