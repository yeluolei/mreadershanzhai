<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="errorTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Error
</asp:Content>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Sorry, an error occurred while processing your request.
        
    </h2>
    <p>The error message is <b>"<%=Model.Exception.Message %>"</b></p>
        <p>The ActionName is <b>"<%=Model.ActionName %>"</b></p>
        <p>The Controller name is <b> "<%=Model.ControllerName %>"</b></p>
         
</asp:Content>
