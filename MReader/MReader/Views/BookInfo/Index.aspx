<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.BookInfoFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%= Model.book.Title %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%= Model.book.Title %></h2>
    <div class="BookInfomation">
        <img alt="cover" height="250px" width="180px" src="<%=(Model.bookcover)%>" />
    </div>
    <div>
        Author：</div>
    <div>
        <%: Model.book.Author.ToString() %></div>
    <div>
        Price：</div>
    <div>
        <%: Model.book.Price.ToString() %></div>
    <div>
        <%: Html.ActionLink("Read", "ViewBook", "BookView")%></div>
    <%foreach (var remark in Model.paginatedRemarks)
      { %>
    <li>
        <%:Html.Encode(remark.RemarkUserName)%>
        remark@
        <%:Html.Encode(remark.RemarkTime.ToString())%>
        :
        <%:Html.Encode(remark.RemarkContent.ToString())%>
    </li>
    <%} %>
    <% using (Html.BeginForm("Index", "BookInfo"))
       {%>
    <%:Html.Hidden("id", Model.book.ID)%>
    <%:Html.Hidden("PageIndex",Model.pageIndex) %>
    <%:Html.TextBox("RemarkContent") %>
    <input type="submit" value="Comment" />
    <%} %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
