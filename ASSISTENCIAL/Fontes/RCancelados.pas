unit RCancelados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  {$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};


type
  TRptCancelados = class(TFrmCmReport)
    RpCancel: TppReport;
    ppHeaderBand23: TppHeaderBand;
    ppLine34: TppLine;
    ppLine36: TppLine;
    ppLabelTituloSeg: TppLabel;
    ppDetailBand21: TppDetailBand;
    ppDBText195: TppDBText;
    ppDBTextTitular: TppDBText;
    ppDBText197: TppDBText;
    ppDBText199: TppDBText;
    ppFooterBand21: TppFooterBand;
    ppLabelSistema: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand5: TppSummaryBand;
    ppLabelTotalT: TppLabel;
    ppGroup14: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppLabel120: TppLabel;
    ppDBText198: TppDBText;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppLabel112: TppLabel;
    ppLabel118: TppLabel;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppLabelTotal: TppLabel;
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
    procedure RpCancelBeforePrint(Sender: TObject);
    procedure ppLabelTotalTPrint(Sender: TObject);
    procedure ppLabelTotalPrint(Sender: TObject);
  private
    { Private declarations }
    Procedure CloseQry;

  public
    { Public declarations }
  end;

var
  RptCancelados: TRptCancelados;
  iTotal,
  iTotalPatro : Integer;

implementation

Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptCancelados.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptCancelados.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSql :String;
begin
  inherited;
  iTotal:=0;
  iTotalPatro:=0;
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
       ' PT.NOME AS TITULAR,'+
       ' PJ.NOME AS PATROCINADORA,'+
//     ' EL.MATRICULA AS MATRICULA,'+
       ' SA.DESCRICAO, PP.INSCRICAONUMERO, BE.DTCANCELAMENTO'+
       ' FROM'+
       ' PESSOA PT,'+
       ' PESSOA PJ,'+
       ' PARTPREVPLAN    PP,'+ 
//     ' ELEGPATRO       EL,'+
       ' PARTASS         PA,'+ 
       ' BENEFASS        BE,'+ 
       ' SITPLANOPREV    SP,'+ 
       ' SITPLANOASS     SA '+ 
       ' WHERE'+
      (* JOIN PESSOA COM PARTASS *)
       ' (PT.IDPESSOA=PA.IDPESSOA) AND'+ 
       ' (PT.IDPESSOA=PT.IDPESSOA) AND'+
       ' (PA.IDPESSJUR=PJ.IDPESSOA) AND'+
      
      (* JOIN PARTPREVPLAN COM PARTASS *)
       ' (PP.IDPESSJUR      = PA.IDPESSJUR)      AND'+
       ' (PP.IDPESSOA       = PA.IDPESSOA)       AND'+
       ' (PP.IDPLANOPREV    = PA.IDPLANOPREV)    AND'+
       ' (PP.SEQPROPOSTA    = PA.SEQPROPOSTA)    AND'+
                                                        {}
//     ' (PT.IDPESSOA       = EL.IDPESSOA)       AND'+ {ACERTAR QRY COLOCANDO MATRICULA, TAMBEM NO RELATORIO}
       
      (* JOIN BENEFASS COM PARTASS *)
       ' (BE.IDTITULAR      = PA.IDPESSOA)       AND'+
       ' (BE.IDPESSJUR      = PA.IDPESSJUR)      AND'+
       ' (BE.IDPLANOPREV    = PA.IDPLANOPREV)    AND'+
       ' (BE.IDPLANASS      = PA.IDPLANASS)      AND'+
       ' (BE.IDDEPENDENTE   = BE.IDDEPENDENTE)   AND'+
       ' (BE.SEQPROPOSTA    = PA.SEQPROPOSTA)    AND'+

      (* JOIN SITPLANOPREV COM PARTPREVPLAN *)
       ' (SP.IDSITPLANOPREV = PP.IDSITPLANOPREV) AND'+
       ' (SP.FLGINTERNO     IN (''DE'',''CA'',''CI'')) AND'+
       
      (* JOIN SITPLANOASS COM PARTASS *)
       ' (SA.IDSITPLANOASS = PA.IDSITPART) AND'+
       ' (SA.FLGINTERNO  NOT  IN (''CA'',''CI''))'+   {NOT PARA TESTE}   

       ' ORDER BY PATROCINADORA, TITULAR';

    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;

end;

procedure TRptCancelados.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptCancelados.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptCancelados.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptCancelados.ppDBTextTitularPrint(Sender: TObject);
begin
  inherited;
  Inc(iTotal,1);
  Inc(iTotalPatro,1);
end;

procedure TRptCancelados.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptCancelados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseQry;
end;

procedure TRptCancelados.RpCancelBeforePrint(Sender: TObject);
begin
  inherited;
  iTotal:=0;
end;

procedure TRptCancelados.ppLabelTotalTPrint(Sender: TObject);
begin
  inherited;
  ppLabelTotalT.Caption:='Total de Segurados => '+IntToStr(ITotal);
  iTotal:=0;
end;

procedure TRptCancelados.ppLabelTotalPrint(Sender: TObject);
begin
  inherited;
  ppLabelTotal.Caption:='Total da Patrocinadora => '+IntToStr(ITotalPatro);
  iTotalPatro:=0;
end;

end.
