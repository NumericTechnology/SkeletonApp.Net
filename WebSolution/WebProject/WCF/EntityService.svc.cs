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
  
using KPComponents.KPJson;
using KPCore.KPException;
using System;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;

namespace WebProject.WCF
{
    /// <summary>
    /// <para>Authors: Juliano Tiago Rinaldi and 
    /// Tiago Antonio Jacobi</para>
    /// </summary>
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class EntityService : KPJsonJqGrid
    {
        [OperationContract]
        [WebInvoke(Method = "POST", RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.WrappedRequest, ResponseFormat = WebMessageFormat.Json)]
        public string GetEntityFilter(int page, int rows, string sidx, string sord, bool _search, string filters,
                                      string user, string propertyCompany, string initialFilter, string initialOrder,
                                        object[] colModel, string searchField, string searchOper, string searchString)
        {
            try
            {
                string jsonReturn = GetGenericEntityFilter(page, rows, sidx, sord, _search, filters,
                                                           user, propertyCompany, initialFilter, initialOrder, colModel);
                return jsonReturn;
            }
            catch (Exception ex)
            {
                string error = KPExceptionHelper.GetMessageErrorRecursive(ex, true);
                throw ex;
            }
        }

    }
}
