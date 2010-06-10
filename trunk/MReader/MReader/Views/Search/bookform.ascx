﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MReader.Models.Book>" %>

    <fieldset>
        <legend>  <% =Html.Encode ( Model.Title ) %> </legend>
        
        <p>
            Price :
            <% =Html.Encode ( String.Format("{0:F}", Model.Price )) %>
        </p>
        <p>
            Author :
            <% =Html.Encode ( Model.Author ) %>
        </p>
        <p>
            Publisher :
            <% =Html.Encode ( Model.Publisher ) %>
        </p>
        <p>
            TotalPages :
            <% =Html.Encode ( Model.TotalPages ) %>
        </p>
        <p>
            PublishDate :
            <% =Html.Encode ( String.Format("{0:g}", Model.PublishDate )) %>
        </p>
        <p>
            ISBN :
            <% =Html.Encode ( Model.ISBN ) %>
        </p>
        
        
    </fieldset>

