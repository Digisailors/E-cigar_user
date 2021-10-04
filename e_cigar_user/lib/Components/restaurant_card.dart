// ignore_for_file: prefer_const_constructors

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:e_cigar_user/Locale/locales.dart';
import 'package:e_cigar_user/Themes/colors.dart';
import 'package:e_cigar_user/models/shop.dart';
import 'package:e_cigar_user/pages/items_page.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({Key? key, required this.shop}) : super(key: key);
  final Shop shop;
  @override
  Widget build(BuildContext context) {
    return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemsPage(),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                child: Row(
                  children: <Widget>[
                    FadedScaleAnimation(
                      const Image(
                        image: AssetImage("images/Restaurants/Layer 3.png"),
                        height: 93.3,
                      ),
                      durationInMilliseconds: 800,
                    ),
                    const SizedBox(width: 13.3),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(AppLocalizations.of(context)!.jesica!,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    fontWeight: FontWeight.bold)),
                        SizedBox(height: 8.0),
                        Text(AppLocalizations.of(context)!.type!,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: kHintColor, fontSize: 10.0)),
                        SizedBox(height: 10.3),
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.star,
                              color: Color(0xff7ac81e),
                              size: 15,
                            ),
                            SizedBox(width: 10.0),
                            Text('4.5',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        color: Color(0xff7ac81e),
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 10.3),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: kIconColor,
                              size: 15,
                            ),
                            SizedBox(width: 10.0),
                            Text('5.0 km ',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        color: kHintColor, fontSize: 10.0)),
                            Text('| ',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        color: kMainColor, fontSize: 10.0)),
                            Text(AppLocalizations.of(context)!.storeAddress!,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        color: kHintColor, fontSize: 10.0)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
  }
}