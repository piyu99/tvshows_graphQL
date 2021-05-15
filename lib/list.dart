import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ListV extends StatefulWidget {
  @override
  _ListVState createState() => _ListVState();
}


class _ListVState extends State<ListV> {

var base;
int tvIndex=1;

newup(int index){
setState(() {
  tvIndex=tvIndex+2;
});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV SHOWS'),
      ),
      body: Query(
        options: QueryOptions(
          document: gql("""
          query GetData (\$code: Int!) {
                tv{
                   show(id: \$code){
                     name
                     poster(size: W780)
                     rating
                     numberOfSeasons
                     homepage
                      }
                 }
              }
          """
        ),
          variables: {
            'code' : tvIndex,
          }
        ),
        builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }) {

//          try{
////            print(result.data['tv']['show']['name']);
////            print(result.data['tv']['show']['numberOfSeasons']);
//          }
//          catch(e){
//            print(e.toString());
//          }

            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context,index){

                return InkWell(
                  onTap: (){
                    newup(index);
                  },
                  child: ListTile(
                    title: Text(result.data['tv']['show']['name']),
                    subtitle: Text('Seasons : ${result.data['tv']['show']['numberOfSeasons']}'),
                    leading: Image.network('${result.data['tv']['show']['poster']}'),
                    trailing: Text('Rating : ${result.data['tv']['show']['rating']}'),
                  ),
                );
              },
            );

        }
    ),
    );

  }
}
