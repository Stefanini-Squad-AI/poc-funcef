// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RFichaAvalPPRA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  uCmRptManager, TXComp, CmParamReport, ppProd, ppClass, ppReport, ppBands, ppCache, ppVar,
  ppCtrls, ppPrnabl, ppStrtch, ppMemo, ppSubRpt, ppRegion, uCtrlPpraAval,
  TXRB;

type
  TRptFichaAvalPPRA = class(TFrmCmReport)
    sqlFichaAvalPPRA: TCMSqlParams;
    CdsFichaAvalPPRA: TCMClientDataSet;
    dsFichaAvalPPRA: TwwDataSource;
    ppFichaAvalPPRA: TppBDEPipeline;
    rpFichaAvalPPRA: TppReport;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    rpOcorrPessLbl2: TppLabel;
    rpOcorrPessSysVar1: TppSystemVariable;
    rpOcorrPessLbl3: TppLabel;
    rpOcorrPessSysVar2: TppSystemVariable;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBMemo2: TppDBMemo;
    ppDBText9: TppDBText;
    ppMedidas: TppBDEPipeline;
    dsMedidas: TwwDataSource;
    CdsMedidas: TCMClientDataSet;
    ppAgentes: TppBDEPipeline;
    dsAgentes: TwwDataSource;
    CdsAgentes: TCMClientDataSet;
    sqlAgentes: TCMSqlParams;
    rpAgentes: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel12: TppLabel;
    ppDBText10: TppDBText;
    ppLabel13: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBText13: TppDBText;
    ppDBMemo3: TppDBMemo;
    sqlMedidas: TCMSqlParams;
    rpMedidas: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBText14: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppLabel22: TppLabel;
    ppRegion1: TppRegion;
    ppLabel23: TppLabel;
    lblConta1: TppLabel;
    ppLabel25: TppLabel;
    lblConta2: TppLabel;
    ppLabel27: TppLabel;
    lblConta5: TppLabel;
    ppLabel29: TppLabel;
    lblConta6: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    lblConta3: TppLabel;
    lblConta7: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    lblConta4: TppLabel;
    lblConta8: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    CdsContagem: TCMClientDataSet;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel24: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLabel26: TppLabel;
    ppLabel28: TppLabel;
    ppDBText21: TppDBText;
    ppLabel30: TppLabel;
    ppLabel33: TppLabel;
    ppDBText22: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppSummaryBand3BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppSummaryBand3AfterPrint(Sender: TObject);
  private
    CtrlPpraAval: TCtrlPpraAval;
  public
    sAval: string;
  end;

var
  RptFichaAvalPPRA: TRptFichaAvalPPRA;

implementation

uses fAguarde, uCtrlPadroes, uSistema;

{$R *.DFM}

procedure TRptFichaAvalPPRA.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPpraAval := TCtrlPpraAval.Create;
  CtrlPpraAval.InitializeAs(Padroes);
end;

procedure TRptFichaAvalPPRA.FormDestroy(Sender: TObject);
begin
  CtrlPpraAval.Free;
  inherited;
end;

procedure TRptFichaAvalPPRA.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlFichaAvalPPRA.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  DECODE(PJ.RAZAOSOCIAL, NULL, ''Todas as Empresas'', PJ.RAZAOSOCIAL)  AS EMPRESA,');
    Add('  DECODE(PJ2.RAZAOSOCIAL, NULL, ''Todos'', PJ2.RAZAOSOCIAL) AS ESTAB,');
    Add('  DECODE(PP.IDESTAB, NULL, PJ.NUMDOCUMENTO, PJ2.NUMDOCUMENTO) AS CNPJ,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,NULL,'' - ''|| RTRIM(E.COMPLEMENTO)) ||'' - ''|| ');
    Add('    DECODE(RTRIM(E.BAIRRO),NULL,NULL,RTRIM(E.BAIRRO)) ||'' - ''||');
    Add('    RTRIM(CIDADES.NOME) || '' CEP: '' ||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  DECODE(C.TITULO, NULL, ''Todos'', C.TITULO) AS CARGO,');
    Add('  DECODE(L.NOME, NULL, ''Todos'', L.NOME) AS LOCAL,');
    Add('  DECODE(CN.IDITEMCNAE, NULL, '''', ''Atividade: '' || CN.DESCRICAO) AS CNAE,');
    Add('  DECODE(H.NOMEHORARIO, NULL, ''Todos'', H.NOMEHORARIO) AS NOMEHORARIO,');
    Add('  PR.NOME AS RESPONSAVEL, PC.NOME AS CONTATO, ');
    Add('  PP.IDAVAL, PP.IDHORARIO, PP.IDCARGO, PP.IDLOCALIZACAO, PP.IDPESSOA,');
    Add('  PP.IDEMPRESA, PP.IDESTAB, PP.IDCONTATO, PP.IDRESPONSAVEL,');
    Add('  DECODE(PP.INDTIPOAVAL,1,''Antecipação'',2,''Reconhecimento'',''Reavaliação'') AS TIPOAVAL,');
    Add('  PP.DESCRICAO, PP.TEXTOCOMPL, PP.INDABRANGENCIA, PP.DATAAVAL');
    // -------------------------------------------------------------------------------------
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PJ2, PESSOA PR, PESSOA PC, ENDPESS E, FILIALPESSOA FP, ITEMCNAE CN,');
    Add('  PPRAAVAL PP, CARGO C, HORATRAB H, LOCALIZACAO L, ESTADO ES, CIDADES');
    // ------------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PP.IDAVAL          = ' +sAval+ ') AND');
    Add('  (PP.IDRESPONSAVEL   = PR.IDPESSOA) AND');
    Add('  (DECODE(PP.IDEMPRESA,NULL,'+IntToStr(Sistema.IdEmpresa)+',PP.IDEMPRESA) = PJ.IDPESSOA) AND');
    Add('  (DECODE(PP.IDESTAB,NULL,PJ.IDPESSOA,PJ2.IDPESSOA) = E.IDPESSOA) AND');
    Add('  (DECODE(PP.IDESTAB,NULL,PJ.IDENDCOMERCIAL,PJ2.IDENDCOMERCIAL) = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES        = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO   = ES.IDESTADO) AND');
    Add('  (PP.IDESTAB         = PJ2.IDPESSOA(+)) AND');
    Add('  (PP.IDPESSOA        = L.IDPESSOA(+)) AND');
    Add('  (PP.IDLOCALIZACAO   = L.IDLOCALIZACAO(+)) AND');
    Add('  (PP.IDHORARIO       = H.IDHORARIO(+)) AND');
    Add('  (PP.IDCONTATO       = PC.IDPESSOA(+)) AND');
    Add('  (PJ2.IDPESSOA       = FP.IDFILIALPESSOA(+)) AND');
    Add('  (FP.IDITEMCNAE      = CN.IDITEMCNAE(+)) AND');
    Add('  (PP.IDCARGO         = C.IDCARGO(+)) ');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlFichaAvalPPRA.Open;

  sqlAgentes.Prepare;
  sqlAgentes.ParamByName('IDAVAL').AsString := sAval;
  sqlAgentes.Open;

  sqlMedidas.Prepare;
  sqlMedidas.ParamByName('IDAVAL').AsString := sAval;
  sqlMedidas.Open;
end;

procedure TRptFichaAvalPPRA.ppSummaryBand3BeforePrint(Sender: TObject);
var
  iConta: integer;
begin
  inherited;
  CdsContagem.Data := CtrlPpraAval.ContaEmpregados(
                       CdsFichaAvalPPRA.FieldByName('IDEMPRESA').AsInteger,
                       CdsFichaAvalPPRA.FieldByName('IDESTAB').AsInteger,
                       CdsFichaAvalPPRA.FieldByName('IDLOCALIZACAO').AsInteger,
                       CdsFichaAvalPPRA.FieldByName('IDCARGO').AsInteger,
                       CdsFichaAvalPPRA.FieldByName('IDHORARIO').AsInteger);

  iConta := 0;
  while not CdsContagem.Eof do
  begin
     inc(iConta);
     TppLabel(Self.FindComponent('lblConta'+ IntToStr(iConta))).Caption :=
          CdsContagem.FieldByName('CONTA').AsString;
     CdsContagem.Next;
  end;
end;

procedure TRptFichaAvalPPRA.ppSummaryBand3AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
