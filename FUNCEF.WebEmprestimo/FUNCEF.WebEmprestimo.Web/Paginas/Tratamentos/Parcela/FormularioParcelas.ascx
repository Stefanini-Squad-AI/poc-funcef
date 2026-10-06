<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormularioParcelas.ascx.cs"
    Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Parcela.FormularioParcelas" %>

<script type="text/javascript" language="javascript">
    function validarObrigatorioTipo(objeto, args) {
        var caixaDataLiberacao = document.getElementById('<%= caixaDataLiberacao.ClientID %>');
        var comboStatus = document.getElementById('<%= comboStatus.ClientID %>');

        try {
            if (comboStatus.options[comboStatus.selectedIndex].value.toUpperCase() == 'C') {
                if (caixaDataLiberacao.value == "") {
                    args.IsValid = false;
                    return;
                }
            }
            args.IsValid = true;
        }
        catch (e) {
            args.IsValid = false;
        }
    }

    function desabilitarDataFim() {
        var chkPrazoIndeterminado = document.getElementById("<%= chkPrazoIndeterminado.ClientID %>"); 
        var dataFinal = document.getElementById("<%= caixaDataFinal.ClientID %>");
        var tipoSuspensao = document.getElementById('<%= comboTipoSuspensao.ClientID %>').value;

        if (chkPrazoIndeterminado.checked == true && tipoSuspensao != 2) {
            dataFinal.disabled = true;
            dataFinal.value = '';
        }
        else {
            dataFinal.disabled = false;
        }
    }
</script>

<asp:UpdatePanel ID="painelCampos" runat="server">
    <Triggers>
        <asp:PostBackTrigger ControlID="comboTipoSuspensao" />
    </Triggers>
    <ContentTemplate>
        <table cellpadding="1" cellspacing="0" border="0" width="100%">
        <asp:HiddenField ID="bloqSuspensao" runat="server" /><%--WILLIAM MOREIRA DA SILVA SOL 14992--%>
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" border="0" class="tableSecao">
                        <tr class="espacamento">
                            <td style="padding: 2px 0px 8px 7px !important;">
                                <asp:CheckBox ID="caixaSelecaoExcepcional" runat="server" Text="Excepcional" Style="color: Red;" />
                            </td>
                            <td>
                                <asp:CheckBox ID="chkPrazoIndeterminado" runat="server" Text="Prazo indeterminado" OnClick="desabilitarDataFim()"  />
                            </td>
                        </tr>
                        <tr class="espacamento">
                            <td style="padding: 5px 0px 5px 10px !important; width: 12%;">
                                Nº Contrato:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important; width: 24%;">
                                <asp:Label ID="labelNumContrato" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>&nbsp;
                            </td>
                            <td style="padding: 5px 0px 5px 10px !important; width: 13%;">
                                Matrícula:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important; width: 14%;">
                                <asp:Label ID="labelMatricula" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>&nbsp;
                            </td>
                            <td style="padding: 5px 0px 5px 10px !important; width: 13%;">
                                Mutuário:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important; width: 24%;">
                                <asp:Label ID="labelMutuario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>&nbsp;
                            </td>
                        </tr>
                        <%--William Moreira da Silva - SOL 144458--%>
                        <tr class="espacamento">
                            <td style="padding: 5px 0px 5px 10px !important;">
                                Prestação Atual:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important;">
                                <asp:Label ID="labelPrestacaoAtual" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                            </td>
                            <td style="padding: 5px 0px 5px 10px !important;">
                                Prestação Projetada:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important;">
                                <asp:Label ID="labelPrestacaoProjetada" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                            </td>
                            <td style="padding: 5px 0px 5px 10px !important;">
                                Margem Consignável Atual:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important;">
                                <asp:Label ID="labelMargemConsigAtual" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                            </td>
                        </tr>
                        <%--William Moreira da Silva - SOL 144458--%>
                        <tr class="espacamento">
                            <td style="padding: 5px 0px 5px 10px !important;">
                                Tipo de Suspensão:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important;">
                                <asp:DropDownList ID="comboTipoSuspensao" runat="server" Width="250px" OnSelectedIndexChanged="comboTipoSuspensao_SelectedIndexChanged"
                                    AutoPostBack="true">
                                </asp:DropDownList>
                                <div>
                                    <asp:RequiredFieldValidator ID="validadorTipoSuspensao" runat="server" ControlToValidate="comboTipoSuspensao"
                                        ErrorMessage="O campo Tipo de Suspensão é obrigatório." SetFocusOnError="true"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <asp:Label ID="labelTipoSuspensao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                <asp:HiddenField ID="hdIdTipoSuspensao" runat="server" />
                            </td>
                            <td style="padding: 5px 0px 5px 10px !important;">
                                Nº de Meses:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important;">
                                <glw:CaixaNumerica ID="caixaTextoNumMeses" runat="server" Width="50px" casasDecimais="0"
                                    tipoNumerico="numero" valorMinimo="1" OnTextChanged="caixaTextoNumMeses_textChanged" AutoPostBack="True"></glw:CaixaNumerica> <%--William Moreira SOL 161455--%>
                                <div>
                                    <asp:RequiredFieldValidator ID="validadorNumMeses" runat="server" ControlToValidate="caixaTextoNumMeses"
                                        ErrorMessage="O campo Nº de Meses é obrigatório." SetFocusOnError="true" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <asp:Label ID="labelNumMeses" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                            </td>
                            <td style="padding: 5px 0px 5px 10px !important;">
                                Prazo Restante:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important;">
                                <asp:Label ID="labelPrazo" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>&nbsp;
                            </td>
                        </tr>
                        <tr class="espacamento">
                            <td style="padding: 5px 0px 5px 10px !important;">
                                Início de Suspensão:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important;">
                                <glw:CaixaData ID="caixaDataInicio" runat="server" Width="80px" mensagemDataVazia="O campo Início de Suspensão é obrigatório."
                                             obrigatorio="true" exibirValidacaoAbaixo="true" OnTextChanged="caixaDatas_textChanged" AutoPostBack="True"></glw:CaixaData> <%--William Moreira da Silva SOL 142617--%>
                                <asp:Label ID="labelDataInicio" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                            </td>
                            <td style="padding: 5px 0px 5px 10px !important;">
                                Final de Suspensão:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important;">
                                <glw:CaixaData ID="caixaDataFinal" runat="server" Width="80px"                
                                    OnTextChanged="caixaDatas_textChanged" 
                                    AutoPostBack="True"></glw:CaixaData> 
                                 <%--mensagemDataVazia="O campo Final de Suspensão é obrigatório."
                                    obrigatorio="true" 
                                    exibirValidacaoAbaixo="true" --%>
                                <asp:Label ID="labelDataFinal" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                            </td>
                            <td style="padding: 5px 0px 5px 6px !important;" colspan="2">
                                <asp:CheckBox ID="caixaSelecaoFerias" runat="server" Text="Suspensão por Férias" />
                            </td>
                        </tr>
                        <tr class="espacamento">
                            <td style="padding: 5px 0px 5px 10px !important;">
                                Data de Liberação:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important;">
                                <glw:CaixaData ID="caixaDataLiberacao" runat="server" Width="80px" mensagemDataVazia=""
                                    obrigatorio="false" exibirValidacaoAbaixo="false"></glw:CaixaData>
                                <br />
                                <asp:CustomValidator ID="customValidatorCaixaDataLiberacao" runat="server" ClientValidationFunction="validarObrigatorioTipo"
                                    ErrorMessage="O campo Data de Liberação é obrigatório." ValidationGroup="parcelas"></asp:CustomValidator>
                            </td>
                            <td style="padding: 5px 0px 5px 10px !important;">
                                Início da Cobrança (Mês):
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important;">
                                <asp:DropDownList ID="comboMesCobranca" runat="server" Width="105px">
                                    <asp:ListItem Value="1" Text="Janeiro" />
                                    <asp:ListItem Value="2" Text="Fevereiro" />
                                    <asp:ListItem Value="3" Text="Março" />
                                    <asp:ListItem Value="4" Text="Abril" />
                                    <asp:ListItem Value="5" Text="Maio" />
                                    <asp:ListItem Value="6" Text="Junho" />
                                    <asp:ListItem Value="7" Text="Julho" />
                                    <asp:ListItem Value="8" Text="Agosto" />
                                    <asp:ListItem Value="9" Text="Setembro" />
                                    <asp:ListItem Value="10" Text="Outubro" />
                                    <asp:ListItem Value="11" Text="Novembro" />
                                    <asp:ListItem Value="12" Text="Dezembro" />
                                </asp:DropDownList>
                                <div>
                                    <asp:RequiredFieldValidator ID="validadorMesCobranca" runat="server" ControlToValidate="comboMesCobranca"
                                        ErrorMessage="O campo Início da Cobrança (Mês) é obrigatório." SetFocusOnError="true"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </td>
                            <td style="padding: 5px 0px 5px 10px !important;">
                                Início da Cobrança (Ano):
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important;">
                                <asp:DropDownList ID="comboAnoCobranca" runat="server" Width="60px">
                                </asp:DropDownList>
                                <div>
                                    <asp:RequiredFieldValidator ID="validadorAnoCobranca" runat="server" ControlToValidate="comboAnoCobranca"
                                        ErrorMessage="O campo Início da Cobrança (Ano) é obrigatório." SetFocusOnError="true"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </td>
                        </tr>
                        <tr class="espacamento">
                            <td style="padding: 5px 0px 5px 10px !important;">
                                Status:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important;" colspan="5">
                                <asp:DropDownList ID="comboStatus" runat="server" Width="100px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                       <%--William Moreira da Silva SOL 149705--%>
                        <tr class="espacamento">
                            <td style="padding: 5px 0px 5px 10px !important;" colspan="1">
                                Observação:
                            </td> 
                            <td style="padding: 5px 0px 5px 2px !important;" colspan="5">
                                <asp:TextBox ID="caixaTextoObservacao" runat="server" Width="600px" Height="60px" 
                                    TextMode="MultiLine">
                                </asp:TextBox><%--William Moreira da Silva SOL 149705--%>     
                            </td>                            
                        </tr> 
                    </table>
                    <table cellpadding="0" cellspacing="0" border="0" class="tableSecao">
                        <tr class="espacamento">
                            <td style="padding: 5px 0px 5px 10px !important; width: 15%;">
                                Data do Atendimento:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important; width: 25%;">
                                <asp:Label ID="labelDataAtendimento" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>&nbsp;
                            </td>
                            <td style="padding: 5px 0px 5px 10px !important; width: 22%;">
                                Responsável pelo Atendimento:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important; width: 38%;">
                                <asp:Label ID="labelResponsavelAtendimento" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>&nbsp;
                            </td>
                        </tr>
                        <tr class="espacamento">
                            <td style="padding: 5px 0px 5px 10px !important;">
                                Data do Atualização:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important;">
                                <asp:Label ID="labelDataAtualizacao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>&nbsp;
                            </td>
                            <td style="padding: 5px 0px 5px 10px !important;">
                                Responsável pelo Atualização:
                            </td>
                            <td style="padding: 5px 0px 5px 2px !important;">
                                <asp:Label ID="labelResponsavelAtualizacao" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
