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
using SpecialistEnumerator;
using System;
using KPExtension;

namespace WebProject.FormFrw
{
    /// <summary>
    /// <para>Authors: Juliano Tiago Rinaldi and 
    /// Tiago Antonio Jacobi</para>
    /// </summary>
    public partial class FrmFrwActivityLog : KPPage
    {
        public FrmFrwActivityLog()
            : base(WindowEnum.FRW_ACTIVITY_LOG_FORM)
        {
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void formControl_KPEventAfterControlsCreated(object sender, EventArgs e)
        {
            KPFormItemZoomControl objIdCompany = this.BetterFindControl<KPFormItemZoomControl>("objIdCompany");
            KPFormItemZoomControl objUser = this.BetterFindControl<KPFormItemZoomControl>("objIdUser");
            KPFormItemZoomControl objWindow = this.BetterFindControl<KPFormItemZoomControl>("objIdWindow");
            KPFormItemTextControl data = this.BetterFindControl<KPFormItemTextControl>("DateAccess");
            KPFormItemTextControl internalIpv4Address = this.BetterFindControl<KPFormItemTextControl>("InternalIpv4Address");
            KPFormItemTextControl externalIpv4Address = this.BetterFindControl<KPFormItemTextControl>("ExternalIpv4Address");
            KPFormItemTextControl internalIpv6Address = this.BetterFindControl<KPFormItemTextControl>("InternalIpv6Address");
            KPFormItemTextControl externalIpv6Address = this.BetterFindControl<KPFormItemTextControl>("ExternalIpv6Address");
            KPFormItemTextControl description = this.BetterFindControl<KPFormItemTextControl>("Description");
            KPFormItemTextControl sessionId = this.BetterFindControl<KPFormItemTextControl>("SessionId");
            objIdCompany.Enabled = false;
            objUser.Enabled = false;
            objWindow.Enabled = false;
            data.ControlField.Enabled = false;
            internalIpv4Address.ControlField.Enabled = false;
            externalIpv4Address.ControlField.Enabled = false;
            internalIpv6Address.ControlField.Enabled = false;
            externalIpv6Address.ControlField.Enabled = false;
            description.ControlField.Enabled = false;
            sessionId.ControlField.Enabled = false;
        }
    }
}