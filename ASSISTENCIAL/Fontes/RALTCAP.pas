unit RALTCAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  ppStrtch, ppSubRpt,{$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptAltCap = class(TFrmCmReport)
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
    RpAltCap: TppReport;
    ppHeaderBand12: TppHeaderBand;
    Titulo: TppLabel;
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
    rpdivergerecebimentoLabel6: TppLabel;
    ppLine2: TppLine;
    rpdivergerecebimentoDBText14: TppDBText;
    ppLine1: TppLine;
    ppDetailBand12: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppVarCapMN: TppVariable;
    ppVarCapMA: TppVariable;
    ppVarCapIP: TppVariable;
    ppVarPremioFxA: TppVariable;
    ppVarPremioFxB: TppVariable;
    ppVarPremioFxC: TppVariable;
    ppVarPremioFxD: TppVariable;
    ppDBText2: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLabelSistema: TppLabel;
    ppCalc23: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    ppLine14: TppLine;
    rpdivergerecebimentoSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel1: TppLabel;
    rpdivergerecebimentoDBText10: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel14: TppLabel;
    ppDBCalcTotPatro: TppDBCalc;
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

Type Str8 = String[8];

Var
  RptAltCap: TRptAltCap;

implementation

Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }

Function MesAnterior(Mes:Str8): Str8;
Var MM,AA,Erro: Integer;
    sSt       : Str8;
begin
  MM:=0;
  Val(Copy(Mes,1,4),AA,Erro);
  If Erro=0 then Val(Copy(Mes,6,2),MM,Erro);
  If Erro=0 then
  Case MM Of
    2..12: Dec(MM,1);
    1    : begin
             MM:=12;
             Dec(AA,1);
           end;
    else Erro:=1;
   end; {Case}
   Str(AA,sSt);
   Mes:=sSt+'/';
   Str(MM,sSt);
   If MM In [1..9] then sSt:='0'+sSt;
   Mes:=Mes+sSt;
   Result:=Mes;
end;

Procedure TRptAltCap.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptAltCap.CrmRptCMBeforePrint(Sender: TObject);
Var sSql: String;
    sMesAnt,
    sMesCob : String;
begin
  inherited;
  If Not CmpRptCM.ParamValues[0].IsNull Then
  begin
    sMesCob:=CmpRptCM.ParamValues[0].AsString;
    sMesAnt:=MesAnterior(sMesCob);
  end else Exit;

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
       'SELECT DISTINCT'+
       ' PS.NOME AS PARTICIPANTE,'+
       ' PJ.NOME AS PATROCINADORA,'+
       ' EL.MATRICULA,'+
       ' HT.MES AS MESREF,'+
       ' PD.NOME AS PRODUTO,'+
       ' PL.NOME AS PLANO,'+
       ' PL.OPCAOAIDENT,'+
       ' PA.NOME AS PLANOANTERIOR,'+
       ' CP.TIPOSEG,'+
       ' CP.CAPITALIP,'+
       ' CP.CAPITALMN,'+
       ' CP.CAPITALMA,'+
       ' CP.PREMIOFXA,'+
       ' CP.PREMIOFXB,'+
       ' CP.PREMIOFXC,'+
       ' CP.PREMIOFXD'+

       ' FROM'+
       ' PESSOA PS,'+
       ' PESSOA PJ,'+
       ' ELEGPATRO EL,'+
       ' PARTASS PT,'+
       ' HSTCONTRIBASS HT,'+
       ' HSTCONTRIBASS HA,'+
       ' PLANASS PL,'+
       ' PLANASS PA,'+
       ' PRODASS PD,'+
       ' SITPLANOASS ST,'+
       ' CAPSEGASS CP'+

       ' WHERE'+
       ' (PS.IDPESSOA  = PT.IDPESSOA) AND'+
       ' (PS.IDPESSOA  = HT. IDTITULAR) AND'+
       ' (EL.IDPESSOA  = PT.IDPESSOA) AND'+
       ' (PJ.IDPESSOA  = PT.IDPESSJUR) AND'+
       ' (PJ.IDPESSOA  = HT.IDPESSJUR) AND'+
       ' (HT.IDPLANASS = PL.IDPLANASS) AND'+
       ' (HT.MESCOBRANCA = '+Chr(39)+sMesCob+Chr(39)+') AND'+
       ' (PT.IDPLANASS = HT.IDPLANASS ) AND'+
       ' (PT.IDPESSOA  = HT.IDTITULAR) AND'+
       ' (PL.IDPRODASS=PD.IDPRODASS) AND'+
       ' (PT.IDSITPART=ST.IDSITPLANOASS) AND'+
       ' (PS.IDPESSOA=HA.IDTITULAR) AND'+
       ' (HA.IDPLANASS=PA.IDPLANASS) AND'+
       ' (HA.IDPLANASS<>HT.IDPLANASS) AND'+
       ' (HA.MESCOBRANCA = '+Chr(39)+sMesAnt+Chr(39)+') AND'+
       ' (ST.FLGINTERNO NOT IN (''CA'',''CI'')) AND'+
       ' (HT.IDPLANASS=CP.IDPLANASS) AND'+
       ' (CP.FLGVIGENCIA=''1'') AND'+
       ' (CP.TIPOSEG = ''TITULAR'')'+

       ' ORDER BY PATROCINADORA, PARTICIPANTE';

    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;
end;

procedure TRptAltCap.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptAltCap.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptAltCap.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptAltCap.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptAltCap.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CloseQry;
end;

end.
