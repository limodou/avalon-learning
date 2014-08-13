# 使用 Ajax 获取数据

前面的例子是直接把数据写在HTML页面中，那么在实例的运行环境中，一种是通过后台模
板的方式，将数据直接生成，所以也可以形成这个效果。这种做法更多是考虑后台生成前
端展示页面的形式，前后台分离不明显。前后台分离的做法，更多是通过ajax方式来获得
数据。那么下面我们来尝试一下。

## 定义数据文件

因为这只是一个 Demo ，所以我们并不直接实现后台服务，所以我们把数据通过定义为 json
数据，然后通过 ajax 来读取它，来模拟实际的处理。

{% include file=../demos/blog_info.json %}
{% endinclude %}

{% alert class=warning %}
因为json文件中包含中文，所以我们应该将其保存为 utf8 编码，以防止显示时乱码。同时
要注意生成的json文件格式一定要正确，不然后面的解析有可能会出错。如果想试验是否
正确，可以在 chrome/firefox 的 console 中使用:

```
JSON.parse(json_string)
```

如果成功就没问题。上面的数据如果为了好看定义成多行，就有问题。
{% endalert %}

## Ajax 库的选择

伴随着 avalon，作者司徒正美还开发了其它的 js 库，如： [mmRequest](https://github.com/RubyLouvre/mmRequest), [mmDeffered](https://github.com/RubyLouvre/mmDeferred) 等，
其中 mmRequest 就是可以实现 jquery 的 ajax 功能。不过这些库本身没有放在 avalon 
的源码中，所以要使用它们还要单独下载源码。这里我先
使用 jquery 。而且在前面的例子中，因为使用semantic-ui，它本身就需要安装 jquery，
所以我们已经不再需要加入新的 js 文件了。

## 获取数据

我们这个页面实际上只在展示时获取一次数据，因此，可以直接在 Model 定义之外直接
从后台读取数据，然后修改 Model 实例中对应的属性。代码为：

{% include file=../demos/ajax_basic.html, class=linenums%}
<script>...^</script>
{% endinclude %}

从上面的代码可以看出， `vm.blog = {}` ，内容没有直接定义出来。

通过 jquery 的 `$.getJSON()` 来获得数据，并且在 `done()` (即success回调)中将数据
绑定到 `model.blog` 上。这里有一点很重要，我们不能在 Model 外面直接操作 `vm` ，所
以要通过 `model` 对象。从 Avalon 的角度， `vm` 是用来定义的，而 `model` 是真正可
以操作的对象。不过如果在 Model 定义的内部，直接使用 `vm` 一般也没有什么大问题。
不过，心里要清楚它们其实是不同的东西。

## 观看演示代码

* [演示代码1 demos/ajax_basic.html](../demos/ajax_basic.html)

## 参考文档

* [AJAX][1]
* [Avalon 最佳实践][1] 其中有一些关于 Model 应如何定义，以及定义用的 vm 与返回后的对象的区别

[1]: http://www.cnblogs.com/rubylouvre/p/3181291.html#top27
[2]: http://www.cnblogs.com/rubylouvre/p/3385373.html
