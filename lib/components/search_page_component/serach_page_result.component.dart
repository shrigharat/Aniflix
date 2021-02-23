import 'package:AniFlix/components/anime_detail_component/anime_recommendations_component.dart';
import 'package:AniFlix/components/search_page_component/search_page_constants.dart';
import 'package:flutter/material.dart';

class SearchPageResultContainer extends StatelessWidget {

  var onGridItemTap;

  SearchPageResultContainer({this.onGridItemTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Container(
        padding: EdgeInsets.only(
          top: 8,
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 1 / 1,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: genresList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                print('${index+1} was tapped');
                onGridItemTap(index+1);
              },
              child: Container(
                padding: EdgeInsets.all(4.0),
                height: 200,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Center(
                  child: Text(
                    genresList[index],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
