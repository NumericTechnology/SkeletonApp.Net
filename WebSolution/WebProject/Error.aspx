<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Error.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="WebProject.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadError" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            setLoading(false);
            window.parent.setLoading(false);
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyError" runat="server">
    <div class="KPSystemError">
        <pre><asp:Label ID="lblError" Text="" runat="server" style="font-family:'UbuntuLight';" /></pre>
    </div>
</asp:Content>
