# 条件处理-数据筛选

## 需求描述

现在我有一个新的要求，可以通过点击某个用户来对评论进行筛选，即：奇数次点击为只
显示这个用户的评论，偶数次点击为显示全部评论。

针对这个需求，可以有两种实现的方法，一种是使用 `ms-visible` ，我们在上一章已经学过
了。另一种是使用 `ms-if`。

## 页面修改

{% include file=../demos/if.html, class=linenums %}
<!-- begin filter author -->...<!-- end filter author -->
{% endinclude %}

主要修改了两个地方，一处是添加了 `ms-if-loop` ，一处是添加了 `ms-click` 。

`ms-if-loop` 下面有解释。 

`ms-click="onlyme(el.author)` 的作用是点击某个作者时，调用一个函数，用来设置
是否要进行用户过滤。

## ms-if

`ms-if` 的作用是在渲染时，将不满足条件的元素直接去除，所以你将在渲染后的页面中
找不到被过滤掉的元素。而 `ms-visible` 的作用只是隐藏，并不会删除，所以它们还是
有区别的。

上面我们提到的是使用 `ms-if` ，但其实使用它存在一定的问题的，原因就在于 Avalon
在处理 `ms-` 属性时是有顺序的，如文档中的描述是：

```
ms-skip --> ms-important --> ms-controller --> ms-if --> ms-repeat --> ms-if-loop --> ...-->ms-each --> ms-with --> ms-duplex
```

所以我们可以看到， `ms-if` 的处理其实是在 `ms-repeat` 之前，所以会造成在 `ms-if`
中无法处理循环变量的问题，所以这里我们其实要改用 `ms-if-loop` ，它就是为了解决
这个问题。它的用法和 `ms-if` 其实是一样的。

## ms-if-loop

上面的代码将:

```
<div class="comment" ms-repeat="comments">
```

改为:

```
<div class="comment" ms-repeat="comments" ms-if-loop="!filter_author || (filter_author && el.author == filter_author)">
```

这里表达式的意思是：

* 如果 `filter_author` 为假，则显示
* 如果 `filter_author` 为真，则当前作者名与 `filter_author` 相同则显示

第一种对应全部显示，第二种对应选中某个作者的情况。

## 修改 Model 代码

在 `comments` Model 中进行如下修改：

{% include file=../demos/if.html, class=linenums %}
//begin of filter author...//end of filter author
{% endinclude %}

修改的地方为：

1. 增加 `vm.filter_author = '';` 的初始化设置，缺省不过滤
1. 增加 `onlyme(el)` 函数，它需要一个参数，即点中的作者姓名，如果与保存的 `filter_author`
   相同，则置空，如果不同，则赋值。用来区分是奇数次点击还是偶数次点击。

## 练习

我们可以自已试一下，把上面的 `ms-if-loop` 改为 `ms-visible` 。

## 观看演示代码

* [演示代码1 demos/if.html](../demos/if.html)

## 参考文档

* [ms-if][1]

[1]: http://www.cnblogs.com/rubylouvre/p/3181291.html#top12
