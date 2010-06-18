<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.BookSearchResult>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%--<div style = "display :block">
        <img alt="cover" height="125" width="90px" src="/book/asp.net/asp.net-cover.png" />
        &nbsp;
        <img alt="cover" height="125" width="90px" src="/book/Essential_C++/Essential_C++-cover.png" />
    </div>--%>
        <div> <%Html.RenderPartial("RecommendedBooks",10); %></div>
        <%--this function must contain 4 parameter to invoke the right method,so the last |new {}| can't be omitted!!--%>
        <%--<%=Html.ActionLink("ASP.NET MVC", "ViewBook", "BookView", new { id = 5, page = 1 }, new { })%>
        &nbsp;&nbsp;&nbsp;
        <%=Html.ActionLink("Essential C++", "ViewBook", "BookView", new { id = 2, page = 1 }, new { })%>--%>
        <div><%Html.RenderPartial("PopularBooks",10); %></div>

</asp:Content>
