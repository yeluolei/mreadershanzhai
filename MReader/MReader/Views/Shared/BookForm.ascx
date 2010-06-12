<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MReader.Models.Book>" %>

    <fieldset>
        <legend>  <% =Html.ActionLink(Model.Title , "index","BookInfo",new {bookid = Model.ID},new {}) %> </legend>
        <div id="bookinfo">
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
        <div>
            萝莉记得右边要加图片!!
        </div>
        
        </div>

        <div id="bookcover" >
        
        <img height = "80" width = "50" src="<%=String.Format(Model.Content,"cover") %>" alt = "<%=Model.Title%>"/>
        </div>
        
        
    </fieldset>

