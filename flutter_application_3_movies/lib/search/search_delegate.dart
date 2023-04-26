import 'package:flutter/material.dart';
import 'package:flutter_application_3_movies/models/models.dart';
import 'package:flutter_application_3_movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate{

  @override
  String? get searchFieldLabel => "Buscar";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: Icon(Icons.backspace_rounded))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    if(query.isEmpty){
      return _emptyContainer();
    }

    return Text('BuildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.seachMovies(query),
      builder: ( _ , AsyncSnapshot<List<Movie>> snapshot) {
        if(!snapshot.hasData) return _emptyContainer();

        final movies = snapshot.data!;

        return ListView.builder(
          itemBuilder: ( _ , int index ) => _MovieItem( movies[index] ),
          itemCount: movies.length,
        );
      },
    );
  }
  
  Widget _emptyContainer() {
    return Container(
      child: Center(
        child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 100),
      )
    );
  }

  

}

class _MovieItem extends StatelessWidget {

  final Movie movie;

  const _MovieItem( this.movie);

  @override
    Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: AssetImage('assets/no-image.jpg'), 
        image: NetworkImage( movie.fullPosterImg ),
        width: 50,
        fit: BoxFit.contain,
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }
}