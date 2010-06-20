<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated)
    {
%>
Welcome <b>
    <%:Html.ActionLink(Page.User.Identity.Name, "index","usercenter")%></b> !
<%: Html.ActionLink( "Sign out", "LogOff", "Account") %>
<%
    }
    else
    {
%>
<%: Html.ActionLink("Sign in", "LogOn", "Account") %>
|
<%: Html.ActionLink("Register", "Register", "Account") %>
<%
    }
%>
