{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit fConsultaConvenio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, StdCtrls, DBCtrls,
  MontaSelect, Db, DBTables, Wwquery, Wwdatsrc, TB97Ctls, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, uAdmPrevFB, uDataBase,
  uSistema, dBaseDados;

type
  TfrmConsultaConvenio = class(TfrmSairAjuda)
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnProcurar: TToolbarButton97;
    dsLote: TwwDataSource;
    qryLote: TwwQuery;
    qryDoc: TwwQuery;
    dsDoc: TwwDataSource;
    qryFav: TwwQuery;
    dsFav: TwwDataSource;
    MontaSelect: TMontaSelect;
    pnlFavorecido: TPanel;
    dbtFavorecido: TDBText;
    lblFav: TLabel;
    pnlInformacao: TPanel;
    pnlGrids: TPanel;
    Splitter2: TSplitter;
    Splitter1: TSplitter;
    dbgLote: TwwDBGrid;
    dbgDoc: TwwDBGrid;
    dbgProc: TwwDBGrid;
    qryFavDESCRICAO: TStringField;
    qryFavIDPROCCONV: TFloatField;
    qryFavMES: TStringField;
    qryFavIDFAVORECIDO: TFloatField;
    qryFavNOME: TStringField;
    qryLoteIDFUNDACAO: TFloatField;
    qryLoteIDPROCCONV: TFloatField;
    qryLoteIDLOTE: TFloatField;
    qryLoteIDLAYOUT: TFloatField;
    qryLoteIDFAVORECIDO: TFloatField;
    qryLoteIDRUBRICA: TFloatField;
    qryLoteTOTALIMPORTADO: TFloatField;
    qryLoteTOTALNAOPROC: TFloatField;
    qryLoteTOTALPROCINTEG: TFloatField;
    qryLoteTOTALPROCPARC: TFloatField;
    qryLoteVALORIMPORTADO: TFloatField;
    qryLoteVALORNAOPROC: TFloatField;
    qryLoteVALORPROCINTEG: TFloatField;
    qryLoteVALORPROCPARC: TFloatField;
    qryLoteFLGTIPOCONVENIO: TFloatField;
    qryLoteFLGTRATARESIDUO: TFloatField;
    qryLoteIDLOTEEXCESSO: TFloatField;
    qryLoteCODDOCUMENTO: TFloatField;
    qryLoteDESCRLOTE: TStringField;
    qryLoteDESCRRUB: TStringField;
    qryDocIDFUNDACAO: TFloatField;
    qryDocIDPROCCONV: TFloatField;
    qryDocIDFAVORECIDO: TFloatField;
    qryDocCODDOCUMENTO: TFloatField;
    qryDocDATAPAGAMENTO: TDateTimeField;
    qryDocVALORLIQUIDO: TFloatField;
    qryDocVALOREFETIVO: TFloatField;
    qryDocNODOCUMENTO: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaConvenio: TfrmConsultaConvenio;

implementation

{$R *.DFM}

procedure TfrmConsultaConvenio.FormShow(Sender: TObject);
begin
  inherited;
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  if not Sistema.GravaLogOperacoes('Consulta de Pagamento de Convênios.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  WindowState:=wsMaximized;
  MontaSelect.filtro.clear;
  MontaSelect.filtro.add('P.IDPESSOA = C.IDFAVORECIDO');
  MontaSelect.filtro.add('C.IDFUNDACAO = '+inttostr(iidfundacao));
  qryFav.close;
  qryFav.ParamByName('pIdfavorecido').asinteger:=-1;
  qryFav.Open;
  qryLote.Open;
  qryDoc.Open;
end;

procedure TfrmConsultaConvenio.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if MontaSelect.RetornouValor then
  begin
    qryFav.Close;
    qryFav.ParamByName('pIdfavorecido').asinteger:=strtoint(MontaSelect.ValoresChave[0]);
    qryFav.Open;
    qryLote.close;
    qryLote.Open;
    qryDoc.close;
    qryDoc.Open;
  end;
end;
end.
{==============================================================================|
| UNIT: FCONSULTACONVENIO                                                      |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   CONSULTA MENSAL DOS PAGAMENTOS DE CONVÊNIOS PROCESSADOS NA FOLHA DE        |                                                            |
| BENEFÍCIOS.                                                                  |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: Sidnei B Marins.                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/07/2002 A 23/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF  - Pendencia 7664.                                           |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Modificação para exibir código/descrição externa |                                                                              |
|  conforme a parametrização na tabela PARAMAPREV.                             |
|------------------------------------------------------------------------------}


