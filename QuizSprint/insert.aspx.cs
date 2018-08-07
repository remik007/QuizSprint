using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuizSprint
{
    public partial class insert : System.Web.UI.Page
    {
        string user;
        string score;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = Request.QueryString["user"].ToString();
            score = Request.QueryString["score"].ToString();
            DateTime date = DateTime.Now;

            var connection = WebConfigurationManager.ConnectionStrings["QuizSprintEntities"];

            using (SqlConnection dbConnection = new SqlConnection(connection.ConnectionString))
            {
                try
                {
                    dbConnection.Open();
                    SqlCommand command = new SqlCommand("INSERT INTO Score (Score, User_Email, CreatedDate) VALUES(@score, @user, @date)", dbConnection);
                    command.Parameters.AddWithValue("@score", score);
                    command.Parameters.AddWithValue("@user", user);
                    command.Parameters.AddWithValue("@date", date);
                    command.ExecuteNonQuery();
                    
                    SqlCommand command2 = new SqlCommand("SELECT Score, User_Email, CreatedDate FROM Score ORDER BY Score", dbConnection);
                    SqlDataReader reader = command2.ExecuteReader();
                    string resultTable = "</br></br><div class='container table'> <div class = 'col-sm-12 row-well'><h4>SCORE TABLE</h4></div><div class = 'col-sm-12 row'> <div class='col-sm-4'><th>Score</th></div> <div class='col-sm-4'><th>User</th></div> <div class='col-sm-4'><th>Date</th></div></br>";
                    while (reader.Read())
                    {
                        resultTable += "<div class='col-sm-4'>" + reader.GetDouble(0).ToString() + "</div>" + "<div class='col-sm-4'>" + reader.GetString(1) + "</div>" + "<div class='col-sm-4'>" + reader.GetDateTime(2).ToString() + "</div>";
                    }
                    resultTable += "</div> </div></br></br>";
                    UserTable.Text = resultTable;
                }

                catch (SqlException ex)
                {
                    
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