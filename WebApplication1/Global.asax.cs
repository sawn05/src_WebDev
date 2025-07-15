using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using WebApplication1.data;

namespace WebApplication1
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            Application["Users"] = new ArrayList();
            arrGlobal users = new arrGlobal();
            users.addUser();
            ArrayList arrayUsers = new ArrayList(users.arrayList);
            Application["Users"] = arrayUsers;


        }

        protected void Session_Start(object sender, EventArgs e)
        {
            /*Session["User"] = new User();*/
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}