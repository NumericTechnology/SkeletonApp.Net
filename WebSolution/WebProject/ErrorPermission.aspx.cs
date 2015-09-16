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
 
using KPCore.KPException;
using KPEnumerator.KPSecurity;
using System;
using System.Web;

namespace WebProject
{
    /// <summary>
    /// <para>Authors: Juliano Tiago Rinaldi and 
    /// Tiago Antonio Jacobi</para>
    /// </summary>
    public partial class ErrorPermission : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpContext _context = HttpContext.Current;
                object error = _context.Session[KPSessionKeyEnum.SESSION_EXCEPTION.ToString()];
                lblError.Text = (error as Exception).Message;
                _context.Session.Remove(KPSessionKeyEnum.SESSION_EXCEPTION.ToString());
            }
        }


    }
}