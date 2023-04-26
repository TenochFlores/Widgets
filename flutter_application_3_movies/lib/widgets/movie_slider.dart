import 'package:flutter/material.dart';
import 'package:flutter_application_3_movies/models/models.dart';

class MovieSlider extends StatefulWidget {

  final String? title;
  final List<Movie> movies;
  final Function onNextPage;

  const MovieSlider({
    Key? key, 
    this.title, 
    required this.movies,
    required this.onNextPage,
  }) : super(key: key);

  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent-500)  {
        widget.onNextPage();
      }  

    });
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 255,
      // color: Colors.red,
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start, //Alineacion
        children: [
          if(this.widget.title != null) 
            Padding(
              padding: EdgeInsets.symmetric( horizontal: 20),
              child: Text(this.widget.title!, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
              ),
            ),
            // Como la columna no tiene un tamaño definido y el Listview toma el tamaño del padre
            // los envolvemos con un expanded para que tome todo el espacio disponible
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: ( _ , int index) => _MoviePoster(movie: widget.movies[index]),
              itemCount: widget.movies.length,  
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie movie;

  const _MoviePoster({required this.movie});  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: EdgeInsetsDirectional.only(top: 15, start: 10, end: 10,bottom: 10),
      child: Column(
        children: [

          //Imagen
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          SizedBox(height: 5,),
          //Texto
          Container(
            // decoration: BoxDecoration(color: Colors.green[800], borderRadius: BorderRadius.circular(5)), 
            // decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(4)),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                movie.title,
                // maxLines: 2, //Permite un numero maximo de lineas 
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}