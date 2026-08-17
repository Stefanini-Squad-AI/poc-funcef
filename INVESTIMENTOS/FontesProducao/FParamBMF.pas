unit FParamBMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdbedit, Mask, wwdblook, UOperacaoInvest,
  TREdit, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TfrmParamBMF = class(TfrmCadastroCS)
    qryIDPARAMBMF: TFloatField;
    qryIDTIPOINVESTIDOR: TFloatField;
    qryDATAVIGENCIA: TDateTimeField;
    qryPERCTOBN: TFloatField;
    qryPERCTOBD: TFloatField;
    qryPERCLIQ: TFloatField;
    qryPERCTXBOLSA: TFloatField;
    qryPERCDEVN: TFloatField;
    qryPERCDEVD: TFloatField;
    qryTipoInvestidor: TwwQuery;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    dbdVigencia: TCMDateTimePicker;
    Label2: TLabel;
    qryPERCTXREG: TFloatField;
    qryTipoInvestidorIDTIPOINVESTIDOR: TFloatField;
    qryTipoInvestidorDESCTPINVESTIDOR: TStringField;
    dblTipoInvestidor: TwwDBLookupCombo;
    dbePercTOBN: TDBRealEdit;
    dbePercTOBD: TDBRealEdit;
    dbePercLiq: TDBRealEdit;
    dbePercTaxaRegistro: TDBRealEdit;
    dbePercTaxaBolsa: TDBRealEdit;
    dbePercTOBDevN: TDBRealEdit;
    dbePercTOBDevD: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(N : Longint);
  public
    { Public declarations }
  end;

var
  frmParamBMF: TfrmParamBMF;

implementation

{$R *.DFM}

uses uMensErro, UDataBase,UBibliotecaInvest;

procedure TfrmParamBMF.Sel(N : Longint);
begin
  qry.Close;
  qry.ParamByName('P_IDPARAMBMF').AsInteger := N;
  qry.Open;
end;

procedure TfrmParamBMF.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qryIDTIPOINVESTIDOR.AsInteger := pRPI.IDTIPOINVESTIDOR;
  SelectFirst;
end;

procedure TfrmParamBMF.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
  Accept := False;
  if Trim(dbdVigencia.Text) = '' then
     begin
       MsgDlg('Data de Vigência não preenchida.', 'Erro', mtError, [mbOk], 0);
       dbdVigencia.SetFocus;
     end
  else
  begin
     Accept := True;
     dbdVigencia.Text := FormatDateTime('DD/MM/YYYY', dbdVigencia.Date);
  end;
end;

procedure TfrmParamBMF.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmParamBMF.CmeCadastroConfirma(Sender: TObject);
begin
  if qry.State = dsInsert then
     qryIDPARAMBMF.AsInteger := LeUltRegistro(nil, 'PARAMBMF');
  inherited;
end;


procedure TfrmParamBMF.FormCreate(Sender: TObject);
begin
  inherited;

  Sel(-1);
end;

procedure TfrmParamBMF.dsStateChange(Sender: TObject);
begin
  inherited;
  dbdVigencia.Enabled       := qry.State <> dsEdit;
end;

end.
