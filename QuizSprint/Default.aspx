<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QuizSprint._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:LoginView runat="server" ViewStateMode="Disabled">          
        <AnonymousTemplate>
            <div class="jumbotron">
                <h2>Log in to PLAY</h2>
                <asp:LinkButton runat="server" id="LinkButton2" href="/Quiz" CssClass="btn btn-primary btn-sm disabled">&#9658;</asp:LinkButton>
            </div>
        </AnonymousTemplate>
        <LoggedInTemplate>
           <div class="jumbotron">
                <h2>PLAY</h2>
                <asp:LinkButton runat="server" id="LinkButton1" href="/Quiz" CssClass="btn btn-primary btn-sm">&#9658;</asp:LinkButton>
            </div>
        </LoggedInTemplate>
    </asp:LoginView>

</asp:Content>
