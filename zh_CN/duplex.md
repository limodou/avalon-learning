# 双向绑定-添加操作

## 需求描述

下面开始考虑如何添加一条新的评论。从前面的界面中，我们已经看到预留了文本输入框，
只不过还没有对它进行处理。为了简化，我们只处理输入的文本，象：作者，时间等，都
认为已经存在。

## ms-duplex

MVVM 框架的一个强大的功能就是数据的双向绑定，Model 中的数据可以与 DOM 绑定，DOM
的元素（如输入字段）也可以和 Model 中的数据绑定。这样，不管哪一方发生了变化，相
对应的另一方也会同步修改。如果你了解 angularjs 会认为这个很神奇，现在 Avalon 也
一样。

定义双向绑定，可以使用 Avalon 提供的 `ms-duplex` 。

对页面中的 `<form>` 进行修改为：

{% include file=../demos/duplex.html, class=linenums %}
<!-- form begin -->...<!-- form end -->
{% endinclude %}

这里有两处变化：

1. 在 `<textarea>` 上添加了 `ms-duplex="comment"` ，它将与 Model 中的 `comment`
   属性相对应。
1. 在下面的 `<div>` 按钮上添加 `ms-click="add"` ，它是一个事件绑定，用来处理添加。

{% alert class=info %}
这里我们可以看到， `add()` 是一个函数，但是因为我们不需要参数，所以在定义时，可以
忽略括号。
{% endalert %}

## 修改 Model

在 `comments` Model 中进行如下修改：

{% include file=../demos/duplex.html, class=linenums %}
//begin of add...//end of add
{% endinclude %}

这个修改主要干了两件事：

1. 添加 `vm.comment = ''` ，定义评论的初始值为空
1. 添加 `add()` 方法。这里我先检查内容是否为空，如果为空，则不进行添加评论的处理。
   如果不为空，则向 `vm.comments` 数组追加一条新的记录。除了 `content` 是等于
   `vm.comment` 以外，其它的都使用缺省值，只是为了展示。

    这里正常的处理应该是通过 ajax 向后台发送数据，当后台处理成功之后，再将数据
    追加到评论数组中。但是因为只是一个演示，这块就省略了。
    
    在追加之后，将 `vm.comment` 置空。

## 观看演示代码

* [演示代码1 demos/duplex.html](../demos/duplex.html)

## 参考文档

* [ms-duplex][1]

[1]: http://www.cnblogs.com/rubylouvre/p/3181291.html#top13
