// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      :
// Autor(a)    : Leo
// Data        : 09/02/2004
// Alteração   : passagem do parâmetro de fundação para relatório
//------------------------------------------------------------------------------
unit FParamRelEstSPC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin;

type
  TfrmParamRelEstSPC = class(TfrmOkCancelar)
    Gb: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    mebMes: TComboBox;
    mebAno: TSpinEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelEstSPC: TfrmParamRelEstSPC;

implementation

uses UAdmPrev, dRelatorios, UMensErro;

{$R *.DFM}

procedure TfrmParamRelEstSPC.FormCreate(Sender: TObject);
var wAno, wMes, wDia : word;
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  mebMes.ItemIndex := wMes - 1;
  mebAno.Value := wAno;

end;

procedure TfrmParamRelEstSPC.bbtnConfirmarClick(Sender: TObject);
var sAnoMes : string;
begin
  inherited;
  // Verificar dados obrigatorios
  if mebMes.ItemIndex = -1  then begin
    MsgDlg('Mês incorreto !','Informação',mtInformation,[mbOk,mbHelp],0);
    mebMes.SetFocus;
    exit;
  end;

  if trim(mebAno.Text) = '' then begin
    MsgDlg('Informe o ano desejado.','Informação',mtInformation,[mbOk,mbHelp],0);
    mebAno.SetFocus;
    exit;
  end;

  sAnoMes := mebAno.Text;
  // Montar as Datas
  if mebMes.ItemIndex+1 < 10
  then sAnoMes     := sAnoMes+'/0'+IntToStr(mebMes.ItemIndex+1)
  else sAnoMes     := sAnoMes+'/'+ IntToStr(mebMes.ItemIndex+1);

  with dtmRelatorios do
  begin
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
     qryFundacao.Open;

     qryEstatisticaSPC.Close;
     qryEstatisticaSPC.ParamByName('ANOMES').AsString   := sAnoMes;
     qryEstatisticaSPC.ParamByName('IDFUNDACAO').AsString   := IntToStr(iIdFundacao);
     qryEstatisticaSPC.Open;

  end;

end;


end.
