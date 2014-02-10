

我在用Text Kit做一个阅读器的练习时发现一个问题：界面上的文字无法选中且，不显示编辑菜单。

程序结构、效果大致如下：
一个NSTextStorage —— 一个NSLayoutManager —— 多个NSTextContainer（UITextView）
UITextView作为子视图放到一个UIScrollView里，实现滑动翻页的效果。

另外，当只有一个NSTextContainer（UITextView）时，一切正常；多个时则不行。
