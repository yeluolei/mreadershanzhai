﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.BookSearchResult>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="index">
        <tr>
            <td class="left">
            <div style=" height:592px;  border-right:1px solid #E7E7E7; border-bottom:1px solid #E7E7E7; border-left:1px solid #E7E7E7;">
                <div class="topBar">
                    <center>
                        <h4 style="display: inline;">
                            Browse by category</h4>
                    </center>
                </div>
                <div class="content">
                <ul>
                    <li>
                        <%=Html.ActionLink("Programming", "BookSearch", "Search", new { CategoryID = 1 }, new { })%></li>
                    <li>
                        <%=Html.ActionLink("Novel", "BookSearch", "Search", new { CategoryID = 2 }, new { })%></li>
                    <li>
                        <%=Html.ActionLink("Magazine", "BookSearch", "Search", new { CategoryID = 3 }, new { })%></li>
                    <li>
                        <%=Html.ActionLink("Periodical", "BookSearch", "Search", new { CategoryID = 4 }, new { })%></li>
                </ul>
                </div>
                </div>
            </td>
            <td>
                <%Html.RenderPartial("RecommendedBooks", 10); %>
                <%Html.RenderPartial("PopularBooks", 10); %>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Content/homeindex.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        $(function () {
            var page = 1;
            var i = 5; //每版放4个图片
            //向后 按钮
            $("span.next").click(function () {    //绑定click事件
                var $parent = $(this).parents("div.v_show"); //根据当前点击元素获取到父元素
                var $v_show = $parent.find("div.v_content_list"); //寻找到“视频内容展示区域”
                var $v_content = $parent.find("div.v_content"); //寻找到“视频内容展示区域”外围的DIV元素
                var v_width = $v_content.width();
                var len = $v_show.find("li").length;
                var page_count = Math.ceil(len / i);   //只要不是整数，就往大的方向取最小的整数
                if (!$v_show.is(":animated")) {    //判断“视频内容展示区域”是否正在处于动画
                    if (page == page_count) {  //已经到最后一个版面了,如果再向后，必须跳转到第一个版面。
                        $v_show.animate({ left: '0px' }, "slow"); //通过改变left值，跳转到第一个版面
                        page = 1;
                    } else {
                        $v_show.animate({ left: '-=' + v_width }, "slow");  //通过改变left值，达到每次换一个版面
                        page++;
                    }
                }
                $parent.find("span").eq((page - 1)).addClass("current").siblings().removeClass("current");
            });
            //往前 按钮
            $("span.prev").click(function () {
                var $parent = $(this).parents("div.v_show"); //根据当前点击元素获取到父元素
                var $v_show = $parent.find("div.v_content_list"); //寻找到“视频内容展示区域”
                var $v_content = $parent.find("div.v_content"); //寻找到“视频内容展示区域”外围的DIV元素
                var v_width = $v_content.width();
                var len = $v_show.find("li").length;
                var page_count = Math.ceil(len / i);   //只要不是整数，就往大的方向取最小的整数
                if (!$v_show.is(":animated")) {    //判断“视频内容展示区域”是否正在处于动画
                    if (page == 1) {  //已经到第一个版面了,如果再向前，必须跳转到最后一个版面。
                        $v_show.animate({ left: '-=' + v_width * (page_count - 1) }, "slow");
                        page = page_count;
                    } else {
                        $v_show.animate({ left: '+=' + v_width }, "slow");
                        page--;
                    }
                }
                $parent.find("span").eq((page - 1)).addClass("current").siblings().removeClass("current");
            });
        });
    </script>
</asp:Content>
