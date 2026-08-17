unit FCadMotivoAss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  CmEventosCadastro, ImgList;

type
  TfrmCadMotivoAss = class(TFrmCadastroGridCS)
    lblmotivo: TLabel;
    DBMotivo: TDBEdit;
    qryAux: TwwQuery;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    procedure qryBeforePost(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMotivoAss: TfrmCadMotivoAss;

implementation

uses UMensErro, UDataBase;

{$R *.DFM}

procedure TfrmCadMotivoAss.CmeCadastroFind(Sender: TObject);
begin
  if MontaSelect.RetornouValor then begin
    qry.Locate('IDMOTIVO',MontaSelect.ValoresChave[0],[loPartialKey]) ;
  end;
end;

procedure TfrmCadMotivoAss.qryBeforePost(DataSet: TDataSet);
begin
  if qry.State in [dsinsert] then
    qry.FieldByName('IDMOTIVO').AsInteger := LeUltRegistro(nil,'MOTIVO');
    qry.FieldByName('FLGTIPO').AsString   := 'A';
  inherited;
end;


procedure TfrmCadMotivoAss.sbtnApagarClick(Sender: TObject);
var sSql : string;
begin
  Screen.Cursor := crHourGlass;
  qryAux.Close;
  sSql := 'SELECT IDMOTIVO FROM HSTCONTRIBASS ' +
          ' WHERE (IDMOTIVO = '+ qry.FieldByName('IDMOTIVO').AsString + ')';
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);
  try                 
    qryAux.Open;
  except
    on E: EDBEngineError do begin
      MostrarErro(E);
      Exit;
    end;(* on *)
  end;(* try .. except *)
  if not qryAux.IsEmpty then begin
    MsgDlg('O motivo não pode ser apagado por ter registros ligados a ele !','Informação', mtInformation, [mbOk], 0);
  //  AtualizaBotoes;
    Exit;
  end;
  inherited;
  Screen.Cursor := crDefault;
end;


end.
