<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.Book>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ViewBook
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div>
    <h2>ViewBook</h2>

    <fieldset>
        
        <div class="display-label">ISBN:<%: Model.ISBN %></div>
        
        <div class="display-label">Title:<%: Model.Title %></div>
        
        <div class="display-label">Price:<%: String.Format("{0:F}", Model.Price) %></div>
        
        <div class="display-label">Publisher:<%: Model.Publisher %></div>

        <div class="display-label">PublishDate:<%: String.Format("{0:g}", Model.PublishDate) %></div>
        
        <div class="display-label">Content:<%: Model.Content %></div>
        
        <div class="display-label">Author:<%: Model.Author %></div>
        
        <div class="display-label">TotalPages:<%: Model.TotalPages %></div>
        
        <div class="display-label">ID:<%: Model.ID %></div>
        
        <div class="display-label">IsValid:<%: Model.IsValid %></div>

        <div class="display-label">Category:<%: Model.CatagoryLib.CatagoryName %></div>
                
        <div class="display-label">Description:</div>
        <div class="display-field"><%: Model.Description %></div>
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "EditBook", new { id=Model.ID }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

