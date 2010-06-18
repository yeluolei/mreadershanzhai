<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.Book>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	PopularBook
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>PopularBook</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">IsValid</div>
        <div class="display-field"><%: Model.IsValid %></div>
        
        <div class="display-label">averageRating</div>
        <div class="display-field"><%: String.Format("{0:F}", Model.averageRating) %></div>
        
        <div class="display-label">ISBN</div>
        <div class="display-field"><%: Model.ISBN %></div>
        
        <div class="display-label">Title</div>
        <div class="display-field"><%: Model.Title %></div>
        
        <div class="display-label">Price</div>
        <div class="display-field"><%: String.Format("{0:F}", Model.Price) %></div>
        
        <div class="display-label">PublishDate</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.PublishDate) %></div>
        
        <div class="display-label">Content</div>
        <div class="display-field"><%: Model.Content %></div>
        
        <div class="display-label">Author</div>
        <div class="display-field"><%: Model.Author %></div>
        
        <div class="display-label">TotalPages</div>
        <div class="display-field"><%: Model.TotalPages %></div>
        
        <div class="display-label">ID</div>
        <div class="display-field"><%: Model.ID %></div>
        
        <div class="display-label">Publisher</div>
        <div class="display-field"><%: Model.Publisher %></div>
        
        <div class="display-label">Guid</div>
        <div class="display-field"><%: Model.Guid %></div>
        
        <div class="display-label">Description</div>
        <div class="display-field"><%: Model.Description %></div>
        
        <div class="display-label">TimesFavored</div>
        <div class="display-field"><%: Model.TimesFavored %></div>
        
        <div class="display-label">TimesBought</div>
        <div class="display-field"><%: Model.TimesBought %></div>
        
        <div class="display-label">rate5</div>
        <div class="display-field"><%: Model.rate5 %></div>
        
        <div class="display-label">rate4</div>
        <div class="display-field"><%: Model.rate4 %></div>
        
        <div class="display-label">rate3</div>
        <div class="display-field"><%: Model.rate3 %></div>
        
        <div class="display-label">rate2</div>
        <div class="display-field"><%: Model.rate2 %></div>
        
        <div class="display-label">rate1</div>
        <div class="display-field"><%: Model.rate1 %></div>
        
        <div class="display-label">CategoryID</div>
        <div class="display-field"><%: Model.CategoryID %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("确认将该书设为推荐书目?", "SetPopularBook", new { id=Model.ID }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

