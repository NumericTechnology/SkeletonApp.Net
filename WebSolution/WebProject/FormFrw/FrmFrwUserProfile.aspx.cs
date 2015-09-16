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
using System.Web.UI.WebControls;

namespace WebProject.FormFrw
{
    /// <summary>
    /// <para>Authors: Juliano Tiago Rinaldi and 
    /// Tiago Antonio Jacobi</para>
    /// </summary>
    public partial class FrmFrwUserProfile : KPPage
    {
        public FrmFrwUserProfile()
            : base(WindowEnum.FRW_USER_PROFILE_FORM)
        {
        }

        private List<FrwUserProfile> ListExcluidos
        {
            get
            {
                if (ViewState["ListExcluidos"] == null)
                    ViewState["ListExcluidos"] = new List<FrwUserProfile>();
                return (ViewState["ListExcluidos"]) as List<FrwUserProfile>;
            }
        }


        protected void grid_UsuarioEmpresa_KPDeleteLine(Object sender, GridViewDeleteEventArgs e)
        {
            KPGridViewControl grid = (KPGridViewControl)sender;
            ListExcluidos.Add(grid.GetEntitiesInMemoryDataSource<FrwUserProfile>()[e.RowIndex]);
            grid.RemoveEntityInMemoryDataSource<FrwUserProfile>(e.RowIndex);
        }

        protected void BtnAddUsuario_KPClick(object sender, EventArgs e)
        {
            KPFormItemGridControl obj = this.BetterFindControl<KPFormItemGridControl>("grid_UsuarioEmpresa");
            KPFormItemTextControl Profile = this.BetterFindControl<KPFormItemTextControl>("Description");
            KPFormItemZoomControl objIdUser = this.BetterFindControl<KPFormItemZoomControl>("objIdUser");
            List<FrwUserProfile> listData = obj.GridViewField.GetEntitiesInMemoryDataSource<FrwUserProfile>();
            if (String.IsNullOrWhiteSpace(objIdUser.ControlField.Value))
            {
                formControl.AddErrorView("Favor selecionar um Usuário.");
                return;
            }
            int idUser = Convert.ToInt32(objIdUser.ControlField.Value);
            FrwProfile objProfile = formControl.DataSourceAltered as FrwProfile;
            int IdProfile = objProfile.IdProfile;

            FrwUserProfile FRWup = listData.Where<FrwUserProfile>(p => p.objIdUser.IdUser == idUser).SingleOrDefault();
            if (obj != null && FRWup == null)
            {
                obj.GridViewField.AddEntityInMemoryDataSource(new FrwUserProfile()
               {
                   IdUserProfile = 0,
                   objIdProfile = new FrwProfile() { Description = Profile.ControlField.Text, IdProfile = IdProfile },
                   objIdUser = new FrwUser() { UserFullName = objIdUser.ControlField.Description, IdUser = Convert.ToInt32(objIdUser.ControlField.Value) },
                   objIdCompany = objProfile.objIdCompany
               });
                objIdUser.ControlField.Value = String.Empty;
            }
            else
            {
                formControl.AddErrorView("Usuário esta adiconado no perfil.");
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
        public List<FrwUserProfile> GetPerfilUsuario()
        {
            FrwProfile objProfile = formControl.DataSourceAltered as FrwProfile;
            int IdProfile = objProfile.IdProfile;
            if (IdProfile == 0)
            {
                return new List<FrwUserProfile>();
            }

            List<FrwUserProfile> listData = new List<FrwUserProfile>();
            FrwUserProfile[] listUserProfile = FrwUserProfile.FindAll(Expression.Eq("objIdProfile", new FrwProfile() { IdProfile = IdProfile }));
            foreach (FrwUserProfile item in listUserProfile)
            {
                listData.Add(new FrwUserProfile()
                {
                    IdUserProfile = item.IdUserProfile,
                    objIdProfile = new FrwProfile() { Description = item.FrwProfileDescription, IdProfile = item.objIdProfile.IdProfile },
                    objIdUser = new FrwUser() { UserFullName = item.FrwUserFullName, IdUser = item.objIdUser.IdUser },
                    objIdCompany = objProfile.objIdCompany
                });
            }
            return listData;
        }

        protected void formControl_KPEventSaveClick(object entityBO)
        {
            KPFormItemGridControl obj = this.BetterFindControl<KPFormItemGridControl>("grid_UsuarioEmpresa");
            FrwUserProfile objUP;
            List<FrwUserProfile> listData = obj.GridViewField.GetEntitiesInMemoryDataSource<FrwUserProfile>();

            foreach (FrwUserProfile Data in listData)
            {
                if (Data.IdUserProfile == 0)
                {
                    objUP = new FrwUserProfile();
                    objUP.objIdProfile = Data.objIdProfile;
                    objUP.objIdUser = Data.objIdUser;
                    objUP.objIdCompany = Data.objIdCompany;
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
            foreach (FrwUserProfile Data in ListExcluidos)
            {
                //Se for 0, é porque foi adicionado em memória e não estava no banco, portanto, desconsidera
                if (Data.IdUserProfile == 0)
                {
                    continue;
                }
                FrwUserProfile userProfile = new FrwUserProfile() { IdUserProfile = Data.IdUserProfile };
                userProfile.Delete();
            }
        }

        protected System.Collections.IEnumerable UsuarioEmpresa_KPEventGetData()
        {
            return GetPerfilUsuario();
        }
    }
}