unit FPedeDadosBenefAnterior;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, {DBCtrlt}
  MskEdDlg, TEdNum, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmPedeDadosBenefAnterior = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    lblNomeBenefAnt: TLabel;
    Label3: TLabel;
    lblTituloBenef: TLabel;
    dtDibBenefAnt: TCMDateTimePicker;
    edValorBenefAnt: TEditNum;
    grpParamINSS: TGroupBox;
    lblNomeBINSS1: TLabel;
    lblNomeBINSS2: TLabel;
    lblNomeBINSS3: TLabel;
    edOpcao1: TcmMaskEditDlg;
    edOpcao2: TcmMaskEditDlg;
    edOpcao3: TcmMaskEditDlg;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edOpcao1BtnClick(Sender: TObject);
    procedure edOpcao2BtnClick(Sender: TObject);
    procedure edOpcao3BtnClick(Sender: TObject); 
  private
    { Private declarations }
  public
    { Public declarations }
    sSQLOpcaoINSS : string;
  end;

var
  frmPedeDadosBenefAnterior: TfrmPedeDadosBenefAnterior;

implementation

uses UAdmPrev, UMensErro;

{$R *.DFM}

procedure TfrmPedeDadosBenefAnterior.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;

end;

procedure TfrmPedeDadosBenefAnterior.edOpcao1BtnClick(Sender: TObject);
var sValorBaseINSS  : string;
    bErro           : boolean;
begin
  inherited;
  if prmIDRGBINSS1 <=  0 then Exit;

  try
     sValorBaseINSS := RegraNumerica(IntToStr(prmIDRGBINSS1), sSQLOpcaoINSS, bErro, iIdCalculoGeral);
  except
     MsgDlg('Erro ao calcular Primeiro Parâmetro do INSS - Regra Nº '+IntToStr(prmIDRGBINSS1),'Erro',mtError,[mbOk],0);
  end;

  edOpcao1.Text := ClienteNumero(sValorBaseINSS);
end;

procedure TfrmPedeDadosBenefAnterior.edOpcao2BtnClick(Sender: TObject);
var sValorBaseINSS  : string;
    bErro           : boolean;
begin
  inherited;
  if prmIDRGBINSS2 <=  0 then Exit;

  try
     sValorBaseINSS := RegraNumerica(IntToStr(prmIDRGBINSS2), sSQLOpcaoINSS, bErro, iIdCalculoGeral);
  except
     MsgDlg('Erro ao calcular Segundo Parâmetro do INSS - Regra Nº '+IntToStr(prmIDRGBINSS2),'Erro',mtError,[mbOk],0);
  end;

  edOpcao2.Text := ClienteNumero(sValorBaseINSS);

end;

procedure TfrmPedeDadosBenefAnterior.edOpcao3BtnClick(Sender: TObject);
var sValorBaseINSS  : string;
    bErro           : boolean;
begin
  inherited;
  if prmIDRGBINSS3 <=  0 then Exit;

  try
     sValorBaseINSS := RegraNumerica(IntToStr(prmIDRGBINSS3), sSQLOpcaoINSS, bErro, iIdCalculoGeral);
  except
     MsgDlg('Erro ao calcular Terceiro Parâmetro do INSS - Regra Nº '+IntToStr(prmIDRGBINSS3),'Erro',mtError,[mbOk],0);
  end;

  edOpcao3.Text := ClienteNumero(sValorBaseINSS);

end;

end.
