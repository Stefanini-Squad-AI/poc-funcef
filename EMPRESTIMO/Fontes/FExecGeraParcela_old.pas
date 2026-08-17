unit FExecGeraParcela_old;

//	-------------------------------------------------------------------------------------------------
//
//	   Geração Mensal de Parcelas
//
//	Autor             :  André Pontes
//	Data de Início    :  16/08/2001
//	Data de Término   :
//
//	Modificações      :
//
// -------------------------------------------------------------------------------------------------

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizard, StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, fcButton,
   fcImgBtn, fcShapeBtn, wwdbdatetimepicker, CMDateTimePicker, Mask,
   wwdbedit, Wwdbspin, wwdblook, ExtCtrls, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, CheckLst, Db, DBTables,
   Wwquery, mPatro, mContratoEmptmo, uCalcEmptmo, FSairAjudaImob, DBGrids, TREdit,

   uTypesEmptmo;

type
   TfrmExecGeraParcela = class(TfrmSairAjudaImob)
      ntbPrincipal: TNotebook;
      Panel1: TPanel;
      Label15: TLabel;
      Label5: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      Bevel3: TBevel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label1: TLabel;
      Label2: TLabel;
      btnContinuar: TfcShapeBtn;
      Bevel1: TBevel;
      btnVoltar: TfcShapeBtn;
      qryContratosGeracao: TwwQuery;
      edtDataLancamento: TwwDBDateTimePicker;
      Label6: TLabel;
      lstPatro: TCheckListBox;
      BitBtn2: TBitBtn;
      BitBtn1: TBitBtn;
      Label7: TLabel;
      lstPlano: TCheckListBox;
      BitBtn3: TBitBtn;
      BitBtn4: TBitBtn;
      qryAux: TwwQuery;
      lblTitulo: TfcLabel;
      qryContratosGeracaoIDCONTRATOEMPTMO: TFloatField;
      qryContratosGeracaoIDCONTRQUITACAO: TFloatField;
      qryContratosGeracaoIDTIPOEMPTMO: TFloatField;
      qryContratosGeracaoIDINSCRICAOEMPTMO: TFloatField;
      qryContratosGeracaoIDTIPOCONTREMPTMO: TFloatField;
      qryContratosGeracaoIDPATRO: TFloatField;
      qryContratosGeracaoIDPLANOPREV: TFloatField;
      qryContratosGeracaoIDVERBA: TFloatField;
      qryContratosGeracaoIDPESSOA: TFloatField;
      qryContratosGeracaoIDBENEF: TFloatField;
      qryContratosGeracaoFLGSITUACAO: TStringField;
      qryContratosGeracaoFLGFORMAREC: TStringField;
      qryContratosGeracaoFLGFORMAPAG: TStringField;
      qryContratosGeracaoCODFORMAPAG: TFloatField;
      qryContratosGeracaoPORTFORMAREC: TFloatField;
      qryContratosGeracaoPORTFORMAPAG: TFloatField;
      qryContratosGeracaoIDCBANCARIA: TFloatField;
      qryContratosGeracaoDATAASSINATURA: TDateTimeField;
      qryContratosGeracaoDATASITUACAO: TDateTimeField;
      qryContratosGeracaoDATACREDITO: TDateTimeField;
      qryContratosGeracaoDATAPRIMPARC: TDateTimeField;
      qryContratosGeracaoDATACANC: TDateTimeField;
      qryContratosGeracaoVLRCONTRATO: TFloatField;
      qryContratosGeracaoVLRPARCELA: TFloatField;
      qryContratosGeracaoTXJUROS: TFloatField;
      qryContratosGeracaoNUMPARCELAS: TFloatField;
      qryContratosGeracaoHMEPARCELA: TFloatField;
      qryContratosGeracaoIDREGRAJURCONC: TFloatField;
      qryContratosGeracaoIDREGRALIMITES: TFloatField;
      qryContratosGeracaoIDREGRASUSPCOBR: TFloatField;
      qryContratosGeracaoIDREGRASLDDIA: TFloatField;
      qryContratosGeracaoIDREGRAJURANTCONC: TFloatField;
      qryContratosGeracaoIDREGRAELEG: TFloatField;
      qryContratosGeracaoIDREGRARESERVA: TFloatField;
      qryContratosGeracaoIDREGRAMARGEM: TFloatField;
      qryContratosGeracaoIDREGRAPRAZOSCONC: TFloatField;
      qryContratosGeracaoDATAINSC: TDateTimeField;
      molContratoEmptmo1: TmolContratoEmptmo;
      qryContratosGeracaoHMENUMPARCELAS: TFloatField;
      qryMarcaContratoEncerrado: TwwQuery;
      FloatField1: TFloatField;
      FloatField2: TFloatField;
      FloatField3: TFloatField;
      FloatField4: TFloatField;
      FloatField5: TFloatField;
      FloatField6: TFloatField;
      FloatField7: TFloatField;
      FloatField8: TFloatField;
      FloatField9: TFloatField;
      FloatField10: TFloatField;
      StringField1: TStringField;
      StringField2: TStringField;
      StringField3: TStringField;
      FloatField11: TFloatField;
      FloatField12: TFloatField;
      FloatField13: TFloatField;
      FloatField14: TFloatField;
      DateTimeField1: TDateTimeField;
      DateTimeField2: TDateTimeField;
      DateTimeField3: TDateTimeField;
      DateTimeField4: TDateTimeField;
      DateTimeField5: TDateTimeField;
      DateTimeField6: TDateTimeField;
      FloatField15: TFloatField;
      FloatField16: TFloatField;
      FloatField17: TFloatField;
      FloatField18: TFloatField;
      FloatField19: TFloatField;
      FloatField20: TFloatField;
      FloatField21: TFloatField;
      FloatField22: TFloatField;
      FloatField23: TFloatField;
      FloatField24: TFloatField;
      FloatField25: TFloatField;
      FloatField26: TFloatField;
      FloatField27: TFloatField;
      FloatField28: TFloatField;
      FloatField29: TFloatField;
      FloatField30: TFloatField;
      Total: TLabel;
      edtNumResult: TRealEdit;
      edtNumErro: TRealEdit;
      memErro: TMemo;
      memResult: TMemo;
      Panel3: TPanel;
      Panel4: TPanel;
      edtVlrTotParcela: TRealEdit;
      Label4: TLabel;
      Label8: TLabel;
      qryParcelasDivergentes: TwwQuery;
      qryParcelasDivergentesITENS_DIVERGENTES: TFloatField;
      qryContratosGeracaoMOECODIGO: TFloatField;
      qryContratosGeracaoMOESIGLA: TStringField;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure btnMarcaTodosPatroClick(Sender: TObject);
      procedure btnInvertePatroClick(Sender: TObject);
      procedure btnMarcaTodosPlanoClick(Sender: TObject);
      procedure btnInvertePlanoClick(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure cboMesExit(Sender: TObject);
      procedure DBspnAnoExit(Sender: TObject);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure molContratoEmptmo1btnBuscaContratoClick(Sender: TObject);
      procedure btnVoltarClick(Sender: TObject);


   private { Private declarations }

      vIDPatro, vIDPlano   : array of Int64;

      rSaldoDevAnt         : TSaldoDevAnt;
      rContrato            : TDadosContrato;
      vItens               : TListaItem;
      fVlrTotParcelas      : Currency;

      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;

      procedure PreenchePatro;
      procedure MarcaTodosPatro;
      function SelecaoPatro: Boolean;
      function PegaPatro: String;

      procedure PreenchePlano;
      procedure MarcaTodosPlano;
      function SelecaoPlano: Boolean;
      function PegaPlano: String;

      function PegaAnoMes: String;
      function PegaAnoMesAnt: String;

      function SelecionaContratosGeracao(const iIdPatro, iIdPlano : Int64) : Boolean;
      function ProcessaContratos(sPatro : String) : boolean;
      function GeraItensParcela: Boolean;
      function MarcaContratoEncerrado: Boolean;

      function Contabiliza: integer;

      procedure AbreQueries;
      function VerificaPreenchimento: Boolean;


   public { Public declarations }

   end;



var
  frmExecGeraParcela: TfrmExecGeraParcela;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDatabase, dBaseDados, uModulo, uVerificaPreenchimento,
   dLookEmptmo, uFuncoesEmptmo, dMS, uDiasInuteis, dEmptmo, uIntegraEmptmo,
   FProgresso;




procedure TfrmExecGeraParcela.HabilitaBotoes;
begin
   btnContinuar.Enabled := True;
   btnVoltar.Enabled    := True;
   bbtnSair.Enabled     := True;

   ntbPrincipal.Enabled := True;
   Screen.Cursor        := crDefault;
end;



procedure TfrmExecGeraParcela.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   ntbPrincipal.Enabled := False;

   btnContinuar.Enabled := False;
   btnVoltar.Enabled    := False;
   bbtnSair.Enabled     := False;
end;



procedure TfrmExecGeraParcela.PreenchePatro;
var
   i : Integer;
begin
   // Abre a tabela de patrocinadoras
   if not(dtmLookEmptmo.qryLookPatro.Active) then dtmLookEmptmo.qryLookPatro.Open;
   dtmLookEmptmo.qryLookPatro.First;

   // Limpa a lista
   lstPatro.Items.Clear;

   // Inicializa o vetor
   i := 0;
   SetLength(vIDPatro, i);

   // Preenche a listbox de patrocinadoras e o vetor...
   while not(dtmLookEmptmo.qryLookPatro.EOF) do begin

      lstPatro.Items.Add(dtmLookEmptmo.qryLookPatroNOME.AsString);

      inc(i);
      SetLength(vIDPatro, i);
      vIDPatro[i-1] := dtmLookEmptmo.qryLookPatroIDPESSOA.AsInteger;

      dtmLookEmptmo.qryLookPatro.Next;
   end;
end;



procedure TfrmExecGeraParcela.MarcaTodosPatro;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPatro.Items.Count - 1) do lstPatro.Checked[i] := True;
end;



function TfrmExecGeraParcela.SelecaoPatro: Boolean;
var
   i : Integer;
begin
   Result := False;

   // varre a lista de Patrocinadoras até que encontre 1 marcada
   for i := 0 to (lstPatro.Items.Count - 1) do begin
      if lstPatro.Checked[i] then begin
         Result := True;
         Exit;
      end;
   end;
end;



function TfrmExecGeraParcela.PegaPatro: String;
var
   i        : Integer;
   sPatros  : String;
begin
   inherited;

   sPatros := '';

   // concatena a String de patros
   for i := 0 to (lstPatro.Items.Count - 1) do begin
      if lstPatro.Checked[i] then begin
         if sPatros <> '' then sPatros := sPatros + ', ';
         sPatros := sPatros + IntToStr(vIDPatro[i]);
      end;
   end;

   Result := sPatros;
end;



procedure TfrmExecGeraParcela.PreenchePlano;
var
   i : Integer;
begin
   // Abre a tabela de Planos
   if not(dtmLookEmptmo.qryLookPlanPrev.Active) then dtmLookEmptmo.qryLookPlanPrev.Open;
   dtmLookEmptmo.qryLookPlanPrev.First;

   // Limpa a lista
   lstPlano.Items.Clear;

   // Inicializa o vetor
   i := 0;
   SetLength(vIDPlano, i);

   // Preenche a listbox de planos e o vetor...
   while not(dtmLookEmptmo.qryLookPlanPrev.EOF) do begin

      lstPlano.Items.Add(dtmLookEmptmo.qryLookPlanPrevNOME.AsString);

      inc(i);
      SetLength(vIDPlano, i);
      vIDPlano[i-1] := dtmLookEmptmo.qryLookPlanPrevIDPLANOPREV.AsInteger;

      dtmLookEmptmo.qryLookPlanPrev.Next;
   end;
end;



procedure TfrmExecGeraParcela.MarcaTodosPlano;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := True;
end;



function TfrmExecGeraParcela.SelecaoPlano: Boolean;
var
   i : Integer;
begin
   Result := False;

   // varre a lista de planos até que encontre 1 marcado
   for i := 0 to (lstPlano.Items.Count - 1) do begin
      if lstPlano.Checked[i] then begin
         Result := True;
         Exit;
      end;
   end;
end;



function TfrmExecGeraParcela.PegaPlano: String;
var
   i        : Integer;
   sPlanos  : String;
begin
   inherited;

   sPlanos := '';

   // concatena a String de planos
   for i := 0 to (lstPlano.Items.Count - 1) do begin
      if lstPlano.Checked[i] then begin
         if sPlanos <> '' then sPlanos := sPlanos + ', ';
         sPlanos := sPlanos + IntToStr(vIDPlano[i]);
      end;
   end;

   Result := sPlanos;
end;



function TfrmExecGeraParcela.PegaAnoMes: String;
var
   dData : TDateTime;
begin
   inherited;

   dData    := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1);
   Result   := FormatDateTime('YYYYMM', dData);
end;



function TfrmExecGeraParcela.PegaAnoMesAnt: String;
var
   dData : TDateTime;
begin
   inherited;

   dData    := DiasInUteis.SomaMeses(EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1), -1);
   Result   := FormatDateTime('YYYYMM', dData);
end;



procedure TfrmExecGeraParcela.btnContinuarClick(Sender: TObject);
var
   iResultContab : integer;
   iContadorPatro, iContadorPlano : integer;
begin
   inherited;

   if not(VerificaPreenchimento) then Exit;

   try
      DesabilitaBotoes;

      (* limpa os memos de resultado e erro *)
      memResult.Clear;
      memErro.Clear;

      // ----------------------------------------------------------------------------------------
      (* Seleciona os contratos Ativos *)

      for iContadorPatro := 0 to lstPatro.Items.Count - 1 do begin
          if lstPatro.Checked[iContadorPatro] then begin
             for iContadorPlano := 0 to lstPlano.Items.Count - 1 do begin
                 if lstPlano.Checked[iContadorPlano] then begin
                    if not(SelecionaContratosGeracao(vIDPatro[iContadorPatro], vIDPlano[iContadorPlano])) then begin
                       EscondeEspera;
                       Repaint;
      //                 MsgDlg('Não há Parcelas a gerar com os filtros escolhidos. ' + #13 +
      //                        '(Pode não haver Contratos ativos que satisfaçam os filtros escolhidos ou '+
      //                        'as Parcelas desses Contratos já podem ter sido geradas).' + #13 + #13 +
      //                        'Será iniciada agora a integração contábil dos itens previamente criados.',
      //                        'Empréstimo', mtInformation, [mbOk], 0);
      //                 Repaint;

                    end else begin

                       (* Itera pelos contratos, gerando (ou não) as parcelas *)
                       if not(ProcessaContratos(lstPatro.Items[iContadorPatro])) then begin
                          ntbPrincipal.PageIndex := 1;
                          Exit;
                       end;

                       qryContratosGeracao.Close;
                       
                    end;
                 end;
             end;
          end;
      end;
      // ----------------------------------------------------------------------------------------

      if ( (ParametrosSistema) and (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) ) then begin

         iResultContab := Contabiliza;

         case iResultContab of
            -2: MsgDlg('Não foram encontrados Itens a contabilizar!', 'Empréstimo', mtWarning, [mbOk], 0);
            -1: MsgDlg('Não foi possivel abrir a seleção de Itens a contabilizar!', 'Empréstimo', mtWarning, [mbOk], 0);
         end;
         Repaint;

      end;

      MsgDlg('Geração de Parcelas finalizada.', 'Empréstimo', mtInformation, [mbOk], 0);
      Repaint;

      ntbPrincipal.PageIndex := 1;

   finally
      HabilitaBotoes;
   end;
end;



function TfrmExecGeraParcela.SelecionaContratosGeracao(const iIdPatro, iIdPlano : Int64): Boolean;
var
   sSQL  : String;
   sData : String;
begin
   Result := False;

   sData  := FormatDateTime('dd/mm/yyyy', DiasInUteis.SomaMeses(EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1), 1));

   sSQL :=
   'SELECT /*+ RULE */ '                                                                     + #13 +
   '   C.IDCONTRATOEMPTMO, '                                                                 + #13 +

   '   C.IDCONTRQUITACAO, TC.IDTIPOEMPTMO, '                                                 + #13 +
   '   C.IDINSCRICAOEMPTMO, C.IDTIPOCONTREMPTMO, '                                           + #13 +

   '   C.IDPATRO, C.IDPLANOPREV, C.IDVERBA, '                                                + #13 +
   '   C.IDPESSOA, C.IDBENEF, '                                                              + #13 +

   '   C.FLGSITUACAO, C.FLGFORMAREC, C.FLGFORMAPAG, '                                        + #13 +
   '   C.CODFORMAPAG, C.PORTFORMAREC, C.PORTFORMAPAG, '                                      + #13 +
   '   C.IDCBANCARIA, '                                                                      + #13 +

   '   C.DATAASSINATURA, C.DATASITUACAO, '                                                   + #13 +
   '   C.DATACREDITO, C.DATAPRIMPARC, '                                                      + #13 +
   '   C.DATACANC, C.MOECODIGO, '                                                            + #13 +

   '   M.MOESIGLA, '                                                                         + #13 +

   '   C.VLRCONTRATO, C.VLRPARCELA, C.TXJUROS, '                                             + #13 +
   '   C.NUMPARCELAS, '                                                                      + #13 +

   '   H1.ANOMESANTERIOR, H2.HMEPARCELA, H3.HMENUMPARCELAS, '                                + #13 +

   '   TC.IDREGRAJURCONC, '                                                                  + #13 +
   '   TC.IDREGRALIMITES, '                                                                  + #13 +
   '   TC.IDREGRASUSPCOBR, '                                                                 + #13 +
   '   TC.IDREGRASLDDIA, '                                                                   + #13 +
   '   TC.IDREGRAJURANTCONC, '                                                               + #13 +
   '   TC.IDREGRAELEG, '                                                                     + #13 +
   '   TC.IDREGRARESERVA, '                                                                  + #13 +
   '   TC.IDREGRAMARGEM, '                                                                   + #13 +
   '   TC.IDREGRAPRAZOSCONC, '                                                               + #13 +

   '   I.DATAINSC '                                                                          + #13 +

   'FROM '                                                                                   + #13 +
   '   INSCRICAOEMPTMO I, '                                                                  + #13 +
   '   CONTRATOEMPTMO  C, '                                                                  + #13 +
   '   MOEDA           M, '                                                                  + #13 +
   '   TIPOCONTREMPTMO TC, '                                                                 + #13 +
   '   TIPOEMPTMO      TE, '                                                                 + #13 +

   '   ( '                                                                                   + #13 +
   '   SELECT /*+ RULE */ '                                                                  + #13 +
   '      IDCONTRATOEMPTMO, '                                                                + #13 +
   '      MAX( (LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, ''0000'')))) || '                     + #13 +
   '           (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, ''00'')))) ) AS ANOMESANTERIOR '      + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO '                                                                    + #13 +
   '   WHERE '                                                                               + #13 +
   '          ( HMETIPOMOV IN (0, 1) ) '                                                     + #13 +
   '      AND ( HMESALDODEV > 0 ) '                                                          + #13 +
   '      AND ( (HMETIPOMOV = 1) OR ((HMEDATAEFETIVA IS NOT NULL) AND (HMETIPOMOV = 0)) ) '  + #13 +
   '      AND ( (FLGESTORNADO IS NULL) OR (FLGESTORNADO = 0) ) '                             + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      IDCONTRATOEMPTMO '                                                                 + #13 +
   '   ) H1, '                                                                               + #13 +

   '   ( '                                                                                   + #13 +
   '   SELECT /*+ RULE */ '                                                                  + #13 +
   '      IDCONTRATOEMPTMO, '                                                                + #13 +
   '      MAX(HMEPARCELA) AS HMEPARCELA '                                                    + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO '                                                                    + #13 +
   '   WHERE '                                                                               + #13 +
   '          ( HMETIPOMOV IN (0, 1) ) '                                                     + #13 +
   '      AND ( HMESALDODEV > 0 ) '                                                          + #13 +
   '      AND ( (HMETIPOMOV = 1) OR ((HMEDATAEFETIVA IS NOT NULL) AND (HMETIPOMOV = 0)) ) '  + #13 +
   '      AND ( (FLGESTORNADO IS NULL) OR (FLGESTORNADO = 0) ) '                             + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      IDCONTRATOEMPTMO '                                                                 + #13 +
   '   ) H2, '                                                                               + #13 +

   '   ( '                                                                                   + #13 +
   '   SELECT /*+ RULE */ '                                                                  + #13 +
   '      IDCONTRATOEMPTMO, '                                                                + #13 +
   '      MIN(HMENUMPARCELAS) AS HMENUMPARCELAS '                                            + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO '                                                                    + #13 +
   '   WHERE '                                                                               + #13 +
   '          ( HMETIPOMOV IN (0, 1) ) '                                                     + #13 +
   '      AND ( HMESALDODEV > 0 ) '                                                          + #13 +
   '      AND ( (HMETIPOMOV = 1) OR ((HMEDATAEFETIVA IS NOT NULL) AND (HMETIPOMOV = 0)) ) '  + #13 +
   '      AND ( (FLGESTORNADO IS NULL) OR (FLGESTORNADO = 0) ) '                             + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      IDCONTRATOEMPTMO '                                                                 + #13 +
   '   ) H3 '                                                                                + #13 +

   'WHERE '                                                                                  + #13 +
   '       ( C.FLGSITUACAO        IN (''A'', ''J'') ) '                                      + #13 +
   '   AND ( C.DATAPRIMPARC       < TO_DATE(' + QuotedStr(sData) + ', ''DD/MM/YYYY'') ) '    + #13 +
   '   AND ( H1.ANOMESANTERIOR    = ' + QuotedStr(PegaAnoMesAnt) + ' ) '                     + #13;

   if molContratoEmptmo1.IdContrato > 0 then begin
      sSQL := sSQL +
   '   AND ( C.IDCONTRATOEMPTMO   = ' + intToStr(molContratoEmptmo1.IdContrato) + ' ) '      + #13;
   end;

   if DBcboTipoEmptmo.LookupValue <> '' then begin
      sSQL := sSQL +
   '   AND ( TC.IDTIPOEMPTMO = ' + DBcboTipoEmptmo.LookupValue + ' ) '                       + #13;
   end;

   if DBcboTipoContrato.LookupValue <> '' then begin
      sSQL := sSQL +
   '   AND ( C.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue + ' ) '                + #13 +
   '   AND ( TC.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '                + #13;
   end;

   sSQL := sSQL +
//   '   AND ( C.IDPATRO            IN ( ' + PegaPatro + ' ) ) '                               + #13 +
//   '   AND ( C.IDPLANOPREV        IN ( ' + PegaPlano + ' ) ) '                               + #13 +
   '   AND ( C.IDPATRO            = ' + IntToStr(iIdPatro) + ' ) '                           + #13 +
   '   AND ( C.IDPLANOPREV        = ' + IntToStr(iIdPlano) + ' ) '                           + #13 +
   '   AND ( TE.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                  + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO ) '                                 + #13 +
   '   AND ( TC.IDTIPOEMPTMO      = TE.IDTIPOEMPTMO ) '                                      + #13 +
   '   AND ( C.IDCONTRATOEMPTMO   = H1.IDCONTRATOEMPTMO ) '                                  + #13 +
   '   AND ( C.IDCONTRATOEMPTMO   = H2.IDCONTRATOEMPTMO ) '                                  + #13 +
   '   AND ( C.IDCONTRATOEMPTMO   = H3.IDCONTRATOEMPTMO ) '                                  + #13 +
   '   AND ( C.IDINSCRICAOEMPTMO  = I.IDINSCRICAOEMPTMO(+) ) '                               + #13 +
   '   AND ( C.MOECODIGO          = M.MOECODIGO(+) ) ';


   try
      MostraEspera('Selecionando Contratos para geração...');

      with qryContratosGeracao do begin
         Close;
         SQL.Clear;
         SQL.Text := sSQL;
         Open;

         if not(isEmpty) then Result := True;
      end;

   except
      MsgDlg('Erro na seleção de Contratos!', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
   end;
end;



function TfrmExecGeraParcela.ProcessaContratos(sPatro : String) : boolean;
var
   i              : Integer;
   sMsg           : String;
   bGerou         : Boolean;
   iQuantParcela  : Integer;
   iQuantErro     : Integer;
begin
   i        := 0;
   bGerou   := False; (* nenhuma parcela gerada ainda *)
   Result   := True;

   (* inicializa os acumuladores *)
   iQuantErro        := 0;
   iQuantParcela     := 0;
   fVlrTotParcelas   := 0;

   (* coloca os cabeçalhos nos memos *)
   memResult.Lines.Add('Nº Contrato  Parcela Valor          ');
   memResult.Lines.Add('------------ ------- ---------------');

   memErro.Lines.Add('Nº Contrato  Erro                                                   ');
   memErro.Lines.Add('------------ -------------------------------------------------------');



   (* query que seleciona contratos ativos cuja última parcela (não estornada) é de
      competência inferior ao mês de geração escolhido *)
   try
      with qryContratosGeracao do begin

         EscondeEspera; (* ver observação acima *)
         MostraFormProgresso('Processando Contratos...'+sPatro, 0, RecordCount, True, True);

         First;
         while not(EOF) do begin

            inc(i);
            AndaFormProgresso(i);

            (* Verifica se o usuário Cancelou a Operação *)
            if frmProgresso.Cancelou then begin

               sMsg := 'Processo interrompido pelo usuário.' + #13;
               if bGerou then begin
                  sMsg := sMsg + 'Entretanto, pelo menos uma parcela foi gerada.';
               end else begin
                  sMsg := sMsg + 'Não foi gerada parcela alguma.';
               end;

               MsgDlg(sMsg, 'Empréstimo', mtInformation, [mbOk], 0);
               Repaint;

               Result := False;
               Break;

            end;

            if not(dtmBaseDados.dbBaseDados.InTransaction) then dtmBaseDados.dbBaseDados.StartTransaction;

            (* verifica se a parcela superou o total de parcelas previstas *)
            if ( not(qryContratosGeracaoHMENUMPARCELAS.isNULL) and
               (qryContratosGeracaoHMENUMPARCELAS.AsInteger = 0) ) then begin
               (* grava o erro no memo *)
               memErro.Lines.Add(
               CompletaInicio(IntToStr(qryContratosGeracaoIDCONTRATOEMPTMO.AsInteger), ' ', 12) + ' ' +
               'Contrato encerrado');
               inc(iQuantErro);

               (* troca o flgSituacao do Contrato para 'E' *)
               MarcaContratoEncerrado;
               CommitTransacao;

            end else if GeraItensParcela then begin
               inc(iQuantParcela);
               CommitTransacao;
               bGerou := True; (* pelo menos 1 parcela gerada *)
            end else begin
               inc(iQuantErro);
               RollBackTransacao;
            end;

            Next;
         end;
         Close;
      end;

      edtNumResult.Value      := iQuantParcela;
      edtNumErro.Value        := iQuantErro;
      edtVlrTotParcela.Value  := fVlrTotParcelas;

   finally
      EscondeFormProgresso;
   end;
end;




function TfrmExecGeraParcela.GeraItensParcela: Boolean;
var
   iRegraTxJuros     : Int64;
   dDataPrevista     : TDateTime;
   rSitPart          : TSitPart;
   iParcelaAtual, i  : Integer;
   fVlrParcela       : Currency;
   fTxJuros          : Currency;
begin
   Result := True;

   try
      try
         (* Parcela a ser Gerada *)
         iParcelaAtual := qryContratosGeracaoHMEPARCELA.AsInteger + 1;

         // ----------------------------------------------------------------------------------------
{
         (* 1º - verifica se a parcela superou o total de parcelas previstas *)
         if ( not(qryContratosGeracaoHMENUMPARCELAS.isNULL) and (qryContratosGeracaoHMENUMPARCELAS.AsInteger = 0) ) then
         begin

            (* grava o erro no memo *)
            memErro.Lines.Add(
            CompletaInicio(IntToStr(qryContratosGeracaoIDCONTRATOEMPTMO.AsInteger), ' ', 12) + ' ' +
            'Contrato encerrado');

            (* troca o flgSituacao do Contrato para 'E' *)
            MarcaContratoEncerrado;
            Result := False;
            Exit;
         end;
}
         // ----------------------------------------------------------------------------------------

         rSaldoDevAnt := CalcEmptmo.SaldoDevAnt(qryContratosGeracaoIDContratoEmptmo.AsInteger,
                                                edtDataLancamento.Date, Trunc(DBspnAno.Value),
                                                (cboMes.ItemIndex + 1));

         (* 2º - verifica se o saldo devedor está zerado *)
         if rSaldoDevAnt.fSaldoDevAnt = 0 then begin

            (* grava o erro no memo *)
            memErro.Lines.Add(
            CompletaInicio(IntToStr(qryContratosGeracaoIDCONTRATOEMPTMO.AsInteger), ' ', 12) + ' ' +
            'Saldo devedor ZERO');

            Result := False;
            Exit;
         end;

         if rSaldoDevAnt.iParcRestaAnt = 0 then begin

            (* grava o erro no memo *)
            memErro.Lines.Add(
            CompletaInicio(IntToStr(qryContratosGeracaoIDCONTRATOEMPTMO.AsInteger), ' ', 12) + ' ' +
            'Contrato encerrado');

            Result := False;
            Exit;
         end;

         // ----------------------------------------------------------------------------------------

         (* 3º - verifica se existem parcelas anteriores com divergência não tradada *)
         try
            with qryParcelasDivergentes do begin
               LimpaParametros(qryParcelasDivergentes);
               ParamByName('PIDCONTRATOEMPTMO').AsInteger   := qryContratosGeracaoIDCONTRATOEMPTMO.AsInteger;
               ParamByName('PHMEPARCELA').AsInteger         := iParcelaAtual;
               Open;

               if FieldByName('ITENS_DIVERGENTES').AsInteger > 0 then begin

                 (* grava o erro no memo *)
                 memErro.Lines.Add(
                 CompletaInicio(IntToStr(qryContratosGeracaoIDCONTRATOEMPTMO.AsInteger), ' ', 12) + ' ' +
                 'Itens anteriores com divergência não tratada');

                 Result := False;
                 LimpaParametros(qryParcelasDivergentes);
                 Exit;

               end;
            end;

         finally
            qryParcelasDivergentes.Close;
         end;

         // ----------------------------------------------------------------------------------------

         (* 4º - faz o cálculo *)

         (* Limpa o registro com os dados do Contrato *)
         LimpaRegistroContrato(rContrato);

         (* NumParcelas será a quantidade de parcelas que faltam para acabar o EP
            No primeiro momento, ie, antes do cálculo, é o número de parcelas remanescentes
            ANTES da que se está calculando *)
         rContrato.NumParcelas       := rSaldoDevAnt.iParcRestaAnt;

         (* Inicializa o registro com os dados do Contrato *)
         rContrato.IDContratoEmptmo  := qryContratosGeracaoIDCONTRATOEMPTMO.AsInteger;
         rContrato.IDPessoa          := qryContratosGeracaoIDPESSOA.AsInteger;
         rContrato.IDTipoContrEmptmo := qryContratosGeracaoIDTIPOCONTREMPTMO.AsInteger;
         rContrato.IDTipoEmptmo      := qryContratosGeracaoIDTIPOEMPTMO.AsInteger;
         rContrato.IDPlanoPrev       := qryContratosGeracaoIDPLANOPREV.AsInteger;
         rContrato.IDPatro           := qryContratosGeracaoIDPATRO.AsInteger;
         rContrato.IDBenef           := qryContratosGeracaoIDBENEF.AsInteger;

         rContrato.DataCredito       := qryContratosGeracaoDATACREDITO.AsDateTime;
         rContrato.DataSituacao      := qryContratosGeracaoDATASITUACAO.AsDateTime;
         rContrato.DataAssinatura    := qryContratosGeracaoDATAASSINATURA.AsDateTime;
         rContrato.DataPrimParc      := qryContratosGeracaoDATAPRIMPARC.AsDateTime;
         rContrato.DataCanc          := qryContratosGeracaoDATACANC.AsDateTime;
         rContrato.DataInscricao     := qryContratosGeracaoDATAINSC.AsDateTime;
         rContrato.VlrContrato       := qryContratosGeracaoVLRCONTRATO.AsCurrency;
         rContrato.VlrParcela        := qryContratosGeracaoVLRPARCELA.AsCurrency;
         rContrato.Txjuros           := qryContratosGeracaoTXJUROS.AsCurrency;
         rContrato.FlgFormaRec       := qryContratosGeracaoFLGFORMAREC.AsString;
         rContrato.FlgFormaPag       := qryContratosGeracaoFLGFORMAPAG.AsString;
         rContrato.Indexador         := qryContratosGeracaoMOECODIGO.AsInteger;
         rContrato.SiglaIndexador    := qryContratosGeracaoMOESIGLA.AsString;

         (* busca a situação do participante *)
         rSitPart := FuncoesEmptmo.BuscaSitPart(rContrato.IDPessoa);

         (* verifica a data prevista para recebimento *)
         dDataPrevista  := StrToDate(CalcEmptmo.CritDataEmptmo(qryAux, IntToStr(rContrato.IDPatro),
                           IntToStr(rContrato.IDPlanoPrev), rSitPart.flgInterno, 'N' (* NORMAL *),
                           IntToStr(cboMes.ItemIndex + 1), FloatToStr(DBspnAno.Value),
                           rContrato.FlgFormaRec, FormatDateTime('dd/mm/yyyy', rContrato.DataAssinatura),
                           iParcelaAtual));

         (* traz os dados do histórico imediatamente anterior *)
         if qryContratosGeracaoIDREGRAJURCONC.IsNull then begin
            memErro.Lines.Add(
            CompletaInicio(IntToStr(qryContratosGeracaoIDContratoEmptmo.AsInteger), ' ', 12) + ' ' +
            'Regra de Taxa de Juros não foi informada.');
            Result := False;
            Exit;
         end;

         iRegraTxJuros  := qryContratosGeracaoIDREGRAJURCONC.AsInteger;

         fTxJuros       := CalcEmptmo.BuscaTxJuros(rContrato, iRegraTxJuros, iParcelaAtual, dDataPrevista,
                                                   rSaldoDevAnt.fTxJurosAnt, rSaldoDevAnt.fSaldoDevAnt,
                                                   False, rContrato.Indexador);

         if fTxJuros <= 0 then begin
            memErro.Lines.Add(
            CompletaInicio(IntToStr(qryContratosGeracaoIDContratoEmptmo.AsInteger), ' ', 12) + ' ' +
            'ERRO na busca da taxa de Juros.');
            Result := False;
            Exit;
         end;

         if CalcEmptmo.CalculaItens(rContrato, 1(* = parcela *), 1(* = Geração de Parcelas *),
                                    iParcelaAtual, rSitPart.IDSitPart, rContrato.FlgFormaRec,
                                    fTxJuros, rSaldoDevAnt.fSaldoDevAnt,
                                    0, 0, 0, 0, 0, 0, 0, 0, 0,
                                    (* VlrSolic, SaldoQuit, Margem, Reserva, SalPart,
                                    SalMantido, SalDoenca, SalBenef *)
                                    dDataPrevista, dDataPrevista, PegaAnoMes,
                                    True, False, False, vItens) then
         begin

            // -------------------------------------------------------------------------------------

            (* inicializa o totalizador do valor da parcela *)
            fVlrParcela := 0;

            (* verifica o valor total da Parcela *)
            for i := 0 to High(vItens) do begin

               (* se for o item centralizador *)
               if ( (vItens[i].iEvento = 1) and (vItens[i].FlgCentraliza = 1) ) then fVlrParcela := fVlrParcela + vItens[i].Valor;

               (* se forem itens destacados *)
               if ( (vItens[i].iEvento = 1) and (vItens[i].FlgDestacado = 1) )  then fVlrParcela := fVlrParcela + vItens[i].Valor;

            end; (* for *)
            // -------------------------------------------------------------------------------------

            (* NumParcelas será a quantidade de parcelas que faltam para acabar o EP
               Para a gravação, subtrai 1 das parcelas remanescentes *)
            rContrato.NumParcelas := qryContratosGeracaoHMENUMPARCELAS.AsInteger - 1;

            CalcEmptmo.GravaMovEmptmo(rContrato, vItens, 1(* = parcela *), iParcelaAtual,
                                      trunc(DBspnAno.Value), (cboMes.ItemIndex + 1),
                                      DiasInUteis.ExtraiAno(dDataPrevista),
                                      DiasInUteis.ExtraiMes(dDataPRevista),
                                      rContrato.NumParcelas, (* nº de parcelas remanescentes *)
                                      dDataPrevista, dDataPrevista, '', False  (* mostra progresso *));

            (* grava o erro no memo *)
            memResult.Lines.Add(
            CompletaInicio(IntToStr(qryContratosGeracaoIDCONTRATOEMPTMO.AsInteger), ' ', 12) + ' ' +
            CompletaInicio(IntToStr(iParcelaAtual), ' ', 7) + ' ' +
            CompletaInicio(FormatFloat('#0.00', fVlrParcela), ' ', 15) );

            (* acumulador de valor total das parcelas geradas *)
            fVlrTotParcelas := fVlrTotParcelas + fVlrParcela;

         end else begin

            (* grava o erro no memo *)
            memErro.Lines.Add(
            CompletaInicio(IntToStr(qryContratosGeracaoIDContratoEmptmo.AsInteger), ' ', 12) + ' ' +
            ' ERRO no cálculo dos itens de parcela');

            Result := False;
         end;

      except
         (* grava o erro no memo *)
         memErro.Lines.Add(
         CompletaInicio(IntToStr(qryContratosGeracaoIDCONTRATOEMPTMO.AsInteger), ' ', 12) +
         ' ERRO no processo');

         Repaint;
         Result := False;
      end;

   finally
      (* Limpa o registro com os dados do Contrato *)
      LimpaRegistroContrato(rContrato);
   end;
end;



function TfrmExecGeraParcela.MarcaContratoEncerrado: Boolean;
begin
   Result := True;

   try
      try

         with qryMarcaContratoEncerrado do begin
            LimpaParametros(qryMarcaContratoEncerrado);
            ParamByName('PIDCONTRATOEMPTMO').AsInteger := qryContratosGeracaoIDCONTRATOEMPTMO.AsInteger;
            ExecSQL;
         end;

      except;
         Result := False;
      end;

   finally
      qryMarcaContratoEncerrado.Close;
   end;
end;



function TfrmExecGeraParcela.Contabiliza: integer;
var
   sResult     : TStringList;
   sErro       : TStringList;
   sSQL        : String;
   sHistorico  : String;
   iPlanilha   : Integer;
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
   '       ( C.FLGSITUACAO          IN (''A'', ''J'') ) '                                    + #13 +
   '   AND (((LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, ''0000'')))) || ' +
   '   (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, ''00''))))) <= ' + QuotedStr(PegaAnoMes) + ' ) ' + #13 +
   '   AND ( (H.HMECENTRALIZA       = 0) OR (H.HMECENTRALIZA IS NULL) ) '                    + #13 +
   '   AND ( H.HMEORIGEM            = 1 ) '                                                  + #13 +
   '   AND ( H.PLNCODIGO            IS NULL ) '                                              + #13 +
   '   AND ( H.PLNCODIGOESTORNO     IS NULL) '                                               + #13 +
   '   AND ( (H.FLGESTORNADO        = 0) OR (H.FLGESTORNADO IS NULL) )'                      + #13 +
   '   AND ( H.FLGBAIXADO           = 0 ) ';

   if molContratoEmptmo1.IdContrato > 0 then begin
      sSQL := sSQL +
   '   AND ( C.IDCONTRATOEMPTMO     = ' + intToStr(molContratoEmptmo1.IdContrato) + ' ) '    + #13;
   end;

   if DBcboTipoEmptmo.LookupValue <> '' then
   sSQL := sSQL +
   '   AND ( TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue + ' ) '                + #13;

   if DBcboTipoContrato.LookupValue <> '' then
   sSQL := sSQL +
   '   AND ( C.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue + ' ) '              + #13 +
   '   AND ( TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContrato.LookupValue + ' ) '              + #13;

   sSQL := sSQL +
   '   AND ( C.IDPATRO              IN (' + PegaPatro + ') ) '                               + #13 +
   '   AND ( C.IDPLANOPREV          IN (' + PegaPlano + ') ) '                               + #13 +
   '   AND ( TE.IDEMPRESAPROP       = ' + IntToStr (Sistema.IDEmpresa) + ' ) '               + #13 +
   '   AND ( H.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTMO ) '                                 + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO ) '                               + #13 +
   '   AND ( TC.IDTIPOEMPTMO        = TE.IDTIPOEMPTMO ) '                                    + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( H.IDITEMEMPTMO         = ITC.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( ITC.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO ) '                               + #13 +

   'ORDER BY ' +
   '   HMEANOCOMPETENCIA, HMEMESCOMPETENCIA, H.IDCONTRATOEMPTMO ';


   (* prepara o Histórico-padrão que será passado adiante *)
   sHistorico  := 'Parcelas de Empréstimo, ref: ' +
                  Copy(PegaAnoMes, 5, 2) + '/' + Copy(PegaAnoMes, 1, 4);

   if DBcboTipoContrato.LookupValue <> '' then begin
      sHistorico  := sHistorico + ', para contratos do tipo ' + DBcboTipoContrato.LookupValue;
   end;
   sHistorico  := sHistorico + '.';

   (* chama a função de contabilização passando o SQL acima *)
   Result := IntegraEmptmo.ContabilizaItens('C', 'N', sSQL, sHistorico, edtDataLancamento.Date,
                                            sResult, sErro, iPlanilha);
end;



procedure TfrmExecGeraParcela.AbreQueries;
begin
   (* Tipo de Empréstimo *)
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;
end;



function TfrmExecGeraParcela.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try
      // Pelo menos 1 Patrocinadora deve estar selecionado
      if not(SelecaoPatro) then
         raise EValidacao.CreateVal('É necessário indicar pelo menos uma Patrocinadora!', lstPatro);

      // Pelo menos 1 Plano deve estar selecionado
      if not(SelecaoPlano) then
         raise EValidacao.CreateVal('É necessário indicar pelo menos um Plano!', lstPlano);

      if cboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

      if DBspnAno.Value <= 1980 then
         raise EValidacao.CreateVal('É necessário indicar o Ano de Competência!', DBspnAno);

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



procedure TfrmExecGeraParcela.FormShow(Sender: TObject);
begin
   inherited;

   ntbPrincipal.PageIndex  := 0;

   (* preenche a data de lançamento e o ano de referência/competência *)
   cboMes.ItemIndex        := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasInUteis.ExtraiAno(Date);
   edtDataLancamento.Date  := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1);

   AbreQueries;

   (* Preenche a listbox de patrocinadoras... *)
   PreenchePatro;
   (* ...e marca todas por default *)
   MarcaTodosPatro;

   (* Preenche a listbox de Planos... *)
   PreenchePlano;
   (* ...e marca todos por default *)
   MarcaTodosPlano;
end;



procedure TfrmExecGeraParcela.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TfrmExecGeraParcela.btnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   MarcaTodosPatro;
end;



procedure TfrmExecGeraParcela.btnInvertePatroClick(Sender: TObject);
var
   i : Integer;
begin
   inherited;

   (* inverte a seleção *)
   for i := 0 to (lstPatro.Items.Count - 1) do lstPatro.Checked[i] := not(lstPatro.Checked[i]);
end;



procedure TfrmExecGeraParcela.btnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   MarcaTodosPlano;
end;



procedure TfrmExecGeraParcela.btnInvertePlanoClick(Sender: TObject);
var
   i : Integer;
begin
   inherited;

   (* inverte a seleção *)
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := not(lstPlano.Checked[i]);
end;



procedure TfrmExecGeraParcela.cboMesExit(Sender: TObject);
begin
   inherited;
   (* preenche a data de lançamento e o ano de referência/competência *)
   edtDataLancamento.Date := EncodeDate(StrToInt(IntToStr(trunc(DBspnAno.Value))), (cboMes.ItemIndex + 1), 1);
end;



procedure TfrmExecGeraParcela.DBspnAnoExit(Sender: TObject);
begin
   inherited;
   (* preenche a data de lançamento e o ano de referência/competência *)
   edtDataLancamento.Date := EncodeDate(StrToInt(IntToStr(trunc(DBspnAno.Value))), (cboMes.ItemIndex + 1), 1);
end;



procedure TfrmExecGeraParcela.DBcboTipoEmptmoExit(Sender: TObject);
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



procedure TfrmExecGeraParcela.molContratoEmptmo1btnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo1.btnBuscaContratoClick(Sender);
end;



procedure TfrmExecGeraParcela.btnVoltarClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
end;



end.
