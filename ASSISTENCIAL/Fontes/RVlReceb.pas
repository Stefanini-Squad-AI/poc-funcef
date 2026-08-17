// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Hugo Luna
// Data        : 16/10/2007
// Pendência   : 26570
// Rotina      : Relatórios/ AdmAssistencial/Analíticos/Contribuições Recebidas
// Descricao   : Inserido Filtro para Tipo de Folha no relatório
//------------------------------------------------------------------------------
unit RVlReceb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  ppStrtch, ppSubRpt,{$IFNDEF Versao05} UcmTypes, TXRB {$ELSE} uComum {$ENDIF};

type
  TRptVlReceb = class(TFrmCmReport)
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
    RpVlReceb: TppReport;
    QryAlterador: TwwQuery;
    DspAlterador: TDataSetProvider;
    CdsAlterador: TClientDataSet;
    DsAlterador: TwwDataSource;
    AQryAlterador: TADOQuery;
    ppAlterador: TppBDEPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    ppField7: TppField;
    ppField8: TppField;
    ppField9: TppField;
    ppField10: TppField;
    ppHeaderBand12: TppHeaderBand;
    rpLabelTitulo: TppLabel;
    rpLabelMesCob: TppLabel;
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
    rpDBTextMesCob: TppDBText;
    ppLine2: TppLine;
    ppDetailBand12: TppDetailBand;
    rpDBTextContrib: TppDBText;
    DBTextParticip: TppDBText;
    rpDBTextPlano: TppDBText;
    rpDBTextEsperado: TppDBText;
    rpDBTextRecebido: TppDBText;
    rpDBTextSituacao: TppDBText;
    rpDBTextDiferenca: TppDBText;
    ppDBMatricula: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLabelSistema: TppLabel;
    ppLine20: TppLine;
    ppCalc23: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    rpdivergerecebimentoSummaryBand1: TppSummaryBand;
    rpdivergerecebimentoShape1: TppShape;
    rpLabelTotalGeral: TppLabel;
    rpDBCalcTotalEsperado: TppDBCalc;
    rpDBCalcRecebido: TppDBCalc;
    rpLabelTotalEsperado: TppLabel;
    rpLabelTotalRecebido: TppLabel;
    rpDBCalcDiferenca: TppDBCalc;
    rpLabelTotalDiferenca: TppLabel;
    ppVariable1: TppVariable;
    ppDBCalc2: TppDBCalc;
    rpdivergerecebimentoGroup1: TppGroup;
    rpdivergerecebimentoGroupHeaderBand1: TppGroupHeaderBand;
    rpLabelPatro: TppLabel;
    rpdivergerecebimentoDBText8: TppDBText;
    rpdivergerecebimentoGroupFooterBand1: TppGroupFooterBand;
    rpLabelTotalPatro: TppLabel;
    DBCalcEsperado: TppDBCalc;
    DbCalcRecebido: TppDBCalc;
    rpdivergerecebimentoLine4: TppLine;
    rpdivergerecebimentoLine6: TppLine;
    DBCalcDiferenca: TppDBCalc;
    ppVarDescPatro: TppVariable;
    ppDBCalc1: TppDBCalc;
    rpdivergerecebimentoGroup3: TppGroup;
    rpdivergerecebimentoGroupHeaderBand3: TppGroupHeaderBand;
    rpLabelPlano: TppLabel;
    rpLabelContrib: TppLabel;
    rpLabelParticipante: TppLabel;
    rpLabelEsperado: TppLabel;
    rpLabelRecebido: TppLabel;
    rpLabelDiferenca: TppLabel;
    rpdivergerecebimentoLine1: TppLine;
    rpLabelSituacao: TppLabel;
    ppLabel1: TppLabel;
    rpdivergerecebimentoGroupFooterBand3: TppGroupFooterBand;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    raCodeModule1: TraCodeModule;
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
    procedure rpDBTextPlanoPrint(Sender: TObject);
    procedure rpDBTextSituacaoPrint(Sender: TObject);
  private
    { Private declarations }
    Procedure CloseQry;

  public
    { Public declarations }
  end;

var
  RptVlReceb: TRptVlReceb;
  iTotal: Integer;

implementation


Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptVlReceb.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
  QryAlterador.Close;
  CdsAlterador.Close;
  aQryAlterador.Close;
end;

procedure TRptVlReceb.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSql :String;
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
      ' P.IDPESSOA MATRICULA,'+
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
      ' DECODE(H.SITRECEBIMENTO,0,''NAO ENVIADA'','+
                               '1,''NAO RECEBIDA'','+
                               '2,''RECEBIDA'','+
                               '3,''DIVERGENTE/ATRASO'','+
                               '4,''TRATADO'') AS SITUACAO,'+
      ' H.SEQPROPOSTA,'+
      ' H.MESCOBRANCA,'+
      ' H.MES,'+
      ' H.IDTITULAR,'+
      ' H.IDPLANOPREV,'+
      ' H.IDPLANASS,'+
      ' H.IDPESSJUR,'+
      ' H.IDMOTIVO,'+
      ' H.IDDEPENDENTE,'+
      ' H.IDCONTASS'+

      ' FROM'+
      ' HSTCONTRIBASS H,'+
      ' PESSOA P,'+
      ' PESSOA PJ,'+
      ' PESSOA PR,'+
      ' PESSOA PD,'+
      ' PLANASS PA,'+
      ' ELEGPATRO EP,'+
      ' CONTRIBUICAO C,'+
      // Hugo Luna Pendência 26570 - Inicio
      ' PARTPREVPLAN  PP,'+
      ' SITPART       S,'+
      ' FUNDACAO      FD'+
      // Hugo Luna Pendência 26570 - Fim
      ' WHERE';

     If Not CmpRptCM.ParamValues[0].IsNull Then
      sSql := sSql+' (H.MESCOBRANCA = '+ Chr(39) +
       CmpRptCM.ParamValues[0].AsString + Chr(39)+ ') AND '
     else Exit;

     If Not CmpRptCM.ParamValues[1].IsNull Then
      sSql := sSql+' (H.IDPESSJUR = '+ Chr(39) +
       CmpRptCM.ParamValues[1].AsString + Chr(39)+ ') AND ';

     //inicio  TAVARES 16/05/2003 RESOLUÇÃO DA PENDÊNCIA 13982
     If Not CmpRptCM.ParamValues[2].IsNull Then
      sSql := sSql + ' (H.SITRECEBIMENTO = '+ Chr(39) +
       CmpRptCM.ParamValues[2].AsString + Chr(39)+ ') AND '
     else
       sSql := sSql +  ' (H.SITRECEBIMENTO IN (0,1,2,3,4)) AND ';
    //fim TAVARES 16/05/2003 RESOLUÇÃO DA PENDÊNCIA 13982


     sSql:=sSql+
      ' (H.IDTITULAR = P.IDPESSOA) AND'+
      ' (H.IDPESSJUR = PJ.IDPESSOA) AND'+
      ' (H.IDPLANASS = PA.IDPLANASS) AND'+
      ' (H.IDTITULAR = EP.IDPESSOA ) AND'+
      ' (H.IDPESSJUR = EP.IDPESSJUR) AND'+
      // FERNANDO P.15171 - INICIO
      //' (EP.IDESTAB  = PR.IDPESSOA) AND'+
      ' (EP.IDESTAB  = PR.IDPESSOA(+)) AND'+
      // FERNANDO P.15171 - FIM
      ' (H.IDDEPENDENTE = PD.IDPESSOA) AND'+
      ' (H.IDCONTASS = C.IDCONTRIBUICAO)'+
      // Hugo Luna Pendência 26570 - Inicio
      ' AND (H.IDPLANOPREV  = PP.IDPLANOPREV)'+
      ' AND (H.IDPESSJUR    = PP.IDPESSJUR)'+
      ' AND (H.IDTITULAR    = PP.IDPESSOA)'+
      ' AND (S.IDSITPART    = PP.IDSITPART)'+
      ' AND (FD.IDPESSOA    = FD.IDPESSOA)';

      Case CmpRptCM.ParamValues[3].Value of
        (* Cobrança em Folha de Pagamento da Patrocinadora *)
        0 : sSql:=sSql+' AND (S.FLGINTERNO = ''AT'') AND (H.IDPESSJUR <> FD.IDPESSOA) AND (H.FLGCOBCARNE  = 0) ';
        (* Cobrança em Folha de Pagamento da Fundação *)
        1 : sSql:=sSql+' AND (S.FLGINTERNO = ''AT'') AND (H.IDPESSJUR = FD.IDPESSOA) AND (H.FLGCOBCARNE  = 0) ';
        (* Cobrança Bancária *)
        2: sSql:=sSql+' AND (H.FLGCOBCARNE  = 1) ';
        (* Cobranca em Folha de Benefícios *)
        3 : sSql:=sSql+' AND (S.FLGINTERNO = ''AS'') AND (H.FLGCOBCARNE  = 2) ';
      end;
      // Hugo Luna Pendência 26570 - Fim

      sSql:=sSql+' ORDER BY  PJ.NOME, P.NOME';

    Sql.Clear;
    Sql.Add(sSql); 
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;

end;

procedure TRptVlReceb.CrmRptCMChangeDataBaseName(Sender: TObject;
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
  ChangeDataBaseName([QryRptCM,QryAlterador,QryFundacao],sDataBaseName);
end;

procedure TRptVlReceb.CrmRptCMChangeConnectionType(Sender: TObject;
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
              DspAlterador.Dataset := QryAlterador;
            end;
    cntADO: begin
              Dsp.DataSet := aQryRptCM;
              DspFundacao.DataSet :=aQryFundacao;
              DspAlterador.DataSet :=aQryAlterador;
            end;

    cntIB: ;
    cntDOA: ;
  End;
end;

procedure TRptVlReceb.CrmRptCMChangeConnection(Sender: TObject;
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
  AQryAlterador.Connection := Connection;
end;

procedure TRptVlReceb.ppDBTextTitularPrint(Sender: TObject);
begin
  inherited;
 iTotal:=iTotal+1;
end;

procedure TRptVlReceb.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptVlReceb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CloseQry;
end;

procedure TRptVlReceb.rpDBTextPlanoPrint(Sender: TObject);
//Var sSql: String;
begin
  inherited;
  (*
  With QryAlterador do
  begin
    Close;
    sSql:='SELECT TIPO.DESCRICAO AS DESCRICAO,'+
          ' HA.VLRALTERADOR AS VALORALTERADOR'+
          ' FROM   HSTATRASOCONTASS HA,'+
          ' TIPOALTERADOR TIPO'+
          ' WHERE'+
          ' (HA.SEQPROPOSTA  = '+QryRptCm.FieldByName('SEQPROPOSTA').AsString+') AND'+
          ' (HA.MES          = '+QryRptCm.FieldByName('MES').AsString+') AND'+
          ' (HA.IDMOTIVO     = '+QryRptCm.FieldByName('IDMOTIVO').AsString+') AND'+
          ' (HA.IDPLANASS    = '+QryRptCm.FieldByName('IDPLANASS').AsString+') AND'+
          ' (HA.IDPLANOPREV  = '+QryRptCm.FieldByName('IDPLANOPREV').AsString+') AND'+
          ' (HA.IDPESSJUR    = '+QryRptCm.FieldByName('IDPESSJUR').AsString+') AND'+
          ' (HA.IDTITULAR    = '+QryRptCm.FieldByName('IDTITULAR').AsString+') AND'+
          ' (HA.IDDEPENDENTE = '+QryRptCm.FieldByName('IDDEPENDENTE').AsString+') AND'+
          ' (HA.IDCONTASS    = '+QryRptCm.FieldByName('IDCONTASS').AsString+') AND'+
          ' (HA.CODALTERADOR = TIPO.CODALTERADOR';

    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryAlterador.Sql.Assign(Sql);
  end; *)
end;

procedure TRptVlReceb.rpDBTextSituacaoPrint(Sender: TObject);
begin
  inherited;
  With rpDbTextSituacao do
   If Text<>'RECEBIDA' then Color:=clSilver
    else Color:=clWhite;
end;

end.


