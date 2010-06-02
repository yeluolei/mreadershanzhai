<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.Book>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ViewBook
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div>
    <h2>ViewBook</h2>

    <fieldset>
        <legend>Fields</legend>
        
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
        
        <div class="display-label">IsValid</div>
        <div class="display-field"><%: Model.IsValid %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit", new { id=Model.ID }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
    </div>
    <div>
     <ul class="AdminButton">
            <li><a href="ViewBook">查看图书详情</a></li>
			<li><a href="NewBook">添加新书</a></li>
            <li><a href="DeleteBook">删除图书</a></li>
            <li><a href="ModifyBook">修改图书信息</a></li>
       </ul>
     </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

