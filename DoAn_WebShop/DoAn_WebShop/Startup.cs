using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DoAn_WebShop.Startup))]
namespace DoAn_WebShop
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
