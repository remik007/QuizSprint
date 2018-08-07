using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuizSprint
{

    public partial class Quiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var connection = WebConfigurationManager.ConnectionStrings["QuizSprintEntities"];

            using (SqlConnection dbConnection = new SqlConnection(connection.ConnectionString))
            {
                try
                {
                    dbConnection.Open();
                    ConnectionMessage.Text = "Connection successful.";
                    SqlCommand command = new SqlCommand("SELECT top 5 QuestionText, Answer FROM Question ORDER BY NEWID()", dbConnection);
                    SqlDataReader reader = command.ExecuteReader();
                    string[] questions = new string[5];
                    string[] answers = new string[5];
                    int i = 0;
                    while (reader.Read())
                    {
                        questions[i] = reader.GetString(0);
                        answers[i] = reader.GetString(1);
                        i++;
                    }
                    Question1.Text = questions[0];
                    Answer1 = answers[0];
                    Question2.Text = questions[1];
                    Answer2 = answers[1];
                    Question3.Text = questions[2];
                    Answer3 = answers[2];
                    Question4.Text = questions[3];
                    Answer4 = answers[3];
                    Question5.Text = questions[4];
                    Answer5 = answers[4];

                }
                catch (SqlException ex)
                {
                    ConnectionMessage.Text = "ERROR: Connection failed: " + ex.Message;
                }
                finally
                {
                    dbConnection.Close();
                    dbConnection.Dispose();
                }
            }


        }
        public void AddScore(string Score)
        {
            float score2 = float.Parse(Score);
            DateTime date = DateTime.Now;
            String username = HttpContext.Current.User.Identity.Name;
            
            var connection = WebConfigurationManager.ConnectionStrings["QuizSprintEntities"];

            using (SqlConnection dbConnection = new SqlConnection(connection.ConnectionString))
            {
                try
                {
                    dbConnection.Open();
                    SqlCommand command = new SqlCommand("INSERT INTO Score (Score, User_Email, CreatedDate) VALUES(@score, @user, @date)", dbConnection);
                    command.Parameters.AddWithValue("@score", score2);
                    command.Parameters.AddWithValue("@user", username);
                    command.Parameters.AddWithValue("@date", date);
                    command.ExecuteNonQuery();
                    /*
                    SqlCommand command2 = new SqlCommand("SELECT Score, User_Email, CreatedDate FROM Score ORDER BY Score", dbConnection);
                    SqlDataReader reader = command2.ExecuteReader();
                    string resultTable = "<div class='container'> <div class = 'col-sm-12'> <div class='col-sm-4'><th>Score</th></div> <div class='col-sm-4'><th>User</th></div> <div class='col-sm-4'><th>Date</th></div>";
                    while (reader.Read())
                    {
                        resultTable += "<div class='col-sm-4'>" + reader.GetString(0) + "</div>" + "<div class='col-sm-4'>" + reader.GetString(1) + "</div>" + "<div class='col-sm-4'>" + reader.GetString(2) + "</div>";
                    }
                    resultTable += "</div> </div>";
                    */
                }

                catch (SqlException ex)
                {
                    ConnectionMessage.Text = "ERROR: Connection failed: " + ex.Message;
                }
                finally
                {
                    dbConnection.Close();
                    dbConnection.Dispose();
                }
            }
        }


    }
}