<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<int>" %>
<% MReader.Models.BookRepository bookdb = new MReader.Models.BookRepository(); %>
<table>
    <tr>
        <th>
            Books Recommended
        </th>
    </tr>
    <tr>
        <% foreach (var book in bookdb.PopularBooks(10))
           {%>;
        <td>
            <% Html.RenderPartial("CompactBookForm", book); %>
        </td>
        <%   } %>
    </tr>
</table>
