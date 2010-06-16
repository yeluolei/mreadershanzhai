<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.BookInfoFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Buy
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Purchase :
    </h2>
    <h2>
        <%= Model.book.Title %></h2>
    <%=Html.ValidationSummary() %>
    <%Html.RenderPartial("BookForm", Model.book); %>
    <%=Html.Label("User name : ") %>
    <%=Html.Encode(Model.customer.UserName) %>
    <%=Html.Label("Current Balance : ") %>
    <%=Html.Encode(Model.customer.CurrentMoney.ToString("C")) %>
    <%=Html.ActionLink("Recharge my account", "Balance", "UserCenter", new { }, new { })%>
    <% using (Html.BeginForm())
       { %>
    <input type="submit" value="Buy" />
    <%} %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
