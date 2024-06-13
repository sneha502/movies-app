import 'package:flutter/material.dart';
import 'package:tmdb_movie/utils/test.dart';

import '../description.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Toprated Movies',
            color: Colors.white,
            size: 26,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>Description(
                            bannerurl:  'https://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'],
                            name: toprated[index]['title'],
                            posterurl:   'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'],
                            vote: toprated[index]['vote_average'].toString(),
                            description: toprated[index]['overview'],
                            launsh_on: toprated[index]['release_date'],
                          )));
                    },
                    child:
                    toprated[index]['title']!=null?Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'],
                              ),
                            ),),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: ModifiedText(text: toprated[index]['title']!=null?
                            toprated[index]['title']:'Loading', color: Colors.white, size: 12,),
                          ),
                        ],
                      ),
                    ):Container(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
