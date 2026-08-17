unit fHstAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, Mask, DBCtrls, TB97, TB97Tlbr, MontaSelect, IvDictio, IvMulti,
  IvEMulti, wwdbedit;

type
  TfrmHstAval = class(TfrmSairAjuda)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    procedure AtualizarDados;
  end;

var
  frmHstAval: TfrmHstAval;

implementation

uses UsoGeralRH, uMensErro;

{$R *.DFM}

procedure TfrmHstAval.FormCreate(Sender: TObject);
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
    Add('EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA');
    Add('CARGO.IDCARGO        = FUNCIONARIO.IDCARGO');
    Add('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
  end;

  sbtnProcurarClick(Self);
end;

procedure TfrmHstAval.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.Close;
  qryDet.Close;
  inherited;
end;

procedure TfrmHstAval.sbtnProcurarClick(Sender: TObject);
begin
  sbtnProcurar.Down := false;

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('SELECT');
  qry.SQL.Add('  (''  '' || P.NOME) AS NOME,  P.IDPESSOA, ST.TIPOSIT, F.MATRICULA,');
  qry.SQL.Add('  DECODE(ST.TIPOSIT,''A'',''(Ativ'', ''F'',''(Afastad'', ''D'',''(Demitid'') ||');
  qry.SQL.Add('    DECODE(PEFIS.SEXO,''F'',''a)'',''o)'') AS SITUACAO');
  qry.SQL.Add('FROM');
  qry.SQL.Add('  PESSOA P, PESSOAFISICA PEFIS, FUNCIONARIO F, SITFUNC ST');
  qry.SQL.Add('WHERE');
  qry.SQL.Add('  (P.IDPESSOA  = -1)    AND');
  qry.SQL.Add('  (P.IDPESSOA  = F.IDPESSOA)   AND');
  qry.SQL.Add('  (F.IDSITFUNC = ST.IDSITFUNC) AND');
  qry.SQL.Add('  (F.IDPESSOA  = PEFIS.IDPESSOA)');

  MontaSelect.Executar;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
    qry.SQL[7] := '  (P.IDPESSOA = ' + MontaSelect.ValoresChave[0]+ ') AND';

  qry.Open;

  if not(qry.IsEmpty) then
    if (qry.FieldByName('TIPOSIT').asString = 'D') then
      dbtxtSituacao.Font.Color := clRed
    else
    if (qry.FieldByName('TIPOSIT').asString = 'F') then
      dbtxtSituacao.Font.Color := clGreen
    else
    if (qry.FieldByName('TIPOSIT').asString = 'A') then
      dbtxtSituacao.Font.Color := clBlue;

  AtualizarDados;
end;

procedure TfrmHstAval.AtualizarDados;
var
  sIDPessoa: string;
begin
  if (Trim(qry.FieldByName('IDPESSOA').asString) <> '') then
    sIDPessoa := qry.FieldByName('IDPESSOA').asString
  else
    sIDPessoa := '-1';

  qryDet.Close;
  qryDet.SQL.Clear;
  qryDet.SQL.Add('SELECT');
  qryDet.SQL.Add('  TP.DESCRTIPOAVAL, HS.DATAPLAN,');
  qryDet.SQL.Add('  HS.DATAREAL, HS.AVALIACAO, HS.AVALIADOR');
  qryDet.SQL.Add('FROM');
  qryDet.SQL.Add('  TIPOAVAL TP, HSTAVAL HS');
  qryDet.SQL.Add('WHERE');
  qryDet.SQL.Add('  (HS.IDPESSOA    = ' +Trim(sIDPessoa)+ ') AND');
  qryDet.SQL.Add('  (HS.CODTIPOAVAL = TP.CODTIPOAVAL)');
  qryDet.SQL.Add('ORDER BY');
  qryDet.SQL.Add('  HS.DATAREAL DESC');
  qryDet.Open;
end;

end.
