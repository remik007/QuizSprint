<%@ Page Title="Quiz" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Quiz.aspx.cs" Inherits="QuizSprint.Quiz" %>

<asp:Content ID="QuizContainer" ContentPlaceHolderId="MainContent" runat="server">
    <div class="row">
        <div class="alert alert-warning col-sm-12" role="alert" style="font-weight: bold"><asp:Literal ID="ConnectionMessage" runat="server" /></div>
    </div>
    <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div id="counter" style="display:none">
                        <label id="seconds">00</label>:<label id="ms">00</label>
                    </div>
                    <div id="question1" class="col-sm-12" style="display:none;">
                        <div>
                            <h4>Question 1</h4>
                            <h2><asp:Literal ID="Question1" runat="server" /></h2>
                            <div class="col-sm-6">
                                <button type="button" runat="server" id="yes1" onclick="checkAnswer1(1)" class="btn btn-success btn-block col-sm-6">YES</button>
                            </div>
                            <div class="col-sm-6">
                                <button type="button" runat="server" id="no1" onclick="checkAnswer1(2)" class="btn btn-danger btn-block col-sm-6">No</button>
                            </div>
                        </div>
                    </div>
                    <div id="question2" class="col-sm-12" style="display:none;">
                        <div>
                            <h4>Question 2</h4>
                            <h2><asp:Literal ID="Question2" runat="server" /></h2>
                            <div class="col-sm-6">
                                <button type="button" runat="server" id="yes2" onclick="checkAnswer2(1)" class="btn btn-success btn-block col-sm-6">YES</button>
                            </div>
                            <div class="col-sm-6">
                                <button type="button" runat="server" id="no2" onclick="checkAnswer2(2)" class="btn btn-danger btn-block col-sm-6">No</button>
                            </div>
                        </div>
                    </div>
                    <div id="question3" class="col-sm-12" style="display:none;">
                        <div>
                            <h4>Question 3</h4>
                            <h2><asp:Literal ID="Question3" runat="server" /></h2>
                            <div class="col-sm-6">
                                <button type="button" runat="server" id="yes3" onclick="checkAnswer3(1)" class="btn btn-success btn-block col-sm-6">YES</button>
                            </div>
                            <div class="col-sm-6">
                                <button type="button" runat="server" id="no3" onclick="checkAnswer3(2)" class="btn btn-danger btn-block col-sm-6">No</button>
                            </div>
                        </div>
                    </div>
                    <div id="question4" class="col-sm-12" style="display:none;">
                        <div>
                            <h4>Question 4</h4>
                            <h2><asp:Literal ID="Question4" runat="server" /></h2>
                            <div class="col-sm-6">
                                <button type="button" runat="server" id="yes4" onclick="checkAnswer4(1)" class="btn btn-success btn-block col-sm-6">YES</button>
                            </div>
                            <div class="col-sm-6">
                                <button type="button" runat="server" id="no4" onclick="checkAnswer4(2)" class="btn btn-danger btn-block col-sm-6">No</button>
                            </div>
                        </div>
                    </div>
                    <div id="question5" class="col-sm-12" style="display:none;">
                        <div>
                            <h4>Question 5</h4>
                            <h2><asp:Literal ID="Question5" runat="server" /></h2>
                            <div class="col-sm-6">
                                <button type="button" runat="server" id="yes5" onclick="checkAnswer5(1)" class="btn btn-success btn-block col-sm-6">YES</button>
                            </div>
                            <div class="col-sm-6">
                                <button type="button" runat="server" id="no5" onclick="checkAnswer5(2)" class="btn btn-danger btn-block col-sm-6">No</button>
                            </div>
                        </div>
                    </div>
                    <div id="gameOver" class="col-sm-12" style="display:none;">
                        <div>
                            <h4>GAME OVER</h4>
                            <h2>PLAY AGAIN</h2>
                            <asp:LinkButton runat="server" id="LinkButton2" href="/Quiz" CssClass="btn btn-primary btn-sm">&#9658;</asp:LinkButton>
                        </div>
                    </div>
                     <div id="win" class="col-sm-12" style="display:none;">
                        <div>
                            <h4>CONGRATULATIONS! This is your time: <label id="score"></label></h4>
                            <h2>PLAY AGAIN</h2>
                            <asp:LinkButton runat="server" id="LinkButton1" href="/Quiz" CssClass="btn btn-primary btn-sm">&#9658;</asp:LinkButton>
                        </div>
                    </div>
                    
                </div>
            </div>
        <div id="scoreTable"</div>

            <asp:LinkButton runat="server" id="LinkButton3" href="/" CssClass="btn btn-default btn-sm btn-block ">Back to menu</asp:LinkButton>
        
    </div>
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <script>
        var secondsLabel = document.getElementById("seconds");
        var msLabel = document.getElementById("ms");
        var totalSeconds = 0;
        

        $(document).ready(function () {
            $("#question1").css({ display: "" });
            $("#counter").css({ display: "" });

            setInterval(setTime, 10);

            function setTime() {
                ++totalSeconds;
                msLabel.innerHTML = pad(totalSeconds % 100);
                secondsLabel.innerHTML = pad(parseInt(totalSeconds / 100));
            }

            function pad(val) {
                var valString = val + "";
                if (valString.length < 2) {
                    return "0" + valString;
                } else {
                    return valString;
                }
            }
        })

        function checkAnswer1(answer)
        {
            var correctAnswer =  <%= Answer1Text%>;
            if(answer == correctAnswer)
            {
                $("#question1").css({display:"none"});
                $("#question2").css({display:""});
            }
            else
            {
                $("#question1").css({display:"none"});
                $("#gameOver").css({display:""});
            }
        }

        function checkAnswer2(answer)
        {
            var correctAnswer =  <%= Answer2Text%>;
            if(answer == correctAnswer)
            {
                $("#question2").css({display:"none"});
                $("#question3").css({display:""});
            }
            else
            {
                $("#question2").css({display:"none"});
                $("#gameOver").css({display:""});
            }
        }

        function checkAnswer3(answer)
        {
            var correctAnswer =  <%= Answer3Text%>;
            if(answer == correctAnswer)
            {
                $("#question3").css({display:"none"});
                $("#question4").css({display:""});
            }
            else
            {
                $("#question3").css({display:"none"});
                $("#gameOver").css({display:""});
            }
        }

        function checkAnswer4(answer)
        {
            var correctAnswer =  <%= Answer4Text%>;
            if(answer == correctAnswer)
            {
                $("#question4").css({display:"none"});
                $("#question5").css({display:""});
            }
            else
            {
                $("#question5").css({display:"none"});
                $("#gameOver").css({display:""});
            }
        }

        function checkAnswer5(answer)
        {
            var correctAnswer =  <%= Answer5Text%>;
            if(answer == correctAnswer)
            {
                $("#question5").css({display:"none"});
                $("#win").css({display:""});
                $("#counter").css({display:"none"});
                var score = $("#seconds").text() + "." + $("#ms").text();
                $("#score").text(score);
                var user = '<%=Context.User.Identity.GetUserName()%>';
                
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "insert.aspx?user="+user+"&score="+score, false);
                xmlhttp.send(null);
                document.getElementById("scoreTable").innerHTML = xmlhttp.responseText;
                
            }
            else
            {
                $("#question5").css({display:"none"});
                $("#gameOver").css({display:""});
            }
        }


    </script>
</asp:Content>

