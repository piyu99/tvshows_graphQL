import 'package:flutter/material.dart';
import 'package:tvshows_graphql/list.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}

HttpLink httplink=HttpLink("https://tmdb.apps.quintero.io/");

class MyApp extends StatelessWidget {


  final ValueNotifier<GraphQLClient> client= ValueNotifier(
      GraphQLClient(
          link: httplink ,
          cache: GraphQLCache()
      )
  );

  @override
  Widget build(BuildContext context) {
    return
      GraphQLProvider(
        client : client,
        child: MaterialApp(
        home: ListV(),
      ),
    );
  }
}

