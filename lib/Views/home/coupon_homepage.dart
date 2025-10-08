import 'package:flutter/material.dart';
import 'package:givt_mobile_app/l10n/app_localizations.dart';

class CouponHomepage extends StatefulWidget {
  const CouponHomepage({super.key});

  @override
  State<CouponHomepage> createState() => _CouponHomepageState();
}

class _CouponHomepageState extends State<CouponHomepage> {
  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(body: Center(child: Text(appLoc.coupon_page)));
  }
}
