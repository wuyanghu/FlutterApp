# FlutterApp
flutter study
# [demo](https://github.com/wuyanghu/FlutterApp)
# 效果图
## 个人页
![IMG_0327.PNG](https://cdn.nlark.com/yuque/0/2021/png/12914552/1621942682663-4d4fbdf3-98d3-4f6c-ad80-fb2ddcef9529.png#align=left&display=inline&height=667&margin=%5Bobject%20Object%5D&name=IMG_0327.PNG&originHeight=1334&originWidth=750&size=89764&status=done&style=none&width=375)
![IMG_0330.PNG](https://cdn.nlark.com/yuque/0/2021/png/12914552/1621942698039-b31d57f2-34e4-4d7a-8318-893eaf5b771f.png#align=left&display=inline&height=667&margin=%5Bobject%20Object%5D&name=IMG_0330.PNG&originHeight=1334&originWidth=750&size=75473&status=done&style=none&width=375)


## 


## 登录


![IMG_0331.PNG](https://cdn.nlark.com/yuque/0/2021/png/12914552/1621942732322-4aa6f8dc-98ff-45b3-b6d3-2d796baa5bd7.png#align=left&display=inline&height=667&margin=%5Bobject%20Object%5D&name=IMG_0331.PNG&originHeight=1334&originWidth=750&size=86064&status=done&style=none&width=375)


## 朋友圈


![](https://cdn.nlark.com/yuque/0/2021/png/12914552/1621942476782-4b62b5cf-445e-4348-b299-520d9f3bd1cc.png#align=left&display=inline&height=569&margin=%5Bobject%20Object%5D&originHeight=569&originWidth=320&size=0&status=done&style=none&width=320)


![](https://cdn.nlark.com/yuque/0/2021/png/12914552/1621942476874-8c1f7b51-3781-473a-845a-a854d7bf0c62.png#align=left&display=inline&height=569&margin=%5Bobject%20Object%5D&originHeight=569&originWidth=320&size=0&status=done&style=none&width=320)


![](https://cdn.nlark.com/yuque/0/2021/png/12914552/1621942476878-5f8fd9f0-6162-4279-9e32-0bc1e67f1753.png#align=left&display=inline&height=569&margin=%5Bobject%20Object%5D&originHeight=569&originWidth=320&size=0&status=done&style=none&width=320)


![](https://cdn.nlark.com/yuque/0/2021/png/12914552/1621942476867-b8e6f1e2-b177-4a4c-a987-f14db44c64a6.png#align=left&display=inline&height=569&margin=%5Bobject%20Object%5D&originHeight=569&originWidth=320&size=0&status=done&style=none&width=320)


![](https://cdn.nlark.com/yuque/0/2021/png/12914552/1621942476805-bc9a56f0-5333-4559-abcc-020af921d3d5.png#align=left&display=inline&height=569&margin=%5Bobject%20Object%5D&originHeight=569&originWidth=320&size=0&status=done&style=none&width=320)


![](https://cdn.nlark.com/yuque/0/2021/png/12914552/1621942476818-274019b5-9430-4cad-924c-aaf482a5786b.png#align=left&display=inline&height=569&margin=%5Bobject%20Object%5D&originHeight=569&originWidth=320&size=0&status=done&style=none&width=320)


![IMG_0328.PNG](https://cdn.nlark.com/yuque/0/2021/png/12914552/1621942694100-797a33f1-4a43-4138-b8be-3172dadf97e6.png#align=left&display=inline&height=667&margin=%5Bobject%20Object%5D&name=IMG_0328.PNG&originHeight=1334&originWidth=750&size=771962&status=done&style=none&width=375)


![IMG_0329.PNG](https://cdn.nlark.com/yuque/0/2021/png/12914552/1621942696946-93d8c65b-3c5c-4120-98d1-bdeccdd3fa88.png#align=left&display=inline&height=667&margin=%5Bobject%20Object%5D&name=IMG_0329.PNG&originHeight=1334&originWidth=750&size=261982&status=done&style=none&width=375)


# 如何转json
推荐一个网站:[在线json转model](https://javiercbk.github.io/json_to_dart/)。
如果碰到报错，可能是关键字错误。另外，实际应用中要处理null,否则赋值到组件中会报错。
# 图片框架
使用:cached_network_image
如果是空url，就不要访问了，直接使用Image.asset。
列表访问太多的空url,控制台不停的报异常，情况差的时候内存溢出了。


```
18. * thread #16, name = 'io.flutter.worker.4', stop reason = EXC_RESOURCE RESOURCE_TYPE_MEMORY (limit=1450 MB, unused=0x0)
    frame #0: 0x00000001035e1874 Flutter`ycc_rgb_convert + 144
Flutter`ycc_rgb_convert:
->  0x1035e1874 <+144>: strb   w20, [x3]
    0x1035e1878 <+148>: ldr    x20, [x13, x7, lsl #3]
    0x1035e187c <+152>: ldr    x19, [x12, x19, lsl #3]
    0x1035e1880 <+156>: add    x19, x19, x20
Target 0: (Runner) stopped.
```


# null处理
在赋值给Widget，一定要处理好null,否则直接报错。
# CircularProgressIndicator被拉伸


```
Widget customCircularProgressIndicator() {
    return Center(
        child: SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(),
    ));
  }
```


