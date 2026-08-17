unit fHstEvol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, Mask, DBCtrls, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbedit,
  MontaSelect;

type
  TfrmHstEvol = class(TfrmSairAjuda)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ds: TwwDataSource;
    dsDet: TwwDataSource;
    qryDet: TwwQuery;
    sbtnProcurar: TSpeedButton;
    MontaSelect: TMontaSelect;
    qry: TwwQuery;
    dbgrEvol: TwwDBGrid;
    dbtxtSituacao: TDBText;
    qryDetDATAALTERFUNC: TDateTimeField;
    qryDetDESCRICAO: TStringField;
    qryDetSALARIO: TFloatField;
    qryDetTIPOPAGAMENTO: TStringField;
    qryDetPERC_REAJ: TFloatField;
    qryDetTITULO: TStringField;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    qryDetCCUSTO: TStringField;
    qryDetFUNCAO: TStringField;
    qryParamRH: TwwQuery;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure AtualizaDados;
  end;

var
  frmHstEvol: TfrmHstEvol;

implementation

uses UsoGeralRH;

{$R *.DFM}

procedure TfrmHstEvol.FormCreate(Sender: TObject);
begin
  inherited;
  qryParamRH.Open;
  qryDet.Close;
  if (qryParamRH.FieldByName('FLGDOISCARGOS').asInteger = 0) then
  with dbgrEvol, dbgrEvol.DataSource.DataSet do
  begin
    DisableControls;
    Selected.Delete(6);
    EnableControls;
  end;


  MontaSelect.Filtro.Clear;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
    MontaSelect.Filtro.Add ('FUNCIONARIO.IDESTAB IN ' +sUsuXfilial);

  // C. de Custo(s) habilitado(s) para o usuário
  if (sUsuXccusto <> '') then
    MontaSelect.Filtro.Add ('FUNCIONARIO.CODCENTROCUSTO IN ' +sUsuXccusto);

  with (MontaSelect.Filtro) do
  begin
    Add('EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA');
    Add('CARGO.IDCARGO        = FUNCIONARIO.IDCARGO');
    Add('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
  end;

  qry.Prepare;
  qryDet.Prepare;

  sbtnProcurarClick(Self);
end;

procedure TfrmHstEvol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.Close;
  qryDet.Close;
  qry.UnPrepare;
  qryDet.UnPrepare;
  inherited;
end;

procedure TfrmHstEvol.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;
  sbtnProcurar.Down := false;

  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
    qry.Close;
    qry.ParamByName('IDPESSOA').asInteger := StrToInt(MontaSelect.ValoresChave[6]);
    qry.Open;

    if (qry.FieldByName('TIPOSIT').asString = 'D') then
      dbtxtSituacao.Font.Color := clRed
    else
    if (qry.FieldByName('TIPOSIT').asString = 'F') then
      dbtxtSituacao.Font.Color := clGreen
    else
    if (qry.FieldByName('TIPOSIT').asString = 'A') then
      dbtxtSituacao.Font.Color := clBlue;
  end
  else
  begin
    qry.Close;
    qry.ParamByName('IDPESSOA').asInteger := -1;
    qry.Open;
  end;

  AtualizaDados;
end;

procedure TfrmHstEvol.AtualizaDados;
var
  iIDPessoa: integer;
begin
  inherited;
  if (Trim(qry.FieldByName('IDPESSOA').asString) <> '') then
    iIDPessoa := qry.FieldByName('IDPESSOA').asInteger
  else
    iIDPessoa := -1;

  qryDet.Close;
  qryDet.ParamByName('IDPESSOA').asInteger := iIDPessoa;
  qryDet.Open;
end;

end.
