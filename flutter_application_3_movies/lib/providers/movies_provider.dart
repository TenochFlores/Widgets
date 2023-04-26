
import 'package:flutter/Material.dart';
import 'package:flutter_application_3_movies/models/models.dart';
import 'package:flutter_application_3_movies/models/search_movies_response.dart';
import 'package:flutter_application_3_movies/models/upcoming_response.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{

  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '963893d2e0f35b204c4a0e5aff994b18';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> topRatedMovies = [];
  List<Movie> upcomingMovies = [];

  int _popularPage = 0;
  int _topRatedPage = 0;
  int _upcomingPage = 0;

  Map<int,List<Cast>> movieCast= {};

  MoviesProvider(){
    print('Movies-Provider inicializado');
    this.getOnDisplayMovies();
    this.getPopularMovies();
    this.getTopRatedMovies();
    this.getUpcomingMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https( 
      _baseUrl, //Domionio
      endpoint, //Segmento 
      {
        'api_key':_apiKey,
        'language':_language,
        'page':'$page'
      }  
    );

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async{
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners(); //Notifica que hubo un cambio, en este caso onDisplayMovies
    // print( nowPlayingResponse.results[2].posterPath );
  }

  getPopularMovies() async {
    _popularPage++;

    final jsonData = await this._getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [ ...popularMovies, ...popularResponse.results];
    notifyListeners();
  } 

  getTopRatedMovies() async {
    _topRatedPage++;

    final jsonData = await this._getJsonData('3/movie/top_rated', _topRatedPage);
    final topRatedResponse = TopRatedResponse.fromJson(jsonData);

    topRatedMovies = [ ...topRatedMovies, ...topRatedResponse.results];
    notifyListeners();
  }

  getUpcomingMovies() async {
    _upcomingPage++;

    final jsonData = await this._getJsonData('3/movie/upcoming', _upcomingPage);
    final upcomingResponse = UpcomingResponse.fromJson(jsonData);

    upcomingMovies = [ ...upcomingMovies, ...upcomingResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast( int movieId ) async {

    //Evaluamos si ya se cargaron los datos anteriormente (Volvimos a entrar en la pelicula)
    if(movieCast.containsKey(movieId)) return movieCast[movieId]!;
    print('Pidiendo info al servidor');

    final jsonData = await this._getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    
    movieCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> seachMovies( String query ) async {

    final url = Uri.https( _baseUrl, '3/search/movie', //Segmento 
      {
        'api_key':_apiKey,
        'language':_language,
        'query':query
      }  
    );

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson( response.body );

    return searchResponse.results;
  }
}