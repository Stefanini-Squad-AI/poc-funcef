unit fSelMotivoBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Db, DBTables,
  Wwquery;

type
  {Form para indicação do motivo da baixa/cancelamento de uma RUBS gerada e
   enviada em função de um atendimento}
  TfrmSelMotivoBaixa = class(TfrmOkCancelar)
    Label1: TLabel;
    CmbMotivoBaixa: TCMDBLookupCombo;
    qry: TwwQuery;
    qryIDCANCELAMENTO: TFloatField;
    qryDESCRICAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelMotivoBaixa: TfrmSelMotivoBaixa;

implementation

uses FPrincipal;

{$R *.DFM}

end.
