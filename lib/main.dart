import 'package:firebase_model/screens/splash.dart';
import 'package:firebase_model/service/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    SplashPage(
      onInitComplete: () => runApp(
        ProviderScope(child: Home()),
      ),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {'/home': (context) => Samples()},
    );
  }
}

class Samples extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final movie = watch(providerMovie);
    return Scaffold(
        body: Center(
            child: Container(
                child: movie.when(
      data: (data) {
        return ListView.builder(
          itemCount: data.results.length,
          itemBuilder: (context, index) => Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    child: Image.network(
                        'https://image.tmdb.org/t/p/original/${data.results[index].posterPath}'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data.results[index].title,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Text(
                          data.results[index].overview,
                          maxLines: 7,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (err, stack) {
        print(err);
        print(stack);
        return Text('hello');
      },
    ))));
  }
}
