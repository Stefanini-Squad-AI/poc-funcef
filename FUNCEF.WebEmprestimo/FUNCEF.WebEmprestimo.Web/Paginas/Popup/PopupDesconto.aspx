<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/DialogoMestre.master"
    AutoEventWireup="true" CodeBehind="PopupDesconto.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Popup.PopupDesconto" %>



<asp:Content ID="ConteudoAdicionalHead" runat="server" ContentPlaceHolderID="ConteudoAdicionalHead">
    <style type="text/css">
        .tabelas {
            text-align: left;
            vertical-align: middle;
            padding: 10px;
            width: 100%;
        }

            .tabelas td {
                padding: 5px;
            }

        .tabelaPrincipal {
            padding: 50px;
        }

        .linhasRodape {
            border-bottom: 1px solid gray;
        }
    </style>

    <script language="javascript" type="text/javascript">

</script>
</asp:Content>

<asp:Content ID="contentCabecalho" runat="server" ContentPlaceHolderID="ConteudoCabecalho">
    <label style="font-weight: bold">Desconto para Recuperação do Crédito</label>
</asp:Content>

<asp:Content ID="contentConteudo" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
    <%--------------------------------------------------------------------------------%>
    <div style="margin-left:6px">
        <table class="tableSecao">
            <tr class="espacamento">
                <td colspan="4">
                    <glw:Grid ID="gridItens" runat="server" Width="700px" DataKeyNames="idItem" AllowSorting="true" AllowPaging="false" ShowFooter="true" OnRowDataBound="gridItens_RowDataBound">
                        <Columns>
                            <glw:CampoEntidadeComplexa DataField="descItem" HeaderText="Item" ItemStyle-HorizontalAlign="Left"/>
                            <asp:TemplateField HeaderText="Valor Original" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <div class="valorNumericoGrid">
                                        <span>
                                            <%# DataBinder.Eval(Container.DataItem, "valorNominal", "{0:N2}")%>&nbsp;
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Percentual de desconto" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <div class="valorNumericoGrid">
                                        <span>
                                            <%# DataBinder.Eval(Container.DataItem, "percentualDesconto", "{0:N2}")%>%&nbsp;
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Valor com Desconto" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <div class="valorNumericoGrid">
                                        <span>
                                            <%# DataBinder.Eval(Container.DataItem, "valorComDesconto", "{0:N2}")%>&nbsp;
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" HorizontalAlign="Right"/>
                    </glw:Grid>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
