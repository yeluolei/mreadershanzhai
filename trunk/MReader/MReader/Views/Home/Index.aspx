<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <p>
    <div style = "display :block">
        <img alt="cover" height="125" width="90px" src="/book/asp.net/asp.net-cover.png" />
        &nbsp;
        <img alt="cover" height="125" width="90px" src="/book/Essential_C++/Essential_C++-cover.png" />
    </div>

        <%=Html.ActionLink("ASP.NET MVC","BookView",new {id=1,page=1} ) %>
        &nbsp;&nbsp;&nbsp;
        <%=Html.ActionLink("Essential C++","BookView",new {id=2,page=1} ) %>

    </p>

</asp:Content>
