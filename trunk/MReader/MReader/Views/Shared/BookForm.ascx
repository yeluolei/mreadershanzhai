<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MReader.Models.Book>" %>
<table class="list">
    <tr>
    <td class="cover">
        <img alt="cover" src="<%=String.Format(Model.Content, "cover")%>" />
    </td>
    <td id="bookofinfo">
        <div>
            <%=Html.ActionLink(Model.Title , "index","BookInfo",new {bookid = Model.ID},new {})%>
            <br />
            Price :
            <% =Html.Encode ( String.Format("{0:C}", Model.Price )) %>
            <br />
            Author :
            <% =Html.Encode ( Model.Author ) %>
            <br />
            Publisher :
            <% =Html.Encode ( Model.Publisher ) %>
        </div>
        <div class="publisherdate">
            PublishDate :
            <% =Html.Encode ( String.Format("{0:g}", Model.PublishDate )) %>
            <br />
            ISBN :
            <% =Html.Encode ( Model.ISBN ) %>
            <br />
            <%=Html.Encode(Model.Description)%>
        </div>
        </td>
    </tr>
</table>
