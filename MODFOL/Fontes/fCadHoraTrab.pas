unit fCadHoraTrab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, TREdit, DBCtrls, Mask,
  CmEventosCadastro, ImgList;

type
  TfrmCadHoraTrab = class(TFrmCadastroGridCS)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedHorario: TDBEdit;
    Label3: TLabel;
    dbedJornada: TDBEdit;
    dbrgTipoHorario: TDBRadioGroup;
    gbxEscala: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbreFolga1: TDBRealEdit;
    DBRealEdit2: TDBRealEdit;
    DBRealEdit3: TDBRealEdit;
    procedure dbrgTipoHorarioChange(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmCadHoraTrab: TfrmCadHoraTrab;

implementation

uses uMensErro;

{$R *.DFM}

procedure TfrmCadHoraTrab.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDHORARIO', MontaSelect.ValoresChave[0], []);
end;

procedure TfrmCadHoraTrab.dbrgTipoHorarioChange(Sender: TObject);
begin
  inherited;
  gbxEscala.Visible := (dbrgTipoHorario.ItemIndex = 1)
end;

procedure TfrmCadHoraTrab.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  gbxEscala.Visible := (dbrgTipoHorario.ItemIndex = 1)
end;

procedure TfrmCadHoraTrab.bbtnConfirmarClick(Sender: TObject);
begin
  if (dbrgTipoHorario.ItemIndex = 1) and (dbreFolga1.Value >= 24) then
  begin
    MsgDlg('Folga 1 deve ser inferiror a 24 !','Aviso', mtInformation,[mbOK,mbHelp],0);
    dbreFolga1.SetFocus;
    exit;
  end;
  inherited;
end;

end.
