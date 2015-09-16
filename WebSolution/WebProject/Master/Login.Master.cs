/*
 * Copyright 2011-2015 Numeric Technology
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
using System;
using System.Web.UI;
using KPComponents.KPSecurity;
using System.Security.Authentication;

namespace WebProject.Master
{
    /// <summary>
    /// <para>Authors: Juliano Tiago Rinaldi and 
    /// Tiago Antonio Jacobi</para>
    /// </summary>
    public partial class Login : System.Web.UI.MasterPage
    {

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            //try
            //{
            //    if (this.Page.User.Identity.IsAuthenticated)
            //    {
            //        KPSecuritySession sessLogin = new KPSecuritySession(this.Page.User.Identity.Name);
            //        KPSessionHelper.SetSession(KPSessionKeyEnum.SESSION_LOGIN, sessLogin);
            //        KPFormsAuthentication.Redirect(this.Page, sessLogin.Login, true);
            //    }
            //    else
            //    {
            //        KPFormsAuthentication.Logout();
            //    }
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnter_Click(object sender, EventArgs e)
        {
            try
            {
                KPFormsAuthentication.AuthenticateAndRedirect(this.Page, txtUserLogin.Text,
                                                txtUserPassword.Text, true);
            }
            catch (AuthenticationException ex)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, Page.GetType(), "SetErrorOnLogin",
                            String.Format(@"setErrorOnLogin(""{0}"");", ex.Message), true);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}