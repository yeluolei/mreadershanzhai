<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<int>" %>
<% MReader.Models.BookRepository bookdb = new MReader.Models.BookRepository(); %>
<% foreach (var book in bookdb.GetRecommendBooks(Model))
   {%>;
<% Html.RenderPartial("CompactBookForm", book); %>
<%   } %>