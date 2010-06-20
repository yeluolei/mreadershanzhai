<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.Customer>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>

    <fieldset>
        
        <div class="display-label">UserName:<%: Model.UserName %></div>
        
        <div class="display-label">CurrentMoney:<%: String.Format("{0:F}", Model.CurrentMoney) %></div>
        
        <div class="display-label">DateRegistered:<%: String.Format("{0:g}", Model.DateRegistered) %></div>
        
        <div class="display-label">SpentCost:<%: String.Format("{0:F}", Model.SpentCost) %></div>
        
        <div class="display-label">UserLevel:<%: Model.UserLevel %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit", new { username=Model.UserName }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

