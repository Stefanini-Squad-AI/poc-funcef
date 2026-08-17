unit FParamAdminImob;

// -----------------------------------------------------------------------------------------------------
//
//	      Parâmetros do Sistema de Administração Imobiliária
//
//	Autor             :  André Pontes
//	Data de Início    :  26/01/1999
//	Data de Término   :  26/01/1999
//
//	Modificações      :  09/03/1999  1) Integração com Gestão de Investimentos e Ativo Fixo (só checkboxes)
//                      17/05/1999  2) Flags referentes ao uso preferencial da SubContas ligadas ao
//                                     Imóvel e ao Locatário
//                      24/05/1999  3) Tipos de Custos e Receitas associados a Venda / Aquisição de Cotas
//                      25/05/1999  4) Tipos de Operação ligados a Venda / Aquisição de Cotas
//                      24/08/1999  5) Exclusão dos itens (3) e (4)
//                      07/10/1999  6) Exclusão do item (2)
//                      07/01/2000  7) Cadastro dos Parâmetros de Investimento
//                      29/01/2000  8) Novos parâmetros ligados à alimentação de carteira
//                      25/05/2000  9) Uma série de novos parâmetros
//                                 10) Parâmetros ligados à alimentação da carteira "escondidos"
//                      03/08/2000 11) Tela totalmente refeita, com parâmetros novos
//                      18/12/2000 12) Novo parâmetro: IDTCUSTORECIMOCOM (Alex Pereira)
//                      09/01/2001 13) Novo parâmetro: FLGUSAAP (André Pontes)
//                      05/02/2001 14) Novos parâmetros: Centro de Custo e Programa (Andre Pontes)
//                      19/02/2001 15) Novo parâmetros: FlgReembolsoAut (Andre Pontes)
//                      23/02/2001 16) Novos parâmetros: FlgAluguelZERO e FlgConsideraResp (Andre Pontes)
//                      02/03/2001 17) Eliminado a funcionalidade do campo FlgConsideraResp (Alex Pereira)
//                                     Para o campo acima será utilizado o FlgReembolsoAut
//
// -----------------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------------
//
//       Parâmetros:
//
//    IDPESSOA          :  Empresa Proprietária
//
//    CODCENTRORESPON   :  Centro de Responsabilidade default p/ Receitas e Despesas de Imóveis
//    UNIDNEGOC         :  Atividade/Projeto default p/ Receitas e Despesas de Imóveis
//    CODPORTFORMA      :  Portador-Forma default p/ Receitas e Despesas de Imóveis
//
//    FLGINTEGRACONTAB  :  Indica se o Sistema se integra com Contabilidade
//    FLGINTEGRACAPCAR  :  Indica se o Sistema se integra com Contas a Pager e Receber
//    FLGINTEGRAGESTAO  :  Indica se o Sistema se integra com Investimentos / Gestão de Investimentos
//    FLGINTEGRAATIVO   :  Indica se o Sistema se integra com Ativo Fixo
//
//    FLGUSASCIMOVEL    :  Obriga o uso de SubConta (SC) ligada ao Imóvel
//    FLGUSASCLOCATARIO :  Obriga o uso de SubConta (SC) ligada ao Locatário
//
//    FLGALIMENTADEPREC :  Indica se a depreciação alimenta Carteira
//    FLGALIMENTAALTER  :  Indica se alteradores alimentam Carteira
//    FLGALIMENTADATA   :  Indica em que data a Carteira deve ser Alimentada
//                            | 'E' - na data de efetivo pagamento / recebimento (Baixa)
//                            | 'V' - na data de vencimento
//
//    FLGEXIBELABELCOBR :  Indica se deve ser exibido o label "Gerar Cobrança Automática..." no Contrato
//    FLGOBRIGATIVIDADE :  Indica se é obrigatória a indicação da Atividade do Locatário no Contrato
//    PRAZOAVISO        :  Indica se o prazo de antecedência para aviso das datas contratuais
//                         (para preenchimento automático)
//    FLGSUGERECONTRATO :  Indica se o número do Contrato deve ser sugerido
//    FLGCONCATENAANO   :  Indica se o deve-se concatenar o ano corrente ao número sugerido para o Contrato
//    FLGUSAATIVIDADE   :
//    FLGAUTORESCISAO   :  Indica o comportamento dos Contratos ao se atingir a data de fim
//                            | '0' - prorrogação por tempo indetermindado
//                            | '1' - rescisão automática
//
//    FLGGERATXADMIN    :  Indica se a Taxa de Administração deve ser calculada e gerada quando da Folha de Aluguéis
//    QTDEMESPREVFOLHA  :  Indica se o Sistema integra com Contabilidade
//    FLGMESPOSTERIOR   :  Indica se se deve impedir que a Folha seja executada p/ mês posterior ao atual
//
//    FLGINTEGRAFOLHA   :  (?)
//    FLGINTEGRARECEB   :  (?)
//    FLGINTEGRAPAG     :  (?)
//
//    NOMEVLRAQUISICAO  :  Indica o nome do label "Valor de Aquisição" ao longo do sistema (Desativado)
//
//    FLGREAVALMERCADO  :  (?)
//
//    FLGOBRIGACONTRATO :  Indica se é obrigatório indicar o idContrato nos lançamentos A PAGAR
//    FLGLANCPAGENCERRA :  Indica se é permitido indicar Contratos ENCERRADOS nos lançamentos A PAGAR
//    FLGLANCRECENCERRA :  Indica se é permitido indicar Contratos ENCERRADOS nos lançamentos A RECEBER
//
//    FLGLANCRESCINDIDO :  Indica se é permitido indicar um contrato já rescindido no Lançamento
//    FLGCOMISSAOALT    :  Indica como deve ser lançada a taxa de administração: como alterador ou
//                            | '0' - como alterador do lançamento do aluguel
//                            | '1' - como um lançamento à parte
//    IDTCUSTORECIMOCOM :  Tipo de despesa da Comissão (de acordo com o parâmetro acima)
//    FLGUSAAP          :  Indica se é obrigatório o preenchimento dos campos necessários às APs
//    FLGCONSIDERARESP  :  Indica se se deve levar em conta o responsável por uma despesa quando do lançamento
//    FLGREEMBOLSOAUT   :  Define o que fazer quando se tenta um lançamento de despesa originalmente de
//                         responsabilidade do Locatário
//                            | '0' - não permite o lançamento
//                            | '1' - lança automaticamente o reembolso
//
//    FLGALUGUELZERO    :  Indica se é permitido o cadastro de aluguéis ZERADOS para imóveis e se a Folha
//                         deve fazer essa crítica
//
//    FLGALTERAEVENTO   :  Indica se é permitido a um usuário alterar/excluir eventos "automáticos"
//                         gerados pelo Sistema
//    FLGEVENTOUSUARIO  :  Indica se é permitido a um usuário alterar/excluir eventos não cadastrados
//                         pelo mesmo
//
// -----------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook,
  DBCtrls, IvDictio, IvMulti, IvEMulti, Mask, wwdbedit, Wwdbspin,
  CmEventosCadastro, ImgList;

type
  TfrmParamAdminImob = class(TfrmCadastroCS)
    pgcParametros: TPageControl;
    qryLookUnidNegocio: TwwQuery;
    qryLookCentroRespon: TwwQuery;
    qryLookUnidNegocioUNIDNEGOC: TFloatField;
    qryLookUnidNegocioNOME: TStringField;
    qryLookCentroResponCODCENTRORESPON: TStringField;
    qryLookCentroResponNOME: TStringField;
    qryLookPortadorForma: TwwQuery;
    qryLookPortadorFormaCODPORTFORMA: TFloatField;
    qryLookPortadorFormaDESCRICAO: TStringField;
    qryParamGlobal: TwwQuery;
    qryParamInvest: TwwQuery;
    qryParamInvestVLRCOTAINICART: TFloatField;
    dsParamInvest: TwwDataSource;
    updParamInvest: TUpdateSQL;
    qryParamInvestIDPARAMINVEST: TFloatField;
    qryParamInvestMASCSETOREMISSOR: TStringField;
    qryParamInvestMOEDAATU: TFloatField;
    qryLookPrograma: TwwQuery;
    tbsInvestimento: TTabSheet;
    GroupBox2: TGroupBox;
    DBchkAlimentaAlter: TDBCheckBox;
    DBchkAlimentaDeprec: TDBCheckBox;
    DBrdgAlimentaData: TDBRadioGroup;
    tbsGeral: TTabSheet;
    tbsContratos: TTabSheet;
    Label8: TLabel;
    Label7: TLabel;
    DBrdgAutoRescisao: TDBRadioGroup;
    wwDBSpinEdit1: TwwDBSpinEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    tbsFolha: TTabSheet;
    Label9: TLabel;
    wwDBSpinEdit2: TwwDBSpinEdit;
    DBCheckBox6: TDBCheckBox;
    Label10: TLabel;
    DBCheckBox7: TDBCheckBox;
    Label11: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    DBcboCentroRespon: TwwDBLookupCombo;
    DBcboUnidNegocios: TwwDBLookupCombo;
    DBcboPortadorForma: TwwDBLookupCombo;
    wwDBSpinEdit3: TwwDBSpinEdit;
    DBCheckBox8: TDBCheckBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBcboMoedaAtuarial: TwwDBLookupCombo;
    DBEdit1: TDBEdit;
    DBedtMascaraEmissor: TDBEdit;
    GroupBox4: TGroupBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    qryCODCENTRORESPON: TStringField;
    qryUNIDNEGOC: TFloatField;
    qryCODPORTFORMA: TFloatField;
    qryFLGINTEGRACONTAB: TFloatField;
    qryFLGINTEGRACAPCAR: TFloatField;
    qryFLGINTEGRAGESTAO: TFloatField;
    qryFLGINTEGRAATIVO: TFloatField;
    qryFLGUSASCIMOVEL: TFloatField;
    qryFLGUSASCLOCATARIO: TFloatField;
    qryFLGALIMENTAALTER: TFloatField;
    qryFLGALIMENTADATA: TStringField;
    qryFLGALIMENTADEPREC: TFloatField;
    qryFLGSUGERECONTRATO: TFloatField;
    qryFLGCONCATENAANO: TFloatField;
    qryFLGEXIBELABELCOBR: TFloatField;
    qryPRAZOAVISO: TFloatField;
    qryFLGAUTORESCISAO: TFloatField;
    qryFLGOBRIGATIVIDADE: TFloatField;
    qryFLGINTEGRARECEB: TFloatField;
    qryFLGINTEGRAPAG: TFloatField;
    qryNOMEVLRAQUISICAO: TStringField;
    qryFLGINTEGRAFOLHA: TFloatField;
    qryFLGGERATXADMIN: TFloatField;
    qryQTDEMESPREVFOLHA: TFloatField;
    qryFLGMESPOSTERIOR: TFloatField;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    Label13: TLabel;
    Label12: TLabel;
    DBCheckBox5: TDBCheckBox;
    qryIDPESSOA: TFloatField;
    qryPROXNUMCONTRATO: TFloatField;
    qryFLGVENCDIAUTIL: TFloatField;
    tbsLancamento: TTabSheet;
    qryFLGREAVALMERCADO: TFloatField;
    qryFLGOBRIGACONTRATO: TFloatField;
    qryFLGCOMISSAOALT: TFloatField;
    qryFLGLANCRESCINDIDO: TFloatField;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    Label15: TLabel;
    grpComissao: TGroupBox;
    cboComissaoLanc: TwwDBLookupCombo;
    qryIDTCUSTORECIMOCOM: TFloatField;
    DBchkUsaAP: TDBCheckBox;
    qryFLGUSAAP: TFloatField;
    Label16: TLabel;
    DBrdgComissao: TDBRadioGroup;
    DBcboLookCentroCusto: TwwDBLookupCombo;
    Label17: TLabel;
    DBcboPrograma: TwwDBLookupCombo;
    Label18: TLabel;
    qryCODCENTROCUSTO: TStringField;
    qryIDEMPRESA: TFloatField;
    qryIDPROGRAMA: TFloatField;
    qryLookProgramaIDPROGRAMA: TFloatField;
    qryLookProgramaCODPROGRAMA: TStringField;
    qryLookProgramaDESCPROGRAMA: TStringField;
    Label20: TLabel;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TCheckBox;
    qryFLGREEMBOLSOAUT: TFloatField;
    qryFLGLANCRECENCERRA: TFloatField;
    qryFLGLANCPAGENCERRA: TFloatField;
    DBCheckBox14: TDBCheckBox;
    qryFLGCONSIDERARESP: TFloatField;
    qryFLGALUGUELZERO: TFloatField;
    DBrdgResponsavel: TDBRadioGroup;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBchkDiaUtilAP: TDBCheckBox;
    qryFLGDIAUTILAP: TStringField;
    qryFLGFILTRAREAJUSTE: TFloatField;
    qryFLGFILTRAENCERRA: TFloatField;
    tbsIntegra: TTabSheet;
    CheckBox1: TDBCheckBox;
    CheckBox5: TDBCheckBox;
    CheckBox3: TDBCheckBox;
    CheckBox4: TDBCheckBox;
    GroupBox5: TGroupBox;
    DBCheckBox17: TDBCheckBox;
    qryFLGALTERAEVENTO: TFloatField;
    qryFLGEVENTOUSUARIO: TFloatField;

    // procedimentos definidos
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);

    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);

    procedure Sel(iEmpresaProp: integer);

    procedure PreencheDefaults;
    function VerificaPreenchimento: boolean;

    procedure AbreQueries(i: integer);
    procedure FechaQueries;

    // outros procedimentos
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DBrdgComissaoClick(Sender: TObject);


  private { Private declarations }

  public { Public declarations }

  end;



var
  frmParamAdminImob: TfrmParamAdminImob;



implementation
{$R *.DFM}
Uses
  USistema, UMensErro, UDatabase, DBaseDados, UModulo, UVerificaPreenchimento,
  FPrincipal, uFuncoesImob, dLookImobiliario;



procedure TfrmParamAdminImob.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
	inherited;

	// só permite alteração
   sbtnInserir.Enabled  := False;
   sbtnApagar.Enabled   := False;
   sbtnProcurar.Enabled := False;
   sbtnAlterar.Enabled  := True;
end;



procedure TfrmParamAdminImob.CmeCadastroEdit(Sender: TObject);
begin

   // Investimentos -------------------------------------------------------------------------------------
	// o primeiro Edit na query será um Insert
   if (qryParamInvest.isEmpty) then begin
      qryParamInvest.Insert;
      qryParamInvestIDPARAMINVEST.AsInteger  := LeUltRegistro(nil, 'PARAMINVEST')
   end else begin
      qryParamInvest.Edit;
   end;

   // Imobiliário ---------------------------------------------------------------------------------------
	// o primeiro Edit na query será um Insert
   if (qry.IsEmpty) then begin
      qry.Insert;
      qryIDPESSOA.AsInteger            := Sistema.idEmpresa;
   end else begin
      inherited;
   end;

   // Preenche valores default --------------------------------------------------------------------------
   if qry.State in dsEditModes then PreencheDefaults;
end;



procedure TfrmParamAdminImob.Sel(iEmpresaProp: integer);
begin
	with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      Open;
   end;
end;



procedure TfrmParamAdminImob.CmeCadastroConfirma(Sender: TObject);
begin
   // Obriga alguns valores ------------------------------------------------------------------------------
   if VerificaPreenchimento then begin

      if qry.State in dsEditModes then begin

         qryFLGINTEGRAATIVO.AsInteger      := 1;
         qryFLGINTEGRACONTAB.AsInteger     := 1;
         qryFLGINTEGRACAPCAR.AsInteger     := 1;

         qryFLGALIMENTADEPREC.AsInteger    := 1;
         qryFLGALIMENTAALTER.AsInteger     := 0;
         qryFLGALIMENTADATA.asString       := 'V';

         // Preenche o que ainda tiver sido indicado -------------------------------------------------------
         PreencheDefaults;

         // verifica a empresa do Centro de Custo
         if qryCODCENTROCUSTO.IsNull then begin
            qryIDEMPRESA.Clear;
         end else begin
            qryIDEMPRESA.AsInteger := Sistema.idEmpresa;
         end;

      end;

      qryParamInvest.ApplyUpdates;

      inherited;
   end;
end;



procedure TfrmParamAdminImob.PreencheDefaults;
begin
   if qryFLGINTEGRAATIVO.isNULL     then qryFLGINTEGRAATIVO.AsInteger      := 1;
   if qryFLGINTEGRACONTAB.isNULL    then qryFLGINTEGRACONTAB.AsInteger     := 1;
   if qryFLGINTEGRACAPCAR.isNULL    then qryFLGINTEGRACAPCAR.AsInteger     := 1;

   if qryFLGALIMENTADEPREC.isNULL   then qryFLGALIMENTADEPREC.AsInteger    := 1;
   if qryFLGALIMENTAALTER.isNULL    then qryFLGALIMENTAALTER.AsInteger     := 0;
   if qryFLGALIMENTADATA.isNULL     then qryFLGALIMENTADATA.asString       := 'V';

   if qryFLGUSASCIMOVEL.isNULL      then qryFLGUSASCIMOVEL.AsInteger       := 0;
   if qryFLGUSASCLOCATARIO.isNULL   then qryFLGUSASCLOCATARIO.AsInteger    := 0;

   if qryFLGEXIBELABELCOBR.isNULL   then qryFLGEXIBELABELCOBR.AsInteger    := 1;
   if qryFLGOBRIGATIVIDADE.isNULL   then qryFLGOBRIGATIVIDADE.AsInteger    := 0;
   if qryPRAZOAVISO.isNULL          then qryPRAZOAVISO.AsInteger           := 0;

   if qryFLGSUGERECONTRATO.isNULL   then qryFLGSUGERECONTRATO.AsInteger    := 0;
   if qryFLGCONCATENAANO.isNULL     then qryFLGCONCATENAANO.AsInteger      := 0;
   if qryFLGAUTORESCISAO.isNULL     then qryFLGAUTORESCISAO.AsInteger      := 0;

   if qryFLGGERATXADMIN.isNULL      then qryFLGGERATXADMIN.AsInteger       := 1;
   if qryFLGCOMISSAOALT.isNULL      then qryFLGCOMISSAOALT.AsInteger       := 0;
   if qryQTDEMESPREVFOLHA.isNULL    then qryQTDEMESPREVFOLHA.AsInteger     := 0;
   if qryFLGMESPOSTERIOR.isNULL     then qryFLGMESPOSTERIOR.AsInteger      := 1;
   if qryFLGVENCDIAUTIL.isNULL      then qryFLGVENCDIAUTIL.AsInteger       := 0;

   if qryFLGOBRIGACONTRATO.isNULL   then qryFLGOBRIGACONTRATO.AsInteger    := 1;
   if qryFLGLANCRESCINDIDO.isNULL   then qryFLGLANCRESCINDIDO.AsInteger    := 1;

   if qryFLGALTERAEVENTO.isNULL     then qryFLGALTERAEVENTO.AsInteger      := 0;
   if qryFLGEVENTOUSUARIO.isNULL    then qryFLGEVENTOUSUARIO.AsInteger     := 0;
end;



function TfrmParamAdminImob.VerificaPreenchimento: boolean;
begin
	Result := False;

   // Folha de Aluguéis  ---------------------------------------------------------------------------
	try

      if ( ((qryFLGCOMISSAOALT.isNULL) or (qryFLGCOMISSAOALT.AsInteger = 0)) and (qryIDTCUSTORECIMOCOM.IsNull) ) then
         raise EValidacao.CreateVal('É necessário indicar se a Comissão sobre aluguéis contratuais é um alterador ou, se não for, qual o Tipo de Despesa associada!', grpComissao);

	except

      on ev : EValidacao do begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
			pgcParametros.ActivePage := tbsFolha;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmParamAdminImob.AbreQueries(i: integer);
begin
	with qryLookCentroRespon do begin
      LimpaParametros(qryLookCentroRespon);
      Params[0].AsInteger := i;
      Open;
   end;

	with dtmLookImobiliario.qryLookCentroCusto do begin
      LimpaParametros(dtmLookImobiliario.qryLookCentroCusto);
      Params[0].AsInteger := i;
      Open;
   end;

	with qryLookUnidNegocio do begin
      LimpaParametros(qryLookUnidNegocio);
      Params[0].AsInteger := i;
      Open;
   end;

	with qryLookPortadorForma do begin
      LimpaParametros(qryLookPortadorForma);
      Params[0].AsInteger := i;
      Open;
   end;

   Sel(i);

   LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
   dtmLookImobiliario.qryLookTipoRecDes.ParamByName('PRECCUSTO').AsString := 'C';
   dtmLookImobiliario.qryLookTipoRecDes.Open;

   qryLookPrograma.Open;

   qryParamInvest.Open;
   qryParamInvest.First;
end;



procedure TfrmParamAdminImob.FechaQueries;
var
   i : integer;
begin
   for i := 0 to (ComponentCount - 1) do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;
   end;

	dtmLookImobiliario.qryLookCentroCusto.Close;
end;



procedure TfrmParamAdminImob.FormShow(Sender: TObject);
begin
	inherited;

   pgcParametros.ActivePage := tbsIntegra;

   Application.ProcessMessages;

	// filtra pela Empresa Proprietária
   AbreQueries(Sistema.idEmpresa);

   if qryFLGCOMISSAOALT.AsInteger = 0 then cboComissaoLanc.Enabled := True;
end;



procedure TfrmParamAdminImob.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FechaQueries;

   inherited;

   // chama a procedure AposLogin para atualizar as variáveis do Modulo
   frmPrincipal.AppPadrao.AfterLogin(self);
end;



procedure TfrmParamAdminImob.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   pgcParametros.ActivePage := tbsIntegra;
end;



procedure TfrmParamAdminImob.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   pgcParametros.ActivePage := tbsIntegra;
end;



procedure TfrmParamAdminImob.DBrdgComissaoClick(Sender: TObject);
begin
   if qry.State in dsEditModes then begin
      if qryFLGCOMISSAOALT.AsInteger = 1 then begin
         qryIDTCUSTORECIMOCOM.Clear;
         cboComissaoLanc.Enabled := False;
      end else begin
         cboComissaoLanc.Enabled := True;
      end;
   end;
end;



end.
