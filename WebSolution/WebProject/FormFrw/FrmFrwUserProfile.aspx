<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="FrmFrwUserProfile.aspx.cs" MasterPageFile="~/Master/Register.Master"
    Inherits="WebProject.FormFrw.FrmFrwUserProfile" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadRegister" runat="server">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="FormRegisterBody" runat="server">
    <KP:KPFormControl runat="server" ID="formControl" TypeBONamespace="KPBO.FrwProfileBO"
        OnKPEventAfterControlsCreated="formControl_KPEventAfterControlsCreated"
        OnKPEventSaveClick="formControl_KPEventSaveClick">
        <KPColumnsModel>
            <KP:KPFormItemKey FieldName="IdProfile" Width="100" />
            <KP:KPFormItemText FieldName="Description" Width="495" />
            <KP:KPFormItemZoom ID="objIdUser" Width="50" DescriptionWidth="301" ZoomIDConfig="ZoomIdUser" Title="Translate_User" />
            <KP:KPFormItemButton ID="BtnAddUsuario" Title="Translate_ButtonAdd" OnKPClick="BtnAddUsuario_KPClick" />
            <KP:KPFormItemGrid ID="grid_UsuarioEmpresa" GridIDConfig="grid_UsuarioEmpresa" Width="500" Height="190" OnKPDeleteLine="grid_UsuarioEmpresa_KPDeleteLine" />
        </KPColumnsModel>

        <KPFormZoomConfig>
            <KP:KPFormZoomModel ZoomID="ZoomIdUser" TypeEntityNamespace="KPEntity.ORM.FrwUser"
                FieldReturnId="IdUser" FieldReturnText="UserFullName" WidthZoom="420" HeightZoom="250"
                WindowTitle="Translate_ZoomWindowTitleUser" PropertyCompanyEntity="objIdCompany" >
                <KPZoomFieldsConfig>
                    <KP:KPColumnModel FieldName="IdUser" Width="90" />
                    <KP:KPColumnModel FieldName="UserFullName" Width="300" />
                </KPZoomFieldsConfig>
            </KP:KPFormZoomModel>
        </KPFormZoomConfig>

        <KPFormGridConfig>
            <KP:KPFormGridModel ID="UsuarioEmpresa" GridID="grid_UsuarioEmpresa" AutoGenerateColumns="false" EnableMemoryDataSource="true" OnKPEventGetData="UsuarioEmpresa_KPEventGetData">
                <KPGridFieldsConfig>
                    <KP:KPFormGridField Field="FrwUserFullName" Width="500" HeaderName="Translate_User" />
                </KPGridFieldsConfig>
            </KP:KPFormGridModel>
        </KPFormGridConfig>
    </KP:KPFormControl>
</asp:Content>


