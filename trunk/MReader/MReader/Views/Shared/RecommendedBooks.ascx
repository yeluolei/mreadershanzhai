<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<int>" %>
<div class="v_show">
    <div class="v_caption">
        <h2 class="cartoon" title="Recommended">
            Recommend</h2>
        <div class="highlight_tip">
            <span class="current">1</span><span>2</span><span>3</span><span>4</span>
        </div>
        <div class="change_btn">
            <span class="prev">上一页</span> <span class="next">下一页</span>
        </div>
    </div>
    <div class="v_content">
        <div class="v_content_list">
            <ul>
                <% MReader.Models.BookRepository bookdb = new MReader.Models.BookRepository(); %>
                <%foreach (var i in bookdb.GetRecommendBooks(Model))
                  { %>
                <li>
                    <%Html.RenderPartial("CompactBookForm", i); %></li>
                <li>
                    <%Html.RenderPartial("CompactBookForm", i); %></li>
                <li>
                    <%Html.RenderPartial("CompactBookForm", i); %></li>
                <%} %>
            </ul>
        </div>
    </div>
</div>
