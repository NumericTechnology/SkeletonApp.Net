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
 
using KPComponents;
using KPComponents.KPSession;
using KPEntity.ORM;
using KPEnumerator.KPComponents;
using SpecialistEnumerator;
using System;


namespace WebProject
{
    /// <summary>
    /// <para>Authors: Juliano Tiago Rinaldi and 
    /// Tiago Antonio Jacobi</para>
    /// </summary>
    public partial class FrmFrwCompanyView : KPPage
    {
        public FrmFrwCompanyView()
            : base(WindowEnum.FRW_COMPANY_VIEW)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ActionUserRelationship_Click(object sender, EventArgs e)
        {
            var pagePermission = this.SecuritySession.GetPagePermission(WindowEnum.FRW_USER_COMPANY_FORM);
            if (pagePermission != null && pagePermission.IsPreview)
            {
                var entitySelected = KPGridControlUser.GetSelectedEntity<FrwCompany>();

                if (entitySelected != null)
                {
                    KPSessionHelper.SetSessionData(new KPSessionData(KPGridControlUser, entitySelected, KPFormStateEnum.Edit), this.SessionPageID);
                    KPPageBase kpPage = ((KPPageBase)this.Page);
                    kpPage.KPWindow(pagePermission.PageId, true, 535, 350);
                }
            }
        }
    }
}