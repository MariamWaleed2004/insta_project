import 'package:clean_arch_pro/core/const.dart';
import 'package:clean_arch_pro/features/search/presentation/widgets/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchWidget(controller: _searchController),
                sizeVer(10),
                GridView.builder(
                  itemCount: 33,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing:  5,
                    ), 
                  itemBuilder: (context,  index) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: secondaryColor,
                    );
                  },
                  ),
              ],
            ),
          ),
        )
      ),
    );
  }
}