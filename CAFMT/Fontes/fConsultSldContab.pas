unit fConsultSldContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, TREdit, fcLabel, Mask, wwdbedit,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Db, Wwdatsrc, DBTables, Wwquery, MontaSelect, wwdbdatetimepicker,
  CMDateTimePicker, TB97Tlwn;

type
  TfrmConsultSldContab = class(TfrmOkCancelar)
    pnlDados: TPanel;
    Label17: TLabel;
    Label24: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label26: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    pnlValores: TPanel;
    fcLabel2: TfcLabel;
    fcLabel3: TfcLabel;
    fcLabel4: TfcLabel;
    fcLabel5: TfcLabel;
    fcLabel6: TfcLabel;
    fcLabel7: TfcLabel;
    fcLabel8: TfcLabel;
    fcLabel9: TfcLabel;
    fcLabel10: TfcLabel;
    fcLabel11: TfcLabel;
    fcLabel12: TfcLabel;
    wwDBEdit6: TwwDBEdit;
    wwDBEdit7: TwwDBEdit;
    wwDBEdit8: TwwDBEdit;
    wwDBEdit9: TwwDBEdit;
    wwDBEdit10: TwwDBEdit;
    wwDBEdit11: TwwDBEdit;
    wwDBEdit12: TwwDBEdit;
    wwDBEdit13: TwwDBEdit;
    wwDBEdit14: TwwDBEdit;
    wwDBEdit15: TwwDBEdit;
    wwDBEdit16: TwwDBEdit;
    wwDBEdit17: TwwDBEdit;
    wwDBEdit18: TwwDBEdit;
    wwDBEdit19: TwwDBEdit;
    wwDBEdit27: TwwDBEdit;
    wwDBEdit28: TwwDBEdit;
    eSoma1: TRealEdit;
    eSoma2: TRealEdit;
    eSoma4: TRealEdit;
    eSoma3: TRealEdit;
    eSoma5: TRealEdit;
    eSoma6: TRealEdit;
    eSoma7: TRealEdit;
    eSoma8: TRealEdit;
    qryBem: TwwQuery;
    dsBem: TwwDataSource;
    qryBemImovel: TwwQuery;
    dsBemImovel: TwwDataSource;
    ePlaca: TEdit;
    qryPlaca: TwwQuery;
    qryPlacaIDBEM: TFloatField;
    qryPlacaIDPESSOA: TFloatField;
    qryPlacaPLACA: TFloatField;
    spdPesquisa: TBitBtn;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit20: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    qryBemIDPESSOA: TFloatField;
    qryBemIDBEM: TFloatField;
    qryBemDESBEM: TStringField;
    qryBemDTAINCLUSAO: TDateTimeField;
    qryBemPLACA: TFloatField;
    qryBemDATAINICIODEP: TDateTimeField;
    qryBemDESCGRUPO: TStringField;
    qryBemDESCCONJUNTO: TStringField;
    qryBemNOMESUBCONTA: TStringField;
    qryBemDESCLOCALIZACAO: TStringField;
    qryBemNOMERESPONSAVEL: TStringField;
    qryBemOriginal: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
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
    StringField1: TStringField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    qryBemImovelIDBEM: TFloatField;
    qryBemImovelTAXADEP: TFloatField;
    qryBemImovelDATAULTDEP: TDateTimeField;
    qryBemImovelVALORG0: TFloatField;
    qryBemImovelVALREAVACUM0: TFloatField;
    qryBemImovelCMBEMATU0: TFloatField;
    qryBemImovelCMBEMACUM0: TFloatField;
    qryBemImovelDEPLANCATU0: TFloatField;
    qryBemImovelDEPLANCACUM0: TFloatField;
    qryBemImovelCMDEPLANCACUM0: TFloatField;
    qryBemImovelVALCTB0: TFloatField;
    qryBemImovelVALULTREAVACUM1: TFloatField;
    qryBemImovelVALULTCMREAVATU: TFloatField;
    qryBemImovelVALULTCMREAVACUM1: TFloatField;
    qryBemImovelVALULTDEPREAVATU: TFloatField;
    qryBemImovelVALULTDEPREAVACUM1: TFloatField;
    qryBemImovelVALULTCMDEPREAVACUM1: TFloatField;
    qryBemImovelVALCTB1: TFloatField;
    qryBemImovelSUMPARCREAV: TFloatField;
    qryBemImovelSUMCMBEMATU: TFloatField;
    qryBemImovelSUMCMBEMACUM: TFloatField;
    qryBemImovelSUMDEPATU: TFloatField;
    qryBemImovelSUMDEPACUM: TFloatField;
    qryBemImovelSUMCMDEPACUM: TFloatField;
    qryBemImovelSUMVALCTB: TFloatField;
    qryBemImovelDESBEM: TStringField;
    qryBemImovelIDGRUPO: TFloatField;
    qryBemImovelIDCONJUNTO: TFloatField;
    qryBemImovelDESCCONJUNTO: TStringField;
    qryBemImovelDESCGRUPO: TStringField;
    Dock973: TDock97;
    ToolWindow971: TToolWindow97;
    fcLabel1: TfcLabel;
    bitbExecuta: TSpeedButton;
    eDataMov: TCMDateTimePicker;
    procedure spdPesquisaClick(Sender: TObject);
    procedure ePlacaExit(Sender: TObject);
    procedure ePlacaEnter(Sender: TObject);
    procedure bitbExecutaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure eDataMovExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CalculaSaldodoBem(dDataMov : tDateTime);
    procedure LimpaTela;
  end;

var
  frmConsultSldContab: TfrmConsultSldContab;

implementation

uses uMensErro, dAtivoFixo, uDiasUteis, uSistema;

{$R *.DFM}

procedure TfrmConsultSldContab.LimpaTela;
begin
   qryBemImovel.Close;
   qryBem.Close;
   eSoma1.Value := 0;
   eSoma2.Value := 0;
   eSoma3.Value := 0;
   eSoma4.Value := 0;
   eSoma5.Value := 0;
   eSoma6.Value := 0;
   eSoma7.Value := 0;
   eSoma8.Value := 0;
end;

procedure TfrmConsultSldContab.FormCreate(Sender: TObject);
var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;
begin
   inherited;
   qryBem.Prepare;
   qryBemImovel.Prepare;
   DecodeDate(Date, iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   eDataMov.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;

procedure TfrmConsultSldContab.FormActivate(Sender: TObject);
begin
   inherited;
   eDataMov.SetFocus;
end;

procedure TfrmConsultSldContab.spdPesquisaClick(Sender: TObject);
begin
   inherited;
   LimpaTela;
   ePlaca.Text  := '';
   dtmAtivoFixo.MSBem.Executar;
   Application.ProcessMessages;
   if (dtmAtivoFixo.MSBem.RetornouValor) then
   begin
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[0]);
      qryBem.ParamByName('PIDBEM').AsInteger    := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[1]);
      qryBem.Open;
      if qryBem.IsEmpty then
         msgdlg('Bem não Localizado','Erro', mtError, [mbOk], 0);
      ePlaca.Text := floattostr(qryBem.FieldByName('PLACA').AsFloat);
      //----------------------------------------------------------------------------------
      CalculaSaldodoBem(eDataMov.Date);
      //----------------------------------------------------------------------------------
      eDataMov.SetFocus;
   end else
   begin
      ePlaca.SetFocus;
   end;
end;

procedure TfrmConsultSldContab.CalculaSaldodoBem(dDataMov : tDateTime);
begin
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   qryBemImovel.Close;
   qryBemImovel.ParamByName('PIDPESSOA').AsInteger := qryBemIDPESSOA.AsInteger;
   qryBemImovel.ParamByName('PIDBEM').AsInteger    := qryBemIDBEM.AsInteger;
   qryBemImovel.ParamByName('PDATASLD').AsDateTime := dDataMov;
   qryBemImovel.Open;
   if qryBemImovel.IsEmpty then
      msgdlg('Bem sem Movimentacao','Erro', mtError, [mbOk], 0);
   eSoma1.Value := qryBemImovelVALORG0.asCurrency;
   eSoma2.Value := qryBemImovelVALREAVACUM0.asCurrency   + qryBemImovelVALULTREAVACUM1.asCurrency;
   eSoma3.Value := qryBemImovelCMBEMATU0.asCurrency      + qryBemImovelVALULTCMREAVATU.asCurrency;
   eSoma4.Value := qryBemImovelCMBEMACUM0.asCurrency     + qryBemImovelVALULTCMREAVACUM1.asCurrency;
   eSoma5.Value := qryBemImovelDEPLANCATU0.asCurrency    + qryBemImovelVALULTDEPREAVATU.asCurrency;
   eSoma6.Value := qryBemImovelDEPLANCACUM0.asCurrency   + qryBemImovelVALULTDEPREAVACUM1.asCurrency;
   eSoma7.Value := qryBemImovelCMDEPLANCACUM0.asCurrency + qryBemImovelVALULTCMDEPREAVACUM1.asCurrency;
   eSoma8.Value := qryBemImovelVALCTB0.asCurrency        + qryBemImovelVALCTB1.asCurrency;
   Screen.Cursor := crDefault;
end;

procedure TfrmConsultSldContab.ePlacaExit(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then Exit;
   //-------------------------------------------------------------------------------------
   LimpaTela;
   if ePlaca.Text <> '' then
   begin
      qryPlaca.Close;
      qryPlaca.ParamByName('PPLACA').AsFloat := strtofloat(ePlaca.Text);
      qryPlaca.Open;
      if not qryPlaca.isEmpty then
      begin
         qryBem.Close;
         qryBem.ParamByName('PIDPESSOA').AsInteger := qryPlacaIDPESSOA.AsInteger;
         qryBem.ParamByName('PIDBEM').AsInteger    := qryPlacaIDBEM.AsInteger;
         qryBem.Open;
         if qryBem.IsEmpty then
            msgdlg('Bem não Localizado','Erro', mtError, [mbOk], 0);
         //-------------------------------------------------------------------------------
         CalculaSaldodoBem(eDataMov.Date);
         //-------------------------------------------------------------------------------
         eDataMov.SetFocus;
      end else
         ePlaca.SetFocus;
   end;
end;

procedure TfrmConsultSldContab.ePlacaEnter(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then Exit;
   if spdPesquisa.Focused then Exit;
   if eDataMov.Focused then Exit;
   LimpaTela;
end;

procedure TfrmConsultSldContab.bitbExecutaClick(Sender: TObject);
begin
   inherited;
   if ePlaca.Text <> '' then
      CalculaSaldodoBem(eDataMov.Date);
end;

procedure TfrmConsultSldContab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryBemImovel.Close;
   qryBem.Close;
   qryBemImovel.Unprepare;
   qryBem.Unprepare;
end;

procedure TfrmConsultSldContab.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if key = #13 then
   begin
      key := #0;
      Perform(Wm_NextDlgCtl, 0, 0);
   end;
end;

procedure TfrmConsultSldContab.eDataMovExit(Sender: TObject);
begin
   if bbtnSair.Focused then Exit;
   inherited;
   ePlaca.Setfocus;
end;

end.

