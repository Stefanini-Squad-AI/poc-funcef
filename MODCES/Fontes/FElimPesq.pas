unit FElimPesq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, wwdblook, Db,
  DBTables, Wwtable, Wwdatsrc, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmElimPesq = class(TfrmOkCancelar)
    ds: TwwDataSource;
    tblTendencia: TwwTable;
    tblTendenciaIDPESQSALAR: TFloatField;
    tblTendenciaIDCARGO: TFloatField;
    tblTendenciaIDEMPRESAPARTIC: TFloatField;
    tblTendenciaFREQ: TFloatField;
    tblTendenciaMENOR: TFloatField;
    tblTendenciaPRIMQUA: TFloatField;
    tblTendenciaMEDIA: TFloatField;
    tblTendenciaMODA: TFloatField;
    tblTendenciaMEDIANA: TFloatField;
    tblTendenciaTERCQUA: TFloatField;
    tblTendenciaMAIOR: TFloatField;
    tblTendenciaMENOR_R: TFloatField;
    tblTendenciaPRIMQUA_R: TFloatField;
    tblTendenciaMEDIA_R: TFloatField;
    tblTendenciaMODA_R: TFloatField;
    tblTendenciaMEDIANA_R: TFloatField;
    tblTendenciaTERCQUA_R: TFloatField;
    tblTendenciaMAIOR_R: TFloatField;
    tblPesqui: TwwTable;
    tblDadoPesq: TwwTable;
    tblDadoPesqFREQ: TFloatField;
    tblDadoPesqNOMINAL: TFloatField;
    tblDadoPesqREAL: TFloatField;
    tblDadoPesqIDPESQSALAR: TFloatField;
    tblDadoPesqIDCARGO: TFloatField;
    tblDadoPesqIDEMPRPART: TFloatField;
    tblDadoPesqNUMSEQ: TFloatField;
    gbxPesq: TGroupBox;
    dblcPesq: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcPesqChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmElimPesq: TfrmElimPesq;

implementation

uses uMensErro;

{$R *.DFM}

procedure TfrmElimPesq.FormCreate(Sender: TObject);
begin
  inherited;
  tblPesqui.Open;
  tblDadoPesq.Open;
  tblTendencia.Open;
end;

procedure TfrmElimPesq.dblcPesqChange(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := (dblcPesq.Text <> '');
end;

procedure TfrmElimPesq.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (MsgDlg('Confirma a Eliminação da Pesquisa ?', LerMensagem(4),
            mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
    exit;

  inherited;
  Screen.Cursor := crHourGlass;

  tblDadoPesq.First;
  while not(tblDadoPesq.EOF) do
    tblDadoPesq.Delete;

  tblTendencia.First;
  while not(tblTendencia.EOF) do
    tblTendencia.Delete;

  ds.DataSet.Delete;

  Screen.Cursor := crDefault;

  MsgDlg('Processo de Eliminação Concluído !',LerMensagem(3), mtInformation,[mbOk, mbHelp], 0);

  bbtnConfirmar.Enabled := false;
  dblcPesq.SelText      := '';
end;

end.
