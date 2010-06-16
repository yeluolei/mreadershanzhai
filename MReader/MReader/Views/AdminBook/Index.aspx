<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MReader.Models.Book>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th></th>
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
                Content
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
                IsValid
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "EditBook", new { id=item.ID }) %> |
                <%: Html.ActionLink("Details", "ViewBookInfo", new { id=item.ID })%> |
                <%: Html.ActionLink("Delete", "DeleteBook", new { id=item.ID })%>
            </td>
            <td>
                <%: item.ISBN %>
            </td>
            <td>
                <%: item.Title %>
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
            <td>
                <%: item.Content %>
            </td>
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
                <%: item.IsValid %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "NewBook","AdminBook") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

