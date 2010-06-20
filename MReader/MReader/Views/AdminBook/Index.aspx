<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MReader.Models.Book>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Index</h2>
    <table class="top">
        <tr >
            <td>
                <%: Html.ActionLink("Upload a Book", "NewBook","AdminBook") %>
            </td>
            <td>
                <%: Html.ActionLink("Popular Book List", "PopularBookList","AdminBook") %>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <th>
            </th>
            <th>
                ISBN
            </th>
            <th>
                Title
            </th>
            <th>
                Price
            </th>
            <th>
                Publisher
            </th>
            <th>
                PublishDate
            </th>
            <th>
                Author
            </th>
            <th>
                TotalPages
            </th>
            <th>
                ID
            </th>
            <th>
                Times Bought
            </th>
            <th>
                Times Favored
            </th>
            <th>
                Operations
            </th>
        </tr>
        <% MReader.Models.BookRepository bookdb = new MReader.Models.BookRepository(); %>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "EditBook", new { id=item.ID }) %>
                |
                <%: Html.ActionLink("Details", "ViewBookInfo", new { id=item.ID })%>
                |
                <%: Html.ActionLink("Delete", "DeleteBook", new { id=item.ID })%>
            </td>
            <td>
                <%: item.ISBN %>
            </td>
            <td>
                <%=Html.ActionLink(item.Title,"index","bookinfo",new {bookid = item.ID},new{}) %>
                <%--<%: item.Title %>--%>
            </td>
            <td>
                <%: String.Format("{0:F}", item.Price) %>
            </td>
            <td>
                <%:item.Publisher %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.PublishDate) %>
            </td>
            <%--<td>
                <%: item.Content %>
            </td>--%>
            <td>
                <%: item.Author %>
            </td>
            <td>
                <%: item.TotalPages %>
            </td>
            <td>
                <%: item.ID %>
            </td>
            <td>
                <%:item.TimesBought %>
            </td>
            <td>
                <%:item.TimesFavored %>
            </td>
            <%--<td>
                <%: item.IsValid %>
            </td>--%>
            <td>
                <% if (!bookdb.IsPopular(item))
                   { %>
                <%:  Html.ActionLink("Set Popular", "SetPopularBook", new { id = item.ID })%>
                <% }
                   else
                   { %>
                <b>
                    <%:  Html.ActionLink("Unset Popular", "UnsetPopularBook", new { id = item.ID })%></b>
                <%} %>
            </td>
        </tr>
        <% } %>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    $(function () {
        $(".top a").button();
    }
)
</script>
<style type="text/css">
.top
{
    border:0px;
    }
 .top td
 {
     border:0px;
     }
</style>
</asp:Content>
