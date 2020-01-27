import 'package:flutter/material.dart';

class FoodBasedOnTimeCard extends StatelessWidget {
  LinearGradient bg;
  String title;
  String subtitle;
  AssetImage image;
  String keyword;

  FoodBasedOnTimeCard({
    this.bg,
    this.title,
    this.subtitle,
    this.image,
    this.keyword,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 46, left: 46),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: bg,
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(1, 3), blurRadius: 5)
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.white38,
          onTap: () => print('go to detail page with $keyword'),
          child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10),
                  width: (MediaQuery.of(context).size.width - 92) * 0.70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 17, vertical: 3),
                        child: Text(
                          'View Recipes',
                          style: TextStyle(
                            fontSize: 18,
                            foreground: Paint()
                              ..shader = bg.createShader(
                                  Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: (MediaQuery.of(context).size.width - 92) * 0.30 - 5,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: image, fit: BoxFit.fitWidth),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
