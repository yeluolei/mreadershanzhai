<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.Book>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AdvancedSearch
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Advanced Search</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.ISBN) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.ISBN) %>
                <%: Html.ValidationMessageFor(model => model.ISBN) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Title) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Title) %>
                <%: Html.ValidationMessageFor(model => model.Title) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Author) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Author) %>
                <%: Html.ValidationMessageFor(model => model.Author) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Publisher) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Publisher) %>
                <%: Html.ValidationMessageFor(model => model.Publisher) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model=>model.CatagoryLib.CatagoryName) %>
            </div>

            <div class="editor-field">
                <%: Html.DropDownList("CategoryID",Model.Categories)%>
                <%: Html.ValidationMessageFor(model => model.Description) %>
            </div>
            
            <p>
                <input type="submit" value="Search" />
            </p>
        </fieldset>

    <% } %>



</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

