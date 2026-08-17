//******************************************************************************
// Data      : 18/07/2006
// Código    : AL_1
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************

unit FCadCotacaoBMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, TREdit, Mask,  wwdblook,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc,
  Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TfrmCadCotacaoBMF = class(TfrmCadastroCS)
    IvExtendedTranslator1: TIvExtendedTranslator;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label14: TLabel;
    dblSerie: TwwDBLookupCombo;
    dbdDataAutoriza: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label15: TLabel;
    dbeNumeroNegocios: TDBRealEdit;
    dbeAjuste: TDBRealEdit;
    dbeAbertura: TDBRealEdit;
    dbeMinima: TDBRealEdit;
    dbeMedia: TDBRealEdit;
    dbeFechamento: TDBRealEdit;
    dbeMaxima: TDBRealEdit;
    dbeVolumeNegociado: TDBRealEdit;
    dbeUltima: TDBRealEdit;
    dbeLiquidacao: TDBRealEdit;
    dbeBeta: TDBRealEdit;
    qryIDCOTACAOBMF: TFloatField;
    qryVLRABERTURA: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryVLRMINIMA: TFloatField;
    qryVLRMEDIA: TFloatField;
    qryVLRAJUSTE: TFloatField;
    qryVOLUME: TFloatField;
    qryNUMNEGOCIO: TFloatField;
    qryVLRBETA: TFloatField;
    qryDATACOTACAOBMF: TDateTimeField;
    qryVLRFECHAMENTO: TFloatField;
    qryVLRMAXIMA: TFloatField;
    qryVLRULTIMO: TFloatField;
    qryVLRLIQUIDACAO: TFloatField;
    qrySerieBMF: TwwQuery;
    dblTipoContrato: TwwDBLookupCombo;
    Label13: TLabel;
    qrySerieBMFIDINVESTIMENTO: TFloatField;
    qrySerieBMFIDTIPOCONTRINVEST: TFloatField;
    qrySerieBMFDESCINVESTIMENTO: TStringField;
    qrySerieBMFDESCTIPOCTINVEST: TStringField;
    qryIDTIPOCONTRINVEST: TFloatField;
    qryContrInvest: TwwQuery;
    qryContrInvestIDTIPOCONTRINVEST: TFloatField;
    qryContrInvestDESCTIPOCTINVEST: TStringField;
    qrySerie: TwwQuery;
    qrySerieIDINVESTIMENTO: TFloatField;
    qrySerieDESCINVESTIMENTO: TStringField;
    QryVerifOrdCalc: TwwQuery;
    QryVerifOrdCalcFLGSTATUSFECHBOL: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure dblTipoContratoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryAfterCancel(DataSet: TDataSet);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure VerificaOrdensCalculadas;
    procedure dbdDataAutorizaExit(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(N : Longint);
  public
    { Public declarations }
  end;

var
  frmCadCotacaoBMF: TfrmCadCotacaoBMF;

implementation

{$R *.DFM}

uses uMensErro, UDataBase,
     //AL_1
     uCtrlInvContab;

procedure TfrmCadCotacaoBMF.Sel(N : Longint);
begin
  qry.Close;
  qry.ParamByName('P_IDCOTACAOBMF').AsInteger := N;
  qry.Open;
end;

procedure TfrmCadCotacaoBMF.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qrySerie.Close;
  qrySerie.ParamByName('P_IDTIPOCONTRINVEST').AsInteger := -1;
  qrySerie.Open;
  SelectFirst;
end;

procedure TfrmCadCotacaoBMF.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
   //AL_1
   Accept := True;
   if Trim(dblTipoContrato.LookupValue) = '' then
   begin
      MsgDlg('Tipo de Contrato não preenchido', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dblTipoContrato.CanFocus then
         dblTipoContrato.SetFocus;
      Accept := False;
      Exit;
   end
   else if Trim(dblSerie.LookupValue) = '' then
   begin
      MsgDlg('Série não preenchida', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dblSerie.CanFocus then
         dblSerie.SetFocus;
      Accept := False;
      Exit;
   end
   else if Trim(dbdDataAutoriza.Text) = '' then
   begin
     MsgDlg('Data não preenchida', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbdDataAutoriza.CanFocus then
        dbdDataAutoriza.SetFocus;
      Accept := False;
      Exit;
   end
   //AL_1
   else if not CtrlInvContab.TestaPeriodo(dbdDataAutoriza.Text, 8) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
      Accept := False;
      Exit;
   end;
end;

procedure TfrmCadCotacaoBMF.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     begin
       Sel(StrToInt(MontaSelect.ValoresChave[0]));
       qrySerie.Close;
       qrySerie.ParamByName('P_IDTIPOCONTRINVEST').AsInteger := qryIDTIPOCONTRINVEST.AsInteger;
       qrySerie.Open;
     end;
end;

procedure TfrmCadCotacaoBMF.CmeCadastroConfirma(Sender: TObject);
begin
  if qry.State = dsInsert then
     qryIDCOTACAOBMF.AsInteger := LeUltRegistro(nil, 'COTACAOBMF');
  inherited;
end;


procedure TfrmCadCotacaoBMF.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1);
end;

procedure TfrmCadCotacaoBMF.dsStateChange(Sender: TObject);
begin
  inherited;
  dbdDataAutoriza.Enabled := qry.State <> dsEdit;
  dblSerie.Enabled        := qry.State <> dsEdit;
  dblTipoContrato.Enabled := qry.State <> dsEdit;
end;

procedure TfrmCadCotacaoBMF.dblTipoContratoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   if Trim(dblTipoContrato.LookupValue) <> '' then
   begin
      qrySerie.Close;
      qrySerie.ParamByName('P_IDTIPOCONTRINVEST').AsInteger := StrToInt(dblTipoContrato.LookupValue);
      qrySerie.Open;
   end;
end;

procedure TfrmCadCotacaoBMF.qryAfterCancel(DataSet: TDataSet);
begin
  inherited;
  if qry.State = dsBrowse then
    begin
      qrySerie.Close;
      qrySerie.ParamByName('P_IDTIPOCONTRINVEST').AsInteger := qryIDTIPOCONTRINVEST.AsInteger;
      qrySerie.Open;
    end;
end;

procedure TfrmCadCotacaoBMF.VerificaOrdensCalculadas;
begin
   dbdDataAutoriza.Text := FormatDateTime('DD/MM/YYYY', dbdDataAutoriza.Date);
      
   with QryVerifOrdCalc do
   begin
      Close;
      ParamByName('dDataRef').AsString := dbdDataAutoriza.Text;
      Open;
      if not QryVerifOrdCalc.IsEmpty then
      begin
         MsgDlg('Atenção: Existem ordens calculadas para o dia. ',
                'Mensagem do Sistema', MtWarning, [MbOk], 0);
         bbtnConfirmar.Enabled := False;
         bbtnCancelar.Enabled := False;
      end
      else
      begin
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled := True;
      end;
   end;
   QryVerifOrdCalc.Close;
end;

procedure TfrmCadCotacaoBMF.dbdDataAutorizaExit(Sender: TObject);
begin
  inherited;
     dbdDataAutoriza.Text := FormatDateTime('DD/MM/YYYY', dbdDataAutoriza.Date);
end;

procedure TfrmCadCotacaoBMF.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   VerificaOrdensCalculadas;
end;

procedure TfrmCadCotacaoBMF.sbtnApagarClick(Sender: TObject);
begin
   //AL_1
   if not CtrlInvContab.TestaPeriodo(dbdDataAutoriza.Text, 8) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
      CmeCadastro.AtualizaBotoes(Self);      
      Exit;
   end;
   inherited;
   VerificaOrdensCalculadas;
end;

end.
