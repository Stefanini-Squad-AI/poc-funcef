// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RCAT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db, DBClient, uCMClientDataSet,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands,
  ppCache, ppCtrls, ppPrnabl, ppStrtch, ppMemo, TXRB, USistema;

type
  TRptCAT = class(TFrmCmReport)
    rpCAT: TppReport;
    ppCAT: TppBDEPipeline;
    dsCAT: TwwDataSource;
    CdsCAT: TCMClientDataSet;
    sqlCAT: TCMSqlParams;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppShape1: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppShape3: TppShape;
    ppLabel8: TppLabel;
    rpCATlblTipoCAT: TppLabel;
    ppLabel11: TppLabel;
    ppImage1: TppImage;
    ppShape6: TppShape;
    ppLabel9: TppLabel;
    ppShape7: TppShape;
    ppLabel10: TppLabel;
    ppShape8: TppShape;
    ppLabel12: TppLabel;
    ppDBText1: TppDBText;
    ppShape10: TppShape;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText2: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppShape15: TppShape;
    ppLabel17: TppLabel;
    ppDBText5: TppDBText;
    ppLabel18: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel19: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel20: TppLabel;
    ppLine5: TppLine;
    ppLabel21: TppLabel;
    ppDBText9: TppDBText;
    ppLine6: TppLine;
    ppLabel22: TppLabel;
    ppDBText10: TppDBText;
    ppLine7: TppLine;
    ppLabel23: TppLabel;
    ppDBText11: TppDBText;
    ppShape22: TppShape;
    ppLabel24: TppLabel;
    ppShape23: TppShape;
    ppLabel25: TppLabel;
    ppDBText12: TppDBText;
    ppShape25: TppShape;
    ppLabel26: TppLabel;
    ppDBText13: TppDBText;
    ppShape27: TppShape;
    ppLabel27: TppLabel;
    ppDBText14: TppDBText;
    ppLabel28: TppLabel;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLabel29: TppLabel;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLine10: TppLine;
    ppLabel30: TppLabel;
    ppDBText18: TppDBText;
    ppLine11: TppLine;
    ppLabel31: TppLabel;
    ppDBText19: TppDBText;
    ppLine12: TppLine;
    ppLabel32: TppLabel;
    ppDBText20: TppDBText;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppDBText15: TppDBText;
    ppShape34: TppShape;
    ppLabel36: TppLabel;
    ppDBText21: TppDBText;
    ppLabel37: TppLabel;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppDBText24: TppDBText;
    ppLabel39: TppLabel;
    ppDBText25: TppDBText;
    ppLine16: TppLine;
    ppLabel40: TppLabel;
    ppDBText26: TppDBText;
    ppLine17: TppLine;
    ppLabel41: TppLabel;
    ppDBText27: TppDBText;
    ppDBText23: TppDBText;
    ppShape37: TppShape;
    ppLabel44: TppLabel;
    ppDBText30: TppDBText;
    ppShape45: TppShape;
    ppLabel46: TppLabel;
    ppLine20: TppLine;
    ppLabel47: TppLabel;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppLine21: TppLine;
    ppLabel49: TppLabel;
    ppDBText35: TppDBText;
    ppLine22: TppLine;
    ppLabel50: TppLabel;
    ppDBText36: TppDBText;
    ppLine23: TppLine;
    ppLabel51: TppLabel;
    ppDBText37: TppDBText;
    ppShape41: TppShape;
    ppLabel38: TppLabel;
    ppLine15: TppLine;
    ppLabel42: TppLabel;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppLine18: TppLine;
    ppLabel43: TppLabel;
    ppLine19: TppLine;
    ppLabel45: TppLabel;
    ppLine24: TppLine;
    ppLabel48: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppShape54: TppShape;
    ppLabel60: TppLabel;
    ppShape55: TppShape;
    ppLabel61: TppLabel;
    ppLine25: TppLine;
    ppLabel62: TppLabel;
    ppLine26: TppLine;
    ppLabel63: TppLabel;
    ppLine27: TppLine;
    ppLabel64: TppLabel;
    ppLine28: TppLine;
    ppLabel65: TppLabel;
    rpCATlblDataAcid: TppLabel;
    rpCATlblHoraAcid: TppLabel;
    rpCATlblAposAcid: TppLabel;
    rpCATlblTipoAcid: TppLabel;
    ppLabel66: TppLabel;
    rpCATlblHouveAfast: TppLabel;
    ppLabel68: TppLabel;
    ppShape61: TppShape;
    ppLabel67: TppLabel;
    ppLine29: TppLine;
    ppLabel69: TppLabel;
    ppLine30: TppLine;
    ppLabel70: TppLabel;
    ppLine31: TppLine;
    ppLabel71: TppLabel;
    ppLine32: TppLine;
    ppLabel72: TppLabel;
    rpCATlblUltData: TppLabel;
    rpCATlblLocalAcid: TppLabel;
    rpCATlblEspecLocal: TppLabel;
    rpCATlblLocalCNPJ: TppLabel;
    rpCATlblUFLocal: TppLabel;
    ppShape67: TppShape;
    ppLabel73: TppLabel;
    ppLine33: TppLine;
    ppLabel74: TppLabel;
    ppLine34: TppLine;
    ppLabel75: TppLabel;
    rpCATlblMunicLocal: TppLabel;
    rpCATlblParteCorpo: TppLabel;
    rpCATlblAgente: TppLabel;
    ppShape71: TppShape;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLabel76: TppLabel;
    rpCATlblHouveRegPol: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    rpCATlblHouveMorte: TppLabel;
    ppLabel81: TppLabel;
    ppLabel77: TppLabel;
    rpCATmemSituacao: TppMemo;
    ppShape74: TppShape;
    ppLabel80: TppLabel;
    ppShape75: TppShape;
    ppLabel82: TppLabel;
    rpCATlblNomeTest1: TppLabel;
    ppShape77: TppShape;
    ppLabel83: TppLabel;
    ppShape79: TppShape;
    ppLabel84: TppLabel;
    ppLine37: TppLine;
    ppLabel85: TppLabel;
    ppLine38: TppLine;
    ppLabel86: TppLabel;
    ppLine39: TppLine;
    ppLabel87: TppLabel;
    ppLine40: TppLine;
    ppLabel88: TppLabel;
    rpCATlblEnderTest1: TppLabel;
    rpCATlblBairroTest1: TppLabel;
    rpCATlblCEPTest1: TppLabel;
    rpCATlblMunicTest1: TppLabel;
    rpCATlblUFTest1: TppLabel;
    rpCATlblTelefTest1: TppLabel;
    ppShape85: TppShape;
    ppLabel89: TppLabel;
    rpCATlblNomeTest2: TppLabel;
    ppShape87: TppShape;
    ppLabel91: TppLabel;
    ppShape89: TppShape;
    ppLabel92: TppLabel;
    ppLine41: TppLine;
    ppLabel93: TppLabel;
    ppLine42: TppLine;
    ppLabel94: TppLabel;
    ppLine43: TppLine;
    ppLabel95: TppLabel;
    ppLine44: TppLine;
    ppLabel96: TppLabel;
    rpCATlblEnderTest2: TppLabel;
    rpCATlblBairroTest2: TppLabel;
    rpCATlblCEPTest2: TppLabel;
    rpCATlblMunicTest2: TppLabel;
    rpCATlblUFTest2: TppLabel;
    rpCATlblTelefTest2: TppLabel;
    ppShape95: TppShape;
    ppLabel90: TppLabel;
    ppShape96: TppShape;
    ppLabel97: TppLabel;
    ppShape97: TppShape;
    ppLabel98: TppLabel;
    ppLine45: TppLine;
    ppLabel99: TppLabel;
    ppLine46: TppLine;
    ppLabel100: TppLabel;
    rpCATlblUnidAtend: TppLabel;
    rpCATlblDataAtend: TppLabel;
    rpCATlblHoraAtend: TppLabel;
    ppShape2: TppShape;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLabel54: TppLabel;
    rpCATlblHouveInternacao: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    rpCATlblDiasTrat: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    rpCATlblDeveAfast: TppLabel;
    ppLabel108: TppLabel;
    ppShape4: TppShape;
    ppLabel101: TppLabel;
    ppShape5: TppShape;
    ppLabel104: TppLabel;
    rpCATmemLesao: TppMemo;
    ppShape9: TppShape;
    ppLabel107: TppLabel;
    ppShape11: TppShape;
    ppLabel109: TppLabel;
    rpCATmemDescCID: TppMemo;
    ppLine49: TppLine;
    ppLabel110: TppLabel;
    rpCATlblCID10: TppLabel;
    ppShape12: TppShape;
    ppLabel111: TppLabel;
    rpCATmemObserv: TppMemo;
    ppShape13: TppShape;
    ppLine50: TppLine;
    ppLabel112: TppLabel;
    ppLine51: TppLine;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLine52: TppLine;
    ppLabel116: TppLabel;
    ppShape14: TppShape;
    ppLabel117: TppLabel;
    ppShape16: TppShape;
    ppLine53: TppLine;
    ppLabel118: TppLabel;
    ppLine54: TppLine;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLine55: TppLine;
    ppLabel122: TppLabel;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppShape17: TppShape;
    ppLabel123: TppLabel;
    ppLine59: TppLine;
    ppLabel124: TppLabel;
    ppLine61: TppLine;
    ppShape18: TppShape;
    ppMemo1: TppMemo;
    ppShape19: TppShape;
    ppLabel125: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  public
    sFunc, sTipoOcorr, sNumSeq, sTipoCAT, sDataAcid, sHoraAcid, sAposAcid,
    sTipoAcid, sHouveAfast, sUltData, sLocalAcid, sEspecLocal, sLocalCNPJ,
    sUFLocal, sMunicLocal, sParteCorpo, sAgente, sSituacao, sHouveRegPol,
    sHouveMorte, sNomeTest1, sEnderTest1, sBairroTest1, sCEPTest1, sMunicTest1,
    sUFTest1, sTelefTest1, sNomeTest2, sEnderTest2, sBairroTest2, sCEPTest2,
    sMunicTest2, sUFTest2, sTelefTest2, sUnidAtend, sDataAtend, sHoraAtend,
    sHouveInternacao, sDiasTrat, sDeveAfast, sLesao, sDescCID, sCID10,
    sObserv: string;
  end;

var
  RptCAT: TRptCAT;

implementation

uses fAguarde;

{$R *.DFM}

procedure TRptCAT.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  rpCATlblTipoCAT.Caption := sTipoCAT;
  rpCATlblDataAcid.Caption := sDataAcid;
  rpCATlblHoraAcid.Caption := sHoraAcid;
  rpCATlblAposAcid.Caption := sAposAcid;
  rpCATlblTipoAcid.Caption := sTipoAcid;
  rpCATlblHouveAfast.Caption := sHouveAfast;
  rpCATlblUltData.Caption := sUltData;
  rpCATlblLocalAcid.Caption := sLocalAcid;
  rpCATlblEspecLocal.Caption := sEspecLocal;
  rpCATlblLocalCNPJ.Caption := sLocalCNPJ;
  rpCATlblUFLocal.Caption := sUFLocal;
  rpCATlblMunicLocal.Caption := sMunicLocal;
  rpCATlblParteCorpo.Caption := sParteCorpo;
  rpCATlblAgente.Caption := sAgente;
  rpCATmemSituacao.Text := sSituacao;
  rpCATlblHouveRegPol.Caption:= sHouveRegPol;
  rpCATlblHouveMorte.Caption := sHouveMorte;
  rpCATlblNomeTest1.Caption := sNomeTest1;
  rpCATlblEnderTest1.Caption := sEnderTest1;
  rpCATlblBairroTest1.Caption := sBairroTest1;
  rpCATlblCEPTest1.Caption := sCEPTest1;
  rpCATlblMunicTest1.Caption := sMunicTest1;
  rpCATlblUFTest1.Caption := sUFTest1;
  rpCATlblTelefTest1.Caption := sTelefTest1;
  rpCATlblNomeTest2.Caption := sNomeTest2;
  rpCATlblEnderTest2.Caption := sEnderTest2;
  rpCATlblBairroTest2.Caption := sBairroTest2;
  rpCATlblCEPTest2.Caption := sCEPTest2;
  rpCATlblMunicTest2.Caption := sMunicTest2;
  rpCATlblUFTest2.Caption := sUFTest2;
  rpCATlblTelefTest2.Caption := sTelefTest2;
  rpCATlblUnidAtend.Caption := sUnidAtend;
  rpCATlblDataAtend.Caption := sDataAtend;
  rpCATlblHoraAtend.Caption := sHoraAtend;
  rpCATlblHouveInternacao.Caption := sHouveInternacao;
  rpCATlblDiasTrat.Caption := sDiasTrat;
  rpCATlblDeveAfast.Caption := sDeveAfast;
  rpCATmemLesao.Text := sLesao;
  rpCATmemDescCID.Text := sDescCID;
  rpCATlblCID10.Caption := sCID10;
  rpCATmemObserv.Text := sObserv;

  with (sqlCAT.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO, C.CBO,');
    Add('  PJ.NUMDOCUMENTO AS CNPJ, TELFIL.NUMERO AS TELEFFIL, TELFUN.NUMERO AS TELEFFUN,');
    Add('  CI.NUMCI, CI.ORGCI, CI.UFCI, CI.EMISCI,');
    Add('  CTPS.NUMCTPS, CTPS.UFCTPS, PIS.NUMPIS,');
    Add('  TRIM(EFU.LOGRADOURO) ||'', ''|| TRIM(EFU.NUMERO) || '' '' || ');
    Add('  TRIM(EFU.COMPLEMENTO) AS ENDERFUN, EFU.CEP AS CEPFUN, EFU.CODESTADO AS UFFUN,');
    Add('  TRIM(EFU.BAIRRO) AS BAIRROFUN,  TRIM(CIDADE2.NOME) AS CIDADEFUN,');
    Add('  TRIM(E.LOGRADOURO) ||'', ''|| TRIM(E.NUMERO) AS ENDERFIL,');
    Add('  TRIM(E.COMPLEMENTO) AS COMPLFIL, E.CEP AS CEPFIL, E.CODESTADO AS UFFIL,');
    Add('  TRIM(E.BAIRRO) AS BAIRROFIL,  TRIM(CIDADES.NOME) AS CIDADEFIL,');
    Add('  F.SALARIOATUAL, FP.IDITEMCNAE,');
    Add('  PFIS.NOMEMAE, DECODE(PFIS.SEXO,''M'',''1'',''3'') AS SEXO, PFIS.DATANASC, PFIS.DATAMORTE,');
    Add('  DECODE(PFIS.ESTCIVIL,''S'',''1'',''C'',''2'',''V'',''3'',''J'',''4'',NULL,''6'',''5'') AS ESTCIVIL');
    // -------------------------------------------------------------------------------------
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PFIS, ENDPESS E, ENDPESS EFU, ');
    Add('  FUNCIONARIO F,');
    Add('  CARGO C, CIDADES, CIDADES CIDADE2, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------------------
    Add('  (SELECT');
    Add('     D.IDPESSOA, TRIM(D.NUMDOCUMENTO) AS NUMCI, TRIM(D.ORGAO) AS ORGCI,');
    Add('     TRIM(D.UF) AS UFCI, TO_CHAR(D.DATAEMISSAO,''DD/MM/YYYY'') AS EMISCI');
    Add('   FROM');
    Add('     DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE');
    Add('     (TD.SIGLADOCUMENTO = ''RG:'') AND');
    Add('     (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) CI,');
    // -------------------------------------------------------------------------------------
    Add('  (SELECT');
    Add('     D.IDPESSOA, TRIM(D.NUMDOCUMENTO) AS NUMCTPS, TRIM(D.UF) AS UFCTPS,');
    Add('     TO_CHAR(D.DATAEMISSAO,''DD/MM/YYYY'') AS EMISCTPS');
    Add('   FROM');
    Add('     DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE');
    Add('     (TD.SIGLADOCUMENTO = ''CTPS:'') AND');
    Add('     (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) CTPS,');
    // -------------------------------------------------------------------------------------
    Add('  (SELECT');
    Add('     D.IDPESSOA, TRIM(D.NUMDOCUMENTO) AS NUMPIS');
    Add('   FROM');
    Add('     DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE');
    Add('     (TD.SIGLADOCUMENTO = ''PIS/PASEP:'') AND');
    Add('     (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) PIS,');
    // -------------------------------------------------------------------------------------
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.NUMERO');
    Add('   FROM');
    Add('    TELENDPESS TE,');
    Add('    (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('     FROM     TELENDPESS');
    Add('     GROUP BY IDENDERECO) END');
    Add('     WHERE');
    Add('    (END.IDTELEFONE = TE.IDTELEFONE)) TELFUN,');
    // -------------------------------------------------------------------------------------
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.NUMERO');
    Add('   FROM');
    Add('    TELENDPESS TE,');
    Add('    (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('     FROM     TELENDPESS');
    Add('     GROUP BY IDENDERECO) END');
    Add('     WHERE');
    Add('    (END.IDTELEFONE = TE.IDTELEFONE)) TELFIL');
    // -------------------------------------------------------------------------------------
    Add('WHERE');
    Add('  (F.IDPESSOA         = ' +sFunc+ ') AND');
    Add('  (F.IDPESSOA         = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA         = PFIS.IDPESSOA) AND');
    Add('  (F.IDESTAB          = PJ.IDPESSOA) AND');
    Add('  (F.IDESTAB          = FP.IDFILIALPESSOA) AND');
    Add('  (F.IDCARGO          = C.IDCARGO) AND');
    Add('  (PJ.IDENDCOMERCIAL  = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES        = CIDADES.IDCIDADES) AND');
    Add('  (PJ.IDENDCOMERCIAL  = TELFIL.IDENDERECO(+)) AND');
    Add('  (F.IDPESSOA         = CI.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA         = CTPS.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA         = PIS.IDPESSOA(+)) AND');
    Add('  (PF.IDENDRESIDENCIAL= EFU.IDENDERECO(+)) AND');
    Add('  (PF.IDENDRESIDENCIAL= TELFUN.IDENDERECO(+)) AND');
    Add('  (EFU.IDCIDADES      = CIDADE2.IDCIDADES(+))');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlCAT.Open;
  frmAguarde.Apaga;
end;

end.
