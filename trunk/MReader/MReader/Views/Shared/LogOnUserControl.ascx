<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        Welcome <b><%: Page.User.Identity.Name %></b> !
                 <%: Html.ActionLink( "Sign out", "LogOff", "Account") %> 
<%
    }
    else {
%> 
         <%: Html.ActionLink("Sign in", "LogOn", "Account") %> 
         |
         <%: Html.ActionLink("Register", "Register", "Account") %> 

<%
    }
%>
