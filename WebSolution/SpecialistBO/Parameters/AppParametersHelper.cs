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
using System.Linq;
using KPBO.Parameters;
using KPEntity.ORM;
using NHibernate.Criterion;

namespace SpecialistBO.Parameters
{
    /// <summary>
    /// <para>Authors: Juliano Tiago Rinaldi and 
    /// Tiago Antonio Jacobi</para>
    /// </summary>
    public class AppParametersHelper : FrwParametersHelper
    {
        public static void UpdateDefaultParamValueApp(FrwCompany company)
        {
            FrwParamValue[] paramsValue = FrwParamValue.FindAll(Expression.Eq("objIdCompany", company));
            Conjunction conj = new Conjunction();
            conj.Add(Expression.Not(Expression.In("IdParam", paramsValue.Select(x => x.objIdParam.IdParam).ToArray())));
            conj.Add(Expression.Eq("IsCompanyRequired", true));
            FrwParam[] paramsNew = FrwParam.FindAll(conj);
            string[] paramsNames = paramsNew.Select(x => x.IdParam).ToArray();
            AppParamEnum enumTryParse;
            foreach (string item in paramsNames)
            {
                if (Enum.TryParse<AppParamEnum>(item, out enumTryParse))
                    FrwParametersHelper.UpdateDefaultParamValue(enumTryParse, company);
            }
        }
    }
}
