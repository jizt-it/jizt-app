import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jizt/new_text_summary/new_text_summary.dart';
import 'package:jizt/summaries/summaries.dart';
import 'package:jizt/widgets/clouds_background.dart';
import 'package:jizt/widgets/platform_shader_mask.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            tooltip: 'More',
            icon: Icon(
              Icons.more_vert,
              color: Color(0xFF050081),
            ),
            onPressed: () {
              // TODO Open menu
            },
          ),
          SizedBox(width: 8)
        ],
      ),
      body: Stack(
        children: [
          CloudsBackground(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Hi there',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: Color(0xFF050081)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Anything to jizt today?',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ChoiceChip(
                        label: Text('Text'),
                        padding: EdgeInsets.only(left: 4, right: 12),
                        labelPadding: EdgeInsets.symmetric(horizontal: 0),
                        labelStyle: TextStyle(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        avatar: Icon(
                          Icons.text_snippet,
                          size: 18,
                          color: Colors.white,
                        ),
                        selected: true,
                        selectedColor: Color(0xFF5201F5),
                        onSelected: (bool selected) {},
                      ),
                      SizedBox(width: 8),
                      Theme(
                        data: Theme.of(context)
                            .copyWith(canvasColor: Colors.transparent),
                        child: ChoiceChip(
                          label: Text('Twitter'),
                          padding: EdgeInsets.only(left: 4, right: 12),
                          labelPadding: EdgeInsets.symmetric(horizontal: 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          avatar: SvgPicture.asset(
                            'assets/drawables/ic_twitter.svg',
                            semanticsLabel: 'text',
                            width: 18,
                          ),
                          backgroundColor: Colors.transparent,
                          selected: false,
                          onSelected: (bool selected) {},
                        ),
                      ),
                      SizedBox(width: 8),
                      Theme(
                        data: Theme.of(context)
                            .copyWith(canvasColor: Colors.transparent),
                        child: ChoiceChip(
                          label: Text('Camera'),
                          padding: EdgeInsets.only(left: 4, right: 12),
                          labelPadding: EdgeInsets.symmetric(horizontal: 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          avatar: SvgPicture.asset(
                            'assets/drawables/ic_camera.svg',
                            semanticsLabel: 'text',
                            width: 18,
                          ),
                          backgroundColor: Colors.transparent,
                          selected: false,
                          onSelected: (bool selected) {},
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Hero(
                      tag: 'card',
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push<void>(
                            NewTextSummaryPage.route(),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: SizedBox.expand(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Type or paste your text...',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "My Summaries",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                          child: Text('See all',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              )),
                          onPressed: () {
                            Navigator.of(context).push<void>(
                              SummariesPage.route(),
                            );
                          })
                    ],
                  ),
                ),
                SizedBox(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: PlatformShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [0.0, 0.7, 1.0],
                          colors: <Color>[
                            Colors.transparent,
                            Colors.transparent,
                            Color(0xFF5201F5)
                          ],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstOut,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 16),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Card(
                              color: Color(0xFF5201F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 130,
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              '1d ago',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Color(0xFF5201F5),
                                              ),
                                            ),
                                          ),
                                          decoration: new BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(4),
                                              )),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a scelerisque massa, et volutpat arcu. Fusce a dolor a augue rhoncus pharetra. Ut aliquam nisl ac lacinia mattis. Quisque id nisi quam. Nullam et elementum turpis. Vestibulum nec sodales magna. Nunc non rutrum velit, non aliquet nunc. Phasellus in pretium metus',
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                              fontSize: 8,
                                              color: Colors.white,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16)
              ],
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
