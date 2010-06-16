<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.Customer>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">UserName</div>
        <div class="display-field"><%: Model.UserName %></div>
        
        <div class="display-label">CurrentMoney</div>
        <div class="display-field"><%: String.Format("{0:F}", Model.CurrentMoney) %></div>
        
        <div class="display-label">DateRegistered</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.DateRegistered) %></div>
        
        <div class="display-label">SpentCost</div>
        <div class="display-field"><%: String.Format("{0:F}", Model.SpentCost) %></div>
        
        <div class="display-label">UserLevel</div>
        <div class="display-field"><%: Model.UserLevel %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Delete" /> |
		    <%: Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

