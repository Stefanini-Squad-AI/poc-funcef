unit FObservacaoCTemp;

//***************************************************************************************
//Nº SOL...........: 207737
//Nº KINTANA.......: 2018095
//Data da Alteração: 15/08/2014
//Responsável......: Felipe A. Santos
//Descrição........: Criação do formulário
//***************************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls;

type
  TfrmObservacaoCTemp = class(TfrmOkCancelar)
    mmoObs: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmObservacaoCTemp: TfrmObservacaoCTemp;

implementation

uses FCadFunc;

{$R *.DFM}

procedure TfrmObservacaoCTemp.FormCreate(Sender: TObject);
begin
  inherited;
  mmoObs.Text := frmCadFunc.cdsContratoTempObs.FieldByName('OBSERVACAO').AsString;
end;

end.
