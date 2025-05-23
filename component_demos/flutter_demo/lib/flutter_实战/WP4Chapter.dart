import 'dart:ui';

import 'package:flutter/material.dart';

class LineRowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("线性布局-row")),
      body: Column(
        children: [
          Text(
            "线性布局-row",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(3.0), //3像素圆角
                boxShadow: [
                  //阴影
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0)
                ]),
            padding: EdgeInsets.only(top: 16, left: 10, right: 10),
            child: Column(
              //测试Row对齐方式，排除Column默认居中对齐的干扰
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    Text(
                      " hello world ",
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Text(" I am Jack "),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LineColumnLayout extends StatelessWidget {
  void main() {
    PictureRecorder recorder = PictureRecorder();
    // 初始化 Canvas 时，传入 PictureRecorder 实例
    // 用于记录发生在该 canvas 上的所有操作
    //
    Canvas canvas = Canvas(recorder);

    Paint circlePaint = Paint();
    circlePaint.color = Colors.blueAccent;

    // 调用 Canvas 的绘制接口，画一个圆形
    //
    canvas.drawCircle(Offset(400, 400), 300, circlePaint);

    // 绘制结束，生成Picture
    //
    Picture picture = recorder.endRecording();

    SceneBuilder sceneBuilder = SceneBuilder();
    sceneBuilder.pushOffset(0, 0);
    // 将 picture 送入 SceneBuilder
    //
    sceneBuilder.addPicture(Offset(0, 0), picture);
    sceneBuilder.pop();

    // 生成 Scene
    //
    Scene scene = sceneBuilder.build();

    window.onDrawFrame = () {
      // 将 scene 送入 Engine 层进行渲染显示
      //
      window.render(scene);
    };
    window.scheduleFrame();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 100,
          color: Colors.red,
        ),
        Container(
          height: 200,
          color: Colors.black,
        ),
        Container(
          height: 300,
          color: Colors.blue,
        ),
        Container(
          height: 400,
          color: Colors.red,
        ),
        Container(
          height: 500,
          color: Colors.black,
        ),
        Container(
          height: 600,
          color: Colors.blue,
        ),
      ],
    );

    //解释为什么超出部分之后会自动截取了
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            height: 2001,
          ),
        )
      ],
    );

    return Center(
      child: Container(
          key: Key("value"), width: 100, height: 100, color: Colors.red),
    );

    return SingleChildScrollView(
      child: Container(
        height: 100,
        color: Colors.red,
      ),
    );

    // return Column(
    //   // mainAxisSize: MainAxisSize.min,
    //   crossAxisAlignment: CrossAxisAlignment.end,
    //   children: [
    //     Container(color: Colors.red, height: 200, ),
    //     // Text("第三个Text"), Text("居右"),
    //   ],
    // );

    return Scaffold(
      appBar: AppBar(title: Text("线性布局-column")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("第一个Text"),
          Text("居左"),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("第二个Text"),
                Text("居中"),
              ],
            ),
          ),
          Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text("第三个Text"), Text("居右")],
              )
            ],
          )
        ],
      ),
    );
  }
}

class LineColumnLayout2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("线性布局-与屏幕宽度一致")),
      body: ConstrainedBox(
        constraints: BoxConstraints(minWidth: double.infinity),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("hi"),
            Text("world"),
          ],
        ),
      ),
    );
  }
}

class LineColumnLayout3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("线性布局-与屏幕宽度一致")),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                  children: <Widget>[
                    Text("hello world "),
                    Text("I am Jack "),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LineColumnLayout4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("线性布局-与屏幕宽度一致")),
        body: Container(
            color: Colors.green,
            child: Expanded(
              child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                  children: <Widget>[
                    Text("hello world "),
                    Text("I am Jack "),
                  ],
                ),
              ),
            )));
  }
}

class FlexLayoutTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("弹性布局")),
      body: Column(
        children: <Widget>[
          //Flex的两个子widget按1：2来占据水平空间
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 100.0,
              //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlowLayoutWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("流式布局")),
        body: Wrap(
          spacing: 8.0, // 主轴(水平)方向间距
          runSpacing: 4.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.center, //沿主轴方向居中
          children: <Widget>[
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('A')),
              label: new Text('Hamilton'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('M')),
              label: new Text('Lafayette'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('H')),
              label: new Text('Mulligan'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('J')),
              label: new Text('Laurens'),
            ),
          ],
        ));
  }
}

class FlowLayoutFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("流式布局")),
        body: Flow(
          delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
          children: <Widget>[
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.red,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.green,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.blue,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.yellow,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.brown,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.purple,
            ),
          ],
        ));
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({required this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class StackLayoutStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("层叠布局Stack")),
        body: //通过ConstrainedBox来确保Stack占满屏幕
            ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
            children: <Widget>[
              Container(
                child:
                    Text("Hello world", style: TextStyle(color: Colors.white)),
                color: Colors.red,
              ),
              Positioned(
                left: 18.0,
                child: Text("I am Jack"),
              ),
              Positioned(
                top: 18.0,
                child: Text("Your friend"),
              )
            ],
          ),
        ));
  }
}

class StackLayoutPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("层叠布局Positioned")),
        body: //通过ConstrainedBox来确保Stack占满屏幕
            ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand, //未定位widget占满Stack整个空间
            children: <Widget>[
              Positioned(
                left: 18.0,
                child: Text("I am Jack"),
              ),
              Container(
                child:
                    Text("Hello world", style: TextStyle(color: Colors.white)),
                color: Colors.red,
              ),
              Positioned(
                top: 18.0,
                child: Text("Your friend"),
              )
            ],
          ),
        ));
  }
}

class AlignLayoutPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("层叠布局Positioned")),
        body: //通过ConstrainedBox来确保Stack占满屏幕
            Container(
          // height: 120.0,
          // width: 120.0,
          color: Colors.blue[50],
          child: Align(
            widthFactor: 2,
            heightFactor: 2,
            alignment: Alignment(2, 0.0),
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ));
  }
}
