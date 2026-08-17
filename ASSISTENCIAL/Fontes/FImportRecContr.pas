unit FImportRecContr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ComCtrls, wwdblook, MAHlpBtn, Buttons, ExtCtrls,
  Db, Wwdatsrc, DBTables, Wwquery, OpenArqText,  TB97;

type
  TfrmImportRecContr = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmbpatro: TwwDBLookupCombo;
    posicao: TProgressBar;
    Panel2: TPanel;
    Label4: TLabel;
    cmbarq: TwwDBLookupCombo;
    Memo1: TMemo;
    OpenArq: TOpenArqText;
    qrypatro: TwwQuery;
    dsplanass: TwwDataSource;
    qryplanass: TwwQuery;
    dspatro: TwwDataSource;
    qryArq: TwwQuery;
    qryplanoprev: TwwQuery;
    dsplanoprev: TwwDataSource;
    qryAux: TwwQuery;
    qrycontribass: TwwQuery;
    cmbplanprev: TwwDBLookupCombo;
    cmbplanass: TwwDBLookupCombo;
    qrypatroIDPESSOA: TFloatField;
    qrypatroNOME: TStringField;
    procedure bbtnOkClick(Sender: TObject);
    procedure bbtnCancelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbpatroChange(Sender: TObject);
    procedure cmbplanprevChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportRecContr: TfrmImportRecContr;

implementation

uses FTelaAut;

{$R *.DFM}



procedure TfrmImportRecContr.bbtnOkClick(Sender: TObject);
begin
  inherited;

if cmbpatro.text = '' then
begin
     showmessage('É preciso selecionar uma patrocinadora !');
     exit;
end;

if cmbplanprev.text = '' then
begin
     showmessage('É preciso selecionar um plano previdenciário !');
     exit;
end;

if cmbplanass.text = '' then
begin
     showmessage('É preciso selecionar um plano assistencial !');
     exit;
end;

if cmbarq.text = '' then
begin
     showmessage('É preciso selecionar o layout do arquivo de entrada !');
     exit;
end;


openArq.IdArq := qryArq.FieldByName('IdArq').AsInteger;

OpenArq.execute;

if openarq.abrearquivo('L') = false  then
begin
     showmessage('O arquivo escolhido e o layout não são compatíveis !');
     exit;
end;

end;

procedure TfrmImportRecContr.bbtnCancelaClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmImportRecContr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
action := cafree;
end;

procedure TfrmImportRecContr.cmbpatroChange(Sender: TObject);
begin
  inherited;
cmbplanprev.text := '';
cmbplanass.text := '';
end;

procedure TfrmImportRecContr.cmbplanprevChange(Sender: TObject);
begin
  inherited;
cmbplanass.text := '';
end;

procedure TfrmImportRecContr.FormActivate(Sender: TObject);
begin
  inherited;
qrypatro.open;
qryplanoprev.open;
qryplanass.open;
qryarq.open;
end;


procedure TfrmImportRecContr.bbtnSairClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmImportRecContr.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

if cmbpatro.text = '' then
begin
     showmessage('É preciso selecionar uma patrocinadora !');
     exit;
end;

if cmbplanprev.text = '' then
begin
     showmessage('É preciso selecionar um plano previdenciário !');
     exit;
end;

if cmbplanass.text = '' then
begin
     showmessage('É preciso selecionar um plano assistencial !');
     exit;
end;

if cmbarq.text = '' then
begin
     showmessage('É preciso selecionar o layout do arquivo de entrada !');
     exit;
end;


openArq.IdArq := qryArq.FieldByName('IdArq').AsInteger;

OpenArq.execute;

if openarq.abrearquivo('L') = false  then
begin
     showmessage('O arquivo escolhido e o layout não são compatíveis !');
     exit;
end;

end;


end.
