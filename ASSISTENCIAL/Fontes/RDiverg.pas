unit RDiverg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  ppStrtch, ppSubRpt;

type
  TRptDiverg = class(TFrmCmReport)
    PpRptCM: TppBDEPipeline;
    DsRptCM: TwwDataSource;
    Cds: TClientDataSet;
    Dsp: TDataSetProvider;
    QryRptCM: TwwQuery;
    AQryFundacao: TADOQuery;
    ppFundacao: TppBDEPipeline;
    ppFundacaoppField1: TppField;
    ppFundacaoppField2: TppField;
    ppFundacaoppField3: TppField;
    ppFundacaoppField4: TppField;
    ppFundacaoppField5: TppField;
    ppFundacaoppField6: TppField;
    ppFundacaoppField7: TppField;
    ppFundacaoppField8: TppField;
    ppFundacaoppField9: TppField;
    ppFundacaoppField10: TppField;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    DspFundacao: TDataSetProvider;
    CdsFundacao: TClientDataSet;
    aQryRptCm: TADOQuery;
    RpDiverg: TppReport;
    ppHeaderBand12: TppHeaderBand;
    Titulo: TppLabel;
    rpdivergerecebimentoLine7: TppLine;
    rpdivergerecebimentoLabel13: TppLabel;
    rpdivergerecebimentoDBText6: TppDBText;
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
    ppDetailBand12: TppDetailBand;
    rpdivergerecebimentoDBText9: TppDBText;
    rpdivergerecebimentoDBText10: TppDBText;
    rpdivergerecebimentoDBText13: TppDBText;
    rpdivergerecebimentoDBText14: TppDBText;
    rpdivergerecebimentoDBText15: TppDBText;
    rpdivergerecebimentoDBText16: TppDBText;
    rpdivergerecebimentoSubReport1: TppSubReport;
    rpdivergerecebimentoChildReport1: TppChildReport;
    rpdivergerecebimentoChildReport1TitleBand1: TppTitleBand;
    rpdivergerecebimentoChildReport1Label1: TppLabel;
    rpdivergerecebimentoChildReport1DetailBand1: TppDetailBand;
    rpdivergerecebimentoChildReport1DBText1: TppDBText;
    rpdivergerecebimentoChildReport1DBText2: TppDBText;
    rpdivergerecebimentoChildReport1SummaryBand1: TppSummaryBand;
    rpdivergerecebimentoChildReport1Label2: TppLabel;
    totalAlterador: TppDBCalc;
    rpdivergerecebimentoDBText17: TppDBText;
    rpdivergerecebimentoDBText18: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLabelSistema: TppLabel;
    ppLine20: TppLine;
    ppCalc23: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    rpdivergerecebimentoSummaryBand1: TppSummaryBand;
    rpdivergerecebimentoShape1: TppShape;
    rpdivergerecebimentoLabel1: TppLabel;
    rpdivergerecebimentoDBCalc7: TppDBCalc;
    rpdivergerecebimentoDBCalc8: TppDBCalc;
    rpdivergerecebimentoLabel17: TppLabel;
    rpdivergerecebimentoLabel18: TppLabel;
    rpdivergerecebimentoDBCalc12: TppDBCalc;
    rpdivergerecebimentoLabel19: TppLabel;
    Alteradores: TppLabel;
    totalt: TppLabel;
    rpdivergerecebimentoGroup1: TppGroup;
    rpdivergerecebimentoGroupHeaderBand1: TppGroupHeaderBand;
    rpdivergerecebimentoLabel2: TppLabel;
    rpdivergerecebimentoDBText8: TppDBText;
    rpdivergerecebimentoGroupFooterBand1: TppGroupFooterBand;
    rpdivergerecebimentoLabel16: TppLabel;
    rpdivergerecebimentoDBCalc5: TppDBCalc;
    rpdivergerecebimentoDBCalc6: TppDBCalc;
    rpdivergerecebimentoLine4: TppLine;
    rpdivergerecebimentoLine6: TppLine;
    rpdivergerecebimentoDBCalc11: TppDBCalc;
    rpdivergerecebimentoGroup2: TppGroup;
    rpdivergerecebimentoGroupHeaderBand2: TppGroupHeaderBand;
    rpdivergerecebimentoLabel3: TppLabel;
    rpdivergerecebimentoDBText7: TppDBText;
    rpdivergerecebimentoGroupFooterBand2: TppGroupFooterBand;
    rpdivergerecebimentoLabel15: TppLabel;
    rpdivergerecebimentoDBCalc3: TppDBCalc;
    rpdivergerecebimentoDBCalc4: TppDBCalc;
    rpdivergerecebimentoLine3: TppLine;
    rpdivergerecebimentoDBCalc10: TppDBCalc;
    rpdivergerecebimentoGroup3: TppGroup;
    rpdivergerecebimentoGroupHeaderBand3: TppGroupHeaderBand;
    rpdivergerecebimentoDBText11: TppDBText;
    rpdivergerecebimentoLabel5: TppLabel;
    rpdivergerecebimentoLabel6: TppLabel;
    rpdivergerecebimentoLabel7: TppLabel;
    rpdivergerecebimentoLabel8: TppLabel;
    rpdivergerecebimentoLabel9: TppLabel;
    rpdivergerecebimentoLabel10: TppLabel;
    rpdivergerecebimentoLabel11: TppLabel;
    rpdivergerecebimentoLabel12: TppLabel;
    rpdivergerecebimentoLine1: TppLine;
    rpdivergerecebimentoLine2: TppLine;
    rpdivergerecebimentoLabel21: TppLabel;
    rpdivergerecebimentoGroupFooterBand3: TppGroupFooterBand;
    rpdivergerecebimentoDBCalc1: TppDBCalc;
    rpdivergerecebimentoDBCalc2: TppDBCalc;
    rpdivergerecebimentoLabel14: TppLabel;
    rpdivergerecebimentoLine5: TppLine;
    rpdivergerecebimentoDBCalc9: TppDBCalc;
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
    QryRptCMMES: TStringField;
    QryRptCMMESCOBRANCA: TStringField;
    QryRptCMMATRICULA: TFloatField;
    QryRptCMPARTICIP: TStringField;
    QryRptCMPATRO: TStringField;
    QryRptCMPLANOASSIS: TStringField;
    QryRptCMREGIONAL: TStringField;
    QryRptCMDEPENDENTE: TStringField;
    QryRptCMCONTRIBUICAO: TStringField;
    QryRptCMVALORESPERADO: TFloatField;
    QryRptCMVALORRECEBIDO: TFloatField;
    QryRptCMDIFERENCA: TFloatField;
    QryRptCMSITRECEBIMENTO: TStringField;
    QryRptCMSITUACAO: TStringField;
    QryRptCMSEQPROPOSTA: TFloatField;
    QryRptCMMESCOBRANCA_1: TStringField;
    QryRptCMMES_1: TStringField;
    QryRptCMIDTITULAR: TFloatField;
    QryRptCMIDPLANOPREV: TFloatField;
    QryRptCMIDPLANASS: TFloatField;
    QryRptCMIDPESSJUR: TFloatField;
    QryRptCMIDMOTIVO: TFloatField;
    QryRptCMIDDEPENDENTE: TFloatField;
    QryRptCMIDCONTASS: TFloatField;
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
    procedure rpdivergerecebimentoDBText14Print(Sender: TObject);
  private
    { Private declarations }
    Procedure CloseQry;

  public
    { Public declarations }
  end;

var
  RptDiverg: TRptDiverg;
  iTotal: Integer;

implementation


Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptDiverg.CloseQry;
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

procedure TRptDiverg.CrmRptCMBeforePrint(Sender: TObject);
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
      ' DECODE(H.SITRECEBIMENTO,1,''NAO ESPERADOR'','+
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
      ' CONTRIBUICAO C'+
      ' WHERE';

     If Not CmpRptCM.ParamValues[0].IsNull Then
      sSql := sSql+' (H.MES = '+ Chr(39) +
       CmpRptCM.ParamValues[0].AsString + Chr(39)+ ') AND'
     else Exit;

     sSql:=sSql+
      ' (H.SITRECEBIMENTO IN (1,3,4)) AND'+ {}{colocar tambem o 0 caso for teste}
      ' (H.IDTITULAR = P.IDPESSOA) AND'+
      ' (H.IDPESSJUR = PJ.IDPESSOA) AND'+
      ' (H.IDPLANASS = PA.IDPLANASS) AND'+
      ' (H.IDTITULAR = EP.IDPESSOA ) AND'+
      ' (H.IDPESSJUR = EP.IDPESSJUR) AND'+
      ' (EP.IDESTAB  = PR.IDPESSOA) AND'+
      ' (H.IDDEPENDENTE = PD.IDPESSOA) AND'+
      ' (H.IDCONTASS = C.IDCONTRIBUICAO)'+
      ' ORDER BY  PJ.NOME, PR.NOME, P.NOME';

    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;

end;

procedure TRptDiverg.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptDiverg.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptDiverg.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptDiverg.ppDBTextTitularPrint(Sender: TObject);
begin
  inherited;
 iTotal:=iTotal+1;
end;

procedure TRptDiverg.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptDiverg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CloseQry;
end;

procedure TRptDiverg.rpdivergerecebimentoDBText14Print(Sender: TObject);
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

end.


