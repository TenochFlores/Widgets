import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_application_3_movies/providers/movies_provider.dart';
import 'package:flutter_application_3_movies/search/search_delegate.dart';
import 'package:flutter_application_3_movies/widgets/widgets.dart';




class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);  //"listen:true" signfica que se redibuje 
                                                                  //cuando haya una modificacion (cuando se 
                                                                  //llama a ChangeNotifierProvider)

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('En cartelera',style: TextStyle(color: Colors.grey[200]))),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), 
            icon: Icon(Icons.search_outlined)
          ),
        ],
      ),
      body: SingleChildScrollView(  //Permite que si excede el largo del telefono se pueda hacer scroll y no haya error
        child: Column(
          children: [
            // CardSwiper de peliculas
            CardSwiper( movies: moviesProvider.onDisplayMovies ),
            // Listado horizontal de peliculas
            MovieSlider(movies: moviesProvider.popularMovies, title: 'Populares',
                        onNextPage: () => moviesProvider.getPopularMovies()),
            MovieSlider(movies: moviesProvider.topRatedMovies, title: 'Aclamadas por la crítica', 
                        onNextPage: () => moviesProvider.getTopRatedMovies()),
            MovieSlider(movies: moviesProvider.upcomingMovies, title: 'Proximos estrenos',
                        onNextPage: () => moviesProvider.getUpcomingMovies()),
          ],
        ),
      ),
    );
  }
}