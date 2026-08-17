unit FSelAltTributacao; 
 
interface 

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBClient, uCMClientDataSet, Wwdatsrc, Grids, Wwdbigrd,
  Wwdbgrid, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TfrmSelAltTributacao = class(TfrmOkCancelar)
    Panel1: TPanel;
    lblText1: TLabel;
    lblText2: TLabel;
    Panel2: TPanel;
    grdAlteradores: TwwDBGrid;
    lblText3: TLabel;
    dsAlteradores: TwwDataSource;
    cdsAlteradores: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    iCodAlterador: Integer;
    dAliquota: Double;
    sDescricao: string;
    sAcrescDesc: String;
    bOperacaoOK: Boolean;
    iPeriodoTributacao: Integer;
  end;

var
  frmSelAltTributacao: TfrmSelAltTributacao;

implementation

{$R *.DFM}

procedure TfrmSelAltTributacao.FormCreate(Sender: TObject);
begin
  inherited;
  iCodAlterador := -1;
  dAliquota := 0;
  sDescricao := EmptyStr;
  bOperacaoOK := False;
  sAcrescDesc := EmptyStr;
  iPeriodoTributacao := -1;
end;

procedure TfrmSelAltTributacao.bbtnConfirmarClick(Sender: TObject);
var
  bSelLinha: Boolean;
begin
  inherited;
  bSelLinha := False;
  cdsAlteradores.DisableControls;
  cdsAlteradores.First;

  while not cdsAlteradores.Eof do
  begin
    if (cdsAlteradores.FieldByName('SEL').AsString = 'S') and (not bSelLinha) then
    begin
      bSelLinha := True;
      iCodAlterador := cdsAlteradores.FieldByName('CODALTERADOR').asInteger;
      dAliquota := cdsAlteradores.FieldByName('ALIQUOTA').asFloat;
      sDescricao := cdsAlteradores.FieldByName('DESCRICAO').AsString;
      sAcrescDesc := cdsAlteradores.FieldByName('ACRESDECRES').AsString;
      iPeriodoTributacao := cdsAlteradores.FieldByName('PERTRIBUTO').asInteger;
    end
    else
      if (cdsAlteradores.FieldByName('SEL').AsString = 'S') and (bSelLinha) then
      begin
        MessageDlg('Só é possível selecionar um tipo de alterador.', mtInformation, [mbOK], 0);
        Exit;
      end;
    cdsAlteradores.Next;
  end;
  cdsAlteradores.EnableControls;

  if not bSelLinha then
    MessageDlg('Selecione um tipo de alterador.', mtInformation, [mbOK], 0)
  else
    bOperacaoOK := True;
end;

procedure TfrmSelAltTributacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  inherited;

end;

end.
