<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.Book>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DeleteBook
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>DeleteBook</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        
        <div class="display-label">ISBN</div>
        <div class="display-field"><%: Model.ISBN %></div>
        
        <div class="display-label">Title</div>
        <div class="display-field"><%: Model.Title %></div>
        
        <div class="display-label">Price</div>
        <div class="display-field"><%: String.Format("{0:F}", Model.Price) %></div>
        
        <div class="display-label">Publisher</div>
        <div class="display-field"><%:Model.Publisher %></div>


        <div class="display-label">PublishDate</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.PublishDate) %></div>
        
        
        <div class="display-label">Author</div>
        <div class="display-field"><%: Model.Author %></div>
        
        <div class="display-label">TotalPages</div>
        <div class="display-field"><%: Model.TotalPages %></div>
        
        <div class="display-label">ID</div>
        <div class="display-field"><%: Model.ID %></div>
        
        <div class="display-label">Decription</div>
        <div class="display-field"><%:Model.Description %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input class="delete" type="submit" value="Delete" /> |
		    <%: Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" language ="javascript" >
        $(function () {
            $(".delete").button();
        }
        )
    </script>
</asp:Content>

