# 事件处理-删除操作

## 需求描述

有时我们会发现，评论的内容属于垃圾信息，因此需要将其删除。因此，我希望在查看评论
时，有一个删除的链接，点击后可以让我把它删除。

这个需求比较简单，删除标签在前面已经有了，所以可以直接使用。在删除后，因为评论条
数变化，所以应该两个显示都发生变化，一会我们看随后的结果是不是正确。

## ms-click

Avalon 中提供了大量的事件响应处理的属性，其中 `ms-click` 就是用来处理点击的属性。
我们修改：

```
<a class="delete">Delete</a>
```

为:

{% include file=../demos/event.html, class=linenums %}
<a class="delete"...<a class="delete"
{% endinclude %}

在 `ms-click` 后面是一个回调函数 `remove` 。如果这个回调没有参数，则可以不带括号。如果带
参数则传入相应的参数即可。这里传入了循环变量 `el` 。

{% alert class=warning %}
请注意，函数命名不要使用关键字，如 `delete` 等，否则会冲突。
{% endalert %}

## 定义回调

然后让我们在 `comments` Model 中定义对应的 `remove` 函数，如：

{% include file=../demos/event.html, class=linenums %}
//begin of remove...//end of remove
{% endinclude %}

这个处理很简单。注意，Avalon对数据对象扩展了很多方法，这里可以直接调用 `comments` 
的 `remove` 方法，它需要的不是索引值，而是元素本身。如果要删除指定的索引元素，可以
使用 `removeAt(index)` 方法。

## 观看演示代码

* [演示代码1 demos/event.html](../demos/event.html)

## 参考文档

* [ms-click][1]

[1]: http://www.cnblogs.com/rubylouvre/p/3181291.html#top10
