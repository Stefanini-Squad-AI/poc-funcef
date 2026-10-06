<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Listagem.aspx.cs" Inherits="FUNCEF.GlobalWeb.Web.Paginas.Funcionalidades.Listagem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" titulo="Funcionalidades" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
        <glw:SecaoFormulario ID="secaoPrincipal" tituloSecao="Filtros da Busca" expandeContraiSecao="true"
            runat="server">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr style="padding-bottom: 10px;">
                    <td style="width: 370px; vertical-align: top;">
                        Nome da Aplicação:&nbsp;
                        <glw:ListaDropDown ID="listaAplicacao" runat="server" Width="250px" style="padding-top: 10px;"></glw:ListaDropDown>
                    </td>
                    <td style="width: 305px; vertical-align: top;">
                        Nome da Funcionalidade:&nbsp;
                        <glw:CaixaTexto ID="caixaTextoNome" runat="server" Width="150px" MaxLength="50"></glw:CaixaTexto>
                        <div>
                            <glw:ValidadorFiltroPesquisa ID="filtroNome" ControlToValidate="caixaTextoNome"
                                nomeCampo="Nome da Funcionalidade" ValidationGroup="funcionalidade" runat="server"></glw:ValidadorFiltroPesquisa>
                        </div>
                    </td>
                    <td style="text-align: right; padding-right: 30px; vertical-align: top;">
                        <glw:BotaoProcurar ID="botaoProcurar" runat="server" ValidationGroup="funcionalidade"
                            OnClick="botaoProcurar_Click" permissoesExigidas="" style="padding-top: 10px;"></glw:BotaoProcurar>
                        <glw:BotaoLimpar ID="botaoLimpar" OnClick="botaoLimpar_Click" CausesValidation="false"
                            runat="server" style="padding-top: 10px;"></glw:BotaoLimpar>
                    </td>
                </tr>
            </table>
        </glw:SecaoFormulario>
        <tr>
            <td class="posSecaoFormulario" style="text-align: center;">
                <glw:Grid ID="gridFuncionalidades" runat="server" Width="850px" DataKeyNames="id" AllowSorting="true">
                    <Columns>
                        <glw:CampoComandoExclusao validarPermissoes="false" />
                        <glw:CampoEntidadeComplexa DataField="aplicacao.nome" HeaderText="Nome da Aplicação" ItemStyle-Width="220px" />
                        <asp:HyperLinkField DataTextField="nome" HeaderText="Nome da Funcionalidade" SortExpression="DS_NOME"
                            DataNavigateUrlFormatString="~/Paginas/Funcionalidades/Visualizacao.aspx?Id={0}"
                            DataNavigateUrlFields="id" ItemStyle-Width="260px" />
                        <glw:CampoLimitado DataField="descricao" tamanhoMaximo="30" HeaderText="Descrição" />
                    </Columns>
                </glw:Grid>
                <asp:ObjectDataSource ID="dataSourceFuncionalidades" runat="server" DeleteMethod="excluirFuncionalidade"
                    SelectMethod="consultarFuncionalidades" TypeName="FUNCEF.GlobalWeb.Web.Proxies.ProxySeguranca"
                    SortParameterName="ordenacao" StartRowIndexParameterName="indiceLinha" MaximumRowsParameterName="maximoLinhas"
                    SelectCountMethod="totalRegistrosFuncionalidades" OnDeleted="dataSourceFuncionalidades_Deleted"  OnSelecting="dataSourceFuncionalidades_Selecting"
                    EnablePaging="true" EnableCaching="false">
                    <SelectParameters>
                        <asp:ControlParameter Name="idAplicacao" ControlID="listaAplicacao" PropertyName="SelectedValue"
                            Direction="Input" Type="Int32" />
                        <asp:ControlParameter Name="nome" ControlID="caixaTextoNome" PropertyName="Text"
                            Direction="Input" Type="String" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Direction="Input" Type="Int32" />
                    </DeleteParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
    <glw:SumarioValidacao ID="sumario" ValidationGroup="funcionalidade" runat="server" />
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoIncluir ID="botaoIncluir" runat="server" urlInclusao="Inclusao.aspx" permissoesExigidas="" />
    <glw:BotaoSair ID="botaoSair" comportamentoSair="irParaTelaInicial" runat="server" />
    <glw:BotaoImprimir ID="botaoImprimir" runat="server" />
    <glw:BotaoAjuda ID="botaoAjuda" runat="server" />
</asp:Content>
