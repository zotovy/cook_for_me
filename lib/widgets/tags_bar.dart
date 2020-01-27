import 'package:flutter/material.dart';
import 'package:food_app/data/tags.dart';

class TagsBar extends StatelessWidget implements PreferredSizeWidget {
  const TagsBar({Key key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(44);

  Widget _buildSingleTag(String tag) {
    return GestureDetector(
      onTap: () => print('go to search page with tag = "$tag"'),
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color(0xFFEEEEEE),
        ),
        child: Text(
          tag,
          style: TextStyle(
            color: Color(0xFF565656),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black12, width: 1)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      height: preferredSize.height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: home_tags.length,
        itemBuilder: (BuildContext context, int i) {
          return _buildSingleTag(home_tags[i]);
        },
      ),
    );
  }
}
