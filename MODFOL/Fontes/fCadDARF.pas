unit fCadDARF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  TB97Tlbr, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, CmEventosCadastro, ImgList;

type
  TfrmCadDARF = class(TfrmCadMestreDetalheCS)
    dbedCodigo: TDBEdit;
    dbedDescr: TDBEdit;
    Label2: TLabel;
    Label1: TLabel;
    qryDet: TwwQuery;
    updSQLDet: TUpdateSQL;
    dbedDescrDet: TDBEdit;
    Label3: TLabel;
    dbedCodigoDet: TDBEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadDARF: TfrmCadDARF;

implementation

uses UDataBase;

{$R *.DFM}

procedure TfrmCadDARF.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDCONTRIBDARF').Value := -1;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDCONTRIBDARF').Value := -1;
  qryDet.Open;
end;

procedure TfrmCadDARF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryDet.Close;
  qry.Close;
end;

procedure TfrmCadDARF.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
    qry.Close;
    qry.ParamByName('IDCONTRIBDARF').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qry.Open;

    qryDet.Close;
    qryDet.ParamByName('IDCONTRIBDARF').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qryDet.Open;
  end;
end;

procedure TfrmCadDARF.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  dbedCodigoDet.SetFocus;

  if (qryDet.State = dsInsert) then
  begin
    qryDet.FieldByName('IDCONTRIBDARF').asInteger := qry.FieldByName('IDCONTRIBDARF').asInteger;
    qryDet.FieldByName('IDITEMDARF').Clear;
    qryDet.FieldByName('DESCRICAO').Clear;
  end;
end;

procedure TfrmCadDARF.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  dbedCodigoDet.SetFocus;
end;

procedure TfrmCadDARF.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;
end;

procedure TfrmCadDARF.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  dbedCodigo.SetFocus;
  qryDet.Close;
  qryDet.ParamByName('IDCONTRIBDARF').Value := 0;
  qryDet.Open;
end;

end.
