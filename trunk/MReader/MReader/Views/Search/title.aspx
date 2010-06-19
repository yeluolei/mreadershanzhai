<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<  MReader.Models.BookSearchResult >" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Search Result
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
         Result for:<% foreach (string keyword in Model.keyword)
           {%>
        <%: Html.Label(keyword)%>
        <%}%></h2>
    <div class="searchresult">
            <ul>
                <% foreach (var book in Model.books)
                   {%>
                <li style=" min-width : 100%">
                    <%Html.RenderPartial("bookform", book);%>
                </li>
                <% } %>
            </ul>
    </div>



    <% if (Model.books.HasPreviousPage)
       { %>
    <%=Html.ActionLink("Previous Page", "title", new { book_title = Model.keyword[0], pageindex = Model.books.PageIndex - 1 })%>
    <%}%>

    <% for (int i = 0; i < Model.books.TotalPages; i++)
       {%>
    <% if (i != Model.books.PageIndex)%>
    <%=i.ToString()%>
    <% if (i == Model.books.PageIndex) %>
    <%=Html.ActionLink(i.ToString(),"title",new{book_title = Model.keyword[0],pageindex = i}) %>
    <label>
    </label>
    <%} %>
    <% if (Model.books.HasNextPage)
       { %>
    <%=Html.ActionLink("Next Page", "title", new { book_title = Model.keyword[0], pageindex = Model.books.PageIndex + 1 })%>
    <%} %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="/Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/Content/SearchTitle.css" />
    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            $(".list").parent().mouseenter(function () {
                $(this).animate({'background-color': '#969EE9'},1000);
            }).mouseout(function () {
                $(this).animate({ 'background-color': '#969EE9' }, 1000);
            }
       )
        }
)
    </script>
</asp:Content>
