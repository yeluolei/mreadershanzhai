<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserCenter/UserCenter.Master"
    Inherits="System.Web.Mvc.ViewPage<MReader.Models.CustomerFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <h2>
        My Purchase History</h2>
    <table style="width: 100%">
        <tr>
            <th>
                <h5>Book</h5>
            </th>
            <th>
                <h5>Price</h5>
            </th>
            <th>
                <h5>Purchase Time</h5>
            </th>
        </tr>

         <%
            MReader.Models.BookRepository bookRepo = new MReader.Models.BookRepository();
        foreach (var hist in Model.Customer.PurchaseHistories)
          { %>
        <tr>
           <td>
                <%Html.RenderPartial("BookForm",bookRepo.GetBookbyID(hist.BookID));%>
            </td>
            <td>
            <%=hist.Price.ToString("C") %>
            </td>
            <td>
                <%=hist.PurchaseTime.ToString() %>
            </td>
            
        </tr>
        <%} %>
    </table>
</asp:Content>

