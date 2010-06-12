<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MReader.Models.BookSearchResult>" %>
<% foreach (var book in Model.books)
   {%>
<% Html.RenderPartial("CompactBookForm", book); %>
<%   } %>