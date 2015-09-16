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
using KPComponents;
using SpecialistEnumerator;
using KPExtension;
using KPEnumerator.KPComponents;
using KPBO;

namespace WebProject
{
    /// <summary>
    /// <para>Authors: Juliano Tiago Rinaldi and 
    /// Tiago Antonio Jacobi</para>
    /// </summary>
    public partial class FrmFrwUser : KPPage
    {
        public FrmFrwUser()
            : base(WindowEnum.FRW_USER_FORM)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void formControl_KPEventAfterLoad(object entity)
        {
            if (!IsPostBack)
            {
                if (formControl.FormActionState == KPFormStateEnum.New)
                {
                    KPFormItemCheckBoxControl IsAccessAllowed = this.BetterFindControl<KPFormItemCheckBoxControl>("IsAccessAllowed");
                    if (IsAccessAllowed != null)
                        IsAccessAllowed.ControlField.Checked = true;
                }
                else if (formControl.FormActionState == KPFormStateEnum.Edit)
                {
                    KPFormItemPasswordControl UserPassword = this.BetterFindControl<KPFormItemPasswordControl>("UserPassword");
                    if (UserPassword != null)
                        UserPassword.ControlField.Attributes.Add("value", FrwUserBO.DEFAULT_PSWD);

                }
            }
        }

    }
}