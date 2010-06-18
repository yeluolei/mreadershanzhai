﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MReader.Models.Book>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	PopularBookList
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>PopularBookList</h2>

    <table>
        <tr>
            <th></th>
            <th>
                IsValid
            </th>
            <th>
                averageRating
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
                Publisher
            </th>
            <th>
                Guid
            </th>
            <th>
                Description
            </th>
            <th>
                TimesFavored
            </th>
            <th>
                TimesBought
            </th>
            <th>
                rate5
            </th>
            <th>
                rate4
            </th>
            <th>
                rate3
            </th>
            <th>
                rate2
            </th>
            <th>
                rate1
            </th>
            <th>
                CategoryID
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.ID }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.ID })%> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.ID })%>
            </td>
            <td>
                <%: item.IsValid %>
            </td>
            <td>
                <%: String.Format("{0:F}", item.averageRating) %>
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
                <%: item.Publisher %>
            </td>
            <td>
                <%: item.Guid %>
            </td>
            <td>
                <%: item.Description %>
            </td>
            <td>
                <%: item.TimesFavored %>
            </td>
            <td>
                <%: item.TimesBought %>
            </td>
            <td>
                <%: item.rate5 %>
            </td>
            <td>
                <%: item.rate4 %>
            </td>
            <td>
                <%: item.rate3 %>
            </td>
            <td>
                <%: item.rate2 %>
            </td>
            <td>
                <%: item.rate1 %>
            </td>
            <td>
                <%: item.CategoryID %>
            </td>
        </tr>
    
    <% } %>

    </table>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

