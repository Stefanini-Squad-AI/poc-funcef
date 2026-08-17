unit RSegurados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  StdCtrls;

type
  TRptSegurados = class(TFrmCmReport)
    RpSeg: TppReport;
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
    QryRptCMTITULAR: TStringField;
    QryRptCMPATROCINADORA: TStringField;
    QryRptCMPLANO: TStringField;
    QryRptCMDATAENTRADA: TDateTimeField;
    QryRptCMDATACANCELAMENTO: TDateTimeField;
    QryRptCMMATRICULA: TStringField;
    QryRptCMINSCRICAO: TFloatField;
    QryRptCMDATAINSCRICAO: TDateTimeField;
    QryRptCMFLGINTERNO: TStringField;
    QryRptCMSITPARTICIPANTE: TStringField;
    qryRegraIn: TwwQuery;
    DspRegraIn: TDataSetProvider;
    CdsRegraIn: TClientDataSet;
    DsRegraIn: TwwDataSource;
    AQryRegraIn: TADOQuery;
    QryRptCMIDPESSOA: TFloatField;
    QryRptCMIDDEPENDENTE: TFloatField;
    QryRptCMIDPESSJUR: TFloatField;
    QryRptCMIDPLANOPREV: TFloatField;
    QryRptCMIDPLANASS: TFloatField;
    QryRptCMSITUACAO: TStringField;
    ppSegurados: TppBDEPipeline;
    ppHeaderBand23: TppHeaderBand;
    ppLine34: TppLine;
    ppDBImage19: TppDBImage;
    ppDBText187: TppDBText;
    ppDBText188: TppDBText;
    ppDBText189: TppDBText;
    ppDBText190: TppDBText;
    ppLabel113: TppLabel;
    ppDBText191: TppDBText;
    ppDBText192: TppDBText;
    ppDBText193: TppDBText;
    ppDBText194: TppDBText;
    ppDetailBand21: TppDetailBand;
    ppDBText195: TppDBText;
    ppDBTextTitular: TppDBText;
    ppDBText199: TppDBText;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    ppVarPremio: TppVariable;
    ppFooterBand21: TppFooterBand;
    ppLabelSistema: TppLabel;
    ppSVarSistema: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppSummary: TppSummaryBand;
    ppGroup14: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppLabel120: TppLabel;
    ppDBText198: TppDBText;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppLabel118: TppLabel;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppLabel2: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel5: TppLabel;
    ppVarTotalPremios: TppVariable;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
    procedure FormCreate(Sender: TObject);
    procedure ppVarPremioCalc(Sender: TObject; var Value: Variant);
  private
    { Private declarations }
    Procedure CloseQry;
    Procedure CalculaContribuicao;

  public
    { Public declarations }
  end;

var
  RptSegurados: TRptSegurados;

implementation

Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptSegurados.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

Function TRptSegurados.SqlRegra:String;
Var sSql: String;
begin
  sSql:=
  'SELECT
  ' QRYDEPLEGAL.HAVEDEPLEGAL, PB.IDPESSOA, PB.NUMDOCUMENTO, PFB.DATANASC, PFB.SEXO,'+
  ' PFB.ESTCIVIL, PFB.DATAMORTE,'+
  ' DT.IDDEPENDENCIA, DT.IDTITULAR, DT.IDPESSOA, D.IDSITDEPENDENTE, BA.IDPLANASS,'+
  ' BA.IDPLANOPREV, BA.IDPESSJUR, BA.SEQPROPOSTA, BA.DATAENTRADA,'+
  ' TO_CHAR(BA.DATAENTRADA,''YYYY/MM'') MESENTRADA, PA.FLGINSCRICAOCANC, PA.INSCRICAONUMERO,'+
  ' PA.DATACANCELAMENTO, PA.FLGPARTBENEF, PT.FLGFUNCIONARIO, EP.MATRICULA, EP.DATAADMISSAO,'+
  ' EP.NIVEL, EP.TEMPOSERVANTERIOR, EP.TEMPONAOCREDITADO, EP.TEMPOSERVANTREAL,'+
  ' EP.TEMPOSITESPECIAL, EP.VALORBASE1, EP.VALORBASE2, EP.VALORBASE3, EP.NIVEL,'+
  ' :MESREF MESREF, PPP.SALPARTICIPACAO,'+
  ' PPP.SALMANTIDO, NVL(QRYBENEF.SALBENEFICIO,0) SALBENEFICIO, EP.SALREFERENCIA,'+
  ' EP.IDSITFUNC, EP.DATADEMISSAO, PPP.IDSITPART, S.FLGINTERNO, F.SALARIOATUAL, DT.FLGDEPLEGAL,'+
  ' BA.RESPONSAVELPAG, PA.OPCAOA, PA.OPCAOB'+
  ' FROM'+
  ' PESSOA PB, PESSOAFISICA PFB, DEPENTIT DT, DEPENDENTE D, SITDEPENDENTE SD, BENEFASS BA,'+
  ' PARTASS PA, ELEGPATRO EP, PESSOA PT, PARTPREVPLAN PPP, SITPART S, FUNCIONARIO F,'+
  ' (SELECT BF.IDPLANOPREV, BF.IDTITULAR, BF.IDPESSJUR, SUM(BF.VALORATUAL) SALBENEFICIO'+
  '  FROM BENEFBFCIARIO BF'+
  ' WHERE (BF.IDTITULAR   = :IDTITULAR)'+
  ' AND (BF.IDPLANOPREV = :IDPLANOPREV)'+
  ' AND (BF.IDPESSJUR   = :IDPESSJUR)'+
  (* Filtro para pegar apenas os benefícios com situação NORMAL *)
  '   AND (BF.IDSITBENEFICIO = 1)'+
  (* Filtro para pegar apenas os benefícios diferentes de resgate *)
  '  AND (BF.IDBENEFICIO NOT IN (20))'+
  'GROUP BY BF.IDPLANOPREV, BF.IDTITULAR, BF.IDPESSJUR, BF.IDPESSOA) QRYBENEF,'+

  ' (SELECT B.IDTITULAR, B.IDPLANASS, QRY.HAVEDEPLEGAL'+
  '  FROM BENEFASS B,'+
  '     (SELECT DECODE(COUNT(*),0,0,1,0,1) AS HAVEDEPLEGAL'+
  '      FROM PESSOAFISICA PF, DEPENTIT D, BENEFASS B'+
  '        WHERE PF.IDPESSOA  = PF.IDPESSOA AND'+
  '              D.IDTITULAR = :IDTITULAR AND'+
  '              D.IDPESSOA = PF.IDPESSOA AND'+
  '              B.IDTITULAR = D.IDTITULAR AND'+
  '              B.IDPLANASS    = :IDPLANASS AND'+
  '              B.IDDEPENDENTE = D.IDPESSOA  AND'+
  '              B.DTCANCELAMENTO IS NULL AND'+
  '              ( ( D.IDDEPENDENCIA = ''PRP'' OR  D.IDDEPENDENCIA = ''COM''  OR  D.IDDEPENDENCIA= ''COP'') OR'+
  '                ( D.IDDEPENDENCIA = ''FIL''  AND TRUNC((SYSDATE - PF.DATANASC)/365.5) <= 24 )'+
  '              )'+
  '     ) QRY'+
  '  WHERE B.IDDEPENDENTE = :IDDEPENDENTE AND'+
  '        B.IDTITULAR    = :IDTITULAR    AND'+
  '        B.IDPLANASS    = :IDPLANASS'+
  ' ) QRYDEPLEGAL'+

  'WHERE'+
  ' (BA.IDTITULAR    = :IDTITULAR) AND'+
  ' (BA.IDDEPENDENTE = :IDDEPENDENTE) AND'+
  ' (BA.IDPESSJUR    = :IDPESSJUR) AND'+
  ' (BA.IDPLANOPREV  = :IDPLANOPREV) AND'+
  ' (BA.IDPLANASS    = :IDPLANASS) AND'+
  ' (BA.IDTITULAR    = F.IDPESSOA(+)) AND'+
  ' (BA.IDTITULAR    = DT.IDTITULAR) AND'+
  ' (BA.IDDEPENDENTE = DT.IDPESSOA) AND'+
  '(BA.IDTITULAR    = PPP.IDPESSOA) AND'+
  ' (BA.IDPLANOPREV  = PPP.IDPLANOPREV) AND'+
  ' (BA.IDPESSJUR    = PPP.IDPESSJUR) AND'+
  ' (PPP.IDSITPART   = S.IDSITPART) AND'+
  ' (BA.IDTITULAR    = QRYBENEF.IDTITULAR(+)) AND'+
  ' (BA.IDPLANOPREV  = QRYBENEF.IDPLANOPREV(+)) AND'+
  ' (BA.IDPESSJUR    = QRYBENEF.IDPESSJUR(+)) AND'+
  ' (BA.IDTITULAR    = QRYDEPLEGAL.IDTITULAR(+)) AND'+
  ' (BA.IDPLANASS    = QRYDEPLEGAL.IDPLANASS(+)) AND'+

  ' (BA.IDDEPENDENTE = PFB.IDPESSOA) AND'+
  ' (BA.IDDEPENDENTE = D.IDPESSOA) AND'+
  ' (D.IDSITDEPENDENTE = SD.IDSITDEPENDENTE(+)) AND'+
  ' (BA.IDDEPENDENTE = PB.IDPESSOA) AND'+
  ' (BA.IDPESSJUR   = PA.IDPESSJUR(+)) AND'+
  ' (BA.SEQPROPOSTA = PA.SEQPROPOSTA(+)) AND'+
  ' (BA.IDPLANOPREV = PA.IDPLANOPREV(+)) AND'+
  ' (BA.IDTITULAR   = PA.IDPESSOA(+)) AND'+
  ' (BA.IDPLANASS   = PA.IDPLANASS(+)) AND'+
  ' (BA.IDTITULAR = PT.IDPESSOA) AND'+
  ' (BA.IDPESSJUR = EP.IDPESSJUR) AND'+
  ' (BA.IDTITULAR = EP.IDPESSOA)';
  SqlRegra:=sSql;
end;

Procedure TRptSegurados.CalculaContribuicao;
Var Regra: TRegra;
    ErroRegra: Boolean;
begin
  ErroRegra:=False;
  ValorCalculado:=0;

  Regra:=TRegra.Create(Nil);
  Regra.Activated:=False;
  Regra.DataBaseName:='BaseDados';
  Regra.queryIn:= qryRegraIn;

  qryRegraIn.Close;
  qryRegraIn.Sql.Clear;
  qryRegraIn.Sql.Add(SqlRegra);
  qryRegraIn.ParamByName('IDTITULAR').Value    := StrToIntDef(QryRptCM.FieldByName('IDTITULAR').AsString,0);
  qryRegraIn.ParamByName('IDDEPENDENTE').Value := StrToIntDef(QryRptCM.FieldByName('IDDEPENDENTE').AsString,0);
  qryRegraIn.ParamByName('IDPESSJUR').Value    := StrToIntDef(QryRptCM.FieldByName('IDPESSJUR').AsString,0);
  qryRegraIn.ParamByName('IDPLANOPREV').Value  := StrToIntDef(QryRptCM.FieldByName('IDPLANOPREV').AsString,0);
  qryRegraIn.ParamByName('IDPLANASS').Value    := StrToIntDef(QryRptCM.FieldByName('IDPLANASS').AsString,0);
  qryRegraIn.ParamByName('MESREF').Value       := Copy(DateToStr(Date),7,4)+'/'+Copy(DateToStr(Date),4,2);
  try
    qryRegraIn.Open;
    AQryRegraIn.Sql.Assign(qryRegraIn.Sql);
  except
    on E:Exception do ErroRegra:=True;
  end; {try..except}
  
  Regra.RuleName := qryIdRegra.FieldByName('IDREGRA').AsString;
  try
    Regra.Execute;
  except
    on E:Exception do ErroRegra:=True;
  end; {try..except}

  (* Verifica o valor de Resultado da Regra *)
  If regra.Result = 'N' then ErroRegra:=True
  else
  begin
    ppVarPremio.Value:= StrFloat(ClienteNumero(regra.Result),0);
    ppVarTotaPremios.Value:=ppVarTotaPremios.Value+ppVarPremio.Value;

  Regra.Activated:=False;
  Regra.Free;

  If ErroRegra then ppVarPremio.Value:=0;
end;


procedure TRptSegurados.CrmRptCMBeforePrint(Sender: TObject);
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

  With QryRptCM Do
  Begin
     If Active Then Close;

     sSql:=
          'SELECT'+
          ' PT.IDPESSOA,'+
          ' PT.IDPESSOA AS IDDEPENDENTE,'+
          ' PP.IDPESSJUR,'+
          ' PS.IDPLANOPREV,'+
          ' PS.IDPLANASS,'+
          ' PT.NOME AS TITULAR,'+
          ' PJ.NOME AS PATROCINADORA,'+
          ' PL.NOME AS PLANO,'+
          ' BF.DATAENTRADA,'+
          ' PS.DATACANCELAMENTO,'+
          ' EL.MATRICULA AS MATRICULA,'+
          ' PP.INSCRICAONUMERO AS INSCRICAO,'+
          ' PS.DATAENTRADA AS DATAINSCRICAO,'+
          ' SP.FLGINTERNO,'+
          ' ST.DESCRICAO AS SITUACAO,'+
          ' SP.DESCRICAO AS SITPARTICIPANTE'+

          ' FROM'+
          ' PESSOA PT,'+
          ' PESSOA PJ,'+
          ' PESSOAFISICA PF,'+
          ' PARTPREVPLAN PP,'+
          ' ELEGPATRO EL,'+
          ' PARTASS PS,'+
          ' BENEFASS BF,'+
          ' PLANASS PL,'+
          ' SITPART ST,'+
          ' SITPLANOASS SP'+

          ' WHERE'+

          ' (PT.IDPESSOA=PF.IDPESSOA) AND'+
          ' (PT.IDPESSOA=PT.IDPESSOA) AND'+
          ' (PT.IDPESSOA=PP.IDPESSOA) AND'+

          ' (PT.IDPESSOA=EL.IDPESSOA) AND'+
          ' (PT.IDPESSOA=BF.IDTITULAR) AND'+
          ' (PT.IDPESSOA=PS.IDPESSOA) AND';

          If Not CmpRptCM.ParamValues[0].IsNull Then
          begin
            ppSummary.Visible:=False;
            sSql := sSql+' (PJ.IDPESSOA='+CmpRptCM.ParamValues[0].AsString+') AND';
          end
          else Exit;

          sSql:=sSql+
          ' (PJ.IDPESSOA=PP.IDPESSJUR) AND'+
          ' (PJ.IDPESSOA=PJ.IDPESSOA) AND'+
          ' (PJ.IDPESSOA=EL.IDPESSJUR) AND'+
          ' (PJ.IDPESSOA=PS.IDPESSJUR) AND'+
          ' (PJ.IDPESSOA=BF.IDPESSJUR) AND'+

          ' (PP.IDPESSJUR=PS.IDPESSJUR)AND'+
          ' (PP.IDPESSOA=PP.IDPESSOA) AND'+
          ' (PP.IDPLANOPREV=PS.IDPLANOPREV) AND'+
          ' (PP.IDSITPART=ST.IDSITPART) AND'+

          ' (EL.IDPESSJUR=PS.IDPESSJUR) AND'+

          ' (PS.IDPESSOA=BF.IDTITULAR) AND'+

          ' (PS.IDSITPART=SP.IDSITPLANOASS) AND';

          If Not CmpRptCM.ParamValues[1].IsNull Then
            sSql := sSql+' (ST.IDSITPART='+CmpRptCM.ParamValues[1].AsString+') AND'

          else
            If Not CmpRptCM.ParamValues[2].IsNull Then
              sSql := sSql+' (SP.IDSITPLANOASS='+CmpRptCM.ParamValues[2].AsString+') AND';

          sSql:=sSql+

          ' (BF.IDPLANASS=PS.IDPLANASS) AND'+
          ' (BF.IDPLANASS=PL.IDPLANASS)'+

          ' ORDER BY PLANO, PATROCINADORA, TITULAR';
    Sql.Clear;
    Sql.Add(sSql);

    Open;
    AQryRptCM.Sql.Assign(Sql);

    If QryRptCM.FieldByName('FlgInterno').AsString<>'CA' then
    begin
      ppLabelDataCancel.Visible:=False;
      ppDbTextDataCancel.Visible:=False;
    end;
  End;

end;

procedure TRptSegurados.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptSegurados.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptSegurados.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptSegurados.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptSegurados.ppVarPremioCalc(Sender: TObject;
  var Value: Variant);
begin
  inherited;
  CalculaContribuicao;
end;

end.

(*
    SELECT
            PT.NOME AS TITULAR,
            PJ.NOME AS PATROCINADORA,
            PL.NOME AS PLANO,
            BF.DATAENTRADA,
            PS.DATACANCELAMENTO,
            EL.MATRICULA AS MATRICULA,
            PP.INSCRICAONUMERO AS INSCRICAO,
            PS.DATAENTRADA AS DATAINSCRICAO,
            SP.FLGINTERNO,
            ST.DESCRICAO AS SITUACAO,
            SP.DESCRICAO AS SITPARTICIPANTE

            FROM
            PESSOA PT,
            PESSOA PJ,
            PESSOAFISICA PF,
            PARTPREVPLAN PP,
            ELEGPATRO EL,
            PARTASS PS,
            BENEFASS BF,
            PLANASS PL,
            SITPART ST,
            SITPLANOASS SP

            WHERE

            (PT.IDPESSOA=PF.IDPESSOA) AND
            (PT.IDPESSOA=PT.IDPESSOA) AND
            (PT.IDPESSOA=PP.IDPESSOA) AND

            (PT.IDPESSOA=EL.IDPESSOA) AND
            (PT.IDPESSOA=BF.IDTITULAR) AND
            (PT.IDPESSOA=PS.IDPESSOA) AND

            (PJ.IDPESSOA=  1) AND

            (PJ.IDPESSOA=PP.IDPESSJUR) AND
            (PJ.IDPESSOA=PJ.IDPESSOA) AND
            (PJ.IDPESSOA=EL.IDPESSJUR) AND
            (PJ.IDPESSOA=PS.IDPESSJUR) AND
            (PJ.IDPESSOA=BF.IDPESSJUR) AND

            (PP.IDPESSJUR=PS.IDPESSJUR)AND
            (PP.IDPESSOA=PP.IDPESSOA) AND
            (PP.IDPLANOPREV=PS.IDPLANOPREV) AND
            (PP.IDSITPART=ST.IDSITPART) AND

            (EL.IDPESSJUR=PS.IDPESSJUR) AND

            (PS.IDPESSOA=BF.IDTITULAR) AND

            (PS.IDSITPART=SP.IDSITPLANOASS) AND

            (SP.IDSITPLANOASS='NO') AND

            (BF.IDPLANASS=PS.IDPLANASS) AND
            (BF.IDPLANASS=PL.IDPLANASS)

            ORDER BY PLANO, PATROCINADORA, TITULAR *)
