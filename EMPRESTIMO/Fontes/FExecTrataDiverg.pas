unit FExecTrataDiverg;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   IvDictio, IvMulti, IvEMulti, ComCtrls, StdCtrls, MAHlpBtn,
   Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, Wwdatsrc, DBTables,
   Wwquery, wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, DBCtrls,
   Grids, Wwdbigrd, Wwdbgrid, fcButton, fcImgBtn, fcShapeBtn, wwdblook,
   FSairAjudaImob, MontaSelect, DBGrids, mContratoEmptmo,
   wwdbedit, Wwdbspin,

   uTypesEmptmo;

type
   TfrmExecTrataDiverg = class(TfrmSairAjudaImob)
      ntbPrincipal: TNotebook;
      btnContinuaSelecao: TfcShapeBtn;
      Panel4: TPanel;
      btnCancelaAltera: TfcShapeBtn;
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
      dtsHistMovVirtual: TwwDataSource;
      qryHistMovVirtual: TwwQuery;
      DBrdgDebito: TRadioGroup;
      pnlCAR: TPanel;
      Label30: TLabel;
      DBcboFormaRecebimento: TwwDBLookupCombo;
      qryHistMov: TwwQuery;
      dtsHistMov: TwwDataSource;
      updHistMovVirtual: TUpdateSQL;
      lblTitulo: TfcLabel;
      qryIDINSCRICAOEMPTMO: TFloatField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      Label5: TLabel;
      DBcboTipoContrato: TwwDBLookupCombo;
      DBcboPatro: TwwDBLookupCombo;
      Label1: TLabel;
      qryHistMovFLGESCOLHA: TStringField;
      qryHistMovHMEANOCOMPETENCIA: TFloatField;
      qryHistMovHMEMESCOMPETENCIA: TFloatField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      qryHistMovHMETIPOMOV: TFloatField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovHMESALDODEV: TFloatField;
      qryHistMovHMETXJUROS: TFloatField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovHMEFORMACOBRANCA: TStringField;
      qryHistMovIDHISTMOVEMPTMO: TFloatField;
      QryAux: TwwQuery;
      qryHistMovHMEANOCOBRANCA: TFloatField;
      qryHistMovHMEMESCOBRANCA: TFloatField;
      qryHistMovIDPATRO: TFloatField;
      qryHistMovIDPLANOPREV: TFloatField;
      qryHistMovDATAASSINATURA: TDateTimeField;
      qryHistMovIDSITPART: TFloatField;
      qryHistMovFLGINTERNO: TStringField;
      qryHistMovNOME: TStringField;
      UpdHistMov: TUpdateSQL;
      qryHistMovVirtualITEDESCRICAO: TStringField;
      qryHistMovVirtualEVENTO: TStringField;
      qryHistMovVirtualANOMES: TStringField;
      qryHistMovVirtualHMEANOCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMEMESCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMESEQCOBRANCA: TFloatField;
      qryHistMovVirtualHMETIPOMOV: TFloatField;
      qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
      qryHistMovVirtualIDITEMEMPTMO: TFloatField;
      qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField;
      qryHistMovVirtualHMEVLRPREVISTO: TFloatField;
      qryHistMovVirtualHMESALDODEV: TFloatField;
      qryHistMovVirtualHMETXJUROS: TFloatField;
      qryHistMovVirtualHMEPARCELA: TFloatField;
      qryHistMovHMEDATAATUALIZA: TDateTimeField;
      qryHistMovHMENUMPARCELAS: TFloatField;
      molContratoEmptmo1: TmolContratoEmptmo;
      Label7: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboPlano: TwwDBLookupCombo;
      Label8: TLabel;
      DBgrdHistMovVirtual: TwwDBGrid;
      btnConfirmar: TfcShapeBtn;
      btnContinuaEncerra: TfcShapeBtn;
      DBgrdHistMov: TwwDBGrid;
      Panel1: TPanel;
      btnInverteSelecao: TBitBtn;
      btnMarcaTodos: TBitBtn;
      fcShapeBtn1: TfcShapeBtn;
      qryHistMovITEDESCRICAO: TStringField;
    qryMOECODIGO: TFloatField;
    qryVLRSALBASE: TFloatField;
    qryVLRMARGEM: TFloatField;
    qryVLRMAXPERMIT: TFloatField;
    Panel2: TPanel;
    Label3: TLabel;
    dbspAnoCob: TwwDBSpinEdit;
    cboMesCobranca: TComboBox;
    Panel5: TPanel;
    Label4: TLabel;
    dbspAnoComp: TwwDBSpinEdit;
    cboMesCompet: TComboBox;
    chkCobranca: TCheckBox;
    chkCompetencia: TCheckBox;
    grpCompetencia: TGroupBox;
    Label15: TLabel;
    Label2: TLabel;
    DBspnAno: TwwDBSpinEdit;
    cboMes: TComboBox;
    edtDataLancamento: TwwDBDateTimePicker;
    qryHistMovCOMPETENCIA: TStringField;
    qryHistMovCOBRANCA: TStringField;
    qryMOESIGLA: TStringField;
    chkTodos: TCheckBox;

      procedure btnContinuaSelecaoClick(Sender: TObject);
      procedure btnCancelaAlteraClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure DBrdgDebitoClick(Sender: TObject);
      procedure DBgrdVlrAtualizadosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdVlrAtualizadosTopRowChanged(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnInverteSelecaoClick(Sender: TObject);
      procedure btnMarcaTodosClick(Sender: TObject);
      procedure qryHistMovFLGESCOLHAChange(Sender: TField);
      procedure molContratoEmptmo1btnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmo1btnLimpaContratoClick(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure btnContinuaEncerraClick(Sender: TObject);
      procedure btnConfirmarClick(Sender: TObject);
      procedure fcShapeBtn1Click(Sender: TObject);
      procedure cboMesExit(Sender: TObject);


   private { Private declarations }

      rContrato  : TDadosContrato;
      vLista     : TListaItem;

      procedure Sel(i: Int64);

      procedure AbreQueriesDebito;
      procedure AbreQueries;

      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;
      procedure PreencheTabelaVirtual;

      function Contabiliza: Integer;

      function VerificaBaixa: Boolean;
      function VerificaPreenchimento: Boolean;


   public { Public declarations }

      iContMarcados : Integer;

   end;



var
  frmExecTrataDiverg: TfrmExecTrataDiverg;



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
   uDiasInUteis,
   DBaseDados,
   UCalcEmptmo,
   uDataBase,
   uVerificaPreenchimento,
   fAguarde, dMS, DDividaEP;



procedure TfrmExecTrataDiverg.FormCreate(Sender: TObject);
begin
   inherited;

   ntbPrincipal.PageIndex  := 0;
   iContMarcados           := 0;
end;



procedure TfrmExecTrataDiverg.HabilitaBotoes;
begin
   btnContinuaEncerra.Enabled := True;
   btnCancelaAltera.Enabled   := True;
   btnConfirmar.Enabled       := True;
   bbtnAjuda.Enabled          := True;
   bbtnSair.Enabled           := True;

   ntbPrincipal.Enabled       := True;
   Screen.Cursor              := crDefault;
end;



procedure TfrmExecTrataDiverg.DesabilitaBotoes;
begin
   Screen.Cursor              := crHourGlass;
   ntbPrincipal.Enabled       := False;

   btnContinuaEncerra.Enabled := False;
   btnCancelaAltera.Enabled   := False;
   btnConfirmar.Enabled       := False;
   bbtnAjuda.Enabled          := False;
   bbtnSair.Enabled           := False;
end;



procedure TfrmExecTrataDiverg.Sel(i: Int64);
begin
   (* abre a query principal com os parâmetros passados *)
   with qry do begin
      (* Procedure da unit UFuncoesEmptmo que fecha a query e limpa todos os parâmetros *)
      LimpaParametros(qry);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger := i;
      Open;
   end;
end;



procedure TfrmExecTrataDiverg.AbreQueriesDebito;
begin
   (* Procedure que abre as queries utilizadas quando o Débito do Empréstimo
      será pelo CAR *)

   with dtmLookEmptmo.qryLookPortadorFormaR do begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
   end;(* with dtmLookEmptmo *)
end;



procedure TfrmExecTrataDiverg.AbreQueries;
begin
   (* Tipo de Empréstimo *)
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   (* Patrocinadora *)
   LimpaParametros(dtmLookEmptmo.qryLookPatro);
   dtmLookEmptmo.qryLookPatro.Open;

   (* Plano *)
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;



function TfrmExecTrataDiverg.VerificaBaixa: Boolean;
var
   sSql              : String;
   fSaldo            : Real;
   fSaldoOutraMoeda  : Real;
begin
   (* Cria a Query Auxiliar *)

   sSql :=
   'SELECT '                                                                     + #13 +
   '  HMEDATAEFETIVA, CODDOCUMENTO '                                             + #13 +
   'FROM '                                                                       + #13 +
   '  HISTMOVEMPTMO '                                                            + #13 +
   'WHERE '                                                                      + #13 +
   '      ( IDCONTRATOEMPTMO = ' + IntToStr(rContrato.IDContratoEmptmo) + ' ) '  + #13 +
   '  AND ( HMETIPOMOV       = 0 ) '                                             + #13 +
   '  AND ( HMECENTRALIZA    = 1 )';

   dtmEmptmo.qryAuxEmptmo.SQL.Clear;
   dtmEmptmo.qryAuxEmptmo.SQL.Text := sSql;


   try
      dtmEmptmo.qryAuxEmptmo.Open;

      if not(dtmEmptmo.qryAuxEmptmo.FieldByName('HMEDATAEFETIVA').IsNull) then begin

         (* Participante já recebeu o Crédito do EP, logo pode quitar o EP *)
         Result := True;

      end else begin

         (* Participante NÃO recebeu o Crédito do EP *)
         Documento.Saldo.GetSaldoDoc(dtmEmptmo.qryAuxEmptmo.FieldByName('CODDOCUMENTO').AsInteger,
                                     '',  (* Data do Saldo - Saldo Atual *)
                                     'P', (* RecPag *) fSaldo, fSaldoOutraMoeda);

         if fSaldo = 0 then begin
            (* Crédito já pago pelo contas a Pagar, logo o participante pode
               quitar o EP *)
            Result := True;
         end else begin
            (* Crédito ainda NÃO foi pago pelo contas a Pagar, logo o participante
               não poderá quitar o EP *)
            Result := False;
         end;(* if Saldo *)

      end;(* if DataEfetiva *)

   finally
      dtmEmptmo.qryAuxEmptmo.Close;
   end;
end;



function TfrmExecTrataDiverg.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try

      if cboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar a Mês de Competência!', cboMes);

      if DBspnAno.Value < 1980 then
         raise EValidacao.CreateVal('É necessário indicar a Ano de Competência!', DBspnAno);

      if edtDataLancamento.Date <= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Lançamento!', edtDataLancamento);

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



procedure TfrmExecTrataDiverg.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;

   if not(VerificaPreenchimento) then Exit;

   (* Busca Registros a processar *)

   (* abre a query HistMovVirtual com os parâmetros passados *)
   with qryHistMov do begin
      LimpaParametros(qryHistMov);

      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.idEmpresa;

      if molContratoEmptmo1.IdContrato > 0   then ParamByName('PIDCONTRATOEMPTMO').AsInteger    := molContratoEmptmo1.IdContrato;
      if DBcboTipoEmptmo.LookupValue <> ''   then ParamByName('PIDTIPOEMPTMO').AsInteger        := StrToInt(DBcboTipoEmptmo.LookupValue);
      if DBcboTipoContrato.LookupValue <> '' then ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := StrToInt(DBcboTipoContrato.LookupValue);
      if DBcboPatro.LookupValue <> ''        then ParamByName('PIDPATRO').AsInteger             := StrToInt(DBcboPatro.LookupValue);
      if DBcboPlano.LookupValue <> ''        then ParamByName('PIDPLANOPREV').AsInteger         := StrToInt(DBcboPlano.LookupValue);

      if chkCobranca.Checked then begin
         ParamByName('PHMEMESCOBRANCA').AsInteger := cboMesCobranca.ItemIndex + 1;
         ParamByName('PHMEANOCOBRANCA').AsInteger := Trunc(dbspAnoCob.Value);
      end;

      if chkCompetencia.Checked then begin
         ParamByName('PHMEMESCOMPETENCIA').AsInteger := cboMesCompet.ItemIndex + 1;
         ParamByName('PHMEANOCOMPETENCIA').AsInteger := Trunc(dbspAnoComp.Value);
      end;
      
      Open;

      if IsEmpty then begin
         DBgrdHistMovVirtual.Enabled := False;
      end else begin
         DBgrdHistMovVirtual.Enabled := True;
      end;

   end;

   ntbPrincipal.PageIndex  := 1;
end;



function TfrmExecTrataDiverg.Contabiliza: Integer;
var
   sSQL           : String;
   sHistorico     : String;
   sResult, sErro : TStringList;
   iPlanilha      : Integer;
begin
   (* monta o select que será passado para para a função de contabilização *)

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '   H.IDHISTMOVEMPTMO, '                                                                  + #13 +
   '   H.IDCONTRATOEMPTMO, TC.IDTIPOCONTREMPTMO, '                                           + #13 +
   '   C.IDPLANOPREV, C.IDPATRO, '                                                           + #13 +
   '   H.IDITEMEMPTMO, H.IDITEMCENTRALIZA, '                                                 + #13 +
   '   ( ' +
   '   (LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, ''0000'')))) ' +
   '   || ' +
   '   (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, ''00'')))) ' +
   '   ) AS ANOMES, '                                                                        + #13 +

   '   H.HMEFORMACOBRANCA, '                                                                 + #13 +
   '   H.HMEVLRPREVISTO, H.HMEVLREFETIVO, '                                                  + #13 +

   '   ITC.TIPCODIGO '                                                                       + #13 +

   'FROM '                                                                                   + #13 +
   '   HISTMOVEMPTMO H, ITEMXTIPOCONTR ITC, CONTRATOEMPTMO C, '                              + #13 +
   '   TIPOCONTREMPTMO TC, TIPOEMPTMO TE '                                                   + #13 +

   'WHERE '                                                                                  + #13 +
   '       ( H.HMEORIGEM            = 4 ) '                                                  + #13 +
   '   AND ( H.HMETIPOMOV           = 4 ) '                                                  + #13 +
   '   AND ( (H.FLGDIVERGPEND       = 0) OR ( H.FLGDIVERGPEND IS NULL) ) '                   + #13 +
   '   AND ( H.PLNCODIGO            IS NULL ) '                                              + #13 +
   '   AND ( H.PLNCODIGOESTORNO     IS NULL) '                                               + #13 +
   '   AND ( (H.FLGESTORNADO        = 0) OR (H.FLGESTORNADO IS NULL) )'                      + #13 +
   '   AND ( H.FLGBAIXADO           = 0 ) '                                                  + #13 +
   '   AND ( TE.IDEMPRESAPROP       = ' + IntToStr (Sistema.IDEmpresa) + ' ) '               + #13 +
   '   AND ( H.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTMO ) '                                 + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO ) '                               + #13 +
   '   AND ( TC.IDTIPOEMPTMO        = TE.IDTIPOEMPTMO ) '                                    + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( H.IDITEMEMPTMO         = ITC.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( ITC.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO ) '                               + #13 +

   'ORDER BY '                                                                               + #13 +
   '   HMEPARCELA, H.IDCONTRATOEMPTMO ';


   (* prepara o Histórico-padrão que será passado adiante *)
   sHistorico  := 'Atualização de valores devidos de Empréstimos, ref: ' + FormatDateTime('dd/mm/yyyy', Sysdate);

   (* chama a função de contabilização passando o SQL acima *)
   Result := IntegraEmptmo.ContabilizaItens('C', 'N', sSQL, sHistorico, edtDataLancamento.Date,
                                            sResult, sErro, iPlanilha);
end;




procedure TfrmExecTrataDiverg.btnCancelaAlteraClick(Sender: TObject);
begin
   inherited;

   (* Confirma transação *)
   if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;


   qryHistMov.Close;
   frmAguarde.Apaga;

   ntbPrincipal.PageIndex  := 0;
end;



procedure TfrmExecTrataDiverg.DBrdgDebitoClick(Sender: TObject);
begin
  inherited;

  if DBrdgDebito.ItemIndex = 0 then begin

      AbreQueriesDebito;

      DBcboFormaRecebimento.LookupValue := dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsString;

      (* Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
         Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
         e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox *)
      AtualizaConjunto(True, pnlCAR);


   end else begin

      (* Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
         Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
         e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox *)
      AtualizaConjunto(False, pnlCAR);
   end;
end;



procedure TfrmExecTrataDiverg.DBgrdVlrAtualizadosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   if qryHistMov.IsEmpty then Exit;

   (* faz com que as linhas do grid tenham cores alternadas *)
   if State <> [gdSelected] then begin
      if not Highlight then begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; (* amarelo bebê *)
         end else begin
            ABrush.Color := clWhite;
         end;

         { Caso Selecionado muda cor }
         if qryHistMov.FieldByName('FLGESCOLHA').AsInteger = 1 then begin
            AFont.Color  := clWhite;
            ABrush.Color := clRed;
         end;
      end;

   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecTrataDiverg.DBgrdVlrAtualizadosTopRowChanged(Sender: TObject);
begin
   inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecTrataDiverg.FormShow(Sender: TObject);
begin
   inherited;

   ntbPrincipal.PageIndex  := 0;

   (* preenche a data de lançamento e o ano de referência/competência *)
   cboMes.ItemIndex        := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasInUteis.ExtraiAno(Date);
   edtDataLancamento.Date  := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1);

   cboMesCobranca.ItemIndex := cboMes.ItemIndex;
   cboMesCompet.ItemIndex   := cboMes.ItemIndex;
   dbspAnoCob.Value         := DBspnAno.Value;
   dbspAnoComp.Value        := DBspnAno.Value;

   AbreQueries;
end;



procedure TfrmExecTrataDiverg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   dtmLookEmptmo.qryLookTipoContrato.Close;
   dtmLookEmptmo.qryLookPatro.Close;
end;



procedure TfrmExecTrataDiverg.btnInverteSelecaoClick(Sender: TObject);
var
   bMostra: Boolean;
begin
   inherited;

   bMostra := False;

   if qryHistMov.RecordCount > 100 then begin

      qryHistMov.DisableControls;

      { Acerta tela de acompanhamento }
      frmAguarde.Max := qryHistMov.RecordCount;
      frmAguarde.Pos := 0;

      frmAguarde.Mostra('Processando, Aguarde...');

      bMostra := True;
   end;

   qryHistMov.First;
   while not(qryHistMov.EOF) do begin

      qryHistMov.Edit;
      if qryHistMov.FieldByName('FLGESCOLHA').AsString = '1' then begin
         qryHistMov.FieldByName('FLGESCOLHA').AsString := '0';
      end else begin
         qryHistMov.FieldByName('FLGESCOLHA').AsString := '1';
      end;

      qryHistMov.Next;

      (* Atualiza tela de acompanhamento *)
      if bMostra then frmAguarde.Pos := frmAguarde.Pos + 1;
   end;

   if qryHistMov.Active then qryHistMov.First;

   qryHistMov.EnableControls;

   if bMostra then frmAguarde.Apaga;
end;



procedure TfrmExecTrataDiverg.btnMarcaTodosClick(Sender: TObject);
var
   Mostra: Boolean;
begin
   inherited;

   Mostra := False;

   if qryHistMov.RecordCount > 100 then begin
     qryHistMov.DisableControls;
     { Acerta tela de acompanhamento }
     frmAguarde.Max := qryHistMov.RecordCount;
     frmAguarde.Pos := 0;

     frmAguarde.Mostra('Processando, Aguarde...');

     Mostra := True;
   end;

   qryHistMov.First;
   While Not qryHistMov.EOF do begin

     qryHistMov.Edit;
     qryHistMov.FieldByName('FLGESCOLHA').AsString := '1';
     qryHistMov.Post;

     qryHistMov.Next;

     if Mostra = True then begin
       { Atualiza tela de acompanhamento }
       frmAguarde.Pos := frmAguarde.Pos + 1;
     end;

   end;

   if qryHistMov.Active then
     qryHistMov.First;

   qryHistMov.EnableControls;

   if Mostra = True then frmAguarde.Apaga;
end;



procedure TfrmExecTrataDiverg.PreencheTabelaVirtual;
var
   i : Integer;
begin
   (* Laço que varre o vetor Lista inserindo na tabela virtual TODOS os
      itens calculados *)
   for i := 0 to High(vLista) do begin

      qryHistMovVirtual.Insert;

      qryHistMovVirtualITEDESCRICAO.AsString       := vLista[i].Nome;
      qryHistMovVirtualANOMES.AsString             := FormatFloat('00', cboMes.ItemIndex + 1) + '/' + FormatFloat('0000', DBspnAno.Value);
      qryHistMovVirtualHMEANOCOMPETENCIA.AsInteger := vLista[i].AnoCompetencia;
      qryHistMovVirtualHMEMESCOMPETENCIA.AsInteger := vLista[i].MesCompetencia;
      qryHistMovVirtualHMESEQCOBRANCA.AsInteger    := vLista[i].SeqCobranca;
      qryHistMovVirtualHMETIPOMOV.AsInteger        := vLista[i].iEvento;

      case vLista[i].iEvento of
        0: qryHistMovVirtualEVENTO.AsString        := 'Concessão';
        1: qryHistMovVirtualEVENTO.AsString        := 'Parcela';
        2: qryHistMovVirtualEVENTO.AsString        := 'Amortização';
        3: qryHistMovVirtualEVENTO.AsString        := 'Quitação';
        4: qryHistMovVirtualEVENTO.AsString        := 'Atualização Débito';
      end;(* case *)

      qryHistMovVirtualIDCONTRATOEMPTMO.AsInteger  := rContrato.IDContratoEmptmo;
      qryHistMovVirtualIDITEMEMPTMO.AsInteger      := vLista[i].CodigoItem;
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := vLista[i].DataPrevista;
      qryHistMovVirtualHMEVLRPREVISTO.AsCurrency   := vLista[i].Valor;
      qryHistMovVirtualHMESALDODEV.AsCurrency      := vLista[i].SaldoDevedor;
      qryHistMovVirtualHMETXJUROS.AsCurrency       := vLista[i].TxJuros;
      qryHistMovVirtualHMEPARCELA.AsInteger        := vLista[i].Parcela;

      qryHistMovVirtual.Post;

   end;(* for *)
end;



procedure TfrmExecTrataDiverg.qryHistMovFLGESCOLHAChange(Sender: TField);
begin
   inherited;
   { Atualiza Contador }

   if qryHistMov.FieldByName('FLGESCOLHA').Asinteger = 1 then begin
     inc(iContMarcados);
   end else begin
     dec(iContMarcados);
   end;

   { Mostra ou não Opcoes }
   if iContMarcados > 1 then begin
     DBrdgDebito.Enabled   := False;
     DBrdgDebito.ItemIndex := 2;
   end else begin
     DBrdgDebito.Enabled   := True;
   end;
end;



procedure TfrmExecTrataDiverg.molContratoEmptmo1btnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo1.btnBuscaContratoClick(Sender);

   Repaint;

   if dtmMS.MS_ContratoEmptmo.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      (* abre a query principal com o participante escolhido *)
      Sel(StrToInt(dtmMS.MS_ContratoEmptmo.ValoresChave[0]));

      PreencheDadosContrato(qry, rContrato);

      (* Verifica se o Participante já recebeu o Crédito do Empréstimo *)
      if VerificaBaixa then begin

         btnContinuaSelecao.Enabled := True;

      end else begin

         btnContinuaSelecao.Enabled := False;
         MsgDlg('Crédito do Empréstimo NÃO efetivado.' + #13 +
                'Utilize o Cancelamento de Concessão', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

      end; (* if *)

      Screen.Cursor := crDefault;

   end; (* if MontaSelect.RetornouValor *)
end;



procedure TfrmExecTrataDiverg.molContratoEmptmo1btnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo1.btnLimpaContratoClick(Sender);
end;



procedure TfrmExecTrataDiverg.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   (* seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado *)
   with dtmLookEmptmo.qryLookTipoContrato do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;

      end else begin
         DBcboTipoContrato.Enabled := False;
      end;

   end;
end;



procedure TfrmExecTrataDiverg.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   (* seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado *)
   with dtmLookEmptmo.qryLookTipoContrato do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;

      end else begin
         DBcboTipoContrato.Enabled := False;
      end;

   end;
end;



procedure TfrmExecTrataDiverg.btnContinuaEncerraClick(Sender: TObject);
var
   iParcela, iParcAnt   : Integer;
   iNovoAnoCompetencia  : Integer;
   iNovoMesCompetencia  : Integer;
   sMensErro            : String;
   sFlgEnvio            : String;
   sNovaFormaCobranca   : String;
   sNovaDataCobranca    : String;
   sNovoMesCobranca     : String;
   sNovoAnoCobranca     : String;
   iIdHistMovEmptmo     : Int64;
begin
   inherited;

   qryHistMovVirtual.Close;
   qryHistMovVirtual.Open;

   try
      (* Gera nova forma de cobrança caso desejado *)
      if DBrdgDebito.ItemIndex <> 2 then begin
         if DBrdgDebito.ItemIndex = 0 then begin
            sNovaFormaCobranca := 'C';
         end else begin
            sNovaFormaCobranca := 'F';
         end;
      end;

      sFlgEnvio   := '0';

      sMensErro   := '';

      DesabilitaBotoes;

      (* Inicia uma transação *)
      if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

         try
            (* Varre todo historico de Divergencias e trata as escolhidas *)
            with qryHistMov do begin

               DisableControls;

               (* Acerta tela de acompanhamento *)
               frmAguarde.Max := RecordCount;
               frmAguarde.Pos := 0;

               frmAguarde.Mostra('Processando, Aguarde...');

               First;

               iParcAnt := -1;

               while not(EOF) do begin

                  (* Atualiza tela de acompanhamento *)
                  frmAguarde.Pos := frmAguarde.Pos + 1;

                  iParcela             := FieldByName('HMEPARCELA').AsInteger;

                  (* calcula nova competência *)
                  iNovoAnoCompetencia  := trunc(DBspnAno.Value);
                  iNovoMesCompetencia  := cboMes.ItemIndex + 1;
   {
                  iNovoAnoCompetencia  := DiasInUteis.ExtraiAno(DiasInUteis.SomaMeses(EncodeDate(FieldByName('HMEANOCOMPETENCIA').AsInteger,
                                          FieldByName('HMEMESCOMPETENCIA').AsInteger, 1), 1));
                  iNovoMesCompetencia  := DiasInUteis.ExtraiMes(DiasInUteis.SomaMeses(EncodeDate(FieldByName('HMEANOCOMPETENCIA').AsInteger,
                                          FieldByName('HMEMESCOMPETENCIA').AsInteger, 1), 1));
   }
                  (* Caso não tenha sido selecionado pula *)

                  if not chkTodos.Checked then begin
                     if ( (FieldByName('FLGESCOLHA').AsInteger = 0) or (iParcela = iParcAnt) ) then begin
                        Next;
                        Continue;
                     end;
                  end;
                  
                  { Acerta forma de Cobranca caso seja sempre a mesma }
                  if DBrdgDebito.ItemIndex = 2 then sNovaFormaCobranca := FieldByName('HMEFORMACOBRANCA').AsString;
{
                  (* Busca nova data de Cobranca no Calendario da Patrocinadora *)
                  sNovaDataCobranca := CalcEmptmo.CritDataEmptmo(qryAux, FieldByName('IDPATRO').AsString,
                                                                 FieldByName('IDPLANOPREV').AsString,
                                                                 FieldByName('FLGINTERNO').AsString,
                                                                 'A' (* ATRASO *),
                                                                 IntToStr(FieldByName('HMEMESCOBRANCA').AsInteger),
                                                                 IntToStr(FieldByName('HMEANOCOBRANCA').AsInteger),
                                                                 sNovaFormaCobranca,
                                                                 FieldByName('DATAASSINATURA').AsString,
                                                                 FieldByName('HMEPARCELA').AsInteger);

                  (* Caso não tenha data no calendario *)
                  if trim(sNovaDataCobranca) = '' then begin
                     sNovaDataCobranca := FormatDateTime('dd/mm/yyyy', FieldByName('HMEDATAPREVISTA').AsDateTime);
                  end;
}

                  sNovaDataCobranca := DateToStr(edtDataLancamento.Date);

                  (* Calcula novos dados da Cobrança *)
                  sNovoMesCobranca := Copy(sNovaDataCobranca, 4, 2);
                  sNovoAnoCobranca := Copy(sNovaDataCobranca, 7, 4);


                  (* abre a query principal com o participante escolhido *)
                  Sel(FieldByName('IDCONTRATOEMPTMO').AsInteger);


                  (* Processa Registro Selecionado --------------------------------------------------- *)

                  (* Preenche registro com os dados do Contrato *)
                  PreencheDadosContrato(qry, rContrato);

                  (* Limpa a lista de itens *)
                  SetLength(vLista, 0);

                  (* Calcula novos itens de Cobranca *)
                  if not(CalcEmptmo.CalculaItensDiverg(rContrato, 4 (* Origem *),
                                                       iParcela, FieldByName('HMENUMPARCELAS').AsInteger,
                                                       iNovoAnoCompetencia,
                                                       iNovoMesCompetencia,
                                                       edtDataLancamento.Date,   (* data do processo - para Saldo Anterior *)
                                                       StrToDate(sNovaDataCobranca), (* novo vencimento *)
                                                       StrToDate(sNovaDataCobranca), (* data de atualização *)
                                                       sNovaFormaCobranca,
                                                       vLista,
                                                       True, False) ) then

                  begin
                     (* Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
                        por Cancelamento do Usuário, logo o procedimento será abortado *)
                     Exit;
                  end;

                  CalcEmptmo.GravaMovEmptmo(rContrato, vLista, 4 (* = Atualização *),
                                            iParcela,
                                            iNovoAnoCompetencia, iNovoMesCompetencia,
                                            StrToInt(sNovoAnoCobranca), StrToInt(sNovoMesCobranca),
                                            rContrato.NumParcelas, (* nº de parcelas remanescentes *)
                                            StrToDate(sNovaDataCobranca), StrToDate(sNovaDataCobranca),
                                            '', False  (* mostra progresso *),iIdHistMovEmptmo);

                  (* Preenche a Tabela de Resultados *)
                  PreencheTabelaVirtual;

                  (* Atualiza Tabela de Historico *)
                  dtmEmptmo.qryAuxEmptmo.SQL.Clear;
                  dtmEmptmo.qryAuxEmptmo.SQL.Text :=
                  'UPDATE '                                                                                    + #13 +
                  '  HISTMOVEMPTMO '                                                                           + #13 +
                  'SET '                                                                                       + #13 +
                  '  HMEANOCOBRANCA       = ' + QuotedStr(sNovoAnoCobranca)    + ', '                          + #13 +
                  '  HMEMESCOBRANCA       = ' + QuotedStr(sNovoMesCobranca)    + ', '                          + #13 +
                  '  HMEFORMACOBRANCA     = ' + QuotedStr(sNovaFormaCobranca)  + ', '                          + #13 +
                  '  HMEDATAVENCTO        = TO_DATE(' + QuotedStr(sNovaDataCobranca) + ', ''DD/MM/YYYY''), '   + #13 +
                  '  FLGENVIO             = 0, '                                                               + #13 +
                  '  FLGDIVERGPEND        = NULL '                                                                + #13 +
                  'WHERE '                                                                                     + #13 +
                  '      IDCONTRATOEMPTMO = ' + IntToStr(FieldByName('IDCONTRATOEMPTMO').AsInteger)            + #13 +
                  '  AND HMEPARCELA       = ' + IntToStr(FieldByName('HMEPARCELA').AsInteger)                  + #13 +
                  '  AND FLGDIVERGPEND    = 1 '                                                                + #13 +
                  '  AND (HMECENTRALIZA   = 1 OR HMEDESTACADO = 1) ';

                  dtmEmptmo.qryAuxEmptmo.ExecSQL;

                  (* Proximo Registro do Historico *)
                  Next;
                  iParcAnt := iParcela;
               end; { While }

            First;
            EnableControls;
         end; { with }

         ntbPrincipal.PageIndex := 2;
         Repaint;

      except

         (* Caso tenha ocorrido um erro, Cancela transação *)
         if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
         Raise;

      end;

   finally
      frmAguarde.Apaga;
      HabilitaBotoes;
   end;
end;



procedure TfrmExecTrataDiverg.btnConfirmarClick(Sender: TObject);
var
   iResultContab: Integer;
begin
   inherited;

   if not(VerificaPreenchimento) then Exit;

   (* Confirma transação *)
   if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

   try
      DesabilitaBotoes;

      try
         if ( (ParametrosSistema) and (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) ) then begin

            iResultContab := Contabiliza;

            case iResultContab of
               -2: MsgDlg('Não foram encontrados Itens a contabilizar!', 'Empréstimo', mtWarning, [mbOk], 0);
               -1: MsgDlg('Não foi possivel abrir a seleção de Itens a contabilizar!', 'Empréstimo', mtWarning, [mbOk], 0);
            end;
            Repaint;

         end;


      except
         Raise;
         Repaint;
      end;

   finally
      EscondeEspera;
      Repaint;

      ntbPrincipal.PageIndex := 0;
      Repaint;

      HabilitaBotoes;
   end;
end;



procedure TfrmExecTrataDiverg.fcShapeBtn1Click(Sender: TObject);
begin
   inherited;

   (* Confirma transação *)
   if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;


   qryHistMovVirtual.Close;
   frmAguarde.Apaga;

   ntbPrincipal.PageIndex  := 1;
end;



procedure TfrmExecTrataDiverg.cboMesExit(Sender: TObject);
begin
   inherited;
   edtDataLancamento.Date  := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1);
end;



end.
