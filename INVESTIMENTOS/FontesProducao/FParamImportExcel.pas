/// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  19/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: 
//------------------------------------------------------------------------------
unit FParamImportExcel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Udatabase,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, Mask, wwdbedit, wwdbdatetimepicker,
  CMDateTimePicker, DBCtrls, CmEventosCadastro, ImgList, Wwdotdot, Wwdbcomb, uSistema;

type
  TFrmParamImportExcel = class(TfrmCadastroCS)
    Label3: TLabel;
    DbLkcBolsa: TwwDBLookupCombo;
    Label4: TLabel;
    Label5: TLabel;
    Label14: TLabel;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DsBolsaValores: TwwDataSource;
    QryBolsaValores: TwwQuery;
    QryBolsaValoresSGLBOLSAVALORES: TStringField;
    QryBolsaValoresIDBOLSAVALORES: TFloatField;
    OpenDialog1: TOpenDialog;
    SB1: TSpeedButton;
    edtPlanilha: TwwDBEdit;
    edtlinha: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    chkAtualizaLink: TDBCheckBox;
    edtNomeParam: TwwDBEdit;
    Label15: TLabel;
    edtDtCot: TCMDateTimePicker;
    edtArquivo: TwwDBEdit;
    edtHora: TMaskEdit;
    edtPeriodicidade: TMaskEdit;
    edtCodAcao: TwwDBEdit;
    edtMax: TwwDBEdit;
    edtMin: TwwDBEdit;
    edtMedio: TwwDBEdit;
    edtAbert: TwwDBEdit;
    edtFecha: TwwDBEdit;
    edtVol: TwwDBEdit;
    dbckAtivo: TDBCheckBox;
    qryIDPARAMIMPEXCEL: TFloatField;
    qryIDBOLSAVALORES: TFloatField;
    qryNOMEPARAM: TStringField;
    qryATUALIZALINK: TStringField;
    qryHORA: TStringField;
    qryPERIODICIDADE: TStringField;
    qryDTCOTACAO: TDateTimeField;
    qryCAMINHO: TStringField;
    qryNOMEPLANILHA: TStringField;
    qryPRIMEIRALINHA: TFloatField;
    qryCODACAO: TStringField;
    qryABERTURA: TStringField;
    qryFECHAMENTO: TStringField;
    qryMAXIMA: TStringField;
    qryMINIMA: TStringField;
    qryMEDIO: TStringField;
    qryVOLUME: TStringField;
    qryFLGATIVO: TStringField;
    QryUpdParamInvest: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    qryFLGTPCOTACAO: TStringField;
    Label16: TLabel;
    dbcTpCotacao: TwwDBComboBox;
    procedure SB1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dbcTpCotacaoExit(Sender: TObject);
    procedure dbcTpCotacaoChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AjustaForm;
  public
    { Public declarations }
  end;

Var   FrmParamImportExcel: TFrmParamImportExcel;

implementation

uses DBaseDados;
{$R *.DFM}


procedure TFrmParamImportExcel.SB1Click(Sender: TObject);
begin
  inherited;
// Abre a Pesquisa e Testa Retorno
  If (OpenDialog1.Execute) Then Begin
    edtArquivo.Text := UpperCase(OpenDialog1.FileName);
    qry.FieldByName('CAMINHO').AsString:=edtArquivo.Text;
  End;
end;

procedure TFrmParamImportExcel.FormShow(Sender: TObject);
begin
  inherited;
  // Abre queries
  Qry.Open;
  QryBolsaValores.Open;
  edtHora.Text          := qry.FieldByName('HORA').AsString;
  edtPeriodicidade.Text := qry.FieldByName('PERIODICIDADE').AsString;
  sbtnAlterar.Enabled:=True;
  AjustaForm;
end;

procedure TFrmParamImportExcel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // Fecha queries
  Qry.Close;
  QryBolsaValores.Close;
end;

procedure TFrmParamImportExcel.bbtnConfirmarClick(Sender: TObject);
begin
 if ds.DataSet.State in [dsInsert] then
  if qry.FieldByName('IDPARAMIMPEXCEL').AsInteger <=0 then
   qry.FieldByName('IDPARAMIMPEXCEL').AsInteger := LeUltRegistro(nil,'PARAMIMPORTEXCEL');

  If (edtHora.Text <> '  :  ') Then
     Qry.FieldByName('HORA').AsString := edtHora.Text
  Else
     Qry.FieldByName('HORA').AsString := '';

  If (edtPeriodicidade.Text <> '  :  ') Then
     Qry.FieldByName('PERIODICIDADE').AsString := edtPeriodicidade.Text
  Else
     Qry.FieldByName('PERIODICIDADE').AsString := '';

  inherited;

end;

procedure TFrmParamImportExcel.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  Qry.FieldByName('ATUALIZALINK').AsString := 'N';
  Qry.FieldByName('FLGATIVO').AsString     := 'N';
  edtHora.Text          := '';
  edtPeriodicidade.Text := '';

end;

procedure TFrmParamImportExcel.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if not MontaSelect.RetornouValor then exit;
  qry.Locate('IDPARAMIMPEXCEL',MontaSelect.ValoresChave[0],[loPartialKey]);
  edtHora.Text          := qry.FieldByName('HORA').AsString;
  edtPeriodicidade.Text := qry.FieldByName('PERIODICIDADE').AsString;
  AjustaForm;
end;

procedure TFrmParamImportExcel.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  edtHora.Text          := qry.FieldByName('HORA').AsString;
  edtPeriodicidade.Text := qry.FieldByName('PERIODICIDADE').AsString;
end;

procedure TFrmParamImportExcel.AjustaForm;
begin
   if qryFLGTPCOTACAO.AsString = 'C' then
   begin
      DbLkcBolsa.Enabled := True;
      edtPeriodicidade.Visible := True;
      edtHora.Visible := True;
      chkAtualizaLink.Visible := True;
      dbckAtivo.Visible := True;
      Label1.Visible := True;
      Label2.Visible := True;
      edtAbert.Visible := True;
      Label7.Visible := True;
      edtMax.Visible := True;
      Label9.Visible := True;
      edtMedio.Visible := True;
      Label11.Visible := True;
      edtMin.Visible := True;
      Label10.Visible := True;
      edtVol.Visible := True;
      Label13.Visible := True;

      FrmParamImportExcel.Height := 396;
      Label7.Caption := 'Abertura';
      Label8.Caption := 'Fechamento';
   end
   else
   begin
      DbLkcBolsa.Enabled := False;
      edtPeriodicidade.Visible := False;
      edtHora.Visible := False;
      chkAtualizaLink.Visible := False;
      dbckAtivo.Visible := False;
      Label1.Visible := False;
      Label2.Visible := False;
      edtMax.Visible := False;
      Label9.Visible := False;
      edtMedio.Visible := False;
      Label11.Visible := False;
      edtMin.Visible := False;
      Label10.Visible := False;
      edtVol.Visible := False;
      Label13.Visible := False;

      FrmParamImportExcel.Height := 349;

      if qryFLGTPCOTACAO.AsString = 'B' then
      begin
         edtAbert.Visible := False;
         Label7.Visible   := False;
         Label7.Caption   := 'Abertura';
         Label8.Caption   := 'Indice Beta';
      end else if qryFLGTPCOTACAO.AsString = 'P' then
      begin
         edtAbert.Visible := True;
         Label7.Visible   := True;
         Label7.Caption   := 'Vencimento';
         Label8.Caption   := 'PU';
      end;
   end;
end;

procedure TFrmParamImportExcel.dbcTpCotacaoExit(Sender: TObject);
begin
  inherited;
  AjustaForm;
end;

procedure TFrmParamImportExcel.dbcTpCotacaoChange(Sender: TObject);
begin
  inherited;
  AjustaForm;
end;

procedure TFrmParamImportExcel.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edtHora.Text          := qry.FieldByName('HORA').AsString;
  edtPeriodicidade.Text := qry.FieldByName('PERIODICIDADE').AsString;
end;

procedure TFrmParamImportExcel.FormCreate(Sender: TObject);
begin
  inherited;
   OpenDialog1.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   //Jéssica Lana SOL 109421 KINTANA 496332

end;

end.
