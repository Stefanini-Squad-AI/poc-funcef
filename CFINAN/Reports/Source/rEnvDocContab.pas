unit rEnvDocContab;
{
--------------------------------------------------------------------------------
Rotina..........: GravaFazEnvioDocumento
N. Sol..........: 90187-90779-90780-90781
N. Kintana......: 380204-383016-383017-383018
Data............: 12/11/2008
Responsável.....: Marilza Colpani
Descrição.......: - Corrigido o envio de parte dos documentos de um lote;
                  - Resultado da pesquisa de Documentos está retornando Nodocumento;
                  - O último filtro do formulário está identificado (Nº Fatura).
                  - Inserido filtros: Data do Envio e Data da Baixa;
                  - Filtro Planilha Contábil foi referenciado ao campo PLNPLANIL da tabela PLANILHA;
                  - Ao alterar entre as abas ”Não Enviados” e “Enviados”, os Checks Box da opção Módulos permanecem ativados;
                  - Corrigido problemas da movimentação do Controle Financeiro;
                  - Corrigida as consultas por: Documento, Número AP/AR, Número do Lote, Valor Documento, Planilha Contábil;
                  - A Hora do Envio foi corrigida;
                  - Inserido Check Box nos documentos na opção “Enviados”;
                  - Inserido número da planilha contábil dos documentos;
                  - Valor do documento está sendo exibido corretamente;
                  - Corrigido as emissões de relatórios.
--------------------------------------------------------------------------------
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  uCmRptManager, TXComp, TXRB, CmParamReport, ppCtrls, ppPrnabl, ppBands,
  ppCache, Db, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra, ppVar,
  Wwdatsrc, ppDBBDE, DBTables, Provider, ppStrtch, ppSubRpt, StdCtrls,
  ppModule, raCodMod, ppParameter, uCtrlRptEnvioDocumento, daDataModule;

type
  TrptEnvDocContab = class(TFrmCmReport)
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    DsMovimento: TDataSource;
    SQLMovimento: TCMSqlParams;
    CdsMovimento: TCMClientDataSet;
    ppBDECabecario: TppBDEPipeline;
    sqlCabecario: TCMSqlParams;
    cdsCabecario: TCMClientDataSet;
    dsCabecario: TwwDataSource;
    DataSetProvider1: TDataSetProvider;
    Query1: TQuery;
    Label1: TLabel;
    ppDBDocumento: TppDBPipeline;
    CdsDocumento: TCMClientDataSet;
    QryDocumento: TQuery;
    PrvDocumento: TDataSetProvider;
    DsDocumento: TDataSource;
    ppParameterList1: TppParameterList;
    SQLDocumento: TCMSqlParams;
    CdsDocumentoVLRBRUTO: TFloatField;
    CdsDocumentoVLRLIQUIDO: TFloatField;
    CdsDocumentoNUMLOTE: TFloatField;
    CdsDocumentoTIPO: TStringField;
    CdsDocumentoCODLANCFINANC: TFloatField;
    CdsDocumentoCODDOCUMENTO: TFloatField;
    CdsDocumentoIDPESSOA: TFloatField;
    CdsDocumentoIDFORCLI: TFloatField;
    CdsDocumentoNODOCUMENTO: TFloatField;
    CdsDocumentoNUMAPGR: TFloatField;
    CdsDocumentoNOME: TStringField;
    CdsDocumentoRAZAOSOCIAL: TStringField;
    CdsMovimentoSELECIONADO: TFloatField;
    CdsMovimentoSTATUS: TStringField;
    CdsMovimentoHISTORICO: TStringField;
    CdsMovimentoVALORLANCFINAN: TFloatField;
    CdsMovimentoNUMCHQBORDERO: TStringField;
    CdsMovimentoDATALANCFINAN: TDateTimeField;
    CdsMovimentoENTRADASAIDA: TStringField;
    CdsMovimentoDATADISPFINANC: TDateTimeField;
    CdsMovimentoIDENVIODOCUMENTO: TFloatField;
    CdsMovimentoCODLANCFINANC: TFloatField;
    CdsMovimentoNOMEMODULO: TStringField;
    CdsMovimentoPORTADORCONTA: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppDBImage1: TppDBImage;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppSubRprtDocumento: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppShape3: TppShape;
    ppLabel8: TppLabel;
    ppLabel11: TppLabel;
    ppLabel10: TppLabel;
    ppLabel9: TppLabel;
    ppLabel12: TppLabel;
    ppLabel16: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText7: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText8: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppShapDrill: TppShape;
    ppDBText9: TppDBText;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppShape2: TppShape;
    ppLabel22: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    daDataModule1: TdaDataModule;
    CdsDocumentoSELECIONADO: TFloatField;
    CdsDocumentoPLNPLANIL: TFloatField;
    ppDBDocumentoppField13: TppField;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppSubRprtDocumentoPrint(Sender: TObject);
  private
    CtrlRptEnvioDocumento: TCtrlRptEnvioDocumento;
    procedure ConfiguraImpressaoDocumentosEnviados(const pTipoData  : tTipoData);
    procedure MontaCabecalho;
    procedure ConfiguraImpressaoDocumentosNaoEnviados(
      const pTipoData: tTipoData);
    procedure LoadTabelas(const pFiltra: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptEnvDocContab: TrptEnvDocContab;

implementation

uses uSistema;

{$R *.DFM}


procedure TrptEnvDocContab.MontaCabecalho;
begin
  with sqlCabecario do
  Begin
    Prepare;
    SQL.Clear;
    SQL.Add('SELECT RAZAOSOCIAL, NUMDOCUMENTO, IMAGEM, USUENVIO, DTENVIO, CODENVIO ');
    SQL.Add('FROM ( ');

    SQL.Add('SELECT                                              ');
    SQL.Add('  P.RAZAOSOCIAL, P.NUMDOCUMENTO, I.IMAGEM, 1 AS REG ');
    SQL.Add('FROM                                                ');
    SQL.Add('  PESSOA P, IMAGENS I                               ');
    SQL.Add('WHERE                                               ');
    SQL.Add('  ( I.IDIMAGEM = P.IDIMAGEM ) AND                   ');
    SQL.Add('  (P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +') ');
    SQL.Add('   ),( ');
    SQL.Add('   SELECT E.TRGDTINCLUSAO    AS DTENVIO  ');
    SQL.Add('         ,E.IDENVIODOCUMENTO AS CODENVIO ');
    SQL.Add('         ,P.NOME             AS USUENVIO ');
    SQL.Add('         ,1                  AS REG2     ');
    SQL.Add('   FROM ENVIODOCUMENTO E, PESSOA P       ');
    SQL.Add('   WHERE E.IDUSUARIO        = P.IDPESSOA ');
    SQL.Add('     AND E.IDENVIODOCUMENTO = '+CmpRptCM.ParamValues[5].AsString);
    SQL.Add('   )');
    SQL.Add('WHERE REG = REG2 ');
    Open;
  end;
end;

procedure TrptEnvDocContab.CrmRptCMBeforePrint(Sender: TObject);
var FTipoData:  TTipoData;
begin
  inherited;
  CtrlRptEnvioDocumento := TCtrlRptEnvioDocumento.Create;
  MontaCabecalho;

  Case CmpRptCM.ParamValues[9].AsString[1] of
    'L' : FTipoData := tdLancamento;
    'D' : FTipoData := tdDisponibilidade;
    'C' : FTipoData := tdEnvioContabilidade;
  end;

  if CmpRptCM.ParamValues[6].AsBoolean then
    ConfiguraImpressaoDocumentosNaoEnviados(fTipoData)
  else
    ConfiguraImpressaoDocumentosEnviados(fTipoData);
end;


procedure trptEnvDocContab.LoadTabelas(const pFiltra : boolean);
begin
  // método novo
  CdsMovimento.LoadFromFile(CmpRptCM.ParamValues[11].AsString);
  DeleteFile(CmpRptCM.ParamValues[11].AsString);

  If pFiltra then
  begin
    CdsMovimento.Filter := 'SELECIONADO = 1';
    CdsMovimento.Filtered := True;
  end;
  CdsMovimento.First;

  CdsDocumento.LoadFromFile(CmpRptCM.ParamValues[12].AsString);
  DeleteFile(CmpRptCM.ParamValues[12].AsString);
  CdsDocumento.First;
end;

procedure TrptEnvDocContab.ConfiguraImpressaoDocumentosNaoEnviados(const pTipoData : tTipoData);
var sCampos : String;
    i : Integer;
begin
  loadTabelas(True); //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  ppLabel1.Caption := 'Documentos não enviados para a contabilidade';
end;

procedure TrptEnvDocContab.ConfiguraImpressaoDocumentosEnviados(const pTipoData : tTipoData);
begin
  loadTabelas(False);  //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  ppLabel1.Caption := 'Documentos enviados para a contabilidade';
end;

procedure TrptEnvDocContab.ppSubRprtDocumentoPrint(Sender: TObject);
begin
  inherited;

  { Aplicar filtros }
  CdsDocumento.Filtered := False;
  CdsDocumento.Filter := 'CODLANCFINANC = ' + CdsMovimento.FieldByName('CODLANCFINANC').AsString;
  If CdsMovimento.Filtered then
    CdsDocumento.Filter := CdsDocumento.Filter + ' and Selecionado = 1';

  CdsDocumento.Filtered := True;

end;

end.
