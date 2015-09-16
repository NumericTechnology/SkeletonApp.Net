<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmFrwParamList.aspx.cs" 
MasterPageFile="~/Master/Register.Master" Inherits="WebProject.FrmFrwParamList" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadRegister" runat="server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="FormRegisterBody" runat="server">
    <KP:KPFormControl runat="server" ID="formControl" TypeBONamespace="KPBO.FrwParamListBO">
        <KPColumnsModel>
            <KP:KPFormItemKey FieldName="IdParamList" Width="100" />
            <KP:KPFormItemZoom FieldName="objIdDatatype" Width="400" ZoomIDConfig="ZoomobjIdDatatype" IsRequired="true" />
            <KP:KPFormItemZoom FieldName="objIdParam" Width="400" ZoomIDConfig="ZoomobjIdParam" IsRequired="true" />
            <KP:KPFormItemText FieldName="Value" Width="400" IsRequired="true" />
            <KP:KPFormItemText FieldName="Description" Width="400" />
        </KPColumnsModel>
        <KPFormZoomConfig>
            <KP:KPFormZoomModel ZoomID="ZoomobjIdDatatype" TypeEntityNamespace="KPEntity.ORM.FrwDatatype" WindowTitle="Label_Titulo"
            FieldReturnId="IdDatatype" WidthZoom="400" HeightZoom="210">
                <KPZoomFieldsConfig>
                    <KP:KPColumnModel FieldName="IdDatatype" Width="100" />
                    <KP:KPColumnModel FieldName="TypeName" Width="100" />
                </KPZoomFieldsConfig>
            </KP:KPFormZoomModel>
        </KPFormZoomConfig>
        <KPFormZoomConfig>
            <KP:KPFormZoomModel ZoomID="ZoomobjIdParam" TypeEntityNamespace="KPEntity.ORM.FrwParam" WindowTitle="Label_Titulo"
            FieldReturnId="IdParam" WidthZoom="400" HeightZoom="210">
                <KPZoomFieldsConfig>
                    <KP:KPColumnModel FieldName="IdParam" Width="100" />
                    <KP:KPEntityModel FieldName="objIdDatatype" Width="100" />
                    <KP:KPColumnModel FieldName="DefaultValue" Width="100" />
                    <KP:KPColumnModel FieldName="Description" Width="100" />
                </KPZoomFieldsConfig>
            </KP:KPFormZoomModel>
        </KPFormZoomConfig>
    </KP:KPFormControl>
</asp:Content>
