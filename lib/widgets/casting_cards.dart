

import 'package:flutter/material.dart';
import 'package:peliculas/provider/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;
  const CastingCards({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context,listen: false);
    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      initialData: InitialData,
      builder: (_ ,AsyncSnapshot<List<Cast>> snapshot)){
        return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, int index) => const _CastCard()),
    );
    }

  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: AssetImage('assets/no-image.jpg'),
                height: 140,
                width: 100,
                fit: BoxFit.cover),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'actor.name asd as dfasd a',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
