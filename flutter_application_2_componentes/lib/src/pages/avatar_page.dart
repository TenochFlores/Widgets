import 'package:flutter/material.dart';
import 'package:flutter_application_2_componentes/src/utils/icono_string_util.dart';

class AvatarPage extends StatelessWidget {

  static String pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        backgroundColor: appBarBackground(),
        actions: [
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://www.telegraph.co.uk/content/dam/luxury/2021/03/29/HBME_110_S21SR_HBxChrisHemsworth_2ndTier_Look1_003_sRGB_trans_NvBQzQNjv4BqOKAHoKd6K5JJcaSgOH80CPVE-cxyooVBLMdMAs_GGi4.jpg?imwidth=480'),
              radius: 45.0,
            ),
            padding: EdgeInsets.all(8.0),
          ),
          Container(
            child: CircleAvatar(
              child: Text("TF"),
              backgroundColor: Colors.lightGreen.shade700,
            ),
            margin: EdgeInsets.only(right: 10.0) //Separacion avatar
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/chris-hemsworth-1552405944.jpg?crop=1.00xw:0.904xh;0,0.0234xh&resize=480:*'),
          // image: AssetImage('assets/IMG_20201224_185652_478.jpg'), //Imagen de assets
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}