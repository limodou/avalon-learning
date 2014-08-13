# Hello, Avalon

在前面我们下载好了源文件之后，我们就可以开始学习Avalon的使用了。

## 操作

Avalon 的主要文件有两个版本，一个是 `avalon.js` 它可以实现对旧的IE浏览器很好的
兼容，目前甚至可以支持IE6，所以对于anguarjs来说，这是一个很强大的地方。我说过
我以前也用过angularjs吗？不过我现在希望以后就用avalon了。另一个是 `avalon.mobile.js`
它主要是支持现代的浏览器，所以如果考虑兼容就使用 `avalon.js` 好了。

1. 让我们先建一个测试用的目录，如 `mywork`
1. 将 `avalon.js` 拷贝到 `mywork` 下
1. 然后创建一个名为 `hello_avalon.html` 的文件。

    一般我们学习编程第一个例子不都是类似于 `Hello, world` 吗？所以我们先
    从 `Hello, Avalon` 开始。
1. 输入以下内容：

    {% include file=../demos/hello_avalon.html, class=linenums%}
    {% endinclude %}
    
1. 在浏览器打开这个文件，结果是：

    ![](images/hello_avalon.png)
    

下面让我们解释一下：

## 导入 avalon.js

通过:

```
<script src="avalon.js"></script>
```

来引入avalon的核心文件。本身avalon并不需要jquery的支持，它内部实现了许多jquery
的功能，但是的确可以与jquery一起使用。

## 设置控制域

`<div ms-controller="hello">` 这个很重要，它用来声明avalon的控制域。如果你了解
angularjs，它就类似于 `ng-controller` 的作用。一个HTML文件中可以定义多个 `ms-controller`。

一个控制域与一个Model相对应，当Model中的数据发生变化，与之对应的控制域的DOM会自
动进行变化。

`ms-controller` 后面要给一个名字，在下面我们会按名字来定义 Model。

因为控制域是定义在DOM中的，因此，它的作用就是起到模板的功能，因此，未来我们大部分
的展示工作都将集中在这里，后面我们会看到，它是如何与数据绑定，并且自动变化的。

## ms- 开头的属性

区别于angularjs使用 `ng-` 开头的特殊标签/属性来定义angularjs的功能，avalon使用 `ms-` 
开头的属性。所以只要涉及到Avalon动态处理功能的，都要注意定义 `ms-` 开头的属性。

目前，Avalon并不存在以 `ms-` 开头的 TAG，所以全部都是属性。

## 插值表达式

`<h1>Hello, {{name}}</h1>` 它包含了 `{{name}}` 这就是一个插件表达式。可以理解为可
动态变化的模板变量。 `name` 将定义在下面的 Model 中，一会我们会看到。

这个插值表达式是放在文本中的，也有一些 `ms-` 的特殊属性可以使用插值。

插件表达式会被avalon进行计算，然后结果将显示在原来的位置。所以你其实是可以写更
复杂一些的表达式的。关于这一点，可以自行测试。

## 定义Model

```
<script>
var model = avalon.define('hello', function(vm){
    vm.name = 'Avalon';
});
</script>
```

Model的定义是通过javascript来实现的。要通过 `avalon.define()` 函数来定义。它需
要至少两个参数：

* 第一个参数是和前面 `ms-controller` 对应的名字。这里是 `hello`
* 第二个是一个函数，这个函数需要一个参数，名字可以随便起，但是习惯上使用 `vm` (在
  Avalon中表示是 ViewModel 的意思)。 `vm` 可以理解为Model的引用。

你可能还会看到 `avalon.define()` 还赋给了一个变量。那么，我们就可以利用这个变量
在 Model 之外来引用 Model 里面的值。 **这一点非常方便** 。

`vm.name = 'Avalon';` 在 `vm` 上定义了一个 `name` 的属性，所以和前面的插件表达式
一对应，我们就知道 `{{name}}` 的值就是这个。

## 如何引用Model的属性

通常我们定义的Model属性大体上分为两类，一类是数据，如：数组，Object(可理解为Hash)，简单
变量等，还有一类就是函数了。

在控制域中使用这些Model的属性时，直接引用它们的名字，并不需要再添加 `vm.` 这样的前缀。

## Avalon 的启动简单介绍

其实上面的代码已经解释完了。那么你可能会有疑问：没看到哪里有启动的代码，怎么界面
就自动变了呢？

这是因为 Avalon 在装载 `avalon.js` 时，会当DOM准备好时自动进行渲染的处理，所以简单
情况下，定义好 Model 就可以了。

如果想看更原始的定义方法，可以是这样的：

{% include file=../demos/hello_avalon_1.html, class=linenums%}
{% endinclude %}

不过这样要麻烦得多。

## 观看演示代码

* [演示代码1 demos/hello_avalon.html](../demos/hello_avalon.html)
* [演示代码2 demos/hello_avalon_1.html](../demos/hello_avalon_1.html)