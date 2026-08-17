unit FCadParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls,
  Buttons, ComCtrls, ToolWin, ExtCtrls, Mask, DBTables, Wwtable, TB97,
  TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdblook, Wwquery,
  CmEventosCadastro, wwDialog, ImgList;

type
  TfrmCadParam = class(TfrmCadastro)
    tblParam: TwwTable;
    qryMoeda: TwwQuery;
    Label12: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    gbxIntegraCont: TGroupBox;
    dbrgIntegraCont: TDBRadioGroup;
    dbrgSubConta: TDBRadioGroup;
    dbrgIntegraCAP: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbrgIntegraContChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadParam: TfrmCadParam;

implementation

{$R *.DFM}

procedure TfrmCadParam.FormCreate(Sender: TObject);
begin
  inherited;
  tblParam.Open;
  qryMoeda.Open;
  sbtnInserir.Enabled := tblParam.Eof;
  sbtnAlterar.Enabled := not tblParam.Eof;
  dbnav.Visible := False;
  sbtnProcurar.Visible := False;
end;

procedure TfrmCadParam.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  sbtnInserir.Enabled := tblParam.Eof;
  sbtnAlterar.Enabled := not tblParam.Eof;
  dbnav.Visible := False;
end;

procedure TfrmCadParam.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  sbtnInserir.Enabled := tblParam.Eof;
  sbtnAlterar.Enabled := not tblParam.Eof;
  dbnav.Visible := False;
end;

procedure TfrmCadParam.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  sbtnInserir.Enabled := tblParam.Eof;
  sbtnAlterar.Enabled := not tblParam.Eof;
  dbnav.Visible := False;
end;

procedure TfrmCadParam.dbrgIntegraContChange(Sender: TObject);
begin
  inherited;
  dbrgSubConta.Visible := dbrgIntegraCont.ItemIndex = 0;
end;

procedure TfrmCadParam.FormShow(Sender: TObject);
begin
  inherited;
  dbrgSubConta.Visible := dbrgIntegraCont.ItemIndex = 0;
end;

end.
