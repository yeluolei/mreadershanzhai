<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<  MReader.Models.Books >" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
title
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><% foreach (string keyword in Model.keyword) {%>
        <%: Html.Label(keyword)%>
    <%}%></h2>

    <% foreach ( var book in Model.books ) {
           Html.RenderPartial("bookform",book);} %>
       
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

