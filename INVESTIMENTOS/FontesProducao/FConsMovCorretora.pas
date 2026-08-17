//******************************************************************************
// Data      : 27/04/2006
// Pendência : 21678
// SOL       : 36904
// Código    : AL_4
// Motivo    : Implementado o totalizador na tela
//******************************************************************************
// Data      : 30/03/2006
// Pendência :
// SOL       :
// Código    : AL_3
// Motivo    : Implementado na consulta o filtro de carteira gerencial para não dar
//             a duplicidade do resultado final.
//******************************************************************************
// Data      : 29/03/2006
// Pendência : 21266
// SOL       : 36904
// Código    : AL_2
// Motivo    : Novo form de eventos para o relatório FDMRelMapaCorret
//******************************************************************************
// Data      : 24/01/2006
// Pendência : 21266
// SOL       : 36904
// Código    : AL_1
// Motivo    : Implementação para buscar apenas as corretoras que movimentaram no período
//             Troca do componente TDBGrid pelo TwwwDBGrid;
//             Implementação da Data da Operação
//******************************************************************************

unit FConsMovCorretora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, DBGrids, Db,
  DBTables, Wwquery, Wwdbigrd, Wwdbgrid, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, Wwdatsrc, FPreview, fcLabel;

type
  TfrmConsMovCorretora = class(TfrmOkCancelar)
    QryCorretora: TwwQuery;
    QryCorretoraSGLCORRETVALORES: TStringField;
    QryCorretoraIDCORRETVALORES: TFloatField;
    bt_Imprime: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    QryMapaCorret: TwwQuery;
    QryMapaCorretIDCORRETVALORES: TFloatField;
    QryMapaCorretSGLCORRETVALORES: TStringField;
    QryMapaCorretTOTNEGRV: TFloatField;
    QryMapaCorretTOPOSRV: TFloatField;
    QryMapaCorretTOTLIQRV: TFloatField;
    QryMapaCorretVLROPERRV: TFloatField;
    QryMapaCorretPERCENTUAL: TFloatField;
    QryMapaCorretTOTCORRBMF: TFloatField;
    QryMapaCorretTOTDESPBMF: TFloatField;
    QryMapaCorretTOTAJNOR: TFloatField;
    QryMapaCorretTOTAJPOS: TFloatField;
    QryMapaCorretTOTOPERBMF: TFloatField;
    QryMapaCorretTOTAJUSTE: TFloatField;
    QryMapaCorretQTDORDBMF: TFloatField;
    QryMapaCorretQTDORDRV: TFloatField;
    QryMapaCorretPERCDEVRV: TFloatField;
    QryMapaCorretPERCDEVBMF: TFloatField;
    DsMapaCorret: TwwDataSource;
    qry: TwwQuery;
    ds: TwwDataSource;
    qryIDCORRETVALORES: TFloatField;
    qrySGLCORRETVALORES: TStringField;
    qryTOTNEGRV: TFloatField;
    qryTOPOSRV: TFloatField;
    qryTOTLIQRV: TFloatField;
    qryVLROPERRV: TFloatField;
    qryPERCENTUAL: TFloatField;
    qryTOTCORRBMF: TFloatField;
    qryTOTDESPBMF: TFloatField;
    qryTOTAJNOR: TFloatField;
    qryTOTAJPOS: TFloatField;
    qryTOTOPERBMF: TFloatField;
    qryTOTAJUSTE: TFloatField;
    qryQTDORDBMF: TFloatField;
    qryQTDORDRV: TFloatField;
    qryPERCDEVRV: TFloatField;
    qryPERCDEVBMF: TFloatField;
    pnlTitulo: TPanel;
    lbNomDescricao: TfcLabel;
    Panel1: TPanel;
    pnlConsulta: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    DbLkcCorretora: TwwDBLookupCombo;
    //Al_1
    dbgGrid: TwwDBGrid;
    qryDATAOPERACAO: TDateTimeField;
    //Al_1
    QryTotal: TwwQuery;
    dsTotal: TwwDataSource;
    QryTotalTOTNEGRV: TFloatField;
    QryTotalTOPOSRV: TFloatField;
    QryTotalTOTLIQRV: TFloatField;
    QryTotalVLROPERRV: TFloatField;
    QryTotalPERCENTUAL: TFloatField;
    QryTotalTOTCORRBMF: TFloatField;
    QryTotalTOTDESPBMF: TFloatField;
    QryTotalTOTAJNOR: TFloatField;
    QryTotalTOTAJPOS: TFloatField;
    QryTotalTOTOPERBMF: TFloatField;
    QryTotalTOTAJUSTE: TFloatField;
    QryTotalQTDORDBMF: TFloatField;
    QryTotalQTDORDRV: TFloatField;

    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure ConstroiQuery;
    procedure bt_ImprimeClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgGridUpdateFooter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsMovCorretora: TfrmConsMovCorretora;

implementation

uses UMensErro, FDmRelMapaCorret;

{$R *.DFM}

procedure TfrmConsMovCorretora.ConstroiQuery ;
var
   sSql,sCorretValores : string;
begin
   if Trim(edDataIni.Text) = '' then
   begin
      MsgDlg('Data de inicial inválida.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      //Al_1
      if edDataIni.CanFocus then
         edDataIni.SetFocus;
      Exit;
   end;

   if Trim(edDataFim.Text) = '' then
   begin
      MsgDlg('Data de final inválida.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      //Al_1
      if edDataFim.CanFocus then
         edDataFim.SetFocus;
      Exit;
   end;

   //AL_4
   with QryTotal do
   begin
      if Trim(DbLkcCorretora.Text) <> '' then
         sCorretValores := IntToStr(QryCorretora.FieldByName('IDCORRETVALORES').AsInteger);

      //Al_1
      Sql.Clear;
      sSql := 'SELECT '+
              '   SUM(X.TOTNEGATIVOS) AS TOTNEGRV,SUM(X.TOTPOSITIVOS) AS TOPOSRV,  '+
              '   SUM(X.TOTLIQUIDO) AS TOTLIQRV,SUM(X.VLROPERACAO) AS VLROPERRV,SUM(X.PERCENTUAL) AS PERCENTUAL,        '+
              '   SUM(X.TOTCORRBMF) AS TOTCORRBMF,SUM(X.TOTDESPBMF) AS TOTDESPBMF,SUM(X.TOTAJNOR) AS TOTAJNOR,          '+
              '   SUM(X.TOTAJPOS) AS TOTAJPOS,SUM(X.TOTOPERBMF) AS TOTOPERBMF,SUM(X.TOTAJNOR + X.TOTAJPOS) AS TOTAJUSTE,'+
              '   SUM(QTDORDBMF) AS QTDORDBMF,SUM(QTDORDRV) AS QTDORDRV                                                 '+
              'FROM                                                                                                     '+
              '   PARAMINVEST PA,                                                                                       '+
              '   (SELECT                                                                                               '+
              '       OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,ABS(SUM(NEG.TOTNEGATIVOS)) AS TOTNEGATIVOS,                '+
              '       SUM(POS.TOTPOSITIVOS) AS TOTPOSITIVOS,(SUM(NEG.TOTNEGATIVOS)+SUM(POS.TOTPOSITIVOS)) AS TOTLIQUIDO,'+
              '       SUM(OI.VLROPERACAO) AS VLROPERACAO,((SUM(OI.VLROPERACAO)*100)/TOT.TOTAL) AS PERCENTUAL,           '+
              '       0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTAJNOR,0 AS TOTAJPOS,0 AS TOTOPERBMF,0 AS QTDORDBMF,       '+
              '       0 AS QTDORDRV,0 AS PERCDEVRV,0 AS PERCDEVBMF                                                      '+
              '    FROM                                                                                                 '+
              '       OPERACAOINVEST OI, CORRETVALORES CV,                                                              '+
              '       (SELECT                                                                                           '+
              '           DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TOTNEGATIVOS                              '+
              '        FROM                                                                                             '+
              '           DESPOPERINVEST DOP,TIPODESPINVEST TD                                                          '+
              '        WHERE                                                                                            '+
              '           DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM OPERACAOINVEST                          '+
              '                                    WHERE                                                                '+
              '                                       (IDTIPOINVEST = 2) AND                                            '+
//AL_3
              '                                       (IDCARTEIRAGERENC IS NULL) AND                                    '+
              '                                       (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'' )) AND             '+
              '                                       (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY''))  AND             '+
              '                                       ((TD.DESCTIPODESPINV   Like ''%Devolucao Corretagem%''   ) OR     '+
              '                                        (TD.DESCTIPODESPINV   Like ''%Devolucao de Corretagem%'') OR     '+
              '                                        (TD.DESCTIPODESPINV   Like ''%DEVOLUCAO DE CORRETAGEM%'') OR     '+
              '                                        (TD.DESCTIPODESPINV   Like ''%DEVOLUCAO CORRETAGEM%'')) AND      '+
              '                                       (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST))                     '+
              '        GROUP BY DOP.IDOPERACAOINVEST) NEG,                                                              '+
              '       (SELECT                                                                                           '+
              '           DOP.IDOPERACAOINVEST,SUM(nvl(DOP.VLRDESPOPER,0)) AS TOTPOSITIVOS                              '+
              '        FROM                                                                                             '+
              '           DESPOPERINVEST DOP, TIPODESPINVEST TD                                                         '+
              '        WHERE                                                                                            '+
              '           DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM OPERACAOINVEST                          '+
              '                                    WHERE                                                                '+
              '                                       (IDTIPOINVEST = 2) AND                                            '+
//AL_3
              '                                       (IDCARTEIRAGERENC IS NULL) AND                                    '+
              '                                       (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND             '+
              '                                       (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND             '+
              '                                       ((TD.DESCTIPODESPINV  Like ''%Corretagem%'') OR                   '+
              '                                        (TD.DESCTIPODESPINV  Like ''%CORRETAGEM%'')) AND                 '+
              '                                       (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST))                     '+
              '        GROUP BY DOP.IDOPERACAOINVEST) POS,                                                              '+
              '       (SELECT                                                                                           '+
              '           SUM(VLROPERACAO) AS TOTAL                                                                     '+
              '        FROM                                                                                             '+
              '           OPERACAOINVEST                                                                                '+
              '        WHERE                                                                                            '+
              '           (IDTIPOINVEST = 2) AND                                                                        '+
//AL_3
              '           (IDCARTEIRAGERENC IS NULL) AND                                                                '+
              '           (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND                          '+
              '           (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND                          '+
              '           (NOT IDCORRETVALORES IS NULL)) TOT                                                            '+
              '    WHERE                                                                                                '+
              '       (OI.IDTIPOINVEST = 2) AND                                                                         '+
              '       (OI.IDCORRETVALORES IS NOT NULL) AND                                                              '+
//AL_3
              '       (OI.IDCARTEIRAGERENC IS NULL)    AND                                                              '+
              '       (OI.DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND                           '+
              '       (OI.DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND                           ';
      if Trim(DbLkcCorretora.Text) <> '' then
      begin
         sSql := sSql +
         '       ( ( ('''+sCorretValores+'''  IS NOT NULL) AND (OI.IDCORRETVALORES  = '''+sCorretValores+''') ) OR      '+
         '         ('''+sCorretValores+''' IS NULL) ) AND                                                               ';
      end;
      sSql := sSql +
              '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES) AND                                                   '+
              '       (NEG.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND                                                  '+
              '       (POS.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)                                                      '+
              '    GROUP BY OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,TOT.TOTAL                           '+
              '                                                                                                         '+
              '    UNION                                                                                                '+
              '                                                                                                         '+
              '    SELECT                                                                                               '+
              '       OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,       '+
              '       0 AS VLROPERACAO,0 AS PERCENTUAL,SUM(CORRBMF.TOTCORRBMF) AS TOTCORRBMF,                           '+
              '       SUM(DESPBMF.TOTDESPBMF) AS TOTDESPBMF,SUM(AJNORMAL.TOTAJNOR) AS TOTAJNOR,                         '+
              '       0 AS TOTAJPOS,0 AS TOTOPERBMF,0 AS QTDORDBMF,0 AS QTDORDRV,0 AS PERCDEVRV,0 AS PERCDEVBMF         '+
              '    FROM                                                                                                 '+
              '       OPERACAOINVEST OI, CORRETVALORES CV,                                                              '+
              '      (SELECT                                                                                            '+
              '          DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TOTCORRBMF                                 '+
              '       FROM                                                                                              '+
              '          DESPOPERINVEST DOP,TIPODESPINVEST TD                                                           '+
              '       WHERE                                                                                             '+
              '          DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM OPERACAOINVEST                           '+
              '                                   WHERE                                                                 '+
              '                                      (IDTIPOINVEST = 8) AND                                             '+
              '                                      (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND              '+
              '                                      (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND              '+
              '                                      (DOP.IDTIPODESPINVEST  IN (-14,-15)) AND                           '+
              '                                      (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST))                      '+
              '       GROUP BY DOP.IDOPERACAOINVEST) CORRBMF,                                                           '+
              '      (SELECT                                                                                            '+
              '          DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TOTDESPBMF                                 '+
              '       FROM                                                                                              '+
              '          DESPOPERINVEST DOP,TIPODESPINVEST TD                                                           '+
              '       WHERE                                                                                             '+
              '          DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM OPERACAOINVEST                           '+
              '                                   WHERE                                                                 '+
              '                                      (IDTIPOINVEST = 8) AND                                             '+
              '                                      (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND              '+
              '                                      (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND              '+
              '                                      (DOP.IDTIPODESPINVEST  IN (-16,-17,-18)) AND                       '+
              '                                      (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST))                      '+
              '       GROUP BY DOP.IDOPERACAOINVEST) DESPBMF,                                                           '+
              '      (SELECT                                                                                            '+
              '          DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TOTAJNOR                                   '+
              '       FROM                                                                                              '+
              '          DESPOPERINVEST DOP,TIPODESPINVEST TD                                                           '+
              '       WHERE                                                                                             '+
              '          DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM OPERACAOINVEST                           '+
              '                                   WHERE                                                                 '+
              '                                      (IDTIPOINVEST = 8) AND                                             '+
              '                                      (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND              '+
              '                                      (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND              '+
              '                                      (DOP.IDTIPODESPINVEST  IN (-20,-21)) AND                           '+
              '                                      (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST))                      '+
              '       GROUP BY DOP.IDOPERACAOINVEST) AJNORMAL                                                           '+
              '    WHERE                                                                                                '+
              '       (OI.IDTIPOINVEST = 8) AND                                                                         '+
              '       (NOT OI.IDCORRETVALORES IS NULL) AND                                                              '+
              '       (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND                              '+
              '       (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND                              ';
      if Trim(DbLkcCorretora.Text) <> '' then
         sSql := sSql +
              '       ( ( ('''+sCorretValores+'''  IS NOT NULL) AND                                                     '+
              '         (OI.IDCORRETVALORES  = '''+sCorretValores+''') ) OR ('''+sCorretValores+''' IS NULL) ) AND      ';
      sSql := sSql +
              '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES) AND                                                   '+
              '       (CORRBMF.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND                                              '+
              '       (DESPBMF.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND                                              '+
              '       (AJNORMAL.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)                                                 '+
              '    GROUP BY OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES                                                      '+
              '                                                                                                         '+
              '    UNION                                                                                                '+
              '                                                                                                         '+
              '    SELECT                                                                                               '+
              '       OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,       '+
              '       0 AS VLROPERACAO,0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTAJNOR,0 AS TOTAJPOS,     '+
              '       SUM(ABS(OI.VLROPERACAO)) AS TOTOPERBMF,0 AS QTDORDBMF,0 AS QTDORDRV,0 AS PERCDEVRV,0 AS PERCDEVBMF'+
              '    FROM                                                                                                 '+
              '       OPERACAOINVEST OI, CORRETVALORES CV                                                               '+
              '    WHERE                                                                                                '+
              '       (OI.IDTIPOINVEST = 8) AND                                                                         '+
              '       (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND                              '+
              '       (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND (IDTIPOOPERACAO > 0) AND     ';
      if Trim(DbLkcCorretora.Text) <> '' then
         sSql := sSql +
              '       ( ( ('''+sCorretValores+'''  IS NOT NULL) AND (OI.IDCORRETVALORES  = '''+sCorretValores+''') ) OR '+
              '         ('''+sCorretValores+''' IS NULL) ) AND (NOT OI.IDCORRETVALORES IS NULL) AND                     ';
      sSql := sSql +
              '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES)                                                       '+
              '    GROUP BY OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES                                     '+
              '                                                                                                         '+
              '    UNION                                                                                                '+
              '                                                                                                         '+
              '    SELECT                                                                                               '+
              '       OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,       '+
              '       0 AS VLROPERACAO,0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTAJNOR,                   '+
              '       SUM(AJPOSICAO.TOTAJPOS) AS TOTAJPOS,0 AS TOTOPERBMF,0 AS QTDORDBMF,0 AS QTDORDRV,                 '+
              '       0 AS PERCDEVRV,0 AS PERCDEVBMF                                                                    '+
              '    FROM                                                                                                 '+
              '       OPERACAOINVEST OI, CORRETVALORES CV,                                                              '+
              '      (SELECT OI.IDOPERACAOINVEST, SUM(OI.VLROPERACAO) AS TOTAJPOS FROM OPERACAOINVEST OI                '+
              '       WHERE                                                                                             '+
              '         (OI.IDTIPOINVEST = 8) AND(OI.IDTIPOOPERACAO IN (-10,-11)) AND                                   '+
              '         (OI.DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND                         '+
              '         (OI.DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND                         '+
              '         (NOT OI.IDCORRETVALORES IS NULL)                                                                '+
              '       GROUP BY OI.IDOPERACAOINVEST) AJPOSICAO                                                           '+
              '    WHERE                                                                                                '+
              '       (OI.IDTIPOINVEST = 8) AND                                                                         '+
              '       (NOT OI.IDCORRETVALORES IS NULL) AND                                                              '+
              '       (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND                              '+
              '       (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND                              ';
      if Trim(DbLkcCorretora.Text) <> '' then
         sSql := sSql +
              '       ( ( ('''+sCorretValores+'''  IS NOT NULL) AND (OI.IDCORRETVALORES  = '''+sCorretValores+''') ) OR '+
              '         ('''+sCorretValores+''' IS NULL) ) AND                                                          ';
      sSql := sSql +
              '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES) AND                                                   '+
              '       (AJPOSICAO.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)                                                '+
              '    GROUP BY OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES                                     '+
              '                                                                                                         '+
              '    UNION                                                                                                '+
              '                                                                                                         '+
              '    SELECT                                                                                               '+
              '       TRUNC(OI.DATAORDMOVINV) AS DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,       '+
              '       0 AS VLROPERACAO,0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTAJNOR,                   '+
              '       0 AS TOTAJPOS,0 AS TOTOPERBMF,COUNT(OI.IDORDMOVINV) AS QTDORDBMF,0 AS QTDORDRV,                   '+
              '       0 AS PERCDEVRV,0 AS PERCDEVBMF                                                                    '+
              '    FROM                                                                                                 '+
              '       ORDMOVINV OI,CORRETVALORES CV                                                                     '+
              '    WHERE                                                                                                '+
              '       (OI.IDTIPOINVEST=8) AND                                                                           '+
              '       (DATAORDMOVINV >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND                             '+
              '       (DATAORDMOVINV <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND                             ';
      if Trim(DbLkcCorretora.Text) <> '' then
         sSql := sSql +
              '       ( ( ('''+sCorretValores+'''  IS NOT NULL) AND (OI.IDCORRETVALORES  = '''+sCorretValores+''') ) OR '+
              '         ('''+sCorretValores+''' IS NULL) ) AND                                                          ';
      sSql := sSql +
              '       (OI.IDCORRETVALORES = CV.IDCORRETVALORES)                                                         '+
              '    GROUP BY TRUNC(OI.DATAORDMOVINV), OI.IDCORRETVALORES,CV.SGLCORRETVALORES                             '+
              '                                                                                                         '+
              '    UNION                                                                                                '+
              '                                                                                                         '+
              '    SELECT                                                                                               '+
              '       TRUNC(OI.DATAORDMOVINV) AS DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,       '+
              '       0 AS VLROPERACAO,0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTAJNOR,                   '+
              '       0 AS TOTAJPOS,0 AS TOTOPERBMF,0 AS QTDORDBMF,                                                     '+
              '       COUNT(OI.IDORDMOVINV) AS QTDORDRV,0 AS PERCDEVRV,0 AS PERCDEVBMF                                  '+
              '    FROM                                                                                                 '+
              '       ORDMOVINV OI,CORRETVALORES CV                                                                     '+
              '    WHERE                                                                                                '+
              '       (OI.IDTIPOINVEST=2) AND (DATAORDMOVINV >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND     '+
              '       (DATAORDMOVINV <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND                             ';
      if Trim(DbLkcCorretora.Text) <> '' then
         sSql := sSql +
              '       ( ( ('''+sCorretValores+'''  IS NOT NULL) AND (OI.IDCORRETVALORES  = '''+sCorretValores+''') ) OR '+
              '         ('''+sCorretValores+''' IS NULL) ) AND                                                          ';
      sSql := sSql +
              '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES)                                                       '+
              '    GROUP BY TRUNC(OI.DATAORDMOVINV),OI.IDCORRETVALORES,CV.SGLCORRETVALORES                              '+
              '   ) X                                                                                                   ';
      Sql.Add(sSQL);
      Open;
   end;

   with Qry do
   begin
      if Trim(DbLkcCorretora.Text) <> '' then
         sCorretValores := IntToStr(QryCorretora.FieldByName('IDCORRETVALORES').AsInteger);

      //Al_1
      Sql.Clear;
      sSql := 'SELECT '+
              '   X.DATAOPERACAO, X.IDCORRETVALORES,X.SGLCORRETVALORES,SUM(X.TOTNEGATIVOS) AS TOTNEGRV,SUM(X.TOTPOSITIVOS) AS TOPOSRV,  '+
              '   SUM(X.TOTLIQUIDO) AS TOTLIQRV,SUM(X.VLROPERACAO) AS VLROPERRV,SUM(X.PERCENTUAL) AS PERCENTUAL,        '+
              '   SUM(X.TOTCORRBMF) AS TOTCORRBMF,SUM(X.TOTDESPBMF) AS TOTDESPBMF,SUM(X.TOTAJNOR) AS TOTAJNOR,          '+
              '   SUM(X.TOTAJPOS) AS TOTAJPOS,SUM(X.TOTOPERBMF) AS TOTOPERBMF,SUM(X.TOTAJNOR + X.TOTAJPOS) AS TOTAJUSTE,'+
              '   SUM(QTDORDBMF) AS QTDORDBMF,SUM(QTDORDRV) AS QTDORDRV,PA.PERCDEVRV,PA.PERCDEVBMF                      '+
              'FROM                                                                                                     '+
              '   PARAMINVEST PA,                                                                                       '+
              '   (SELECT                                                                                               '+
              '       OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,ABS(SUM(NEG.TOTNEGATIVOS)) AS TOTNEGATIVOS,                '+
              '       SUM(POS.TOTPOSITIVOS) AS TOTPOSITIVOS,(SUM(NEG.TOTNEGATIVOS)+SUM(POS.TOTPOSITIVOS)) AS TOTLIQUIDO,'+
              '       SUM(OI.VLROPERACAO) AS VLROPERACAO,((SUM(OI.VLROPERACAO)*100)/TOT.TOTAL) AS PERCENTUAL,           '+
              '       0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTAJNOR,0 AS TOTAJPOS,0 AS TOTOPERBMF,0 AS QTDORDBMF,       '+
              '       0 AS QTDORDRV,0 AS PERCDEVRV,0 AS PERCDEVBMF                                                      '+
              '    FROM                                                                                                 '+
              '       OPERACAOINVEST OI, CORRETVALORES CV,                                                              '+
              '       (SELECT                                                                                           '+
              '           DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TOTNEGATIVOS                              '+
              '        FROM                                                                                             '+
              '           DESPOPERINVEST DOP,TIPODESPINVEST TD                                                          '+
              '        WHERE                                                                                            '+
              '           DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM OPERACAOINVEST                          '+
              '                                    WHERE                                                                '+
              '                                       (IDTIPOINVEST = 2) AND                                            '+
//AL_3
              '                                       (IDCARTEIRAGERENC IS NULL) AND                                    '+
              '                                       (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'' )) AND             '+
              '                                       (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY''))  AND             '+
              '                                       ((TD.DESCTIPODESPINV   Like ''%Devolucao Corretagem%''   ) OR     '+
              '                                        (TD.DESCTIPODESPINV   Like ''%Devolucao de Corretagem%'') OR     '+
              '                                        (TD.DESCTIPODESPINV   Like ''%DEVOLUCAO DE CORRETAGEM%'') OR     '+
              '                                        (TD.DESCTIPODESPINV   Like ''%DEVOLUCAO CORRETAGEM%'')) AND      '+
              '                                       (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST))                     '+
              '        GROUP BY DOP.IDOPERACAOINVEST) NEG,                                                              '+
              '       (SELECT                                                                                           '+
              '           DOP.IDOPERACAOINVEST,SUM(nvl(DOP.VLRDESPOPER,0)) AS TOTPOSITIVOS                              '+
              '        FROM                                                                                             '+
              '           DESPOPERINVEST DOP, TIPODESPINVEST TD                                                         '+
              '        WHERE                                                                                            '+
              '           DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM OPERACAOINVEST                          '+
              '                                    WHERE                                                                '+
              '                                       (IDTIPOINVEST = 2) AND                                            '+
//AL_3
              '                                       (IDCARTEIRAGERENC IS NULL) AND                                    '+
              '                                       (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND             '+
              '                                       (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND             '+
              '                                       ((TD.DESCTIPODESPINV  Like ''%Corretagem%'') OR                   '+
              '                                        (TD.DESCTIPODESPINV  Like ''%CORRETAGEM%'')) AND                 '+
              '                                       (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST))                     '+
              '        GROUP BY DOP.IDOPERACAOINVEST) POS,                                                              '+
              '       (SELECT                                                                                           '+
              '           SUM(VLROPERACAO) AS TOTAL                                                                     '+
              '        FROM                                                                                             '+
              '           OPERACAOINVEST                                                                                '+
              '        WHERE                                                                                            '+
              '           (IDTIPOINVEST = 2) AND                                                                        '+
//AL_3
              '           (IDCARTEIRAGERENC IS NULL) AND                                                                '+
              '           (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND                          '+
              '           (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND                          '+
              '           (NOT IDCORRETVALORES IS NULL)) TOT                                                            '+
              '    WHERE                                                                                                '+
              '       (OI.IDTIPOINVEST = 2) AND                                                                         '+
              '       (OI.IDCORRETVALORES IS NOT NULL) AND                                                              '+
//AL_3
              '       (OI.IDCARTEIRAGERENC IS NULL)    AND                                                              '+
              '       (OI.DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND                           '+
              '       (OI.DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND                           ';
      if Trim(DbLkcCorretora.Text) <> '' then
      begin
         sSql := sSql +
         '       ( ( ('''+sCorretValores+'''  IS NOT NULL) AND (OI.IDCORRETVALORES  = '''+sCorretValores+''') ) OR      '+
         '         ('''+sCorretValores+''' IS NULL) ) AND                                                               ';
      end;
      sSql := sSql +
              '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES) AND                                                   '+
              '       (NEG.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND                                                  '+
              '       (POS.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)                                                      '+
              '    GROUP BY OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,TOT.TOTAL                           '+
              '                                                                                                         '+
              '    UNION                                                                                                '+
              '                                                                                                         '+
              '    SELECT                                                                                               '+
              '       OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,       '+
              '       0 AS VLROPERACAO,0 AS PERCENTUAL,SUM(CORRBMF.TOTCORRBMF) AS TOTCORRBMF,                           '+
              '       SUM(DESPBMF.TOTDESPBMF) AS TOTDESPBMF,SUM(AJNORMAL.TOTAJNOR) AS TOTAJNOR,                         '+
              '       0 AS TOTAJPOS,0 AS TOTOPERBMF,0 AS QTDORDBMF,0 AS QTDORDRV,0 AS PERCDEVRV,0 AS PERCDEVBMF         '+
              '    FROM                                                                                                 '+
              '       OPERACAOINVEST OI, CORRETVALORES CV,                                                              '+
              '      (SELECT                                                                                            '+
              '          DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TOTCORRBMF                                 '+
              '       FROM                                                                                              '+
              '          DESPOPERINVEST DOP,TIPODESPINVEST TD                                                           '+
              '       WHERE                                                                                             '+
              '          DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM OPERACAOINVEST                           '+
              '                                   WHERE                                                                 '+
              '                                      (IDTIPOINVEST = 8) AND                                             '+
              '                                      (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND              '+
              '                                      (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND              '+
              '                                      (DOP.IDTIPODESPINVEST  IN (-14,-15)) AND                           '+
              '                                      (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST))                      '+
              '       GROUP BY DOP.IDOPERACAOINVEST) CORRBMF,                                                           '+
              '      (SELECT                                                                                            '+
              '          DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TOTDESPBMF                                 '+
              '       FROM                                                                                              '+
              '          DESPOPERINVEST DOP,TIPODESPINVEST TD                                                           '+
              '       WHERE                                                                                             '+
              '          DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM OPERACAOINVEST                           '+
              '                                   WHERE                                                                 '+
              '                                      (IDTIPOINVEST = 8) AND                                             '+
              '                                      (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND              '+
              '                                      (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND              '+
              '                                      (DOP.IDTIPODESPINVEST  IN (-16,-17,-18)) AND                       '+
              '                                      (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST))                      '+
              '       GROUP BY DOP.IDOPERACAOINVEST) DESPBMF,                                                           '+
              '      (SELECT                                                                                            '+
              '          DOP.IDOPERACAOINVEST,SUM(NVL(DOP.VLRDESPOPER,0)) AS TOTAJNOR                                   '+
              '       FROM                                                                                              '+
              '          DESPOPERINVEST DOP,TIPODESPINVEST TD                                                           '+
              '       WHERE                                                                                             '+
              '          DOP.IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST FROM OPERACAOINVEST                           '+
              '                                   WHERE                                                                 '+
              '                                      (IDTIPOINVEST = 8) AND                                             '+
              '                                      (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND              '+
              '                                      (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND              '+
              '                                      (DOP.IDTIPODESPINVEST  IN (-20,-21)) AND                           '+
              '                                      (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST))                      '+
              '       GROUP BY DOP.IDOPERACAOINVEST) AJNORMAL                                                           '+
              '    WHERE                                                                                                '+
              '       (OI.IDTIPOINVEST = 8) AND                                                                         '+
              '       (NOT OI.IDCORRETVALORES IS NULL) AND                                                              '+
              '       (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND                              '+
              '       (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND                              ';
      if Trim(DbLkcCorretora.Text) <> '' then
         sSql := sSql +
              '       ( ( ('''+sCorretValores+'''  IS NOT NULL) AND                                                     '+
              '         (OI.IDCORRETVALORES  = '''+sCorretValores+''') ) OR ('''+sCorretValores+''' IS NULL) ) AND      ';
      sSql := sSql +
              '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES) AND                                                   '+
              '       (CORRBMF.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND                                              '+
              '       (DESPBMF.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND                                              '+
              '       (AJNORMAL.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)                                                 '+
              '    GROUP BY OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES                                                      '+
              '                                                                                                         '+
              '    UNION                                                                                                '+
              '                                                                                                         '+
              '    SELECT                                                                                               '+
              '       OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,       '+
              '       0 AS VLROPERACAO,0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTAJNOR,0 AS TOTAJPOS,     '+
              '       SUM(ABS(OI.VLROPERACAO)) AS TOTOPERBMF,0 AS QTDORDBMF,0 AS QTDORDRV,0 AS PERCDEVRV,0 AS PERCDEVBMF'+
              '    FROM                                                                                                 '+
              '       OPERACAOINVEST OI, CORRETVALORES CV                                                               '+
              '    WHERE                                                                                                '+
              '       (OI.IDTIPOINVEST = 8) AND                                                                         '+
              '       (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND                              '+
              '       (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND (IDTIPOOPERACAO > 0) AND     ';
      if Trim(DbLkcCorretora.Text) <> '' then
         sSql := sSql +
              '       ( ( ('''+sCorretValores+'''  IS NOT NULL) AND (OI.IDCORRETVALORES  = '''+sCorretValores+''') ) OR '+
              '         ('''+sCorretValores+''' IS NULL) ) AND (NOT OI.IDCORRETVALORES IS NULL) AND                     ';
      sSql := sSql +
              '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES)                                                       '+
              '    GROUP BY OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES                                     '+
              '                                                                                                         '+
              '    UNION                                                                                                '+
              '                                                                                                         '+
              '    SELECT                                                                                               '+
              '       OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,       '+
              '       0 AS VLROPERACAO,0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTAJNOR,                   '+
              '       SUM(AJPOSICAO.TOTAJPOS) AS TOTAJPOS,0 AS TOTOPERBMF,0 AS QTDORDBMF,0 AS QTDORDRV,                 '+
              '       0 AS PERCDEVRV,0 AS PERCDEVBMF                                                                    '+
              '    FROM                                                                                                 '+
              '       OPERACAOINVEST OI, CORRETVALORES CV,                                                              '+
              '      (SELECT OI.IDOPERACAOINVEST, SUM(OI.VLROPERACAO) AS TOTAJPOS FROM OPERACAOINVEST OI                '+
              '       WHERE                                                                                             '+
              '         (OI.IDTIPOINVEST = 8) AND(OI.IDTIPOOPERACAO IN (-10,-11)) AND                                   '+
              '         (OI.DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND                         '+
              '         (OI.DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND                         '+
              '         (NOT OI.IDCORRETVALORES IS NULL)                                                                '+
              '       GROUP BY OI.IDOPERACAOINVEST) AJPOSICAO                                                           '+
              '    WHERE                                                                                                '+
              '       (OI.IDTIPOINVEST = 8) AND                                                                         '+
              '       (NOT OI.IDCORRETVALORES IS NULL) AND                                                              '+
              '       (DATAOPERACAO >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND                              '+
              '       (DATAOPERACAO <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND                              ';
      if Trim(DbLkcCorretora.Text) <> '' then
         sSql := sSql +
              '       ( ( ('''+sCorretValores+'''  IS NOT NULL) AND (OI.IDCORRETVALORES  = '''+sCorretValores+''') ) OR '+
              '         ('''+sCorretValores+''' IS NULL) ) AND                                                          ';
      sSql := sSql +
              '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES) AND                                                   '+
              '       (AJPOSICAO.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)                                                '+
              '    GROUP BY OI.DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES                                     '+
              '                                                                                                         '+
              '    UNION                                                                                                '+
              '                                                                                                         '+
              '    SELECT                                                                                               '+
              '       TRUNC(OI.DATAORDMOVINV) AS DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,       '+
              '       0 AS VLROPERACAO,0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTAJNOR,                   '+
              '       0 AS TOTAJPOS,0 AS TOTOPERBMF,COUNT(OI.IDORDMOVINV) AS QTDORDBMF,0 AS QTDORDRV,                   '+
              '       0 AS PERCDEVRV,0 AS PERCDEVBMF                                                                    '+
              '    FROM                                                                                                 '+
              '       ORDMOVINV OI,CORRETVALORES CV                                                                     '+
              '    WHERE                                                                                                '+
              '       (OI.IDTIPOINVEST=8) AND                                                                           '+
              '       (DATAORDMOVINV >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND                             '+
              '       (DATAORDMOVINV <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND                             ';
      if Trim(DbLkcCorretora.Text) <> '' then
         sSql := sSql +
              '       ( ( ('''+sCorretValores+'''  IS NOT NULL) AND (OI.IDCORRETVALORES  = '''+sCorretValores+''') ) OR '+
              '         ('''+sCorretValores+''' IS NULL) ) AND                                                          ';
      sSql := sSql +
              '       (OI.IDCORRETVALORES = CV.IDCORRETVALORES)                                                         '+
              '    GROUP BY TRUNC(OI.DATAORDMOVINV), OI.IDCORRETVALORES,CV.SGLCORRETVALORES                             '+
              '                                                                                                         '+
              '    UNION                                                                                                '+
              '                                                                                                         '+
              '    SELECT                                                                                               '+
              '       TRUNC(OI.DATAORDMOVINV) AS DATAOPERACAO, OI.IDCORRETVALORES,CV.SGLCORRETVALORES,0 AS TOTNEGATIVOS,0 AS TOTPOSITIVOS,0 AS TOTLIQUIDO,       '+
              '       0 AS VLROPERACAO,0 AS PERCENTUAL,0 AS TOTCORRBMF,0 AS TOTDESPBMF,0 AS TOTAJNOR,                   '+
              '       0 AS TOTAJPOS,0 AS TOTOPERBMF,0 AS QTDORDBMF,                                                     '+
              '       COUNT(OI.IDORDMOVINV) AS QTDORDRV,0 AS PERCDEVRV,0 AS PERCDEVBMF                                  '+
              '    FROM                                                                                                 '+
              '       ORDMOVINV OI,CORRETVALORES CV                                                                     '+
              '    WHERE                                                                                                '+
              '       (OI.IDTIPOINVEST=2) AND (DATAORDMOVINV >= TO_DATE('''+edDataIni.Text+''',''DD/MM/YYYY'')) AND     '+
              '       (DATAORDMOVINV <= TO_DATE('''+edDataFim.Text+''',''DD/MM/YYYY'')) AND                             ';
      if Trim(DbLkcCorretora.Text) <> '' then
         sSql := sSql +
              '       ( ( ('''+sCorretValores+'''  IS NOT NULL) AND (OI.IDCORRETVALORES  = '''+sCorretValores+''') ) OR '+
              '         ('''+sCorretValores+''' IS NULL) ) AND                                                          ';
      sSql := sSql +
              '       (CV.IDCORRETVALORES   = OI.IDCORRETVALORES)                                                       '+
              '    GROUP BY TRUNC(OI.DATAORDMOVINV),OI.IDCORRETVALORES,CV.SGLCORRETVALORES                              '+
              '   ) X                                                                                                   '+
              'GROUP BY X.DATAOPERACAO, X.IDCORRETVALORES, X.SGLCORRETVALORES, PA.PERCDEVRV, PA.PERCDEVBMF              ';
      Sql.Add(sSQL);
      Open;
   end;
end;

procedure TfrmConsMovCorretora.FormShow(Sender: TObject);
begin
  inherited;
  //Al_1
  QryCorretora.Close;
  QryCorretora.ParamByName('DATAINI').AsString := DateToStr(Date);
  QryCorretora.ParamByName('DATAFIM').AsString := DateToStr(Date);
  QryCorretora.Open;
end;

procedure TfrmConsMovCorretora.bbtnConfirmarClick(Sender: TObject);
begin
  Constroiquery;
end;

procedure TfrmConsMovCorretora.bt_ImprimeClick(Sender: TObject);
begin
  //AL_2
  If (edDataIni.Text <> '') And (edDataFim.Text <> '') Then
  Begin
     DmRelMapaCorret.ppLInicio.Caption := edDataIni.Text;
     DmRelMapaCorret.ppLFim.Caption    := edDataFim.Text;
  End
  Else
  Begin
     DmRelMapaCorret.ppLInicio.Caption           := '            ';
     DmRelMapaCorret.ppLFim.Caption              := '            ';
  End;

  if Qry.Active then
  begin
     qry.DisableControls;
     TfrmPreview.CreateModalPreview(Application,
                                    DmRelMapaCorret.RpMapaCorret,
                                    DmRelMapaCorret.RpMapaCorret.PrinterSetup.DocumentName);
     qry.EnableControls;
  end;
end;

procedure TfrmConsMovCorretora.bbtnSairClick(Sender: TObject);
begin

   Qry.Active := False;

  inherited;
end;

procedure TfrmConsMovCorretora.bbtnCancelarClick(Sender: TObject);
begin
  Qry.Close ;
  edDataIni.Clear;
  edDataFim.Clear;
  DbLkcCorretora.Clear;
  edDataIni.SetFocus;
  inherited;

end;

procedure TfrmConsMovCorretora.FormCreate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;

//Al_1
procedure TfrmConsMovCorretora.edDataFimExit(Sender: TObject);
begin
  inherited;
   if Trim(edDataIni.Text) = '' then
   begin
      MsgDlg('Data de inicial inválida.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if edDataIni.CanFocus then
         edDataIni.SetFocus;
      Exit;
   end;

   if Trim(edDataFim.Text) = '' then
   begin
      MsgDlg('Data de final inválida.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if edDataFim.CanFocus then
         edDataFim.SetFocus;
      Exit;
   end;

   QryCorretora.Close;
   QryCorretora.ParamByName('DATAINI').AsString := Trim(edDataIni.Text);
   QryCorretora.ParamByName('DATAFIM').AsString := Trim(edDataFim.Text);
   QryCorretora.Open;

end;

//Al_1
procedure TfrmConsMovCorretora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   Qry.Close;
   QryCorretora.Close;
end;

//AL_4
procedure TfrmConsMovCorretora.dbgGridUpdateFooter(Sender: TObject);
begin
  inherited;
   dbgGrid.Columns[0].FooterValue  := 'TOTAL';
   dbgGrid.Columns[2].FooterValue  := FloatToStrF(QryTotalVLROPERRV.AsFloat,ffNumber,18,2);
   dbgGrid.Columns[3].FooterValue  := FloatToStrF(QryTotalTOPOSRV.AsFloat,ffNumber,16,2);
   dbgGrid.Columns[4].FooterValue  := FloatToStrF(QryTotalQTDORDRV.AsFloat,ffNumber,16,0);
   dbgGrid.Columns[6].FooterValue  := FloatToStrF(QryTotalTOTOPERBMF.AsFloat,ffNumber,16,2);
   dbgGrid.Columns[7].FooterValue  := FloatToStrF(QryTotalTOTAJUSTE.AsFloat,ffNumber,16,2);
   dbgGrid.Columns[8].FooterValue  := FloatToStrF(QryTotalTOTCORRBMF.AsFloat,ffNumber,14,2);
   dbgGrid.Columns[9].FooterValue  := FloatToStrF(QryTotalQTDORDBMF.AsFloat,ffNumber,16,0);
   dbgGrid.Columns[11].FooterValue := FloatToStrF(QryTotalPERCENTUAL.AsFloat,ffNumber,10,3);
end;

end.
