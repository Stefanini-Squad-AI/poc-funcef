unit fCadAjuste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadMestreDetCS,
  StdCtrls, Mask, DBCtrls, CmEventosCadastro, ImgList, MontaSelect, DBTables, IvDictio, Db,
  IvMulti, IvEMulti, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook;

type
  TfrmCadAjuste = class(TfrmCadMestreDetalheCS)
    dbedCodPesqui: TDBEdit;
    dbedDescricao: TDBEdit;
    dbedData: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryEntid: TwwQuery;
    Label4: TLabel;
    dblcEntid: TwwDBLookupCombo;
    Label5: TLabel;
    dbedFator: TDBEdit;
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcEntidChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
  private
    procedure AbreQuerys (ID: real);
  end;

var
  frmCadAjuste: TfrmCadAjuste;

implementation

uses uMensErro, uDataBase;

{$R *.DFM}

procedure TfrmCadAjuste.FormCreate(Sender: TObject);
begin
  inherited;
  sbtnProcurarClick(Sender);
  
  qryEntid.Open;  
end;

procedure TfrmCadAjuste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryEntid.Close;
  qry.Close;
  qryDet.Close;
  qry.UnPrepare;
  qryDet.UnPrepare;
  inherited;  
end;

procedure TfrmCadAjuste.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
    AbreQuerys(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadAjuste.dblcEntidChange(Sender: TObject);
begin
  if (qryDet.State in [dsInsert, dsEdit]) then
    qryDet.FieldByName('NOME').asString := dblcEntid.Text;
end;

procedure TfrmCadAjuste.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('IDPESQSALAR').asFloat := qry.FieldByName('IDPESQSALAR').asFloat;
  qryDet.FieldByName('FATOR').asInteger     := 0;
end;

procedure TfrmCadAjuste.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblcEntid.Text) = '') then
  begin
    MsgDlg('Por favor selecione uma Entidade !','Aviso', mtInformation,[mbOk,mbHelp],0);
    dblcEntid.SetFocus;
  end
  else
    inherited;
end;

procedure TfrmCadAjuste.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;
end;

procedure TfrmCadAjuste.AbreQuerys (Id: real);
begin
  if not(qry.Prepared) then
    qry.Prepare;
  if not(qryDet.Prepared) then
  qryDet.Prepare;

  qry.Close;
  qry.ParamByName('IDPESQSALAR').asFloat := Id;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPESQSALAR').asFloat := Id;
  qryDet.Open;
end;

end.
