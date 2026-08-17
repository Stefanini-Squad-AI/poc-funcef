unit fCadCNAE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  TB97Tlbr, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, CmEventosCadastro, ImgList;

type
  TfrmCadCNAE = class(TfrmCadMestreDetalheCS)
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
  frmCadCNAE: TfrmCadCNAE;

implementation

uses UDataBase;

{$R *.DFM}

procedure TfrmCadCNAE.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDCATCNAE').Value := -1;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDCATCNAE').Value := -1;
  qryDet.Open;
end;

procedure TfrmCadCNAE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryDet.Close;
  qry.Close;
end;

procedure TfrmCadCNAE.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
    qry.Close;
    qry.ParamByName('IDCATCNAE').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qry.Open;

    qryDet.Close;
    qryDet.ParamByName('IDCATCNAE').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qryDet.Open;
  end;
end;

procedure TfrmCadCNAE.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  dbedCodigoDet.SetFocus;

  if (qryDet.State = dsInsert) then
  begin
    qryDet.FieldByName('IDCATCNAE').asInteger := qry.FieldByName('IDCATCNAE').asInteger;
    qryDet.FieldByName('IDITEMCNAE').Clear;
    qryDet.FieldByName('DESCRICAO').Clear;
  end;
end;

procedure TfrmCadCNAE.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  dbedCodigoDet.SetFocus;
end;

procedure TfrmCadCNAE.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;
end;

procedure TfrmCadCNAE.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  dbedCodigo.SetFocus;
  qryDet.Close;
  qryDet.ParamByName('IDCATCNAE').Value := 0;
  qryDet.Open;
end;

end.
