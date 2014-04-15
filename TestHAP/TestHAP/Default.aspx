<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TestHAP._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div id="dvStock">
        <table>
            <tr>
                <td>
                    <input id="txtId" type="text" /><input id="btnGet" type="button" value="取得" />
                </td>
            </tr>
            <tr>
                <td>
                    <table id="tblStock">
                        <tr></tr>
                        <tr></tr>
                    </table>
                </td>
            </tr>
        </table>

    </div>
    <script type="text/javascript">
        $(function () {
            $("#btnGet").click(function () {

                if ($("#txtId").val() === "")
                {
                    alert("請輸入股票代號！！！");
                    $("#txtId").focus();
                    return;
                }
                $.ajax({
                    url: "<%=appURL()%>/api/Stock/" + $("#txtId").val(),
                    dataType: "json",
                    success: function (data) {
                        $("#tblStock td").remove();
                        $.each(data, function (index, value) {
                            $("#tblStock tr:first").append("<td>" + value.ColumnName + "</td>");
                            $("#tblStock tr:gt(0)").append("<td>" + value.ColumnValue + "</td>");
                        });

                        if (data.length === 0)
                        {
                            alert("此股票代號不存在！！！");
                            $("#txtId").focus();
                        }
                    },
                    error: function (jqXHR, textStatus, error) {
                        alert(textStatus);
                    }
                });
            });

        });
    </script>
</asp:Content>
