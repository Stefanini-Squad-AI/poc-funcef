// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RPCMSO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppDB,
  ppDBPipe, ppDBBDE, Wwdatsrc, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppPrnabl,
  ppBands, ppCache, ppMemo, ppStrtch, ppRegion, ppVar, uCtrlListTerceirosRH, uCtrlPadroes,
  TXRB;

type
  TRptPCMSO = class(TFrmCmReport)
    rpPCMSO: TppReport;
    dsPCMSO: TwwDataSource;
    ppPCMSO: TppBDEPipeline;
    sqlPCMSO: TCMSqlParams;
    CdsPCMSO: TCMClientDataSet;
    rpPCMSOlbl1: TppLabel;
    rpPCMSODBTxt1: TppDBText;
    rpPCMSOSysVar1: TppSystemVariable;
    rpPCMSORegiaoCand: TppRegion;
    rpPCMSORegiaoAval: TppRegion;
    rpPCMSODBAval: TppDBText;
    rpPCMSORegiaoCID: TppRegion;
    rpPCMSORegiaoObs: TppRegion;
    rpPCMSODBObsAval: TppDBText;
    ppIMG: TppBDEPipeline;
    ppIMGppField1: TppField;
    dsIMG: TwwDataSource;
    CdsIMG: TCMClientDataSet;
    rpPCMSOSmryBnd: TppSummaryBand;
    rpPCMSOlbl_TITULO_RELAT: TppLabel;
    rpPCMSOHdrBnd1: TppHeaderBand;
    rpPCMSODBImage1: TppDBImage;
    rpPCMSODtlBnd1: TppDetailBand;
    rpPCMSOFootBnd1: TppFooterBand;
    rpPCMSOShape1: TppShape;
    rpPCMSOShape2: TppShape;
    rpPCMSOShape3: TppShape;
    rpPCMSOShape4: TppShape;
    rpPCMSOShape5: TppShape;
    rpPCMSOLine1: TppLine;
    rpPCMSOLine2: TppLine;
    rpPCMSOLine3: TppLine;
    rpPCMSOLine4: TppLine;
    rpPCMSOLine5: TppLine;
    rpPCMSOLine6: TppLine;
    rpPCMSOLine7: TppLine;
    rpPCMSOlbl2: TppLabel;
    rpPCMSOlbl3: TppLabel;
    rpPCMSOlbl4: TppLabel;
    rpPCMSOlbl5: TppLabel;
    rpPCMSOlbl6: TppLabel;
    rpPCMSOlbl7: TppLabel;
    rpPCMSOlbl8: TppLabel;
    rpPCMSOlbl9: TppLabel;
    rpPCMSOlbl10: TppLabel;
    rpPCMSOlbl11: TppLabel;
    rpPCMSOlbl12: TppLabel;
    rpPCMSOlbl13: TppLabel;
    rpPCMSOlbl14: TppLabel;
    rpPCMSOlbl15: TppLabel;
    rpPCMSOlbl16: TppLabel;
    rpPCMSOlbl17: TppLabel;
    rpPCMSOlbl18: TppLabel;
    rpPCMSOlbl19: TppLabel;
    rpPCMSOlbl20: TppLabel;
    rpPCMSODBTxt3: TppDBText;
    rpPCMSODBTxt2: TppDBText;
    rpPCMSODBTxt4: TppDBText;
    rpPCMSODBTxt5: TppDBText;
    rpPCMSODBTxt6: TppDBText;
    rpPCMSODBTxt7: TppDBText;
    rpPCMSODBTxt8: TppDBText;
    rpPCMSODBTxt9: TppDBText;
    rpPCMSODBTxt10: TppDBText;
    rpPCMSODBTxt11: TppDBText;
    rpPCMSODBTxt12: TppDBText;
    rpPCMSODBTxt13: TppDBText;
    rpPCMSODBTxt14: TppDBText;
    rpPCMSODBTxt15: TppDBText;
    rpPCMSODBTxt16: TppDBText;
    rpPCMSODBTxt17: TppDBText;
    rpPCMSOMemo1: TppMemo;
    rpPCMSODBMemo1: TppDBMemo;
    rpPCMSODBMemo2: TppDBMemo;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpPCMSODtlBnd1BeforePrint(Sender: TObject);
    procedure rpPCMSOSmryBndAfterPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  public
    sFunc, sTipoOcorr, sNumSeq, sTitRelat, sAssinante, sEmpregado: String;
    iIncluiAvalObs: Integer;
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
  end;

var
  RptPCMSO: TRptPCMSO;

implementation

uses fAguarde, uSistema, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptPCMSO.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);
end;

procedure TRptPCMSO.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TRptPCMSO.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  rpPCMSOlbl_TITULO_RELAT.Caption := sTitRelat;
  with (sqlPCMSO.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PJ.RAZAOSOCIAL AS ESTAB, PF.NOME AS EMPREGADO, C.TITULO AS CARGO,');
    Add('  PJ.IDIMAGEM, TRIM(CIDADES.NOME) AS NOMECIDADE, TP.DESCRTIPOOCMED AS DESCRICAO,');
    Add('  TP.CODTIPOOCMED,');
    Add('  H.DATAPLAN, H.IDPESSOA, H.DATAREAL, H.EXAMINADOR, H.CODCID,');
    Add('  H.OBSERVACAO, H.AVALIACAO, CID.DESCRCID, CI.CARTIDENT,');
    Add('  DECODE(H.IDEXAMINADOR,NULL,'''',TRIM(EEX.LOGRADOURO) ||'', ''|| TRIM(EEX.NUMERO) ||');
    Add('  DECODE(EEX.COMPLEMENTO,NULL,'''','' / '') || TRIM(EEX.COMPLEMENTO) || ');
    Add('  DECODE(EEX.BAIRRO,NULL,'''','' - '') || TRIM(EEX.BAIRRO)) AS ENDERECO,');
    Add('  ' +QuotedStr(sAssinante)+ ' AS ASSINANTE,');
    Add('  ' +sEmpregado+ ' AS EMPRECAND,');
    Add('  DECODE(NVL(TP.AVALMIN,0),0,''Apto(a)'',DECODE(TRUNC(NVL(H.AVALIACAO,0) /');
    Add('    NVL(TP.AVALMIN,0)),0,''Inapto(a)'',''Apto(a)'')) AS OBSAVAL');
    if (sEmpregado = '1') then
      Add(' ,F.IDESTAB');
    // -------------------------------------------------------------------------------------
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOA PEX, ENDPESS E, ENDPESS EEX, ');

    if (sEmpregado = '1') then
      Add('  FUNCIONARIO F,')
    else
      Add('  CANDIDAT F,');

    Add('  CARGO C, TIPOCMED TP, HSTASMED H, CIDADES, CID,');
    // -------------------------------------------------------------------------------------
    Add('  (SELECT');
    Add('     D.IDPESSOA, TRIM(D.NUMDOCUMENTO) || '' '' || TRIM(D.ORGAO) || ''-'' ||');
    Add('     TRIM(D.UF) ||'' ''|| TO_CHAR(D.DATAEMISSAO,''DD/MM/YYYY'') AS CARTIDENT');
    Add('   FROM');
    Add('     DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE');
    Add('     (TD.SIGLADOCUMENTO = ''RG:'') AND');
    Add('     (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) CI');
    // -------------------------------------------------------------------------------------
    Add('WHERE');
    Add('  (H.IDPESSOA         = ' +sFunc+ ') AND');
    Add('  (H.CODTIPOOCMED     = ' +sTipoOcorr+ ') AND');
    Add('  (H.NUMSEQ           = ' +sNumSeq+ ') AND');
    Add('  (H.CODTIPOOCMED     = TP.CODTIPOOCMED) AND');
    Add('  (H.IDPESSOA         = PF.IDPESSOA) AND');
    Add('  (H.IDPESSOA         = F.IDPESSOA) AND');

    if (sEmpregado = '1') then
      Add('  (F.IDESTAB          = PJ.IDPESSOA) AND')
    else
      Add('  (PJ.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ') AND');

    Add('  (F.IDCARGO          = C.IDCARGO) AND');
    Add('  (PJ.IDENDCOMERCIAL  = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES        = CIDADES.IDCIDADES) AND');
    Add('  (H.IDPESSOA         = CI.IDPESSOA(+)) AND');
    Add('  (H.IDEXAMINADOR     = PEX.IDPESSOA(+)) AND');
    Add('  (PEX.IDENDCOMERCIAL = EEX.IDENDERECO(+)) AND');
    Add('  (H.CODCID           = CID.CODCID(+))');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlPCMSO.Open;

  // Pego o Logotipo do estabelecimento
  if (sEmpregado = '1') then
    CdsIMG.Data := CtrlListTerceirosRH.ListImagemPessoa(
      CdsPCMSO.FieldByName('IDESTAB').asFloat)
  else
  begin
    with (dmCds.sql.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  FP.IDFILIALPESSOA AS IDESTAB');
      Add('FROM PESSOA P, FILIALPESSOA FP');
      Add('WHERE (P.IDGRUPO  = ' +IntToStr(Sistema.IdEmpresa)+ ')');
      Add('AND   (P.IDPESSOA = FP.IDFILIALPESSOA)');
      dmCds.sql.Open;
      CdsIMG.Data := CtrlListTerceirosRH.ListImagemPessoa(
        dmCds.Cds.FieldByName('IDESTAB').asFloat);
    end;
  end;
end;

procedure TRptPCMSO.rpPCMSODtlBnd1BeforePrint(Sender: TObject);
begin
  rpPCMSORegiaoCand.Visible := (CdsPCMSO.FieldByName('EMPRECAND').asInteger = 0);
  rpPCMSORegiaoAval.Visible := (iIncluiAvalObs = 0);
  rpPCMSORegiaoCID.Visible := not(CdsPCMSO.FieldByName('DATAREAL').IsNull) and
    not(CdsPCMSO.FieldByName('CODCID').IsNull);
  rpPCMSORegiaoObs.Visible := (iIncluiAvalObs = 0) and
    ((CdsPCMSO.FieldByName('DATAREAL').IsNull) or
     not(CdsPCMSO.FieldByName('OBSERVACAO').IsNull));
  rpPCMSOdbAval.Visible := (iIncluiAvalObs = 0) and
    not(CdsPCMSO.FieldByName('DATAREAL').IsNull);
  rpPCMSOdbObsAval.Visible := (iIncluiAvalObs = 0) and
    not(CdsPCMSO.FieldByName('DATAREAL').IsNull);
end;

procedure TRptPCMSO.rpPCMSOSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
