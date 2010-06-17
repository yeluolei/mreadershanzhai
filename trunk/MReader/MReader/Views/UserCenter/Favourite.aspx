﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserCenter/UserCenter.Master"
    Inherits="System.Web.Mvc.ViewPage<MReader.Models.CustomerFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Favourite</h2>
    <table>
        <tr>
            <td>
                <b>Book Name</b>
            </td>
            
            <td>
                <b>Operation</b>
            </td>
        </tr>
        <%
            MReader.Models.BookRepository bookRepo = new MReader.Models.BookRepository();
            foreach (var i in Model.Customer.FavouriteBooks)
            {%>
        <tr>
            <td>
                <%=Html.ActionLink(bookRepo.GetBookbyID(i.BookID).Title, "index", "bookinfo", new { bookid = i.BookID }, new { })%><br />
            </td>
            
            <td>
            <%=Html.ActionLink("Delete","DeleteFavourite",new{bookid = i.BookID}) %>
            </td>
        </tr>
        <%}%>
    </table>
</asp:Content>
