# 在 Uliweb 中使用 Avalon

[Uliweb](https://github.com/limodou/uliweb) 是一个 Python 语言开发的 Web 框架，在 Uliweb 项目中使用 Avalon 很简单，
基本上有两种方式：

## 配置 plugs.ui.avalon

在 Uliweb 的 APP 收集项目 plugs 中已经集成了 Avalon ，所以简单的方式是先安装
plugs，如：

```
pip install plugs
```

然后在你的项目 `apps/settings.ini` 的 `GLOBAL/INSTALLED_APPS` 中添加:

```
plugs.ui.avalon
```

这样配置工作就完成了。

再接着，哪个页面模板打算使用 Avalon ，在页面中添加:

```
{{use "avalon"}}
```

就可以了。

## 手工处理

如果不使用 avalon 那么也可以手工引入，也比较简单：

1. 将 `avalon.js` 拷贝到你的某个 APP 下的 `static` 目录下, 也可以在 `static` 下的某个子目录下
2. 在模板页面中使用：

    ```
    {{link "/static/avalon.js"}}
    ```
    
    但是光这样还不够，因为 Avalon 的插值表达式是使用 `{{}}` 作为标签的，与 Uliewb
    的模板标签冲突。因此有两种方式：

    1. 重新设置 Avalon 的插值表达式的标签，如：
    
        ```
        avalon.config({
           interpolate: ["{%", "%}"]
        });
        ```
        
        在 plugs 中，其实就是这样处理的。只不过，它把上面的代码写在了 `avalon_init.js`
        文件中，并在 `{{use "avalon"}}` 时自动引入了这个 js 文件。
        
        这样，再写插值表达式时可以是：
        
        ```
        {% expression %}
        ```
        
    2. 在模板中设定 Uliweb 的标签字符串，如：
    
        ```
        #uliweb-template-tag:[[,]]
        ```
        
        这一行要写在模板的最上面一行。这样，Avalon 的写法不变，变的是 Uliweb 的模
        板写法。
        
    以上两种方法都可以，不过建议使用第一种。
        
        
除了 Uliweb 还有其它的一些框架，基本使用是类似的，当出现标签冲突时都可以使用上
面第一种方法解决。