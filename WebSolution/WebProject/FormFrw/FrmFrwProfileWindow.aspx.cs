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
using KPCore.KPValidator;
using KPEntity.ORM;
using KPExtension;
using NHibernate.Criterion;
using SpecialistEnumerator;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject
{
    /// <summary>
    /// <para>Authors: Juliano Tiago Rinaldi and 
    /// Tiago Antonio Jacobi</para>
    /// </summary>
    public partial class FrmFrwProfileWindow : KPPage
    {
        public FrmFrwProfileWindow()
            : base(WindowEnum.FRW_PROFILE_WINDOW_FORM)
        {
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private List<FrwProfileWindow> ListExcluidos
        {
            get
            {
                if (ViewState["ListExcluidos"] == null)
                    ViewState["ListExcluidos"] = new List<FrwProfileWindow>();
                return (ViewState["ListExcluidos"]) as List<FrwProfileWindow>;
            }
        }


        protected void GridUsuarioEmpresa_KPDeleteLine(Object sender, GridViewDeleteEventArgs e)
        {
            KPGridViewControl grid = (KPGridViewControl)sender;
            ListExcluidos.Add(grid.GetEntitiesInMemoryDataSource<FrwProfileWindow>()[e.RowIndex]);
            grid.RemoveEntityInMemoryDataSource<FrwProfileWindow>(e.RowIndex);
        }

        protected void BtnAddWindow_KPClick(object sender, EventArgs e)
        {
            KPFormItemGridControl obj = this.BetterFindControl<KPFormItemGridControl>("GridUsuarioEmpresa");
            KPFormItemTextControl Profile = this.BetterFindControl<KPFormItemTextControl>("Description");
            KPFormItemZoomControl objIdWindow = this.BetterFindControl<KPFormItemZoomControl>("objIdWindow");
            KPFormItemCheckBoxControl IsPreview = this.BetterFindControl<KPFormItemCheckBoxControl>("IsPreview");
            KPFormItemCheckBoxControl IsReadOnly = this.BetterFindControl<KPFormItemCheckBoxControl>("IsReadOnly");
            List<FrwProfileWindow> listData = obj.GridViewField.GetEntitiesInMemoryDataSource<FrwProfileWindow>();
            if (String.IsNullOrWhiteSpace(objIdWindow.ControlField.Value))
            {
                formControl.AddErrorView("Favor selecionar uma tela.");
                return;
            }
            int idWindow = Convert.ToInt32(objIdWindow.ControlField.Value);
            FrwProfile objProfile = formControl.DataSourceAltered as FrwProfile;
            int idProfile = objProfile.IdProfile;

            FrwProfileWindow FRWup = listData.Where<FrwProfileWindow>(p => p.objIdWindow.IdWindow == idWindow).SingleOrDefault();
            if (obj != null && FRWup == null)
            {
                obj.GridViewField.AddEntityInMemoryDataSource(new FrwProfileWindow()
                {
                    IdProfileWindow = 0,
                    objIdProfile = FrwProfile.TryFind(idProfile),
                    objIdWindow = FrwWindow.TryFind(idWindow),
                    objIdCompany = objProfile.objIdCompany,
                    IsPreview = IsPreview.ControlField.Checked,
                    IsReadOnly = IsReadOnly.ControlField.Checked
                });
                objIdWindow.ControlField.Value = String.Empty;
            }
            else
            {
                formControl.AddErrorView("Tela esta adiconado no perfil.");
            }
        }

        protected void formControl_KPEventAfterControlsCreated(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KPFormItemTextControl description = this.BetterFindControl<KPFormItemTextControl>("Description");
                description.ControlField.Enabled = false;
            }
        }

        /// <summary>
        /// Método para retorna uma lista de usuários na Grid, selecionando pelo ID do perfil , se não tiver retorna um nova lista.
        /// </summary>
        /// <returns></returns>
        public List<FrwProfileWindow> GetPerfilTela()
        {
            List<FrwProfileWindow> listData = new List<FrwProfileWindow>();
            FrwProfile objProfile = formControl.DataSourceAltered as FrwProfile;
            int IdProfile = objProfile.IdProfile;
            if (IdProfile == 0)
            {
                return new List<FrwProfileWindow>();
            }

            Conjunction conj = new Conjunction();
            conj.Add(Expression.Eq("objIdProfile", new FrwProfile() { IdProfile = IdProfile }));
            conj.Add(Expression.Eq("objIdCompany", objProfile.objIdCompany));

            FrwProfileWindow[] listUserProfile = FrwProfileWindow.FindAll(conj);
            listData.AddRange(listUserProfile);

            return listData;
        }

        protected void formControl_KPEventSaveClick(object entityBO)
        {
            KPFormItemGridControl obj = this.BetterFindControl<KPFormItemGridControl>("GridUsuarioEmpresa");
            FrwProfileWindow objUP;
            List<FrwProfileWindow> listData = obj.GridViewField.GetEntitiesInMemoryDataSource<FrwProfileWindow>();

            foreach (FrwProfileWindow Data in listData)
            {
                if (Data.IdProfileWindow == 0)
                {
                    objUP = new FrwProfileWindow();
                    objUP.objIdProfile = Data.objIdProfile;
                    objUP.objIdWindow = Data.objIdWindow;
                    objUP.objIdCompany = Data.objIdCompany;
                    objUP.IsPreview = Data.IsPreview;
                    objUP.IsReadOnly = Data.IsReadOnly;
                    try
                    {
                        objUP.Save();
                    }
                    catch (KPExceptionValidator ex)
                    {
                        foreach (var item in ex.Erros)
                        {
                            formControl.AddErrorView(item.Message);
                        }
                    }
                }
            }
            //Exclui do Banco os que foram excluidos da grid
            foreach (FrwProfileWindow Data in ListExcluidos)
            {
                //Se for 0, é porque foi adicionado em memória e não estava no banco, portanto, desconsidera
                if (Data.IdProfileWindow == 0)
                {
                    continue;
                }
                FrwProfileWindow userProfile = new FrwProfileWindow() { IdProfileWindow = Data.IdProfileWindow };
                userProfile.Delete();
            }
        }

        protected System.Collections.IEnumerable PerfilTela_KPEventGetData()
        {
            return GetPerfilTela();
        }

    }
}
