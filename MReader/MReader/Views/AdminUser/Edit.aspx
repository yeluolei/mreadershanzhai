<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.Customer>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.UserName) %>
            </div>
            <div class="editor-field">
                <%: Html.Label(Model.UserName) %>
                <%: Html.ValidationMessageFor(model => model.UserName) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.CurrentMoney) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.CurrentMoney, String.Format("{0:F}", Model.CurrentMoney)) %>
                <%: Html.ValidationMessageFor(model => model.CurrentMoney) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DateRegistered) %>
            </div>
            <div class="editor-field">
                <%: Html.Label( String.Format("{0:g}", Model.DateRegistered)) %>
                <%: Html.ValidationMessageFor(model => model.DateRegistered) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.SpentCost) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.SpentCost, String.Format("{0:F}", Model.SpentCost)) %>
                <%: Html.ValidationMessageFor(model => model.SpentCost) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.UserLevel) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.UserLevel) %>
                <%: Html.ValidationMessageFor(model => model.UserLevel) %>
            </div>
            
            <p>
                <input class="save" type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" language="javascript">
        $(function () {
            $(".save").button();
        }
        )
    </script>
</asp:Content>

