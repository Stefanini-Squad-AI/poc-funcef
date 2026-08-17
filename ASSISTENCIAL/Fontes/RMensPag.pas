unit RMensPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  {$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptMensPag = class(TFrmCmReport)
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
    rpMensPag: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    rpRelaMensPagMesLabel1: TppLabel;
    rpRelaMensPagMesLabel2: TppLabel;
    rpRelaMensPagMesLabel4: TppLabel;
    rpRelaMensPagMesLabel5: TppLabel;
    rpRelaMensPagMesLabel6: TppLabel;
    rpRelaMensPagMesLabel7: TppLabel;
    rpRelaMensPagMesLabel8: TppLabel;
    rpRelaMensPagMesLine1: TppLine;
    rpRelaMensPagMesLabel9: TppLabel;
    rpRelaMensPagMesLabel10: TppLabel;
    rpRelaMensPagMesDBText8: TppDBText;
    rpRelaMensPagMesDBText9: TppDBText;
    rpRelaMensPagMesLabel3: TppLabel;
    rpRelaMensPagMesDBText10: TppDBText;
    ppDBImage5: TppDBImage;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppLabel2: TppLabel;
    ppDBText77: TppDBText;
    ppDetailBand1: TppDetailBand;
    rpRelaMensPagMesDBText1: TppDBText;
    rpRelaMensPagMesDBText2: TppDBText;
    rpRelaMensPagMesDBText3: TppDBText;
    rpRelaMensPagMesDBText4: TppDBText;
    rpRelaMensPagMesDBText5: TppDBText;
    rpRelaMensPagMesDBText6: TppDBText;
    rpRelaMensPagMesDBText7: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabelSistema: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    rpRelaMensPagMesGroup1: TppGroup;
    rpRelaMensPagMesGroupHeaderBand1: TppGroupHeaderBand;
    rpRelaMensPagMesGroupFooterBand1: TppGroupFooterBand;
    rpRelaMensPagMesLabel11: TppLabel;
    rpRelaMensPagMesDBCalc1: TppDBCalc;
    rpRelaMensPagMesDBCalc2: TppDBCalc;
    rpRelaMensPagMesDBCalc3: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine1: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure CloseQry;
   
  public
    { Public declarations }
  end;

var
  RptMensPag: TRptMensPag;
  
implementation


Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptMensPag.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptMensPag.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSql :String;
begin
  inherited;
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
	    ' TD.INSCRICAONUMERO AS INSCRICAO,'+
       ' TD.MESREFERENCIA AS REFERENCIA,'+
       ' TD.MATRICULA AS MATRICULA,'+
       ' P.NOME AS NOME,'+
       ' TD.CODPROVDESC AS RUBRICA,'+
       ' TD.VALOR AS VALORCMD,'+
       ' TD.VALORRECEBIDO AS VALORREC,'+
       ' FL.DESCFILIAL AS FILIAL,'+
       ' (TD.VALOR - TD.VALORRECEBIDO)  AS DIFERENCA,'+
       ' PJ.NOME AS PATROCINADORA'+
       
       ' FROM'+
       ' TMPDESC TD,'+
       ' PESSOA P,'+
       ' ELEGPATRO EP,'+
       ' FILIAL FL,'+
       ' PESSOA PJ'+              

       ' WHERE'+
       ' (TD.FLGTIPODESC = ''A'') AND'+
       ' (TD.FLGDESCFOLHA IN (''P'',''B'')) AND';
     If Not CmpRptCM.ParamValues[0].IsNull Then
       sSql := sSql+' (TD.MESREFERENCIA = '+ Chr(39) +
        CmpRptCM.ParamValues[0].AsString + Chr(39)+ ') AND';

     sSql:=sSql+
       ' (TD.IDPESSJUR = EP.IDPESSJUR) AND'+
       ' (TD.IDTITULAR = EP.IDPESSOA) AND'+
       ' (TD.IDPESSJUR = PJ.IDPESSOA) AND'+
       ' (EP.IDESTAB = FL.IDFILIAL(+)) AND'+
       ' (TD.IDPESSOA = P.IDPESSOA)'+
       ' ORDER BY PATROCINADORA, P.NOME, TD.CODPROVDESC';
    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;

end;

procedure TRptMensPag.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptMensPag.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptMensPag.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptMensPag.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptMensPag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CloseQry;
end;

end.
