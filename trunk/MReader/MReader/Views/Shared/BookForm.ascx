<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MReader.Models.Book>" %>

<div class="cover">
<img alt="cover" src="<%=String.Format(Model.Content, "cover")%>"/>
</div>

<div id="bookofinfo">
    <%=Html.ActionLink(Model.Title , "index","BookInfo",new {bookid = Model.ID},new {})%>
    <div>
        Price :
        <% =Html.Encode ( String.Format("{0:C}", Model.Price )) %>
    </div>
    <div>
        Author :
        <% =Html.Encode ( Model.Author ) %>
    </div>
    <div>
        Publisher :
        <% =Html.Encode ( Model.Publisher ) %>
    </div>
    <div>
        TotalPages :
        <% =Html.Encode ( Model.TotalPages ) %>
    </div>
    <div>
        PublishDate :
        <% =Html.Encode ( String.Format("{0:g}", Model.PublishDate )) %>
    </div>
    <div>
        ISBN :
        <% =Html.Encode ( Model.ISBN ) %>
    </div>
</div>