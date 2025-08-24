%{
title: "这个博客只有14kb大小",
author: "Fabricio Damazio",
tags: ~w(elixir),
description: "优化Phoenix框架应用实现极速加载"
}
---
昨天我观看了[这个视频 ↗](https://www.youtube.com/watch?v=ciNXbR5wvhU)
{: target="_blank" .font-medium .text-pink-800 }，Primeagen解释了为什么小于14kB的网页比15kB的加载更快
（视频基于[这篇文章 ↗](https://endtimes.dev/why-your-website-should-be-under-14kb-in-size/){: target="_blank" .font-medium .text-pink-800 })。

看完后，我开始思考如何优化这个博客的加载速度。这是一个标准的Phoenix框架应用，尚未进行任何优化。

# 优化前

首先，我禁用缓存访问博客并记录响应大小以便对比：

    html        (3.04kB)
     app.js      (39.26kB)
     app.css     (6.64kB)
     br_flag.svg (2.81kB)
     us_flag.svg (702B)
     cn_flag.svg (722B)
     favicon.ico (468B)

总计接收：53.64kB
对于标准应用还不错，但有改进空间。

# 移除app.js

第一个优化：移除Phoenix默认的app.js文件。
这个文件包含LiveView的JavaScript，如phx-click等事件处理和hooks。
我完全不需要这些功能，博客只是静态渲染Markdown文章。

移除后：

    html        (3.02 kB)
     app.js      (0 kB) - 已移除
     app.css     (6.64 kB)
     br_flag.svg (2.81 kB)
     us_flag.svg (702 B)
     cn_flag.svg (722 B)
     favicon.ico (468 B)

总计接收：14.36kB
巨大改进，但还不够。

# 优化Tailwind

我讨厌手写CSS，所以保留了Tailwind。
通过编辑tailwind.config.js移除未使用的插件和核心组件：

```js
module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/site_web.ex",
    "../lib/site_web/**/*.*ex"
  ],
  corePlugins: {
    float: false,
    animation: false,
    gradient: false,
    filter: false,
    backdropFilter: false,
    ringWidth: false,
    skew: false,
    rotate: false,
    translate: false,
  },
  plugins: []
```

优化后CSS体积减小：

    html         (3.02 kB)
     app.css     (4.60 kB)
     br_flag.svg (2.81 kB)
     us_flag.svg (702 B)
     cn_flag.svg (722 B)
     favicon.ico (468 B)

总计接收：12.32kB
速度已经非常快。

# CSS和SVG预加载

通过配置CSS预加载提升加载速度：

```html
<link
  rel="preload"
  href={~p"/assets/app.css"}
  as="style"
  ...
/>
```

国旗图标优化：
原本想用Unicode符号代替图片，但Windows不支持国旗emoji（感谢微软！），最终采用SVG预加载方案。

# 简化巴西国旗

巴西国旗SVG原体积2.81kB，对小图标而言过大。简化细节后仅698B。

# 优化后

最终对比结果：

    html         (3.04 kB → 2.48 kB)    (-18%)
     app.js      (39.26 kB → 0 kB)      (-100%)
     app.css     (6.64 kB → 3.95 kB)    (-40%)
     br_flag.svg (2.81 kB → 698 B)      (-75%)
     us_flag.svg (702 B → 702 B)        (0%)
     cn_flag.svg (722 B → 722 B)        (0%)
     favicon.ico (468 B → 468 B)        (0%)
     ----------------------------------------
     总计：     53.64 kB → 9.02 kB      (-83%)

博客现在小得惊人，首次请求压缩后仅约9kB。
禁用缓存时，CSS和SVG缓存后仅传输2.48kB，平均响应时间<30ms。

快，真的很快。

---
*注：本文采用AI辅助翻译，经过人工校对。欢迎反馈建议*
