unit fConsultaParametrizacaoPrevia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, DBTables, Wwquery, StdCtrls, wwdblook, ComCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit,
  TREdit, TEdNum,uDocumento, uIntegraBack, MontaSelect, fcButton, fcImgBtn,
  fcShapeBtn, DBCtrls, wwdbdatetimepicker, CMDateTimePicker, Menus,
  mxpivsrc, mxgrid, mxDB, mxtables, mxstore, Wwdbspin, DBaseDados,
  UMensErro, uConstFolha, uAdmPrevFB;

type
  TfrmConsultaParametrizacaoPrevia = class(TfrmSairAjuda)
    qryLote: TwwQuery;
    Panel7: TPanel;
    Panel14: TPanel;
    pnlProgbar: TPanel;
    prgBar: TProgressBar;
    dqryFinanceiro: TDecisionQuery;
    dsFinanceiro: TDecisionSource;
    dcFinanceiro: TDecisionCube;
    pctlBenefContrib: TPageControl;
    tbsParamFinanceira: TTabSheet;
    qryLoteMESREFERENCIA: TStringField;
    qryLoteDESCRICAO: TStringField;
    qryLoteIDLOTE: TFloatField;
    pctlSelecao: TPageControl;
    tbsHistorico: TTabSheet;
    dblkFolha: TwwDBLookupCombo;
    fcsbtnHistorico: TfcShapeBtn;
    dpFinanceiro: TDecisionPivot;
    dgrdFinanceiro: TDecisionGrid;
    tbsParamContabil: TTabSheet;
    dpContabil: TDecisionPivot;
    dgrdContrib: TDecisionGrid;
    dqryContabil: TDecisionQuery;
    dsContabil: TDecisionSource;
    dcContabil: TDecisionCube;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dqryFinanceiroAfterOpen(DataSet: TDataSet);
    procedure dqryFinanceiroAfterClose(DataSet: TDataSet);
    procedure fcsbtnHistoricoClick(Sender: TObject);
    procedure dqryContabilAfterOpen(DataSet: TDataSet);
    procedure dqryContabilAfterClose(DataSet: TDataSet);
    procedure dblkFolhaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TfrmConsultaParametrizacaoPrevia.FormCreate(Sender: TObject);
begin
  inherited;
  qryLote.close;
  qryLote.SQL.Clear;
  qryLote.SQL.Add(
    'SELECT IDLOTE, MESREFERENCIA, IDLOTE||'' - ''||DESCRICAO AS DESCRICAO '+
    'FROM CTRLINTERFACE '+
    'WHERE TIPO = ''B''  '+
    'AND IDREFERENCIA IS NULL '+
    'AND FLGTIPOFOLHA IN (0,3,4,6) '+
    'AND FLGPREPARADO = 1 '+
    'AND FLGIDATMP = 1 '+
    'AND IDPESSOA = '+inttostr(iidfundacao)+' '+
    'ORDER BY MESREFERENCIA DESC, IDLOTE DESC');
  qryLote.open;
  WindowState := wsMaximized;
  pctlSelecao.activepage:=tbsHistorico;
end;

procedure TfrmConsultaParametrizacaoPrevia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryLote.Close;
  dqryFinanceiro.Close;
  dqryContabil.Close;
end;

procedure TfrmConsultaParametrizacaoPrevia.dblkFolhaChange(
  Sender: TObject);
begin
  inherited;
  fcsbtnHistorico.enabled:=(dblkFolha.LookupValue <> '');
end;

procedure TfrmConsultaParametrizacaoPrevia.dqryFinanceiroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dpFinanceiro.Visible := True;
end;

procedure TfrmConsultaParametrizacaoPrevia.dqryFinanceiroAfterClose(DataSet: TDataSet);
begin
  inherited;
  dpFinanceiro.Visible := False;
end;

procedure TfrmConsultaParametrizacaoPrevia.dqryContabilAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dpContabil.Visible := True;
end;

procedure TfrmConsultaParametrizacaoPrevia.dqryContabilAfterClose(DataSet: TDataSet);
begin
  inherited;
  dpContabil.Visible := False;
end;

procedure TfrmConsultaParametrizacaoPrevia.fcsbtnHistoricoClick(Sender: TObject);
var ssql: string;
begin
  inherited;
  // query para financeiro
  ssql:=
    'SELECT COUNT(*) AS QUANTIDADE, '+_clinefeed+
           'SUM(DECODE(P.FLGDESCONTO,0,H.VALORPROVENTO,1,-H.VALORPROVENTO,0)) AS VALOR, '+_clinefeed+
           'PT.NOME AS PATRO, '+_clinefeed+
           'PP.NOME AS PLANO, '+_clinefeed+
           'H.CODTIPRECDES AS CODDESEMB, '+_clinefeed+
           'P.CODPROVDESC||''-''||P.DESCRICAO AS RUBRICA '+_clinefeed+
    'FROM PREVIA H, PROVDESC P, PESSOA PT, PLANPREVCONTABIL PP, TIPORECEBDESEMB T '+_clinefeed+
    'WHERE H.IDLOTE = '+dblkFolha.LookupValue+' '+_clinefeed+
    'AND H.IDRUBRICA = P.IDPROVENTO '+_clinefeed+
    'AND P.FLGDESCONTO IN (0,1) '+_clinefeed+
    'AND P.FLGESPECIAL = 0 '+_clinefeed+
    'AND H.IDPLANOCONTABIL = PP.IDPLANOPREV '+_clinefeed+
    'AND H.IDPATRO = PT.IDPESSOA '+_clinefeed+
    'AND H.FLGTIPODESC <> ''K'' '+_clinefeed+
    'AND H.CODTIPRECDES = T.CODTIPRECDES(+) '+_clinefeed+
    'AND ''P'' = T.RECPAG(+) '+_clinefeed+
    'GROUP BY PT.NOME, PP.NOME, H.CODTIPRECDES, P.CODPROVDESC||''-''||P.DESCRICAO ';

  dqryFinanceiro.close;
  dqryFinanceiro.sql.clear;
  dqryFinanceiro.sql.add(ssql);
  try
    dqryFinanceiro.open;
  except
    MsgDlg('Só existe um registro impossibilitando essa consulta.',
      'Informação', mtInformation, [mbOk], 0);
  end;
end;

end.
{------------------------------------------------------------------------------|
| UNIT: FCONSULTAPARAMETRIZACAOPREVIA                                          |
| DESCRIÇÃO FUNCIONAL:                                                         |
| - MOSTRA OS PARAMÊTROS CONTÁBIL E FINANCEIRA POR RUBRICAS PARA UM DETERMI-   |
| NADO LOTE DE PREVIA, DE FORMA A PERMITIR A AVALIAÇÃO DA PARAMETRIZAÇÃO.      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/06/2004 A 22/06/2004                         |
| PENDÊNCIA: 14490                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.12                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CRIAÇÃO DA NOVA TELA.                                                      |
|                                                                              |
|------------------------------------------------------------------------------}

