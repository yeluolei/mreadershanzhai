<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MReader.Models.Customer>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table style="width:100%;">
        <tr>
            <th></th>
            <th>
                UserName
            </th>
            <th>
                CurrentMoney
            </th>
            <th>
                DateRegistered
            </th>
            <th>
                SpentCost
            </th>
            <th>
                UserLevel
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { username=item.UserName }) %> |
                <%: Html.ActionLink("Details", "Details", new { username=item.UserName })%> |
               <%-- <%: Html.ActionLink("Delete", "Delete", new { username=item.UserName })%>--%>
            </td>
            <td>
                <%: item.UserName %>
            </td>
            <td>
                <%: String.Format("{0:F}", item.CurrentMoney) %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.DateRegistered) %>
            </td>
            <td>
                <%: String.Format("{0:F}", item.SpentCost) %>
            </td>
            <td>
                <%: item.UserLevel %>
            </td>
        </tr>
    
    <% } %>

    </table>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

