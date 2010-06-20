<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserCenter/UserCenter.Master"
    Inherits="System.Web.Mvc.ViewPage<MReader.Models.CustomerFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <h2>
        My Purchase History</h2>
    <table style="width: 100%">
        <tr>
            <th>
                <b>Price</b>
            </th>
            <th>
                <b>Purchase Time</b>
            </th>
            <th>
                <b>Book Title</b>
            </th>
        </tr>

         <%
            MReader.Models.BookRepository bookRepo = new MReader.Models.BookRepository();
        foreach (var hist in Model.Customer.PurchaseHistories)
          { %>
        <tr>
            <td>
            <%=hist.Price.ToString("C") %>
            </td>
            <td>
                <%=hist.PurchaseTime.ToString() %>
            </td>
            <td>
                <%Html.RenderPartial("BookForm",bookRepo.GetBookbyID(hist.BookID));%>
              <%--  <%=Html.ActionLink(hist.BookTitle, "index", "Bookinfo", new { bookid = hist.BookID }, new { })%>--%>
            </td>
        </tr>
        <%} %>
    </table>
</asp:Content>
