unit FHstSitFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBTables, Wwquery,
  Db, Wwtable, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Mask, DBCtrls, TB97,
  TB97Tlbr, MontaSelect, IvDictio, IvMulti, IvEMulti, wwdbedit;

type
  TfrmHstSitFunc = class(TfrmOkCancelar)
    Panel2: TPanel;
    ds: TwwDataSource;
    dsDet: TwwDataSource;
    qryDet: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    sbtnProcurar: TSpeedButton;
    dbgrHistorico: TwwDBGrid;
    qry: TwwQuery;
    dbtxtSituacao: TDBText;
    MontaSelect: TMontaSelect;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHstSitFunc: TfrmHstSitFunc;

implementation

uses UsoGeralRH;

{$R *.DFM}

procedure TfrmHstSitFunc.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Clear;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
    MontaSelect.Filtro.Add ('FUNCIONARIO.IDESTAB IN ' +sUsuXfilial);

  // C. de Custo(s) habilitado(s) para o usuário
  if (sUsuXccusto <> '') then
    MontaSelect.Filtro.Add ('FUNCIONARIO.CODCENTROCUSTO IN ' +sUsuXccusto);

  with (MontaSelect.Filtro) do
  begin
    Add ('EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA');
    Add ('CARGO.IDCARGO        = FUNCIONARIO.IDCARGO');
    Add ('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
  end;

  qry.Prepare;
  qryDet.Prepare;

  sbtnProcurarClick(Self);
end;

procedure TfrmHstSitFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.Close;
  qry.UnPrepare;
  qryDet.Close;
  qryDet.UnPrepare;
  inherited;
end;

procedure TfrmHstSitFunc.sbtnProcurarClick(Sender: TObject);
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

  bbtnConfirmarClick(Sender);
end;

procedure TfrmHstSitFunc.bbtnConfirmarClick(Sender: TObject);
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
