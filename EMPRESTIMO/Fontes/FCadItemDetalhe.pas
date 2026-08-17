unit FCadItemDetalhe;
     

// Alterações:
{
--------------------------------------------------------------------------------
Alterações  : (dfm gbTransfPerfil, gbTipoItem, qry)
Pendência   : SIG56660
Responsável : Edilaine
Data        : 22/11/2017
Descrição   : Transfere de Perfil de Investimentos na contabilização de contratos
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
----------------------------------------------------------------------------------------------------
Pendência   : SOL 78818 - Kintana 523335
Responsável : Fernando Santana
Data        : 14/06/2010
Descrição   : Adicionei o componente chkSuspensao
--------------------------------------------------------------------------------------------------
Pendência   : SOL 123125 KINTANA 612563              gusta
Responsável : BRUNO AZEVEDO
Data        : 07/06/2010
Descrição   : Envio de rubricas informativas para a folha de benefícios.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 129014 KINTANA 698559
Responsável : Ádler Souza
Data        : 06/05/2010
Descrição   : Parametrização para itens que terão valores transferidos para o PGA.
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 13/06/2007
Pendencia : 22718
Autor     : Alberto
Descrição : Inclusão da coluna FLGESTORNOPOSQUIT (tabela ITEMXTIPOCONTR) na qry
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 08/05/2006
Pendencia : 20170 e 20500
Autor     : André Pontes
Descrição : Habilitação da conta de baixa mesmo para itens não centralizadores/destacados
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 29/03/2004
Pendencia : 16327
Autor     : Marchetti
Descrição : Criado campo para gravar ordem de impressao
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 29/03/2004
Pendencia : 16335
Autor     : Marchetti
Descrição : Criado campo para gravar se item será impresso na inscricao
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 16/10/2002
Autor     : Marchetti
Descrição : Criado checkbox para FLGGRAVAZERO
---------------------------------------------------------------------------------------------------}

(******************************************
 *  Tratamento quanto ao Saldo Devedor    *
 *           (ITCTRATASALDODEV)           *
 *   0 - Não Tratar                       *
 *   1 - Abater                           *
 *   2 - Incorporar                       *
 ******************************************)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ComCtrls, wwdblook, Mask, Buttons, Db,
  Wwdatsrc, DBTables, Wwquery, ExtCtrls, MAHlpBtn, USistema, UModulo,
  UAutorizacao, UMensErro, CMTree, TB97, DBCtrls, TREdit, FTelaAut,
  wwdbedit, Wwdbspin, UDataBase, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti,DBaseDados, uIntegraBack, mRegra, mRegraDB, fcLabel,
  FOkCancelarImob;

type
  TfrmCadItemDetalhe = class(TFrmOkCancelarImob)
    qry: TwwQuery;
    qryAuxx: TwwQuery;
    pnlRegras: TPanel;
    Bevel2: TBevel;
    rdgTipoItem: TRadioGroup;
    grpIncidencia: TRadioGroup;
    rdgAgrupadoDestacado: TRadioGroup;
    chkCentraliza: TCheckBox;
    grpPeriodicidade: TGroupBox;
    Label7: TLabel;
    lbGrupo: TLabel;
    molRegraCalculo: TmolRegraDB;
    ds: TwwDataSource;
    grpRubricas: TGroupBox;
    Label1: TLabel;
    DBcboRubNormal: TwwDBLookupCombo;
    Label2: TLabel;
    DBcboRubAtraso: TwwDBLookupCombo;
    Label3: TLabel;
    DBcboRubDevolucao: TwwDBLookupCombo;
    pnlCContabilBaixa: TPanel;
    lblCCDebFinan: TLabel;
    btnBuscaContaCBaixa: TBitBtn;
    btnLimpaContaCBaixa: TBitBtn;
    edtContaCBaixa: TMaskEdit;
    rdgNaturezaItem: TRadioGroup;
    rdgTrataSaldoDev: TRadioGroup;
    lblNomeItem: TfcLabel;
    DBspnParcelas: TwwDBSpinEdit;
    DBspnNumPeriodicidade: TwwDBSpinEdit;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    lblSeqCalculo: TLabel;
    Label5: TLabel;
    DBspnSeqCalculo: TwwDBSpinEdit;
    DBspnPrioridade: TwwDBSpinEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBcboRubInformativa: TwwDBLookupCombo;
    pnlGrupoLanc: TPanel;
    Label4: TLabel;
    DBcboGrupoLanc: TwwDBLookupCombo;
    qryITEDESCRICAO: TStringField;
    qryNOMEREGRCALCULO: TStringField;
    qryDESCRUBNORMAL: TStringField;
    qryDESCRUBATRASO: TStringField;
    qryDESCRUBDDEVOL: TStringField;
    qryDESCRUBDESCRUBINFORMATIVA: TStringField;
    qryIDITEMEMPTMO: TFloatField;
    qryIDTIPOCONTREMPTMO: TFloatField;
    qryITCEVENTO: TFloatField;
    qryITCRECPAG: TStringField;
    qryIDREGRADEVOL: TFloatField;
    qryIDREGRADIARIA: TFloatField;
    qryIDREGRACALC: TFloatField;
    qryITCSEQCALCULO: TFloatField;
    qryFLGTEMPORARIO: TFloatField;
    qryFLGCENTRALIZA: TFloatField;
    qryFLGDESTACADO: TFloatField;
    qryCODTIPDOC: TFloatField;
    qryITCNUMVEZES: TFloatField;
    qryITCPERIODICIDADE: TFloatField;
    qryPLANO: TFloatField;
    qryITCPRIORIDADE: TFloatField;
    qryIDPROVENTON: TFloatField;
    qryIDPROVENTOA: TFloatField;
    qryIDPROVENTOD: TFloatField;
    qryIDRUBRICADIFINFO: TFloatField;
    qryTIPCODIGO: TStringField;
    qryITCTRATASALDODEV: TFloatField;
    qryCONTABAIXA: TStringField;
    edtRubNormal: TEdit;
    edtRubAtraso: TEdit;
    edtRubDevol: TEdit;
    edtRubInf: TEdit;
    qryFLGGRAVAZERO: TFloatField;
    chkGravaZeroHist: TCheckBox;
    btnLimpaRubN: TBitBtn;
    btnLimpaRubA: TBitBtn;
    btnLimpaRubD: TBitBtn;
    btnLimpaRubI: TBitBtn;
    edtProvDescN: TEdit;
    edtProvDescA: TEdit;
    edtProvdescD: TEdit;
    edtProvDescI: TEdit;
    Bevel1: TBevel;
    lblSeqImpressao: TLabel;
    spnSeqImpr: TwwDBSpinEdit;
    chkImprimeInsc: TCheckBox;
    qryITCORDEMIMP: TFloatField;
    qryITCITEMIMPRESSO: TFloatField;
    chkNaoContabiliza: TCheckBox;
    qryFLGNAOCONTAB: TFloatField;
    rdgAlteraConcessao: TRadioGroup;
    qryFLGVLRALTERACONC: TFloatField;
    DBspnOrdemExtrato: TwwDBSpinEdit;
    Label10: TLabel;
    qryITCORDEMEXTRATO: TFloatField;
    chkEstornoPosQuit: TCheckBox;
    qryFLGESTORNOPOSQUIT: TFloatField;
    qryFLGESTORNOPOSQUITCEN: TFloatField;
    chkEnviaPga: TCheckBox;
    qryFLGENVIAPGA: TFloatField;
    chkEnviaSusp: TCheckBox;
    qryFLGENVIADIFINFO: TStringField;
    chkSuspensao: TCheckBox;
    qryFLGSUSPENSO: TFloatField;
    Label11: TLabel;
    edtRubInfPgto: TEdit;
    edtProvDescIPgto: TEdit;
    DBcboRubInformativaPgto: TwwDBLookupCombo;
    btnLimpaRubPgto: TBitBtn;
    Label12: TLabel;
    Label13: TLabel;
    qryIDRUBRICADIFINFOFPGTO: TFloatField;
    edtContaCBaixaDebitos: TMaskEdit;
    Label14: TLabel;
    btnBuscaContaCBaixaDebitos: TBitBtn;
    btnLimpaContaCBaixaDebitos: TBitBtn;
    chkContabilizarDebitos: TCheckBox;
    Label15: TLabel;
    qryFLGCONTABILIZAPERDAEFETIVA: TFloatField;
    qryCONTARESULTADO: TStringField;
    gbTransfPerfil: TGroupBox;
    cbEntraTransf: TCheckBox;
    cbSaiTransf: TCheckBox;
    gbTipoItem: TGroupBox;
    cbSaldoDev: TCheckBox;
    cbSaldoVence: TCheckBox;
    cbProvisao: TCheckBox;
    qryFLGTRANSPERFIL: TStringField;
    qryFLGTIPOITEM: TFloatField;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdgTipoItemClick(Sender: TObject);
    procedure grpIncidenciaClick(Sender: TObject);
    procedure dbcoPeriodicidadeCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure bbtnSairClick(Sender: TObject);
    procedure rdgAgrupadoDestacadoClick(Sender: TObject);
    procedure molRegraCalculobtnBuscaRegraClick(Sender: TObject);
    procedure molRegraCalculobtnLimpaRegraClick(Sender: TObject);
    procedure btnLimpaContaCBaixaClick(Sender: TObject);
    procedure btnBuscaContaCBaixaClick(Sender: TObject);
    procedure chkCentralizaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rdgNaturezaItemClick(Sender: TObject);
    procedure DBcboRubNormalChange(Sender: TObject);
    procedure DBcboRubAtrasoChange(Sender: TObject);
    procedure DBcboRubDevolucaoChange(Sender: TObject);
    procedure DBcboRubInformativaChange(Sender: TObject);
    procedure btnLimpaRubNClick(Sender: TObject);
    procedure btnLimpaRubAClick(Sender: TObject);
    procedure btnLimpaRubDClick(Sender: TObject);
    procedure btnLimpaRubIClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkEnviaSuspClick(Sender: TObject);
    procedure DBcboRubInformativaPgtoChange(Sender: TObject);
    procedure btnLimpaRubPgtoClick(Sender: TObject);
    procedure btnBuscaContaCBaixaDebitosClick(Sender: TObject);
    procedure btnLimpaContaCBaixaDebitosClick(Sender: TObject);
    procedure cbEntraTransfClick(Sender: TObject);
    procedure cbSaiTransfClick(Sender: TObject);
    procedure cbSaldoDevClick(Sender: TObject);
    procedure cbSaldoVenceClick(Sender: TObject);
    procedure cbProvisaoClick(Sender: TObject);


  private { Private declarations }

    FCodItemRC     : Integer;
    FIdTipContrato : Integer;
    FItem          : String;
    FPlano, FPlanoD : Int64;

    function VerificaPreenchimento: Boolean;
    procedure FiltraRubricas;

    function TestaTotalGrupo(iCodItemRC, iIdTipContrato, iFlgCobraLib: Int64): Boolean;
    function TestaPrior : Boolean;
    function TestaSeqImpressao : Boolean;

    procedure ContaBaixa;
    procedure GrupoLanc;
    procedure Rubricas;

    procedure HabilitaTipoItemTransf;    //edilaine - SIG56660

    // Pendência 22718 - 13/06/2007 - Alberto
    procedure GravaFLGESTORNOPOSQUIT;
    Function RetornaFlagPerda(vFlag : Boolean): String;

  public { Public declarations }

    property CodItemRC     : Integer read FCodItemRC write FCodItemRC;
    property IdTipContrato : Integer read FIdTipContrato write FIdTipContrato;
    property Item          : String read FItem write FItem;


  end;

var
  frmCadItemDetalhe: TfrmCadItemDetalhe;

implementation
{$R *.DFM}
uses
   FPrincipal, DLookEmptmo, UFuncoesEmptmo, FCadItemxTipoContrato, dMS, uVerificaPreenchimento,
  dEmptmo;


Function TfrmCadItemDetalhe.RetornaFlagPerda(vFlag : Boolean): String;
Begin
if vFlag  = True Then
   Result:= '1'
else
   Result:= '0';
end;

function TfrmCadItemDetalhe.VerificaPreenchimento: Boolean;
begin
   Result := False;
   try
		// Regra de Cálculo
      if (molRegraCalculo.iRegra < 0) then
         raise EValidacao.CreateVal('É necessário indicar a Regra de Cálculo do Item!', molRegraCalculo.btnBuscaRegra);

		// Grupo de Lançamento
      if trim(DBcboGrupoLanc.Text) = EmptyStr then
         raise EValidacao.CreateVal('É necessário indicar o Grupo de Lançamento!', DBcboGrupoLanc);

		// Tipo de Item
      if (rdgTipoItem.ItemIndex = -1) then
      begin
         raise EValidacao.CreateVal('É necessário indicar o Tipo do Item!', rdgTipoItem);
      end
      else if (rdgTipoItem.ItemIndex = 1) and (grpIncidencia.ItemIndex = -1) then
      begin
         raise EValidacao.CreateVal('É necessário indicar a Incidência da Cobrança!', grpIncidencia);
      end;

		// Periodicidade
      if ((grpIncidencia.ItemIndex = 1) and (DBspnParcelas.Value = 0)) then
         raise EValidacao.CreateVal('É necessário indicar a Periodicidade!', DBspnParcelas);

		// Agrupado / Destacado
      if (rdgAgrupadoDestacado.ItemIndex = -1) then
         raise EValidacao.CreateVal('É necessário indicar a Forma de Cobrança do Item!', rdgAgrupadoDestacado);

      if rdgAlteraConcessao.ItemIndex = -1 then
         raise EValidacao.CreateVal('É necessário indicar a forma de cálculo do valor do item na Alteração de Concessão!', rdgAlteraConcessao);

		// Natureza
      if (rdgNaturezaItem.ItemIndex = -1) then
         raise EValidacao.CreateVal('É necessário indicar a Natureza do Item!', rdgNaturezaItem);

		// Trata Saldo Devedor
      if (rdgTrataSaldoDev.ItemIndex = -1) then
         raise EValidacao.CreateVal('É necessário indicar a forma de Tratamento quanto ao Saldo Devedor!', rdgTrataSaldoDev);

		if ( (chkCentraliza.Checked) or (rdgAgrupadoDestacado.ItemIndex = 1) ) and (rdgTipoItem.ItemIndex <> 5)  then
   	   if trim(edtContaCBaixa.Text) = EmptyStr then
      	   raise EValidacao.CreateVal('É necessário indicar a Conta Contábil de Baixa!', edtContaCBaixa);

      // Rubricas
      if ( (chkCentraliza.Checked) or (rdgAgrupadoDestacado.ItemIndex = 1)) and (rdgTipoItem.ItemIndex <> 5) then begin

         if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 0) or
            ((dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and (rdgTipoItem.ItemIndex > 0)) then
         begin

            if trim(DBcboRubNormal.LookupValue) = EmptyStr then
               raise EValidacao.CreateVal('É necessário indicar a Rubrica Normal!', DBcboRubNormal);

            if trim(DBcboRubDevolucao.LookupValue) = EmptyStr then
      	       raise EValidacao.CreateVal('É necessário indicar a Rubrica de Devolução!', DBcboRubDevolucao);
         end;

      end;

      if (chkEnviaSusp.Checked) and ((trim(DBcboRubInformativa.LookupValue) = EmptyStr) and (trim(DBcboRubInformativaPgto.LookupValue) = EmptyStr)) then
        raise EValidacao.CreateVal('É necessário indicar a Rubrica Informativa da folha de pagamento ou folha de benefício!', DBcboRubInformativa);

   except

      on ev : EValidacao do begin
	 if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
 	 Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;

procedure TfrmCadItemDetalhe.FiltraRubricas;
begin
   if rdgNaturezaItem.ItemIndex > -1 then
   begin
      // Normal
      with dtmLookEmptmo.qryLookRubricaNormal do
      begin
         LimpaParametros(dtmLookEmptmo.qryLookRubricaNormal);
         ParamByName('PFLGDESCONTO').AsInteger := rdgNaturezaItem.ItemIndex;
         Open;
      end;

      // Atraso
      with dtmLookEmptmo.qryLookRubricaAtraso do
      begin
         LimpaParametros(dtmLookEmptmo.qryLookRubricaAtraso);
         ParamByName('PFLGDESCONTO').AsInteger := rdgNaturezaItem.ItemIndex;
         Open;
      end;
   end;

	// Devolução
   dtmLookEmptmo.qryLookRubricaDevol.Close;
   dtmLookEmptmo.qryLookRubricaDevol.Open;

	// Informação
   dtmLookEmptmo.qryLookRubricaInforma.Close;
   dtmLookEmptmo.qryLookRubricaInforma.Open;

   // Informativas
   dtmLookEmptmo.qryLookRubricaInfEmprestimo.Close;
   dtmLookEmptmo.qryLookRubricaInfEmprestimo.Open;

   dtmLookEmptmo.qryLookRubricaInfEmprestimo2.close;
   dtmLookEmptmo.qryLookRubricaInfEmprestimo2.Open;

   ParametrosSistema;
   if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and
      (rdgTipoItem.ItemIndex = 4) and
      (dtmEmptmo.qryParamEmptmoIDITEMSEGESPECIAL.AsInteger <> qryIDITEMEMPTMO.AsInteger) then
   begin
      DBcboRubNormal.LookupTable := dtmLookEmptmo.qryLookRubricaAtraso;
   end;

   if trim(qryIDPROVENTON.AsString) <> EmptyStr then
   begin
      DBcboRubNormal.LookupValue   := trim(qryIDPROVENTON.AsString);
   end
   else
   begin
      DBcboRubNormal.Clear;
   end;

   if trim(qryIDPROVENTOA.AsString) <> EmptyStr then
   begin
      DBcboRubAtraso.LookupValue  := trim(qryIDPROVENTOA.AsString);
   end
   else
   begin
      DBcboRubAtraso.Clear;
   end;

   if trim(qryIDPROVENTOD.AsString) <> EmptyStr then
   begin
      DBcboRubDevolucao.LookupValue  := trim(qryIDPROVENTOD.AsString);
   end
   else
   begin
      DBcboRubDevolucao.Clear;
   end;

   if trim(qryIDRUBRICADIFINFO.AsString) <> EmptyStr then
   begin
      DBcboRubInformativa.LookupValue  := trim(qryIDRUBRICADIFINFO.AsString);
   end
   else
   begin
      DBcboRubInformativa.Clear;
   end;

   if trim(qryIDRUBRICADIFINFOFPGTO.AsString) <> EmptyStr then
     begin
      DBcboRubInformativaPgto.LookupValue  := trim(qryIDRUBRICADIFINFOFPGTO.asstring);
   end
   else
   begin
      DBcboRubInformativaPgto.Clear;
   end;
end;

function TfrmCadItemDetalhe.TestaPrior : Boolean;
var
   sSQL : String;
begin
   if (DBspnSeqCalculo.Value = 0) then
   begin
      MsgDlg('A Sequência de Cálculo deve ser definida.','Empréstimo',mtInformation,[mbOK],0);
      Repaint;
      Result := False;
      Exit;
   end;

   sSQL :=
   'SELECT '                  + #13 +
   '  ITCSEQCALCULO '         + #13 +
   'FROM '                    + #13 +
   '  ITEMXTIPOCONTR '        + #13 +
   'WHERE '                   + #13 +
   '      IDTIPOCONTREMPTMO   = ' + IntToStr(FIdTipContrato)            + #13 +
   '  AND ITCEVENTO           = ' + IntToStr(rdgTipoItem.ItemIndex)     + #13 +
   '  AND ITCSEQCALCULO       = ' + FloatToStr(DBspnSeqCalculo.Value);

   qryAuxx.SQL.Clear;
   qryAuxx.SQL.Text := sSQL;
   qryAuxx.Open;

   if not(qryAuxx.IsEmpty) then
   begin
      if qryITCSEQCALCULO.AsInteger <> DBspnSeqCalculo.Value then
      begin
         MsgDlg('Já existe item com esta SEQUÊNCIA DE CÁLCULO e' + #13 +
                'com a Forma de Recebimento/Pagamento :'         + #13 +
                rdgTipoItem.Items[rdgTipoItem.ItemIndex],
                'Empréstimo', mtError, [mbOK], 0);
         Repaint;
         Result := False;
      end
      else
      begin
         Result := True;
      end;
   end
   else
   begin
      Result := True;
   end;
end;

procedure TfrmCadItemDetalhe.ContaBaixa;
begin
   if trim(qryCONTABAIXA.AsString) <> EmptyStr then
   begin
      edtContaCBaixa.Text := trim(qryCONTABAIXA.AsString);
   end
   else
   begin
      edtContaCBaixa.Clear;
   end;
end;

procedure TfrmCadItemDetalhe.GrupoLanc;
begin
   AtualizaConjunto(True, pnlGrupoLanc);

   if trim(qryTIPCODIGO.AsString) <> EmptyStr then
      begin
      DBcboGrupoLanc.LookupValue := trim(qryTIPCODIGO.AsString);
   end else begin
      DBcboGrupoLanc.Clear;
   end;
end;

procedure TfrmCadItemDetalhe.Rubricas;
begin
   if ( (chkCentraliza.Checked) or (rdgAgrupadoDestacado.ItemIndex = 1) ) then
      begin
       AtualizaConjunto(True, grpRubricas);
   end else begin
      AtualizaConjunto(False, grpRubricas);
   end;

   FiltraRubricas;
end;

procedure TfrmCadItemDetalhe.FormActivate(Sender: TObject);
begin
   inherited;

   frmCadItemxTipoContrato.bConfirmou := False;

   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDITEMEMPTMO').AsInteger      := FCodItemRC;
      ParamByName('PIDTIPOCONTREMPTMO').AsInteger := FIdTipContrato;
      Open;
   end;

   with dtmLookEmptmo.qryLookTipOper do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipOper);
      Open;
   end;

   // função que exibe as rubricas de acordo com o RecPag
   FiltraRubricas;

   rdgTipoItem.ItemIndex    := qryITCEVENTO.AsInteger;
   chkGravaZeroHist.Checked := (qryFLGGRAVAZERO.AsInteger = 1);

   if (rdgTipoItem.ItemIndex = 1) then
   begin
      grpIncidencia.Enabled := True;   (* É parcela -> 1 *)
   end
   else
   begin
      grpIncidencia.Enabled := False;  (* NÃO É parcela *)
   end;

   // Procedimento que verifica nos itens de um Tipo de Contrato se já existe algum
   //   que é o Total do Grupo e Habilita/Desabilita o CheckBox correspondente.
   TestaTotalGrupo(FCodItemRC, FIdTipContrato, rdgTipoItem.ItemIndex);

   if trim(qryIDREGRACALC.AsString) <> EmptyStr then
   begin
      molRegraCalculo.iRegra              := qryIDREGRACALC.AsInteger;
      molRegraCalculo.DBedtIDRegra.Text   := IntToStr(qryIDREGRACALC.AsInteger);
      molRegraCalculo.sRegra              := trim(qryNOMEREGRCALCULO.AsString);
      molRegraCalculo.DBedtRegra.Text     := trim(qryNOMEREGRCALCULO.AsString);
   end
   else
   begin
      molRegraCalculo.iRegra              := -1;
      molRegraCalculo.DBedtIDRegra.Text   := '';
      molRegraCalculo.sRegra              := '';
      molRegraCalculo.DBedtRegra.Text     := '';
   end;

   if trim(qryTIPCODIGO.AsString) <> EmptyStr then
   begin
      DBcboGrupoLanc.LookupValue := trim(qryTIPCODIGO.AsString)
   end
   else
   begin
      DBcboGrupoLanc.Clear;
   end;

   grpIncidencia.ItemIndex := qryFLGTEMPORARIO.AsInteger;

   if grpIncidencia.ItemIndex = 0 then
   begin
      // Todas

      // Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
      //   Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
      //   e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox
      AtualizaConjunto(False, grpPeriodicidade)
   end
   else
   begin
      // Parcial
      AtualizaConjunto(True, grpPeriodicidade);
   end;

   if trim(qryFLGDESTACADO.AsString) <> EmptyStr then
   begin
      rdgAgrupadoDestacado.ItemIndex := qryFLGDESTACADO.AsInteger;
   end
   else
   begin
      rdgAgrupadoDestacado.ItemIndex := 1;
   end;  // if qryFLGDESTACADO

   rdgAlteraConcessao.ItemIndex  := qryFLGVLRALTERACONC.AsInteger;
   rdgTrataSaldoDev.ItemIndex    := qryITCTRATASALDODEV.AsInteger;

   if trim(qryCONTABAIXA.AsString) <> EmptyStr then
   begin
      FPlano               := qryPLANO.AsInteger;
      edtContaCBaixa.Text  := trim(qryCONTABAIXA.AsString);
   end
   else
   begin
      FPlano               := -1;
      edtContaCBaixa.Clear;
   end;

   case qryFLGNAOCONTAB.AsInteger of
      0: chkNaoContabiliza.Checked := False;
      1: chkNaoContabiliza.Checked := True;
   end;


   // A FUNÇÃO PODERÁ SER COLOCADA AQUI  - ALEX  20/09/2013  -  Sol numero SOL 213592  -  Kintana nº 2040335.
   if trim(qryCONTARESULTADO.AsString) <> EmptyStr then
   begin
      FPlanoD               := qryPLANO.AsInteger;
      edtContaCBaixaDebitos.Text  := trim(qryCONTARESULTADO.AsString);
   end
   else
   begin
      FPlanoD               := -1;
      edtContaCBaixaDebitos.Clear;
   end;

   case qryFLGCONTABILIZAPERDAEFETIVA.AsInteger of
      0: chkContabilizarDebitos.Checked := False;
      1: chkContabilizarDebitos.Checked := True;
   end;


   //Ádler Souza - SOL 129014 Kintana 698559
   case qryFLGENVIAPGA.AsInteger of
      0: chkEnviaPga.Checked := False;
      1: chkEnviaPga.Checked := True;
   end;
   //Fim - Ádler Souza - SOL 129014 Kintana 698559

   //Fernando Santana - SOL 129014 Kintana 698559
   case qryFlgsuspenso.AsInteger of
      0: chkSuspensao.Checked := False;
      1: chkSuspensao.Checked := True;
   end;
   //Fernando Santana- SOL 78818 Kintana 523335

   //edilaine - SIG56660 - inicio
   if qryFLGTRANSPERFIL.AsString = 'E' then
      cbEntraTransf.Checked := True
   else if qryFLGTRANSPERFIL.AsString = 'S' then
      cbSaiTransf.Checked  := True;

   case qryFLGTIPOITEM.AsInteger of
     1 : cbSaldoDev.Checked   := True;
     2 : cbSaldoVence.Checked := True;
     3 : cbProvisao.Checked   := True;
   end;
   //edilaine - SIG56660 - inicio

   chkEnviaSusp.Checked    := (qryFLGENVIADIFINFO.AsString = '1');

   //Pendência 22718 - 13/06/2007

   if trim(qryITCSEQCALCULO.AsString) <> EmptyStr then
      DBspnSeqCalculo.Value     := qryITCSEQCALCULO.AsInteger
   else
      DBspnSeqCalculo.Value := 0;

   if trim(qryITCORDEMEXTRATO.AsString) <> EmptyStr then
      DBspnOrdemExtrato.Value := qryITCORDEMEXTRATO.AsInteger
   else
      DBspnOrdemExtrato.Value := 0;

   if trim(qryITCPRIORIDADE.AsString) <> EmptyStr then
      DBspnPrioridade.Value     := qryITCPRIORIDADE.AsInteger
   else
      DBspnPrioridade.Value := 1;

   if trim(qryITCPERIODICIDADE.AsString) <> EmptyStr then
      DBspnParcelas.Value    := qryITCPERIODICIDADE.AsInteger
   else
   DBspnParcelas.Value := 0;

   if trim(qryITCNUMVEZES.AsString) <> EmptyStr then
      DBspnNumPeriodicidade.Value := qryITCNUMVEZES.AsInteger
   else
      DBspnNumPeriodicidade.Value := 0;

   spnSeqImpr.Value := qryITCORDEMIMP.AsInteger;

   chkImprimeInsc.Checked := (qryITCITEMIMPRESSO.AsInteger = 1);

   TestaTotalGrupo(FCodItemRC, FIdTipContrato, rdgTipoItem.ItemIndex);
end;

procedure TfrmCadItemDetalhe.FormShow(Sender: TObject);
begin
   ParametrosSistema;

   Application.ProcessMessages;
   Repaint;

   inherited;

   frmCadItemxTipoContrato.Caption  := 'Itens por Tipo de Contrato - Detalhes';
   lblNomeItem.Caption              := FItem;

   lblSeqImpressao.Visible := not(dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1);
   spnSeqImpr.Visible      := not(dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1);
   chkImprimeInsc.Visible  := not(dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1);
end;

function TfrmCadItemDetalhe.TestaTotalGrupo(iCodItemRC, iIdTipContrato, iFlgCobraLib: Int64): Boolean;
var
   sSQL: String;
begin
   if (iFlgCobraLib < 0) then
   begin
      // Usuário ainda não escolheu a Forma de Recebimento/Pagamento
      MsgDlg('É necessário definir a Forma de Recebimento/Pagamento.', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      rdgAgrupadoDestacado.ItemIndex := -1;
      Exit;
   end;

   // Pendência 22718 - 11/09/2007
   chkEstornoPosQuit.Checked := False;
   chkEstornoPosQuit.Enabled := (ChkCentraliza.Checked or (qryFLGESTORNOPOSQUITCEN.AsInteger = 1));

   // ----------------------------------------------------------------------------------------------

   if (rdgAgrupadoDestacado.ItemIndex = 0) then
   begin
      // 1º - verifica se já há algum item centralizador para o grupo
      sSQL :=
      'SELECT '                                                   + #13 +
      '  FLGCENTRALIZA, IDITEMEMPTMO, ITCRECPAG '                 + #13 +
      'FROM '                                                     + #13 +
      '  ITEMXTIPOCONTR '                                         + #13 +
      'WHERE '                                                    + #13 +
      '      IDTIPOCONTREMPTMO   = ' + IntToStr(iIdTipContrato)   + #13 +
      '  AND ITCEVENTO           = ' + IntToStr(iFlgCobraLib)     + #13 +
      '  AND IDITEMEMPTMO       <> ' + IntToStr(iCodItemRC)       + #13 +
      '  AND FLGCENTRALIZA       = 1 '                            + #13;

      qryAuxx.Close;
      qryAuxx.SQL.Clear;
      qryAuxx.SQL.Text := sSQL;
      qryAuxx.Open;

      if not(qryAuxx.IsEmpty) then
      begin
         // Já existe algum item que é Total do Grupo para o Tipo de Contrato

         ChkCentraliza.Checked := False;
         ChkCentraliza.Enabled := False;

         // combina o RecPag com o do Item centralizador
         if qryAuxx.FieldByName('ITCRECPAG').AsString = 'P' then
         begin
            rdgNaturezaItem.ItemIndex := 0;
         end
         else
         begin
            rdgNaturezaItem.ItemIndex := 1;
         end;
      end
      else
      begin
         // Não existe ainda nenhum item que é Total do Grupo para o Tipo de Contrato:
         // O item em tela será o Total do Grupo

         ChkCentraliza.Checked := True;
         ChkCentraliza.Enabled := False; (* é o primeiro, deve ser o centralizador *)
      end;
   end;

   // ----------------------------------------------------------------------------------------------

   if (rdgAgrupadoDestacado.ItemIndex = 1) then
   begin
      // 2º - verifica se já há algum item "filho" no grupo - SEM QUE HAJA ALGUM PAI
      sSQL :=
      'SELECT '                                                   + #13 +
      '  FLGCENTRALIZA, IDITEMEMPTMO, ITCRECPAG '                 + #13 +
      'FROM '                                                     + #13 +
      '  ITEMXTIPOCONTR '                                         + #13 +
      'WHERE '                                                    + #13 +
      '      IDTIPOCONTREMPTMO   = ' + IntToStr(iIdTipContrato)   + #13 +
      '  AND ITCEVENTO           = ' + IntToStr(iFlgCobraLib)     + #13 +
      '  AND FLGCENTRALIZA       = 0 '                            + #13 +
      '  AND FLGDESTACADO        = 0 '                            + #13 +
      '  AND NOT EXISTS '                                         + #13 +
      '  ( '                                                      + #13 +
      '  SELECT '                                                 + #13 +
      '    FLGCENTRALIZA, IDITEMEMPTMO, ITCRECPAG '               + #13 +
      '  FROM '                                                   + #13 +
      '    ITEMXTIPOCONTR '                                       + #13 +
      '  WHERE '                                                  + #13 +
      '        IDTIPOCONTREMPTMO   = ' + IntToStr(iIdTipContrato) + #13 +
      '    AND ITCEVENTO           = ' + IntToStr(iFlgCobraLib)   + #13 +
      '    AND IDITEMEMPTMO       <> ' + IntToStr(iCodItemRC)     + #13 +
      '    AND FLGCENTRALIZA       = 1 '                          + #13 +
      '  ) ';

      qryAuxx.Close;
      qryAuxx.SQL.Clear;
      qryAuxx.SQL.Text := sSQL;
      qryAuxx.Open;

      if not(qryAuxx.IsEmpty) then
      begin
         // Existe algum item que já é "filho" desse
         MsgDlg('Já há outros Itens nesse grupo. Não é possível alterar a Forma de cobrança deste Item.',
                'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         // retorna a "agrupado"
         rdgAgrupadoDestacado.ItemIndex := 0;

         ChkCentraliza.Checked := True;
         ChkCentraliza.Enabled := False;
      end
      else
      begin
         ChkCentraliza.Checked := False;
         ChkCentraliza.Enabled := False;

         // Pendência 22718 - 11/09/2007
         chkEstornoPosQuit.Enabled := true;
      end;
   end;
   // ----------------------------------------------------------------------------------------------

   // Pendência 22718 - 11/09/2007
   if chkEstornoPosQuit.Enabled and (qryFLGESTORNOPOSQUIT.AsInteger = 1) then
      chkEstornoPosQuit.Checked := True;
end;

procedure TfrmCadItemDetalhe.bbtnConfirmarClick(Sender: TObject);
var
   sSQL     : String;
   sCCBaixa : String;
   sCCPerda    : String;
   ckPerdaEfet : Boolean;
begin
   frmCadItemxTipoContrato.bConfirmou := False;

   if not(VerificaPreenchimento) then
   begin
		ModalResult := mrNone;
      Exit;
   end;

   if not(TestaPrior) then
   begin
      if DBspnSeqCalculo.CanFocus then
         DBspnSeqCalculo.SetFocus;
      ModalResult := mrNone;
      Exit;
   end;

   sSQL :=
      'UPDATE '            + #13 +
      '  ITEMXTIPOCONTR '  + #13 +
      'SET '               + #13;

   if trim(molRegraCalculo.sRegra) <> EmptyStr then
      begin
      sSQL := sSQL +
      '  IDREGRACALC             = ' + IntToStr(molRegraCalculo.iRegra)             + ', ' + #13;
   end else begin
      sSQL := sSQL +
      '  IDREGRACALC             = NULL'                                            + ', ' + #13;
   end;

   if grpIncidencia.ItemIndex <= 0 then
      begin
      sSQL := sSQL +
      '  FLGTEMPORARIO           = 0'                                               + ', ' + #13 +
      '  ITCPERIODICIDADE        = NULL'                                            + ', ' + #13 +
      '  ITCNUMVEZES             = NULL'                                            + ', ' + #13;
   end else begin
      sSQL := sSQL +
      '  FLGTEMPORARIO           = ' + IntToStr(grpIncidencia.ItemIndex)            + ', ' + #13;

      if (DBspnParcelas.Value > 0) then
      sSQL := sSQL +
      '  ITCPERIODICIDADE        = ' + trim(DBspnParcelas.Text)                    + ', ' + #13;

      sSQL := sSQL +
      '  ITCNUMVEZES             = ' + trim(DBspnNumPeriodicidade.Text)            + ', ' + #13;
   end;

   // Pendencia 16327 - Gravar ordem de impressão
   if (spnSeqImpr.Value > 0) then
      sSQL := sSQL +
      '  ITCORDEMIMP             = ' + trim(spnSeqImpr.Text)                       + ', ' + #13;

   // Pendencia 16335 - Identificar se item vai ser impresso na inscrição
   if chkImprimeInsc.Checked then
      begin
      sSQL := sSQL +
      '  ITCITEMIMPRESSO         = 1'                                               + ', ' + #13;
   end else begin
      sSQL := sSQL +
      '  ITCITEMIMPRESSO         = 0'                                               + ', ' + #13;
   end;

   if chkGravaZeroHist.Checked then
      begin
      sSQL := sSQL +
      '  FLGGRAVAZERO           = 1'                                               + ', ' + #13;
   end else begin
      sSQL := sSQL +
      '  FLGGRAVAZERO           = 0'                                               + ', ' + #13;
   end;

   if ChkCentraliza.Checked then
      begin
      sSQL := sSQL +
      '  FLGCENTRALIZA           = 1'                                               + ', ' + #13;
   end else begin
      sSQL := sSQL +
      '  FLGCENTRALIZA           = 0'                                               + ', ' + #13;
   end;

   sSQL := sSQL +
      '  FLGDESTACADO            = ' + IntToStr(rdgAgrupadoDestacado.ItemIndex)     + ', ' + #13 +
      '  FLGVLRALTERACONC        = ' + IntToStr(rdgAlteraConcessao.ItemIndex)       + ', ' + #13;

   if (rdgTrataSaldoDev.ItemIndex >= 0) then
      sSQL := sSQL +
      '  ITCTRATASALDODEV        = ' + IntToStr(rdgTrataSaldoDev.ItemIndex)         + ', ' + #13;

   if (rdgNaturezaItem.ItemIndex = 0) then
       begin
      sSQL := sSQL +
      '  ITCRECPAG               = ' + QuotedStr('P')                               + ', ' + #13;
   end else begin
      sSQL := sSQL +
      '  ITCRECPAG               = ' + QuotedStr('R')                               + ', ' + #13;
   end;

   // ----------------------------------------------------------------------------------------------
   // André Pontes - 08/05/2006 - pendências 20170 e 20500
   // Alterado em função dos itens que precisam ser enviados nos processos paralelos (ItemXProcessoEP)

   // Conta de Baixa
   // Pendência 22718 - 13/06/2007 - Alberto
   sCCBaixa    := CompletaFim(trim(edtContaCBaixa.Text), ' ', 18);
   sCCPerda    := trim(CompletaFim(trim(edtContaCBaixaDebitos.Text), ' ', 18));
   ckPerdaEfet := chkContabilizarDebitos.Checked;

   if length(trim(sCCBaixa)) > 0 then
   begin
      sSQL := sSQL +
      '  CONTABAIXA              = ' + QuotedStr(sCCBaixa)                          + ', ' + #13 +
      '  PLANO                   = ' + IntToStr(FPlano)                             + ', ' + #13;
   end else begin
      sSQL := sSQL +
      '  CONTABAIXA              = NULL'                                            + ', ' + #13 +
      '  PLANO                   = NULL'                                            + ', ' + #13;
   end;

   // FIM André Pontes - 08/05/2006 - pendências 20170 e 20500
   // ----------------------------------------------------------------------------------------------
     // Perdas Alex Moraes - 25/09/2013
      if length(trim(sCCPerda)) > 0 then
   begin
      sSQL := sSQL +
      '  CONTARESULTADO          = ' + QuotedStr(sCCPerda)                          + ', ' + #13;
   end else begin
      sSQL := sSQL +
      '  CONTARESULTADO          = NULL'                                            + ', ' + #13;
   end;

   if ckPerdaEfet  Then
    begin
      sSQL := sSQL +
      '  FLGCONTABILIZAPERDAEFETIVA   = ' + RetornaFlagPerda(ckPerdaEfet)  + ', ' + #13;
   end;

   if trim(DBcboGrupoLanc.Text) <> EmptyStr then
      sSQL := sSQL +
      '  TIPCODIGO               = ' + QuotedStr(DBcboGrupoLanc.LookupValue)        + ', ' + #13;

   if chkNaoContabiliza.Checked then
   begin
   sSQL := sSQL +
      '  FLGNAOCONTAB            = 1, '                                                    + #13;
   end
   else
   begin
   sSQL := sSQL +
      '  FLGNAOCONTAB            = NULL, '                                                 + #13;
   end;

   //Ádler Souza - SOL 129014 Kintana 698559
   if chkEnviaPga.Checked then
   begin
   sSQL := sSQL +
      '  FLGENVIAPGA            = 1, '                                                    + #13;
   end
   else
   begin
   sSQL := sSQL +
      '  FLGENVIAPGA            = NULL, '                                                 + #13;
   end;
   //Fim - Ádler Souza - SOL 129014 Kintana 698559

   //Fernando Santana - SOL 523335 Kintana 78818
   if chkSuspensao.Checked then
   begin
   sSQL := sSQL +
      '  FLGSUSPENSO            = 1, '                                                    + #13;
   end
   else
   begin
   sSQL := sSQL +
      '  FLGSUSPENSO            = 0,    '                                                 + #13;
   end;
   //Fim - Fernando Santana - SOL 523335 Kintana 698559

    //Pendência 22718 - 13/06/2007
   if chkEstornoPosQuit.Checked then
   begin
   sSQL := sSQL +
      '  FLGESTORNOPOSQUIT       = 1, '                                                 + #13;
   end
   else
   begin
   sSQL := sSQL +
      '  FLGESTORNOPOSQUIT       = NULL, '                                              + #13;
   end;
   //Fim Pendência 22718

   if trim(edtRubNormal.Text) <> EmptyStr then
      begin
      sSQL := sSQL +
      '  IDPROVENTON             = ' + trim(edtRubNormal.Text)                      + ', ' + #13;

   end else begin
      sSQL := sSQL +
      '  IDPROVENTON             = NULL'                                            + ', ' + #13;
   end;

   if trim(edtRubAtraso.Text) <> EmptyStr then
      begin
      sSQL := sSQL +
      '  IDPROVENTOA             = ' + trim(edtRubAtraso.Text)                     + ', ' + #13;
   end else begin
      sSQL := sSQL +
      '  IDPROVENTOA             = NULL'                                            + ', ' + #13;
   end;

   if trim(edtRubDevol.Text) <> EmptyStr then
      begin
      sSQL := sSQL +
      '  IDPROVENTOD             = ' + trim(edtRubDevol.Text)                      + ', ' + #13;
   end else begin
      sSQL := sSQL +
      '  IDPROVENTOD             = NULL'                                            + ', ' + #13;
   end;

   if trim(edtRubInf.Text) <> EmptyStr then
      begin
      sSQL := sSQL +
      '  IDRUBRICADIFINFO             = ' + trim(edtRubInf.Text)                   + ', ' + #13;
   end else begin
      sSQL := sSQL +
      '  IDRUBRICADIFINFO             = NULL'                                      + ', ' + #13;
   end;

   //Fernando Santana
   if trim(edtRubInfPgto.Text) <> EmptyStr then
      begin
      sSQL := sSQL +
      '  IDRUBRICADIFINFOFPGTO        = ' + trim(edtRubInfPgto.Text)         + ', ' + #13;
   end else begin
      sSQL := sSQL +
      '  IDRUBRICADIFINFOFPGTO        = NULL'                                + ', ' + #13;
   end;
   // Fim

   if chkEnviaSusp.Checked then
      begin
     sSQL := sSQL + '  FLGENVIADIFINFO = 1, '    + #13;
   end else begin
     sSQL := sSQL + '  FLGENVIADIFINFO = NULL, ' + #13;
   end;

   //edilaine - SIG56660 - inicio
   if cbEntraTransf.Checked then begin
      sSQL := sSQL + '  FLGTRANSPERFIL = ''E'', ' + #13;
   end else if cbSaiTransf.Checked then begin
      sSQL := sSQL + '  FLGTRANSPERFIL = ''S'', ' + #13;
   end else begin
      sSQL := sSQL + '  FLGTRANSPERFIL = NULL, '  + #13;
   end;

   if cbSaldoDev.Checked then begin
      sSQL := sSQL + '  FLGTIPOITEM = 1, '    + #13;
   end else if cbSaldoVence.Checked then begin
      sSQL := sSQL + '  FLGTIPOITEM = 2, '    + #13;
   end else if cbProvisao.Checked then begin
      sSQL := sSQL + '  FLGTIPOITEM = 3, '    + #13;
   end else begin
      sSQL := sSQL + '  FLGTIPOITEM = NULL, ' + #13;
   end;
   //edilaine - SIG56660 - fim

   sSQL := sSQL +
      '  ITCSEQCALCULO           = ' + trim(DBspnSeqCalculo.Text)                + ', ' + #13 +
      '  ITCORDEMEXTRATO         = ' + trim(DBspnOrdemExtrato.Text)              + ', ' + #13 +
      '  ITCPRIORIDADE           = ' + trim(DBspnPrioridade.Text)                + ', ' + #13 +
      '  ITCEVENTO               = ' + IntToStr(rdgTipoItem.ItemIndex)           + #13 +
      'WHERE '                                                                   + #13 +
      '  IDITEMEMPTMO            = ' + IntToStr(FCodItemRC)                      + #13 +
      '  AND IDTIPOCONTREMPTMO   = ' + IntToStr(FIdTipContrato)                  + #13;

   qryAuxx.Close;
   qryAuxx.SQL.Clear;
   qryAuxx.SQL.Text := sSQL;


   (* executa a query *)
   try
      qryAuxx.ExecSQL;

      //Pendência 22718 - 13/06/2007 - Alberto
      if chkCentraliza.Checked then
         GravaFLGESTORNOPOSQUIT;

      //Fim Pendência 22718
      frmCadItemxTipoContrato.bConfirmou := True;
      frmCadItemxTipoContrato.Atualizar;
   except
      frmCadItemxTipoContrato.bConfirmou := False;

      MsgDlg('Não foi possivel completar a alteração. As alterações serão perdidas!',
             'Empréstimo', mtError, [mbOk], 0);
      Repaint;

		ModalResult := mrNone;
		raise;
	end;
end;

procedure TfrmCadItemDetalhe.btnBuscaContaCBaixaClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_CContabil.Executar;
   Repaint;
   if dtmMS.MS_CContabil.RetornouValor then begin
      Screen.Cursor := crHourGlass;
      edtContaCBaixa.Text := dtmMS.MS_CContabil.ValoresChave[0];
      FPlano := StrToInt(dtmMS.MS_CContabil.ValoresChave[4]);
   end;
   Screen.Cursor := crDefault;
end;

procedure TfrmCadItemDetalhe.rdgTipoItemClick(Sender: TObject);
begin
   inherited;
   tb97OkCancelar.Visible := True;

   if rdgTipoItem.ItemIndex = 1 then
      begin
      (* É Parcela *)
      grpIncidencia.Enabled		   	:= True;
   end else
      begin
      grpIncidencia.ItemIndex			:= 0;
      grpIncidencia.Enabled 			:= False;
      DBspnNumPeriodicidade.Value	:= 0 ;
   end;

   if (rdgTipoItem.ItemIndex = 0) then
      begin
      rdgNaturezaItem.ItemIndex := 0;
   end else
      begin
      rdgNaturezaItem.ItemIndex := 1;
   end;

   FiltraRubricas;
end;

procedure TfrmCadItemDetalhe.grpIncidenciaClick(Sender: TObject);
begin
   inherited;

   tb97OkCancelar.Visible := True;

   if ( (grpIncidencia.ItemIndex = 0) or (grpIncidencia.ItemIndex = -1) ) then begin

      (* Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
         Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
         e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox *)
      AtualizaConjunto(False, grpPeriodicidade);

   end else begin
   	AtualizaConjunto(True, grpPeriodicidade);
   end;
end;

procedure TfrmCadItemDetalhe.dbcoPeriodicidadeCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
	inherited;
	tb97OkCancelar.Visible := True;
end;

procedure TfrmCadItemDetalhe.bbtnSairClick(Sender: TObject);
begin
   // Pendência 22718 - 13/06/2007 - Alberto
   // Pendência 26325 - 11/09/2007 - Alberto
   if frmCadItemxTipoContrato.bVaiInserir then
      begin
		frmCadItemxTipoContrato.bConfirmou := False;
   end
   else
   begin
   	frmCadItemxTipoContrato.bConfirmou := True;
   end;

   Close;
end;

procedure TfrmCadItemDetalhe.rdgAgrupadoDestacadoClick(Sender: TObject);
begin
   inherited;

   (* Procedimento que verifica nos itens de um Tipo de Contrato se já existe algum
      que é o Total do Grupo e Habilita/Desabilita o CheckBox correspondente. *)
   TestaTotalGrupo(FCodItemRC, FIdTipContrato, rdgTipoItem.ItemIndex);

   ContaBaixa;
   Rubricas;
end;

procedure TfrmCadItemDetalhe.molRegraCalculobtnBuscaRegraClick(Sender: TObject);
begin
   inherited;
   molRegraCalculo.btnBuscaRegraClick(Sender);
   molRegraCalculo.DBedtRegra.Text     := molRegraCalculo.sRegra;
   molRegraCalculo.DBedtIDRegra.Text   := IntToStr(molRegraCalculo.iRegra);
end;

procedure TfrmCadItemDetalhe.molRegraCalculobtnLimpaRegraClick(Sender: TObject);
begin
   inherited;
   molRegraCalculo.btnLimpaRegraClick(Sender);

   molRegraCalculo.DBedtRegra.Text     := '';
   molRegraCalculo.DBedtIDRegra.Text   := '';
end;

procedure TfrmCadItemDetalhe.btnLimpaContaCBaixaClick(Sender: TObject);
begin
   inherited;
   edtContaCBaixa.Clear;
end;

procedure TfrmCadItemDetalhe.chkCentralizaClick(Sender: TObject);
begin
   inherited;

   ContaBaixa;
   GrupoLanc;
   Rubricas;
end;

procedure TfrmCadItemDetalhe.FormCreate(Sender: TObject);
begin
   inherited;
   edtContaCBaixa.EditMask        := trim(IntegraBack.MascaraPlano) + ';0;_';
   edtContaCBaixaDebitos.EditMask := trim(IntegraBack.MascaraPlano) + ';0;_';
end;

procedure TfrmCadItemDetalhe.rdgNaturezaItemClick(Sender: TObject);
begin
	FiltraRubricas;
end;

procedure TfrmCadItemDetalhe.DBcboRubNormalChange(Sender: TObject);
begin
   inherited;

   edtRubNormal.Clear;
   if trim(DBcboRubNormal.LookupValue) <> EmptyStr then
   begin
      edtRubNormal.Text := trim(DBcboRubNormal.LookupValue);
      edtProvDescN.Text := trim(DBcboRubNormal.LookupTable.FieldByName('CODPROVDESC').AsString);
   end;

   if trim(qryIDPROVENTOA.AsString) <> EmptyStr then begin
      DBcboRubAtraso.LookupValue  := trim(qryIDPROVENTOA.AsString);
   end else begin
      DBcboRubAtraso.Clear;
   end;

   if trim(qryIDPROVENTOD.AsString) <> EmptyStr then
      begin
      DBcboRubDevolucao.LookupValue  := trim(qryIDPROVENTOD.AsString);
   end else begin
      DBcboRubDevolucao.Clear;
   end;

   if trim(qryIDRUBRICADIFINFO.AsString) <> EmptyStr then
      begin
      DBcboRubInformativa.LookupValue  := trim(qryIDRUBRICADIFINFO.AsString);
   end else begin
      DBcboRubInformativa.Clear;
   end;
end;

procedure TfrmCadItemDetalhe.DBcboRubAtrasoChange(Sender: TObject);
begin
   inherited;

   edtRubAtraso.Clear;
   if trim(DBcboRubAtraso.LookupValue) <> EmptyStr then
   begin
      edtRubAtraso.Text := trim(DBcboRubAtraso.LookupValue);
      edtProvDescA.Text := trim(DBcboRubAtraso.LookupTable.FieldByName('CODPROVDESC').AsString);
   end;

   if trim(qryIDPROVENTOD.AsString) <> EmptyStr then
      begin
      DBcboRubDevolucao.LookupValue  := trim(qryIDPROVENTOD.AsString);
   end else begin
      DBcboRubDevolucao.Clear;
   end;

   if trim(qryIDRUBRICADIFINFO.AsString) <> EmptyStr then
      begin
      DBcboRubInformativa.LookupValue  := trim(qryIDRUBRICADIFINFO.AsString);
   end else begin
      DBcboRubInformativa.Clear;
   end;
end;

procedure TfrmCadItemDetalhe.DBcboRubDevolucaoChange(Sender: TObject);
begin
   inherited;

   edtRubDevol.Clear;
   if trim(DBcboRubDevolucao.LookupValue) <> EmptyStr then
   begin
      edtRubDevol.Text  := trim(DBcboRubDevolucao.LookupValue);
      edtProvDescD.Text := trim(DBcboRubDevolucao.LookupTable.FieldByName('CODPROVDESC').AsString);
   end;

   if trim(qryIDRUBRICADIFINFO.AsString) <> EmptyStr then
      begin
      DBcboRubInformativa.LookupValue  := trim(qryIDRUBRICADIFINFO.AsString);
   end else begin
      DBcboRubInformativa.Clear;
   end;
end;

procedure TfrmCadItemDetalhe.btnLimpaRubNClick(Sender: TObject);
begin
  inherited;
   edtRubNormal.Clear;
   DBcboRubNormal.LookupValue := '';
end;

procedure TfrmCadItemDetalhe.btnLimpaRubAClick(Sender: TObject);
begin
  inherited;
   edtRubAtraso.Clear;
   DBcboRubAtraso.LookupValue := '';
end;

procedure TfrmCadItemDetalhe.btnLimpaRubDClick(Sender: TObject);
begin
  inherited;
   edtRubDevol.Clear;
   DBcboRubDevolucao.LookupValue := '';
end;

function TfrmCadItemDetalhe.TestaSeqImpressao: Boolean;
var
   sSQL : String;
begin
   Result := True;
   if (spnSeqImpr.Value > 0) then
   begin
      sSQL :=
      'SELECT '                    + #13 +
      '  NVL(COUNT(*),0) AS TOTAL' + #13 +
      'FROM '                      + #13 +
      '  ITEMXTIPOCONTR '          + #13 +
      'WHERE '                     + #13 +
      '      IDTIPOCONTREMPTMO   = ' + IntToStr(FIdTipContrato)       + #13 +
      '  AND ITCORDEMIMP         = ' + FloatToStr(spnSeqImpr.Value);

      qryAuxx.SQL.Clear;
      qryAuxx.SQL.Text := sSQL;
      qryAuxx.Open;

      if (qryAuxx.FieldByName('TOTAL').AsInteger > 0) then
      begin
         MsgDlg('Já existe item com esta SEQUÊNCIA DE IMPRESSÃO', 'Empréstimo', mtError, [mbOK], 0);
         Repaint;
         Result := False;
      end
      else
      begin
         Result := True;
      end;
      qryAuxx.Close;
   end;
end;

//Pendência 22718 - 13/06/2007 - Alberto
procedure TfrmCadItemDetalhe.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   //Pendência 26325 - 11/09/2007 - Alberto
   if not frmCadItemxTipoContrato.bConfirmou then
      begin

      if not frmCadItemxTipoContrato.bVaiInserir then
         frmCadItemxTipoContrato.bConfirmou := True;

      if qry.State in dsEditModes then
         qry.Cancel;

   end;
   //Fim Pendência 26325

   Action := caFree;

  inherited;
end;

procedure TfrmCadItemDetalhe.GravaFLGESTORNOPOSQUIT;
var
   sSQL : String;
begin

   sSQL :=
      'UPDATE '            + #13 +
      '  ITEMXTIPOCONTR '  + #13 +
      'SET '               + #13;

   if chkEstornoPosQuit.Checked then
      sSQL := sSQL + 'FLGESTORNOPOSQUIT = 1' + #13
   else
      sSQL := sSQL + 'FLGESTORNOPOSQUIT = 0' + #13;

   sSQL := sSQL +
      'WHERE '                                                 + #13 +
      '    ITCEVENTO = ' + IntToStr(rdgTipoItem.ItemIndex)     + #13 +
      'AND IDTIPOCONTREMPTMO = ' + IntToStr(FIdTipContrato)    + #13 +
      'AND FLGCENTRALIZA <> 1 '                                + #13;

   qryAuxx.Close;
   qryAuxx.SQL.Clear;
   qryAuxx.SQL.Text := sSQL;
   qryAuxx.ExecSQL;

end;
//Fim Pendência 22718


//BRUNO AZEVEDO SOL 123125 KINTANA 612563
procedure TfrmCadItemDetalhe.chkEnviaSuspClick(Sender: TObject);
begin
  inherited;
  DBcboRubInformativa.Enabled := chkEnviaSusp.Checked;
  btnLimpaRubI.Enabled        := chkEnviaSusp.Checked;

  //Fernando Santana
  DBcboRubInformativaPgto.Enabled := chkEnviaSusp.Checked;
  btnLimpaRubPgto.Enabled         := chkEnviaSusp.Checked;
  // Fim

  if not (DBcboRubInformativa.Enabled) then begin
    DBcboRubInformativa.Clear;
    edtRubInf.Clear;
    edtProvDescI.Clear;
  end;

   //Fernando Santana
  if not DBcboRubInformativaPgto.Enabled then
  begin
    DBcboRubInformativaPgto.Clear;
    edtProvDescIPgto.Clear;
    edtRubInfPgto.Clear;
  end;
  //Fim

end;

procedure TfrmCadItemDetalhe.DBcboRubInformativaChange(Sender: TObject);
begin
  inherited;
  edtRubInf.Clear;
  if trim(DBcboRubInformativa.LookupValue) <> EmptyStr then
     begin
     edtRubInf.Text    := trim(DBcboRubInformativa.LookupValue);
     edtProvDescI.Text := trim(DBcboRubInformativa.LookupTable.FieldByName('CODPROVDESC').AsString);
     end;
end;

procedure TfrmCadItemDetalhe.btnLimpaRubIClick(Sender: TObject);
begin
  inherited;
  edtRubInf.Clear;
  DBcboRubInformativa.LookupValue := '';
end;
//BRUNO AZEVEDO SOL 123125 KINTANA 612563

procedure TfrmCadItemDetalhe.DBcboRubInformativaPgtoChange(
  Sender: TObject);
begin
  inherited;
  // Fernando Santana
  edtRubInfPgto.Clear;
  if trim(DBcboRubInformativaPgto.LookupValue) <> EmptyStr then
     begin
    edtRubInfPgto.Text    := trim(DBcboRubInformativaPgto.LookupValue);
    edtProvDescIPgto.Text := trim(DBcboRubInformativaPgto.LookupTable.FieldByName('CODPROVDESC').AsString);
  end;
  // fim
end;

procedure TfrmCadItemDetalhe.btnLimpaRubPgtoClick(Sender: TObject);
begin
  inherited;
  edtRubInfPgto.Clear;
  DBcboRubInformativaPgto.LookupValue := '';
end;

procedure TfrmCadItemDetalhe.btnBuscaContaCBaixaDebitosClick(
  Sender: TObject);
begin
  inherited;

   dtmMS.MS_CContabil.Executar;
   Repaint;
   if dtmMS.MS_CContabil.RetornouValor then
      begin
      Screen.Cursor := crHourGlass;
      edtContaCBaixaDebitos.Text := dtmMS.MS_CContabil.ValoresChave[0];
      FPlanoD := StrToInt(dtmMS.MS_CContabil.ValoresChave[4]);
     end;
   Screen.Cursor := crDefault;
end;

//edilaine - SIG56660 - inicio
procedure TfrmCadItemDetalhe.btnLimpaContaCBaixaDebitosClick(
  Sender: TObject);
begin
  inherited;
 edtContaCBaixaDebitos.Clear;
end;

procedure TfrmCadItemDetalhe.cbEntraTransfClick(Sender: TObject);
begin
  inherited;
  if cbEntraTransf.checked then
     cbSaiTransf.Checked := false;

  HabilitaTipoItemTransf();
end;

procedure TfrmCadItemDetalhe.cbSaiTransfClick(Sender: TObject);
begin
  inherited;
  if cbSaiTransf.checked then
     cbEntraTransf.Checked := false;

  HabilitaTipoItemTransf();
end;

procedure TfrmCadItemDetalhe.HabilitaTipoItemTransf;
begin
  cbSaldoDev.Enabled   := (cbSaiTransf.checked) or (cbEntraTransf.Checked);
  cbSaldoVence.Enabled := (cbSaiTransf.checked) or (cbEntraTransf.Checked);
  cbProvisao.Enabled   := (cbSaiTransf.checked) or (cbEntraTransf.Checked);

  if (not cbSaiTransf.checked) and (not cbEntraTransf.Checked) then
  begin
    cbSaldoDev.Checked   := false; 
    cbSaldoVence.Checked := false;
    cbProvisao.Checked   := false;
  end;
end;

procedure TfrmCadItemDetalhe.cbSaldoDevClick(Sender: TObject);
begin
  inherited;
  if cbSaldoDev.Checked then
  begin
    cbSaldoVence.Checked := false;
    cbProvisao.Checked   := false;
  end;
end;

procedure TfrmCadItemDetalhe.cbSaldoVenceClick(Sender: TObject);
begin
  inherited;
  if cbSaldoVence.Checked then
  begin
    cbSaldoDev.Checked := false;
    cbProvisao.Checked := false;
  end;
end;

procedure TfrmCadItemDetalhe.cbProvisaoClick(Sender: TObject);
begin
  inherited;
  if cbProvisao.Checked then
  begin
    cbSaldoDev.Checked   := false;
    cbSaldoVence.Checked := false;
  end;
end;
//edilaine - SIG56660 - fim


end.
