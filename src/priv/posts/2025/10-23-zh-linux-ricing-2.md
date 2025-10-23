%{
    title: "属于我自己的Linux Ricing",
    author: "Fabricio Damazio",
    tags: ~w(linux),
    description: "从零开始首次体验Linux Ricing的奇妙经历"
}
---

<img src="/images/posts/2025/10-23-fastfetch.png" alt="桌面和fastfetch" width="1280" height="720">

我已经记不清第一次使用Linux是什么时候了。在过去的二十年里，
我多次尝试放弃Windows，但最终总是又回去了。
直到去年，我终于彻底转向了Linux世界，选择的发行版是Ubuntu。
对于迁移用户来说，这是一个非常出色的发行版，因为它稳定、美观，而且一切都能正常工作。

几个月前，我偶然看到了PewDiePie关于Linux Ricing的视频。
当时我觉得这个想法很酷，Linux Ricing的可能性深深吸引了我。
两周前，我决定亲自动手尝试一下。作为一个完全的初学者，我首先开始研究该选择哪个发行版。

## Arch Linux和Hyprland - 为什么选择以及如何开始

在r/unixporn社区调研时，很多人不推荐Arch Linux
给Linux Ricing的初学者。就在我几乎要选择一个更
用户友好的发行版时，一条评论改变了我的看法。它解释说
像Arch Linux这样的发行版能让你在Linux Ricing过程中
更深入地理解和学习Linux。这正是我想要的。

我的第一个方法是使用名为archinstall的安装脚本安装Arch Linux。
过程非常顺利，几乎就像安装Ubuntu一样。我预先配置了
Hyprland安装，几分钟内一切就准备就绪，可以开始Linux Ricing了。

我选择[Hyprland](https://hypr.land/)是因为我爱上了它的美学设计
和动态平铺功能。另一个相关原因是它不是一个完整的
桌面环境，这迫使我进行更多定制，并更深入地了解
Linux的内部工作原理。

## Linux Ricing的魔力

安装好Arch Linux和Hyprland后，是时候开始Linux Ricing了。我的第一反应
是找一个能显示时钟、日期和其他有用信息的栏。
为此，我选择了[Waybar](https://github.com/Alexays/Waybar)。

Waybar正常工作后，下一步是选择显示系统通知的方式。
我安装了通知中心[SwayNC](https://github.com/ErikReider/SwayNotificationCenter)，
并逐渐开始定制它的外观。

<img src="/images/posts/2025/10-23-waybar.png" alt="通知中心" width="384" height="544">

在使用系统的过程中，我发现很多东西都需要自己创建，
因为它们根本不存在。锁屏界面？没有。关机按钮？
也没有。对于每个我想要但不存在的东西，我都要研究并
发现无数的选项和可能性。就这样，我逐一实现、定制，
并将它们记录在我的[dotfiles仓库](https://github.com/FabriDamazio/dotfiles)中。

## "完成"？是时候自动化了

"完成"这个词说得太绝对了。Linux Ricing其实永无止境。总有一些东西
需要改进或实现。经过整个周末的努力后，
我开始思考，如果需要重装系统或更换机器，我就得
再次手动完成所有这些工作。说实话，我甚至不太记得
自己到底做了些什么。于是我做了一个决定：从头开始一切，
记录下我所做的每一步，创建一个shell脚本，以便在需要
从零重建系统时能够重复整个过程。

我清空了磁盘，重新开始安装过程。这次我没有使用archinstall，
而是手动完成所有操作，以更好地理解整个过程。在安装
和配置的过程中，我将步骤添加到shell脚本中实现自动化。我使用
[GNOME Boxes](https://github.com/GNOME/gnome-boxes)创建了一个全新的Arch Linux安装环境
来测试脚本。每次修改后，我都会将机器恢复到
初始状态（干净的Arch Linux安装）并重新运行脚本。
最终的结果就是这个[脚本](https://github.com/FabriDamazio/dotfiles/blob/master/install.sh)，
它就在我的dotfiles仓库中。

问题解决了。如果需要从零重建整个系统，我已经做好了准备。

<img src="/images/posts/2025/10-23-full.png" alt="完整的Linux Ricing" width="1280" height="720">

## 结论

整个过程非常有趣且令人愉悦。如果你符合以下一个或多个条件，
我强烈推荐你尝试Linux Ricing：

- 你想更深入了解Linux
- 你在寻找一个有趣的项目
- 你感到无聊
- 你生活中的问题还不够多

---

注：本文采用AI辅助翻译，经过人工校对。欢迎反馈建议
