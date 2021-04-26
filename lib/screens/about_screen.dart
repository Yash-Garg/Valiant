import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valiant/utils/chrome_custom_tabs.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });
  }

  ListTile aboutListTile(
      {required String text, required IconData icon, required String url}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: () {
        openCustomTab(url);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About', style: TextStyle(fontSize: 23)),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 70,
                      child: Image.asset('assets/icons/ic_launcher.png'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${packageInfo.appName}",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Password Generator written in Flutter",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "v.${packageInfo.version}+${packageInfo.buildNumber}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.solidEnvelope,
              color: Colors.white,
            ),
            title: Text(
              "Email",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onTap: () {
              launch("mailto:yashgarg.dev@gmail.com");
            },
          ),
          aboutListTile(
            icon: FontAwesomeIcons.github,
            text: "Github",
            url: "https://github.com/Yash-Garg",
          ),
          aboutListTile(
            icon: FontAwesomeIcons.twitter,
            text: "Twitter",
            url: "https://twitter.com/yashgarg1803",
          ),
          aboutListTile(
            icon: FontAwesomeIcons.linkedin,
            text: "Linkedin",
            url: "https://www.linkedin.com/mwlite/in/yashgarg1803",
          ),
          aboutListTile(
            icon: FontAwesomeIcons.telegramPlane,
            text: "Telegram",
            url: "https://telegram.me/smart_geek",
          ),
        ],
      ),
    );
  }
}
