unit frFollowUp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, Wwdbigrd,
  Wwdbgrid, uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc;

type
  TframeFollowUp = class(TFrame)
  private
    FCdsProcesso: TCMClientDataSet;
    FDataEnc1, FDataEnc2, sListaIdReclamanteSel, sListaNumProcSel: string;
  published
    dsFollowUp: TwwDataSource;
    CdsFollowUp: TCMClientDataSet;
    sqlFollowUp: TCMSqlParams;
    dbgdFollowUp: TwwDBGrid;

    procedure CdsFollowUpFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  public
    procedure GerarFollowUp;

    property CdsProcesso: TCMClientDataSet read FCdsProcesso write FCdsProcesso;
    property DataEnc1: string read FDataEnc1 write FDataEnc1;
    property DataEnc2: string read FDataEnc2 write FDataEnc2;
  end;

implementation

uses fAguarde, uCtrlFuncoesRH;

{$R *.DFM}

procedure TframeFollowUp.CdsFollowUpFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  if (frmAguarde.Max = 0) then
  begin
    frmAguarde.Max := CdsFollowUp.RecordCount;
    frmAguarde.Update;
  end;

  Accept :=
    (FU.VerificaCodigoEm(sListaNumProcSel,
     CdsFollowUp.FieldByName('NUMPROCTRAB').asString, ',') = 1) and
    (FU.VerificaCodigoEm(sListaIdReclamanteSel,
     CdsFollowUp.FieldByName('IDRECLAMANTE').asString, ',') = 1);

  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TframeFollowUp.GerarFollowUp;
begin
  sListaIdReclamanteSel := '';
  sListaNumProcSel := '';
  if not(CdsProcesso.IsEmpty) then
  begin
    CdsProcesso.First;
    repeat
      if (sListaNumProcSel = '') then
        sListaNumProcSel := CdsProcesso.FieldByName('NUMPROCTRAB').asString
      else
        sListaNumProcSel := sListaNumProcSel +','+ CdsProcesso.FieldByName('NUMPROCTRAB').asString;

      if (sListaIdReclamanteSel = '') then
        sListaIdReclamanteSel := CdsProcesso.FieldByName('IDPESSOA').asString
      else
        sListaIdReclamanteSel := sListaIdReclamanteSel +','+ CdsProcesso.FieldByName('IDPESSOA').asString;

      CdsProcesso.Next;
    until (CdsProcesso.EOF);
  end;

  with (sqlFollowUp.SQL) do
  begin
    Clear;
    Add('SELECT' +FU.IFF(sListaNumProcSel='', ' /*+ OPTIMIZER_MODE RULE */', ''));
    Add('  EP.NUMPROCTRAB, EP.NUMSEQ, EP.DATAPREVOCORR,');
    Add('  EP.DATAREALOCOR, EP.ASSUNTO, TR.DESCRICAO, PT.IDRECLAMANTE, P.NOME');
    Add('FROM');
    Add('  PESSOA P, ETAPAPROCTRAB EP, PROCESSOTRAB PT, TIPORECTRAB TR');
    Add('WHERE');

    if (sListaNumProcSel = '') then
      Add('  (EP.NUMPROCTRAB    = -1) AND')
    else
    begin
      if (DataEnc1 <> '') then
        Add('  (EP.DATAREALOCOR  >= TO_DATE(' +QuotedStr(DataEnc1)+ ',''DD/MM/YYYY'')) AND');
      if (DataEnc2 <> '') then
        Add('  (EP.DATAREALOCOR  <= TO_DATE(' +QuotedStr(DataEnc2)+ ',''DD/MM/YYYY'')) AND');
    end;

    Add('  (EP.CODTIPORECURSO = TR.CODTIPORECURSO) AND');
    Add('  (EP.NUMPROCTRAB    = PT.NUMPROCTRAB) AND');
    Add('  (PT.IDRECLAMANTE   = P.IDPESSOA)');
    Add('ORDER BY');
    Add('  EP.NUMPROCTRAB, EP.DATAREALOCOR');
    sqlFollowUp.Open;
  end;
end;

end.
