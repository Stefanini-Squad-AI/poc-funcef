unit fCadPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, DBCtrls, wwdbedit, Wwdotdot, Wwdbcomb,
  wwdblook;

type
  TfrmCadPeriodo = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dbedCodOcorr: TDBEdit;
    dbedDescricao: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblckCargo: TwwDBLookupCombo;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    dbcbIndTempo: TwwDBComboBox;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    qryCargo: TwwQuery;
    qryMaxDet: TwwQuery;
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblckCargoChange(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
  private
    procedure SelecionaDados(Id: string);
  public
    { Public declarations }
  end;

var
  frmCadPeriodo: TfrmCadPeriodo;

implementation

uses uDataBase;

{$R *.DFM}

procedure TfrmCadPeriodo.SelecionaDados(Id: string);
begin
  qry.Close;
  qry.ParamByName('CODTIPOOCMED').asString := Id;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('CODTIPOOCMED').asString := Id;
  qryDet.Open;
end;

procedure TfrmCadPeriodo.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Prepare;
  qryDet.Prepare;
  qryMaxDet.Prepare;

  qryCargo.Open;

  SelecionaDados('-1');
  sbtnProcurarClick(Sender);
end;

procedure TfrmCadPeriodo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryCargo.Close;  
  qry.Close;
  qryDet.Close;

  qry.UnPrepare;
  qryDet.UnPrepare;
  qryMaxDet.UnPrepare;
end;

procedure TfrmCadPeriodo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
    SelecionaDados(MontaSelect.ValoresChave[0]);
end;

procedure TfrmCadPeriodo.dblckCargoChange(Sender: TObject);
begin
  inherited;
  if (qryDet.State in [dsInsert, dsEdit]) and (Trim(dblckCargo.Text) <> '') then
    qryDet.FieldByName('DESCRICAO').asString := dblckCargo.Text;
end;

procedure TfrmCadPeriodo.CmeDetalheInsert(Sender: TObject);
var
  rProxSeq: real;
begin
  inherited;
  qryMaxDet.ParamByName('CODTIPOOCMED').asFloat := qry.FieldByName('CODTIPOOCMED').asFloat;
  qryMaxDet.Open;

  if (qryMaxDet.IsEmpty) then
    rProxSeq := 1
  else
    rProxSeq := qryMaxDet.FieldByName('MAXNUMSEQ').asFloat + 1;

  qryMaxDet.Close;

  qryDet.FieldByName('CODTIPOOCMED').asString := MontaSelect.ValoresChave[0];
  qryDet.FieldByName('NUMSEQ').asFloat        := rProxSeq;
end;

procedure TfrmCadPeriodo.CmeCadastroConfirma(Sender: TObject);
begin
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;
end;

end.
