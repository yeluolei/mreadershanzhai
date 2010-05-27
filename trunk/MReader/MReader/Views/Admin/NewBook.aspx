﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.Book>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	NewBook
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>NewBook</h2>

    <% using (Html.BeginForm("NewBook","Admin",FormMethod.Post, new { enctype = "multipart/form-data" } ))
       {%>
        <%: Html.ValidationSummary(true)%>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.ISBN)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.ISBN)%>
                <%: Html.ValidationMessageFor(model => model.ISBN)%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Title)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Title)%>
                <%: Html.ValidationMessageFor(model => model.Title)%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Price)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Price)%>
                <%: Html.ValidationMessageFor(model => model.Price)%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.PublishDate)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.PublishDate)%>
                <%: Html.ValidationMessageFor(model => model.PublishDate)%>
            </div>
            
<%--            <div class="editor-label">
                <%: Html.LabelFor(model => model.Content) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Content) %>
                <%: Html.ValidationMessageFor(model => model.Content) %>
            </div>--%>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Author)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Author)%>
                <%: Html.ValidationMessageFor(model => model.Author)%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.TotalPages)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.TotalPages)%>
                <%: Html.ValidationMessageFor(model => model.TotalPages)%>
            </div>
            
<%--            <div class="editor-label">
                <%: Html.LabelFor(model => model.ID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.ID) %>
                <%: Html.ValidationMessageFor(model => model.ID) %>
            </div>--%>
            <input type="file" name="Upload" /><br />
            <%: Html.ValidationMessage("Upload") %>
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <form action="/" method="post" enctype="multipart/form-data">

    </form>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

