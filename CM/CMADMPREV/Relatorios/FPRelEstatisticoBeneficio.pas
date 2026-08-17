unit FPRelEstatisticoBeneficio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Spin, DRelatAdmPREV2;

type
  TfrmEstatisticoBeneficio = class(TfrmOkCancelar)
    grpMesAnoRef: TGroupBox;
    Label3: TLabel;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstatisticoBeneficio: TfrmEstatisticoBeneficio;

implementation

uses UMensErro, UAdmPrev;

{$R *.DFM}

procedure TfrmEstatisticoBeneficio.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
  sAno : string;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12)
  then begin
     cmbMesRef.ItemIndex := AMonth - 1;
     cmbMesRef.Text := cmbMesRef.Items[cmbMesRef.ItemIndex];
  end;
  spedAnoRef.Text   := IntToStr(AYear);

end;

procedure TfrmEstatisticoBeneficio.bbtnConfirmarClick(Sender: TObject);
var sAno, sMes, sAnoMes : string;
begin
  inherited;
  if Trim(cmbMesRef.Text) = ''
  then begin
     MsgDlg('Mês de Pagamento não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  sAno := Trim(spedAnoRef.Text);
  if cmbMesRef.ItemIndex <= 8
  then sMes := '0'+IntToStr(cmbMesRef.ItemIndex+1)
  else sMes := IntToStr(cmbMesRef.ItemIndex+1);
  sAnoMes   := sAno+'/'+sMes;
  with dtmRelatAdmPREV2 do
  begin
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;

     qryEstatBeneficio.Close;
     qryEstatBeneficio.ParamByName('MES').AsString := sAnoMes;
     qryEstatBeneficio.Open;
  end;

end;

end.
