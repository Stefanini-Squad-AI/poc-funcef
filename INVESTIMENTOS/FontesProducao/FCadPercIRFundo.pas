//******************************************************************************
//Data	          : 29/06/2004
//Origem	  : FUNCEF
//Query 	  : qryFundoInvest
//Motivo(S)       : Passado o Active da qry para 'False'
//******************************************************************************

unit FCadPercIRFundo;

interface  

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, wwdbedit, Mask, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TfrmCadPercIRFundo = class(TfrmCadastroCS)
    qryIDPERCIRFUNDO: TFloatField;
    qryIDFUNDOINVEST: TFloatField;
    qryDTAVIGENCIA: TDateTimeField;
    qryPERCIR: TFloatField;
    qryFundoInvest: TwwQuery;
    qryFundoInvestIDFUNDOINVEST: TFloatField;
    qryFundoInvestDESCFUNDOINVEST: TStringField;
    dblFundo: TwwDBLookupCombo;
    Label1: TLabel;
    dbdDataVigencia: TCMDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    dbePercentualIR: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsStateChange(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(N : LongInt);
  public
    { Public declarations }
  end;

var
  frmCadPercIRFundo: TfrmCadPercIRFundo;

implementation
uses uDataBase, uMensErro;
{$R *.DFM}

procedure TfrmCadPercIRFundo.Sel(N : LongInt);
begin
  qry.Close;
  qry.ParamByName('P_IDPERCIRFUNDO').AsInteger := N;
  qry.Open;
end;

procedure TfrmCadPercIRFundo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadPercIRFundo.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qryPERCIR.AsFloat := 0;
  SelectFirst;
end;

procedure TfrmCadPercIRFundo.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
  Accept := False;
  if dblFundo.LookupValue = '' then
     begin
       MsgDlg('Fundo Investimento não preenchido', 'Erro',mtError,[mbOK],0);
       dblFundo.SetFocus;
     end
  else if Trim(dbdDataVigencia.Text) = '' Then
     begin
       MsgDlg('Data de Vigência não preenchida', 'Erro', mtError,[mbOK],0);
       dbdDataVigencia.SetFocus;
     end
  else if (Trim(dbePercentualIR.Text) = '') or (qryPERCIR.AsFloat = 0) Then
     begin
       MsgDlg('Percentual de IR não preenchido', 'Erro', mtError,[mbOK],0);
       dbePercentualIR.SetFocus;
     end
  else Accept := True;
end;

procedure TfrmCadPercIRFundo.CmeCadastroConfirma(Sender: TObject);
begin
  if qry.State = dsInsert then
     qryIDPERCIRFUNDO.AsInteger := LeUltRegistro(nil, 'PERCIRFUNDO');
  inherited;
end;


procedure TfrmCadPercIRFundo.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1);
end;

procedure TfrmCadPercIRFundo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
       Begin
         SelectNext(ActiveControl, True, True);
         Key := 0;
       end;
end;

procedure TfrmCadPercIRFundo.dsStateChange(Sender: TObject);
begin
  inherited;
  dbdDataVigencia.Enabled := (qry.State <> dsEdit);
end;

end.
