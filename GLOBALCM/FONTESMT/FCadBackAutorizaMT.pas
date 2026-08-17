unit FCadBackAutorizaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOKCANCELAR, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, CMDataTransf, Db,
  DBClient, uCMClientDataSet, Wwdatsrc, uCmSqlParams, uMenserro;

type
  TfrmCadBackAutoriza = class(TfrmOkCancelar)
    Panel1: TPanel;
    wwDBGridBackAutoriza: TwwDBGrid;
    sqlBack: TCMSqlParams;
    dsBack: TwwDataSource;
    cmcdsBack: TCMClientDataSet;
    CMDataTransf: TCMDataTransf;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBackAutoriza: TfrmCadBackAutoriza;

implementation

{$R *.DFM}

procedure TfrmCadBackAutoriza.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //amf 29.06.2006 17382 - Restaura o backup selecionado.
  if not CMDataTransf.RestoreGrants(cmcdsBack.FieldByName('sequencia').AsInteger) then
     MsgDlg('Erro ao restaurar autorizações', 'Autorizações', mtError, [mbOk], 0);
end;

end.
