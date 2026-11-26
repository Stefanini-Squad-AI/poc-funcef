unit FRelParamRubricas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, uAdmPrevFB, dRelParamRubricas;

type
  TFrmRelParamRubricas = class(TfrmOkCancelar)
    Label1: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelParamRubricas: TFrmRelParamRubricas;

implementation

uses dRelFolha;

{$R *.DFM}

procedure TFrmRelParamRubricas.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dtmRelFolha.QryFundacao.Close;
  dtmRelFolha.QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  dtmRelFolha.QryFundacao.Open;
  dtmRelParamRubricas.qryRelParamRubricas.Close;
  dtmRelParamRubricas.qryRelParamRubricas.Open;
end;

end.
