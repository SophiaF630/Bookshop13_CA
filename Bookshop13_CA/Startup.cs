using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Bookshop13_CA.Startup))]
namespace Bookshop13_CA
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
