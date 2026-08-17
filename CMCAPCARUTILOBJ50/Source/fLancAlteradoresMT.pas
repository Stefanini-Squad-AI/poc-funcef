{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ -  Lançamento de Alteradores                          }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 16/09/2002                             }
{                                                       }
{*******************************************************}
{
{
----------------------------------------------------------------------------------------------
 N. Solicitação: WO27566
 Dt Alteração..: 07/11/2025
 Responsável...: Paulo Nobre
 Descrição.....: Deixando os campos: "Valor Base Retenção", "Tipo de Serviço" e
                 "Processo de Suspensão de Tributação" sempre visíveis e habilitados
----------------------------------------------------------------------------------------------
 N. Solicitação: WO24951
 Dt Alteração..: 02/09/2025
 Responsável...: Paulo Nobre
 Descrição.....: Rearrumado as posições dos campos "Valor Vase Retenção" e "Tipo de Serviço".
                 Alterado apenas o .DFM
----------------------------------------------------------------------------------------------
 N. Solicitação: WO24106
 Dt Alteração..: 08/08/2025
 Responsável...: Paulo Nobre
 Descrição.....: A rotina de atribuição do Valor do Documento para VALORBASERETENCAO foi
                 movida do evento dblkAlteradorChange para o dblkAlteradorCloseUp.  
//-----------------------------------------------------------------------------------------
// WO13994 - Controle Financeiro
// Data da Alteração..: 11/09/2024
// Responsável........: Arnaldo Vicente Scarin
// Rotina.............: CriaListaRateioDocumento
// Descrição..........: A Rotina CriaListaRateioDocumento é responsável por identificar
//                      Os Planos Previdenciarios e as Patrocinadoras, mas por falta do
//                      comando Distinct no Select, estava duplicando as informações.
//
//                      Houve alteração no DFM desse fonte.
//
//-----------------------------------------------------------------------------------------
// WO12487 - Contas a Pagar - Lançamento de alteradores
// Data da Alteração..: 18/07/2024
// Responsável........: Arnaldo Vicente Scarin
// Rotina.............: CriaListaRateioDocumento
// Descrição..........: A Rotina CriaListaRateioDocumento recebe um parametro,
//                      para fazer a verificação dos Dados que existem na Tabela
//                      RateioXAlterador. Esse problema só ocorre quando está sendo
//                      feita a alteração de um Alterador já lançado, que tenha utilizado
//                      todos os planos previdenciarios. Nesse caso não existirão dados
//                      na Tabela RateioXAlterador, e ocorre o erro pois os Planos Previdenciários
//                      não estavam sendo selecionados, gerando erro na gravação do Alterador.
//
//******************************************************************************
//N. Chamado....: SIG130578
//Dt Alteração..: 07/05/2024
//Responsável...: Arnaldo Vicente Scarin
//Descrição.....: Foi criado no Objeto CtrlDocumento uma nova propriedade
//                que contem os planos previdenciarios que serão escolhidos
//                na tela de Lançamento de Alteradores, para que possam
//                ser utilizados no Rateio dos dados.
//                Essa propriedade conterá somente os planos escolhidos para
//                o Rateio dos Alteradores, e esses lançamentos serão
//                armazenados na tabela RateioDocum com o Campo Valor Zerado
//                Tambem será criada uma nova tabela, para que haja o
//                relacionamento entre a Linha do Alterador que está na
//                tabela LanctoDocum e as linhas que estão na Tabela RateioDocum
//                para que haja rastreabilidade e em caso de exclusão do
//                alterador, possam ser excluidos os rateios
//******************************************************************************
//-----------------------------------------------------------------------------------------
//N. SIG.............: 116142
//Data da Alteração..: 13/07/2021
//Responsável........: Ewerton Beltramini
//Descrição..........: Inclusão do campo IDENVIODOCUMENTO para validação da exclusão.
//-----------------------------------------------------------------------------------------
//***************************************************************************************
//Rotina.............: dblkAlteradorChange
//N. SIG.............: 116274
//Data da Alteração..: 27/05/2021
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção no processo de lançamento de alteradores de retenção.
//***************************************************************************************
//Rotina.............: FormCreate, SelAlterador,.BtnSelecionaClick, CmeCadastroInsert,
//					           CmeCadastroBeforeConfirma, dblkAlteradorChange
//N. SIG.............: 115585
//Data da Alteração..: 18/05/2021
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de definição de tipo de serviço e valor base para
//                     alteradores de tributo.
//***************************************************************************************
//Rotina.............: (dfm) SQL, VerificaPeriodoBloqueio, BtnSelecionaClick, CmeCadastroBeforeConfirma
//                     sbtnApagar, sbtnAlterar
//N. SIG.............: 100840
//Data da Alteração..: 31/07/2020
//Responsável........: Edilaine
//Descrição..........: verificar período de bloqueio no módulo de origem do documento
//***************************************************************************************
//Rotina.............: CmeCadastroBeforeConfirma
//N. SIG.............: 90246
//Data da Alteração..: 27/08/2019
//Responsável........: Fábio Sampaio
//Descrição..........: Alteração para não solicitar o preenchimento das informação de
//                     "Definição de Dados de Nota Fiscal de Serviço" caso o campo
//                     "Núm Nota Fiscal" já exista no documento.
//***************************************************************************************
//Rotina.............: FormCreate, CmeCadastroBeforeConfirma, FormDestroy, SetDadosFDO
//N. SIG.............: 75760
//Data da Alteração..: 06/06/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração no lançamento de alterador, possiblitando alterar dados
//                     de documento financeiro, na definição de NFS no lançamento de
//                     alteradores específicos.
//***************************************************************************************
 Rotina......: CmeCadastroBeforeConfirma
 Nº SOL......: 223402
 Nº PPM......: 348444
 Data........: 22/04/2014
 Responsável.: Felipe A. Santos
 Descrição...: Foi corrigido o campo data de lançamento quando o cursor está na
               mesma e a tecla enter é disparada, foi a data de lançamento não
               estava atualizando.
------------------------------------------------------------------------------
 Rotina......: CmeCadastroApplyInsert
 Nº SOL......: 195755
 Nº KINTANA..: 1871968
 Data........: 04/12/2012
 Responsável.: Edilaine Ferraresi
 Descrição...: verifica se foi selecionado uma sub-despesa antes de filtrar
-----------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
}
{-----------------------------------------------------------------------------------------
SOl_Kintana : 158675_1290124
Data        : 20.05.2011
Analista    : Ricardo de Freitas Araújo
Descrição   : Ao lancar um alterador, verifica se o saldo do documento fica negativo e exibe
             uma tela de confirmação.
{-----------------------------------------------------------------------------------------
Pendência : 26058
Data      : 23.08.2007
Analista  : Marcus Oliveira
Descrição : Criado uma rotina para verificar se o usuário tem permissão de estornar um alterador.
{-----------------------------------------------------------------------------------------
Pendência : 18886
Data      : 27.01.2006
Analista  : Antonio Marcos Fernandes de Souza (amf)
Descrição : Adicionada a observação do Alterador Selecionado.
------------------------------------------------------------------------------------------
Pendência: 15369    -- retirado por FDias 19.07.2004
Data     : 24/05/2004
Analista : André Tavares
Descrição: Adaptar a query SqlContabilizacao para utilizar o filtro idplancentcust (DE-PARA)
------------------------------------------------------------------------------------------
Pendência: 15792
Data     : 30/12/2003
Analista : Alex Pereira
Descrição: Retirar a possibilidade de lançar Atividade/Projeto para o Alterador.
           O lookup foi mantido, mas invisível, para o caso de precisar
           habilitá-lo novamente no futuro.
-----------------------------------------------------------------------------------------}


unit fLancAlteradoresMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro,
  ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uCmSqlParams, wwdblook, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, Mask, DBCtrls, Grids, Wwdbigrd, Wwdbgrid,
  uCtrlLancAlteradores, uCmTypes, uCtrlDocumento, uCtrlFinanc,
  //amf 18886 27.01.2006
  uCtrlLancDocCapCar, //Cássio Rovaroto - SIG nº 75760
  uCtrlTipoAlterador, CMDBLookupCombo, CheckLst;

type
  TFrmLancAlteradores = class(TFrmCadastroMT)
    Sql: TCMSqlParams;
    GpDocumento: TGroupBox;
    Label3: TLabel;
    LblForne: TLabel;
    Label5: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    BtnSeleciona: TBitBtn;
    MsDoc: TMontaSelect;
    SqlCentroCusto: TCMSqlParams;
    CdsCentroCusto: TCMClientDataSet;
    SqlUnidNegocio: TCMSqlParams;
    CdsUnidNegocio: TCMClientDataSet;
    SqlAlteradores: TCMSqlParams;
    CdsAlteradores: TCMClientDataSet;
    sbtnEstornar: TToolbarButton97;
    SqlContabilizacao: TCMSqlParams;
    CdsContabillizacao: TCMClientDataSet;
    DsContabilizacao: TwwDataSource;
    PnlContab: TPanel;
    LblContabilizacao: TLabel;
    GrdContabilizacao: TwwDBGrid;
    CdsDel: TCMClientDataSet;
    PnlDadosAlterador: TPanel;
    lblAlterador: TLabel;
    lblValOut: TLabel;
    lblValor: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    lblUnidNegoc: TLabel;
    EdtHist: TDBEdit;
    DtLancto: TCMDateTimePicker;
    DbROutraMoeda: TDBRealEdit;
    DbrValor: TDBRealEdit;
    dblkAlterador: TwwDBLookupCombo;
    DbrValLiquido: TDBRealEdit;
    dblcUnidNegoc: TwwDBLookupCombo;
    CkbContabiliza: TCheckBox;
    SqlAuxDocs: TCMSqlParams;
    CdsAuxDocs: TCMClientDataSet;
    Label6: TLabel;
    mmObsAlt: TMemo;
    sqlPodeEstornar: TCMSqlParams;
    cdsPodeEstornar: TCMClientDataSet;
    SqlSaldoDocumento: TCMSqlParams;
    cdsSaldoDoc: TCMClientDataSet;
    cdsSubDespesaAlteradores: TCMClientDataSet;
    Label24: TLabel;
    cboAlteradoresDescRateio: TwwDBLookupCombo;
    edtValorBaseRetencao: TDBRealEdit;
    cboTipoServico: TwwDBLookupCombo;
    lblTipoServico: TLabel;
    lblValorBaseRetencao: TLabel;
    cboProcesso: TwwDBLookupCombo;
    lblProcessoJudicial: TLabel;
    sqlTipoServico: TCMSqlParams;
    cdsTipoServico: TCMClientDataSet;
    sqlProcessoSusp: TCMSqlParams;
    cdsProcessoSusp: TCMClientDataSet;
    ckbPlanosPrev: TCheckListBox;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnSelecionaClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dblkAlteradorCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure DbrValorExit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnEstornarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dblkAlteradorChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    _LancAlteradores: TCtrlLancAlteradores;
    _Documento: TCtrlDocumento;

    //David - Pendência 25536
    CtrlFinanc: TCtrlFinanc;

    //Marcus Oliveira P.26058 controlar a permissão ao Estorno pelo SAD
    bPodeEstornar: boolean;

    bReopenCds: Boolean;
    bEstorno: Boolean;
    _iCodDocumento: Integer;
    //amf 18886 27.01.2006
    CtrlTipoAlterador: TCtrlTipoAlterador;

    //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    cdsRateio: TCmClientDataSet;
    //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

    CtrlLancDocCapCar: TCtrlLancDocCapCar; //Cássio Rovaroto - SIG nº 75760

    bMsgAlteradorRetencao: Boolean; //Cássio Rovaroto - SIG nº 115585
    dValorDoc: Double; //Cássio Rovaroto - SIG nº 115585

    procedure SelAlterador(iCodDocumento, iNumLancto: Integer);
    procedure BuscaCentroDeCusto(sPlaconta: string);
    function VerificaDocBaixado(iCodDocumento: Integer): Boolean;
    function VerificaPeriodoBloqueio: boolean;   //edilaine SIG100840

    //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    procedure SetDadosFDO(AIDFORCLI: Integer; ACodDocumento: Double = 0);
    procedure CriaListaRateioDocumento(const pDocumento, pNumLancto: string; const bVerificaRateio: Boolean = false);
    //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  public
    { Public declarations }
  end;

var
  FrmLancAlteradores: TFrmLancAlteradores;

implementation

{$R *.DFM}

uses
  uSistema, uCtrlParamIntegra, uMensErro, uCtrlPadroes, uModulo, JclMath,
  FAtuDadosNFSDoc, //Cássio Rovaroto - SIG nº 75760
   //VANDER
  UCtrlOrcamento;

procedure TFrmLancAlteradores.FormCreate(Sender: TObject);
begin
  inherited;

  //O Tag da aplicação é alterado quando a tela é utilizada para alteração de saldo.
  //Nesse caso o tag da ser alterado aplicação tem o valor do CODDOCUMENTO a
  bEstorno := False;

  //Marcus Oliveira P.26058 23/08/2007 Se o usuario tiver acesso ao botão estornar tras 1 registro
  sqlPodeEstornar.Prepare;
  sqlPodeEstornar.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  sqlPodeEstornar.ParamByName('IDMODULO').AsInteger := Sistema.IdModulo;
  sqlPodeEstornar.Open;

  bPodeEstornar := (cdsPodeEstornar.RecordCount > 0);

  //Marcus Oliveira P.26058 23/08/2007 Fim

  //Cria a Classe de Controle
  _LancAlteradores := TCtrlLancAlteradores.Create;
  _LancAlteradores.InitializeAs(Padroes);
  _LancAlteradores.CdsLancAlteradores := Cds;

  _Documento := TCtrlDocumento.Create;
  ;
  _Documento.InitializeAs(Padroes);


  //David - Pendência 25536
  CtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, Sistema.UsaPlanoPatro);
  CtrlFinanc.InitializeAs(Padroes);

  //amf 18886 27.01.2006
  CtrlTipoAlterador := TCtrlTipoAlterador.Create;
  CtrlTipoAlterador.InitializeAs(Padroes);

  //Seta parâmetros e configurações da tela de acordo com a integração contábil
  //e o sistema de origem do lançamento
  CkbContabiliza.enabled := ParamIntegra.IntegraContab;
  CkbContabiliza.checked := not CkbContabiliza.enabled;

  PnlContab.Visible := ParamIntegra.IntegraContab;

  if not ParamIntegra.IntegraContab then
    Height := 360;

  if ParamIntegra.RecPag = 'R' then
    LblForne.Caption := 'Cliente'
  else
    LblForne.Caption := 'Fornecedor';

  MontaSelect.Filtro.Add('DOCUMENTO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add('DOCUMENTO.RECPAG = ''' + ParamIntegra.RecPag + '''');

  MsDoc.Filtro.Add('DOCUMENTO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  MsDoc.Filtro.Add('DOCUMENTO.RECPAG = ''' + ParamIntegra.RecPag + '''');

  //Abre os ClientDataSet´s da tela
  SelAlterador(0, 0);

  SqlUnidNegocio.Prepare;
  SqlUnidNegocio.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  SqlUnidNegocio.Open;

  SqlAlteradores.Prepare;
  SqlAlteradores.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  SqlAlteradores.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlAlteradores.Open;

  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  cdsRateio := TCmClientDataSet.Create(Nil);
  cdsRateio.Data := _Documento.Orcamento.ListaRateio(-1);
  cboAlteradoresDescRateio.LookUpTable := cdsRateio;
  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

  if (Application.Tag <> 0) then
  begin
    Height := 360;
    _iCodDocumento := Application.Tag;
    Application.Tag := 0;
    Dock972.Visible := False;
    BtnSeleciona.Enabled := False;
    PnlContab.Visible := False;
    sbtnInserir.Click;
    CmeCadastro.RepetirInsert := False;

    SqlAuxDocs.Prepare;
    SqlAuxDocs.ParamByName('CODDOCUMENTO').AsInteger := _iCodDocumento;
    SqlAuxDocs.Open;

    if CkbContabiliza.enabled and ((Trim(CdsAuxDocs.FieldByName('OPERACAO').AsString) = '3') or (Trim(CdsAuxDocs.FieldByName('OPERACAO').AsString) = '13')) then
      CkbContabiliza.checked := false;

    Cds.FieldByName('CODDOCUMENTO').AsInteger := CdsAuxDocs.FieldByName('CODDOCUMENTO').AsInteger;
    Cds.FieldByName('DATAPROGRAMADA').AsDateTime := CdsAuxDocs.FieldByName('DATAPROGRAMADA').AsDateTime;
    Cds.FieldByName('DOCCOMPL').AsString := CdsAuxDocs.FieldByName('NODOCUMENTO').AsString + '  ' + CdsAuxDocs.FieldByName('COMPLDOCUMENTO').AsString;
    Cds.FieldByName('RAZAOSOCIAL').AsString := CdsAuxDocs.FieldByName('RAZAOSOCIAL').AsString;
    Cds.FieldByName('PLACONTA').AsString := CdsAuxDocs.FieldByName('PLACONTA').AsString;

    if (Trim(CdsAuxDocs.FieldByName('CODCENTROCUSTO').AsString) = '') then
      BuscaCentroDeCusto(Cds.FieldByName('PLACONTA').AsString)
    else
    begin
      Cds.FieldByName('CODCENTROCUSTO').AsString := CdsAuxDocs.FieldByName('CODCENTROCUSTO').AsString;
      Cds.FieldByName('CODEXTERNO').AsString := CdsAuxDocs.FieldByName('CODEXTERNO').AsString;
    end;

    if (Trim(CdsAuxDocs.FieldByName('CODSUBCONTA').AsString) = '') then
      Cds.FieldByName('CODSUBCONTA').AsInteger := 0
    else
      Cds.FieldByName('CODSUBCONTA').AsString := CdsAuxDocs.FieldByName('CODSUBCONTA').AsString;

     //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    SetDadosFDO(CdsAuxDocs.FieldByName('IDFORCLI').Asinteger, CdsAuxDocs.FieldByName('CODDOCUMENTO').AsInteger);
     //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

    CdsAuxDocs.Close;
  end
  else
    _iCodDocumento := 0;


// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext := 30011;
    bbtnAjuda.HelpContext := 30011;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

  //Cássio Rovaroto - SIG nº 75760 - Início
  CtrlLancDocCapCar := TCtrlLancDocCapCar.Create;
  CtrlLancDocCapCar.InitializeAs(Padroes);
  //Cássio Rovaroto - SIG nº 75760 - Fim

  bMsgAlteradorRetencao := True; //Cássio Rovaroto - SIG nº 115585
  dValorDoc := 0; //Cássio Rovaroto - SIG nº 115585
  sqlTipoServico.Open;
  sqlProcessoSusp.Prepare;
  sqlProcessoSusp.ParamByName('PIDFORCLI').AsInteger := -1;
  sqlProcessoSusp.ParamByName('PDATAFIM').AsDate := Date();
end;

procedure TFrmLancAlteradores.SelAlterador(iCodDocumento, iNumLancto: Integer);
begin
  //Abre a query principal e caso o sistema estaja itegrado com a contabilidade
  //busca os lançamentos contábeis do alterador
  with Sql do
  begin
    Cds.Close;

    Prepare;
    ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;
    ParamByName('NUMLANCTO').AsInteger := iNumLancto;
    ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
    ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
    Open;

    if ParamIntegra.integraContab then
    begin
      SqlContabilizacao.Prepare;
      SqlContabilizacao.ParamByName('PLNCODIGO').AsInteger := Cds.FieldByName('PLNCODIGO').AsInteger;
      SqlContabilizacao.Open;
    end;

    CkbContabiliza.checked := (not Cds.IsEmpty) and (Cds.FieldByName('PLNCODIGO').AsInteger = 0);

    // Paulo Nobre - WO27566 - Inicio

    //Cássio Rovaroto - SIG nº 115585 - Início
 {   lblValorBaseRetencao.Visible := Cds.FieldByName('FLGVALORBASE').AsString = 'S';
    edtValorBaseRetencao.Visible := Cds.FieldByName('FLGVALORBASE').AsString = 'S';
    lblProcessoJudicial.Visible := Cds.FieldByName('FLGLANCANFS').AsString = 'S';
    cboProcesso.Visible := Cds.FieldByName('FLGLANCANFS').AsString = 'S';
    lblTipoServico.Visible := Cds.FieldByName('FLGLANCANFS').AsString = 'S';
    cboTipoServico.Visible := Cds.FieldByName('FLGLANCANFS').AsString = 'S';      }
    //Cássio Rovaroto - SIG nº 115585 - Fim

    // Paulo Nobre - WO27566 - Fim    
  end;
end;

procedure TFrmLancAlteradores.BtnSelecionaClick(Sender: TObject);
begin
  inherited;
  //Seleciona o documento para lançamento do alterador
  if (MsDoc.Executar = MrOk) and MsDoc.RetornouValor and VerificaDocBaixado(StrToInt(MsDoc.ValoresChave[0])) then
  begin
    Cds.FieldByName('CODDOCUMENTO').AsInteger := StrToInt(MsDoc.ValoresChave[0]);
    Cds.FieldByName('DATAPROGRAMADA').AsDateTime := StrToDate(MsDoc.ValoresChave[1]);
    Cds.FieldByName('DOCCOMPL').AsString := MsDoc.ValoresChave[2] + '  ' + MsDoc.ValoresChave[3];
    Cds.FieldByName('RAZAOSOCIAL').AsString := MsDoc.ValoresChave[4];
    Cds.FieldByName('PLACONTA').AsString := MsDoc.ValoresChave[5];

    if CkbContabiliza.enabled and ((Trim(MsDoc.ValoresChave[9]) = '3') or (Trim(MsDoc.ValoresChave[9]) = '13')) then
      CkbContabiliza.checked := false;

    if (Trim(MsDoc.ValoresChave[6]) = '') then
      BuscaCentroDeCusto(Cds.FieldByName('PLACONTA').AsString)
    else
    begin
      Cds.FieldByName('CODCENTROCUSTO').AsString := MsDoc.ValoresChave[6];
      Cds.FieldByName('CODEXTERNO').AsString := MsDoc.ValoresChave[11];
    end;

    if (Trim(MsDoc.ValoresChave[7]) = '') then
      Cds.FieldByName('CODSUBCONTA').AsInteger := 0
    else
      Cds.FieldByName('CODSUBCONTA').AsString := MsDoc.ValoresChave[7];

    Cds.FieldByName('IDMODULO').AsString := MsDoc.ValoresChave[13];            //edilaine SIG100840

    //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    SetDadosFDO(StrToIntDef(MsDoc.ValoresChave[12], 0), Cds.FieldByName('CODDOCUMENTO').AsFloat);
    //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    dValorDoc := StrToFloat(MsDoc.ValoresChave[14]); //Cássio Rovaroto - SIG nº 115585

    CriaListaRateioDocumento(MsDoc.ValoresChave[0],MsDoc.ValoresChave[1]);

  end;
end;

procedure TFrmLancAlteradores.CriaListaRateioDocumento(const pDocumento,pNumLancto : string;
                                                       const bVerificaRateio: Boolean);
var
  _sSql: TClientDataSet;
  iPos: Integer;
begin
  _sSql := TClientDataSet.Create(Nil);
  _sSql.Data := CtrlTipoAlterador.GetDataPacket('select Distinct rd.idplanoprev,' + #13 +
                                                '       pc.idplanoprev      as planocontabil,' + #13 +
                                                '       pc.idplanoprevprev  as planoprevidencia,' + #13 +
                                                '       pc.nome' + #13 +
                                                '  from rateiodocum rd,' + #13 +
                                                '       planprevcontabil pc' + #13 +
                                                ' where rd.idplanoprev  = pc.idplanoprev' + #13 +
                                                '        and rd.coddocumento = ' + pDocumento);
  ckbPlanosPrev.Items.Clear;
  _sSql.First;
  while not _sSql.Eof do
  begin
    ckbPlanosPrev.Items.AddObject(_sSql.FieldByName('Nome').AsString, Pointer(_sSql.FieldByName('IdPlanoPrev').Asinteger));
    // WO12487 - Contas a Pagar - Lançamento de alteradores
    // Alterado Por Arnaldo V. Scarin em 18/07/2024
    // a Rotina de carga do documento considera a Variavel bVerificaRateio,
    // fazendo com que a lista dos Planos ficasse em branco quando era alterado
    // um documento para resolução desse problema, todos os itens serão marcados
    // e se existir algum lancemanto na tabela RateioXAlterador, serão desmarcados
    // e só serão marcados os planos que estiverem nessa tabela.
    ckbPlanosPrev.Checked[ckbPlanosPrev.Items.Count - 1] := true;
    _sSql.next;
  end;
  _sSql.Close;

  if bVerificaRateio then
  begin
    _sSql.Data := CtrlTipoAlterador.GetDataPacket('Select ra.idPlanoPrev, pc.Nome from RateioxAlterador ra'+#13+
                                                  'Join planprevcontabil pc on ra.idplanoprev  = pc.idplanoprev'+#13+
                                                  'Where ra.CodDocumento = ' + pDocumento+#13+
                                                  '  and ra.NumLancto = ' + pNumLancto);

    // WO12487 - Contas a Pagar - Lançamento de alteradores
    // Alterado Por Arnaldo V. Scarin em 18/07/2024
    // Se existir algum Linha na Tabela RateioXAlterador para o Documento em questão
    // todos os planos previdenciarios serão desmarcados e só serão
    // marcados os planos que estiverem nessa tabela.
    if _sSql.RecordCount > 0 then
    begin

      For iPos := 0 to ckbPlanosPrev.Items.Count - 1 do
        ckbPlanosPrev.Checked[iPos] := False;

      _sSql.First;

      while not _sSql.Eof do
      begin
        iPos := ckbPlanosPrev.Items.IndexOf(_sSql.FieldByName('Nome').AsString);
        if (iPos >= 0) then
          ckbPlanosPrev.Checked[iPos] := true;
        _sSql.next;
      end;
    end;
    _sSql.Close;
  end;
  FreeAndNil(_sSql);
end;

procedure TFrmLancAlteradores.BuscaCentroDeCusto(sPlaconta: string);
begin
  inherited;
  //Busca o centro de custo associado a contacontábil do alterador
  SqlCentroCusto.Prepare;
  SqlCentroCusto.ParamByName('PLACONTA').AsString := sPlaconta;
  SqlCentroCusto.ParamByName('IDEMPRESA').AsInteger := Sistema.idEmpresa;
  SqlCentroCusto.ParamByName('PLANO').AsInteger := ParamIntegra.Plano;
  SqlCentroCusto.Open;

  if CdsCentroCusto.IsEmpty then
  begin
    Cds.FieldByName('CODCENTROCUSTO').AsInteger := -1;
    Cds.FieldByName('CODEXTERNO').AsInteger := -1;
  end
  else
  begin
    Cds.FieldByName('CODCENTROCUSTO').AsInteger := CdsCentroCusto.FieldByName('CODCENTROCUSTO').AsInteger;
    Cds.FieldByName('CODEXTERNO').AsString := CdsCentroCusto.FieldByName('CODEXTERNO').AsString;
  end;

  CdsCentroCusto.Close;
end;

procedure TFrmLancAlteradores.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  BuscaCentroDeCusto(Cds.FieldByName('PLACONTA').AsString);
end;

procedure TFrmLancAlteradores.CmeCadastroInsert(Sender: TObject);
begin
  bReopenCds := False;

  SelAlterador(0, 0);

  // Paulo Nobre - WO27566 - Inicio

  //Cássio Rovaroto - SIG nº 115585 - Início
//  cboTipoServico.Visible := False;
//  cboProcesso.Visible := False;
//  edtValorBaseRetencao.Visible := False;
  //Cássio Rovaroto - SIG nº 115585 - Fim

  // Paulo Nobre - WO27566 - Fim

  inherited;

  DtLancto.Date := Date;
  GpDocumento.Enabled := True;

  if _iCodDocumento = 0 then
    BtnSeleciona.Click;
end;

procedure TFrmLancAlteradores.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  GpDocumento.Enabled := False;
end;

procedure TFrmLancAlteradores.dblkAlteradorCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var cdsAux: TClientDataSet;   // Paulo Nobre - WO24106
begin
  inherited;
  DbROutraMoeda.Enabled := ((dblkAlterador.Text <> '') and (CdsAlteradores.FieldByName('CONVERTE').AsString = 'S'));

  Cds.FieldByName('DEBCRE').AsString := CdsAlteradores.FieldByName('ACRESDECRES').AsString;

  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  Cds.FieldByName('FLGOBRIGARESERVA').AsString := CdsAlteradores.FieldByName('FLGOBRIGARESERVA').AsString;
  CDS.FieldByName('ACRESDECRES').AsString := CDSAlteradores.FieldByName('ACRESDECRES').AsString;
  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

  // Paulo Nobre - WO27566 - Inicio

  // Paulo Nobre - WO24106 - Inicio
  mmObsAlt.Lines.Text := '';
  cdsAux := TClientDataSet.Create(nil);
  if Trim(dblkAlterador.Text) <> '' then
  begin
    cdsAux.Data := CtrlTipoalterador.listTipoalterador(0, '', StrToFloat(dblkAlterador.LookUpValue));
    mmObsAlt.Lines.Text := cdsAux.FieldByName('OBSERVACAO').AsString;

//    lblValorBaseRetencao.Visible := cdsAux.FieldByName('FLGVALORBASE').asString = 'S';
//    edtValorBaseRetencao.Visible := cdsAux.FieldByName('FLGVALORBASE').asString = 'S';

    if cds.State in [dsInsert] then
//      if (edtValorBaseRetencao.Visible) then
        Cds.FieldByName('VALORBASERETENCAO').AsFloat := dValorDoc
//      else
//        Cds.FieldByName('VALORBASERETENCAO').AsFloat := 0;

    // Paulo Nobre - WO27566 - Fim
  end;

  FreeAndNil(cdsAux);
  // Paulo Nobre - WO24106 - Fim

end;

procedure TFrmLancAlteradores.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;

  if CmeCadastro.Operacao = opAlterar then
  begin
    sbtnEstornar.enabled := false;
    sbtnApagar.enabled := false;
  end
  else
  begin
    sbtnEstornar.enabled := (sbtnAlterar.enabled and ParamIntegra.IntegraContab);
    sbtnApagar.enabled := ((not ((ParamIntegra.IntegraContab) and (ParamIntegra.EstornaContab))) and (sbtnAlterar.enabled));
  end;

    //David - Pendência 25536
  if sbtnAlterar.Enabled then
  begin
      // Rodolpho da Silva - P: 25536 - 09/08/2007
    if _LancAlteradores.ValidaTesteDispFinanc(Cds.FieldByName('CODDOCUMENTO').AsInteger) then
      sbtnAlterar.Enabled := CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa, Sistema.IdUsuario, trunc(Cds.FieldByName('DATADOC').AsDateTime))
    else
      sbtnAlterar.Enabled := true;

    sbtnApagar.Enabled := sbtnAlterar.Enabled;
    sbtnEstornar.Enabled := sbtnAlterar.Enabled;
  end;

    //Marcus Oliveira P.26058 23/08/2007 Se não tem permissão desabilita botão estornar.
  if not bPodeEstornar then
    sbtnEstornar.Enabled := False;

end;

procedure TFrmLancAlteradores.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  bReopenCds := False;

  if MontaSelect.RetornouValor then
  begin
    SelAlterador(StrToInt(MontaSelect.ValoresChave[0]), StrToInt(MontaSelect.ValoresChave[1]));
    CriaListaRateioDocumento(MontaSelect.ValoresChave[0],MontaSelect.ValoresChave[1], true);

    CdsDel.Data := Cds.Data;

    bEstorno := (Trim(MontaSelect.ValoresChave[2]) <> '');
  end;
end;

procedure TFrmLancAlteradores.DbrValorExit(Sender: TObject);
begin
  inherited;
  if (CmeCadastro.Operacao in [OpInserir, OpAlterar]) then
    Cds.FieldByName('VLRLIQUIDO').AsFloat := Cds.FieldByName('VALOR').AsFloat;
end;

procedure TFrmLancAlteradores.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
  iStatus: integer; //Cássio Rovaroto - SIG nº 75760
begin
  inherited;
  iStatus := -1; //Cássio Rovaroto - SIG nº 75760
  if EdtHist.CanFocus then
    EdtHist.SetFocus; // Felipe A. Santos SOL 223402 PPM 348444

  try
    if (_iCodDocumento <= 0) and sbtninserir.Enabled and (StrToDate(msdoc.ValoresChave[10]) > DtLancto.Date) then
    begin
      MsgDlg('Data do Alterador não pode ser menor que a data do lançamento do documento', 'Atenção', mtWarning, [mbOk], 0);
      if DtLancto.Canfocus then
        DtLancto.SetFocus;
      Accept := False;
    end;
  except
    MsgDlg('Favor selecionar o Documento', 'Atenção', mtWarning, [mbOk], 0);
    BtnSeleciona.SetFocus;
    Accept := False;
  end;

  if Accept and (Trim(dblkAlterador.Text) = '') then
  begin
    MsgDlg('Obrigatório preencher o Alterador', 'Atenção', mtWarning, [mbOk], 0);
    if dblkAlterador.CanFocus then
      dblkAlterador.SetFocus;
    Accept := False;
  end;

  Accept := VerificaPeriodoBloqueio();                //edilaine SIG100840

  //Cássio Rovaroto - SIG nº 75760 - Início
  if (Accept) and (CdsAlteradores.FieldByName('FLGLANCANFS').AsString = 'S') then
  begin
    if not _Documento.VerificaDadosNFS(Cds.FieldByName('CODDOCUMENTO').AsInteger) then // Alterado por FHBS - 27/08/2019 - SIG90246 - Acicionado o not
    begin
      if Application.MessageBox(PChar('O lançamento deste alterador exige a definição dos dados' + #13 + 'da Nota Fiscal de Serviço para o documento selecionado. ' + #13 + #13 + 'Deseja realizar a atualização?'), 'Confirmar', 36) <> 6 then
      begin
        MsgDlg('É necessário realizar a definição dos dados da nota fiscal para este documento.', 'Atenção', mtWarning, [mbOK], 0);
        Accept := False;
      end
      else
      begin
        if frmAtuDadosNFSDoc = nil then
        begin
          try
            frmAtuDadosNFSDoc := TfrmAtuDadosNFSDoc.Create(Application);
            frmAtuDadosNFSDoc.fCodDocumento := Cds.FieldByName('CODDOCUMENTO').AsInteger;
            frmAtuDadosNFSDoc.fValorBruto := _Documento.GetValorBrutoDoc(Cds.FieldByName('CODDOCUMENTO').AsInteger);
            frmAtuDadosNFSDoc.fDataEmissao := _Documento.GetDataEmissaoDoc(Cds.FieldByName('CODDOCUMENTO').AsInteger);
            frmAtuDadosNFSDoc.ShowModal;

            if frmAtuDadosNFSDoc.fStatusAtuDados > 0 then
              Accept := True
            else
            begin
              MsgDlg('É necessário realizar a definição dos dados da nota fiscal para este documento. ', 'Atenção', mtWarning, [mbOk], 0);
              Accept := False;
            end;
          finally
            FreeAndNil(frmAtuDadosNFSDoc);
          end;
        end;
      end;
    end;
    //Cássio Rovaroto - SIG nº 115585 - Início
    //if (cboTipoServico.LookupValue = EmptyStr ) then
    //begin
    //  MsgDlg('É necessário informar o tipo de serviço relacionado. ', 'Atenção', mtWarning, [mbOk], 0);
    //  Accept := False;
    //  Exit;
    //end;

    if (edtValorBaseRetencao.Visible) and ((edtValorBaseRetencao.Value = 0) or (FloatToStr(edtValorBaseRetencao.Value) = EmptyStr)) then
    begin
      MsgDlg('É necessário definir o valor base de retenção. ', 'Atenção', mtWarning, [mbOk], 0);
      Accept := False;
      Exit;
    end;

    if (edtValorBaseRetencao.Visible) then
    begin
      if (bMsgAlteradorRetencao) then
        if Application.MessageBox(PChar('O valor base da retenção é, realmente, R$ ' + edtValorBaseRetencao.Text + '?'), 'Confirmar', 36) <> 6 then
        begin
          edtValorBaseRetencao.SetFocus;
          bMsgAlteradorRetencao := False;
          Accept := False;
        end
        else
          Accept := True;
    end;
    //Cássio Rovaroto - SIG nº 115585 - Fim
  end;
  //Cássio Rovaroto - SIG nº 75760 - Fim
end;

procedure TFrmLancAlteradores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //amf 18886 27.01.2006
  FreeAndNil(CtrlTipoAlterador);

  //David - Pendência 25536
  FreeAndNil(CtrlFinanc);

  inherited;
  _LancAlteradores.Free;
  _Documento.Free;
end;

procedure TFrmLancAlteradores.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
var
  iFator: Integer;
  Natureza: integer;
  SaldoDoc, Saldo: real;
  sDebCreDoc: string;
  i: Integer;
  lstPlanos: TStringList;
  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  //TempAlteradores : TCMClientDataSet;//Utlizado pois os dados do CDS ainda estão na cache e não existe commit

begin

  inherited;
  // SIG - 130578 - Contas a Pagar - Lançamentos de Alteradores
  // Alterado por Arnaldo V. Scarin em 08/05/2024
  // Verificação dos planos selecionados.
  lstPlanos := tStringList.Create;
  try
    if CmeCadastro.Operacao = opApagar then
      _LancAlteradores.CdsLancAlteradores := CdsDel
    else
      _LancAlteradores.CdsLancAlteradores := Cds;


     // Rodolpho da Silva - P: 22670 - 21/06/2006
    if CtrlTipoAlterador.ExisteLancIRRF(Cds.FieldByName('CODDOCUMENTO').AsInteger) then
    begin
      _LancAlteradores.MessageInfo := 'Este documento não pode ser alterado ou excluído, pois há um documento de imposto do INSS lançado relacionado a este.';
      Accept := False;
      Exit;
    end;

     //Ricardo Freitas SOL: 158675 KINTANA: 1290124
    if CmeCadastro.Operacao <> opApagar then
    begin


        // SIG - 130578 - Contas a Pagar - Lançamentos de Alteradores
        // Alterado por Arnaldo V. Scarin em 08/05/2024
        // Verificação dos planos selecionados.
      for i := 0 to ckbPlanosPrev.Items.Count - 1 do
      begin
        if ckbPlanosPrev.Checked[i] then
          lstPlanos.Add(IntToStr(Integer(ckbPlanosPrev.Items.Objects[i])));
      end;
      if (lstPlanos.Count <= 0) then
      begin
        FreeAndNil(lstPlanos);
        Accept := False;
        Exit;
      end;

      SaldoDoc := _LancAlteradores.RetornaSaldoDocumento(Cds.FieldByName('CODDOCUMENTO').AsString, sDebCreDoc);
      if Trim(Cds.FieldByName('DEBCRE').AsString) = Trim(sDebCreDoc) then
        Natureza := 1
      else
        Natureza := -1;

      Saldo := 0;
      Saldo := SaldoDoc + (Cds.FieldByName('VLRLIQUIDO').AsFloat * Natureza);

      if (0 > Saldo) then
      begin
        if Application.MessageBox(PChar('Realizando o lançamento desta alterador, o saldo do documento ficará negativo.' + #13 + 'Saldo do documento com este alterador: ' + FloatToStr(Saldo) + #13 + #13 + 'Confirma inclusão deste alterador?'), 'Confirmar', 36) <> 6 then
        begin
          Accept := False;
          _LancAlteradores.MessageInfo := 'Alterador não será cadastrado.';
          Exit;
        end;
      end;
        //Ricardo Freitas - Fim
    end;

     //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    try
       //TempAlteradores := TCMClientDataSet.Create(Nil);
       //TempAlteradores.Data := Cds.Data;

       // 11/10/2012
       // A lógica abaixo utiliza O Dataset cdsSubDespesaAlteradores que era utilizado para selecionar a
       // sub despesa de acordo com um combo que existia na ABA de Alteradores, para continuar o funcionamento
       // e realizar a alteração de maneira rápida apenas exclui o Combo e com o Filter abaixo faz com que o
       // funcionamento fique o mesmo.
      if (Trim(CdsRateio.FieldByName('IDDESPESAORC').AsString) <> '') and   // Edilaine - SOL 195755 / KTN 1871968
        (CdsRateio.FieldByName('IDDESPESAORC').AsInteger > -1) then        // Edilaine - SOL 195755 / KTN 1871968
        with cdsSubDespesaAlteradores do
        try
          Filtered := False;
          Filter := 'IDDESPESAORC = ' + CdsRateio.FieldByName('IDDESPESAORC').AsString;
          Filtered := True;
             // Campos abaixo utilizados para verificar se o alterador quando lançado possui a mesma conta de acordo com o relacionamento
          _Documento.Orcamento.CopyFieldsFDO(opapAlterador, cdsSubDespesaAlteradores, CDS);
        finally
          Filtered := False;
          Filter := '';
        end;

       // SIG - 130578 - Contas a Pagar - Lançamentos de Alteradores
       // Alterado por Arnaldo V. Scarin em 08/05/2024
      _LancAlteradores.ListaPlanosPrevidenciarios.Text := lstPlanos.Text;

      Accept := _LancAlteradores.ProcessaLancAlteradores(CmeCadastro.Operacao, Sistema.IdUsuario, Sistema.IdEmpresa, Sistema.IdModulo, ParamIntegra.Plano, Sistema.UsaPlanoPatro, not CkbContabiliza.Checked, ParamIntegra.PartidaDobrada,
                 //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
        ParamIntegra.integraOrcamento, CdsRateio
                 //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
      );
    finally
       //FreeAndNil(TempAlteradores);
    end;
     //fim    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

     {
     Accept := _LancAlteradores.ProcessaLancAlteradores(CmeCadastro.Operacao, Sistema.IdUsuario,
               Sistema.IdEmpresa, Sistema.IdModulo, ParamIntegra.Plano, Sistema.UsaPlanoPatro,
               Not CkbContabiliza.Checked, ParamIntegra.PartidaDobrada,
               //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
               ParamIntegra.integraOrcamento, CdsRateio
               //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
               );
     }

    bReopenCds := (Accept and (CmeCadastro.Operacao <> opInserir));

    if Accept and (_iCodDocumento > 0) then
    begin
      _iCodDocumento := -1;

      if (CdsAlteradores.FieldByName('ACRESDECRES').AsString = 'D') then
      begin
        if ParamIntegra.RecPag = 'P' then
          iFator := -1
        else
          iFator := 1;
      end
      else
      begin
        if ParamIntegra.RecPag = 'P' then
          iFator := 1
        else
          iFator := -1;
      end;

      Application.Tag := Trunc(Cds.FieldByName('VALOR').AsFloat * 100) * iFator;
    end;
  finally
    _LancAlteradores.CdsLancAlteradores := Cds;
  end;

end;

procedure TFrmLancAlteradores.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if OrigemAbortConfirma in [OaApplyInsert, OaApplyDelete, OaApplyEdit] then
    MsgDlg(_LancAlteradores.MessageInfo, 'Atenção', mtWarning, [mbOk], 0);
end;

procedure TFrmLancAlteradores.bbtnConfirmarClick(Sender: TObject);
begin

  inherited;

  if bReopenCds then
    SelAlterador(StrToInt(MontaSelect.ValoresChave[0]), StrToInt(MontaSelect.ValoresChave[1]));
end;

procedure TFrmLancAlteradores.sbtnEstornarClick(Sender: TObject);
begin
  if VerificaDocBaixado(Cds.FieldByName('CODDOCUMENTO').AsInteger) then
  begin
    inherited;

    if not Cds.IsEmpty then
      if _Documento.Estornar(Cds.FieldByName('DATALANCTO').AsDateTime, Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario, Cds.FieldByName('CODDOCUMENTO').AsInteger, Cds.FieldByName('NUMLANCTO').AsInteger, ParamIntegra.Plano, Sistema.UsaPlanoPatro, oeDialogProcessa) then
      begin
        MsgDlg('Alterador estornado com sucesso', 'Atenção', mtInformation, [mbOk], 0);
        bEstorno := True;
      end
      else
      begin
        MsgDlg(_Documento.MessageInfo, 'Atenção', mtWarning, [mbOk], 0);
        bEstorno := True;
      end;

    SelAlterador(StrToInt(MontaSelect.ValoresChave[0]), StrToInt(MontaSelect.ValoresChave[1]));
  end;
end;

procedure TFrmLancAlteradores.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  if _iCodDocumento = -1 then
    ModalResult := MrOk;
end;

procedure TFrmLancAlteradores.sbtnApagarClick(Sender: TObject);
begin

  //Ewerton Beltramini - SIG116142 - Inicio...
  if Cds.FieldByName('IDENVIODOCUMENTO').AsFloat = 1 then
  begin
    MsgDlg('Alteradores originados de recálculos ou atualizações de inadimplência não podem ser modificados ou excluídos!', 'Atenção', mtError, [mbOk], 0);
    exit;
  end;
  //Ewerton Beltramini - SIG116142 - Fim.

  if (VerificaPeriodoBloqueio()) and                                                      //edilaine SIG100840
    (VerificaDocBaixado(Cds.FieldByName('CODDOCUMENTO').AsInteger)) then
    inherited;
end;

procedure TFrmLancAlteradores.sbtnAlterarClick(Sender: TObject);
begin

  //Ewerton Beltramini - SIG116142 - Inicio...
  if Cds.FieldByName('IDENVIODOCUMENTO').AsFloat = 1 then
  begin
    MsgDlg('Alteradores originados de recálculos ou atualizações de inadimplência não podem ser modificados ou excluídos!', 'Atenção', mtError, [mbOk], 0);
    exit;
  end;
  //Ewerton Beltramini - SIG116142 - Fim.


  if (VerificaPeriodoBloqueio()) and                                                      //edilaine SIG100840
    (VerificaDocBaixado(Cds.FieldByName('CODDOCUMENTO').AsInteger)) then
    inherited;
end;

function TFrmLancAlteradores.VerificaDocBaixado(iCodDocumento: Integer): Boolean;
begin
  if not Modulo.ModificaAlteradoresDocBaixados then
  begin
    _Documento.Saldo.CalculaSaldo(iCodDocumento);
    Result := (not IsFloatZero(_Documento.Saldo.Valor));

    if not Result then
      MsgDlg('Não é possivel lançar, alterar, excluir ou estornar alteradores para Documentos já baixados.', 'Atenção', mtError, [mbOk], 0);
  end
  else
    Result := True;
end;

procedure TFrmLancAlteradores.dblkAlteradorChange(Sender: TObject);
//var
//  cdsAux: TClientDataSet;            Paulo Nobre - WO24106
begin
  inherited;

  //amf 18886 27.01.2006
 // mmObsAlt.Lines.Text := '';                  Paulo Nobre - WO24106
 // cdsAux := TClientDataSet.Create(nil);       Paulo Nobre - WO24106
  if Trim(dblkAlterador.LookUpValue) <> '' then
  begin
  // Paulo Nobre - WO24106 - Inicio
 //   cdsAux.Data := CtrlTipoalterador.listTipoalterador(0, '', StrToFloat(dblkAlterador.LookUpValue));
 //   mmObsAlt.Lines.Text := cdsAux.FieldByName('OBSERVACAO').AsString;

     //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    cdsSubDespesaAlteradores.Data := _Documento.Orcamento.ListaSubDespesas(opapAlterador, dblkAlterador.LookUpValue, Cds.FieldByName('IDFORCLI').AsInteger, Cds.FieldByName('CODCENTROCUSTO').AsString, Sistema.IdEmpresa);
    cboAlteradoresDescRateio.Enabled := True;
     //cboAlteradoresDescRateio.Enabled := cdsSubDespesaAlteradores.FieldByName('FLGOBRIGARESERVA').AsString = 'S';
//     cboAlteradoresSubDespesa.Enabled := cboAlteradoresDescRateio.Enabled;
     //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
     //Cássio Rovaroto - SIG nº 115585 - Início
//    lblTipoServico.Visible := cdsAux.FieldByName('FLGLANCANFS').asString = 'S';
//    cboTipoServico.Visible := cdsAux.FieldByName('FLGLANCANFS').asString = 'S';
//    lblValorBaseRetencao.Visible := cdsAux.FieldByName('FLGVALORBASE').asString = 'S';
//    edtValorBaseRetencao.Visible := cdsAux.FieldByName('FLGVALORBASE').asString = 'S';

//    if cds.State in [dsInsert] then //Cássio Rovaroto - SIG nº 116274
//      if (edtValorBaseRetencao.Visible) then
//        Cds.FieldByName('VALORBASERETENCAO').AsFloat := dValorDoc
//      else
//        Cds.FieldByName('VALORBASERETENCAO').AsFloat := 0;
    // Paulo Nobre - WO24106 - Fim

     //lblProcessoJudicial.Visible := cdsAux.FieldByName('FLGLANCANFS'). asString = 'S'; //Cássio Rovaroto - SIG nº 116274
     //cboProcesso.Visible := cdsAux.FieldByName('FLGLANCANFS'). asString = 'S'; //Cássio Rovaroto - SIG nº 116274
     
    sqlProcessoSusp.Prepare;
    sqlProcessoSusp.ParamByName('PIDFORCLI').AsInteger := Cds.FieldByName('IDFORCLI').AsInteger;
    sqlProcessoSusp.ParamByName('PDATAFIM').AsDateTime := Cds.FieldByName('DATADOC').AsDateTime;
    sqlProcessoSusp.Open;
     //cboProcesso.Enabled := not (cdsProcessoSusp.IsEmpty); //Cássio Rovaroto - SIG nº 116274

    // Paulo Nobre - WO27566 - Inicio
//    lblProcessoJudicial.Visible := not (cdsProcessoSusp.IsEmpty); //Cássio Rovaroto - SIG nº 116274
//    cboProcesso.Visible := not (cdsProcessoSusp.IsEmpty); //Cássio Rovaroto - SIG nº 116274
    // Paulo Nobre - WO27566 - Fim

     //Cássio Rovaroto - SIG nº 116274
     //Cássio Rovaroto - SIG nº 115585 - Fim
  end;
//  FreeAndNil(cdsAux);     Paulo Nobre - WO24106
end;

procedure TFrmLancAlteradores.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(cdsRateio);
  FreeAndNil(CtrlLancDocCapCar); //Cássio Rovaroto - SIG nº 75760
end;

procedure TFrmLancAlteradores.SetDadosFDO(AIDFORCLI: Integer; ACodDocumento: Double);
begin
  Cds.FieldByName('IDFORCLI').AsInteger := AIDFORCLI;
  CDS.FieldByName('IDRATEIO_ORCAMENTO').AsInteger := 0;
  cdsRateio.Data := _Documento.Orcamento.ListaRateio(ACodDocumento);
end;

//edilaine SIG100840 : inicio
function TFrmLancAlteradores.VerificaPeriodoBloqueio: boolean;
begin
  if not _LancAlteradores.ValidaBloqueio(Sistema.IdEmpresa, cds.FieldByName('IDMODULO').AsInteger, DateToStr(DtLancto.Date)) then
  begin
    MsgDlg(_LancAlteradores.MessageInfo, 'Atenção', mtError, [mbOk], 0);
    result := false;
    if sbtnAlterar.Down then
      sbtnAlterar.Down := false;
    if sbtnApagar.Down then
      sbtnApagar.Down := false;
  end
  else
    result := true;
end;
//edilaine SIG100840 : fim

end.

