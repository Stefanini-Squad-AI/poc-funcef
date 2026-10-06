<%-- SIG 50871
 Autor:  
 William Santana

 Data da Atualização:
 03/08/2017

 Criação de fucionalidade para importar modelos de contratos de empréstimo.--%>

<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Listagem.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.ModeloContrato.Listagem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario" runat="server">
    <script language="javascript" type="text/javascript">
   
        $(document).ready(function() {

          
        });

        //function novaJanela() {
        //    window.document.forms[0].target = '_blank';
        //    setTimeout(function () { window.document.forms[0].target = ''; }, 0);
        //}
    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" runat="server" titulo="Modelo de Contrato de Mútuo" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <div id="inicial">
        <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
            <glw:SecaoFormulario ID="secaoPrincipal" tituloSecao="Filtros da Busca" expandeContraiSecao="true" runat="server">
                <table cellpadding="" cellspacing="0" border="0" width="100%">
                    <tr>
                        <td width="110px" >Tipo de Contrato:</td>
                        <td>
                            <asp:DropDownList ID="caixaSelecaoTipoContrato" runat="server" Width="250px" Style="padding-top: 10px;">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr >               
                        <td style="margin-top:40px">Data início vigência:</td>                            
                        <td>
                            <glw:CaixaData ID="DataInicioVigencia" runat="server" mensagemDataInvalida="Data inválida." obrigatorio="false"></glw:CaixaData>
                        </td>          
                   </tr>
                    <tr>
                        <td colspan="2" align="right">
                            <glw:BotaoProcurar ID="botaoProcurar" runat="server" OnClick="botaoProcurar_Click" permissoesExigidas="consultar" Style="padding-top: 10px;" />
                            <glw:BotaoAcao ID="botaoIncluir" Text="Incluir" runat="server" OnClick="botaoIncluir_Click" permissoesExigidas="incluir" Style="padding-top: 10px;" tagImagem="botaoIncluir"/> 
                            <glw:BotaoLimpar ID="botaoLimpar" OnClick="botaoLimpar_Click" CausesValidation="false" runat="server" Style="padding-top: 10px;" />
                        </td>
                    </tr>
                </table>
            </glw:SecaoFormulario>
            <tr>
                <td class="posSecaoFormulario" style="text-align: center;">
                    <glw:grid ID="gridModContratos" runat="server" Width="100%" 
                        DataKeyNames="idtbEmpContrato, idTipoContratoEmptmo"
                        AllowSorting="true" OnDataBound="gridModContratos_DataBound" >  
                        <Columns>
                            <asp:TemplateField  HeaderText="Doc." ItemStyle-HorizontalAlign="Right" ItemStyle-Width="5%">
                                <ItemTemplate >
                                   <div class="campoDataGrid">
                                         <asp:ImageButton ID="btnPDf" runat="server" ImageUrl="~\Imagens\imgPdf.png" OnCommand="btnPDf_Command"
                                          CommandArgument='<%# DataBinder.Eval(Container.DataItem,"idTipoContratoEmptmo") %>'/>        
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <glw:CampoLimitado DataField="dataInclusao" HeaderText="Data Inclusão" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="10%" />
                            <glw:CampoLinkLimitado  DataTextField="tipoContrEmptmo" HeaderText="Modalidade" 
                                tamanhoMaximo="50"
                                DataNavigateUrlFormatString="~/Paginas/Tratamentos/ModeloContrato/Alteracao.aspx?IdTipoContr={0}&IdMinutaContrato={1}"
                                DataNavigateUrlFields="idTipoContratoEmptmo, IdMinutaHistorico" 
                                permissoesExigidas="alterar" 
                                ItemStyle-Width="25%">
                            </glw:CampoLinkLimitado>
                            <glw:CampoLimitado DataField="DataInicioVigencia" HeaderText="Data início vigência" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="10%" />
                            <glw:CampoLimitado DataField="DataFimVigencia" HeaderText="Data fim vigência" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="10%" />                            
                            <glw:CampoLimitado DataField="NuVersaoMinuta" HeaderText="Versão" ItemStyle-Width="10%" />
                             <asp:TemplateField HeaderText="Link Portal" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="40%">
                                <ItemTemplate>
                                    <a href=" <%# DataBinder.Eval(Container.DataItem,"link") %>" target="_blank">
                                        <%# DataBinder.Eval(Container.DataItem,"link") %> </a>                                
                                </ItemTemplate>
                            </asp:TemplateField>                                                  
                            <glw:CampoEntidadeComplexa DataField="usuarioInclusao" HeaderText="Usuário" tamanhoMaximo="40" ItemStyle-Width="15%" />                                                                        
                        </Columns> 
                    </glw:grid>                    
                    <asp:ObjectDataSource ID="dataSourceModelos" runat="server" 
                        SelectMethod="consultar"
                        TypeName="FUNCEF.Planus.WebEmprestimo.Web.Proxies.ProxyModeloContrato" 
                        SortParameterName="ordenacao"
                        StartRowIndexParameterName="indiceLinha" 
                        MaximumRowsParameterName="maximoLinhas" 
                        SelectCountMethod="total" EnablePaging="true" EnableCaching="false">
                        <SelectParameters>
                            <asp:ControlParameter Name="tipocontrato" ControlID="caixaSelecaoTipoContrato" PropertyName="SelectedValue" Direction="Input" Type="string" />
                            <asp:ControlParameter Name="DataInicioVigencia" ControlID="DataInicioVigencia" PropertyName="Text" Direction="Input" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">    
    <glw:BotaoSair ID="botaoSair" comportamentoSair="irParaTelaInicial" runat="server" />
</asp:Content>
