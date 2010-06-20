<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.Book>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DeleteBook
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>DeleteBook</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        
        
      <div> ISBN: <%: Model.ISBN %></div>
        
        
        <div class="display-field"> Title:<%: Model.Title %></div>
        
        
        <div class="display-field">Price:<%: String.Format("{0:F}", Model.Price) %></div>
        
         
        <div class="display-field">Publisher:<%:Model.Publisher %></div>


        
        <div class="display-field"> PublishDate: <%: String.Format("{0:g}", Model.PublishDate) %></div>
        
        
         
        <div class="display-field">Author:<%: Model.Author %></div>
         
        <div class="display-field">TotalPages:<%: Model.TotalPages %></div>
        
        
        <div class="display-field"> ID :<%: Model.ID %></div>
        
         
        <div class="display-field">Decription:<%:Model.Description %></div>
        
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

