unit FExecTrataParcela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizard, IvDictio, IvMulti, IvEMulti, ComCtrls, StdCtrls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, Wwdatsrc, DBTables,
  Wwquery, wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, DBCtrls,
  Grids, Wwdbigrd, Wwdbgrid, fcButton, fcImgBtn, fcShapeBtn, wwdblook,
  UCalcEmptmo, FSairAjudaImob, MontaSelect, wwdbedit;

type
  TfrmExecTrataParcela = class(TfrmSairAjudaImob)
    ntbPrincipal: TNotebook;
    btnContinuaSelecao: TfcShapeBtn;
    DBgrdHistMov: TwwDBGrid;
    btnVolta: TfcShapeBtn;
    btnContinua: TfcShapeBtn;
    Panel4: TPanel;
    pnlInformaFinal: TPanel;
    btnVoltaInicio: TfcShapeBtn;
    btnConfirmar: TfcShapeBtn;
    qry: TwwQuery;
    qryINSCRICAO: TFloatField;
    qryINSCRICAONUMERO: TFloatField;
    qryDESCSITCONTRATO: TStringField;
    qryIDSITPART: TFloatField;
    qrySITUACAO: TStringField;
    qryFLGINTERNO: TStringField;
    qryPLANOPREV: TStringField;
    qryPATRO: TStringField;
    qryMATRICULA: TStringField;
    qryTITULAR: TStringField;
    qryBENEFICIARIO: TStringField;
    qryDESCTIPOEMPTMO: TStringField;
    qryDATAINSC: TDateTimeField;
    qryBANCO: TStringField;
    qryCONTACORRENTE: TStringField;
    qryNUMAGENCIA: TStringField;
    qryIDCONTRQUITACAO: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDPATRO: TFloatField;
    qryIDVERBA: TFloatField;
    qryIDBENEF: TFloatField;
    qryIDCBANCARIA: TFloatField;
    qryIDMOTIVOCANC: TFloatField;
    qryCODFORMAPAG: TFloatField;
    qryPORTFORMAPAG: TFloatField;
    qryPORTFORMAREC: TFloatField;
    qryNUMPARCELAS: TFloatField;
    qryDATACREDITO: TDateTimeField;
    qryDATASITUACAO: TDateTimeField;
    qryDATAASSINATURA: TDateTimeField;
    qryDATAPRIMPARC: TDateTimeField;
    qryDATACANC: TDateTimeField;
    qryVLRCONTRATO: TFloatField;
    qryVLRPARCELA: TFloatField;
    qryTXJUROS: TFloatField;
    qryFLGSITUACAO: TStringField;
    qryFLGFORMAREC: TStringField;
    qryFLGFORMAPAG: TStringField;
    qryTCEDESCRICAO: TStringField;
    qryIDCONTRATOEMPTMO: TFloatField;
    qryIDTIPOEMPTMO: TFloatField;
    dts: TwwDataSource;
    dtsHistMov: TwwDataSource;
    qryHistMov: TwwQuery;
    qryHistMovANOMES: TStringField;
    qryHistMovHMEANOCOMPETENCIA: TFloatField;
    qryHistMovHMEMESCOMPETENCIA: TFloatField;
    qryHistMovHMETIPOMOV: TFloatField;
    qryHistMovHMEDATAPREVISTA: TDateTimeField;
    qryHistMovHMEVLRPREVISTO: TFloatField;
    qryHistMovEVENTO: TStringField;
    qryHistMovHMETXJUROS: TFloatField;
    qryHistMovHMEPARCELA: TFloatField;
    qryHistMovHMESEQCOBRANCA: TFloatField;
    lblData: TLabel;
    edtData: TCMDateTimePicker;
    DBrdgDebito: TRadioGroup;
    pnlCAR: TPanel;
    Label30: TLabel;
    Bevel1: TBevel;
    DBcboFormaRecebimento: TwwDBLookupCombo;
    qryHistMovVirtual: TwwQuery;
    dtsHistMovVirtual: TwwDataSource;
    DBgrdHistMovVirtual: TwwDBGrid;
    updHistMovVirtual: TUpdateSQL;
    lblTitulo: TfcLabel;
    qryIDINSCRICAOEMPTMO: TFloatField;
    qryIDTIPOCONTREMPTMO: TFloatField;
    qryHistMovITEDESCRICAO: TStringField;
    qryHistMovIDCONTRATOEMPTMO: TFloatField;
    qryHistMovIDITEMEMPTMO: TFloatField;
    qryHistMovHMESALDODEV: TFloatField;
    MontaSelect: TMontaSelect;
    btnDesvio: TfcShapeBtn;
    btnAbono: TfcShapeBtn;
    btnBaixaManual: TfcShapeBtn;
    qryAux: TwwQuery;
    qryHistMovHMEFORMACOBRANCA: TStringField;
    qryHistMovIDRUBRICA: TFloatField;
    qryHistMovIDPATRO: TFloatField;
    qryHistMovCODDOCUMENTO: TFloatField;
    qryHistMovIDHISTMOVEMPTMO: TFloatField;
    qryHistMovHMECENTRALIZA: TFloatField;
    qryHistMovHMEDESTACADO: TFloatField;
    qryHistMovHMEANOCOBRANCA: TFloatField;
    qryHistMovHMEMESCOBRANCA: TFloatField;
    grpTratamento: TRadioGroup;
    qryHistMovVirtualTRATAMENTO: TStringField;
    qryHistMovVirtualHMEPARCELA: TFloatField;
    qryHistMovVirtualPARCELA: TStringField;
    qryHistMovVirtualANOMES: TStringField;
    qryHistMovVirtualHMEDATAPREVISTA: TStringField;
    qryHistMovVirtualDESCRICAO: TStringField;
    btnSuspensao: TfcShapeBtn;
    Label27: TLabel;
    Label29: TLabel;
    Label42: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label21: TLabel;
    Label43: TLabel;
    Label12: TLabel;
    Label4: TLabel;
    Label34: TLabel;
    Label41: TLabel;
    Label1: TLabel;
    Label18: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label3: TLabel;
    DBedtCodInsc: TDBEdit;
    DBedtPlanoPrev: TDBEdit;
    DBedtSituacao: TDBEdit;
    DBedtParticipante: TDBEdit;
    DBedtNumContrato: TDBEdit;
    btnBuscaContrato: TBitBtn;
    DBedtTipoContrato: TDBEdit;
    DBedtJuros: TDBEdit;
    DBedtDataInsc: TCMDateTimePicker;
    DBedtDataCredito: TCMDateTimePicker;
    DBedtPatro: TDBEdit;
    DBedtInscricao: TDBEdit;
    DBedtMtrEmpresa: TDBEdit;
    DBedtSitPart: TDBEdit;
    DBedtBeneficiario: TDBEdit;
    DBedtTipoEmptmo: TDBEdit;
    DBedtValSolic: TDBEdit;
    DBedtValorParcela: TDBEdit;
    DBedtParcelas: TDBEdit;
    DBedtDataPrimParcela: TCMDateTimePicker;
    edtDataVencimento: TCMDateTimePicker;
    Label2: TLabel;
    cbxAgrupaParcela: TCheckBox;
    DBgrdHistMovIButton: TwwIButton;
    qryHistMovFLGESCOLHA: TStringField;
    qryHistMovHMEDATAATUALIZA: TDateTimeField;
    qryHistMovHMENUMPARCELAS: TFloatField;
    qryAgrupaDocs: TwwQuery;
    qryAgrupaDocsCODDOCUMENTO: TFloatField;
    qryAgrupaDocsDATAVENCTO: TDateTimeField;
    qryAgrupaDocsCODPORTFORMA: TFloatField;
    qryAgrupaDocsGRUPODOC: TStringField;

    procedure btnContinuaSelecaoClick(Sender: TObject);
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure btnContinuaClick(Sender: TObject);
    procedure btnVoltaClick(Sender: TObject);
    procedure btnVoltaInicioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBrdgDebitoClick(Sender: TObject);
    procedure DBgrdVlrAtualizadosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdVlrAtualizadosTopRowChanged(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDesvioClick(Sender: TObject);
    procedure btnBaixaManualClick(Sender: TObject);
    procedure btnAbonoClick(Sender: TObject);
    procedure btnSuspensaoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);

  private { Private declarations }

    sMes, sAno    : String;

    rContrato     : TDadosContrato;
    vLista        : TListaItem;
    pbOk,
    pbExclui      : Boolean;
    iIdContrato   : Int64;
    sNomePatro    : String;

    procedure Sel(i: Int64);
    procedure AbreQueriesDebito;
    procedure HabilitaBotoes;
    procedure DesabilitaBotoes;
    procedure PreencheDadosContrato;
    procedure PreencheTabelaVirtual;
    procedure ProcessaMudancaVencimento;
    procedure PreencheTabelaVirtualVencimento;

    function DesviarParaFolha: Boolean;   (* altera forma de cobrança da parcela para folha de benefícios *)
    function DesviarParaCAR: Boolean;     (* altera forma de cobrança da parcela para contas a receber *)
    function BaixaManualCAR: Boolean;     (* baixa manual car *)
    function BaixaManualFolha: Boolean;   (* baixa manual folha de benefícios *)

    function VerificaBaixa: Boolean;
    function VerificaTMPDESC: Boolean;


  public { Public declarations }

  end;


var
  frmExecTrataParcela: TfrmExecTrataParcela;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, (* LimpaParametros, AtualizaConjunto *)
   UMensErro,      (* MsgDlg *)
   USistema,       (* Sistema *)
   UIntegraEmptmo, (* IntegraEmptmo *)
   dEmptmo,        (* qryParamEmptmo *)
   DLookEmptmo,    (* qryLookPortadorFormaR *)
   FProgresso,     (* FrmProgresso *)
   UDocumento,     (* Rotinas do CAPCAR *)
   DBaseDados,
   uDatabase,
   uBiblioteca, dMS, fAguarde;    (* ZD, ZE *)



procedure TfrmExecTrataParcela.FormCreate(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex  := 0;
end;



procedure TfrmExecTrataParcela.FormActivate(Sender: TObject);
begin
   inherited;

   edtData.ButtonWidth              := 21;
   DBedtDataCredito.ButtonWidth     := 21;
   DBedtDataInsc.ButtonWidth        := 21;
   DBedtDataPrimParcela.ButtonWidth := 21;
end;



procedure TfrmExecTrataParcela.HabilitaBotoes;
begin
   btnContinua.Enabled := True;
   btnVolta.Enabled  := True;
   btnVoltaInicio.Enabled   := True;
   btnConfirmar.Enabled       := True;
   bbtnAjuda.Enabled          := True;
   bbtnSair.Enabled           := True;

   ntbPrincipal.Enabled       := True;
   Screen.Cursor              := crDefault;
end;



procedure TfrmExecTrataParcela.DesabilitaBotoes;
begin
   Screen.Cursor              := crHourGlass;
   ntbPrincipal.Enabled       := False;

   btnContinua.Enabled := False;
   btnVolta.Enabled  := False;
   btnVoltaInicio.Enabled   := False;
   btnConfirmar.Enabled       := False;
   bbtnAjuda.Enabled          := False;
   bbtnSair.Enabled           := False;
end;



procedure TfrmExecTrataParcela.Sel(i: Int64);
begin
   with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger := i;
      Open;
   end;
end;



procedure TfrmExecTrataParcela.AbreQueriesDebito;
begin
   (* abre as queries utilizadas quando o Débito do Empréstimo será pelo CAR *)
   with dtmLookEmptmo.qryLookPortadorFormaR do begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
   end;
end;



procedure TfrmExecTrataParcela.btnBuscaContratoClick(Sender: TObject);
begin
//   MontaSelect.Executar;
   dtmMS.MS_ContratoEmptmo.Executar;
	Repaint;

//	  if MontaSelect.RetornouValor then begin
	if dtmMS.MS_ContratoEmptmo.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      (* abre a query principal com o participante escolhido *)
//      Sel(StrToInt(MontaSelect.ValoresChave[0]));
      Sel(StrToInt(dtmMS.MS_ContratoEmptmo.ValoresChave[0]));

      PreencheDadosContrato;

      (* Verifica se o Participante já recebeu o Crédito do Empréstimo *)
      if VerificaBaixa then begin

         btnContinuaSelecao.Enabled := True;

      end else begin

         btnContinuaSelecao.Enabled := False;
         MsgDlg('Crédito do Empréstimo NÃO efetivado.' + #13 +
                'Utilize o Cancelamento de Concessão', 'Empréstimo', mtWarning,[mbOk],0);

      end;(* if *)

      Screen.Cursor     := crDefault;
      lblTitulo.Caption := 'Contrato Nº: ' + qry.FieldByName('IDCONTRATOEMPTMO').AsString;

   end; (* if MontaSelect.RetornouValor *)
end;



function TfrmExecTrataParcela.VerificaBaixa: Boolean;
var
   sSql              : String;
   qryAux            : TwwQuery;
   fSaldo            : Real;
   fSaldoOutraMoeda  : Real;
begin
   (* Cria a Query Auxiliar *)
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   sSql :=
   'SELECT '                           + #13 +
   '  HMEDATAEFETIVA, CODDOCUMENTO '   + #13 +
   'FROM '                             + #13 +
   '  HISTMOVEMPTMO '                  + #13 +
   'WHERE '                            + #13 +
   '  ( IDCONTRATOEMPTMO  = ' + IntToStr(rContrato.IDContratoEmptmo) + ' ) '  + #13 +
   '  AND ( HMETIPOMOV    = 0 ) '                                             + #13 +
   '  AND ( HMECENTRALIZA = 1 ) ';

   qryAux.SQL.Text := sSql;

   try

      qryAux.Open;
      if not qryAux.FieldByName('HMEDATAEFETIVA').IsNull then begin

         (* Participante já recebeu o Crédito do EP, logo pode quitar o EP *)
         Result := True;

      end else begin

         (* Participante NÃO recebeu o Crédito do EP *)

         Documento.Saldo.GetSaldoDoc(qryAux.FieldByName('CODDOCUMENTO').AsInteger,
                                     '', (* Data do Saldo - Saldo Atual *)
                                     'P', (* RecPag *)
                                     fSaldo, fSaldoOutraMoeda);

         if fSaldo = 0 then begin
            Result := True;
         end else begin
            Result := False;
         end;

      end;(* if DataEfetiva *)

   finally
      qryAux.Free;
   end;
end;



procedure TfrmExecTrataParcela.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;

   (* abre a query HistMov com os parâmetros passados *)
   with qryHistMov do begin
      (* Procedure da unit UFuncoesEmptmo que fecha a query e limpa todos os parâmetros *)
      LimpaParametros(qryHistMov);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger  := qryIDCONTRATOEMPTMO.AsInteger;
      ParamByName('PIDTIPOCONTREMPTMO').AsInteger := qryIDTIPOCONTREMPTMO.AsInteger;
      Open;
   end;

   ntbPrincipal.PageIndex := 1;
end;



procedure TfrmExecTrataParcela.btnContinuaClick(Sender: TObject);
begin
   inherited;

   iIdContrato := qry.FieldByName('IDCONTRATOEMPTMO').AsInteger;
   sNomePatro  := qry.FieldByName('PATRO').AsString;

   // dispara o evento correspondente ao groupbox
   case grpTratamento.ItemIndex of
     0: btnDesvio.OnClick(Self);
     1: btnBaixaManual.OnClick(Self);
     2: btnAbono.OnClick(Self);
     3: btnSuspensao.OnClick(Self);
     4: ProcessaMudancaVencimento;
   end;

   if grpTratamento.ItemIndex <> 4 then begin

      PreencheTabelaVirtual;

   end;

   ntbPrincipal.PageIndex  := 2;
   btnConfirmar.Enabled    := pbOk;

   Exit;

   try

   finally
      HabilitaBotoes;
   end;
end;



procedure TfrmExecTrataParcela.PreencheTabelaVirtual;
var
   lsMesCobranca  : String;
begin

   qryHistMovVirtual.Close;
   qryHistMovVirtual.Open;
   // preenche a parcela tratada.
   lsMesCobranca   := qryHistMov.FieldByName('HMEANOCOBRANCA').AsString+'/'+
                      Biblioteca.ZD(Trim(qryHistMov.FieldByName('HMEMESCOBRANCA').AsString),2);

   qryHistMovVirtual.Insert;

   qryHistMovVirtualANOMES.AsString             := lsMesCobranca;

   if grpTratamento.ItemIndex <> 4 then
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := edtData.Date
   else
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := edtDataVencimento.Date;

   qryHistMovVirtualHMEPARCELA.AsInteger        := qryHistMov.FieldByName('HMEPARCELA').AsInteger;

   if grpTratamento.ItemIndex = 2 then
     // Seleciona o ítem abonado
     qryHistMovVirtualDESCRICAO.AsString        := qryHistMov.FieldByName('ITEDESCRICAO').AsString
   else
     qryHistMovVirtualDESCRICAO.AsString        := 'Parcela';

   // tipo de tratamento
   Case grpTratamento.ItemIndex of
     0: qryHistMovVirtualTRATAMENTO.AsString := 'Desvio';
     1: qryHistMovVirtualTRATAMENTO.AsString := 'Baixa Manual';
     2: qryHistMovVirtualTRATAMENTO.AsString := 'Abono';
     3: qryHistMovVirtualTRATAMENTO.AsString := 'Suspensão';
     4: qryHistMovVirtualTRATAMENTO.AsString := 'Mudança de Vencimento';
   end;
   qryHistMovVirtual.Post;

end;

procedure TfrmExecTrataParcela.btnVoltaClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
end;



procedure TfrmExecTrataParcela.btnVoltaInicioClick(Sender: TObject);
begin
	inherited;
   ntbPrincipal.PageIndex := 1;
end;



procedure TfrmExecTrataParcela.DBrdgDebitoClick(Sender: TObject);
begin
	inherited;

  if DBrdgDebito.ItemIndex = 0 then begin

      DBcboFormaRecebimento.LookupValue := dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsString;

      (* Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
         Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
         e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox *)
      AtualizaConjunto(True,pnlCAR);


   end else begin

      (* Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
         Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
         e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox *)
      AtualizaConjunto(False,pnlCAR);

   end;

end;



procedure TfrmExecTrataParcela.PreencheDadosContrato;
begin
(* Procedimento que armazena os dados do Contrato num registro *)

   CalcEmptmo.LimpaRegistroContrato(rContrato);

   rContrato.IDContratoEmptmo  := qryIDContratoEmptmo.AsInteger;
   (* É nulo na Concessão *)
   rContrato.IDContrQuitacao   := -1;

   rContrato.IdPessoa          := qryIDPESSOA.AsInteger;
   rContrato.IDTipoContrEmptmo := qryIDTIPOCONTREMPTMO.AsInteger;
   rContrato.IDTipoEmptmo      := qryIDTIPOEMPTMO.AsInteger;
   rContrato.IdPlanoPrev       := qryIDPLANOPREV.AsInteger;
   rContrato.IdPatro           := qryIDPATRO.AsInteger;

   (* Número da Inscrição *)
   rContrato.IDInscricaoEmptmo := qryIDINSCRICAOEMPTMO.AsInteger;

   (* É nulo *)
   rContrato.IDVerba := -1;

   (* Beneficiário do Contrato
      IDBENEF = IDPESSOA -> do Titular no caso de estar vivo
      e do Beneficiário no caso de Pensionista *)
   rContrato.IdBenef := qryIDBENEF.AsInteger;

   if qryFLGFORMAPAG.AsString = 'C' then begin
      rContrato.IDCBancaria := qryIDCBANCARIA.AsInteger;
   end else begin
      (* É nulo *)
      rContrato.IDCBancaria := -1;
   end;

   (* É nulo *)
   rContrato.IDMotivoCanc := -1;

   if qryCODFORMAPAG.AsString <> '' then begin
      rContrato.CodFormaPag  := qryCODFORMAPAG.AsInteger;
   end else begin
      rContrato.CodFormaPag  := -1;
   end;

   if qryPORTFORMAPAG.AsString <> '' then begin
      rContrato.PortFormaPag := qryPORTFORMAPAG.AsInteger;
   end else begin
      rContrato.PortFormaPag := -1;
   end;

   if qryPORTFORMAREC.AsString <> '' then begin
      rContrato.PortFormaRec := qryPORTFORMAREC.AsInteger;
   end else begin
      rContrato.PortFormaRec := -1;
   end;

   rContrato.NumParcelas    := qryNUMPARCELAS.AsInteger;

   rContrato.DataCredito    := qryDATACREDITO.AsDateTime;
   rContrato.DataSituacao   := qryDATASITUACAO.AsDateTime;
   rContrato.DataAssinatura := qryDATAASSINATURA.AsDateTime;
   rContrato.DataPrimParc   := qryDATAPRIMPARC.AsDateTime;
   rContrato.DataInscricao  := qryDATAINSC.AsDateTime;

   (* Data nula *)
   rContrato.DataCanc :=  -1;

   rContrato.VlrContrato := qryVLRCONTRATO.AsCurrency;
   rContrato.VlrParcela  := qryVLRPARCELA.AsCurrency;
   rContrato.Txjuros     := qryTXJUROS.AsFloat;
   rContrato.FlgSituacao := qryFLGSITUACAO.AsString;

   (* FLGFORMAREC = C -> indicando que o Débito é pelo Contas a Receber
                    F -> indicando que o Débito é pela Folha *)
   rContrato.flgFormaRec := qryFLGFORMAREC.AsString;

   (* FLGFORMAPAG = C -> indicando que o Crédito é pelo Contas a Pagar
                    F -> indicando que o Crédito é pela Folha *)
   rContrato.flgFormaPag := qryFLGFORMAPAG.AsString;
end;


procedure TfrmExecTrataParcela.DBgrdVlrAtualizadosCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   (* faz com que as linhas do grid tenham cores alternadas *)
   if State <> [gdSelected] then begin
      if not Highlight then begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; (* amarelo bebê *)
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;

end;



procedure TfrmExecTrataParcela.DBgrdVlrAtualizadosTopRowChanged(Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecTrataParcela.btnDesvioClick(Sender: TObject);
begin
  inherited;
  // Forma de desvio: HMEFORMACOBRANCA = {C,F}

  pbOk := True;
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  Case qryHistMov.FieldByName('HMEFORMACOBRANCA').AsString[1] of
    'C': pbOk := DesviarParaFolha;
    'F': pbOk := DesviarParaCAR;
  end;

  if not pbOk then
    pnlInformaFinal.Caption := 'Parcela NÃO tratada!'
end;



function TfrmExecTrataParcela.DesviarParaFolha: Boolean;
begin
   { 1º Passo: Verifica se foi enviado                                 }
   { 2º Passo: Tratar CAR: Estornar ou Lançar Invertido (EM ABERTO!)   }
   {           Observar se o documento contém mais de uma parcela.     }
   { 3º Passo: Alterar tabela HISTMONEMPTMO                            }
   { OBS.: Não trata envio.}

   Result := True;

   {1ºPasso ===========================================================}
   qryAux.Sql.Clear;
   qryAux.Sql.Add('SELECT STATUS, EMISBLOQ FROM DOCUMENTO WHERE '+
                  '     CODDOCUMENTO = '+qryHistMov.FieldByName('CODDOCUMENTO').AsString);
   try
     qryAux.Open;
   except
     MsgDlg('Erro ao verificar Documento.','Empréstimo',MtError,[mbOk],0);
     Result := False;
   end;

   if Result then begin
      if (qryAux.FieldByName('STATUS').AsString   = '2') or
         (qryAux.FieldByName('EMISBLOQ').AsString = 'S') then
      begin
        MsgDlg('A parcela já foi Baixada/Enviada no Contas à Receber!'+#13+
               'Não é possível efetuar operação.','Empréstimo',MtError,[mbOk],0);
        Result := False;
      end;
   end;
   {FIM - 1ºPasso}

   {2ºPasso ===========================================================}
   if Result then begin
     // Exclui todo o documento( todos os lançamentos )
     Documento.Excluir(qryAux,qryHistMov.FieldByName('CODDOCUMENTO').AsInteger,-1);
   end;
   {FIM - 2ºPasso}


   {3ºPasso ===========================================================}
   if Result then begin
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE HISTMOVEMPTMO SET HMEFORMACOBRANCA = ''F'' ,'+
                     ' FLGENVIO              = 0 '+
                     ' WHERE IDCONTRATOEMPTMO = '+qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsString+
                     ' AND   HMEPARCELA      = '+qryHistMov.FieldBYName('HMEPARCELA').AsString);
      try
        qryAux.ExecSql;
      except
        Result := False;
      end;
   end;
   {FIM - 3ºPasso}
end;



function TfrmExecTrataParcela.DesviarParaCAR: Boolean;
var
  lsMesCobranca : String;
begin
   {1º Passo: Verifica se foi enviado (TMPDESC)
              Ir na TMPDESC através de rubricas. Portanto, saber quais rubricas
              foram inseridas. }
   {2º Passo: Excluir da TmpDesc as parcelas não enviadas.
              Para setar os registros na TMPDESC não utilizo o campo MESREFERENCIA,
              pois devo pegar todos os registros daquela parcela.              }
   {3º Passo: Alterar tabela HISTMONEMPTMO                            }
   {OBS.: Não trata envio.
          Ao desviar uma parcela, será considerada todas àquelas que possuirem
          o mesmo MESCOBRANCA.}

   {1ºPasso ===========================================================}

   Result := VerificaTMPDESC;

   {FIM - 1ºPasso}

   with qryAux Do begin
     {2ºPasso ===========================================================}
       lsMesCobranca   := qryHistMov.FieldByName('HMEANOCOBRANCA').AsString+'/'+
                          Biblioteca.ZD(Trim(qryHistMov.FieldByName('HMEMESCOBRANCA').AsString),2);
     if pbExclui then
       IntegraEmptmo.ExcluiTMPDESC(qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsInteger,
                            qryHistMov.FieldByName('HMEPARCELA').AsInteger,
                            lsMesCobranca);
     {FIM - 2ºPasso}

     {3ºPasso ===========================================================}
     if Result then begin
        SQL.Clear;
        SQL.Add(' UPDATE HISTMOVEMPTMO SET HMEFORMACOBRANCA = ''C'' ,'+
                ' FLGENVIO              = 0 '+
                ' WHERE IDCONTRATOEMPTMO = '+qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsString+
                ' AND   HMEPARCELA      = '+qryHistMov.FieldBYName('HMEPARCELA').AsString);
        try
          ExecSql;
        except
          Result := False;
        end;
     end;
     {FIM - 3ºPasso}
   end; // with qryAux do

   // ATUALIZA GRID.
   qryHistMov.Close;
   qryHistMov.Open;
end;

procedure TfrmExecTrataParcela.btnBaixaManualClick(Sender: TObject);
begin
   inherited;
   // Baixa Manual

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   Case qryHistMov.FieldByName('HMEFORMACOBRANCA').AsString[1] of
     'F': pbOk := BaixaManualFolha;
     'C': pbOk := BaixaManualCAR;
   end;
end;



function TfrmExecTrataParcela.BaixaManualCAR: Boolean;
begin
   {1º Passo: Verifica se CODDOCUMENTO esta preenchido, se FLGDIVERGPEND = 1,
              algum caso afirmativo não faz.                                 }
   {2º Passo: Marcar FLGBAIXADO  = NULL           }

   Result := True;
   with qryAux Do begin

     {1ºPasso ===========================================================}
     Sql.Clear;
     Sql.Add(' SELECT COUNT(*) OCORRENCIA FROM HISTMOVEMPTMO '+
             ' WHERE IDCONTRATOEMPTMO = '+qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsString+
             '   AND HMEPARCELA       = '+qryHistMov.FieldByName('HMEPARCELA').AsString+
             '   AND ((CODDOCUMENTO IS not NULL) OR '+
             '        (FLGDIVERGPEND  = 1)) ');
     Open;
     if FieldByName('OCORRENCIA').AsInteger > 0 then begin
        MsgDlg('Esta parcela contém um registro no Contas à Receber ou '+#13+
               'está com tratamento de divergência pendente.'+#13+
               'Não poderá ser baixada.',
               'Empréstimo',MtError,[mbOk],0);
        Result := False;
     end;
     {FIM - 1ºPasso}

     {2ºPasso ===========================================================}
     if Result then begin
        Sql.Clear;
        Sql.Add(' UPDATE HISTMOVEMPTMO '+
                ' SET FLGBAIXADO        = NULL, '+
                '  HMEDATAEFETIVA = TO_DATE('''+edtData.Text+''',''DD/MM/YYYY''), '+
                '  HMEVLREFETIVO = HMEVLRPREVISTO '+
                ' WHERE IDCONTRATOEMPTMO = '+qryHistMov.FieldByname('IDCONTRATOEMPTMO').AsString+
                '   AND HMEPARCELA      = '+qryHistMov.FieldByName('HMEPARCELA').AsString);
        try
          ExecSql;
        except;
          MsgDlg('Erro ao atualizar o Histórico.',
                 'Empréstimo',MtError,[mbOk],0);
          Result := False;
        end;
     end;
     {FIM - 2ºPasso}
   end; // with qryAux Do
end;

function TfrmExecTrataParcela.BaixaManualFolha: Boolean;
var
  lsMesCobranca: String;
begin
   {1º Passo: Verifica se a FOLHA já leu TMPDESC (TMPDESC.SITENVIO = 1)}
   {2º Passo: Excluir todos os ítems do mesmo MESCOBRANCA!}
   {3º Passo: Marcar FLGBAIXADO  = NULL           }

   lsMesCobranca   := qryHistMov.FieldByName('HMEANOCOBRANCA').AsString+'/'+
                      Biblioteca.ZD(Trim(qryHistMov.FieldByName('HMEMESCOBRANCA').AsString),2);
   {1ºPasso ===========================================================}

   Result := VerificaTMPDESC;

   {FIM - 1ºPasso}

   {2ºPasso ===========================================================}
   if pbExclui then begin
      if not IntegraEmptmo.ExcluiTMPDESC(qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsInteger,
                                         qryHistMov.FieldByName('HMEPARCELA').AsInteger,
                                         lsMesCobranca) then begin
         MsgDlg('Não foi possível excluir a parcela da TmpDesc.', 'Empréstimo',MtError,[mbOk],0);
         Result := False;
      end;
   end;
   {FIM - 2ºPasso}

   {3ºPasso ===========================================================}
   with qryAux Do begin
     if Result then begin
        Sql.Clear;
        Sql.Add(' UPDATE HISTMOVEMPTMO '+
                ' SET FLGBAIXADO        = NULL, '+
                '  HMEDATAEFETIVA = TO_DATE('''+edtData.Text+''',''DD/MM/YYYY''), '+
                '  HMEVLREFETIVO = HMEVLRPREVISTO '+
                ' WHERE IDCONTRATOEMPTMO = '+qryHistMov.FieldByname('IDCONTRATOEMPTMO').AsString+
                '   AND HMEPARCELA      = '+qryHistMov.FieldByName('HMEPARCELA').AsString);
        try
          ExecSql;
        except;
          MsgDlg('Erro ao atualizar HIstórico.', 'Empréstimo',MtError,[mbOk],0);
          Result := False;
        end;
      end;
    end;
    {FIM - 3ºPasso}
end;



procedure TfrmExecTrataParcela.btnAbonoClick(Sender: TObject);
var
  lsRubricaAbono    : String;
begin
   inherited;
   {1º Passo: Verifica se a FOLHA já leu TMPDESC (TMPDESC.SITENVIO = 1)}
   {2º Passo: Tratar ítem (válido) atualizando na tabela.
   {3º Passo: Preparar entrada para contabilidade.

   OBS.: Não processar em caso de CAR.
         Não processar em caso de enviado pela Folha. }

  {1ºPasso ===========================================================}

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   pbOk := VerificaTMPDESC;
   if qryHistMov.FieldByName('HMEFORMACOBRANCA').AsString[1] = 'C' then begin
      MsgDlg('A parcela foi gerada para o Contas à Receber!'+#13+
             'Não é possível efetuar operação.','Empréstimo',MtError,[mbOk],0);
      pbOk := False;
   end;
   {FIM - 1ºPasso}

   {2ºPasso ===========================================================}
   if pbOk then begin
      if (qryHIstMov.FieldByName('HMECENTRALIZA').AsInteger = 1) or
         (qryHIstMov.FieldByName('HMEDESTACADO').AsInteger = 1) then begin
         MsgDlg('O Ítem selecionado não é válido.'+#13+
                'Não é possível efetuar operação.','Empréstimo',MtError,[mbOk],0);
         pbOk := False;
      end;
   end;

   // exibe controle para informar DATAEFETIVA
   lblData.Caption := 'Data Efetiva';

   with qryAux Do begin
      if pbOk then begin
         Sql.Clear;
         Sql.Add(' UPDATE HISTMOVEMPTMO '+
                 ' SET FLGABONADO        = 1 '+
                 ' WHERE IDCONTRATOEMPTMO = '+qryHistMov.FieldByname('IDCONTRATOEMPTMO').AsString+
                 '   AND HMEPARCELA      = '+qryHistMov.FieldByName('HMEPARCELA').AsString+
                 '   AND IDITEMEMPTMO = '+qryHistMov.FieldByName('IDITEMEMPTMO').AsString);
         try
           ExecSql;
         except;
           MsgDlg('Erro ao atualizar HIstórico.',
                  'Empréstimo',MtError,[mbOk],0);
           pbOk := False;
         end;
      end; // if lbOk then

      Sql.Clear;
      Sql.Add(' SELECT ITEM.IDPROVENTOD FROM '+
              '	HISTMOVEMPTMO HME, '+
              '	CONTRATOEMPTMO CNT, '+
              '	ITEMXTIPOCONTR ITEM '+
              'WHERE '+
              '	HME.IDCONTRATOEMPTMO = '+qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsString+
              '  AND HME.IDITEMEMPTMO = '+qryHistMov.FieldByName('IDITEMEMPTMO').AsString+
              '  AND HME.HMEPARCELA = '+qryHistMov.FieldByName('HMEPARCELA').AsString+
              '  AND ITEM.IDITEMEMPTMO = HME.IDITEMEMPTMO '+
              '  AND CNT.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '+
              '  AND ITEM.IDTIPOCONTREMPTMO = CNT.IDTIPOCONTREMPTMO ');
      try
         Open;
      except
         MsgDlg('Erro ao verificar processar Abono.',
                'Empréstimo',MtError,[mbOk],0);
         pbOk := False;
      end;

      // Grava rubrica de devolução no ítem abonado.
      if (pbOk) and (not FieldByName('IDPROVENTOD').IsNull) then begin
         lsRubricaAbono := FieldByName('IDPROVENTOD').AsString;
         Sql.Clear;
         Sql.Add(' UPDATE HISTMOVEMPTMO '+
                 ' SET IDRUBRICA = '+ lsRubricaAbono+
                 ' WHERE IDHISTMOVEMPTMO = '+qryHistMov.FieldByName('IDHISTMOVEMPTMO').AsString);
         try
           ExecSql
         except
           MsgDlg('Erro ao atualizar Histórico de Movimentação.',
                  'Empréstimo',MtError,[mbOk],0);
           pbOk := False;
         end;
      end else if FieldByName('IDPROVENTOD').IsNull then begin
          MsgDlg('Erro na parametrização dos Ítens por Tipo de Contrato.'+#13+
                 'Verifique.', 'Empréstimo',MtError,[mbOk],0);
          pbOk := False;
      end;

   end; // with qryAux Do

   {FIM - 2ºPasso}


   {3ºPasso ===========================================================}

   if pbOk then begin
      // AtualizaContabil...
   end;

   {FIM - 3ºPasso}

   if not pbOk then
      pnlInformaFinal.Caption := 'Parcela NÃO tratada!'
end;



(* verifica se existe parcela e se foi enviada na TMPDESC *)
function TfrmExecTrataParcela.VerificaTMPDESC: Boolean;
var
   lbOk           : Boolean;
   lsMesCobranca  : String;
begin
   (* 1ºPasso ----------------------------------------------------------------------------------- *)
   lsMesCobranca  := qryHistMov.FieldByName('HMEANOCOBRANCA').AsString + '/' +
                     Biblioteca.ZD(Trim(qryHistMov.FieldByName('HMEMESCOBRANCA').AsString), 2);

   lbOk     := True;
   pbExclui := True;

   with qryAux do begin
      Sql.Clear;
      Sql.Add('SELECT COUNT(*) AS OCORRENCIA, SITENVIO FROM TMPDESC WHERE '+
              '     MESCOBRANCA = '+ QuotedStr(lsMesCobranca)+
              ' AND IDDESCONTO  = '+ qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsString+
              ' GROUP BY SITENVIO ');
      try
        Open;
      except
        lbOk := False;
        MsgDlg('Erro ao abrir tabela.',
               'Empréstimo',MtError,[mbOk],0);
      end;

      // SE RETORNAR MAIS DE UM REGISTRO PODE HAVER INCONSISTÊNCIA,
      // POIS, PARA UM MESCOBRANCA EXISTE UMA RUBRICA ENVIADA E OUTRA NÃO.
      if RecordCount > 1 then begin
         MsgDlg('Existem problemas no Envio.', 'Empréstimo',MtError,[mbOk],0);
         lbOk := False;
      end;

      // uma linha não eviada.
      lbOk := (RecordCount = 1) and (FieldByName('SITENVIO').AsInteger = 0);

      if (not lbOk) and (not IsEmpty) then
         MsgDlg('A parcela já foi Enviada pela Folha de Benefícios'+#13+
                'Não é possível efetuar operação.','Empréstimo',MtError,[mbOk],0)
      else if IsEmpty then begin
         lbOk :=  MsgDlg('Não há registros enviados para Folha de Benefícios.'+#13+
                         'Deseja continuar o processo?','Empréstimo',MtConfirmation,[mbYes, mbNo, mbHelp], 0)= mrYes;
         pbExclui := False;
      end;
   end;
   Result := lbOk;
end;



procedure TfrmExecTrataParcela.btnSuspensaoClick(Sender: TObject);
var
  lwAno, lwMes, lwDia: Word;
begin
   inherited;
   // separa as datas
   DecodeDate(edtData.Date,lwAno,lwMes,lwDia);

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   {1º Passo: Verifica se a FOLHA já leu TMPDESC (TMPDESC.SITENVIO = 1)
              ou se foi baixada na CAR }
   {2º Passo: Suspender PARCELA atualizando na tabela.}

   {1ºPasso ===========================================================}

   with qryAux Do begin
      if qryHistMov.FieldByName('HMEFORMACOBRANCA').AsString[1] = 'C' then begin
         Sql.Clear;
         Sql.Add('SELECT STATUS, EMISBLOQ FROM DOCUMENTO WHERE '+
                    '     CODDOCUMENTO = '+qryHistMov.FieldByName('CODDOCUMENTO').AsString);
         try
            Open;
         except
            MsgDlg('Erro ao verificar Documento.','Empréstimo',MtError,[mbOk],0);
            pbOk := False;
          end; // try

          if pbOk then begin
             if (FieldByName('STATUS').AsString   = '2') or
                (FieldByName('EMISBLOQ').AsString = 'S') then begin
                MsgDlg('A parcela já foi Baixada/Enviada no Contas à Receber!'+#13+
                       'Não é possível efetuar operação.','Empréstimo',MtError,[mbOk],0);
                pbOk := False;
             end;
          end;

      end else pbOk := VerificaTMPDESC;


      if pbOk then begin
         Sql.Clear;
         Sql.Add(' UPDATE HISTMOVEMPTMO '+
                 ' SET FLGSUSPENSAO   = 1, '+
                 '     HMEANOSUSPENSAO = '+ IntToStr(lwAno)+
                 ' ,   HMEMESSUSPENSAO = '+ IntToStr(lwMes)+
                 ' WHERE IDCONTRATOEMPTMO = '+qryHistMov.FieldByname('IDCONTRATOEMPTMO').AsString+
                 '   AND HMEPARCELA      = '+qryHistMov.FieldByName('HMEPARCELA').AsString);
         try
           ExecSql;
         except;
           MsgDlg('Erro ao atualizar HIstórico.', 'Empréstimo',MtError,[mbOk],0);
           pbOk := False;
         end;
      end; // if lbOk then
   end; // with qryAux Do
end;



procedure TfrmExecTrataParcela.ProcessaMudancaVencimento;
var
   sFormaCobranca       : String;
   sNovaFormaCobranca   : String;
   sNovoMesCobranca     : String;
   sNovoAnoCobranca     : String;
   sAnoMesCompet        : String;
   sNovaDataCobranca    : String;
begin
   pbOk := True;
   (* Passos do processamento:
      1 - Selecionar todos os itens da parcela
      2 - Chamar regra de atualização de valores dos itens
      3 - Desfazer o envio da parcela
      4 - Armazenar o numero do documento anterior gerado e salvar em historico de documento
      5 - Baixar documento anterior
   *)

(* PASSO 1 - Selecionar todos os itens da parcela *)


   if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;

   try
      (* Varre todo historico de Divergencias e trata as escolhidas *)
      with qryHistMov do begin

           DisableControls;

           (* Acerta tela de acompanhamento *)
           frmAguarde.Max := RecordCount;
           frmAguarde.Pos := 0;

           frmAguarde.Mostra('Processando, Aguarde...');

           First;
           while not(EOF) do begin

              (* Atualiza tela de acompanhamento *)
              frmAguarde.Pos := frmAguarde.Pos + 1;

              (* Caso não tenha sido selecionado pula *)
              if FieldByName('FLGESCOLHA').AsInteger = 0 then begin
                 Next;
                 Continue;
              end;

              sNovaFormaCobranca := FieldByName('HMEFORMACOBRANCA').AsString;

              sNovaDataCobranca  := edtDataVencimento.Text;

              sNovoMesCobranca   := Copy(sNovaDataCobranca, 4, 2);
              sNovoAnoCobranca   := Copy(sNovaDataCobranca, 7, 4);

              Sel(FieldByName('IDCONTRATOEMPTMO').AsInteger);

              (* Preenche registro com os dados do Contrato *)
              PreencheDadosContrato;

              sAnoMesCompet  := FormatFloat('0000', FieldByName('HMEANOCOMPETENCIA').AsFloat) +
                                FormatFloat('00', FieldByName('HMEMESCOMPETENCIA').AsFloat);

(* PASSO 2 - Chamar regra de atualização de valores dos itens *)

              if not (CalcEmptmo.CalculaItensDiverg(rContrato, 4 (* Atualização *), 7 (* Origem *),
                                                    FieldByName('HMEPARCELA').AsInteger,
                                                    FieldByName('HMENUMPARCELAS').AsInteger,
                                                    Date,
                                                    edtDataVencimento.Date,
                                                    qryHistMovHMEDATAATUALIZA.AsDateTime,
                                                    vLista, True, False) ) then begin
                 (* Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
                    por Cancelamento do Usuário, logo o procedimento será abortado *)
                 pbOk := False;
                 Exit;
              end;

              PreencheTabelaVirtualVencimento;

(* PASSO 3 - Desfazer o envio da parcela *)

              DtmEmptmo.QryAuxDEmptmo.SQL.Clear;
              DtmEmptmo.QryAuxDEmptmo.SQL.Add(
                 'UPDATE HISTMOVEMPTMO SET ' +
                 '       HMEANOCOBRANCA = ''' + sNovoAnoCobranca      + ''', ' +
                 '       HMEMESCOBRANCA = ''' + sNovoMesCobranca      + ''', ' +
                 '       HMEFORMACOBRANCA = ''' + sNovaFormaCobranca  + ''', ' +
                 '       FLGENVIO         = ' + '0'                   + ', ' +
                 '       FLGDIVERGPEND    = ' + '0'                   + '  ' +
                 'WHERE  IDHISTMOVEMPTMO = ' + FieldByName('IDHISTMOVEMPTMO').AsString);
              DtmEmptmo.QryAuxDEmptmo.ExecSQL;

(* PASSO 4 - Armazenar o numero do documento anterior gerado e salvar em historico de documento *)

              DtmEmptmo.QryAuxDEmptmo.SQL.Clear;
              DtmEmptmo.QryAuxDEmptmo.SQL.Text :=
                 'INSERT INTO HISTMOVXDOCUM( IDHISTMOVEMPTMO, HMDCODDOCUMENTO, HMDDATA ) ' + #13 +
                 'VALUES ( ' + FieldByName('IDHISTMOVEMPTMO').AsString + ',' +
                           qryHistMovCODDOCUMENTO.AsString + ',' +
                           DateToStr(Date) + ' )';
              DtmEmptmo.QryAuxDEmptmo.ExecSQL;

(* PASSO 5 - Baixar documento anterior *)
              BaixaManualCAR;
              IntegraEmptmo.EfetuaBaixaCAR(qryHistMovCODDOCUMENTO.AsInteger);

              Next;
           end; { While }

           if dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.Commit;

           First;
           EnableControls;
      end; { with }
   Except

     (* Caso tenha ocorrido um erro, Cancela transação *)
     if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
     Raise;

   end;

   frmAguarde.Apaga;

end;



procedure TfrmExecTrataParcela.PreencheTabelaVirtualVencimento;
var
   i : Integer;
   sMesCobranca  : String;
begin
   qryHistMovVirtual.Close;
   qryHistMovVirtual.Open;


   (* Laço que varre o vetor Lista inserindo na tabela virtual TODOS os
      itens calculados *)
   for i := 0 to High(vLista) do begin

      qryHistMovVirtual.Insert;

      qryHistMovVirtualDESCRICAO.AsString          := vLista[i].Nome;
      qryHistMovVirtualANOMES.AsString             := sMesCobranca;
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := edtDataVencimento.Date;
      qryHistMovVirtualHMEPARCELA.AsInteger        := vLista[i].Parcela;
      qryHistMovVirtualPARCELA.AsInteger           := vLista[i].Parcela;
      qryHistMovVirtualTRATAMENTO.AsString         := 'Mudança de Vencimento';

      qryHistMovVirtual.Post;

   end;(* for *)

end;


procedure TfrmExecTrataParcela.btnConfirmarClick(Sender: TObject);
var
  sAnoCobranca    : String;
  sMesCobranca    : String;
  sSQL            : String;
  sSQLAgrupaDocs  : String;
  sResult, sErro  : TStringList;
  iPlanilha       : Integer;
  sMensagem       : String;
  sDocumentos     : String;
begin

   (* Passos:
      1 - Gravar Historico
      2 - Contabilizar
      3 - Gerar CAR
      4 - Fazer envio (agrupado ou individual)
    *)


  inherited;

(* PASSO 1 - Gravar Historico *)

   with qryHistMovVirtual do begin

        while not eof do begin
           sAnoCobranca := Copy(FieldByName('HMEDATAPREVISTA').AsString,7,4);
           sMesCobranca := Copy(FieldByName('HMEDATAPREVISTA').AsString,4,2);

           CalcEmptmo.GravaMovEmptmo(rContrato, vLista, 4 (* = Atualização *),
                                     FieldByName('HMEPARCELA').AsInteger,
                                     -1 (* Ano Competencia *),
                                     -1 (* Mes Competencia *),
                                      StrToInt(sAnoCobranca), StrToInt(sMesCobranca),
                                      -1 (* nº de parcelas remanescentes *),
                                      FieldByName('HMEDATAPREVISTA').AsDateTime,
                                      FieldByName('HMEDATAPREVISTA').AsDateTime,
                                      False  (* mostra progresso *));
           Next;
        end;
   end;

(* PASSO 2 - Contabilizar *)

   sSQL := 'SELECT'                                                           + #13 +
           '      H.IDHISTMOVEMPTMO,'                                         + #13 +
           '      H.IDCONTRATOEMPTMO,'                                        + #13 +
           '      TC.IDTIPOCONTREMPTMO,'                                      + #13 +
           '      H.IDITEMEMPTMO,'                                            + #13 +
           '      C.IDPLANOPREV,'                                             + #13 +
           '      C.IDPATRO,'                                                 + #13 +
           '      H.HMEVLRPREVISTO,'                                          + #13 +
           '      H.HMEVLREFETIVO,'                                           + #13 +
           '      H.HMEFORMACOBRANCA,'                                        + #13 +
           '      ITC.TIPCODIGO'                                              + #13 +

           'FROM'                                                             + #13 +
           '      HISTMOVEMPTMO H,'                                           + #13 +
           '      TIPOCONTREMPTMO TC,'                                        + #13 +
           '      CONTRATOEMPTMO C,'                                          + #13 +
           '      ITEMXTIPOCONTR ITC,'                                        + #13 +
           '      TIPOEMPTMO TE'                                              + #13 +

           'WHERE'                                                            + #13 +
           '      TE.IDEMPRESAPROP          = ' + IntToStr(Sistema.IDEmpresa) + #13 +
           '      AND H.IDCONTRATOEMPTMO    = ' + IntToStr(iIdContrato)       + #13 +
           '      AND ( (H.HMECENTRALIZA = 0) OR (H.HMECENTRALIZA IS NULL) )' + #13 +
           '      AND H.HMETIPOMOV          = 4'                              + #13 +
           '      AND H.HMEORIGEM           = 7'                              + #13 +
           '      AND H.HMEANOCOBRANCA      = ' + sAnoCobranca                + #13 +
           '      AND H.HMEMESCOBRANCA      = ' + sMesCobranca                + #13 +
           '      AND H.PLNCODIGO IS NULL'                                    + #13 +
           '      AND TC.IDTIPOEMPTMO       = TE.IDTIPOEMPTMO'                + #13 +
           '      AND ITC.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO'           + #13 +
           '      AND C.IDTIPOCONTREMPTMO   = TC.IDTIPOCONTREMPTMO'           + #13 +
           '      AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO'             + #13 +

           'ORDER BY' + #13 +
           '      HMEANOCOMPETENCIA, HMEMESCOMPETENCIA, H.IDCONTRATOEMPTMO'   + #13;


   (* prepara o Histórico-padrão que será passado adiante *)
   sMensagem  := 'Mudança de vencimento para: ' + edtDataVencimento.Text + '.';

   (* chama a função de contabilização passando o SQL acima *)
   IntegraEmptmo.ContabilizaItens('C', 'N', sSQL, sMensagem, edtData.Date, sResult, sErro, iPlanilha);


(* PASSO 3 - Gerar CAR *)

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO  , '                       + #13 +
   '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, HME.HMEVLRPREVISTO, '                      + #13 +
   '  HME.HMERECPAG, HME.HMEDATAPREVISTA, '                                                  + #13 +

   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                               + #13 +
   '  || ''/'' || '                                                                          + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '       + #13 +

   '  ITC.CONTABAIXA, ITC.TIPCODIGO, '                                                       + #13 +
   '  CNT.IDPLANOPREV, CNT.IDPATRO, CNT.IDBENEF, CNT.IDPESSOA, '                             + #13 +
   '  CNT.CODFORMAPAG, CNT.PORTFORMAPAG, CNT.PORTFORMAREC, '                                 + #13 +
   '  TIP.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO '                                              + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +
   '  CONTRATOEMPTMO  CNT, '                                                                 + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                                 + #13 +
   '  ITEMEMPTMO      IRC, '                                                                 + #13 +
   '  TIPOEMPTMO      TEM '                                                                  + #13 +

   'WHERE '                                                                                  + #13 +
   '       ( HME.HMEFORMACOBRANCA = ''C'' ) '                                                + #13 +
   '   AND ( CNT.FLGSITUACAO IN (''A'', ''E'', ''J'', ''K'') ) '                             + #13 +
   '   AND ( HME.CODDOCUMENTO IS NULL ) '                                                    + #13 +
   '   AND ( (HME.HMECENTRALIZA = 1) OR (HME.HMEDESTACADO  = 1) ) '                          + #13 +
   '   AND ( HME.FLGENVIO = 0 ) '                                                            + #13 +
   '   AND ( HME.FLGDIVERGPEND IS NULL OR HME.FLGDIVERGPEND = 0 ) '                          + #13 +
   '   AND ( HME.HMEANOCOBRANCA = ' + sAnoCobranca + ' ) '                                   + #13 +
   '   AND ( HME.HMEMESCOBRANCA = ' + sMesCobranca + ' ) '                                   + #13;

   sSQL := sSQL +
   '   AND ( CNT.IDCONTRATOEMPTMO  = ' + IntToStr(iIdContrato) + ' ) '                       + #13 +
   '   AND ( TEM.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                 + #13 +
   '   AND ( HME.IDCONTRATOEMPTMO  = CNT.IDCONTRATOEMPTMO  ) '                               + #13 +
   '   AND ( CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO ) '                               + #13 +
   '   AND ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) '                                    + #13 +
   '   AND ( CNT.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                               + #13 +
   '   AND ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO ) '                                    + #13 +
   '   AND ( ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO ) '                                    + #13;

   try

      sResult   := TStringList.Create;
      sErro     := TStringList.Create;

      iPlanilha := 0;

      (* prepara o Histórico-padrão que será passado adiante *)
      sMensagem  := 'Mudança de vencimento de Parcela de Empréstimo para: ' + edtDataVencimento.Text;

      IntegraEmptmo.EnviaCAPCAR(sSql, sMensagem, sNomePatro, edtData.Date, iPlanilha, sResult, sErro);

(* PASSO 4 - Fazer envio (agrupado ou individual) *)

      (* Busca os documentos gerados *)
      with qryAux do begin
           Sql.Clear;
           sSQL :=
               'SELECT CODDOCUMENTO '                                              + #13 +
               'FROM   HISTMOVEMPTMO'                                              + #13 +
               'WHERE '                                                            + #13 +
               '       ( HMEFORMACOBRANCA = ''C'' ) '                              + #13 +
               '   AND ( CODDOCUMENTO IS NOT NULL ) '                              + #13 +
               '   AND ( FLGENVIO = 0 ) '                                          + #13 +
               '   AND ( FLGDIVERGPEND IS NULL OR FLGDIVERGPEND = 0 ) '            + #13 +
               '   AND ( HMEANOCOBRANCA    = ' + sAnoCobranca + ' ) '              + #13 +
               '   AND ( HMEMESCOBRANCA    = ' + sMesCobranca + ' ) '              + #13 +
               '   AND ( IDCONTRATOEMPTMO  = ' + IntToStr(iIdContrato) + ' ) '     + #13;

           Sql.Text := sSQL;
           Open;
      end;

      (* Seleção dos documentos para gerar boleto *)
      sSQLAgrupaDocs :=
            'SELECT ' + #13 +
            '   CODDOCUMENTO, DATAVENCTO, CODPORTFORMA, '              + #13 +
            'FROM '                                                    + #13 +
            '   DOCUMENTO '                                            + #13 +
            'WHERE '                                                   + #13 +
            '   AND ( (EMISBLOQ <> ''S'') OR (EMISBLOQ IS NULL) ) '    + #13 +
            '   AND ( (RTRIM(STATUS) <> ''2'') OR (STATUS IS NULL) ) ' + #13 +
            '   AND ( DATAVENCTO = TO_DATE(' + QuotedStr(edtDataVencimento.Text) + ',' + QuotedStr('dd/mm/yyyy')+') )' + #13;

      if cbxAgrupaParcela.Checked then begin

         with qryAux do begin
              sDocumentos := '';

              while not eof do begin
                 sDocumentos := sDocumentos + qryAux.FieldByname('CODDOCUMENTO').AsString;

                 Next;

                 if not eof then sDocumentos := sDocumentos + ',';

              end;

              Close;
         end;

         with qryAgrupaDocs do begin
              SQL.Text := sSQLAgrupaDocs +
                          '   AND ( CODDOCUMENTO IN (' + sDocumentos + ') )' + #13;
         end;

         // agrupa todos os documentos daquele contrato que tenham o mesmo vencimento
         // e já altera o EMISBLOQ para 'N'
         Documento.IntBanco.AgrupaDocCNAB(qryAgrupaDocs, True, True, True, True, ['DATAVENCTO']);

      end;

   finally

      sResult.Free;
      sErro.Free;
   end;

end;



end.



