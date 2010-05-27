<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserCenter/UserCenter.Master"
    Inherits="System.Web.Mvc.ViewPage<MReader.Models.CustomerFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        History</h2>
    <label>
        price purchasetime bookname
    </label><br />
    <%
        MReader.Models.BookRepository bookRepo = new MReader.Models.BookRepository();
        
        foreach (var i in Model.Customer.PurchaseHistories)
      {%>
    <%=Html.Label(Convert.ToDouble(i.Price).ToString())%>
    <%=Html.Label(i.PurchaseTime.ToString()) %>
    <%=Html.ActionLink(bookRepo.GetBookbyID(i.BookID).Title,"View","BookView") %><br />
    <%}%>
</asp:Content>
