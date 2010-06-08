<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.Book>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	NewBook
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>NewBook</h2>

    <% using (Html.BeginForm("NewBook","Admin",FormMethod.Post, new { enctype = "multipart/form-data", onsubmit = "return CheckForm()" } ))
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
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Author)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Author)%>
                <%: Html.ValidationMessageFor(model => model.Author)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Publisher)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Publisher)%>
                <%: Html.ValidationMessageFor(model => model.Publisher)%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.TotalPages)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.TotalPages)%>
                <%: Html.ValidationMessageFor(model => model.TotalPages)%>
            </div>
            <div class="editor-label">
                <%: Html.Label("regular expression") %>
            </div>
            <div class="editor-field">
                <input name="regularExpression" type="text" />
            </div>
            <div>
                <select nane="list" id="list" >
                    <option value="png">png</option>
                    <option value="jpeg">jpeg</option>
                </select>
            </div>          
            <input id = "upload" type="file" name="Upload" /><br />
            <%: Html.ValidationMessage("Upload") %>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Description) %>
                <%: Html.ValidationMessageFor(model => model.Description) %>
            </div>
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
    <script type="text/javascript" language ="javascript" >
        function CheckForm() {
            if (!document.getElementById("upload").value) {
                alert("please input the location of the file!");
                return false;
            }
        }
    </script>
</asp:Content>

