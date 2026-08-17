unit FSelRelCurso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, StdCtrls, wwdblook, ExtCtrls, MAHlpBtn, Buttons,
  Db, DBTables, Wwquery, TB97, ComCtrls, IvDictio, IvMulti, IvEMulti,
  TB97Tlbr;

type
  TfrmSelRelCurso = class(TCMParamRel)
    qryGrupo: TwwQuery;
    TabSheet1: TTabSheet;
    rgSelTudo: TRadioGroup;
    gbxGrupo: TGroupBox;
    dblcGrupo: TwwDBLookupCombo;
    lstGrupo: TListBox;
    rgSequencia: TRadioGroup;
    rgImprDescr: TRadioGroup;
    lstCodGrupo: TListBox;
    procedure dblcGrupoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgSelTudoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelCurso: TfrmSelRelCurso;
  SvItem : Integer;

implementation

uses RCursos;

{$R *.DFM}




procedure TfrmSelRelCurso.dblcGrupoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstGrupo.Items.Add(qryGrupo.FieldByName('DESCGRPTREIN').Value);
     lstCodGrupo.Items.Add(qryGrupo.FieldByName('CODGRPTREIN').AsString);
  end;
end;

procedure TfrmSelRelCurso.lstGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstGrupo.Items.Count > 0)  then begin
      SvItem := lstGrupo.ItemIndex;
      lstGrupo.Items.Delete(SvItem);
      lstCodGrupo.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelRelCurso.rgSelTudoClick(Sender: TObject);
begin
  inherited;
  gbxGrupo.Visible := (rgSelTudo.ItemIndex = 1);
end;

procedure TfrmSelRelCurso.FormCreate(Sender: TObject);
begin
  inherited;
  qryGrupo.Open;
end;

procedure TfrmSelRelCurso.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  relCursos := TrelCursos.Create(Self);
  relCursos.qr.Preview;
  Self.WindowState := wsNormal;
  //relCursos.Free;
  //relCursos := Nil;
end;

procedure TfrmSelRelCurso.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  relCursos := TrelCursos.Create(Self);
  relCursos.qr.Print;
  Self.WindowState := wsNormal;
  //relCursos.Free;
  //relCursos := Nil;
end;




end.
