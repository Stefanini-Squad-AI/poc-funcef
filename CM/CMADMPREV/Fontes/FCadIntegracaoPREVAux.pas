unit FCadIntegracaoPREVAux;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery;

type
  TfrmCadIntegracaoPREVAux = class(TfrmOkCancelar)
    lblDescricao: TLabel;
    qryLista: TwwQuery;
    dblkpcmbNivelIntegracao: TwwDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadIntegracaoPREVAux: TfrmCadIntegracaoPREVAux;

implementation 

{$R *.DFM}

procedure TfrmCadIntegracaoPREVAux.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;
//

end;

end.
