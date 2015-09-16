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
using KPComponents.KPSecurity;
using KPComponents;
using KPComponents.KPSession;
using KPCore.KPSecurity;
using KPEnumerator.KPSecurity;

namespace WebProject
{
    /// <summary>
    /// <para>Authors: Juliano Tiago Rinaldi and 
    /// Tiago Antonio Jacobi</para>
    /// </summary>
    public partial class Logout : System.Web.UI.Page
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            var SecuritySession = KPSessionHelper.GetSession<KPSecuritySession>(KPSessionKeyEnum.SESSION_LOGIN);
            if (SecuritySession != null)
                LogHelper.Log(String.Format("Usuário [{0}] saiu do sistema", SecuritySession.Login), SecuritySession.Login);
            KPFormsAuthentication.Logout(false);
            this.Page.Response.Redirect("Login.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}