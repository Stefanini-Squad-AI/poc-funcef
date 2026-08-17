// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RQuadroHoraTrab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, IvDictio, IvMulti,  TXRB, Usistema;

type
  TRptQuadroHoraTrab = class(TFrmCmReport)
    rpQuadroHoraTrab: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel25: TppLabel;
    ppDBText42: TppDBText;
    ppDBTextCGC: TppDBText;
    ppDBTextEstMun: TppDBText;
    ppDBTextEnder: TppDBText;
    ppLabel26: TppLabel;
    ppCalc3: TppCalc;
    ppLabel27: TppLabel;
    ppCalc4: TppCalc;
    ppLabel55: TppLabel;
    ppDBText48: TppDBText;
    ppDetailBand9: TppDetailBand;
    ppFooterBand9: TppFooterBand;
    ppLabel59: TppLabel;
    rpQuadroHoraTrabDBText12: TppDBText;
    rpQuadroHoraTrabDBText13: TppDBText;
    rpQuadroHoraTrabDBText14: TppDBText;
    rpQuadroHoraTrabDBText15: TppDBText;
    ppLine9: TppLine;
    ppQuadroHoraTrab: TppDBPipeLine;
    dsQuadroHoraTrab: TwwDataSource;
    sqlQuadroHoraTrab: TCMSqlParams;
    CdsQuadroHoraTrab: TCMClientDataSet;
    rpQuadroHoraTrabSmryBnd: TppSummaryBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel9: TppLabel;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel8: TppLabel;
    ppLine3: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    rpQuadroHoraTrabLblData: TppLabel;
    CdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsQuadroHoraTrabAfterScroll(DataSet: TDataSet);
    procedure rpQuadroHoraTrabSmryBndAfterPrint(Sender: TObject);
  private
    procedure GerarDadosDescansoSemanal;
  end;

var
  RptQuadroHoraTrab: TRptQuadroHoraTrab;

implementation

uses uCtrlFuncoesRH, fAguarde, uCtrlPadroes, uCtrlAssociaHorario, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptQuadroHoraTrab.CrmRptCMBeforePrint(Sender: TObject);
var
  DocID: array [1..3] of integer;
begin
  inherited;
  DocID[1] := 0;
  DocID[2] := 0;
  DocID[3] := 0;

  // Documentos
  with (sqlAux) do
  begin
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO, TDP.MASCARA');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''ESTADUAL:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CTPS:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
  end;

  with (CdsAux) do
  begin
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'ESTADUAL:') then
        DocID[1] := FieldByName('IDDOCUMENTO').asInteger
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'MUNICIPAL:') then
        DocID[2] := FieldByName('IDDOCUMENTO').asInteger
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'CTPS:') then
        DocID[3] := FieldByName('IDDOCUMENTO').asInteger;
      Next;
    end;
  end;

  with (sqlQuadroHoraTrab.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    // Dados do Estabelecimento
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  (CASE');
    Add('     WHEN PJ.NUMDOCUMENTO IS NULL THEN ''''');
    Add('     ELSE ''CNPJ: '' || PJ.NUMDOCUMENTO');
    Add('   END) AS CNPJ,');
    Add('  RTRIM(CASE');
    Add('          WHEN ESTADUAL.NUMDOCUMENTO IS NULL THEN');
    Add('            (CASE');
    Add('               WHEN MUNICIPAL.NUMDOCUMENTO IS NULL THEN ''''');
    Add('               ELSE ' +QuotedStr(FU.CMTranslate('Inscrição Municipal: '))+ ' || MUNICIPAL.NUMDOCUMENTO');
    Add('             END)');
    Add('          ELSE ' +QuotedStr(FU.CMTranslate('Inscrição Estadual: '))+ ' || ESTADUAL.NUMDOCUMENTO');
    Add('        END) AS ESTADUALMUNICIPAL,');
    Add('  (');
    Add('    RTRIM(E.LOGRADOURO) ||');
    Add('    (CASE');
    Add('       WHEN E.NUMERO IS NULL THEN ''''');
    Add('       ELSE '', ''|| TO_CHAR(E.NUMERO)');
    Add('     END) ||');
    Add('    (CASE');
    Add('       WHEN E.COMPLEMENTO IS NULL THEN ''''');
    Add('       ELSE '' - '' || RTRIM(E.COMPLEMENTO)');
    Add('     END) ||');
    Add('    (CASE');
    Add('       WHEN E.BAIRRO IS NULL THEN ''''');
    Add('       ELSE '' - '' || RTRIM(E.BAIRRO)');
    Add('     END) ||');
    Add('    (CASE');
    Add('       WHEN CI.NOME IS NULL THEN ''''');
    Add('       ELSE '' - '' || RTRIM(CI.NOME)');
    Add('     END) ||');
    Add('    (CASE');
    Add('       WHEN E.CEP IS NULL THEN ''''');
    Add('       ELSE '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3))');
    Add('     END)');
    Add('  ) AS ENDERECO,');
    Add('  CI.NOME AS CIDADE,');
    Add('  ES.CODESTADO AS UF,');
    Add('  ICNAE.DESCRICAO AS ATIVIDADE_EMPRESARIAL,');
    // Dados do Funcionário
    Add('  F.MATRICULA,');
    Add('  UPPER(PF.NOME) AS EMPREGADO,');
    Add('  RTRIM(C.TITULO) AS CARGO,');
    Add('  CTPS.NUM AS CTPS,');
    Add('  HT.IDHORARIO,');
    Add('  HT.NOMEHORARIO AS HORARIO,');
    Add('  LPAD(''1'',30,''1'') AS DESCANSO_SEMANAL');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F, CIDADES CI, SITFUNC SF,');
    Add('  FILIALPESSOA FP, ESTADO ES, CARGO C, HORATRAB HT, ITEMCNAE ICNAE,');
    // ------------------------------------------------------------------------------- //
    // Inscrição Estadual
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = ' +IntToStr(DocID[1])+ ')) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = ' +IntToStr(DocID[2])+ ')) MUNICIPAL,');
    // -------------------------------------------------------------------- //
    // CTPS do Empregado
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = ' +IntToStr(DocID[3])+ ')) CTPS');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add(FU.MontaLinhaSelSQL('  (F.IDPESSOA', CmpRptCM.ParamByName('ListaIdFunc').asString, 7));

    // Não faz o JOIN com a situação funcional pois assim fica mais lento
    //    Add('  (F.IDSITFUNC       = SF.IDSITFUNC) AND');

    Add('  (F.IDESTAB         = FP.IDFILIALPESSOA) AND');
    Add('  (F.IDCARGO         = C.IDCARGO) AND');
    Add('  (F.IDHORARIO       = HT.IDHORARIO) AND');
    Add('  (F.IDPESSOA        = CTPS.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (FP.IDFILIALPESSOA = PJ.IDPESSOA) AND');
    Add('  (FP.IDITEMCNAE     = ICNAE.IDITEMCNAE) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO(+)) AND');
    Add('  (E.IDCIDADES       = CI.IDCIDADES(+)) AND');
    Add('  (CI.IDESTADO       = ES.IDESTADO(+)) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  EMPRESA, EMPREGADO');
      1 : Add('  EMPRESA, MATRICULA');
      2 : Add('  EMPRESA, CARGO, EMPREGADO');
      3 : Add('  EMPRESA, CARGO, MATRICULA');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  GerarDadosDescansoSemanal;

  rpQuadroHoraTrabLblData.Caption := CdsQuadroHoraTrab.FieldByName('CIDADE').asString +
    '  ' + IntToStr(FU.ExtraiDia(Date)) +', '+
    FU.MesExtensoAno(IntToStr(FU.ExtraiAno(Date)) +'/'+ FU.PoeZero(FU.ExtraiMes(Date)));

  frmAguarde.Max := CdsQuadroHoraTrab.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptQuadroHoraTrab.CdsQuadroHoraTrabAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptQuadroHoraTrab.rpQuadroHoraTrabSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptQuadroHoraTrab.GerarDadosDescansoSemanal;
var
  CtrlAssociaHorario: TCtrlAssociaHorario;

{-->}procedure AdicionarListaStr(var Str: string; Valor: string);
     begin
       if (Str = '') then
         Str := Valor
       else
         Str := Str +'/'+ Valor;
{-->}end;

{-->}function GetDescansoSemanal(IdHorario: integer): string;
     begin
       CdsAux.Data := CtrlAssociaHorario.ListTurnoDiaSel(IdHorario);
       Result := '';
       if not(CdsAux.IsEmpty) then
       begin
         if not(CdsAux.Locate('IDDIASEMANA',7,[])) then
           AdicionarListaStr(Result, FU.CMTranslate('Sab.'));

         if not(CdsAux.Locate('IDDIASEMANA',1,[])) then
           AdicionarListaStr(Result, FU.CMTranslate('Dom.'));

         if not(CdsAux.Locate('IDDIASEMANA',2,[])) then
           AdicionarListaStr(Result, FU.CMTranslate('Seg.'));

         if not(CdsAux.Locate('IDDIASEMANA',3,[])) then
           AdicionarListaStr(Result, FU.CMTranslate('Ter.'));

         if not(CdsAux.Locate('IDDIASEMANA',4,[])) then
           AdicionarListaStr(Result, FU.CMTranslate('Qua.'));

         if not(CdsAux.Locate('IDDIASEMANA',5,[])) then
           AdicionarListaStr(Result,FU.CMTranslate('Qui.'));

         if not(CdsAux.Locate('IDDIASEMANA',6,[])) then
           AdicionarListaStr(Result, FU.CMTranslate('Sex.'));
       end;
{-->}end;
begin
  sqlQuadroHoraTrab.Open;
  if not(CdsQuadroHoraTrab.IsEmpty) then
  begin
    CtrlAssociaHorario := TCtrlAssociaHorario.Create;
    CtrlAssociaHorario.InitializeAs(Padroes);
    try
      while not(CdsQuadroHoraTrab.EOF) do
      begin
        CdsQuadroHoraTrab.Edit;
        CdsQuadroHoraTrab.FieldByName('DESCANSO_SEMANAL').asString := GetDescansoSemanal(
          CdsQuadroHoraTrab.FieldByName('IDHORARIO').asInteger);
        CdsQuadroHoraTrab.Post;

        CdsQuadroHoraTrab.Next;
      end;
    finally
      FreeAndNil(CtrlAssociaHorario);
    end;
  end
  else
  begin
    CdsQuadroHoraTrab.Insert;
    CdsQuadroHoraTrab.Post;
  end;

  CdsQuadroHoraTrab.First;
end;

end.
