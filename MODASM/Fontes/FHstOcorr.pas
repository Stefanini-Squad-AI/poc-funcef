unit fHstOcorr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, Mask, DBCtrls, TB97, TB97Tlbr, MontaSelect, IvDictio, IvMulti,
  IvEMulti, wwdbedit;

type
  TfrmHstOcorr = class(TfrmSairAjuda)
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
    MontaSelectFunc: TMontaSelect;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    MontaSelectCand: TMontaSelect;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    procedure AtualizarDados;
  end;

var
  frmHstOcorr: TfrmHstOcorr;

implementation

uses UsoGeralRH, uMensErro;

{$R *.DFM}

procedure TfrmHstOcorr.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelectFunc.Filtro.Clear;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
    MontaSelectFunc.Filtro.Add ('FUNCIONARIO.IDESTAB IN ' +sUsuXfilial);

  // C. de Custo(s) habilitado(s) para o usuário
  if (sUsuXccusto <> '') then
    MontaSelectFunc.Filtro.Add ('FUNCIONARIO.CODCENTROCUSTO IN ' +sUsuXccusto);

  with (MontaSelectFunc.Filtro) do
  begin
    Add('EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA');
    Add('CARGO.IDCARGO        = FUNCIONARIO.IDCARGO');
    Add('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
  end;

  sbtnProcurarClick(Self);
end;

procedure TfrmHstOcorr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.Close;
  qryDet.Close;
  inherited;
end;

procedure TfrmHstOcorr.sbtnProcurarClick(Sender: TObject);
begin
  sbtnProcurar.Down := false;

  if (MsgDlg('Procura Empregado ? (Senão, Candidato)',
             'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) then
  begin
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

    MontaSelectFunc.Executar;
    if (MontaSelectFunc.ValoresChave.Count > 0) and (MontaSelectFunc.ValoresChave[0] <> '') then
      qry.SQL[7] := '  (P.IDPESSOA = ' + MontaSelectFunc.ValoresChave[0]+ ') AND';

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
  end
  else
  begin
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT');
    qry.SQL.Add('  (''  '' || NOME) AS NOME, IDPESSOA, IDPESSOA AS MATRICULA,');
    qry.SQL.Add('  (''Candidato'') AS SITUACAO');
    qry.SQL.Add('FROM');
    qry.SQL.Add('  PESSOA');
    qry.SQL.Add('WHERE');
    qry.SQL.Add('  (IDPESSOA = -1)');

    MontaSelectCand.Executar;
    if (MontaSelectCand.ValoresChave.Count > 0) and (MontaSelectCand.ValoresChave[0] <> '') then
      qry.SQL[6] := '  (IDPESSOA = ' +MontaSelectCand.ValoresChave[0] +')';

    qry.Open;

    dbtxtSituacao.Font.Color := clBlack;
  end;

  AtualizarDados;
end;

procedure TfrmHstOcorr.AtualizarDados;
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
  qryDet.SQL.Add('  TP.DESCRTIPOOCMED, HS.DATAPLAN,');
  qryDet.SQL.Add('  HS.DATAREAL, HS.EXAMINADOR, HS.AVALIACAO');
  qryDet.SQL.Add('FROM');
  qryDet.SQL.Add('  TIPOCMED TP, HSTASMED HS');
  qryDet.SQL.Add('WHERE');
  qryDet.SQL.Add('  (HS.IDPESSOA     = ' +Trim(sIDPessoa)+ ') AND');
  qryDet.SQL.Add('  (HS.CODTIPOOCMED = TP.CODTIPOOCMED)');
  qryDet.SQL.Add('ORDER BY');
  qryDet.SQL.Add('  HS.DATAREAL DESC');
  qryDet.Open;
end;

end.
