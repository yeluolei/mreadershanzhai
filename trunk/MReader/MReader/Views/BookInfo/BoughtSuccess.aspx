﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.Book>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	BoughtSuccess
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Bought Success</h2>
    <div> Congratulations <b><%=User.Identity.Name %></b> your successfully purchaseed a new book!</div>
    <%-- NOTE: actionlink must *not* omit the last |new {}|
    --%>
    <div>The new book is <b style="color: #0253a2"><%=Html.ActionLink(Model.Title, "ViewBook", "BookView", new { id = Model.ID, page = 0 }, new { })%></b>
    (<--click it's name to read)
    <%Html.RenderPartial("CompactBookForm", Model); %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
