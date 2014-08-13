获得Avalon源码
==================

Avalon的项目目前在 https://github.com/RubyLouvre/avalon ，进入这个页面有几种下载
源码的方法：

## 使用 git 工具同步代码

这种方式的好处是当Avalon的仓库发生变化时，可以通过 `git pull` 来进行代码同步。

另外，使用git工具是从事开源项目必不可少的一种技能，所以强烈建议大家学会并掌握git
的使用。

本教程不会涉及过多的git使用的内容。

操作如下：

1. 安装 git 工具

    进入 http://git-scm.com/ 网站，根据操作系统不同，安装合适的git工具。
    
    如果在windows下，进入git环境，只要在资源管理器对应的目录点击鼠标右键，选择Git Bash
    即可进入git的shell环境。这是一个类Linux的环境，所以很多Linux命令都可以使用。
    
1. 克隆 avalon 仓库

    进入你常用的工作目录，然后进入git环境，输入：
    
    ```
    git clone git@github.com:RubyLouvre/avalon.git
    ```
    
    命令成功后，会在当前目录下创建一个 avalon 的目录，avalon的源码就全在里面了。

1. 更新源码

    进入 avalon 的源码目录，然后再进入git环境，输入：
    
    ```
    git pull
    ```
    
    如果有更新会看到类似：
    
    ```
    remote: Counting objects: 21, done.
    remote: Compressing objects: 100% (21/21), done.
    remote: Total 21 (delta 10), reused 2 (delta 0)
    Unpacking objects: 100% (21/21), done.
    From https://github.com/RubyLouvre/avalon
       c8ec939..815c675  master     -> origin/master
    Updating c8ec939..815c675
    Fast-forward
     aa1.html         |  60 ++++++++--------------
     aaa1.html        |  32 ++++++------
     avalon.js        | 154 ++++++++++++++++++++++++++++++++++---------------------
     avalon.mobile.js |  76 ++++++++++++++++-----------
     index_each5.html |   3 +-
     index_if2.html   |  30 ++++-------
     6 files changed, 190 insertions(+), 165 deletions(-)
    ```
    
    顺便说一句，avalon的更新还是挺频繁的。

## 直接下载源码

直接下载主要有两种方式，一种是下载当前最新的源码，可以在 avalon 的github
主页的右侧找到一个 `Download ZIP` 的按钮，也可以直接点击 https://github.com/RubyLouvre/avalon/archive/master.zip
进行下载。

另一种方式就是按版本下载，可以在github的项目页面上看到有一个标签(Tab)叫 `releases` 
进去以后就是按Tag来排列的各个版本可以下载。
