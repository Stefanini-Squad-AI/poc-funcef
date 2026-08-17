unit fTpLayout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, DBCtrls, Mask, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  CmEventosCadastro, ImgList, wwdbedit, Wwdotdot, Wwdbcomb;

type
  TFrmTpLayout = class(TFrmCadastroGridCS)
    Label3: TLabel;
    Label1: TLabel;
    DBNome: TDBEdit;
    DBLayout: TDBEdit;
    qryCpLayout: TwwQuery;
    qryAux: TwwQuery;
    procedure sbtnApagarClick(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTpLayout: TFrmTpLayout;

implementation

uses UMensErro, UDataBase;

{$R *.DFM}

procedure TFrmTpLayout.sbtnApagarClick(Sender: TObject);
var sSql : string;
begin
  qryAux.Close;
  sSql := 'SELECT IDLAYOUT FROM CPLAYOUT' +
          ' WHERE (IDLAYOUT = '+ qry.FieldByName('IDLAYOUT').AsString+')';
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);
  try
    qryAux.Open;
  except
    on E: EDBEngineError do begin
      MostrarErro(E);
      Exit;
    end; {on}
  end; {try .. except}
  if not qryAux.IsEmpty then begin
    MsgDlg('O tipo de Layout não pode ser apagado por ter Layouts ligados a ele !','Informação', mtInformation, [mbOk], 0);
    CmeCadastro.AtualizaBotoes(self);
    Exit;
  end;
  inherited;
end;

procedure TFrmTpLayout.CmeCadastroFind(Sender: TObject);
begin
  if MontaSelect.RetornouValor then
    qry.Locate('IDLAYOUT',MontaSelect.ValoresChave[0],[loPartialKey]) ;
end;

procedure TFrmTpLayout.qryBeforePost(DataSet: TDataSet);
Var iSeq: Integer;
begin
  iSeq:=LeUltRegistro(nil,'TPLAYOUT');
  //If iSeq<=0 then iSeq:=1;
  if qry.State in [dsinsert] then
    qry.FieldByName('IDLAYOUT').AsInteger := iSeq;
  inherited;
end;

procedure TFrmTpLayout.bbtnConfirmarClick(Sender: TObject);
begin
  if ds.DataSet.State <> dsBrowse then
  begin
    if DBNome.Text = '' then
    begin
      MsgDlg('Descrição em branco!', 'Erro', mtError, [mbOk,mbHelp], 0);
      Exit;
    end;
  end;
  inherited;
end;

procedure TFrmTpLayout.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor then
    qry.Locate('IDLAYOUT',MontaSelect.ValoresChave[0],[loPartialKey]) ;
end;

end.
