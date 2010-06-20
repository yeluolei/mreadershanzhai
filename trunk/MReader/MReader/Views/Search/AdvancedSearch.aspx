<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.Book>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    AdvancedSearch
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Advanced Search</h2>
    <% using (Html.BeginForm())
       {%>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <table class="ta">
            <tr>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.ISBN) %>
                    </div>
                </td>
                <td>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.ISBN) %>
                        <%: Html.ValidationMessageFor(model => model.ISBN) %>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Title) %>
                    </div>
                </td>
                <td>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Title) %>
                        <%: Html.ValidationMessageFor(model => model.Title) %>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Author) %>
                    </div>
                </td>
                <td>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Author) %>
                        <%: Html.ValidationMessageFor(model => model.Author) %>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Publisher) %>
                    </div>
                </td>
                <td>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Publisher) %>
                        <%: Html.ValidationMessageFor(model => model.Publisher) %>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="editor-label">
                        <%: Html.LabelFor(model=>model.CatagoryLib.CatagoryName) %>
                    </div>
                </td>
                <td>
                    <div class="editor-field">
                        <%: Html.DropDownList("CategoryID",Model.Categories)%>
                        <%: Html.ValidationMessageFor(model => model.Description) %>
                    </div>
                </td>
            </tr>
        </table>
        <input class="searchbutton" type="submit" value="Search" />
    </fieldset>
    <% } %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".searchbutton").button();
            $(".ta tr td:first").css('width', '90px');
        }
)
    </script>
    <style type="text/css">
        .ta
        {
            border:0px;
            width: 40%;
        }
        .ta td
        {
            border:0px;
            }
    </style>
</asp:Content>
