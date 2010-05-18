﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage< MReader.Models.BookPageFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    bookview
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%using (Html.BeginForm())
      {%>
    <div id="pager">
        <div id="header">
        </div>
        <div id="titlebar"><h2 id="title"><%=Model.book.Title %></h2></div>
        <div id="content">
            <%=Html.Hidden("ID",Model.book.ID) %> 
            <table id="viewport">
                <tr>
                    <td id="sideviewport">
                        <div id="sidebar">  
                                <div id="sidebarcover">
                                    <img alt="cover" height="125" width="90px" src="<%=(Model.book.Content + "cover.png") %>" />
                                </div>
                                <div id="sidebarnav">
                                    <ul>
                                       <li>我要评论</li>
                                       <li>查看评论</li>
                                    </ul>
                                </div>
                                <div id="bookprofile"></div>
                        </div>
                    </td>
                    <td>
                        <div id="toolbar">
                            <table>
                                <tr>
                                    <td>
                                        <div id = "previousbutton">
<%--                                        <%if (Model.HasPrevoiusPage) { %>     --%>              
                                           <a href="#" onclick="previous()"><img src="/images/arrow_left_green_48.png" /></a>
<%--                                        <%} %>--%>
                                        </div>
                                    </td>
                                    <td>                                       
                                        <%=Html.TextBox("pageIndex",Model.pageIndex) %>
                                        <%=Html.Label("//"+Model.book.TotalPages.ToString() + " Pages")%>
                                        <input type="Submit" value="Go" />
                                    </td>
                                    <td>
                                        <div id="nextbutton">
<%--                                        <%if (Model.HasNextPage) { %>  --%>                                      
                                            <a href="#" onclick="next()" ><img src="/images/arrow_right_green_48.png" /></a>                     
<%--                                        <%} %>--%>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="bookcontent">
                            <img id="book" height="1035px" width="800px" alt="loading" src="<%=Model.pageURL%>" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <%}%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID= "HeadContent" runat="server">
        <script language="javascript" type="text/javascript">
            var pageNumGlobal;
            var bookNameGlobal;
            var totalPagesGlobal;
            function preload(imgURL) {
                var i = new Image();
                i.src = imgURL;
            }
            function Buttonvisible() {
                if (pageNumGlobal + 1 <= totalPagesGlobal) {
                    document.getElementById("nextbutton").style.display = "inline";
                }
                else {
                    document.getElementById("nextbutton").style.display = "none";
                }

                if (pageNumGlobal - 1 > 0) {
                    document.getElementById("previousbutton").style.display = "inline";
                }
                else {
                    document.getElementById("previousbutton").style.display = "none";
                }
            }
            function next() {
                pageNumGlobal = eval(pageNumGlobal) + 1;
                if (pageNumGlobal <= totalPagesGlobal) {
                    var img = document.getElementById("book").src = "/book/" + bookNameGlobal + "/" + bookNameGlobal + "-" + pageNumGlobal + ".png";
                    document.getElementById("pageIndex").value = pageNumGlobal;
                }
                Buttonvisible();
                preload();
            }
            function previous() {
                pageNumGlobal = eval(pageNumGlobal) - 1;
                if ( pageNumGlobal > 0) {
                    var img = document.getElementById("book").src = "/book/" + bookNameGlobal + "/" + bookNameGlobal + "-" + pageNumGlobal + ".png";
                    document.getElementById("pageIndex").value = pageNumGlobal;
                }
                Buttonvisible();
            }

            function preload() {
                var temp = eval(pageNumGlobal) + 1;
                if (temp <= totalPagesGlobal) {
                    var img = "/book/" + bookNameGlobal + "/" + bookNameGlobal + "-" + temp + ".png";
                    var i = new Image();
                    i.src = img;
                }
            }

            $(document).ready(function(){
                    pageNumGlobal = <%=Model.pageIndex%>;
                    bookNameGlobal = "<%= Model.book.Title %>";
                    totalPagesGlobal = <%=Model.book.TotalPages %>;
                    Buttonvisible();
                    });
   </script>
</asp:Content>
