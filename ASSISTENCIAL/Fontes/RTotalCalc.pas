unit RTotalCalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  ppStrtch, ppSubRpt,{$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptTotalCalc = class(TFrmCmReport)
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
    RpTotalCalc: TppReport;
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
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDetailBand: TppDetailBand;
    rpdivergerecebimentoDBText8: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLabelSistema: TppLabel;
    ppLine20: TppLine;
    ppCalc23: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    rpdivergerecebimentoSummaryBand1: TppSummaryBand;
    rpdivergerecebimentoShape1: TppShape;
    rpDBCalcTotalEsperado: TppDBCalc;
    ppVariable1: TppVariable;
    ppDBCalc1: TppDBCalc;
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
  RptTotalCalc: TRptTotalCalc;
  iTotal: Integer;

implementation


Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptTotalCalc.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptTotalCalc.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSql : String;
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
      'SELECT H.MESCOBRANCA, PJ.NOME, COUNT(*) AS TOTAL,'+
      ' SUM(H.VALORESPERADO) AS TOTALVALOR '+
      ' FROM '+
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
      // FERNANDO - P.15175 - INICIO
      //' (EP.IDESTAB  = PR.IDPESSOA) AND'+
      ' (EP.IDESTAB  = PR.IDPESSOA(+)) AND'+
      // FERNANDO - P.15175 - FIM
      ' (H.IDDEPENDENTE = PD.IDPESSOA) AND'+
      ' (H.IDCONTASS = C.IDCONTRIBUICAO) AND'+
      ' (PP.IDSITPART = ST.IDSITPART) AND '+
      ' (FD.IDPESSOA = FD.IDPESSOA) ';
     rpLabelTitulo.Caption:='Cálculo de Contribuições - Totais - ';
     If Not CmpRptCM.ParamValues[1].IsNull Then
       Case StrToIntDef(CmpRptCM.ParamValues[1].AsString,3) Of
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

     sSql:=sSql+' GROUP BY H.MESCOBRANCA, PJ.NOME';

     sSql:= sSql+' ORDER BY PJ.NOME';// FERNANDO - P.15175

    Sql.Clear;
    Sql.Add(sSql);   
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;

end;

procedure TRptTotalCalc.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptTotalCalc.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptTotalCalc.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptTotalCalc.ppDBTextTitularPrint(Sender: TObject);
begin
  inherited;
 iTotal:=iTotal+1;
end;

procedure TRptTotalCalc.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptTotalCalc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CloseQry;
end;

end.


