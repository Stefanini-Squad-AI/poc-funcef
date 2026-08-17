unit RVlCalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  ppStrtch, ppSubRpt,{$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptVlCalc = class(TFrmCmReport)
    PpRptCM: TppBDEPipeline;
    DsRptCM: TwwDataSource;
    Cds: TClientDataSet;
    Dsp: TDataSetProvider;
    QryRptCM: TwwQuery;
    AQryFundacao: TADOQuery;
    ppFundacao: TppBDEPipeline;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    DspFundacao: TDataSetProvider;
    CdsFundacao: TClientDataSet;
    aQryRptCm: TADOQuery;
    RpVlCalc: TppReport;
    ppHeaderBand12: TppHeaderBand;
    rpLabelTitulo: TppLabel;
    rpDBTextMesRef: TppDBText;
    ppDBImage10: TppDBImage;
    ppDBText110: TppDBText;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppDBText114: TppDBText;
    ppDBText115: TppDBText;
    ppDBText116: TppDBText;
    ppLabel96: TppLabel;
    ppDBText117: TppDBText;
    rpLabelMesref: TppLabel;
    ppLine2: TppLine;
    ppDetailBand: TppDetailBand;
    DBTextParticip: TppDBText;
    rpDBTextPlano: TppDBText;
    rpDBTextEsperado: TppDBText;
    ppDBMatricula: TppDBText;
    ppDBText1: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLabelSistema: TppLabel;
    ppLine20: TppLine;
    ppCalc23: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    rpdivergerecebimentoSummaryBand1: TppSummaryBand;
    rpdivergerecebimentoShape1: TppShape;
    rpLabelTotalGeral: TppLabel;
    rpDBCalcTotalEsperado: TppDBCalc;
    ppVariable1: TppVariable;
    ppDBCalc1: TppDBCalc;
    rpdivergerecebimentoGroup1: TppGroup;
    rpdivergerecebimentoGroupHeaderBand1: TppGroupHeaderBand;
    rpLabelPatro: TppLabel;
    rpdivergerecebimentoDBText8: TppDBText;
    ppLabel1: TppLabel;
    rpLabelParticipante: TppLabel;
    rpLabelPlano: TppLabel;
    rpLabelEsperado: TppLabel;
    ppLabel2: TppLabel;
    rpdivergerecebimentoGroupFooterBand1: TppGroupFooterBand;
    rpLabelTotalPatro: TppLabel;
    DBCalcEsperado: TppDBCalc;
    rpdivergerecebimentoLine4: TppLine;
    rpdivergerecebimentoLine6: TppLine;
    ppVarDescTotalPatro: TppVariable;
    ppVarTotalPatro: TppDBCalc;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
    procedure ppDBTextTitularPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure CloseQry;

  public
    { Public declarations }
  end;

var
  RptVlCalc: TRptVlCalc;
  iTotal: Integer;

implementation


Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptVlCalc.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptVlCalc.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSql: String;
begin
  inherited;
  iTotal:=0;
    {**
    Evento utilizado para montagem do(s) sql(´s) do relatório de acordo com
    os parâmetros do ParamReports CmpRptCM.
    Os parêmetros podem ser acessados pelo índice (PARAMVALUES) ou pelo nome (PARAMBYNAME).
    É interessante observar o tipo de conexão em uso oque implica que o(s) SQL(´s) montados
    sejam atribuidos ao DATASET correto ou a todos os DATASET´S
  **}
  //sSql := '';

  With QryRptCM Do
  Begin
     If Active Then Close;

     sSql:=
      'SELECT'+
      ' H.MES,'+
      ' H.MESCOBRANCA,'+
      ' EP.MATRICULA,'+
      ' P.NOME PARTICIP,'+
      ' PJ.NOME PATRO,'+
      ' PA.NOME PLANOASSIS,'+
      ' PR.NOME REGIONAL,'+
      ' PD.NOME DEPENDENTE,'+
      ' C.NOME CONTRIBUICAO,'+
      ' H.VALORESPERADO,'+
      ' H.VALORRECEBIDO,'+
      ' H.VALORRECEBIDO - H.VALORESPERADO AS DIFERENCA,'+
      ' H.SITRECEBIMENTO,'+
      ' DECODE(H.SITRECEBIMENTO,1,''ENVIADA'','+
                               '2,''RECEBIDA'','+
                               '3,''DIVERGENTE/ATRASO'','+
                               '4,''TRATADO'') AS SITUACAO,'+
      ' H.SEQPROPOSTA,'+
      ' H.IDTITULAR,'+
      ' H.IDPLANOPREV,'+
      ' H.IDPLANASS,'+
      ' H.IDPESSJUR,'+
      ' H.IDMOTIVO,'+
      ' H.IDDEPENDENTE,'+
      ' H.IDCONTASS,'+
      ' ST.DESCRICAO AS SITUACAOPREV'+

      ' FROM'+
      ' HSTCONTRIBASS H,'+
      ' PESSOA P,'+
      ' PESSOA PJ,'+
      ' PESSOA PR,'+
      ' PESSOA PD,'+
      ' ELEGPATRO EP,'+
      ' PARTPREVPLAN PP,'+
      ' SITPART ST,'+
      ' PLANASS PA,'+
      ' CONTRIBUICAO C,'+
      ' FUNDACAO FD'+
      ' WHERE';

     If Not CmpRptCM.ParamValues[0].IsNull Then
      sSql := sSql+' (H.MESCOBRANCA = '+ Chr(39) +
       CmpRptCM.ParamValues[0].AsString + Chr(39)+ ') AND'
     else Exit;

     If Not CmpRptCM.ParamValues[1].IsNull Then
      sSql := sSql+' (H.IDPESSJUR = '+ Chr(39) +
     CmpRptCM.ParamValues[1].AsString + Chr(39)+ ') AND';


     sSql:=sSql+
      ' (H.SITRECEBIMENTO IN (0,1,2,3,4)) AND'+
      ' (H.IDTITULAR = P.IDPESSOA) AND'+
      ' (H.IDPESSJUR = PJ.IDPESSOA) AND'+
      ' (H.IDTITULAR = PP.IDPESSOA) AND'+
      ' (H.IDPLANOPREV = PP.IDPLANOPREV) AND'+
      ' (H.IDPLANASS = PA.IDPLANASS) AND'+
      ' (H.IDTITULAR = EP.IDPESSOA ) AND'+
      ' (H.IDPESSJUR = EP.IDPESSJUR) AND'+
      ' (PP.FLGDESATIVADO = 0) AND'+
      // FERNANDO - P. 15173 - INICIO
      // ' (EP.IDESTAB  = PR.IDPESSOA) AND'+
      ' (EP.IDESTAB  = PR.IDPESSOA(+)) AND'+
      // FERNANDO - P. 15173 - FIM
      ' (H.IDDEPENDENTE = PD.IDPESSOA) AND'+
      ' (H.IDCONTASS = C.IDCONTRIBUICAO) AND'+
      ' (PP.IDSITPART = ST.IDSITPART) AND'+
      ' (FD.IDPESSOA = FD.IDPESSOA) ';
     rpLabelTitulo.Caption:='Relatório de Cálculo de Contribuições - ';
     If Not CmpRptCM.ParamValues[2].IsNull Then
       Case StrToIntDef(CmpRptCM.ParamValues[2].AsString,3) Of
         0 : begin
               sSql:=sSql+' AND (ST.FLGINTERNO = ''AT'') '+
                          ' AND (H.IDPESSJUR <> FD.IDPESSOA) '+
                          ' AND (H.FLGCOBCARNE <> 1) ';
               rpLabelTitulo.Caption:=rpLabelTitulo.Caption+'Folha da Patrocinadora';
             end;
         1 : begin
               sSql:=sSql+' AND (ST.FLGINTERNO = ''AT'') '+
                          ' AND (H.IDPESSJUR = FD.IDPESSOA) '+
                          ' AND (H.FLGCOBCARNE <> 1) ';
               rpLabelTitulo.Caption:=rpLabelTitulo.Caption+'Folha da Fundação';
             end;
         2 : begin
               sSql:=sSql+' AND (H.FLGCOBCARNE = 1) ';
               rpLabelTitulo.Caption:=rpLabelTitulo.Caption+'Cobrança em Banco';
             end;
         3 : begin
               sSql:=sSql+' AND (ST.FLGINTERNO = ''AS'') '+
                          ' AND (H.FLGCOBCARNE <> 1) ';
               rpLabelTitulo.Caption:=rpLabelTitulo.Caption+'Folha de Benefícios';
             end;
         4 : rpLabelTitulo.Caption:=rpLabelTitulo.Caption+'Todos';

       end; {Case}

     sSql:=sSql+' ORDER BY  PJ.NOME, P.NOME';

    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;
end;

procedure TRptVlCalc.CrmRptCMChangeDataBaseName(Sender: TObject;
  sDataBaseName: String);
begin
  inherited;
  {**
    Ente evento é disparado quando é atribuído o DataBaseName a ser utilizado
    pelos BDEDATASETS do relatório.
    A função ChangeDataBaseName auxilia na atribuição do mesmo pois tem como
    parâmetro um ARRAY de DATASETS onde podemos atrbuir a todos os datasets do form
    a alteração do DATABSENAME. Esta função esta na uDataBase
  **}
  ChangeDataBaseName([QryRptCM,QryFundacao],sDataBaseName);
end;

procedure TRptVlCalc.CrmRptCMChangeConnectionType(Sender: TObject;
  ConnectionType: TDbConnectionType);
begin
  inherited;
  {**
    O tipo de conexão pode variar de acordo com o tipo de aplicação
    e isso implica que sejam apontados para os respectivos DATASETPROVIDERS
    as Queryes de acordo com o tipo de Conexão.
    Temos hoje as seguintes conexões previstas:
    cntBDE >> BDE
    cntADO >> ADO
    cntIB  >> Inter Base
    cntDOA >> Direct Oracle Acces
  **}
  Case ConnectionType of
    cntBDE: begin
              Dsp.DataSet := QryRptCM;
              DspFundacao.Dataset := QryFundacao;
            end;
    cntADO: begin
              Dsp.DataSet := aQryRptCM;
              DspFundacao.DataSet :=aQryFundacao;
            end;

    cntIB: ;
    cntDOA: ;
  End;
end;

procedure TRptVlCalc.CrmRptCMChangeConnection(Sender: TObject;
  Connection: TADOConnection);
begin
  inherited;
  {**
    Assim como no OnChangeDataBaseName, se estamos utilizando a conexão via
    ADO temos que atribuir o ADOCONNECTION do nosso sistema as Queryes ADO do
    form de relatório
   *}
  AQryRptCM.Connection := Connection;
  AQryFundacao.Connection := Connection;
end;

procedure TRptVlCalc.ppDBTextTitularPrint(Sender: TObject);
begin
  inherited;
 iTotal:=iTotal+1;
end;

procedure TRptVlCalc.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptVlCalc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CloseQry;
end;

end.


