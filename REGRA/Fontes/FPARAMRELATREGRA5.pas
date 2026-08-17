unit FPARAMRELATREGRA5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DRelRegra;

type
  TFRMPARAMRELATREGRA5 = class(TfrmOkCancelar)
    rgrpOrdem: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMPARAMRELATREGRA5: TFRMPARAMRELATREGRA5;

implementation

uses fAguarde;

{$R *.DFM}

procedure TFRMPARAMRELATREGRA5.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  frmAguarde.Mostra('Montando Relatório ...');
  dtmRelRegra.qryRegrasUtilizadas.Close;
  if rgrpOrdem.ItemIndex = 0
  then dtmRelRegra.qryRegrasUtilizadas.SQL.Add(' ORDER BY T.MODULO, T.TABELA, T.CODIGO_REGRA ')
  else dtmRelRegra.qryRegrasUtilizadas.SQL.Add(' ORDER BY T.MODULO, T.TABELA, R.NOMEREGRA ');
  dtmRelRegra.qryRegrasUtilizadas.Open;
  frmAguarde.Apaga;

end;

end.
