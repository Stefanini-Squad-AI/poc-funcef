unit FCadHistPad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, Db, DBTables, Wwquery, cmseldlg, wwidlg, Wwdatsrc,
  DBCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit, TB97, TB97Ctls,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, CmEventosCadastro, wwDialog,
  ImgList, FCadastroGridCS, MontaSelect;

type
  TfrmCadHist = class(TFrmCadastroGridCS)
    dbedHistorico: TwwDBEdit;
    Label1: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadHist: TfrmCadHist;

implementation

{$R *.DFM}

Uses USistema, UMensErro, UDatabase, DBaseDados;

procedure TfrmCadHist.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  try
    qry.Open;
    qry.First;
  Except
    MsgDlg('Problema na abertura da tabela HISTORICOFINAN','Erro',mtError,[mbOK],0);
    exit;
  end;
end;

procedure TfrmCadHist.bbtnConfirmarClick(Sender: TObject);
begin
  if Trim(dbedHistorico.Text) = '' then
  Begin
    MsgDlg('Obrigatório preencher o Historico','Erro',mtError,[mbOK],0);
    dbedHistorico.SetFocus;
    exit;
  End;
  if ds.DataSet.State = dsInsert then
     qry.FieldByName('HISTPADFINAN').AsInteger := LeUltRegistro(nil,'HISTORICOFINAN');
  inherited;
end;

procedure TfrmCadHist.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedHistorico.SetFocus;
end;

procedure TfrmCadHist.CmeCadastroConfirma(Sender: TObject);
begin
  dtmBaseDados.DbBaseDados.ApplyUpdates([qry]);
end;

procedure TfrmCadHist.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedHistorico.SetFocus;
end;

procedure TfrmCadHist.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  CmeCadastro.Confirma(Self);
end;

procedure TfrmCadHist.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
   begin
      qry.Locate('HISTPADFINAN',MontaSelect.ValoresChave[0],[loCaseInsensitive]);
   end;
end;

end.
