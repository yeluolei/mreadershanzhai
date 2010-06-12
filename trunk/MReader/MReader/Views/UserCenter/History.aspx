<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserCenter/UserCenter.Master"
    Inherits="System.Web.Mvc.ViewPage<MReader.Models.CustomerFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        My Purchase History</h2>
    <table style="width: 100%">
        <tr>
            <td>
                <b>Price</b>
            </td>
            <td>
                <b>Purchase Time</b>
            </td>
            <td>
                <b>Book Title</b>
            </td>
        </tr>
        <%foreach (var hist in Model.Customer.PurchaseHistories)
          { %>
        <tr>
            <td>
                <%=hist.Price.ToString("C") %>
            </td>
            <td>
                <%=hist.PurchaseTime.ToString() %>
            </td>
            <td>
                <%=Html.ActionLink(hist.BookTitle, "index", "Bookinfo", new { bookid = hist.BookID }, new { })%>
            </td>
        </tr>
        <%} %>
    </table>
    <%--
     
    <%
        MReader.Models.BookRepository bookRepo = new MReader.Models.BookRepository();
        
        foreach (var i in Model.Customer.PurchaseHistories)
      {%>
    <%=Html.Label(Convert.ToDouble(i.Price).ToString())%>
    <%=Html.Label(i.PurchaseTime.ToString()) %>
    <%=Html.ActionLink(bookRepo.GetBookbyID(i.BookID).Title, "index", "Bookinfo", new { bookid = i.BookID }, new { })%><br />
    <%}%>--%>
</asp:Content>
