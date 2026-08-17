{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Utilizar a procedure buscaMutuario para procurar se o usuario é
o mutuario do contrato e bloquea-lo.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecLiberaSuspensao;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   IvDictio, IvMulti, IvEMulti, ComCtrls, StdCtrls, MAHlpBtn,
   Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, Wwdatsrc, DBTables,
   Wwquery, wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, DBCtrls,
   Grids, Wwdbigrd, Wwdbgrid, fcButton, fcImgBtn, fcShapeBtn, wwdblook,
   FSairAjudaImob, MontaSelect, DBGrids, mContratoEmptmo,
   wwdbedit, Wwdbspin, uTypesEmptmo;

type
   TFrmExecLiberaSuspensao = class(TfrmSairAjudaImob)
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
      qryHistMov: TwwQuery;
      dtsHistMov: TwwDataSource;
      updHistMovVirtual: TUpdateSQL;
      lblTitulo: TfcLabel;
      qryIDINSCRICAOEMPTMO: TFloatField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      Label5: TLabel;
      DBcboTipoContrato: TwwDBLookupCombo;
      DBcboSuspensao: TwwDBLookupCombo;
      Label1: TLabel;
      QryAux: TwwQuery;
      UpdHistMov: TUpdateSQL;
      molContratoEmptmo: TmolContratoEmptmo;
      Label7: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBgrdHistMovVirtual: TwwDBGrid;
      btnConfirmar: TfcShapeBtn;
      btnContinuaEncerra: TfcShapeBtn;
      DBgrdHistMov: TwwDBGrid;
      Panel1: TPanel;
      btnInverteSelecao: TBitBtn;
      btnMarcaTodos: TBitBtn;
      btnVoltar: TfcShapeBtn;
      qryMOECODIGO: TFloatField;
      qryVLRSALBASE: TFloatField;
      qryVLRMARGEM: TFloatField;
      qryVLRMAXPERMIT: TFloatField;
      qryMOESIGLA: TStringField;
      grpCompetencia: TGroupBox;
      Label15: TLabel;
      Label2: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      edtDataLancamento: TwwDBDateTimePicker;
      qryIDTIPOSUSPEMPTMO: TFloatField;
      qryDATAINICIOSUSP: TDateTimeField;
      qryDATAFIMSUSP: TDateTimeField;
      qryUSUARIOLIBSUSP: TStringField;
      qryDATALIBSUSP: TDateTimeField;
      qryHORALIBSUSP: TStringField;
      qryFLGESCOLHA: TStringField;
      qryHistMovFLGESCOLHA: TStringField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovNOME: TStringField;
      qryHistMovTSEDESCRICAO: TStringField;
      qryHistMovDATAINICIOSUSP: TDateTimeField;
      qryHistMovDATAFIMSUSP: TDateTimeField;
      qryHistMovVirtualNOME: TStringField;
      qryHistMovVirtualDESCRICAO: TStringField;
      qryHistMovVirtualDATAINICIOSUSP: TStringField;
      qryHistMovVirtualDATAFIMSUSP: TStringField;
      qryHistMovVirtualDATALIBSUSP: TStringField;
      qryHistMovVirtualHORALIBSUSP: TStringField;
      qryHistMovVirtualUSUARIOLIBSUSP: TStringField;
      qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
      qryHistMovVirtualANOCOBRANCA: TFloatField;
      qryHistMovVirtualMESCOBRANCA: TFloatField;
      qryHistMovIDTIPOSUSPEMPTMO: TFloatField;
      qryHistMovVirtualIDTIPOSUSPEMPTMO: TFloatField;
      qryHistMovIDREGRARECALCSEG: TFloatField;
      qryHistMovIDREGRARECALCIOF: TFloatField;
      qryHistMovVirtualIDREGRARECALCIOF: TFloatField;
      qryHistMovVirtualIDREGRARECALCSEG: TFloatField;
      qryHistMovTSEMESES: TFloatField;
      qryHistMovDATACREDITO: TDateTimeField;
      qryHistMovNUMPARCELAS: TFloatField;
      qryHistMovVirtualTSEMESES: TFloatField;
      qryHistMovVirtualDATACREDITO: TStringField;
      qryHistMovVirtualNUMPARCELAS: TFloatField;
      qrySaldoAnt: TwwQuery;
      qrySaldoAntHMESALDODEV: TFloatField;
      qryContratosGeracao: TwwQuery;
      qryContratosGeracaoIDCONTRATOEMPTMO: TFloatField;
      qryContratosGeracaoIDCONTRQUITACAO: TFloatField;
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
      qryContratosGeracaoMOECODIGO: TFloatField;
      qryContratosGeracaoVLRCONTRATO: TFloatField;
      qryContratosGeracaoVLRPARCELA: TFloatField;
      qryContratosGeracaoTXJUROS: TFloatField;
      qryContratosGeracaoNUMPARCELAS: TFloatField;
      qryContratosGeracaoIDTIPOSUSPEMPTMO: TFloatField;
      qryContratosGeracaoDATALIBSUSP: TDateTimeField;
      qryContratosGeracaoMOESIGLA: TStringField;
      qryItemEmprestimo: TwwQuery;
      qryItemEmprestimoITEDESCRICAO: TStringField;
      qryItemEmprestimoIDITEMEMPTMO: TFloatField;
      qryContratosGeracaoIDTIPOEMPTMO: TFloatField;
      qryContratosGeracaoDATAINSC: TDateTimeField;
      qrySaldoAntHMENUMPARCELAS: TFloatField;
      qryIDPLANOORIGEM: TFloatField;
      qryIDCBANCARIADEB: TFloatField;
      qryANOSUSPENSAO: TFloatField;
      qryMESSUSPENSAO: TFloatField;

      procedure btnContinuaSelecaoClick(Sender: TObject);
      procedure btnCancelaAlteraClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
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
      procedure btnVoltarClick(Sender: TObject);
      procedure cboMesExit(Sender: TObject);
      procedure DBcboTipoContratoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);

   private  // Private declarations

      rContrato            : TDadosContrato;
      iContMarcados        : Integer;
      rSaldoDevAnt         : TSaldoDevAnt;

      procedure Sel(i: Extended);

      procedure AbreQueries;

      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;
      procedure PreencheTabelaVirtual;

      function VerificaPreenchimento: Boolean;

      function SaldoDevAnt(const iIdContrato          : Extended;
                           const dDataProcessamento   : TDateTime;
                           const sDiaSldDev           : String
                           ): TSaldoDevAnt;


   public   // Public declarations

   end;



var
  FrmExecLiberaSuspensao: TFrmExecLiberaSuspensao;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, // LimpaParametros, AtualizaConjunto 
   UMensErro,      // MsgDlg 
   USistema,       // Sistema 
   dEmptmo,        // qryParamEmptmo 
   DLookEmptmo,    // qryLookPortadorFormaR 
   FProgresso,     // FrmProgresso 
   uDiasUteis,
   DBaseDados,
   UCalcEmptmo,
   uDataBase,
   uVerificaPreenchimento,
   fAguarde, dMS;



procedure TFrmExecLiberaSuspensao.FormCreate(Sender: TObject);
begin
   inherited;

   ntbPrincipal.PageIndex  := 0;
   iContMarcados           := 0;
end;



procedure TFrmExecLiberaSuspensao.HabilitaBotoes;
begin
   btnContinuaEncerra.Enabled := True;
   btnCancelaAltera.Enabled   := True;
   btnConfirmar.Enabled       := True;
   bbtnAjuda.Enabled          := True;
   bbtnSair.Enabled           := True;

   ntbPrincipal.Enabled       := True;
   Screen.Cursor              := crDefault;
end;



procedure TFrmExecLiberaSuspensao.DesabilitaBotoes;
begin
   Screen.Cursor              := crHourGlass;
   ntbPrincipal.Enabled       := False;

   btnContinuaEncerra.Enabled := False;
   btnCancelaAltera.Enabled   := False;
   btnConfirmar.Enabled       := False;
   bbtnAjuda.Enabled          := False;
   bbtnSair.Enabled           := False;
end;



procedure TFrmExecLiberaSuspensao.Sel(i: Extended);
begin
   // abre a query principal com os parâmetros passados 
   with qry do
   begin
      // Procedure da unit UFuncoesEmptmo que fecha a query e limpa todos os parâmetros 
      LimpaParametros(qry);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
      Open;
   end;
end;



procedure TFrmExecLiberaSuspensao.AbreQueries;
begin
   // Tipo de Empréstimo 
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   with dtmLookEmptmo.qryLookTipoSusp do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoSusp);
      Open;
   end;
end;



function TFrmExecLiberaSuspensao.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try

      if cboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar a Mês de Competência!', cboMes);

      if DBspnAno.Value < 1980 then
         raise EValidacao.CreateVal('É necessário indicar a Ano de Competência!', DBspnAno);

      if edtDataLancamento.Date <= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Liberação!', edtDataLancamento);

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



procedure TFrmExecLiberaSuspensao.btnContinuaSelecaoClick(Sender: TObject);
var
   sSQL           : String;
begin
   inherited;

   if not(VerificaPreenchimento) then Exit;

   if UFuncoesEmptmo.bBuscaMutuario then
      begin
         MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                           'O usuário é o próprio mutuário do '+
                           'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
      end;

   // Busca Registros a processar 

   sSql :=

   'SELECT '                                                                                 + #13 +
   '    ''0'' AS FLGESCOLHA, '                                                               + #13 +
   '    CNT.IDCONTRATOEMPTMO, '                                                              + #13 +
   '    PES.NOME, '                                                                          + #13 +
   '    TSE.TSEDESCRICAO, '                                                                  + #13 +
   '    CNT.DATAINICIOSUSP, '                                                                + #13 +
   '    CNT.DATAFIMSUSP, '                                                                   + #13 +
   '    CNT.IDTIPOSUSPEMPTMO, '                                                              + #13 +
   '    TSE.IDREGRARECALCSEG, '                                                              + #13 +
   '    TSE.IDREGRARECALCIOF, '                                                              + #13 +
   '    TSE.TSEMESES, '                                                                      + #13 +
   '    CNT.DATACREDITO, '                                                                   + #13 +
   '    CNT.NUMPARCELAS '                                                                    + #13 +

   'FROM '                                                                                   + #13 +
   '    PESSOA PES, '                                                                        + #13 +
   '    CONTRATOEMPTMO CNT, '                                                                + #13 +
   '    TIPOSUSPEMPTMO TSE '                                                                 + #13 +

   'WHERE '                                                                                  + #13 +
   '    CNT.IDTIPOSUSPEMPTMO IS NOT NULL '                                                   + #13 +
   'AND CNT.DATALIBSUSP      IS NULL '                                                       + #13;

   if molContratoEmptmo.IDContrato > 0 then
      sSQl := sSQL +
   'AND CNT.IDCONTRATOEMPTMO = ' + FloatToStr(molContratoEmptmo.IdContrato)                    + #13;

   if DBcboTipoContrato.LookupValue <> '' then
      sSQl := sSQL +
   'AND CNT.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue                            + #13;

   if DBcboSuspensao.LookupValue <> '' then
      sSQl := sSQL +
   'AND CNT.IDTIPOSUSPEMPTMO = ' + DBcboSuspensao.LookupValue                                + #13;

   sSQL := sSQL +
   'AND PES.IDPESSOA         = CNT.IDBENEF '                                                 + #13 +
   'AND TSE.IDTIPOSUSPEMPTMO = CNT.IDTIPOSUSPEMPTMO '                                        + #13 +

   'ORDER BY '                                                                               + #13 +
   '    CNT.IDCONTRATOEMPTMO '                                                               + #13;

   // abre a query HistMovVirtual com os parâmetros passados 
   with qryHistMov do
   begin
      Sql.Text := sSQL;
      Open;

      if IsEmpty then
      begin
         DBgrdHistMovVirtual.Enabled := False;
      end
      else
      begin
         DBgrdHistMovVirtual.Enabled := True;
      end;

   end;

   ntbPrincipal.PageIndex  := 1;
end;



procedure TFrmExecLiberaSuspensao.btnCancelaAlteraClick(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.btnLimpaContrato.Click;

   qryHistMov.Close;
   frmAguarde.Apaga;

   ntbPrincipal.PageIndex  := 0;
end;



procedure TFrmExecLiberaSuspensao.DBgrdVlrAtualizadosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   if qryHistMov.IsEmpty then Exit;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; // amarelo bebê 
         end
         else
         begin
            ABrush.Color := clWhite;
         end;

         // Caso Selecionado muda cor
         if qryHistMov.FieldByName('FLGESCOLHA').AsInteger = 1 then
         begin
            AFont.Color  := clWhite;
            ABrush.Color := clRed;
         end;
      end;

   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TFrmExecLiberaSuspensao.DBgrdVlrAtualizadosTopRowChanged(Sender: TObject);
begin
   inherited;

   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TFrmExecLiberaSuspensao.FormShow(Sender: TObject);
begin
   inherited;

   ntbPrincipal.PageIndex  := 0;

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex        := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasUteis.ExtraiAno(Date);
   edtDataLancamento.Date  := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1);

   AbreQueries;
end;



procedure TFrmExecLiberaSuspensao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   dtmLookEmptmo.qryLookTipoContrato.Close;
   dtmLookEmptmo.qryLookTipoSusp.Close;
end;



procedure TFrmExecLiberaSuspensao.btnInverteSelecaoClick(Sender: TObject);
var
   bMostra: Boolean;
begin
   inherited;

   bMostra := False;

   if qryHistMov.RecordCount > 100 then begin

      qryHistMov.DisableControls;

      // Acerta tela de acompanhamento
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

      // Atualiza tela de acompanhamento
      if bMostra then frmAguarde.Pos := frmAguarde.Pos + 1;
   end;

   if qryHistMov.Active then qryHistMov.First;

   qryHistMov.EnableControls;

   if bMostra then frmAguarde.Apaga;
end;



procedure TFrmExecLiberaSuspensao.btnMarcaTodosClick(Sender: TObject);
var
   Mostra: Boolean;
begin
   inherited;

   Mostra := False;

   if qryHistMov.RecordCount > 100 then begin
     qryHistMov.DisableControls;
     //  Acerta tela de acompanhamento
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
       //  Atualiza tela de acompanhamento
       frmAguarde.Pos := frmAguarde.Pos + 1;
     end;

   end;

   if qryHistMov.Active then
     qryHistMov.First;

   qryHistMov.EnableControls;

   if Mostra = True then frmAguarde.Apaga;
end;



procedure TFrmExecLiberaSuspensao.PreencheTabelaVirtual;
begin
   // Laço que varre o vetor Lista inserindo na tabela virtual TODOS os itens calculados
   qryHistMovVirtual.Insert;

   qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat   := qryHistMovIDCONTRATOEMPTMO.AsFloat;
   qryHistMovVirtualNOME.AsString              := qryHistMovNOME.AsString;
   qryHistMovVirtualDESCRICAO.AsString         := qryHistMovTSEDESCRICAO.AsString;
   qryHistMovVirtualDATAINICIOSUSP.AsDateTime  := qryHistMovDATAINICIOSUSP.AsDateTime;
   qryHistMovVirtualDATAFIMSUSP.AsDateTime     := qryHistMovDATAFIMSUSP.AsDateTime;
   qryHistMovVirtualDATALIBSUSP.AsDateTime     := edtDataLancamento.Date;
   qryHistMovVirtualHORALIBSUSP.AsString       := TimeToStr(Time);
   qryHistMovVirtualUSUARIOLIBSUSP.AsString    := Sistema.NomeUsuario;
   qryHistMovVirtualANOCOBRANCA.AsInteger      := Trunc(DBspnAno.Value);
   qryHistMovVirtualMESCOBRANCA.AsInteger      := cboMes.ItemIndex + 1;
   qryHistMovVirtualIDTIPOSUSPEMPTMO.AsInteger := qryHistMovIDTIPOSUSPEMPTMO.AsInteger;
   qryHistMovVirtualIDREGRARECALCIOF.AsInteger := qryHistMovIDREGRARECALCIOF.AsInteger;
   qryHistMovVirtualIDREGRARECALCSEG.AsInteger := qryHistMovIDREGRARECALCSEG.AsInteger;
   qryHistMovVirtualTSEMESES.AsInteger         := qryHistMovTSEMESES.AsInteger;
   qryHistMovVirtualDATACREDITO.AsDateTime     := qryHistMovDATACREDITO.AsDateTime;
   qryHistMovVirtualNUMPARCELAS.AsInteger      := qryHistMovNUMPARCELAS.AsInteger;

   qryHistMovVirtual.Post;
end;



procedure TFrmExecLiberaSuspensao.qryHistMovFLGESCOLHAChange(Sender: TField);
begin
   inherited;

   //  Atualiza Contador
   if qryHistMov.FieldByName('FLGESCOLHA').Asinteger = 1 then begin
     inc(iContMarcados);
   end else begin
     dec(iContMarcados);
   end;
end;



procedure TFrmExecLiberaSuspensao.molContratoEmptmo1btnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);

   Repaint;

   if dtmMS.MS_ContratoEmptmo.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      // abre a query principal com o participante escolhido
      Sel(StrToFloat(dtmMS.MS_ContratoEmptmo.ValoresChave[0]));

      PreencheDadosContrato(qry, rContrato);

      btnContinuaSelecao.Enabled := True;

      Screen.Cursor := crDefault;

   end; // if MontaSelect.RetornouValor
end;



procedure TFrmExecLiberaSuspensao.molContratoEmptmo1btnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TFrmExecLiberaSuspensao.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
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



procedure TFrmExecLiberaSuspensao.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
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



procedure TFrmExecLiberaSuspensao.btnContinuaEncerraClick(Sender: TObject);
begin
   inherited;

   qryHistMovVirtual.Close;
   qryHistMovVirtual.Open;

   try
      DesabilitaBotoes;
      qryHistMov.First;
      while not qryHistMov.Eof do begin
         if qryHistMovFLGESCOLHA.AsInteger = 1 then
            PreencheTabelaVirtual;
         qryHistMov.Next;
      end;

   finally
      frmAguarde.Apaga;
      HabilitaBotoes;
   end;
   ntbPrincipal.PageIndex  := 2;

end;



procedure TFrmExecLiberaSuspensao.btnConfirmarClick(Sender: TObject);
var
   sSQL             : String;
   iIDItemSegCompl  : Int64;
   iIDItemIOFCompl  : Int64;
   fVlrSegCompl     : Currency;
   fVlrIOFCompl     : Currency;
   sResultado       : String;
   fVlrSegConcessao : Currency;
   fVlrIOFConcessao : Currency;
   fVlrContrato     : Currency;
   iPrazoContrato   : Integer;
   sDiaSldDev       : String;
   fSaldoDevAtual   : Currency;
   fSaldoDevSusp    : Currency;
   dDataAtualizacao : TDateTime;
   iParcelaAtual    : Integer;
   rSitPart         : TSitPart;
   rContrato        : TDadosContrato;
   rConcessao       : TDadosConcessao;
   iNumParcelas     : Integer;
   dDataPrevista    : TDateTime;
   vItens           : TListaItem;
   i                : Integer;
   iParcela         : Integer;
begin
   inherited;

   if not(VerificaPreenchimento) then Exit;

   ParametrosSistema;

   iIDItemSegCompl  := dtmEmptmo.qryParamEmptmoIDITEMSEGCOMPL.AsInteger;
   iIDItemIOFCompl  := dtmEmptmo.qryParamEmptmoIDITEMIOFCOMPL.AsInteger;


   // Confirma transação
   if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;

   try
      DesabilitaBotoes;

      try

         qryHistMovVirtual.First;
         while not qryHistMovVirtual.Eof do
         begin
            i := 0;
            // Atualiza dados no contrato
            sSQL := 'UPDATE CONTRATOEMPTMO ' + #13 +
                    'SET '                   + #13 +
                    // Pendência 20379 - 08/03/2007 - Alberto - Padrão
                    '  DATALIBSUSP    = sysdate,'                                                                          + #13 +
                    '  DATAFIMSUSP    = TO_DATE(' + QuotedStr(qryHistMovVirtualDATALIBSUSP.AsString) + ',''dd/mm/yyyy''),' + #13 +
                    //Fim Pendência 20379
                    '  USUARIOLIBSUSP = ' + QuotedStr(qryHistMovVirtualUSUARIOLIBSUSP.AsString) + ', '                     + #13 +
                    '  ANOSUSPENSAO   = ' + qryHistMovVirtualANOCOBRANCA.AsString + ', '                                   + #13 +
                    '  MESSUSPENSAO   = ' + qryHistMovVirtualMESCOBRANCA.AsString + ', '                                   + #13 +
                    '  HORALIBSUSP    = ' + QuotedStr(qryHistMovVirtualHORALIBSUSP.AsString)                               + #13 +
                    'WHERE '                                                                                               + #13 +
                    '  IDCONTRATOEMPTMO = ' + qryHistMovVirtualIDCONTRATOEMPTMO.AsString;
            qryAux.SQL.Text := sSQL;
            qryAux.ExecSql;

            // Atualiza dados no historico de suspensao
            sSQL := 'UPDATE HISTSUSPCOBEP '      + #13 +
                    'SET '                       + #13 +
                    '  FLGSTATUS      = ''E'', ' + #13 +
                    '  HSCDATALIBER   = TO_DATE(' + QuotedStr(qryHistMovVirtualDATALIBSUSP.AsString) + ',''dd/mm/yyyy''),' + #13 +
                    '  HSCUSULIBER    = ' + QuotedStr(qryHistMovVirtualUSUARIOLIBSUSP.AsString) + ', '                     + #13 +
                    '  HSCDATAATU     = TO_DATE(' + QuotedStr(qryHistMovVirtualDATALIBSUSP.AsString) + ',''dd/mm/yyyy'') ' + #13 +
                    'WHERE '                                                                                               + #13 +
                    '  IDCONTRATOEMPTMO   = ' + qryHistMovVirtualIDCONTRATOEMPTMO.AsString                                 + #13 +
                    'AND IDTIPOSUSPEMPTMO = ' + qryHistMovVirtualIDTIPOSUSPEMPTMO.AsString                                 + #13 +
                    'AND FLGSTATUS        = ''A'' '                                                                        + #13;
            qryAux.SQL.Text := sSQL;
            qryAux.ExecSql;

            fVlrContrato     := 0;
            iPrazoContrato   := 0;

            qryHistMovVirtual.Next;
         end;
         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

      except
         if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
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



procedure TFrmExecLiberaSuspensao.btnVoltarClick(Sender: TObject);
begin
   inherited;
   qryHistMovVirtual.Close;
   qryHistMov.Close;
   qryHistMov.Open;
   frmAguarde.Apaga;

   ntbPrincipal.PageIndex  := 1;
end;



procedure TFrmExecLiberaSuspensao.cboMesExit(Sender: TObject);
begin
   inherited;
   edtDataLancamento.Date  := SysDate;
end;



procedure TFrmExecLiberaSuspensao.DBcboTipoContratoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado 
   with dtmLookEmptmo.qryLookTipoSusp do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoSusp);

      if DBcboTipoContrato.LookupValue <> '' then begin
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger    := StrToInt(DBcboTipoContrato.LookupValue);
         Open;
      end;

   end;
end;



function TFrmExecLiberaSuspensao.SaldoDevAnt(const iIdContrato         : Extended;
                                            const dDataProcessamento   : TDateTime;
                                            const sDiaSldDev           : String
                                            ): TSaldoDevAnt;
var
   dDataSaldoDev : TDateTime;
begin
   Result.fTxJurosAnt   := 0;
   Result.fSaldoDevAnt  := 0;
   Result.iParcelaAnt   := 0;
   Result.iParcRestaAnt := 0;


   dDataSaldoDev := dDataProcessamento; // Data Processamento
   if sDiaSldDev = 'A' then dDataSaldoDev := dDataProcessamento - 1;

   try
      with qrySaldoAnt do
      begin
         LimpaParametros(qrySaldoAnt);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat := iIdContrato;
         Open;

         if not(isEmpty) then
         begin
            Result.fSaldoDevAnt  := qrySaldoAntHMESALDODEV.AsCurrency;
            Result.iParcRestaAnt := qrySaldoAntHMENUMPARCELAS.AsInteger;
         end;
      end;

   finally
      qrySaldoAnt.Close;
   end;
end;



end.
