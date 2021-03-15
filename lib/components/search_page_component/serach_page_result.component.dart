import 'package:flutter/material.dart';

import 'package:AniFlix/components/search_page_component/search_page_constants.dart';

import 'package:AniFlix/constants.dart';

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
        child: Padding(
          padding: const EdgeInsets.only(bottom: 70.0),
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
                  var genreIndex = index;
                  print('${index+1} was tapped');
                  if(genreIndex==11){
                    genreIndex = 18;
                  } else if (genreIndex==8) {
                    genreIndex = 28;
                  }
                  onGridItemTap(genreIndex+1);
                },
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  height: 200,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Center(
                    child: Text(
                      genresList[index],
                      style: TextStyle(
                        color: kMyBlueColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
