using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(QuizSprint.Startup))]
namespace QuizSprint
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
