<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	list
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>list</h2>
    <ul id="acc1" class="ui-accordion-container">
	<li>
		<div class="ui-accordion-left"></div>
		<a class="ui-accordion-link acc1">1a
			<span class="ui-accordion-right"></span></a>
		<div>
 
			<ul class="ui-accordion-container" id="acc2">
				<li>
					<div class="ui-accordion-left"></div>
					<a class="ui-accordion-link acc2">2a
						<span class="ui-accordion-right"></span></a>
					<div>
						2a<br />
						2a<br />
 
						2a<br />
					</div>
				</li>
				<li>
					<div class="ui-accordion-left"></div>
					<a class="ui-accordion-link acc2">2b
						<span class="ui-accordion-right"></span></a>
					<div>
						2b<br />
 
						2b<br />
						2b<br />
					</div>
				</li>
			</ul>
		</div>
	</li>
	<li>
 
		<div class="ui-accordion-left"></div>
		<a class="ui-accordion-link acc1">1b
			<span class="ui-accordion-right"></span></a>
		<div>
			1b<br />
			1b<br />
			1b<br />
		</div>
 
	</li>
</ul>


</asp:Content>
