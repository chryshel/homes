import 'package:flutter/material.dart';

class HomzesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String username;
  final Color appBarBackgroundColor;
  final VoidCallback? onMenuPressed;
  final bool hideUserProfile;

  const HomzesAppBar({
    super.key,
    required this.username,
    required this.appBarBackgroundColor,
    this.onMenuPressed,
    this.hideUserProfile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: appBarBackgroundColor, // Light yellow background
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu_sharp, color: Colors.black),
                  onPressed: onMenuPressed,
                ),
                const Spacer(),
                if (!hideUserProfile)
                  Row(
                    children: [
                      Text(
                        'Hi, $username',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.grey.shade500,
                        child: Text(
                          username[0].toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                else
                  SearchBarWidget(hideUserProfile: hideUserProfile),
                if (hideUserProfile) const Spacer(),
              ],
            ),
            const SizedBox(height: 10),
            if (!hideUserProfile)
              SearchBarWidget(hideUserProfile: hideUserProfile),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(!hideUserProfile ? 130 : 80);
}

class SearchBarWidget extends StatelessWidget {
  final bool hideUserProfile;
  const SearchBarWidget({super.key, required this.hideUserProfile});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 12),
            //Suffix Icon
            const Icon(
              Icons.search,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: Container(
                  color: Colors.white,
                  height: 30,
                  width: screenWidth * (hideUserProfile ? 0.53 : 0.7),
                  child: const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 0, right: 0),
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
