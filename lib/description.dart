import 'package:flutter/material.dart';
import 'package:tmdb_movie/utils/test.dart';

class Description extends StatelessWidget {
  final String bannerurl , name , posterurl  , vote , description , launsh_on;
  const Description({Key? key,
    required this.bannerurl,
    required this.name,
    required this.posterurl,
    required this.vote,
    required this.description,
    required this.launsh_on}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(bannerurl,
                          fit: BoxFit.cover ,),
                      ),
                  ),
                  Positioned(
                    bottom: 10,
                      left: 10,
                      child: ModifiedText(text: '⭐ Average Rating - '+vote, color: Colors.white, size: 18)),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ModifiedText(text: name!=null?name:'Not Loaded', color: Colors.white, size: 24),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(text: 'Releasing On -'+launsh_on, color: Colors.white, size: 14),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                    child: Container(
                      margin: EdgeInsets.only(right: 6),
                      child: ModifiedText(text: description, color: Colors.white, size: 18),
                    ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
