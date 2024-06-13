import 'package:flutter/material.dart';
import 'package:tmdb_movie/description.dart';
import 'package:tmdb_movie/utils/test.dart';

class TrendingMovies extends StatelessWidget {
  final List trendingmo;

  const TrendingMovies({Key? key, required this.trendingmo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
              text: 'Trending Movies',
              color: Colors.white,
              size: 26,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: trendingmo.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>Description(
                            bannerurl:  'https://image.tmdb.org/t/p/w500'+trendingmo[index]['backdrop_path'],
                            name: trendingmo[index]['title'],
                            posterurl:   'https://image.tmdb.org/t/p/w500'+trendingmo[index]['poster_path'],
                            vote: trendingmo[index]['vote_average'].toString(),
                            description: trendingmo[index]['overview'],
                            launsh_on: trendingmo[index]['release_date'],
                          )));
                    },
                    child:
                    trendingmo[index]['title']!=null?Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500'+trendingmo[index]['poster_path'],
                                ),
                            ),),
                            ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: ModifiedText(text: trendingmo[index]['title']!=null?
                            trendingmo[index]['title']:'Loading', color: Colors.white, size: 12,),
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
