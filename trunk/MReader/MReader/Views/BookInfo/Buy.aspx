﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.BookInfoFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Buy
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Purchase :
    </h2>
    <h2>
        <%= Model.book.Title %></h2>
        <%=Html.ValidationSummary() %>
    <%Html.RenderPartial("BookForm", Model.book);%>
    <%--<div class="book">
        <div class="bookcover">
            <img class="cover" alt="cover" src="<%=(Model.bookcover)%>" />
        </div>
        <div class="bookInfo">
            <div>
                Author :
                <%: Model.book.Author %></div>
            <div>
                ISBN:<%:Model.book.ISBN %></div>
            <div>
                Publisher :
                <%:Model.book.Publisher %></div>
            <div>
                Publisher date :
                <%:Model.book.PublishDate.ToShortDateString()%></div>
            <div>
                Price :
                <%: Model.book.Price.ToString("C") %></div>--%>
            <%=Html.Label("User name : ") %>
            <%=Html.Encode(Model.customer.UserName) %>
            <%=Html.Label("Current Balance : ") %>
            <%=Html.Encode(Model.customer.CurrentMoney.ToString("C")) %>
            <li><%=Html.ActionLink("Recharge my account", "Balance", "UserCenter", new { }, new { })%></li>
             
            <% using(Html.BeginForm()) { %>
            <input type="submit" value="Buy" /> 
            <%} %>
    <%--    </div>
    </div>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>