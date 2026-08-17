unit frCondRad;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TB97Ctls, TB97, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, ImgList,
  Db, StdCtrls, Buttons, wwdblook, DBClient, uCMClientDataSet, uMensErro,
  uCtrlRadEtapaCond;

type
  TframeCondRAD = class(TFrame)
    pnlBody: TPanel;
    pnlGrid: TPanel;
    Dock: TDock97;
    Toolbar: TToolbar97;
    btnIncluir: TToolbarButton97;
    btnAlterar: TToolbarButton97;
    btnExcluir: TToolbarButton97;
    dbgrdCondicoes: TwwDBGrid;
    ImlPadrao: TImageList;
    dsCondicoes: TDataSource;
    pnlDados: TPanel;
    DockOkCancelar: TDock97;
    ToolbarOkCancelar: TToolbar97;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    dblkpNumEtapaDest: TwwDBLookupCombo;
    lblEtapa: TLabel;
    ToolbarSep972: TToolbarSep97;
    sbtnUpEtapa: TToolbarButton97;
    sbtnDownEtapa: TToolbarButton97;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure dbgrdCondicoesDblClick(Sender: TObject);
    procedure dblkpNumEtapaDestKeyPress(Sender: TObject; var Key: Char);
    procedure dbgrdCondicoesCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure sbtnUpEtapaClick(Sender: TObject);
    procedure sbtnDownEtapaClick(Sender: TObject);
  private
    { Private declarations }
  public
    cdsCondicoes : TCMClientDataset;

    CtrlRadEtapaCond : TCtrlRadEtapaCond;
    pnlElse          : TPanel;

    ModoAlteracao : procedure of Object;
    ModoBrowser : procedure of Object;

    procedure OnCreate; virtual;
    procedure OnPrepare; virtual;
    procedure OnDestroy; virtual;

    function Valida : boolean; virtual; 
  end;

implementation

{$R *.DFM}

{ TframeCondRAD }


procedure TframeCondRAD.OnCreate;
begin

end;


procedure TframeCondRAD.OnDestroy;
begin

end;


procedure TframeCondRAD.OnPrepare;
begin
  pnlGrid.BringToFront;
end;


procedure TframeCondRAD.btnIncluirClick(Sender: TObject);
begin
  cdsCondicoes.Append;
  pnlElse.Visible := False;
  pnlDados.BringToFront;
  ModoAlteracao;
end;


procedure TframeCondRAD.btnAlterarClick(Sender: TObject);
begin
  if cdsCondicoes.RecordCount <= 0 then exit;
  cdsCondicoes.Edit;
  pnlElse.Visible := False;
  pnlDados.BringToFront;
  ModoAlteracao;
end;


procedure TframeCondRAD.btnExcluirClick(Sender: TObject);
begin
  if cdsCondicoes.RecordCount <= 0 then exit;
  cdsCondicoes.Delete;
end;


procedure TframeCondRAD.btnCancelarClick(Sender: TObject);
begin
  cdsCondicoes.Cancel;
  pnlElse.Visible := True;
  pnlGrid.BringToFront;
  ModoBrowser;
end;


procedure TframeCondRAD.btnOkClick(Sender: TObject);
begin
  if trim( dblkpNumEtapaDest.Text ) = '' then
  begin
    MsgDlg( 'Selecione a etapa de destino para estas condições.', 'Erro', mtError, [mbOk], 0 );
    dblkpNumEtapaDest.SetFocus;
    exit;
  end;

  if Valida then
  begin
    cdsCondicoes.Post;
    pnlElse.Visible := True;
    pnlGrid.BringToFront;
    ModoBrowser;
  end;
end;


function TframeCondRAD.Valida : boolean;
begin
  Result := True;
end;

procedure TframeCondRAD.dbgrdCondicoesDblClick(Sender: TObject);
begin
  btnAlterarClick( nil );
end;

procedure TframeCondRAD.dblkpNumEtapaDestKeyPress(Sender: TObject; var Key: Char);
begin
  if ( ( Ord( Key ) < 48 ) or ( Ord( Key ) > 57 ) ) and
     ( Ord( Key ) <> VK_DELETE ) and ( Ord( Key ) <> VK_BACK ) then
    Key := #0;
end;

procedure TframeCondRAD.dbgrdCondicoesCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if not ( gdSelected in State ) then
    if ( cdsCondicoes.RecNo mod 2 ) = 0 then
      ABrush.Color:= $00C0FFFF;
end;

procedure TframeCondRAD.sbtnUpEtapaClick(Sender: TObject);
var
  bm : TBookmark;
  i, j : integer;
begin
  if not cdsCondicoes.Active then exit;
  if cdsCondicoes.IsEmpty then exit;
  if cdsCondicoes.RecNo < 2 then exit;

  i := cdsCondicoes.FieldByName('ORDEM').AsInteger;
  bm := cdsCondicoes.GetBookmark;

  cdsCondicoes.Prior;
  j := cdsCondicoes.FieldByName('ORDEM').AsInteger;
  cdsCondicoes.Edit;
  cdsCondicoes.FieldByName('ORDEM').AsInteger := i;
  cdsCondicoes.Post;

  cdsCondicoes.GotoBookmark( bm );
  cdsCondicoes.Edit;
  cdsCondicoes.FieldByName('ORDEM').AsInteger := j;
  cdsCondicoes.Post;

  cdsCondicoes.FreeBookmark( bm );
end;

procedure TframeCondRAD.sbtnDownEtapaClick(Sender: TObject);
var
  bm : TBookmark;
  i, j : integer;
begin
  if not cdsCondicoes.Active then exit;
  if cdsCondicoes.IsEmpty then exit;
  if cdsCondicoes.RecNo > ( cdsCondicoes.RecordCount - 1 ) then exit;

  i := cdsCondicoes.FieldByName('ORDEM').AsInteger;
  bm := cdsCondicoes.GetBookmark;

  cdsCondicoes.Next;
  j := cdsCondicoes.FieldByName('ORDEM').AsInteger;
  cdsCondicoes.Edit;
  cdsCondicoes.FieldByName('ORDEM').AsInteger := i;
  cdsCondicoes.Post;

  cdsCondicoes.GotoBookmark( bm );
  cdsCondicoes.Edit;
  cdsCondicoes.FieldByName('ORDEM').AsInteger := j;
  cdsCondicoes.Post;

  cdsCondicoes.FreeBookmark( bm );
end;

end.
