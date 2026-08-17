unit fParamRelRubricaRI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, CheckLst, Spin;

type
  TfrmParamRelRubricaRI = class(TfrmOkCancelar)
    Label1: TLabel;
    chkListX: TCheckListBox;
    qryRubrica: TwwQuery;
    dsRubrica: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      sRubrica: String;

  end;

var
  frmParamRelRubricaRI: TfrmParamRelRubricaRI;

implementation

{$R *.DFM}

uses uMensErro;

procedure TfrmParamRelRubricaRI.FormShow(Sender: TObject);
begin
  inherited;
  while not qryRubrica.eof do
  begin
     chkListX.Items.Add(qryRubrica.FieldByName('DESCRICAO').AsString);
     qryRubrica.Next;
  end;
end;

procedure TfrmParamRelRubricaRI.bbtnConfirmarClick(Sender: TObject);
Var
  i: Integer;
begin
  inherited;
  for i := 0 to chkListX.Items.Count - 1 do
  if chkListX.checked[i] then
  begin
    if qryRubrica.Locate('DESCRICAO',chkListX.Items[i],[loCaseInsensitive, loPartialKey]) then
      sRubrica := sRubrica + qryRubrica.FieldByName('RUBRICAINSS').AsString+ ', ';
  end;
  sRubrica := Copy(sRubrica,1, Length(sRubrica) - 2);

  If trim(sRubrica) = '' Then
  Begin
    MsgDlg('Selecione ao menos uma Rubrica para exibir o relatório.','Atenção',mtWarning,[mbOk],0);
    ModalResult := mrNone;
  End;

end;

procedure TfrmParamRelRubricaRI.FormCreate(Sender: TObject);
begin
  inherited;
  qryRubrica.Open;
end;

end.
