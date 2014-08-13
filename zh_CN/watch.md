# 使用 $watch 监视变化

## 问题

细心的朋友也许会发现，下面的评论总条数与上面的评论条数并不一致。是不是有可能：
当下面的评论条数变化时，上面也自动变化呢？

答案是肯定的！

## 添加 $watch 处理

让我们在 `<script>` 中添加以下代码:

{% include file=../demos/watch.html, class=linenums %}
// begin of watch...// end of watch
{% endinclude %}

在上面的代码中，根据新的评论条数来修改 `model` 中的 `comment_count` 的值。

然后再看页面，条数已经同步了。

## $watch 介绍

`$watch` 可以用来监视 Model 中对象，以及对象的某些属性的变化，当变化时， Avalon
会自动调用相应的 `$watch` 函数。一个 `$watch` 函数定义为：

```
vm.$watch('prop', function(value, oldValue){
});
```

其中，value是变化后的值，oldValue是变化前的值。

根据属性在 Model 中存在的“层数”不同（层数的概念见下面），要在不同的对象上引用
`$watch` 方法与某个属性名进行绑定。所以上面的代码，就是绑定了 `vm` 下的 `prop` 属
性。如果有多层（层数越少越好，否则后果难以遇料，尽量将数据扁平化），则需要使用

```
model.prop.$watch('name', function(value, oldValue){
});
```

类似这种写法。

## 不同层次 $watch 的处理

根据数据组织的复杂程度，可以将数据分为不同的层次。比如 `vm.name` 这里 `name` 就算
是第一层。 `vm.array = []` ，这里 `array` 也是第一层，但是它的长度 `length` 就
算是第二层。简单理解，就是用几个 `.` 来引用就是几层（不准确，只是便于理解）。

那么根据 Avalon 中关于 $watch 的描述，对于二层以上的，需要在 Model 定义之外，对
返回的 Model 对象（注意不是定义用的 `vm` 对象）使用 `$watch` 定义。所以，我们上
面的代码就是写在 Model 定义之外的，并且使用 `model` 这个对象。

## 使用 $watch 的时机

也许你在考虑：我在进行评论操作时，同时修改 Blog 的评论数不是一样吗？的确，可以做
到。但是，评论数的变化会存在多个地方，比如：数据装入，添加，删除等。这样至少你
需要在这几个地方都添加相同的同步评论数的处理代码。这样很不方便。而同步评论数的
真正来源正是评论的总条数，因此只要它变化，进行同步就对了。所以，以数据为中心，
抓住关键的变化源进行非主动式同步（就是不在执行某些操作时进行同步），这种方式是
最适合使用 `$watch` 来处理的。或者你可以理解为使用 `$watch` 适合进行间接的处理。

## 观看演示代码

* [演示代码1 demos/watch.html](../demos/watch.html)

## 参考文档

* [$watch][1]

[1]: http://rubylouvre.github.io/mvvm/avalon.watch.html
