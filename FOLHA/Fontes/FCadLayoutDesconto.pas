unit FCadLayoutDesconto;

{==============================================================================|
| UNIT: FCADLAYOUTDESCONTO                                                     |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   TELA DE CADASTRO DE LAYOUTS PARA IMPORTAÇÃO DE ARQUIVOS DE CONVÊNIOS.      |
|                                                                              |
===============================================================================}
// Alterações:
//------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Data        : 31/05/2013
// Rotina      : _
// Pendência   : SOL 206194 Kintana 1998160
// Descricao   : Funcionalidades sem "commit".
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 26/09/2007
// Rotina      : DFM
// Pendência   : 26463
// Descricao   : Retirar join com a tabela PLANO no MontaSelectFavorecido.
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 13/12/2006
// Rotina      : -
// Pendência   : 20840
// Descricao   : Criação dos campos 'Regra de Cálculo", "Tipo de Desembolso" e "Conta Contábil para
//               Baixa" para permitir desconto de taxa de administração no valor repassado ao
//               convênio
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 22/08/2006
// Rotina      : bbtnConfirmarClick
// Pendência   : 23114
// Descricao   : Tratar habilitação de botões no confirmar da operação de inserir.
//------------------------------------------------------------------------------

{==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/04/2002 A 22/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12k                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUSÃO DA INFORMAÇÃO DIA DE PAGAMENTO PARA O PAGAMENTO DO CONVÊNIO.      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/05/2002 A 07/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12l                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUSÃO DA INFORMAÇÃO MES DE PAGAMENTO PARA O PAGAMENTO DO CONVÊNIO.      |
| - INCLUSÃO DA INFORMAÇÃO MES DE REFERENCIA PARA IMPORTAÇÃO DO CONVÊNIO       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 16/05/2002 A 16/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12R                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUSÃO DA INFORMAÇÃO DE LIMITE MINIMO E MAXIMO PARA DESCONTO DE          |
|   CONVENIOS.                                                                 |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/11/2002 A 06/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS) - Pendência 9727.                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Inclusão da Informação Codigo de Controle.       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/12/2002 A 11/12/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Tratamento da data de pagamento em dias uteis.   |
|   Novo campo na tabela LayoutDesconto "flgDiaUtil".                          |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 27/12/2002 A 30/12/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF) - Pendências 10790 e 10792.                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Exibir código com descricão das rubricas.        |
|  - Exibicão no grid de todos os campos da tabela "LAYOUTCCOLUNAS".           |
|  - Inclusão da procedure AbreQryDetalhe com modificação da qryDet.           |
|  - Inclusão da função CodDescrRubrica.                                       |
|  - Acerto nas rotinas de gravação do detalhe.                                |
|  - Inclusão de Filtros em MontaSelectRubrica, para filtrar tipo normal ou    |
|     devolução.                                                               |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/01/2003 A 02/01/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: () - Pendência 11206.                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Parametrização para o portador-forma da entidade |
|  conveniada.                                                                 |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/01/2002 A 07/01/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF) - Pendência 11332.                                         |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Tratamento do portador forma de Recebimento para |
|   o favorecido - campo "CodPortFormaFvRec" da tabela "LayoutDesconto".       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 13/01/2002 A 13/01/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF) - Pendência 11471.                                         |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Acerto e modificação da rotina que verifica as   |
|  posições dos campos no lay-out.                                             |                                                                |
|==============================================================================}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  wwdblook, wwdbedit, DBGrids, Wwdotdot, Wwdbcomb, CmEventosCadastro, uautorizacao, 
  ImgList, DBCtrls, Wwdbspin, FCadastroCs,{$IFNDEF VERSAO0505} uCMTypes, {$ENDIF} {UMensErro,} UDatabase,
  DBaseDados, UModulo, UIntegraBack, TREdit, uSistema, UFuncoesFolha,
  mRegraDB, CMProcuraMask;

type
  TfrmCadLayoutDesconto = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    gbValor: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    pgctrlMestre: TPageControl;
    tbsTitular: TTabSheet;
    tbsFavorecido: TTabSheet;
    tbsDependente: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    rdbtnMatricula: TRadioButton;
    rdbtnInscricao: TRadioButton;
    Label8: TLabel;
    Label9: TLabel;
    MontaSelectFavorecido: TMontaSelect;
    qryDet: TwwQuery;
    udpDet: TUpdateSQL;
    dbedtDescricao: TwwDBEdit;
    dbedtMatriculaPosicao: TwwDBEdit;
    dbedtMatriculaTam: TwwDBEdit;
    dbedtDepPosicao: TwwDBEdit;
    dbedtDepTam: TwwDBEdit;
    dbedtPosicaoValor: TwwDBEdit;
    dbedtTamValor: TwwDBEdit;
    qryFavorecido: TwwQuery;
    Label13: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    dbedtFavPosicao: TwwDBEdit;
    Label22: TLabel;
    dbedtFavTam: TwwDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    dbedtNumDecimais: TwwDBEdit;
    dbcboCaracDecimal: TwwDBComboBox;
    Label31: TLabel;
    Panel3: TPanel;
    edtfavorecido: TEdit;
    Label10: TLabel;
    bbtnSelecionaFavorecido: TBitBtn;
    tbsTipoConvenio: TTabSheet;
    dbrTipoConv: TDBRadioGroup;
    dblkRegras: TDBLookupComboBox;
    Label12: TLabel;
    qryRegras: TwwQuery;
    dsRegras: TwwDataSource;
    PNLRUBRICAS: TPanel;
    pnlRubmanual: TPanel;
    Label30: TLabel;
    edtRubricaDevolucao: TEdit;
    bbtnSelecionaRubricaDevolucao: TBitBtn;
    Label6: TLabel;
    edtRubricaNormal: TEdit;
    bbtnSelecionaRubricaNormal: TBitBtn;
    pnlRubAutomatica: TPanel;
    gbxrubricas: TGroupBox;
    Label7: TLabel;
    Label11: TLabel;
    dbedtPosicaoRubrica: TwwDBEdit;
    dbedtTamRubrica: TwwDBEdit;
    gbxsequencial: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    dbedtPosicaoSequencial: TwwDBEdit;
    dbedtTamSequencial: TwwDBEdit;
    gbxParcelas: TGroupBox;
    Label20: TLabel;
    Label25: TLabel;
    dbedtPosicaoParcelas: TwwDBEdit;
    dbeDtTamParcelas: TwwDBEdit;
    gbValorInformativo: TGroupBox;
    Label14: TLabel;
    Label17: TLabel;
    dbedtPosicaoValinfo: TwwDBEdit;
    dbedtTamValinfo: TwwDBEdit;
    GroupBox1: TGroupBox;
    dbechrNatureza: TwwDBEdit;
    Label19: TLabel;
    Label26: TLabel;
    wwDBEdit1: TwwDBEdit;
    tbsFechamento: TTabSheet;
    dbrTratamento: TDBRadioGroup;
    MontaSelectRubrica: TMontaSelect;
    tbsTratamentoHeader: TTabSheet;
    dbrUtilizaHeadTrai: TDBRadioGroup;
    gbxqtdHeadTrai: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    dbeLinhasHeader: TwwDBEdit;
    dbeLinhasTrailler: TwwDBEdit;
    gbDiaPag: TGroupBox;
    dbspinDiaPagto: TwwDBSpinEdit;
    dbrdgMesPag: TDBRadioGroup;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label32: TLabel;
    dbeColOperacao: TwwDBEdit;
    GroupBox5: TGroupBox;
    Label36: TLabel;
    dbeColMesRef: TwwDBEdit;
    GroupBox3: TGroupBox;
    Label40: TLabel;
    dbedtPosControle: TwwDBEdit;
    Label41: TLabel;
    dbEdtTamControle: TwwDBEdit;
    dbrdgDiaUtil: TDBRadioGroup;
    tbsFinanceiro: TTabSheet;
    dbrdgContasAReceber: TDBRadioGroup;
    dbrdgContasAPagar: TDBRadioGroup;
    tbsPortForma: TTabSheet;
    GroupBox4: TGroupBox;
    GroupBox6: TGroupBox;
    dblkPortFormaRec: TwwDBLookupCombo;
    dblkPortFormaPag: TwwDBLookupCombo;
    qryDetIDLAYOUT: TFloatField;
    qryDetCOLVALOR: TFloatField;
    qryDetTAMVALOR: TFloatField;
    qryDetIDRUBRICA: TFloatField;
    qryDetIDFAVORECIDO: TFloatField;
    qryDetPLANO: TFloatField;
    qryDetPLACONTAC: TStringField;
    qryDetPLACONTAD: TStringField;
    qryDetCODCENTRORESPON: TStringField;
    qryDetUNIDNEGOC: TFloatField;
    qryDetIDEMPRESA: TFloatField;
    qryDetCODCENTROCUSTO: TStringField;
    qryDetRECPAG: TStringField;
    qryDetCODTIPRECDES: TStringField;
    qryDetNUMDECIMAIS: TFloatField;
    qryDetCARACDECIMAL: TStringField;
    qryDetIDRUBRICADEVOL: TFloatField;
    qryDetCOLPARCELAS: TFloatField;
    qryDetTAMPARCELAS: TFloatField;
    qryDetCOLOCORRENCIAS: TFloatField;
    qryDetTAMOCORRENCIAS: TFloatField;
    qryDetCOLRUBRICA: TFloatField;
    qryDetTAMRUBRICA: TFloatField;
    qryDetIDREGRA: TFloatField;
    qryDetCOLVALINFO: TFloatField;
    qryDetTAMVALINFO: TFloatField;
    qryDetCARACNATUREZA: TStringField;
    qryDetCOLNATUREZA: TFloatField;
    qryDetCOLOPERACAO: TFloatField;
    qryDetCOLMESREF: TStringField;
    qryDetCOLCONTROLE: TFloatField;
    qryDetTAMCONTROLE: TFloatField;
    qryDetDESCR_RUBRICA: TStringField;
    qryDetRUBRICA_DEVOL: TStringField;
    qryDetFAVORECIDO: TStringField;
    qryDetNOMEREGRA: TStringField;
    qryDetDESCRICAOREGRA: TMemoField;
    sbtnReplicar: TToolbarButton97;
    tbsImportacao: TTabSheet;
    ChkAtivos: TCheckBox;
    chkCritica: TCheckBox;
    ChkcriticaRubrica: TCheckBox;
    cboxEletronico: TCheckBox;
    Label28: TLabel;
    cbboxBeneficio: TComboBox;
    Label35: TLabel;
    cbboxDuplicado: TComboBox;
    tbsTxAdmin: TTabSheet;
    molRegraCalcTx: TmolRegraDB;
    Label37: TLabel;
    Label38: TLabel;
    DBcboTipoDesemb: TwwDBLookupCombo;
    mskCCBaixa: TCMProcuraMaskContabil;

    procedure bbtnSelecionaRubricaDevolucaoClick(Sender: TObject);
    procedure bbtnSelecionaRubricaNormalClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbedtFavPosicaoChange(Sender: TObject);
    procedure dbedtFavTamChange(Sender: TObject);
    procedure dbedtDepPosicaoChange(Sender: TObject);
    procedure dbedtDepTamChange(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnSelecionaFavorecidoClick(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure edtRubricaNormalExit(Sender: TObject);
    procedure edtRubricaDevolucaoExit(Sender: TObject);
    procedure edtRubricaDevolucaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtRubricaDevolucaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtfavorecidoExit(Sender: TObject);
    procedure dbrUtilizaHeadTraiChange(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure dbrdgContasAPagarChange(Sender: TObject);
    procedure qryDetAfterPost(DataSet: TDataSet);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbrdgContasAReceberChange(Sender: TObject);
    procedure dbedtTamValorChange(Sender: TObject);
    procedure dbedtPosicaoValorChange(Sender: TObject);
    procedure sbtnReplicarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure molRegraCalcTxbtnBuscaRegraClick(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure DBcboTipoDesembCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBcboTipoDesembExit(Sender: TObject);
    procedure mskCCBaixaExit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private // Private declarations

    liidfavorecido, liidrubricanormal, liidrubricadevol : integer;
    iIdLayout: Integer;
    lstPosicoes : tstringlist;

    function  CodDescrRubrica(pIdRubrica: String): String;
    procedure AbreQryDetalhe(pIdLayout: Integer);


  public  // Public declarations


  end;



var
  frmCadLayoutDesconto: TfrmCadLayoutDesconto;



implementation

{$R *.DFM}

uses
  dLookFolha, uObjFolha, UmensErro;



procedure TfrmCadLayoutDesconto.FormShow(Sender: TObject);
begin
  inherited;

  WindowState := wsMaximized;

  with dbgrdDet.Selected do
  begin
    Clear;
    Add('IDLAYOUT'#9'8'#9'Código'#9'F');
    Add('COLVALOR'#9'8'#9'  Coluna ~ do Valor'#9'F');
    Add('TAMVALOR'#9'8'#9'Tamanho ~ do Valor'#9'F');
    Add('NUMDECIMAIS'#9'8'#9' Número ~Decimais'#9'F');
    Add('CARACDECIMAL'#9'1'#9'Caracter ~Decimal'#9'F');
    Add('DESCR_RUBRICA'#9'60'#9'Código/Descrição da Rubrica'#9'F');
    Add('COLRUBRICA'#9'9'#9'  Coluna ~da Rubrica'#9'F');
    Add('TAMRUBRICA'#9'9'#9' Tamanho ~da Rubrica'#9'F');
    Add('COLPARCELAS'#9'10'#9' Coluna Nº ~de Parcelas'#9'F');
    Add('TAMPARCELAS'#9'10'#9'Tamanho Nº ~de Parcelas'#9'F');
    Add('COLVALINFO'#9'10'#9'Coluna Valor ~ Informativo'#9'F');
    Add('TAMVALINFO'#9'10'#9'Tamanho Valor ~  Informativo'#9'F');
    Add('RUBRICA_DEVOL'#9'60'#9'Rubrica de Devolução'#9'F');
    Add('CARACNATUREZA'#9'1'#9'Caracter ~Natureza'#9'F');
    Add('COLNATUREZA'#9'8'#9'Coluna ~Natureza'#9'F');
    Add('FAVORECIDO'#9'35'#9' Nome do Favorecido'#9'F');
    Add('NOMEREGRA'#9'40'#9'Regra Associada'#9'F');
    Add('DESCRICAOREGRA'#9'8'#9'Descrição ~da Regra'#9'F');
    Add('COLOPERACAO'#9'10'#9'Coluna Cód. ~ Operação'#9'F');
    Add('COLMESREF'#9'7'#9'Coluna Mês ~Referência'#9'F');
    Add('COLCONTROLE'#9'10'#9'Coluna Cód. ~ Controle'#9'F');
    Add('TAMCONTROLE'#9'10'#9'Tam. Cód. ~ Controle'#9'F');
  end; {With}

  qry.Close;
  qry.Prepare;

  pgctrlMestre.ActivePage := tbsTitular;

  MontaSelectRubrica.ValoresChave.Clear;
  MontaSelectRubrica.Colunas.Clear;

  if SistemaFolha.FlgUsaCodRubExt = 0 then
  begin
    MontaSelectRubrica.ValoresChave.Add('IDPROVENTO');
    MontaSelectRubrica.ValoresChave.Add('DESCRICAO');
    MontaSelectRubrica.Colunas.Add('IDPROVENTO');
    MontaSelectRubrica.Colunas.Add('DESCRICAO');
  end
  else
  begin
    MontaSelectRubrica.ValoresChave.Add('IDPROVENTO');
    MontaSelectRubrica.ValoresChave.Add('DESCRPROVDESC');
    MontaSelectRubrica.Colunas.Add('CODPROVDESC');
    MontaSelectRubrica.Colunas.Add('DESCRPROVDESC');
  end;

  // -----------------------------------------------------------------------------------------------

  mskCCBaixa.Mascara  := IntegraBack.MascaraPlano;
  mskCCBaixa.Plano    := IntegraBack.Plano;

  with dtmLookFolha do
  begin
    sqlTipoDesemb.Prepare;
    sqlTipoDesemb.ParamByName('PIDPESSOA').AsInteger    := Sistema.IdEmpresa;
    sqlTipoDesemb.Open;

    sqlPortFormaPag.Prepare;
    sqlPortFormaPag.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
    sqlPortFormaPag.Open;

    sqlPortFormaRec.Prepare;
    sqlPortFormaRec.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
    sqlPortFormaRec.Open;
  end;
  // -----------------------------------------------------------------------------------------------
end;



procedure TfrmCadLayoutDesconto.CmeDetalheDelete(Sender: TObject);
begin
  // Thiago Melo SOL 206194 Kintana 1998160
  if not dtmBaseDados.dbBaseDados.InTransaction then begin
    dtmBaseDados.dbBaseDados.StartTransaction;
  end;
  // Thiago Melo SOL 206194 Kintana 1998160

  If not qryDet.isempty then qryDet.Delete;
  { Atualiza as modicações }
  QryDet.ApplyUpdates;
  QryDet.CommitUpdates;
end;

Procedure TfrmCadLayoutDesconto.AbreQryDetalhe(pIdLayout:Integer);
Var sSql: String;
begin
  qryDet.Sql.Clear;
  sSql:='SELECT LC.IDLAYOUT,LC.COLVALOR,LC.TAMVALOR,LC.IDRUBRICA,'+
        'LC.IDFAVORECIDO,LC.PLANO,LC.PLACONTAC,LC.PLACONTAD,'+
        'LC.CODCENTRORESPON,LC.UNIDNEGOC,LC.IDEMPRESA,'+
        'LC.CODCENTROCUSTO,LC.RECPAG,LC.CODTIPRECDES,LC.NUMDECIMAIS,'+
        'LC.CARACDECIMAL,LC.IDRUBRICADEVOL,LC.COLPARCELAS,'+
        'LC.TAMPARCELAS,LC.COLOCORRENCIAS,LC.TAMOCORRENCIAS,'+
        'LC.COLRUBRICA,LC.TAMRUBRICA,LC.IDREGRA,LC.COLVALINFO,'+
        'LC.TAMVALINFO,LC.CARACNATUREZA,LC.COLNATUREZA,'+
        'LC.COLOPERACAO,LC.COLMESREF,LC.COLCONTROLE,'+
        'LC.TAMCONTROLE,';
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+' PD.IDPROVENTO||'' - ''||PD.DESCRICAO AS DESCR_RUBRICA, '+
               ' PV.IDPROVENTO||'' - ''||PV.DESCRICAO AS RUBRICA_DEVOL, '
  else sSql:=sSql+' PD.CODPROVDESC||'' - ''||PD.DESCRPROVDESC AS DESCR_RUBRICA, ' +
                  ' PV.CODPROVDESC||'' - ''||PV.DESCRPROVDESC AS RUBRICA_DEVOL, ';
  sSql:=sSql+' FV.NOME AS FAVORECIDO, RG.NOMEREGRA, RG.DESCRICAOREGRA '+
             ' FROM PESSOA FV, LAYOUTXCOLUNAS LC, PROVDESC PD, '+
             ' PROVDESC PV, REGRA RG '+
             ' WHERE LC.IDLAYOUT = :IDLAYOUT '+
             ' AND LC.IDRUBRICA = PD.IDPROVENTO(+) '+
             ' AND LC.IDRUBRICADEVOL = PV.IDPROVENTO(+) '+
             ' AND LC.IDFAVORECIDO = FV.IDPESSOA(+) '+
             ' AND LC.IDREGRA = RG.IDREGRA(+)';
  qryDet.Sql.Add(sSql);
  qryDet.ParamByName('IDLAYOUT').asInteger:=pIdLayOut;
  qryDet.Open;
  edtRubricaNormal.text:=CodDescrRubrica(qryDet.fieldbyname('idrubrica').asstring);
  edtRubricaDevolucao.text:=CodDescrRubrica(qryDet.fieldbyname('idrubricadevol').asstring);
end;

Function TfrmCadLayoutDesconto.CodDescrRubrica(pIdRubrica:String):String;
Var qryTmp: TwwQuery;
begin
  qryTmp:=TwwQuery.Create(Application);
  qryTmp.DatabaseName:='BaseDados';
  qryTmp.Close;
  qryTmp.Sql.Clear;
  qryTmp.Sql.Add('SELECT ');
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    qryTmp.Sql.Add(' IDPROVENTO || '' - '' || DESCRICAO AS DESCRICAO_RUBRICA ')
  else qryTmp.Sql.Add(' CODPROVDESC || '' - '' || DESCRPROVDESC AS DESCRICAO_RUBRICA ');
  qryTmp.Sql.Add(' FROM PROVDESC '+
                 ' WHERE IDPROVENTO = '+IntToStr(StrToIntDef(pIdRubrica,0))+
                 ' AND FLGTPRUBRICA LIKE ''%B%'' ');
  qryTmp.Open;
  If Not qryTmp.Eof then
    Result:=qryTmp.FieldByName('DESCRICAO_RUBRICA').AsString
  else Result:='';
  qryTmp.Close;
  qryTmp.Free;
end;

procedure TfrmCadLayoutDesconto.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  iIdLayOut:=0;
  if MontaSelect.RetornouValor then
  begin
    iIdLayout:=StrToIntDef(MontaSelect.ValoresChave[0],0);
    qry.close;
    qry.parambyname('IDLAYOUT').asinteger:=iIdLayOut;
    qry.open;

    if qry.FieldByName('FLGCHECARUBRICA').AsInteger = 1   then
      ChkcriticaRubrica.Checked := true
    else
      ChkcriticaRubrica.Checked := False;

    if qry.FieldByName('FLGIMPORTACAO').AsInteger = 1   then
      chkCritica.Checked := true
    else
      chkCritica.Checked := False;

    cbboxDuplicado.itemindex:=qry.FieldByName('FLGTRATADUPL').AsInteger;

    if qry.FieldByName('FLGIGNORADEMITIDO').AsInteger = 1  then
      ChkAtivos.Checked := True
    else
      ChkAtivos.Checked := False;

    cbboxBeneficio.itemindex:=qry.FieldByName('FLGCOMBENEF').AsInteger;

    cboxEletronico.checked:=qry.FieldByName('FLGELETRONICO').AsInteger = 1; 

    AbreQryDetalhe(iIdLayout);

    pnlRubAutomatica.visible := TRUE;
    pnlRubManual.visible     := true;
    dblkregras.visible       := true;
    gbxparcelas.visible      := true;

    if strtoint(trim(MontaSelect.ValoresChave[4]))= 1 then
      rdbtnMatricula.checked:=true
    else
      rdbtnInscricao.checked := true;
  end;
end;

procedure TfrmCadLayoutDesconto.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  try
    iIdLayout:=LeUltRegistro(nil,'LAYOUTDESCONTO');
    qry.FieldByName('IDLAYOUT').asinteger:=iIdLayout;
    dbrdgContasAPagar.itemindex:=1;
    dbrdgContasAReceber.itemindex:=1;
  except
    showmessage('erro');
  end;
end;

procedure TfrmCadLayoutDesconto.CmeCadastroConfirma(Sender: TObject);
begin
  try
    if CmeCadastro.Operacao in [opInserir, opAlterar] then
    begin
      if rdbtnMatricula.checked then
        qry.FieldByName('FLGMATRICULA').asinteger := 1
      else
        qry.FieldByName('FLGMATRICULA').asinteger := 0;

      qry.fieldbyname('FLGENTSAI').asInteger := 0;

      If (StrToIntDef(qry.FieldByName('CODPORTFORMAFAV').AsString,0)=0)Or
          (dblkPortFormaPag.Text='')  then
        qry.FieldByName('CODPORTFORMAFAV').Clear;

      If (StrToIntDef(qry.FieldByName('CODPORTFORMAFVREC').AsString,0)=0)Or
          (dblkPortFormaRec.Text='')  then
        qry.FieldByName('CODPORTFORMAFVREC').Clear;

      { Atualiza as modicações }
      qry.ApplyUpdates;
      qry.CommitUpdates;
      { Atualiza as modicações }
      if (CmeDetalhe.Operacao in [opInserir, opAlterar])And
          (Not qryDet.FieldByName('IDLAYOUT').IsNull)And
           (Not qryDet.FieldByName('COLVALOR').IsNull)And
            (Not qryDet.FieldByName('TAMVALOR').IsNull)  then
      begin
        QryDet.ApplyUpdates;
        QryDet.CommitUpdates;
      end;
    end;
    inherited;
  except
    Screen.Cursor := crDefault;
    Raise;
    Repaint;
  end;
  AbreQryDetalhe(iIdLayout);
end;

procedure TfrmCadLayoutDesconto.bbtnSelecionaRubricaNormalClick(Sender: TObject);
begin
  inherited;
  MontaSelectRubrica.Filtro.Clear;
  MontaSelectRubrica.Filtro.Add('P.FLGATRASODEVOL = ''N''');
  MontaSelectRubrica.Filtro.Add('P.FLGTPRUBRICA LIKE ''%B%''');
  MontaSelectRubrica.Descricao.Clear;
  MontaSelectRubrica.TipodeDado.Clear;
  If SistemaFolha.FlgUsaCodRubExt = 0 then
  begin
    MontaselectRubrica.Descricao.add('Código Interno da Rubrica');
    MontaselectRubrica.Descricao.add('Descrição Interna da Rubrica');
    MontaselectRubrica.TipodeDado.Add('N');
    MontaselectRubrica.TipodeDado.Add('C');
  end
    else
      begin
        MontaselectRubrica.Descricao.add('Código Externo da Rubrica');
        MontaselectRubrica.Descricao.add('Descrição Externa da Rubrica');
        MontaselectRubrica.TipodeDado.Add('C');
        MontaselectRubrica.TipodeDado.Add('C');
      end;

  MontaSelectRubrica.Executar;
  Repaint;
  if MontaSelectRubrica.RetornouValor then
  begin
    liidrubricanormal:=strtoint(trim(MontaSelectRubrica.ValoresChave[0]));
    edtRubricaNormal.Text:=CodDescrRubrica(MontaSelectRubrica.ValoresChave[0]);
  end;
  edtRubricaNormal.Hint:=edtRubricaNormal.text;
end;

procedure TfrmCadLayoutDesconto.bbtnSelecionaRubricaDevolucaoClick(Sender: TObject);
begin
  inherited;
  MontaSelectRubrica.Filtro.Clear;
  MontaSelectRubrica.Filtro.Add('P.FLGATRASODEVOL = ''D''');
  MontaSelectRubrica.Filtro.Add('P.FLGTPRUBRICA LIKE ''%B%''');
  MontaSelectRubrica.Descricao.Clear;

  MontaSelectRubrica.TipodeDado.Clear;
   If SistemaFolha.FlgUsaCodRubExt = 0 then
   begin
        MontaselectRubrica.Descricao.add('Código Interno ');
        MontaselectRubrica.Descricao.add('Descrição Interna ');
        MontaselectRubrica.TipodeDado.Add('N');
        MontaselectRubrica.TipodeDado.Add('C');
   end
   else
   begin
        MontaselectRubrica.Descricao.add('Código Externo ');
        MontaselectRubrica.Descricao.add('Descrição Externa ');
        MontaselectRubrica.TipodeDado.Add('C');
        MontaselectRubrica.TipodeDado.Add('C');
   end;

  MontaSelectRubrica.Executar;
  Repaint;
  if MontaSelectRubrica.RetornouValor then
  begin
    liidrubricadevol:=strtoint(trim(MontaSelectRubrica.ValoresChave[0]));
    edtRubricaDevolucao.Text := CodDescrRubrica(MontaSelectRubrica.ValoresChave[0]);
  end;
  edtRubricaDevolucao.Hint:=edtRubricaDevolucao.text;
end;

procedure TfrmCadLayoutDesconto.bbtnSelecionaFavorecidoClick(
  Sender: TObject);
begin                      
  inherited;
  MontaSelectFavorecido.Executar;
  Repaint;
  if MontaSelectFavorecido.RetornouValor then
  begin
    liidfavorecido:=strtoint(trim(MontaSelectFavorecido.ValoresChave[0]));
    edtfavorecido.Text:=MontaSelectFavorecido.ValoresChave[1];
    edtfavorecido.Hint:=edtfavorecido.text;
  end
  else
    edtfavorecido.Hint := '';
end;

procedure TfrmCadLayoutDesconto.bbtnConfirmarClick(Sender: TObject);
Var Q, IndA, IndB, iQuantidade, iPosicao, iTamanho,
    iPosOutro, iTamOutro : Integer;
    bErro : Boolean;
    sTamanho, sPosicao : String;
    btratabotoes: boolean; 

{Sub}
Procedure Adiciona(St1,St2:String);
begin
  If (StrToIntDef(St1,0)>0)Or(StrToIntDef(St2,0)>0) then
  begin
    lstPosicoes.Add(Trim(St1)+';'+Trim(St2));
    Inc(iQuantidade);
  end;
end; {Adiciona}

{Sub}
Procedure MostraMsg(Tp:Byte);
Var Msg: String;
begin
  Case Tp Of
    1: Msg:='Existem Posições definidas sem o Tamanho correspondente.';
    2: Msg:='Existem Tamanhos definidos sem a Posição correspondente.';
    3: Msg:='Existem Posições sobrepostas na definição do lay-out';
  end; {Case}
  bErro := true;
  MsgDlg(Msg,'Atenção', mtWarning, [mbOk, mbHelp], 0);
end; {MostraMsg}

{Sub}
Procedure MostraMsg2(Tp:Byte);
Var Msg: String;
begin
  Case Tp Of
    1: Msg:='Campo Posição Matrícula não preenchido.';
    2: Msg:='Campo Tamanho Matrícula não preenchido.';
  end; {Case}
  bErro:=True;
  MsgDlg(Msg,'Atenção', mtWarning, [mbOk, mbHelp], 0);
  pgctrlMestre.ActivePage:=tbsTitular;
  tbsTitular.setfocus;
  Case Tp Of
    1: dbedtMatriculaPosicao.setfocus;
    2: dbedtMatriculaTam.setfocus;
  end;
end; {MostraMsg2}

begin
    bErro := false;
    iQuantidade:=0;
    // Verificacao da consistencia
    lstPosicoes.clear;
    lstPosicoes.Sorted:=false;

    if ChkcriticaRubrica.Checked  then
         qry.FieldByName('FLGCHECARUBRICA').AsInteger := 1
    else
          qry.FieldByName('FLGCHECARUBRICA').AsInteger := 0;

    if chkCritica.Checked  then
         qry.FieldByName('FLGIMPORTACAO').AsInteger := 1
    else
          qry.FieldByName('FLGIMPORTACAO').AsInteger := 0;

    qry.FieldByName('FLGTRATADUPL').AsInteger:=cbboxDuplicado.itemindex;

    if ChkAtivos.Checked  then
         qry.FieldByName('FLGIGNORADEMITIDO').AsInteger := 1
    else
         qry.FieldByName('FLGIGNORADEMITIDO').AsInteger := 0;

    qry.FieldByName('FLGCOMBENEF').AsInteger:=cbboxBeneficio.itemindex;

    qry.FieldByName('FLGELETRONICO').AsInteger:=byte(cboxEletronico.checked); 

    // 1) Identificacao do Titular
    Adiciona(qry.fieldbyname('COLCODIGO').asString,qry.fieldbyname('TAMCODIGO').asString);
    // 2) Dependente
    Adiciona(qry.fieldbyname('COLCODIGODEP').asString,qry.fieldbyname('TAMCODIGODEP').asString);
    // 3) Favorecido
    Adiciona(qry.fieldbyname('COLCODFAVORECIDO').asString,qry.fieldbyname('TAMCODFAVORECIDO').asString);
    // 4) Valor
    Adiciona(qrydet.fieldbyname('COLVALOR').asString,qrydet.fieldbyname('TAMVALOR').asString);
    // 5) Rubrica
    Adiciona(qrydet.fieldbyname('COLRUBRICA').asString,qrydet.fieldbyname('TAMRUBRICA').asString);
    // 6) Seq. Rubrica
    Adiciona(qrydet.fieldbyname('COLOCORRENCIAS').asString,qrydet.fieldbyname('TAMOCORRENCIAS').asString);
    // 7) Nº Parcelas
    Adiciona(qrydet.fieldbyname('COLPARCELAS').asString,qrydet.fieldbyname('TAMPARCELAS').asString);
    // 8) Valor Informativo
    Adiciona(qrydet.fieldbyname('COLVALINFO').asString,qrydet.fieldbyname('TAMVALINFO').asString);
    // 9) Código de Controle
    Adiciona(qrydet.fieldbyname('COLCONTROLE').asString,qrydet.fieldbyname('TAMCONTROLE').asString);

    If iQuantidade>1 then
    begin
      (* Necessário Decrementar iQuantidade *)
      Dec(iQuantidade);
      (* ====================== *)

      (* Prepara Informação no stringList *)
      (* Não haverá ordenação *)
      For Q := 0 to iQuantidade do
      begin
        sPosicao:=Piece(lstPosicoes[Q],';',1);
        iPosicao:=StrToIntDef(sPosicao,0);
        If iPosicao<10 then sPosicao:='0'+IntToStr(iPosicao);

        sTamanho:=Piece(lstPosicoes[Q],';',2);
        iTamanho:=StrToIntDef(sTamanho,0);
        If iTamanho<10 then sTamanho:='0'+IntToStr(iTamanho);

        lstPosicoes[Q]:= sPosicao+';'+sTamanho;
      end; {For}

      For Q := 0 to iQuantidade do
      begin
        iPosicao:=StrToIntDef(Piece(lstPosicoes[Q],';',1),0);
        iTamanho:=StrToIntDef(Piece(lstPosicoes[Q],';',2),0);

        If (iPosicao>0)And(iTamanho=0) then MostraMsg(1);

        If (iPosicao=0)And(iTamanho>0) then MostraMsg(2);

        IndA:=0;
        If (iPosicao>0)And(iTamanho>0) then
        Repeat
          Inc(IndA);
          IndB:=0;
          Repeat
            If IndB<>Q then
            begin
              iPosOutro:=StrToIntDef(Piece(lstPosicoes[IndB],';',1),0);
              iTamOutro:=StrToIntDef(Piece(lstPosicoes[IndB],';',2),0);
              If ((iPosicao+IndA)-1 In [iPosOutro..(iPosOutro+iTamOutro)-1])And
                  (iPosOutro>0)And(iTamOutro>0) then MostraMsg(3);
            end;
            Inc(IndB);
          Until(IndB>=iQuantidade)Or(bErro);
        Until(IndA>=iTamanho)Or(bErro);
      end; {For iQuantidade}
    end; {iQuantidade>1}

    If (trim(dbedtMatriculaPosicao.TEXT) = '') then MostraMsg2(1)
    else If (trim(dbedtMatriculaTam.TEXT) = '') then MostraMsg2(2);

    If Not bErro then
    begin
      btratabotoes:=CmeCadastro.Operacao = opInserir;

      If dtmBaseDados.dbBaseDados.InTransaction then begin
        // Thiago Melo SOL 206194 Kintana 1998160
        dtmBaseDados.dbBaseDados.Commit;
        // Thiago Melo SOL 206194 Kintana 1998160
      end;

      inherited;
      If not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;
       if not Sistema.GravaLogOperacoes('Fechamento de Convênio.') then
         Raise Exception.Create('Não foi possível gravar o log.')
       else
         dtmBaseDados.dbBaseDados.Commit;

         qryDet.Active := true;
         sbtnInserir.down  := false;
         sbtnProcurar.down := false;
       if btratabotoes then
         CmeCadastroAtualizaBotoes(Sender);
    end; {bErro}
end;

procedure TfrmCadLayoutDesconto.sbtnInserirClick(Sender: TObject);
begin
  If sbtnInserir.Down then
  begin
    if not(qry.Active) then
      qry.open;
    qryDet.Active := false;
    inherited;
    sbtnInsDet.Enabled:=False;
    tb97Detalhe.Enabled:=False;
    pgctrlMestre.ActivePage:=tbsTitular;
    tbsTitular.setfocus;
    dbedtDescricao.setfocus;
  end;
end;

procedure TfrmCadLayoutDesconto.bbtnOkDetClick(Sender: TObject);
begin

  // Thiago Melo SOL 206194 Kintana 1998160
  if not dtmBaseDados.dbBaseDados.InTransaction then begin
    dtmBaseDados.dbBaseDados.StartTransaction;
  end;
  // Thiago Melo SOL 206194 Kintana 1998160


  If (qryDet.FieldByName('COLVALOR').IsNull)Or
      (qryDet.FieldByName('TAMVALOR').IsNull) then
  begin
    MsgDlg('Preencher posição do valor e o tamanho do valor!',
            'Atenção', mtWarning, [mbOk, mbHelp], 0);
    Exit;
  end;
  if qryDet.State in [dsInsert] then
    qryDet.FieldByName('IDLAYOUT').asinteger:=iIdLayout;
  inherited;
  AbreQryDetalhe(iIdLayout);
  bbtnvoltardet.enabled:=true;
  bbtnVoltarDetClick(Self);
  If sbtnInserir.Enabled then bbtnCancelarClick(Self);
  (* Se qryDet sem registros habilita sbtnInsSet *)
  sbtnInsDet.Enabled:=qryDet.RecordCount=0;
  bbtnConfirmar.Enabled:=True;
end;

procedure TfrmCadLayoutDesconto.sbtnInsDetClick(Sender: TObject);
begin
  AbreQryDetalhe(0);
  liidrubricanormal:=0;
  liidRubricadevol :=0;
  liidFavorecido   :=0;

  qryRegras.Open;

  qryFavorecido.close;
  qryFavorecido.ParambyName('idforcli').asInteger:=qryDet.fieldbyname('IDFAVORECIDO').asinteger;
  qryFavorecido.open;

  edtfavorecido.text:=qryFavorecido.fieldbyname('razaosocial').ASSTRING;
  dbedtPosicaoValor.setfocus;
  tb97Detalhe.Enabled:=True;
  bbtnconfirmar.enabled := false;
  inherited;
end;

procedure TfrmCadLayoutDesconto.sbtnAltDetClick(Sender: TObject);
begin
  if qryDet.fieldbyname('IDFAVORECIDO').asinteger > 0 Then
  begin
    qryFavorecido.close;
    qryFavorecido.ParamByName('IDFORCLI').asinteger:=qryDet.fieldbyname('IDFAVORECIDO').asinteger;
    qryFavorecido.open;
    edtfavorecido.text:=qryFavorecido.fieldbyname('RAZAOSOCIAL').asstring;
  end
  else
    edtfavorecido.text:='';

  qryRegras.Open;

  edtRubricaNormal.text:=CodDescrRubrica(qryDet.fieldbyname('idrubrica').asstring);

  edtRubricaDevolucao.text:=CodDescrRubrica(qryDet.fieldbyname('idrubricadevol').asstring);

  liidFavorecido:=qryDet.fieldbyname('IDFAVORECIDO').asinteger;
  liidRubricanormal:=qryDet.fieldbyname('IDRUBRICA').asinteger;
  liidRubricadevol:=qryDet.fieldbyname('IDRUBRICADEVOL').asinteger;
  dbedtPosicaoValor.setfocus;
  inherited;
end;

procedure TfrmCadLayoutDesconto.bbtnCancelarClick(Sender: TObject);
begin
  qryDet.Active:=true;
  inherited;
  // Thiago Melo SOL 206194 Kintana 1998160
  if dtmBaseDados.dbBaseDados.InTransaction then begin
    dtmBaseDados.dbBaseDados.Rollback;

    QryDet.CancelUpdates;
  end;
  // Thiago Melo SOL 206194 Kintana 1998160
end;

procedure TfrmCadLayoutDesconto.dbedtFavPosicaoChange(Sender: TObject);
begin
  inherited;
  if dbedtFavPosicao.Text <> '' Then
    bbtnSelecionaFavorecido.Enabled := False
  else
    if dbedtFavTam.Text <> '' Then
      bbtnSelecionaFavorecido.Enabled := False
    else
      bbtnSelecionaFavorecido.Enabled := True;
end;

procedure TfrmCadLayoutDesconto.dbedtFavTamChange(Sender: TObject);
begin
  inherited;
  if dbedtFavTam.Text <> '' Then
     bbtnSelecionaFavorecido.Enabled:=False
  else
    if dbedtFavPosicao.Text <> '' Then
      bbtnSelecionaFavorecido.Enabled := False
    else
      bbtnSelecionaFavorecido.Enabled := True;
end;

procedure TfrmCadLayoutDesconto.dbedtDepPosicaoChange(Sender: TObject);
begin
  inherited;
  If (bbtnConfirmar.Enabled) and (qry.State = dsEdit) then
  begin
    if dbedtDepPosicao.Text <> '' Then
      qry.FieldByName('FlgPossuiDep').AsInteger := 1
    else
      if dbedtDepTam.Text <> '' Then
        qry.FieldByName('FlgPossuiDep').AsInteger := 1
      else
        qry.FieldByName('FlgPossuiDep').AsInteger := 0;
  end;
end;

procedure TfrmCadLayoutDesconto.dbedtDepTamChange(Sender: TObject);
begin
  inherited;
  If (bbtnConfirmar.Enabled) and (qry.State = dsEdit) then
  Begin
    if dbedtDepTam.Text <> '' Then
      qry.FieldByName('FlgPossuiDep').AsInteger := 1
    else
      if dbedtDepPosicao.Text <> '' Then
        qry.FieldByName('FlgPossuiDep').AsInteger := 1
      else
        qry.FieldByName('FlgPossuiDep').AsInteger := 0;
  end;
end;

procedure TfrmCadLayoutDesconto.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  (* Se qryDet sem registros habilita sbtnInsSet *)
  sbtnInsDet.Enabled:=qryDet.RecordCount=0;
  dbedtDescricao.setfocus;
end;

procedure TfrmCadLayoutDesconto.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := true;
  (* Se qryDet sem registros habilita sbtnInsSet *)
  sbtnInsDet.Enabled:=qryDet.RecordCount=0;
end;

procedure TfrmCadLayoutDesconto.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
   if liidrubricanormal = 0 then
    qryDet.FieldByName('IDRUBRICA').clear
  else
    qryDet.FieldByName('IDRUBRICA').asinteger:=liidrubricanormal;
  if liidrubricadevol = 0 then
    qryDet.FieldByName('IDRUBRICADEVOL').clear
  else
    qryDet.FieldByName('IDRUBRICADEVOL').asinteger:=liidrubricadevol;
  if liidfavorecido = 0 then
    qryDet.FieldByName('IDFAVORECIDO').clear
  else
    qryDet.FieldByName('IDFAVORECIDO').asinteger:=liidfavorecido;
end;

procedure TfrmCadLayoutDesconto.edtRubricaNormalExit(Sender: TObject);
begin
  inherited;
   if edtRubricaNormal.text = '' then
    liidRubricanormal:=0;
end;

procedure TfrmCadLayoutDesconto.edtRubricaDevolucaoExit(Sender: TObject);
begin
  inherited;
    if edtRubricaDevolucao.text = '' then
    liidRubricadevol:=0;
end;

procedure TfrmCadLayoutDesconto.edtRubricaDevolucaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
    if (Key <> vk_delete) and (Key <> VK_BACK) then
    key:=0
  else
    (sender as tedit).text:='';
end;

procedure TfrmCadLayoutDesconto.edtRubricaDevolucaoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  Key:=#0;
end;

procedure TfrmCadLayoutDesconto.edtfavorecidoExit(Sender: TObject);
begin
  inherited;
  if edtfavorecido.text = '' then
  liidfavorecido:=0;
end;

procedure TfrmCadLayoutDesconto.dbrUtilizaHeadTraiChange(Sender: TObject);
begin
  inherited;
  If dbrUtilizaHeadTrai.ItemIndex = 0 then
     gbxqtdHeadTrai.visible := false
  else
     gbxqtdHeadTrai.visible := true;
  dbeLinhasHeader.text   := '0';
  dbeLinhasTrailler.text := '0';
end;

procedure TfrmCadLayoutDesconto.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('FLGTIPOCONVENIO').asinteger:=0;
  qry.fieldbyname('FLGTRATARESIDUO').asinteger:=0;
  qry.fieldbyname('DIAPAGAMENTO').asinteger:=1;
  qry.fieldbyname('FLGMESPAGTO').asinteger:=1;
end;

procedure TfrmCadLayoutDesconto.dbrdgContasAPagarChange(Sender: TObject);
begin
  inherited;
  dbspinDiaPagto.Enabled:=dbrdgContasAPagar.ItemIndex=0;
  dbrdgDiaUtil.Enabled:=dbrdgContasAPagar.ItemIndex=0;
  dbrdgMesPag.Enabled:=dbrdgContasAPagar.ItemIndex=0;
  dblkPortFormaPag.Enabled:=dbrdgContasAPagar.ItemIndex=0;
  cboxEletronico.Enabled:=dbrdgContasAPagar.ItemIndex=0;
  cboxEletronico.checked:=false;
end;

procedure TfrmCadLayoutDesconto.qryDetAfterPost(DataSet: TDataSet);
begin
  inherited;
  If qry.State In [dsInsert] then Exit;
  { Atualiza as modicações }
  if (CmeDetalhe.Operacao in [opInserir, opAlterar])And
      (Not qryDet.FieldByName('IDLAYOUT').IsNull)And
       (Not qryDet.FieldByName('COLVALOR').IsNull)And
        (Not qryDet.FieldByName('TAMVALOR').IsNull)  then
  begin
    QryDet.ApplyUpdates;
    QryDet.CommitUpdates;
  end;
  AbreQryDetalhe(iIdLayout);
  (* Se qryDet sem registros habilita sbtnInsSet *)
  sbtnInsDet.Enabled:=qryDet.RecordCount=0;
  dbgrdDet.BringToFront;
end;

procedure TfrmCadLayoutDesconto.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  (* Se qryDet sem registros habilita sbtnInsSet *)
  sbtnInsDet.Enabled:=qryDet.RecordCount=0;
end;

procedure TfrmCadLayoutDesconto.sbtnApagarClick(Sender: TObject);
begin
  If Not qryDet.IsEmpty then
  begin
    sbtnApagar.Down:=False;
    sbtnApagar.Enabled:=False;
    Exit;
  end;
  inherited;
end;

procedure TfrmCadLayoutDesconto.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  If (qryDet.IsEmpty)And(Not sbtnAlterar.Down) then
  begin
    sbtnApagar.Down:=False;
    sbtnApagar.Enabled:=True;
  end;
end;

procedure TfrmCadLayoutDesconto.FormCreate(Sender: TObject);
begin
  inherited;
  lstPosicoes:=tstringlist.create;
  lstPosicoes.Duplicates:=dupAccept;
end;

procedure TfrmCadLayoutDesconto.FormDestroy(Sender: TObject);
begin
  inherited;
  lstPosicoes.free;
end;

procedure TfrmCadLayoutDesconto.dbrdgContasAReceberChange(Sender: TObject);
begin
  inherited;
  dblkPortFormaRec.Enabled:=dbrdgContasAReceber.ItemIndex=0;
end;

procedure TfrmCadLayoutDesconto.dbedtTamValorChange(Sender: TObject);
begin
  inherited;
  If StrToIntDef(dbedtTamValor.Text,0)>99 then dbedtTamValor.Text:='';
end;

procedure TfrmCadLayoutDesconto.dbedtPosicaoValorChange(Sender: TObject);
begin
  inherited;
  If StrToIntDef(dbedtTamValor.Text,0)>999 then dbedtTamValor.Text:='';
end;

procedure TfrmCadLayoutDesconto.sbtnReplicarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCadLayoutDesconto.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnReplicar.enabled:=CmeCadastro.Operacao=opAlterar;
end;



procedure TfrmCadLayoutDesconto.molRegraCalcTxbtnBuscaRegraClick(Sender: TObject);
begin
  inherited;
  molRegraCalcTx.btnBuscaRegraClick(Sender);
end;



procedure TfrmCadLayoutDesconto.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if mskCCBaixa.Valida = vcOK then qry.FieldByName('PLANO').AsInteger := IntegraBack.Plano;
end;



procedure TfrmCadLayoutDesconto.DBcboTipoDesembCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  if qry.State in dsEditModes then
  begin
    if DBcboTipoDesemb.LookupValue <> '' then
    begin
      qry.FieldByName('RECPAG').AsString     := 'P';
      qry.FieldByName('IDPESSOA').AsInteger  := Sistema.IDEmpresa;
    end
    else
    begin
      qry.FieldByName('RECPAG').Clear;
      qry.FieldByName('IDPESSOA').Clear;
      qry.FieldByName('CODTIPRECDES').Clear;
    end;
  end;
end;



procedure TfrmCadLayoutDesconto.DBcboTipoDesembExit(Sender: TObject);
begin
  inherited;

  if qry.State in dsEditModes then
  begin
    if DBcboTipoDesemb.LookupValue <> '' then
    begin
      qry.FieldByName('RECPAG').AsString     := 'P';
      qry.FieldByName('IDPESSOA').AsInteger  := Sistema.IDEmpresa;
    end
    else
    begin
      qry.FieldByName('RECPAG').Clear;
      qry.FieldByName('IDPESSOA').Clear;
      qry.FieldByName('CODTIPRECDES').Clear;
    end;
  end;
end;



procedure TfrmCadLayoutDesconto.mskCCBaixaExit(Sender: TObject);
begin
  inherited;
  mskCCBaixa.Valida;
end;



procedure TfrmCadLayoutDesconto.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
   Accept := (mskCCBaixa.Valida = vcOk);
end;



procedure TfrmCadLayoutDesconto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  // Thiago Melo SOL 206194 Kintana 1998160
  if dtmBaseDados.dbBaseDados.InTransaction then begin
    dtmBaseDados.dbBaseDados.Rollback;
  end;
  // Thiago Melo SOL 206194 Kintana 1998160
end;

end.
