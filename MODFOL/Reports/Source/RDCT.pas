// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RDCT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  DBClient, uCMClientDataSet, uCmSqlParams, Db, DBTables, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE,
  ppBands, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, uCmRptManager, TXComp, CmParamReport, TXRB, USistema;

type
  TRptDCT = class(TFrmCmReport)
    rpDCT: TppReport;
    rpDCTDtlBnd: TppDetailBand;
    rpDCTShape3: TppShape;
    rpDCTShape2: TppShape;
    rpDCTLbl1: TppLabel;
    rpDCTShape1: TppShape;
    rpDCTLbl2: TppLabel;
    rpDCTLine1: TppLine;
    rpDCTLine3: TppLine;
    rpDCTLine2: TppLine;
    rpDCTLine4: TppLine;
    rpDCTLine5: TppLine;
    rpDCTLine6: TppLine;
    rpDCTLbl3: TppLabel;
    rpDCTLMemo1: TppMemo;
    rpDCTLMemo2: TppMemo;
    rpDCTLbl4: TppLabel;
    rpDCTLine7: TppLine;
    rpDCTLine8: TppLine;
    rpDCTLine9: TppLine;
    rpDCTLine10: TppLine;
    rpDCTLine11: TppLine;
    rpDCTLine12: TppLine;
    rpDCTLine13: TppLine;
    rpDCTLine14: TppLine;
    rpDCTLine15: TppLine;
    rpDCTLine16: TppLine;
    rpDCTLine17: TppLine;
    rpDCTLine18: TppLine;
    rpDCTLine19: TppLine;
    rpDCTLine20: TppLine;
    rpDCTLine21: TppLine;
    rpDCTLine22: TppLine;
    rpDCTLine23: TppLine;
    rpDCTLine24: TppLine;
    rpDCTLine25: TppLine;
    rpDCTLine26: TppLine;
    rpDCTLine27: TppLine;
    rpDCTLine28: TppLine;
    rpDCTLine29: TppLine;
    rpDCTLine30: TppLine;
    rpDCTLine31: TppLine;
    rpDCTLine32: TppLine;
    rpDCTLine33: TppLine;
    rpDCTLine34: TppLine;
    rpDCTLine35: TppLine;
    rpDCTLine37: TppLine;
    rpDCTLine36: TppLine;
    rpDCTLine38: TppLine;
    rpDCTLine39: TppLine;
    rpDCTLine40: TppLine;
    rpDCTLine58: TppLine;
    rpDCTLine59: TppLine;
    rpDCTLine60: TppLine;
    rpDCTLine41: TppLine;
    rpDCTLine42: TppLine;
    rpDCTLine45: TppLine;
    rpDCTLine44: TppLine;
    rpDCTLine43: TppLine;
    rpDCTLine46: TppLine;
    rpDCTLine47: TppLine;
    rpDCTLine49: TppLine;
    rpDCTLine48: TppLine;
    rpDCTLine50: TppLine;
    rpDCTLine51: TppLine;
    rpDCTLine53: TppLine;
    rpDCTLine52: TppLine;
    rpDCTLine54: TppLine;
    rpDCTLine55: TppLine;
    rpDCTLine57: TppLine;
    rpDCTLine56: TppLine;
    rpDCTLine61: TppLine;
    rpDCTLine62: TppLine;
    rpDCTLine63: TppLine;
    rpDCTShape4: TppShape;
    rpDCTShape5: TppShape;
    rpDCTLine64: TppLine;
    rpDCTLine65: TppLine;
    rpDCTLine70: TppLine;
    rpDCTLine66: TppLine;
    rpDCTLine67: TppLine;
    rpDCTLine68: TppLine;
    rpDCTLine69: TppLine;
    rpDCTLbl5: TppLabel;
    rpDCTLbl6: TppLabel;
    rpDCTLbl7: TppLabel;
    rpDCTLbl8: TppLabel;
    rpDCTLbl9: TppLabel;
    rpDCTLbl10: TppLabel;
    rpDCTLbl11: TppLabel;
    rpDCTLbl12: TppLabel;
    rpDCTLbl13: TppLabel;
    rpDCTLbl14: TppLabel;
    rpDCTLbl15: TppLabel;
    rpDCTLbl16: TppLabel;
    rpDCTLbl17: TppLabel;
    rpDCTLbl18: TppLabel;
    rpDCTLbl19: TppLabel;
    rpDCTLbl20: TppLabel;
    rpDCTLbl21: TppLabel;
    rpDCTLbl22: TppLabel;
    rpDCTLbl23: TppLabel;
    rpDCTLbl24: TppLabel;
    rpDCTLbl25: TppLabel;
    rpDCTLbl30: TppLabel;
    rpDCTLbl31: TppLabel;
    rpDCTLbl32: TppLabel;
    rpDCTLbl33: TppLabel;
    rpDCTLbl34: TppLabel;
    rpDCTLbl27: TppLabel;
    rpDCTLbl28: TppLabel;
    rpDCTLbl29: TppLabel;
    rpDCTLbl26: TppLabel;
    rpDCTDBTxt1: TppDBText;
    rpDCTDBTxt2: TppDBText;
    rpDCTDBTxt3: TppDBText;
    rpDCTDBTxt4: TppDBText;
    rpDCTDBTxt5: TppDBText;
    rpDCTDBTxt7: TppDBText;
    rpDCTDBTxt8: TppDBText;
    rpDCTDBTxt9: TppDBText;
    rpDCTDBTxt10: TppDBText;
    rpDCTDBTxt11: TppDBText;
    rpDCTDBTxt12: TppDBText;
    rpDCTDBTxt13: TppDBText;
    rpDCTDBTxt14: TppDBText;
    rpDCTDBTxt15: TppDBText;
    rpDCTDBTxt16: TppDBText;
    rpDCTDBTxt17: TppDBText;
    rpDCTDBTxt18: TppDBText;
    rpDCTDBTxt19: TppDBText;
    rpDCTDBTxt20: TppDBText;
    rpDCTDBTxt21: TppDBText;
    rpDCTDBTxt22: TppDBText;
    rpDCTDBTxt23: TppDBText;
    rpDCTDBTxt24: TppDBText;
    rpDCTDBTxt25: TppDBText;
    rpDCTDBTxt26: TppDBText;
    rpDCTDBTxt27: TppDBText;
    rpDCTDBTxt6: TppDBText;
    rpDCTDBTxt28: TppDBText;
    rpDCTDBTxtCarimboCNPJ: TppDBText;
    rpDCTDBTxtCarimboEmpresa: TppDBText;
    rpDCTDBTxtCarimboEndereco: TppDBText;
    rpDCTSmryBnd: TppSummaryBand;
    ppDCT: TppBDEPipeline;
    dsDCT: TwwDataSource;
    sqlDCT: TCMSqlParams;
    CdsDCT: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpDCTSmryBndAfterPrint(Sender: TObject);
    procedure CdsDCTAfterScroll(DataSet: TDataSet);
  private
    procedure GerarDadosRelat;
  end;

var
  RptDCT: TRptDCT;

implementation

uses uCtrlFuncoesRH, fAguarde, dCds;

{$R *.DFM}

procedure TRptDCT.CrmRptCMBeforePrint(Sender: TObject);
var
  c: byte;
  DocID: array [1..4] of string;
  DocMasc: array [1..5] of string;
begin
  inherited;
  for c:=1 to 4 do
    DocID[c] := '0';
  for c:=1 to 5 do
    DocMasc[c] := '';

  // Documentos
  with (dmCds.sql) do
  begin
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO, TDP.MASCARA');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''CTPS:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CPF:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CGC:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''TITULO:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''RG:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
  end;

  with (dmCds.Cds) do
  begin
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'CTPS:') then
      begin
        DocID[1] := FieldByName('IDDOCUMENTO').asString;
        DocMasc[1] := FieldByName('MASCARA').asString;
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'RG:') then
      begin
        DocID[2] := FieldByName('IDDOCUMENTO').asString;
        DocMasc[2] := FieldByName('MASCARA').asString;
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'TITULO:') then
      begin
        DocID[3] := FieldByName('IDDOCUMENTO').asString;
        DocMasc[3] := FieldByName('MASCARA').asString;
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'PIS/PASEP:') then
        DocID[4] := FloatToStr(FieldByName('IDDOCUMENTO').asFloat)
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'CPF:') then
        DocMasc[4] := FieldByName('MASCARA').asString
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'CNPJ:') or
         (FieldByName('SIGLADOCUMENTO').asString = 'CGC:') then
        DocMasc[5] := FieldByName('MASCARA').asString;
      Next;
    end;
  end;

  for c:=1 to 5 do
    if (DocMasc[c] <> '') then
      DocMasc[c] := DocMasc[c] + ';0; ';

  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  PJ.NUMDOCUMENTO AS CNPJ,');
    Add('  RTRIM(EJ.LOGRADOURO) ||'', ''|| EJ.NUMERO ||');
    Add('    DECODE(RTRIM(EJ.COMPLEMENTO),NULL,'''','' - '' || RTRIM(EJ.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(EJ.BAIRRO),     NULL,'''','' - '' || RTRIM(EJ.BAIRRO)) ||');
    Add('    DECODE(RTRIM(CIJ.NOME),      NULL,'''','' - '' || RTRIM(CIJ.NOME)) ||');
    Add('    '' - CEP: '' || RTRIM(SUBSTR(EJ.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(EJ.CEP,6,3)) AS END_EMPRESA,');
    Add('  TEL.NUMERO AS TELEFONE,');
    Add('  FAX.NUMERO AS FAX,');
    Add('  PF.NOME AS EMPREGADO,');
    Add('  TO_CHAR(PEFIS.DATANASC,''DD/MM/YYYY'') AS DATANASC,');
    Add('  PEFIS.SEXO,');
    Add('  PEFIS.NOMEMAE,');
    Add('  CIFN.NOME AS CIDADE_NASC,');
    Add('  PEFIS.CODESTADO AS UF_NASC,');
    Add('  PAIS.CODRECEITAFEDERAL AS COD_NACI,');
    Add('  CTPS.NUM AS CTPS_NUM,');
    Add('  CTPS.CODESTADO AS CTPS_UF,');
    Add('  PF.NUMDOCUMENTO AS CPF_NUM,');
    Add('  RG.NUM AS RG_NUM,');
    Add('  RG.ORGAO AS RG_EMISSOR,');
    Add('  TITULO.NUM AS TITULO_NUM,');
    Add('  (EF.LOGRADOURO ||'', ''|| EF.NUMERO) AS LOGRADOURO,');
    Add('  EF.BAIRRO,');
    Add('  CIF.NOME AS CIDADE,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(SUBSTR(EF.CEP,1,5)) AS CEP1,');
    Add('  RTRIM(SUBSTR(EF.CEP,6,3)) AS CEP2');
    Add('FROM');
    // -------------------------------------------------------------------------- //
    Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS EF, ENDPESS EJ, FUNCIONARIO F,');
    Add('  ESTADO ES, CIDADES CIFN, CIDADES CIF, CIDADES CIJ, PAIS,');
    // -------------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO');
    Add('   FROM   DOCPESSOA DP, ESTADO ES');
    if(CmpRptCM.ParamByName('CodFuncSel').asString <> '') then
    begin
      if(Pos(',',CmpRptCM.ParamByName('CodFuncSel').asString) > 0) then
        Add('   WHERE (IDPESSOA       IN ('+CmpRptCM.ParamByName('CodFuncSel').asString+')) AND')
      else
        Add('   WHERE (IDPESSOA       = '+CmpRptCM.ParamByName('CodFuncSel').asString+') AND');
      Add('         (DP.IDDOCUMENTO = ' +DocID[1]+ ') AND');
    end
    else
      Add('   WHERE (DP.IDDOCUMENTO = ' +DocID[1]+ ') AND');
    Add('         (DP.IDPAIS      = ES.IDPAIS) AND');
    Add('         (DP.IDESTADO    = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------------- //
    // RG do Funcionário
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM, ORGAO');
    Add('   FROM   DOCPESSOA');              
    if(CmpRptCM.ParamByName('CodFuncSel').asString <> '') then
    begin
      if(Pos(',',CmpRptCM.ParamByName('CodFuncSel').asString) > 0) then
        Add('   WHERE (IDPESSOA   IN ('+CmpRptCM.ParamByName('CodFuncSel').asString+')) AND')
      else
        Add('   WHERE (IDPESSOA    = '+CmpRptCM.ParamByName('CodFuncSel').asString+') AND');
      Add('         (IDDOCUMENTO = ' +DocID[2]+ ')) RG,');
    end
    else
      Add('   WHERE (IDDOCUMENTO = ' +DocID[2]+ ')) RG,');
    // -------------------------------------------------------------------------- //
    // Título de Eleitor do Funcionário
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    if(CmpRptCM.ParamByName('CodFuncSel').asString <> '') then
    begin
      if(Pos(',',CmpRptCM.ParamByName('CodFuncSel').asString) > 0) then
        Add('   WHERE (IDPESSOA   IN ('+CmpRptCM.ParamByName('CodFuncSel').asString+')) AND')
      else
        Add('   WHERE (IDPESSOA    = '+CmpRptCM.ParamByName('CodFuncSel').asString+') AND');
      Add('         (IDDOCUMENTO = ' +DocID[3]+ ')) TITULO,');
    end
    else
      Add('   WHERE (IDDOCUMENTO = ' +DocID[3]+ ')) TITULO,');
    // -------------------------------------------------------------------------- //
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) END');
    Add('   WHERE');
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TEL,');
    // -------------------------------------------------------------------------- //
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      WHERE    (TIPO LIKE ''%F%'')');
    Add('      GROUP BY IDENDERECO) END');
    Add('   WHERE');
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) FAX');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    if(CmpRptCM.ParamByName('CodFuncSel').asString <> '') then
    begin
      if(Pos(',',CmpRptCM.ParamByName('CodFuncSel').asString) > 0) then
        Add('  (PF.IDPESSOA        IN ('+CmpRptCM.ParamByName('CodFuncSel').asString+')) AND')
      else
        Add('  (PF.IDPESSOA         = '+CmpRptCM.ParamByName('CodFuncSel').asString+') AND');
    end
    else
    if (CmpRptCM.ParamByName('SelSemPIS').asInteger = 0) then
      Add('  (PF.IDPESSOA    NOT IN (SELECT IDPESSOA FROM DOCPESSOA WHERE IDDOCUMENTO = '+
        DocID[4]+ ')) AND');

    if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
        Add('  (F.TIPOCONTRATO     IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO      = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');

    Add('  (PF.IDPESSOA         = F.IDPESSOA) AND');
    Add('  (PF.IDPESSOA         = PEFIS.IDPESSOA) AND');
    Add('  (PEFIS.IDPAIS        = PAIS.IDPAIS) AND');
    Add('  (F.IDESTAB           = PJ.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL   = EJ.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA         = EJ.IDPESSOA) AND');
    Add('  (EJ.IDCIDADES        = CIJ.IDCIDADES) AND');
    Add('  (PF.IDENDRESIDENCIAL = EF.IDENDERECO) AND');
    Add('  (PF.IDPESSOA         = EF.IDPESSOA) AND');
    Add('  (EF.IDCIDADES        = CIF.IDCIDADES) AND');
    Add('  (CIF.IDESTADO        = ES.IDESTADO) AND');
    Add('  (PEFIS.IDCIDADES     = CIFN.IDCIDADES(+)) AND');
    Add('  (PF.IDPESSOA         = CTPS.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA         = RG.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA         = TITULO.IDPESSOA(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL   = TEL.IDENDERECO(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL   = FAX.IDENDERECO(+))');
    Add('ORDER BY');
    Add('  EMPREGADO');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  rpDCTDBTxt13.DisplayFormat := DocMasc[1];
  rpDCTDBTxt18.DisplayFormat := DocMasc[2];
  rpDCTDBTxt20.DisplayFormat := DocMasc[3];
  rpDCTDBTxt16.DisplayFormat := DocMasc[4];
  rpDCTDBTxt1.DisplayFormat := DocMasc[5];
  rpDCTDBTxtCarimboCNPJ.DisplayFormat := DocMasc[5];
  rpDCTDBTxtCarimboCNPJ.Visible := CmpRptCM.ParamByName('ImprimeCarimbo').asBoolean;
  rpDCTDBTxtCarimboEmpresa.Visible := CmpRptCM.ParamByName('ImprimeCarimbo').asBoolean;
  rpDCTDBTxtCarimboEndereco.Visible := CmpRptCM.ParamByName('ImprimeCarimbo').asBoolean;

  GerarDadosRelat;

  frmAguarde.Max := CdsDCT.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptDCT.CdsDCTAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptDCT.rpDCTSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptDCT.GerarDadosRelat;
var
  c: byte;
  sAux: string;
begin
  dmCds.sql.Open;
  sqlDCT.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    while not(dmCds.Cds.EOF) do
    begin
      for c:=1 to 2 do
      begin
        CdsDCT.Insert;
        CdsDCT.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
        CdsDCT.FieldByName('CNPJ').asString := dmCds.Cds.FieldByName('CNPJ').asString;
        CdsDCT.FieldByName('END_EMPRESA').asString := dmCds.Cds.FieldByName('END_EMPRESA').asString;
        CdsDCT.FieldByName('TELEFONE').asString := dmCds.Cds.FieldByName('TELEFONE').asString;
        CdsDCT.FieldByName('FAX').asString := dmCds.Cds.FieldByName('FAX').asString;
        CdsDCT.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
        CdsDCT.FieldByName('DATANASC').asString := dmCds.Cds.FieldByName('DATANASC').asString;
        CdsDCT.FieldByName('SEXO').asString := dmCds.Cds.FieldByName('SEXO').asString;
        CdsDCT.FieldByName('NOMEMAE').asString := dmCds.Cds.FieldByName('NOMEMAE').asString;
        CdsDCT.FieldByName('CIDADE_NASC').asString := dmCds.Cds.FieldByName('CIDADE_NASC').asString;
        CdsDCT.FieldByName('UF_NASC').asString := dmCds.Cds.FieldByName('UF_NASC').asString;
        CdsDCT.FieldByName('COD_NACI').asString := dmCds.Cds.FieldByName('COD_NACI').asString;

        sAux := dmCds.Cds.FieldByName('CTPS_NUM').asString;
        if (sAux <> '') then
        begin
          CdsDCT.FieldByName('CTPS_NUM').asString := FU.Replicate('0',
            Abs(7-Length(Copy(sAux,1,7))))+Copy(sAux,1,7);
          CdsDCT.FieldByName('CTPS_SERIE').asString := FU.Replicate('0',
            Abs(5-Length(Copy(sAux,8,5))))+Copy(sAux,8,5);
          CdsDCT.FieldByName('CTPS_UF').asString := dmCds.Cds.FieldByName('CTPS_UF').asString;
        end
        else
        begin
          CdsDCT.FieldByName('CTPS_NUM').asString := '';
          CdsDCT.FieldByName('CTPS_SERIE').asString := '';
          CdsDCT.FieldByName('CTPS_UF').asString := '';
        end;

        sAux := dmCds.Cds.FieldByName('CPF_NUM').asString;
        if (sAux <> '') then
        begin
          CdsDCT.FieldByName('CPF_NUM').asString := FU.Replicate('0',Abs(
            9-Length(Copy(sAux,1,9))))+Copy(sAux,1,9);
          CdsDCT.FieldByName('CPF_CONTR').asString := FU.Replicate('0',Abs(
            2-Length(Copy(sAux,10,2))))+Copy(sAux,10,2);
        end
        else
        begin
          CdsDCT.FieldByName('CPF_NUM').asString := '';
          CdsDCT.FieldByName('CPF_CONTR').asString := '';
        end;

        if (dmCds.Cds.FieldByName('RG_NUM').asString <> '') then
        begin
          CdsDCT.FieldByName('RG_NUM').asString := dmCds.Cds.FieldByName('RG_NUM').asString;
          CdsDCT.FieldByName('RG_EMISSOR').asString := dmCds.Cds.FieldByName('RG_EMISSOR').asString;
        end
        else
        begin
          CdsDCT.FieldByName('RG_NUM').asString := '';
          CdsDCT.FieldByName('RG_EMISSOR').asString := '';
        end;

        sAux := dmCds.Cds.FieldByName('TITULO_NUM').asString;
        if (sAux <> '') then
        begin
          CdsDCT.FieldByName('TITULO_NUM').asString := FU.Replicate('0',Abs(
            9-Length(Copy(sAux,1,9))))+Copy(sAux,1,9);
          CdsDCT.FieldByName('TITULO_DV').asString := FU.Replicate('0',Abs(
            2-Length(Copy(sAux,10,2))))+Copy(sAux,10,2);
        end
        else
        begin
          CdsDCT.FieldByName('TITULO_NUM').asString := '';
          CdsDCT.FieldByName('TITULO_DV').asString := '';
        end;

        CdsDCT.FieldByName('LOGRADOURO').asString := dmCds.Cds.FieldByName('LOGRADOURO').asString;
        CdsDCT.FieldByName('BAIRRO').asString := dmCds.Cds.FieldByName('BAIRRO').asString;
        CdsDCT.FieldByName('CIDADE').asString := dmCds.Cds.FieldByName('CIDADE').asString;
        CdsDCT.FieldByName('UF').asString := dmCds.Cds.FieldByName('UF').asString;
        CdsDCT.FieldByName('CEP1').asString := dmCds.Cds.FieldByName('CEP1').asString;
        CdsDCT.FieldByName('CEP2').asString := dmCds.Cds.FieldByName('CEP2').asString;

        if (c = 1) then
          CdsDCT.FieldByName('VIA_DCT').asString := '1ª Via da Agência'
        else
          CdsDCT.FieldByName('VIA_DCT').asString := '2ª Via do Empregador';

        CdsDCT.Post;
      end;
      dmCds.Cds.Next;
    end;
  end
  else
  begin
    CdsDCT.Insert;
    CdsDCT.Post;
  end;
  CdsDCT.First;
end;

end.
