<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserCenter/UserCenter.Master"
    Inherits="System.Web.Mvc.ViewPage<MReader.Models.CustomerFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <h2>
        Favourite</h2>
    <table style="width: 100%">
        <tr>
            <th>
                <h5>Book</h5>
            </th>
            
            <th>
                <h5>Operation</h5>
            </th>
        </tr>
        <%
            MReader.Models.BookRepository bookRepo = new MReader.Models.BookRepository();
            foreach (var i in Model.Customer.FavouriteBooks)
            {%>
        <tr>
            <td>
            <%Html.RenderPartial("BookForm",bookRepo.GetBookbyID(i.BookID));%>
               <%-- <%=Html.ActionLink(bookRepo.GetBookbyID(i.BookID).Title, "index", "bookinfo", new { bookid = i.BookID }, new { })%><br />--%>
            </td>
            
            <td>
            <div class="delete">
            <%=Html.ActionLink("Delete","DeleteFavourite",new{bookid = i.BookID}) %>
            </div>
            </td>
        </tr>
        <%}%>
    </table>
    <script type="text/javascript">
        $(function () {
            $(".delete a").button();
        }
        )
    </script>
</asp:Content>
