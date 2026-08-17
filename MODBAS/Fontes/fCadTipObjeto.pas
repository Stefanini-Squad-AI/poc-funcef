unit fCadTipObjeto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroGridCS,
  wwdblook, StdCtrls, ExtCtrls, DBCtrls, Mask, CmEventosCadastro, ImgList, Db, Wwdatsrc,
  MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmCadTipObjeto = class(TFrmCadastroGridCS)
    qryRubrica: TwwQuery;
    qryGrpObjeto: TwwQuery;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dbrgRubrica: TDBRadioGroup;
    gbxRubrica: TGroupBox;
    dblcRubrica: TwwDBLookupCombo;
    Label2: TLabel;
    dbedDescricao: TDBEdit;
    Label3: TLabel;
    dblcGrpObjeto: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dbrgRubricaChange(Sender: TObject);
    procedure dblcRubricaChange(Sender: TObject);
  end;

var
  frmCadTipObjeto: TfrmCadTipObjeto;

implementation

uses uMensErro;

{$R *.DFM}

procedure TfrmCadTipObjeto.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Open;
  qryGrpObjeto.Open;
  qryRubrica.Open;

  dbrgRubrica.Visible := not(qryRubrica.EOF);
  gbxRubrica.Visible  := (dbrgRubrica.ItemIndex = 0);
end;

procedure TfrmCadTipObjeto.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('CLASSEOBJ').asInteger   := 1;
  qry.FieldByName('FLGPROVDESC').asInteger := 0;
  dbrgRubricaChange(nil);
end;

procedure TfrmCadTipObjeto.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) and (MontaSelect.ValoresChave.Count > 0) then
    qry.Locate('CODTIPOOBJETO',MontaSelect.ValoresChave[0],[]);
end;

procedure TfrmCadTipObjeto.dbrgRubricaChange(Sender: TObject);
begin
  gbxRubrica.Visible := (dbrgRubrica.ItemIndex = 0);
end;

procedure TfrmCadTipObjeto.dblcRubricaChange(Sender: TObject);
begin
  if (qry.State in [dsInsert, dsEdit]) and
     (Trim(dbedDescricao.Text) <> Trim(dblcRubrica.Text)) then
    if (MsgDlg('Altera a Descrição do Objeto?', LerMensagem(4),
               mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      dbedDescricao.Text := Trim(dblcRubrica.Text);
end;

end.
