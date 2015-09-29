<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmFrwProfileWindow.aspx.cs"
    MasterPageFile="~/Master/Register.Master" Inherits="WebProject.FrmFrwProfileWindow" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadRegister" runat="server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="FormRegisterBody" runat="server">
    <KP:KPFormControl runat="server" ID="formControl" TypeBONamespace="KPBO.FrwProfileBO"
        OnKPEventAfterControlsCreated="formControl_KPEventAfterControlsCreated"
        OnKPEventSaveClick="formControl_KPEventSaveClick">
        <KPColumnsModel>
            <KP:KPFormItemKey FieldName="IdProfile" Width="100" />
            <KP:KPFormItemText FieldName="Description" Width="483" />
            <KP:KPFormItemZoom ID="objIdWindow" Width="50" DescriptionWidth="400" ZoomIDConfig="ZoomobjIdWindow" Title="FRWEntity_Window" />
            <KP:KPFormItemCheckBox ID="IsPreview" Width="200" DefaultValue="true" Description="FRWEntity_IsPreview" />
            <KP:KPFormItemCheckBox ID="IsReadOnly" Width="200" DefaultValue="false" Description="FRWEntity_IsReadOnly" />
            <KP:KPFormItemButton ID="BtnAddWindow" Title="Translate_ButtonAdd" OnKPClick="BtnAddWindow_KPClick" />
            <KP:KPFormItemGrid ID="GridUsuarioEmpresa" GridIDConfig="GridUsuarioEmpresa" Width="488" Height="190" OnKPDeleteLine="GridUsuarioEmpresa_KPDeleteLine" />
        </KPColumnsModel>
        <KPFormZoomConfig>
            <KP:KPFormZoomModel ZoomID="ZoomobjIdWindow" TypeEntityNamespace="KPEntity.ORM.FrwWindow" WindowTitle="Translate_ZoomWindowTitleWindow"
                FieldReturnId="IdWindow" FieldReturnText="WindowTitle" WidthZoom="400" HeightZoom="210">
                <KPZoomFieldsConfig>
                    <KP:KPColumnModel FieldName="IdWindow" Width="100" />
                    <KP:KPColumnModel FieldName="WindowTitle" Width="100" />
                    <KP:KPColumnModel FieldName="WindowDescription" Width="100" />
                </KPZoomFieldsConfig>
            </KP:KPFormZoomModel>
        </KPFormZoomConfig>
        <KPFormGridConfig>
            <KP:KPFormGridModel ID="PerfilTela" GridID="GridUsuarioEmpresa" AutoGenerateColumns="false" EnableMemoryDataSource="true" OnKPEventGetData="PerfilTela_KPEventGetData">
                <KPGridFieldsConfig>
                    <KP:KPFormGridField Field="FrwWindowTitle" Width="500" HeaderName="FRWEntity_Window" />
                    <KP:KPFormGridField Field="IsPreview" Width="200" HeaderName="FRWEntity_IsPreview" />
                    <KP:KPFormGridField Field="IsReadOnly" Width="200" HeaderName="FRWEntity_IsReadOnly" />
                </KPGridFieldsConfig>
            </KP:KPFormGridModel>
        </KPFormGridConfig>
    </KP:KPFormControl>
</asp:Content>
