<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.BookInfoFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%= Model.book.Title %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Content/BookInfo.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%= Model.book.Title %></h2>
    <div class="book">
        <div class="bookcover">
            <img class="cover" alt="cover" src="<%=(Model.bookcover)%>" />
        </div>
        <div class="bookInfo">
            <div>
                Author : <%: Model.book.Author %></div>
            <div>
                ISBN:<%:Model.book.ISBN %></div>
            <div>
                Publisher : <%:Model.book.Publisher %></div>
            <div>
                Publisher date : <%:Model.book.PublishDate.ToShortDateString()%></div>
            <div>
                Price : <%: Model.book.Price.ToString("C") %></div>
            <div>
                <%if (Model.HasBought(Context.User.Identity.Name.ToString()))
                  {%>
                <%: Html.ActionLink("Read", "ViewBook", "BookView", new { id = Model.book.ID })%>
                <% }%>
                <%else
                    { %>
                <%:Html.ActionLink("Buy", "Buy", new { bookid = Model.book.ID })%>
                <%}%></div>
            <div>
                <%:Model.book.Description%></div>
        </div>
    </div>
    <div>
        <div class="remark">
            <%foreach (var remark in Model.paginatedRemarks)
          { %>
            <li>
                <div class="bar">
                    <div class="user">
                        <span>
                            <%:Html.Encode(remark.RemarkUserName)%>
                        </span>
                    </div>
                    <div class="time">
                        <span>
                            <%:Html.Encode(remark.RemarkTime.ToString())%></span>
                    </div>
                </div>
                <p>
                    <%:Html.Encode(remark.RemarkContent.ToString())%></p>
            </li>
            <%} %>
            <% using (Html.BeginForm("Index", "BookInfo"))
           {%>
            <%:Html.Hidden("id", Model.book.ID)%>
            <%:Html.Hidden("PageIndex",Model.pageIndex) %>
            <%:Html.Editor("RemarkContent") %>
            <input class="comment" type="submit" value="Comment" />
            <%} %>
        </div>
        <div class="buyers">
            <%foreach (var buyer in Model.LatestBuyers)
          { %>
            <li>
                <%:Html.Encode(buyer.BuyUserName) %>
                Bought@
                <%:Html.Encode(buyer.BuyTime.ToString()) %>
            </li>
            <%} %>
        </div>
    </div>
</asp:Content>
