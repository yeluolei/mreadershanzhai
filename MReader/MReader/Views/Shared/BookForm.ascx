<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MReader.Models.Book>" %>
<link href="/Content/BookForm.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(document).ready(function () {
        $("#list").hover(function () {
            $(this).css({ 'border': '10px', 'border-color': '#9BBCE1' })
            $(".cover").css({ 'width': '170px', 'height': '170px' })
            $(".cover img").css({ 'height': '170px' })
            $(".price").css({ 'display': 'inherit' })
            $(".publisherdate").css({ 'display': 'inherit' })
            $(".description").css({ 'display': 'inherit' })
        }
       )
    }
)
</script>
<div id="list">
    <div class="cover">
        <img alt="cover" src="<%=String.Format(Model.Content, "cover")%>" />
    </div>
    <div id="bookofinfo">
        <%=Html.ActionLink(Model.Title , "index","BookInfo",new {bookid = Model.ID},new {})%>
        <div class="price">
            Price :
            <% =Html.Encode ( String.Format("{0:C}", Model.Price )) %>
        </div>
        <div>
            Author :
            <% =Html.Encode ( Model.Author ) %>
        </div>
        <div class="publisher">
            Publisher :
            <% =Html.Encode ( Model.Publisher ) %>
        </div>
        <div class="publisherdate">
            PublishDate :
            <% =Html.Encode ( String.Format("{0:g}", Model.PublishDate )) %>
        </div>
        <div class="isbn">
            ISBN :
            <% =Html.Encode ( Model.ISBN ) %>
        </div>
        <div class="description">
            <%=Html.Encode(Model.Description)%>
        </div>
    </div>
</div>
