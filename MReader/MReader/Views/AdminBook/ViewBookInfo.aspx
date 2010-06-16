<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.Book>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ViewBook
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div>
    <h2>ViewBook</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">ISBN:</div>
        <div class="display-field"><%: Model.ISBN %></div>
        
        <div class="display-label">Title:</div>
        <div class="display-field"><%: Model.Title %></div>
        
        <div class="display-label">Price:</div>
        <div class="display-field"><%: String.Format("{0:F}", Model.Price) %></div>
        
        <div class="display-label">Publisher:</div>
        <div class="display-field"><%: Model.Publisher %></div>

        <div class="display-label">PublishDate:</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.PublishDate) %></div>
        
        <div class="display-label">Content:</div>
        <div class="display-field"><%: Model.Content %></div>
        
        <div class="display-label">Author:</div>
        <div class="display-field"><%: Model.Author %></div>
        
        <div class="display-label">TotalPages:</div>
        <div class="display-field"><%: Model.TotalPages %></div>
        
        <div class="display-label">ID:</div>
        <div class="display-field"><%: Model.ID %></div>
        
        <div class="display-label">IsValid:</div>
        <div class="display-field"><%: Model.IsValid %></div>

                
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

