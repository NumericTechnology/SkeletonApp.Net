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
 
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using KPComponents.KPJson;
using KPEntity.ORM;
using System;

namespace WebProject.WCF
{
    /// <summary>
    /// <para>Authors: Juliano Tiago Rinaldi and 
    /// Tiago Antonio Jacobi</para>
    /// </summary>
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class WCFAjaxJson : KPJsonBase
    {
        [OperationContract]
        [WebInvoke(Method = "POST", RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.WrappedRequest, ResponseFormat = WebMessageFormat.Json)]
        public string GetWindowFinder(string windowID, string user)
        {
            try
            {
                int idWin;
                if (windowID.Contains("."))
                {
                    if (Int32.TryParse(windowID.Replace(".", String.Empty), out idWin))
                    {
                        FrwWindow frwWindow = FrwWindow.Find(idWin);
                        if (frwWindow != null)
                        {
                            string strOnClickMenu = String.Format(@"addNewTab('KPTabControl', '{0}', '{1}');", frwWindow.WindowTitle, frwWindow.WindowPath);
                            return strOnClickMenu;
                        }
                    }
                }
            }
            catch { }

            return KPJsonBase.JsonEmpty;
        }
    }
}
