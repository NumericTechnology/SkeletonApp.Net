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
 
using KPEntity.ORM;
using NHibernate.Criterion;
using SpecialistEnumerator;
using SpecialistEntity.ORM.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using KPExtension;
using KPComponents;
using KPCore.KPValidator;


namespace WebProject.FormFrw
{
    /// <summary>
    /// <para>Authors: Juliano Tiago Rinaldi and 
    /// Tiago Antonio Jacobi</para>
    /// </summary>
    public partial class FrmFrwUserCompany : KPPage
    {
        public FrmFrwUserCompany()
            : base(WindowEnum.FRW_USER_COMPANY_FORM)
        {
        }

        private List<VoFrwUserCompany> ListExcluidos
        {
            get
            {
                if (ViewState["ListExcluidos"] == null)
                    ViewState["ListExcluidos"] = new List<VoFrwUserCompany>();
                return (ViewState["ListExcluidos"]) as List<VoFrwUserCompany>;
            }
        }

        protected void BtnAddUsuario_KPClick(object sender, EventArgs e)
        {
            KPFormItemGridControl obj = this.BetterFindControl<KPFormItemGridControl>("grid_UsuarioEmpresa");
            KPFormItemTextControl companyName = this.BetterFindControl<KPFormItemTextControl>("CompanyName");
            KPFormItemZoomControl objIdUser = this.BetterFindControl<KPFormItemZoomControl>("objIdUser");
            List<VoFrwUserCompany> listData = obj.GridViewField.GetEntitiesInMemoryDataSource<VoFrwUserCompany>();
            int idUser = Convert.ToInt32(objIdUser.ControlField.Value);
            FrwCompany objIdCompany = formControl.DataSourceAltered as FrwCompany;
            int IdCompany = objIdCompany.IdCompany;

            VoFrwUserCompany FRWup = listData.Where<VoFrwUserCompany>(p => p.IdUser == idUser).SingleOrDefault();
            if (obj != null && FRWup == null)
            {
                obj.GridViewField.AddEntityInMemoryDataSource(new VoFrwUserCompany()
               {
                   IdUserCompany = 0,
                   IdCompany = IdCompany,
                   IdUser = Convert.ToInt32(objIdUser.ControlField.Value),
                   UserFullName = objIdUser.ControlField.Description,
                   CompanyName = companyName.ControlField.Text,
               });
                objIdUser.ControlField.Value = String.Empty;
            }
            else
            {
                formControl.AddErrorView("Usuário ja relacionado a empresa.");
            }
        }

        protected void grid_UsuarioEmpresa_KPDeleteLine(object sender, GridViewDeleteEventArgs e)
        {
            KPGridViewControl grid = (KPGridViewControl)sender;
            ListExcluidos.Add(grid.GetEntitiesInMemoryDataSource<VoFrwUserCompany>()[e.RowIndex]);
            grid.RemoveEntityInMemoryDataSource<VoFrwUserCompany>(e.RowIndex);
        }

        /// <summary>
        /// Método para retorna uma lista de usuários na Grid, selecionando pelo ID da empresa , se não tiver retorna um nova lista.
        /// </summary>
        /// <returns></returns>
        public List<VoFrwUserCompany> GetUsuarioEmpresa()
        {
            FrwCompany objIdCompany = formControl.DataSourceAltered as FrwCompany;
            int IdCompany = objIdCompany.IdCompany;
            if (IdCompany == 0)
            {
                return new List<VoFrwUserCompany>();
            }

            List<VoFrwUserCompany> listData = new List<VoFrwUserCompany>();
            FrwUserCompany[] listUserCompany = FrwUserCompany.FindAll(Expression.Eq("objIdCompany", new FrwCompany() { IdCompany = IdCompany }));
            foreach (FrwUserCompany item in listUserCompany)
            {
                listData.Add(new VoFrwUserCompany()
                {
                    IdUserCompany = item.IdUserCompany,
                    IdCompany = item.objIdCompany.IdCompany,
                    IdUser = item.objIdUser.IdUser,
                    UserFullName = item.objIdUser.UserFullName,
                    CompanyName = item.objIdCompany.CompanyName
                });
            }
            return listData;
        }

        protected void formControl_KPEventAfterControlsCreated(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KPFormItemTextControl companyName = this.BetterFindControl<KPFormItemTextControl>("CompanyName");
                companyName.ControlField.Enabled = false;
            }
        }

        protected void formControl_KPEventSaveClick(object entityBO)
        {
            KPFormItemGridControl obj = this.BetterFindControl<KPFormItemGridControl>("grid_UsuarioEmpresa");
            FrwUserCompany objUC;
            List<VoFrwUserCompany> listData = obj.GridViewField.GetEntitiesInMemoryDataSource<VoFrwUserCompany>();

            foreach (VoFrwUserCompany Data in listData)
            {
                //Qdo tiver a opção, implementar o EDITAR
                if (Data.IdUserCompany == 0)
                {
                    objUC = new FrwUserCompany();
                    objUC.objIdCompany = new FrwCompany() { IdCompany = Data.IdCompany };
                    objUC.objIdUser = new FrwUser() { IdUser = Data.IdUser };
                    try
                    {
                        objUC.Save();
                    }
                    catch (KPExceptionValidator ex)
                    {
                        //InvalidEntityHeader.Add(new KPBO.Validator.InvalidValueBO("Pelo menos uma forma de contato deve ser informada!( E-mail,Fone,Celular,Rádio,Skype)"));
                    }
                }
            }
            //Exclui do Banco os que foram excluidos da grid
            foreach (VoFrwUserCompany Data in ListExcluidos)
            {
                //Se for 0, é porque foi adicionado em memória e não estava no banco, portanto, desconsidera
                if (Data.IdUserCompany == 0)
                {
                    continue;
                }
                FrwUserCompany userCompany = new FrwUserCompany() { IdUserCompany = Data.IdUserCompany };
                userCompany.Delete();
            }
        }

        protected System.Collections.IEnumerable UsuarioEmpresa_KPEventGetData()
        {
            return GetUsuarioEmpresa();
        }
    }
}