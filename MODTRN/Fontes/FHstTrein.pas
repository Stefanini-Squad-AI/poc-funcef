unit FHstTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBTables, Wwquery,
  Db, Wwtable, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Mask, DBCtrls, TB97,
  MontaSelect, IvDictio, IvMulti, IvEMulti, TB97Tlbr;

type
  TfrmHstTrein = class(TfrmOkCancelar)
    Panel2: TPanel;
    lblSituacao: TLabel;
    dbgrTrein: TwwDBGrid;
    ds2: TwwDataSource;
    qryTrein: TwwQuery;
    sbtnProcurar: TSpeedButton;
    MontaSelectFunc: TMontaSelect;
    MontaSelectCand: TMontaSelect;
    qryPessoa: TwwQuery;
    ds: TwwDataSource;
    Label1: TLabel;
    dbedMatric: TDBEdit;
    Label2: TLabel;
    dbedNome: TDBEdit;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHstTrein: TfrmHstTrein;

implementation

uses UMensErro, UsoGeralRH;

{$R *.DFM}



procedure TfrmHstTrein.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  dbgrTrein.Visible := False;
  sbtnProcurar.down := false;
  lblSituacao.Caption := '';
  if MsgDlg('Procura Empregado ? (Senão, Candidato)',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
  then begin
      MontaSelectFunc.Executar;
      if (MontaSelectFunc.ValoresChave.Count > 0) and
         (MontaSelectFunc.ValoresChave[0] <> '')
      then begin
          qryPessoa.Close;
          qryPessoa.Sql.Clear;
          qryPessoa.Sql.Add('SELECT P.NOME, P.IDPESSOA, S.TIPOSIT, F.MATRICULA ' +
                            'FROM PESSOA P, FUNCIONARIO F, SITFUNC S ' +
                            'WHERE P.IDPESSOA = ' + MontaSelectFunc.ValoresChave[6] +
                            '  AND P.IDPESSOA = F.IDPESSOA ' +
                            '  AND F.IDSITFUNC = S.IDSITFUNC ');
          qryPessoa.Open;

          if qryPessoa.FieldByName('TIPOSIT').Value = 'A' then
             lblSituacao.Caption := '(Ativo)';
          if qryPessoa.FieldByName('TIPOSIT').Value = 'F' then
             lblSituacao.Caption := '(Afastado)';
          if qryPessoa.FieldByName('TIPOSIT').Value = 'D' then
             lblSituacao.Caption := '(Demitido)';
      end;
  end
  else begin
      MontaSelectCand.Executar;
      if (MontaSelectCand.ValoresChave.Count > 0) and
         (MontaSelectCand.ValoresChave[0] <> '')
      then begin
          qryPessoa.Close;
          qryPessoa.Sql.Clear;
          qryPessoa.Sql.Add('SELECT P.NOME, P.IDPESSOA, P.IDPESSOA AS MATRICULA ' +
                            'FROM PESSOA P ' +
                            'WHERE P.IDPESSOA = ' + MontaSelectFunc.ValoresChave[3]);
          qryPessoa.Open;

          lblSituacao.Caption := '(Candidato)'
      end;
  end;
  bbtnConfirmar.Enabled := (qryPessoa.Active) and (not qryPessoa.Eof);
end;

procedure TfrmHstTrein.FormCreate(Sender: TObject);
begin
  inherited;
  if sUsuXccusto <> '' then
     MontaSelectFunc.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' + sUsuXccusto);

  if sUsuXfilial <> '' then
     MontaSelectFunc.Filtro.Add('FUNCIONARIO.IDESTAB IN ' + sUsuXfilial);

  sbtnProcurarClick(Self);
end;

procedure TfrmHstTrein.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
{ Executa a query }
  dbgrTrein.Visible := True;
  qryTrein.Close;
  qryTrein.SQL.Clear;
  qryTrein.SQL.Add('Select CURSO.DESCRICAO,HSTTRN.DATPLINI,HSTTRN.DATPLFIM,');
  qryTrein.SQL.Add('HSTTRN.DATREINI,HSTTRN.DATREFIM,HSTTRN.AVALTEOR,HSTTRN.AVALPRAT ');
  qryTrein.SQL.Add('from CURSO,HSTTRN where HSTTRN.IDPESSOA = ');
  qryTrein.SQL.Add(trim(qryPessoa.FieldByName('IDPESSOA').AsString));
  qryTrein.SQL.Add(' and HSTTRN.IDCURSO = CURSO.IDCURSO');
  qryTrein.SQL.Add(' order by HSTTRN.DATREINI desc');

  qryTrein.Open;
  qryTrein.FieldByName('DESCRICAO').DisplayLabel := 'Curso';
  qryTrein.FieldByName('DATPLINI').DisplayLabel := 'Início Plan.';
  qryTrein.FieldByName('DATPLFIM').DisplayLabel := 'Final Plan.';
  qryTrein.FieldByName('DATREINI').DisplayLabel := 'Início Real';
  qryTrein.FieldByName('DATREFIM').DisplayLabel := 'Final Real';
  qryTrein.FieldByName('AVALTEOR').DisplayLabel := 'Aval.Teor.';
  qryTrein.FieldByName('AVALPRAT').DisplayLabel := 'Aval.Prat.';

end;

end.
