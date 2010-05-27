<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserCenter/UserCenter.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.CustomerFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Favourite</h2>
    <label>
          bookname
    </label><br />
    <%
        MReader.Models.BookRepository bookRepo = new MReader.Models.BookRepository();
        
        foreach (var i in Model.Customer.PurchaseHistories)
      {%>
    <%=Html.ActionLink(bookRepo.GetBookbyID(i.BookID).Title,"View","BookView") %><br />
    <%}%>
</asp:Content>
