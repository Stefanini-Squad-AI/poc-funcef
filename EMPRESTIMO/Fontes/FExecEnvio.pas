unit FExecEnvio;

//    Sistema.TipoCliente 

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina      : MontaWhereComum
Solicitação : WO9375
Data        : 28/03/2024
Responsável : Helen V Bianchi
Descrição   : Ajustar os parâmetros-data de falecimento . Retirar as versões :
              SIG136501, WO7488, WO8098
--------------------------------------------------------------------------------
Alterações  : btnContinuarClick, MontaSelectFolha
Pendência   : 101022
Responsável : Edilaine / Itiro
Data        : 03/05/2018
Descrição   : Eliminar registros negativos da TMPDESC abatendo de registros
              positivos.
--------------------------------------------------------------------------------
Rotina      : MontaWhereComum
Solicitação : WO8098
Data        : 23/02/2024
Responsável : Luis Ferrari
Descrição   : Inclusão de pessoas falecidas ve no contrato pelo idbenef e não pelo idpessoa, corrigido.
--------------------------------------------------------------------------------
Solicitação : WO7488
Data        : 01/02/2024
Responsável : Everson Cunha
Descrição   : Ajuste na regra relacionada a não falecidos
--------------------------------------------------------------------------------
Rotina      : MontaWhereComum
Solicitação : SIG136501
Data        : 20/11/2023
Responsável : Paulo Nobre
Descrição   : Inclusão de condição para não trazer Pessoas que estão falecidas
--------------------------------------------------------------------------------
Alterações  :
Pendência   : SIG 56011   
Responsável : Ewerton Beltramini
Data        : 13/02/2020
Descrição   : Alteração dos valores do lançamento do emprestimo/plano, conforme
              preenchimento em tela.
--------------------------------------------------------------------------------
Alterações  :
Pendência   : SIG TIBERO
Responsável : Everson Luiz Pereira da Cunha
Data        : 25/10/2018
Descrição   : Alteração no Owner da tabela CONTRATOAD
--------------------------------------------------------------------------------
Alterações  : MontaSelectCAPCAR
Pendência   : 67098
Responsável : Luiz Carlos
Data        : 27/04/2018
Descrição   : ajuste para buscar plano contabil de acordo com o idperfilinvest
preenchido na tabela contratoemptmo
--------------------------------------------------------------------------------
Alterações  : MontaSelectCAPCAR
Pendência   : 62639
Responsável : Edilaine
Data        : 02/02/2018
Descrição   : inserir no rateio o plano contábil do perfil de investimento do
participante e não o plano contábil do empréstimo
--------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : Wylliam Leite da Silva
Data        : 18/05/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
--------------------------------------------------------------------------------
Pendência   : SOL 200924 KINTANA 1958353
Responsável : BRUNO AZEVEDO
Data        : 12/03/2013
Descrição   : Ajuste no campo obs ao salvar o numero de contrato.
--------------------------------------------------------------------------------
Pendência   : SOL 194460 Kintana 1861972
Responsável : Fernando Xavier
Data        : 22/11/2012
Descrição   : Ao fazer e desfazer o envio dos itens para a Folha de Benefícios a
             funcionalidade não está considerando a data de vencimento informada
--------------------------------------------------------------------------------
//Pendência   : SOL 190014 KINTANA 1920088
//Responsável : Otacilio Aquino
//Data        : 30/01/2013
//Descrição   : Ajuste na consulta para rubrica informativa.
//------------------------------------------------------------------------------
//Pendência   : SOL 195538 KINTANA 1917765
//Responsável : Otacilio Aquino
//Data        : 25/01/2013
//Descrição   : Implementado para adicionar o numero do contrato no campo obs
//------------------------------------------------------------------------------
//Pendência   : SOL 169010 KINTANA 1495798
//Responsável : MARCIO SANCHES SPINOSA
//Data        : 21/05/2012
//Descrição   : Atualiza a CtrlInterface dependendo do valor da folha resgate
//------------------------------------------------------------------------------
//Pendência   : SOL 164427 KINTANA 1411500
//Responsável : Fanuel Junior 
//Data        : 12/09/2011
//Descrição   : Os encargos negativos não devem ser alterados para crédito
--------------------------------------------------------------------------------
//Pendência   : SOL 145571 KINTANA 975201
//Responsável : VINICIUS MACIEL
//Data        : 03/06/2011
//Descrição   : Ajuste No histórico de envio para que seja gravada a data de
//              vencimento.
//------------------------------------------------------------------------------
Pendência   : SOL 153430 KINTANA 1156998
Responsável : BRUNO AZEVEDO
Data        : 23/02/2011
Descrição   : Ajusto no envio das rubricas para folha de patrocinadora.
--------------------------------------------------------------------------------
Pendência   : SOL 150193 Kintana 1086790
Responsável : Fernando Santana
Descrição   : Altera ordem de envio das rubricas
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
--------------------------------------------------------------------------------
Pendência   : SOL 147574 KINTANA 1022240
Responsável : Fernando Xavier
Data        : 11/11/2010
Descrição   : Erro "field FLGTIPODESC not found" durante o processo de envio
--------------------------------------------------------------------------------
Pendência   : SOL 141496 KINTANA 897024
Responsável : Fernando Xavier
Data        : 09/11/2010
Descrição   : Adicionar dois campos no resultado do envio: item e tipo de rubrica
--------------------------------------------------------------------------------
Pendência   : SOL 145518 KINTANA 975132
Responsável : Ádler Souza
Data        : 14/10/2010
Descrição   : Correção na duplicidade de Rubrica Informativa.
--------------------------------------------------------------------------------
Pendência   : SOL 140060 KINTANA 873169
Responsável : Ádler Souza
Data        : 20/07/2010
Descrição   : Ao invés de utilizar a condição FLGDESATIVADO, utilizar join entre
              a contratoemptmo e a partprevplan.
--------------------------------------------------------------------------------
Pendência   : SOL 123125 KINTANA 612563
Responsável : BRUNO AZEVEDO
Data        : 07/06/2010
Descrição   : Envio de rubricas informativas para a folha de benefícios.
--------------------------------------------------------------------------------
Pendência   : SOL 122042 KINTANA 594314
Responsável : Ádler Teodoro de Souza
Data        : 17/07/2009
Descrição   : Alteração nas queries qryUpdateDocumento, qryUpdateFlgEnvio e
também na função MontaUpdateCAPCAR retirando FLGSOLICITACAO = NULL.
--------------------------------------------------------------------------------
Pendência   : SOL 121503 KINTANA 586687
Responsável : Ádler Teodoro de Souza
Data        : 08/07/2009
Descrição   : Alteração na Cláusula WHERE conforme solicitado.
--------------------------------------------------------------------------------
Pendência   : SOL 117973 KINTANA 559703
Responsável : Daniel Begnami
Data        : 05/06/2009
Descrição   : Criação de flag no cadastro do tipo de suspensão de forma que o
              sistema permita o envio ou não de prestações suspensas.
--------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
--------------------------------------------------------------------------------
N. Sol..........: 105543
N. Kintana......: 472315
Data............: 08/01/2009
Responsável.....: Renato Visoni
Descrição.......: Colocar a opção de Filtro da tabela CONTRATOAD na tela de envio.
--------------------------------------------------------------------------------
Rotina..........: AtualizaSitPart
N. Sol..........: 96058
N. Kintana......: 415878
Data............: 25/09/2008
Responsável.....: Denise Arruda
Descrição.......: Não modificar a condição de pagamento das parcelas definidas no
                  tratamento individual
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : MontaSelectCAPCAR
Data      : 29/05/2006
Autor     : Marchetti
Pendência : 21225
Descrição : Fazer o envio para o CAR utilizando ou não Forma de Recebimento
            Diferenciada.
--------------------------------------------------------------------------------
Rotina    : VerificaCobrancaEmAtraso e Final do processo de envio
Data      : 07/12/2005
Autor     : Marchetti
Pendência : 20461
Descrição : Marca os registros que não serão enviados com FLGENVIO = 2
            Ao final, dá um update para FLGENVIO = 0 para os registros que
            possuem FLGENVIO = 2
--------------------------------------------------------------------------------
Rotina    : VerificaCobrancaEmAtraso
Data      : 21/09/2005
Autor     : Marchetti
Pendência : 20045
Descrição : Ajuste na rotina para levar em consideração os parâmetros definidos
            na tabela TIPOCONTREMPTMO
--------------------------------------------------------------------------------
Rotina    : MontaWhereCAPCAR
Data      : 19/08/2004
Autor     : André Pontes
Pendência : -
Descrição :
            if not(chkCapDev.Checked) then sSQL := sSQL +
            '   AND ( HME.HMETIPOMOV         = 0 ) '

            if not(chkCap.Checked) then sSQL := sSQL +
            '   AND ( HME.HMETIPOMOV        <> 0 ) '
--------------------------------------------------------------------------------
Rotina    : MontaWhereComum
Data      : 19/08/2004
Autor     : André Pontes
Pendência : -
Descrição : Envio de concessões para Folha independente de ser concessão ou
            devolução.
            Foi retirado o bloco
            if not(chkCap.Checked) then sSQL := sSQL +
            '   AND ( HME.HMETIPOMOV         <> 0 OR HME.HMEFORMACOBRANCA = ''F'' ) '
--------------------------------------------------------------------------------
Rotina    : AtualizaSitPart
Data      : 21/07/2004
Autor     : André Pontes
Pendência :
Descrição : Acerto na atualização do destino do envio
            Só envia para Patro se SITFUNC.TIPOSIT = 'A' (ativo na
            Patrocinadora)
--------------------------------------------------------------------------------
Rotina    : AtualizaSitPart
Data      : 13/07/2004 e 14/07/2004
Autor     : André Pontes
Pendência :
Descrição : Acerto na atualização do destino do envio quando situação
            caracteriza "mantido" ou "cancelado" --> Financeiro
--------------------------------------------------------------------------------
Rotina    :
Data      : 08/07/2004
Autor     : André Pontes
Pendência :
Descrição : Acerto da questão IDPLANOPREV/IDPLANOORIGEM:
            "CON.IDPLANOPREV, NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS
             IDPLANOORIGEM,"
--------------------------------------------------------------------------------
Rotina    : AtualizaSitPart
Data      : 06/07/2004
Autor     : André Pontes
Pendência : 17160
Descrição : Se o participante for MP (mantido parcial, mas estiver ATIVO na
            patro, envia para folha da patro.
--------------------------------------------------------------------------------
Rotina    : btnContinuarClick, EnviaItensFolha, EnviaItensCAP e EnviaItensCAR
Data      : 15/06/2004 a 21/06/2004
Autor     : André Pontes
Pendência : 16983
Descrição : Log de itens enviados
--------------------------------------------------------------------------------
Rotina    : MontaWhereComum
Data      : 18/06/2004
Autor     : André Pontes
Pendência : -
Descrição : Envio de concessões para Folha independente de ser concessão ou
            devolução.
            if not(chkCap.Checked) then sSQL := sSQL +
            '   AND ( HME.HMETIPOMOV         <> 0 OR
                      HME.HMEFORMACOBRANCA = ''F'' ) '
--------------------------------------------------------------------------------
Rotina    : AtualizaSitPart
Data      : 15/06/2004
Autor     : André Pontes
Pendência : 17017
Descrição : No SQL de update para desvio CaR, adicionada a condição AND
            ELP.IDPESSJURCEDIDO IS NULL, para impedir desvio dos LEFs para
            financeiro, mesmo estando esses com sitpart que caracteriza
            "mantidos".
--------------------------------------------------------------------------------
Rotina    : EnviaItensCAP
Data      : 15/11/2003
Autor     : Marchetti
Pendência : 15629
Descrição : Troca da mensagem de "Parcelas" para "concessões/pagamentos"
--------------------------------------------------------------------------------
Rotina    : -
Data      : 20/12/2002
Autor     : André Pontes
Descrição : Separação do envio para financeiro, com opção de envio para
            Financeiro (a Pagar) ou Financeiro (a Receber) - EnviaItensFolha,
            EnviaItensCAP, EnviaItensCAR.
--------------------------------------------------------------------------------
Rotina    : AtualizaRecPag
Data      : 17/12/2002
Autor     : André Pontes
Descrição : Nova rotina análoga a AtualizaRubricas para atualizar o RecPag de
            acordo com a natureza do TipoMov e o valor (valores negativos
            invertem a natureza original)
--------------------------------------------------------------------------------
Rotina    : AtualizaRubricas e AtualizaSitPart
Data      : 16/12/2002
Autor     : André Pontes
Descrição : Filtro por Contrato se um contrato for selecionado (qryAux e
            qryUpdateRubrica)
--------------------------------------------------------------------------------
Rotina    : EnviaItensFolha e EnviaItensPatroCAPCAR
Data      : 30/10/2002
Autor     : Marchetti
Descrição : Acerto no filtro para itens não quitados ou estornados.
--------------------------------------------------------------------------------
Rotina    : EnviaItensFolha e EnviaItensPatroCAPCAR
Data      : 24/10/2002
Autor     : Marchetti
Descrição : Coloca o filtro para não pegar itens de atualização diária.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, Classes, Graphics, Controls,
   StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, fcButton,
   fcImgBtn, fcShapeBtn, wwdbdatetimepicker, CMDateTimePicker, Mask,
   wwdbedit, Wwdbspin, wwdblook, ExtCtrls, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, CheckLst, Db, DBTables,
   mPatro, mContratoEmptmo, FSairAjudaImob, Wwquery, TREdit,UFuncoesEmptmo,

   uTypesEmptmo, Forms, mListaPlano, mListaPatro, DBCtrls;

type
   TfrmExecEnvio = class(TfrmSairAjudaImob)
      ntbPrincipal: TNotebook;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label1: TLabel;
      Label2: TLabel;
      btnContinuar: TfcShapeBtn;
      Bevel1: TBevel;
      btnVoltar: TfcShapeBtn;
      Panel4: TPanel;
      lblTitulo: TfcLabel;
      qryUpdateRubrica: TwwQuery;
      Panel3: TPanel;
      memResult: TMemo;
      Total: TLabel;
      edtNumResult: TRealEdit;
      Label4: TLabel;
      edtVlrTotParcela: TRealEdit;
      memErro: TMemo;
      edtNumErro: TRealEdit;
      Label8: TLabel;
      qryUpdateSitFormaPatro: TwwQuery;
      qryUpdateSitFormaFolha: TwwQuery;
      qryUpdateSitFormaCaR: TwwQuery;
      GroupBox1: TGroupBox;
      chkSitPart: TCheckBox;
      chkAtualiza: TCheckBox;
      grbEnvio: TGroupBox;
      chkFolhaBenef: TCheckBox;
      chkFolhaPatro: TCheckBox;
      chkCaP: TCheckBox;
      molContratoEmptmo: TmolContratoEmptmo;
      Label3: TLabel;
      DBcboSitPart: TwwDBLookupCombo;
      chkIntegraCaR: TCheckBox;
      qryUpdatePag: TwwQuery;
      qryUpdateRec: TwwQuery;
      chkCar: TCheckBox;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      Label5: TLabel;
      qryParcelasEmAberto: TwwQuery;
      qryParcelasEmAbertoHMEPARCELA: TFloatField;
      qryBuscaTipoContr: TwwQuery;
      qryBuscaTipoContrIDTIPOCONTREMPTMO: TFloatField;
      qryUpdateRubricaFUNCEF: TwwQuery;
      qryContratosDevedores_OLD: TwwQuery;
      qryContratosDevedores: TwwQuery;
      chkCapDev: TCheckBox;
      chkVerificaCobrancaAtraso: TCheckBox;
      grpDataVencto: TGroupBox;
      Label6: TLabel;
      edtDataVenctoIni: TwwDBDateTimePicker;
      edtDataVenctoFim: TwwDBDateTimePicker;
      qryContratosDevedoresIDCONTRATOEMPTMO: TFloatField;
      qryContratosDevedoresFLGENVIAPARCMES: TFloatField;
      qryContratosDevedoresNUMPARCDESCONTO: TFloatField;
      qryContratosDevedoresTCETRATAPARCATRAS: TStringField;
      qryMarcaNaoEnviar: TwwQuery;
    qryDesmarcaNaoEnviarOld: TwwQuery;
      gbFormaRecDif: TGroupBox;
      DBcboFormaRecebimento: TwwDBLookupCombo;
      btnAtribuiParametro: TSpeedButton;
    qryDesmarcaNaoEnviar: TwwQuery;
    chkInArquivo: TCheckBox;
    chkNotInArquivo: TCheckBox;
    FLGRESGATE: TCheckBox;
    GrpPlanosValor: TGroupBox;
    Bevel2: TBevel;
    Label9: TLabel;
    Label7: TLabel;
    Bevel3: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    Bevel4: TBevel;
    Label12: TLabel;
    Label13: TLabel;
    Bevel5: TBevel;
    Label14: TLabel;
    Label16: TLabel;
    QryPlano1: TwwQuery;
    QryPlano2: TwwQuery;
    QryPlano3: TwwQuery;
    QryPlano4: TwwQuery;
    QryPlano1NOME: TStringField;
    QryPlano2NOME: TStringField;
    QryPlano3NOME: TStringField;
    QryPlano4NOME: TStringField;
    DscPlano1: TDataSource;
    DscPlano2: TDataSource;
    DscPlano3: TDataSource;
    DscPlano4: TDataSource;
    CmbPlano1: TDBLookupComboBox;
    CmbPlano2: TDBLookupComboBox;
    CmbPlano3: TDBLookupComboBox;
    CmbPlano4: TDBLookupComboBox;
    QryPlano1IDPLANOPREV: TFloatField;
    QryPlano4IDPLANOPREV: TFloatField;
    QryPlano3IDPLANOPREV: TFloatField;
    QryPlano2IDPLANOPREV: TFloatField;
    EdtValor1: TEdit;
    EdtValor2: TEdit;
    EdtValor3: TEdit;
    EdtValor4: TEdit;
    QryAux: TwwQuery;
    QryAuxConsulta: TwwQuery;
    QryPlano1IDPLANOPREVPREV: TFloatField;
    QryPlano2IDPLANOPREVPREV: TFloatField;
    QryPlano3IDPLANOPREVPREV: TFloatField;
    QryPlano4IDPLANOPREVPREV: TFloatField;  //Monica Gonzaga - SOL169010

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure btnContinuarClick(Sender: TObject);
      procedure btnVoltarClick(Sender: TObject);
      procedure ntbPrincipalPageChanged(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure chkCarClick(Sender: TObject);
      procedure btnAtribuiParametroClick(Sender: TObject);
    procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
    procedure chkInArquivoClick(Sender: TObject);
    procedure chkNotInArquivoClick(Sender: TObject);
    procedure FLGRESGATEClick(Sender: TObject);
    procedure EdtValor1KeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor2KeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor3KeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor4KeyPress(Sender: TObject; var Key: Char);
    procedure CmbPlano1CloseUp(Sender: TObject);
    procedure CmbPlano2CloseUp(Sender: TObject);
    procedure CmbPlano3CloseUp(Sender: TObject);
    procedure CmbPlano4CloseUp(Sender: TObject); //Monica Gonzaga - SOL169010




   private  // Private declarations

      dDataHoje           : TDateTime;

      sFiltroContEmp      : String;
      bRepeteConsulta     : Boolean;

      rLogTotalPrev       : TLogTotalPrev;
      isEnviaFolhaResgate : Integer;

      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;

      procedure AbreQueries;
      function  VerificaPreenchimento: Boolean;
      function  PegaAnoMes: String;

      function  AtualizaRecPag(var sMsgErro: String): Boolean;
      function  AtualizaRubricas(var sMsgErro: String): Boolean;
      function  AtualizaSitPart(var sMsgErro: String): Boolean;

      function  DesfazSuspensaoAtraso(const sFormaCobranca : String; const iIdContratoEmptmo : Extended; var sMsgErro: string): Boolean;
      function  SuspensaoIndeterminada(var sMsgErro: string): Boolean;
      function  SuspensaoParcelasAtrasadas(var sMsgErro : string) : Boolean;
      function  SuspensaoJudicial(var sMsgErro : string) : Boolean;
      function  SuspensaoPorRegra(var sMsgErro : string) : Boolean;

      function  MontaSelectCAPCAR(const sRecPag: String): String;

      function  MontaSelectFolha(const iPatro: Integer): String;
      function  MontaSelectFolhaInformativa(const iPatro: Integer): String; //BRUNO AZEVEDO SOL 123125 KINTANA 612563
      function  MontaSelectFolhaInfoFolha(const iPatro: Integer): String; //Fernando Santana

      function  MontaUpdateCAPCAR(const sRecPag: String): String;
      function  MontaWhereComum: String;
      function  MontaWhereCAPCAR(const sRecPag: String): String;
      function  MontaWhereFolha(const iPatro: Integer): String;

      procedure EnviaItensFolha(const iPatro: Int64; const sNomePatro: String);
      procedure EnviaItensFolhaInfoFolha(const iPatro: Int64; const sNomePatro: String); //Fernando Santana
      procedure EnviaItensFolhaInformativa(const iPatro: Int64; const sNomePatro: String); //BRUNO AZEVEDO SOL 123125 KINTANA 612563
      procedure EnviaItensCAP;
      procedure EnviaItensCAR;
      procedure VerificaCobrancaEmAtraso;
      procedure  EnviaFolhaResgate; // MARCIO SANCHES SPINOSA SOL 169010 KINTANA 1495798
      // Marchetti - Pendencia 27929
      procedure DesmarcaNaoEnviar;


   public   // Public declarations

   Procedure FormatarComoMoeda( Componente : TObject; var Key: Char );

   end;



var
   frmExecEnvio: TfrmExecEnvio;



implementation
{$R *.DFM}
uses
   Dialogs, SysUtils, USistema, UDataBase, UMensErro, FProgresso, dBaseDados,
   uModulo, uVerificaPreenchimento, DLookEmptmo, dMS, uIntegraEmptmo, DEmptmo, uDiasUteis,
   UCalcEmptmo;




procedure TfrmExecEnvio.HabilitaBotoes;
begin
   btnContinuar.Enabled := True;
   btnVoltar.Enabled    := True;
   bbtnSair.Enabled     := True;

   ntbPrincipal.Enabled := True;
   Screen.Cursor        := crDefault;
end;

procedure TfrmExecEnvio.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   ntbPrincipal.Enabled := False;

   btnContinuar.Enabled := False;
   btnVoltar.Enabled    := False;
   bbtnSair.Enabled     := False;
end;


function TfrmExecEnvio.PegaAnoMes: String;
var
   sMes : String;
begin
   inherited;

   sMes := IntToStr(cboMes.ItemIndex + 1);
   if length(sMes) = 1 then sMes := '0' + sMes;

   Result := FormatFloat('0000', DBspnAno.Value) + sMes;
end;



procedure TfrmExecEnvio.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;

   // SitPart
   LimpaParametros(dtmLookEmptmo.qryLookSitPart);
   dtmLookEmptmo.qryLookSitPart.Open;

   with dtmLookEmptmo.qryLookPortadorFormaR do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
   end;
end;



function TfrmExecEnvio.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try

      if cboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

      if DBspnAno.Value <= 1980 then
         raise EValidacao.CreateVal('É necessário indicar o Ano de Competência!', DBspnAno);

   except

      on ev : EValidacao do
      begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmExecEnvio.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(Date);

   AbreQueries;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);

   chkVerificaCobrancaAtraso.Checked := dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1;

   dDataHoje := Sysdate;

   isEnviaFolhaResgate := 0;

   QryPlano1.Open;
   QryPlano2.Open;
   QryPlano3.Open;
   QryPlano4.Open;

   //Ewerton Beltramini - SIG56011 - 08/01/2020 - Inicio...
   CmbPlano1.Enabled := False;
   CmbPlano2.Enabled := False;
   CmbPlano3.Enabled := False;
   CmbPlano4.Enabled := False;
   EdtValor1.Enabled := False;
   EdtValor2.Enabled := False;
   EdtValor3.Enabled := False;
   EdtValor4.Enabled := False;

   CmbPlano1.Color := clBtnFace;
   CmbPlano2.Color := clBtnFace;
   CmbPlano3.Color := clBtnFace;
   CmbPlano4.Color := clBtnFace;
   EdtValor1.Color := clBtnFace;
   EdtValor2.Color := clBtnFace;
   EdtValor3.Color := clBtnFace;
   EdtValor4.Color := clBtnFace;
   //Ewerton Beltramini - SIG56011 - 08/01/2020 - Fim...

end;



procedure TfrmExecEnvio.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TfrmExecEnvio.VerificaCobrancaEmAtraso;
var
   sSQL           : String;
   sMensErro      : String;
   i              : Integer;
   iUltimaParcela : Integer;
   sFormaCobranca : String;
   sAnoMes        : String;
begin
   MostraEspera('Verificando itens em atraso a enviar...');

   sAnoMes := FormatFloat('0000', DBspnAno.Value) + FormatFloat('00', (cboMes.ItemIndex + 1));
   sFormaCobranca := '';

   if (chkFolhaPatro.Checked) or (chkFolhaBenef.Checked) then
      sFormaCobranca := sFormaCobranca + QuotedStr('F');

   if chkCar.Checked then
   begin
      if sFormaCobranca <> '' then sFormaCobranca := sFormaCobranca + ',';
      sFormaCobranca := sFormaCobranca + QuotedStr('C');
   end;

   sSQL :=
   'SELECT DISTINCT '                                                                        + #13 +

   // Marchetti - Pendencia 20045
   '   CON.IDCONTRATOEMPTMO,  '                                                              + #13 +
   '   TCE.FLGENVIAPARCMES, '                                                                + #13 +
   '   DECODE(NVL(CON.NUMPARCDESCONTO,0),0,NVL(TCE.NUMPARCDESCONTO,0),NVL(CON.NUMPARCDESCONTO,0)) AS NUMPARCDESCONTO, '                                      + #13 +
   '   NVL(TCE.TCETRATAPARCATRAS,''I'') AS TCETRATAPARCATRAS '                               + #13 +

   'FROM '                                                                                   + #13 +
   '   HISTMOVEMPTMO   HME, '                                                                + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                + #13 +
   '   ELEGPATRO       ELP, '                                                                + #13 +
   '   TIPOCONTREMPTMO TCE  '                                                                + #13 +
   'WHERE '                                                                                  + #13 +
   '       CON.FLGSITUACAO           NOT IN (''C'', ''Q'') '                                 + #13;

   sSQL := sSQL +
   '   AND HME.HMETIPOMOV            NOT IN (0,5,8) '                                        + #13 +
   '   AND HME.HMEANOCOBRANCA        = ' + FormatFloat('0000', DBspnAno.Value)               + #13 +
   '   AND HME.HMEMESCOBRANCA        = ' + FormatFloat('00', cboMes.itemIndex + 1)           + #13 +
   '   AND HME.HMEPARCELA            > 0 '                                                   + #13 +
   '   AND HME.FLGBAIXADO            = 0 '                                                   + #13 +
   '   AND HME.HMEFORMACOBRANCA      IN ( ' + sFormaCobranca + ') '                          + #13 +
   '   AND NVL(HME.FLGESTORNADO, 0)  = 0 '                                                   + #13 +
   '   AND HME.HMEVLREFETIVO         IS NULL '                                               + #13 +
   '   AND HME.HMEDATAEFETIVA        IS NULL '                                               + #13 +
   '   AND (HME.HMECENTRALIZA        = 1 OR HME.HMEDESTACADO = 1) '                          + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO      = ' + FormatFloat(#0, molContratoEmptmo.IDContrato)     + #13;

   // Renato Visoni SOL 105543 Kintana 472315
   if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//   '  AND CON.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
   '  AND CON.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

   if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//   '  AND CON.IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
   '  AND CON.IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO
   // Fim Renato Visoni


   sSQL := sSQL +
   '   AND TO_NUMBER((LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, ''0000'')))) || ' +
                    '(LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, ''00'')))) ' +
   '                ) < ' + FormatFloat('0000', DBspnAno.Value) + FormatFloat('00', (cboMes.ItemIndex + 1))   + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO          = ' + DBcboTipoEmptmo.LookupValue                       + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO     = ' + DBcboTipoContrato.LookupValue                     + #13;

   sSQL := sSQL +
   '   AND ( '                                                                               + #13 +
   '       CON.IDPATRO               IN ( ' + molListaPatro.PegaPatro + ' ) '                + #13 +
   '    OR ELP.IDPESSJURCEDIDO       IN ( ' + molListaPatro.PegaPatro + ' ) '                + #13 +
   '       ) '                                                                               + #13 +
   '   AND CON.IDPLANOPREV           IN ( ' + molListaPlano.PegaPlano + ' ) '                + #13 +
   '   AND CON.IDPATRO               = ELP.IDPESSJUR '                                       + #13 +
   '   AND CON.IDPESSOA              = ELP.IDPESSOA '                                        + #13 +
   '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO '                               + #13 +
   '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO ';

   with qryContratosDevedores do
   begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
   // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   // SQL.SaveToFile(Sistema.TempDir + 'EP-Envio-ContratosDevedores.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-Envio-ContratosDevedores.txt');
      Open;
   end;

   MostraEspera('Verificando itens em atraso a enviar...');

   while not(qryContratosDevedores.EOF) do
   begin
      // Somente verifica se for para tratar parcelas em atraso
      if qryContratosDevedoresTCETRATAPARCATRAS.AsString = 'T' then
      begin
         sSQL :=
         'SELECT DISTINCT HME.HMEPARCELA '                                                                      + #13 +
         'FROM '                                                                                                + #13 +
         '   HISTMOVEMPTMO HME '                                                                                + #13 +
         'WHERE '                                                                                               + #13 +
         '    ( HME.IDCONTRATOEMPTMO    = ' + qryContratosDevedoresIDCONTRATOEMPTMO.AsString + ' ) '            + #13 +

         'AND ( HME.FLGBAIXADO          = 0 ) '                                                                 + #13 +
         'AND ( HME.HMEDATAEFETIVA      IS NULL ) '                                                             + #13 +
         'AND ( HME.HMEVLREFETIVO       IS NULL ) '                                                             + #13 +
         'AND ( HME.HMETIPOMOV          NOT IN (0, 5, 8) ) '                                                    + #13 +
         'AND ( HME.HMEANOCOBRANCA      = ' + FormatFloat('0000', DBspnAno.Value) + ' ) '                       + #13 +
         'AND ( HME.HMEMESCOBRANCA      = ' + FormatFloat('00', cboMes.itemIndex + 1) + ' ) '                   + #13 +
         'AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ) '                                      + #13 +
         'AND NVL(HME.FLGESTORNADO, 0)  = 0 '                                                                   + #13 +
         'AND NVL(HME.FLGQUITADO, 0)    = 0 '                                                                   + #13 +
         'AND NVL(HME.FLGABONADO, 0)    = 0 '                                                                   + #13;

         if qryContratosDevedoresFLGENVIAPARCMES.AsInteger = 1 then
            sSQL := sSQL +
            'AND (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) || (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) < ' + QuotedStr(sAnoMes) + #13
         else
            sSQL := sSQL +
            'AND (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) || (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) <= '+ QuotedStr(sAnoMes) + #13;

         sSQL := sSQL +
         'ORDER BY '                                                                                            + #13 +
         '   HME.HMEPARCELA '                                                                                   + #13;

         with qryParcelasEmAberto do
         begin
            Close;
            Sql.Text := sSQL;
         // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
         // SQL.SaveToFile(Sistema.TempDir + 'EP-Envio-ParcelasEmAberto.txt');
            SQL.SaveToFile(ftempregra + '\' + 'EP-Envio-ParcelasEmAberto.txt');
            Open;
         end;

         qryParcelasEmAberto.First;

         for i := 1 to (qryContratosDevedoresNUMPARCDESCONTO.AsInteger) do qryParcelasEmAberto.Next;

         while not(qryParcelasEmAberto.EOF) do
         begin
            // Marchetti - Pendencia 20461
            with qryMarcaNaoEnviar do
            begin
               LimpaParametros(qryMarcaNaoEnviar);
               ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratosDevedoresIDCONTRATOEMPTMO.AsFloat;
               ParamByName('PHMEPARCELA').AsInteger      := qryParcelasEmAbertoHMEPARCELA.AsInteger;

               ExecSQL;
            end;
            // Fim Marchetti - Pendencia 20461

            qryParcelasEmAberto.Next;
         end;
      end;
      qryContratosDevedores.Next;
   end;

   EscondeEspera;
end;



procedure TfrmExecEnvio.btnContinuarClick(Sender: TObject);
var
   i        : Integer;
   sMsgErro : String;
   dDataIni : TDateTime;
   iContPlano, iAux : Integer;
   sAuxSql : String;     //Ewerton Beltramini - SIG65011
   sAuxSqlTemp : String; //Ewerton Beltramini - SIG65011
begin
   inherited;

   EnviaFolhaResgate;//MARCIO SANCHES SPINOSA SOL 169010 KINTANA 1495798

   if UFuncoesEmptmo.bBuscaMutuario then
      begin
         MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                           'O usuário é o próprio mutuário do '+
                           'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
      end;

   ParametrosSistema;

   if not(VerificaPreenchimento) then
      Exit;

   try
      DesabilitaBotoes;

      (* limpa os memos de resultado e erro *)
      memResult.Clear;
      memErro.Clear;

      dDataIni := Now;

      memResult.Lines.Add('Início do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', dDataIni));
      memResult.Lines.Add(' ');

      if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

      // -------------------------------------------------------------------------------------------
      //    Atualização da Forma de Envio (pela Situação do Participante)
      // -------------------------------------------------------------------------------------------
      if chkSitPart.Checked then
      begin
         if not(AtualizaSitPart(sMsgErro)) then
         begin
            MsgDlg('Erro ' + #13 +  sMsgErro, 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         end
         else
         begin
            memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' +
                     'Término da atualização da forma de envio de acordo com a situação dos Participantes ');
         end;
      end;

      Application.ProcessMessages;

      // ----------------------------------------------------------------------------------------
      //    Atualização do RecPag
      // ----------------------------------------------------------------------------------------
      if not(AtualizaRecPag(sMsgErro)) then
      begin
         MsgDlg('Erro ' + #13 +  sMsgErro, 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end
      else
      begin
         memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' +
                             'Término da atualização da forma de envio (recebimentos e devoluções) '
                            );
      end;

      Application.ProcessMessages;

      // ----------------------------------------------------------------------------------------
      //    Atualização das Rubricas (p/ Folha)
      // ----------------------------------------------------------------------------------------
      if ((chkFolhaBenef.Checked) or (chkFolhaPatro.Checked)) and (chkAtualiza.Checked) then
      begin
         if not(AtualizaRubricas(sMsgErro)) then
         begin
            MsgDlg('Erro ' + #13 +  sMsgErro, 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         end
         else
         begin
            memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' +
                                'Término da atualização das rubricas '
                               );
         end;
      end;

      Application.ProcessMessages;

      // -------------------------------------------------------------------------------------------
      //    Suspensão de prestações em atraso que extrapolem o limite de quantidade de prestações
      //    por mês a enviar
      // -------------------------------------------------------------------------------------------


      // Marchetti - Pendencia 20045
      // Alteração na rotina VerificaCobrancaEmAtraso para contemplar os parâmetros
      // de tratamento no cadastro de tipo de contrato

      if Sistema.TipoCliente <> 19991 then
      begin
         if (chkFolhaPatro.Checked) or (chkFolhaBenef.Checked) or (chkCar.Checked) then
         begin
            VerificaCobrancaEmAtraso;

            memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' +
                                'Término da verificação de itens em atraso a enviar '
                               );
         end;
      end;
      // Fim Marchetti - Pendencia 20045

      Application.ProcessMessages;

      // -------------------------------------------------------------------------------------------

      memResult.Lines.Add(' ');
      memResult.Lines.Add('Final das atualizações pré-envio      : ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      memResult.Lines.Add('Tempo total das atualizações pré-envio: ' + FormatDateTime('hh:nn:ss', (Now - dDataIni)));
      memResult.Lines.Add(' ');
      memResult.Lines.Add(' ');


      if dtmBaseDados.dbBaseDados.InTransaction then
         CommitTransacao;

      if MsgDlg('Deseja prosseguir com o Envio?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
         Repaint;

      // ----------------------------------------------------------------------------------------
      //    Envio
      // ----------------------------------------------------------------------------------------

      dDataIni := Now;

      memResult.Lines.Add(' ');
      memResult.Lines.Add('Início do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', dDataIni));
      memResult.Lines.Add(' ');

      // coloca os cabeçalhos nos memos
      memResult.Lines.Add(' ');
      memResult.Lines.Add('           Nº Contrato     Matrícula     Plano Patro Parcela  Item                   Valor        Tipo de Rubrica  Documento     ');
      memResult.Lines.Add('           --------------- ------------- ----- ----- ------- ----------------------- ------------ ---------------- --------------');


      // Folha(s)
//      if (chkFolhaBenef.Checked) or (chkFolhaPatro.Checked) then
//      begin
         // Faz o envio por Patro - em função da CTRLInterface
         for i := 0 to high(molListaPatro.vIDPatro) do
         begin
            if molListaPatro.lstPatro.Checked[i] then
            begin

              if chkFolhaBenef.Checked then
                 EnviaItensFolhaInformativa(molListaPatro.vIDPatro[i], molListaPatro.lstPatro.Items[i]);

              if (molListaPatro.vIDPatro[i] = 1) and (chkFolhaPatro.Checked) then
                 EnviaItensFolhaInfoFolha(molListaPatro.vIDPatro[i], molListaPatro.lstPatro.Items[i]);

              if (chkFolhaBenef.Checked) or (chkFolhaPatro.Checked) then
                 EnviaItensFolha(molListaPatro.vIDPatro[i], molListaPatro.lstPatro.Items[i]);

            end;
         end;

//      end; (* if Folha ou Ambos *)

      // CaP
      if (chkCaP.Checked) or (chkCaPDev.Checked) then
          EnviaItensCAP;

      // CaR
      if (chkCaR.Checked) then
          EnviaItensCAR;

      // Marchetti - Pendencia 27929
      if Sistema.TipoCliente <> 19991 then
      begin

         // Marchetti - Pendencia 20461
         if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;
            try

            // Marchetti - Pendencia 27929
            memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' +
                                'Início do ajuste de itens em atraso que não foram enviados '
                               );
            DesmarcaNaoEnviar;
            //with qryDesmarcaNaoEnviar do
            //begin
            //   ExecSQL;
            //end;

            CommitTransacao;
            memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' +
                                'Término do ajuste de itens em atraso que não foram enviados '
                               );
         except
            RollBackTransacao;
         end;
         // Fim Marchetti - Pendencia 20461
      end;

      // ----------------------------------------------------------------------------------------
      //    FIM Envio
      // ----------------------------------------------------------------------------------------

      //Ewerton Beltramini - SIG56011 - Inicio.................................................................................
      //Corrigindo o plano/valor do lançamento de empréstimo realizado na tempDesc
      //e acrescentando os demais lançamentos por plano/valor conforme preenchimento em tela.
      if FLGRESGATE.State = cbChecked then
      begin

            
            if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

            try
                QryAuxConsulta.Close;
                QryAuxConsulta.Sql.Clear;
                QryAuxConsulta.Sql.Add('select * from TMPDESC');
                QryAuxConsulta.Sql.Add('where idmodulo = 15');
                QryAuxConsulta.Sql.Add('and MESCOBRANCA = ' + QuotedStr(DBspnAno.text + '/' + FormatFloat('00', cboMes.itemIndex + 1)));
                QryAuxConsulta.Sql.Add('and iddesconto = '    + FloatToStr(molContratoEmptmo.IDContrato) );
                QryAuxConsulta.Sql.Add('order by idplanoprev, iddesconto');
                QryAuxConsulta.Open;

                //Se Localizar um lançamento na TmpDesc... corrige segundo os lançamentos informados em tela...
                if QryAuxConsulta.RecordCount = 1 then                
                begin

                      memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + 'Revisando os lançamentos de débito do Empréstimo sobre o Resgate:');

                      sAuxSql :=  'insert into TMPDESC '  +#13
                                + '(MESREFERENCIA,IDMODULO,CODALTERADOR,PLNCODIGOPREV,CODTIPRECDES,CODSUBCONTA,RECPAG,IDEMPRESAPROP,CODTIPDOC, PLACONTAD,PLANO,' +#13
                                + 'PLACONTAC, IDPESSOA,CODDOCUMENTOPREV,FLGTIPODESC,CODPORTFORMA, VALOR, IDTITULAR,IDPLANASS,IDDESCONTO,UNIDNEGOC,IDMOTIVO, DATARECEBIMENTO,' +#13
                                + 'CODCENTRORESPON,MESCOBRANCA,CODCENTROCUSTOD,IDPESSJUR,IDPROVENTO,CODCENTROCUSTOC, IDPLANOPREV, IDEMPRESA,VALORRECEBIDO, NUMPRIORIDADE,' +#13
                                + 'ORDEM,MATRICULA,INSCRICAONUMERO,VALORBASE1,VALORBASE2,VALORBASE3,FLGDESCONTO,CODRETORNO,NUMDEPENDSEGURO,CODPROVDESC,FLGDESCFOLHA,' +#13
                                + 'DATAREFERENCIA,DESCRICAO,REFERENCIA,FLGFORNPAG,FLGFORNCOMISS,IDFUNDACAO,CODDOCUMENTOEFET,PLNCODIGOEFET,SISTORIGEMVC5,FLGALTERADOR,' +#13
                                + 'PERIODO,EXERCICIO,FLGATRASODEVOL,DATACOBRANCA,NODOCUMENTO,COMPLDOCUMENTO,IDFAVORECIDO,IDLOTE,IDEMPCOBRANCA,TIPCODIGO, SITENVIO,' +#13
                                + 'SEQPROPOSTA,FLGEXISTEHST,NUMLANCTO,FONTEPAGADORA,FLGINTEVENTO,VALORINFO,PARCELARUB, IDPLANPREVCONTAB, PRAZORUB,IDREGRACALCULO,' +#13
                                + 'TRGDTINCLUSAO,TRGUSERINCLUSAO,FLGMANUAL,PARCELA,NUMPARCELAS,CODIGOCONTROLE,IDHISTMOVEMPTMO,FLGNAOPROCESSA,IDSEQINTERNOFB,' +#13
                                + 'IDTMPDESC,IDMOVBENEF,NUMRECEBIMENTO,DATAINICIO,SISTORIGEM,MESCOMPREEM)' +#13
                                + 'select MESREFERENCIA,IDMODULO,CODALTERADOR,PLNCODIGOPREV,CODTIPRECDES,CODSUBCONTA,RECPAG,IDEMPRESAPROP,CODTIPDOC, PLACONTAD,PLANO,' +#13
                                + 'PLACONTAC, IDPESSOA,CODDOCUMENTOPREV,FLGTIPODESC,CODPORTFORMA, @VALOR, IDTITULAR,IDPLANASS,IDDESCONTO,UNIDNEGOC,IDMOTIVO, DATARECEBIMENTO,' +#13
                                + 'CODCENTRORESPON,MESCOBRANCA,CODCENTROCUSTOD,IDPESSJUR,IDPROVENTO,CODCENTROCUSTOC, @IDPLANOPREV, IDEMPRESA,VALORRECEBIDO, NUMPRIORIDADE,' +#13
                                + 'ORDEM,MATRICULA,INSCRICAONUMERO,VALORBASE1,VALORBASE2,VALORBASE3,FLGDESCONTO,CODRETORNO,NUMDEPENDSEGURO,CODPROVDESC,FLGDESCFOLHA,' +#13
                                + 'DATAREFERENCIA,DESCRICAO,REFERENCIA,FLGFORNPAG,FLGFORNCOMISS,IDFUNDACAO,CODDOCUMENTOEFET,PLNCODIGOEFET,SISTORIGEMVC5,FLGALTERADOR,' +#13
                                + 'PERIODO,EXERCICIO,FLGATRASODEVOL,DATACOBRANCA,NODOCUMENTO,COMPLDOCUMENTO,IDFAVORECIDO,IDLOTE,IDEMPCOBRANCA,TIPCODIGO, SITENVIO,' +#13
                                + 'SEQPROPOSTA,FLGEXISTEHST,NUMLANCTO,FONTEPAGADORA,FLGINTEVENTO,VALORINFO,PARCELARUB, @IDPLANPREVCONTAB, PRAZORUB,IDREGRACALCULO,' +#13
                                + 'TRGDTINCLUSAO,TRGUSERINCLUSAO,FLGMANUAL,PARCELA,NUMPARCELAS,CODIGOCONTROLE,IDHISTMOVEMPTMO,FLGNAOPROCESSA,IDSEQINTERNOFB,' +#13
                                + 'CM.SEQTMPDESC.NEXTVAL AS IDTMPDESC ,IDMOVBENEF,NUMRECEBIMENTO,DATAINICIO,SISTORIGEM,MESCOMPREEM from TMPDESC ' +#13
                                + ' where idmodulo = 15 and MESCOBRANCA = ' + QuotedStr(QryAuxConsulta.FieldbyName('MESCOBRANCA').AsString )
                                + ' and iddesconto = ' + QryAuxConsulta.FieldbyName('iddesconto').AsString
                                + ' AND IDPLANOPREV = ' + QryAuxConsulta.FieldbyName('IDPLANOPREV').AsString
                                + ' AND IDPLANPREVCONTAB = ' + QryAuxConsulta.FieldbyName('IDPLANPREVCONTAB').AsString;

                      if (CmbPlano1.keyValue > 0) and (EdtValor1.text > '0') then
                      begin
                           sAuxSqlTemp := '';
                           QryAux.Close;
                           QryAux.Sql.Clear;
                           if QryAuxConsulta.FieldbyName('IDPLANPREVCONTAB').AsString = (CmbPlano1.keyvalue) then
                           begin
                              QryAux.Sql.Add( ' update TMPDESC set valor = ' + StringReplace(StringReplace(EdtValor1.text , '.' , '',[rfReplaceAll]),',','.', [rfReplaceAll])
                                            + ' WHERE iddesconto = ' + QryAuxConsulta.FieldbyName('iddesconto').AsString
                                            + ' and MESCOBRANCA = ' + QuotedStr(QryAuxConsulta.FieldbyName('MESCOBRANCA').AsString )
                                            + ' AND IDPLANOPREV = ' + QryAuxConsulta.FieldbyName('IDPLANOPREV').AsString
                                            + ' AND IDPLANPREVCONTAB = ' + QryAuxConsulta.FieldbyName('IDPLANPREVCONTAB').AsString);
                           end
                           else if ((QryAuxConsulta.FieldbyName('IDPLANPREVCONTAB').AsString <> (CmbPlano1.keyvalue))  and
                                    (QryAuxConsulta.FieldbyName('IDPLANPREVCONTAB').AsString <> (CmbPlano2.keyvalue))  and
                                    (QryAuxConsulta.FieldbyName('IDPLANPREVCONTAB').AsString <> (CmbPlano3.keyvalue))  and
                                    (QryAuxConsulta.FieldbyName('IDPLANPREVCONTAB').AsString <> (CmbPlano4.keyvalue))) then
                           begin
                               QryAux.Sql.Add( ' update TMPDESC set valor = ' + StringReplace(StringReplace(EdtValor1.text , '.' , '',[rfReplaceAll]),',','.', [rfReplaceAll])
                                             + ' , IDPLANOPREV = ' + QryPlano1.FieldByName('IDPLANOPREVPREV').AsString
                                             + ' , IDPLANPREVCONTAB = ' + QryPlano1.FieldByName('IDPLANOPREV').AsString
                                             + ' WHERE iddesconto = ' + QryAuxConsulta.FieldbyName('iddesconto').AsString
                                             + ' and MESCOBRANCA = ' + QuotedStr(QryAuxConsulta.FieldbyName('MESCOBRANCA').AsString )
                                             + ' AND IDPLANOPREV = ' + QryAuxConsulta.FieldbyName('IDPLANOPREV').AsString
                                             + ' AND IDPLANPREVCONTAB = ' + QryAuxConsulta.FieldbyName('IDPLANPREVCONTAB').AsString);
                           end
                           else
                           begin
                              //Carregando os valores...
                              sAuxSqlTemp :=  StringReplace(sAuxSql , '@VALOR,' , (StringReplace(StringReplace(EdtValor1.text , '.' , '',[rfReplaceAll]),',','.', [rfReplaceAll]) + ' AS VALOR,'),[rfReplaceAll]);
                              sAuxSqlTemp :=  StringReplace(sAuxSqlTemp , '@IDPLANOPREV,' , QryPlano1.FieldByName('IDPLANOPREVPREV').AsString  + ' AS IDPLANOPREV,' ,[rfReplaceAll]);
                              sAuxSqlTemp :=  StringReplace(sAuxSqlTemp , '@IDPLANPREVCONTAB,' , QryPlano1.FieldByName('IDPLANOPREV').AsString + ' AS IDPLANPREVCONTAB,' ,[rfReplaceAll]);
                              QryAux.Sql.text := sAuxSqlTemp;
                           end;
                           QryAux.ExecSql;
                           memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' --> Revisado: ' + QryPlano1.FieldbyName('NOME').AsString + ' - Valor Considerado: ' + EdtValor1.text);
                           Application.ProcessMessages;
                      end;

                      if (CmbPlano2.keyValue > 0) and (EdtValor2.text > '0') then
                      begin
                           sAuxSqlTemp := '';
                           QryAux.Close;
                           QryAux.Sql.Clear;
                           if QryAuxConsulta.FieldbyName('IDPLANPREVCONTAB').AsString = (CmbPlano2.keyvalue) then
                           begin
                              QryAux.Sql.Add( ' update TMPDESC set valor = ' + StringReplace(StringReplace(EdtValor2.text , '.' , '',[rfReplaceAll]),',','.', [rfReplaceAll])
                                            + ' WHERE iddesconto = ' + QryAuxConsulta.FieldbyName('iddesconto').AsString
                                            + ' and MESCOBRANCA = ' + QuotedStr(QryAuxConsulta.FieldbyName('MESCOBRANCA').AsString )
                                            + ' AND IDPLANOPREV = ' + QryAuxConsulta.FieldbyName('IDPLANOPREV').AsString
                                            + ' AND IDPLANPREVCONTAB = ' + QryAuxConsulta.FieldbyName('IDPLANPREVCONTAB').AsString);
                           end
                           else
                           begin
                              //Carregando os valores...
                              sAuxSqlTemp :=  StringReplace(sAuxSql , '@VALOR,' , (StringReplace(StringReplace(EdtValor2.text , '.' , '',[rfReplaceAll]),',','.', [rfReplaceAll]) + ' AS VALOR,'),[rfReplaceAll]);
                              sAuxSqlTemp :=  StringReplace(sAuxSqlTemp , '@IDPLANOPREV,' , QryPlano2.FieldByName('IDPLANOPREVPREV').AsString  + ' AS IDPLANOPREV,' ,[rfReplaceAll]);
                              sAuxSqlTemp :=  StringReplace(sAuxSqlTemp , '@IDPLANPREVCONTAB,' , QryPlano2.FieldByName('IDPLANOPREV').AsString + ' AS IDPLANPREVCONTAB,' ,[rfReplaceAll]);
                              QryAux.Sql.text := sAuxSqlTemp;
                           end;
                           QryAux.ExecSql;
                           memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' --> Revisado: ' + QryPlano2.FieldbyName('NOME').AsString  + ' - Valor Considerado: ' + EdtValor2.text);
                           Application.ProcessMessages;
                      end;

                      if (CmbPlano3.keyValue > 0) and (EdtValor3.text > '0') then
                      begin
                           sAuxSqlTemp := '';
                           QryAux.Close;
                           QryAux.Sql.Clear;
                           if QryAuxConsulta.FieldbyName('IDPLANPREVCONTAB').AsString = (CmbPlano3.keyvalue) then
                           begin
                              QryAux.Sql.Add( ' update TMPDESC set valor = ' + StringReplace(StringReplace(EdtValor3.text , '.' , '',[rfReplaceAll]),',','.', [rfReplaceAll])
                                            + ' WHERE iddesconto = ' + QryAuxConsulta.FieldbyName('iddesconto').AsString
                                            + ' and MESCOBRANCA = ' + QuotedStr(QryAuxConsulta.FieldbyName('MESCOBRANCA').AsString )
                                            + ' AND IDPLANOPREV = ' + QryAuxConsulta.FieldbyName('IDPLANOPREV').AsString
                                            + ' AND IDPLANPREVCONTAB = ' + QryAuxConsulta.FieldbyName('IDPLANPREVCONTAB').AsString);
                           end
                           else
                           begin
                              //Carregando os valores...
                              sAuxSqlTemp :=  StringReplace(sAuxSql , '@VALOR,' , (StringReplace(StringReplace(EdtValor3.text , '.' , '',[rfReplaceAll]),',','.', [rfReplaceAll]) + ' AS VALOR,'),[rfReplaceAll]);
                              sAuxSqlTemp :=  StringReplace(sAuxSqlTemp , '@IDPLANOPREV,' , QryPlano3.FieldByName('IDPLANOPREVPREV').AsString  + ' AS IDPLANOPREV,' ,[rfReplaceAll]);
                              sAuxSqlTemp :=  StringReplace(sAuxSqlTemp , '@IDPLANPREVCONTAB,' , QryPlano3.FieldByName('IDPLANOPREV').AsString + ' AS IDPLANPREVCONTAB,' ,[rfReplaceAll]);
                              QryAux.Sql.text := sAuxSqlTemp;

                           end;
                           QryAux.ExecSql;
                           memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' --> Revisado: ' + QryPlano3.FieldbyName('NOME').AsString + ' - Valor Considerado: ' + EdtValor3.text);
                           Application.ProcessMessages;
                      end;

                      if (CmbPlano4.keyValue > 0) and (EdtValor4.text > '0') then
                      begin
                           sAuxSqlTemp := '';
                           QryAux.Close;
                           QryAux.Sql.Clear;
                           if QryAuxConsulta.FieldbyName('IDPLANPREVCONTAB').AsString = (CmbPlano4.keyvalue) then
                           begin   QryAux.Sql.Add( ' update TMPDESC set valor = ' + StringReplace(StringReplace(EdtValor4.text , '.' , '',[rfReplaceAll]),',','.', [rfReplaceAll])
                                            + ' WHERE iddesconto = ' + QryAuxConsulta.FieldbyName('iddesconto').AsString
                                            + ' and MESCOBRANCA = ' + QuotedStr(QryAuxConsulta.FieldbyName('MESCOBRANCA').AsString )
                                            + ' AND IDPLANOPREV = ' + QryAuxConsulta.FieldbyName('IDPLANOPREV').AsString
                                            + ' AND IDPLANPREVCONTAB = ' + QryAuxConsulta.FieldbyName('IDPLANPREVCONTAB').AsString);
                           end
                           else
                           begin
                              //Carregando os valores...
                              sAuxSqlTemp :=  StringReplace(sAuxSql , '@VALOR,' , (StringReplace(StringReplace(EdtValor4.text , '.' , '',[rfReplaceAll]),',','.', [rfReplaceAll]) + ' AS VALOR,'),[rfReplaceAll]);
                              sAuxSqlTemp :=  StringReplace(sAuxSqlTemp , '@IDPLANOPREV,' , QryPlano4.FieldByName('IDPLANOPREVPREV').AsString  + ' AS IDPLANOPREV,' ,[rfReplaceAll]);
                              sAuxSqlTemp :=  StringReplace(sAuxSqlTemp , '@IDPLANPREVCONTAB,' , QryPlano4.FieldByName('IDPLANOPREV').AsString + ' AS IDPLANPREVCONTAB,' ,[rfReplaceAll]);
                              QryAux.Sql.text := sAuxSqlTemp;
                           end;
                           QryAux.ExecSql;
                           memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' --> Revisado: ' + QryPlano4.FieldbyName('NOME').AsString + ' - Valor Considerado: ' + EdtValor4.text);
                           Application.ProcessMessages;
                      end;

                      CommitTransacao;
                      memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - Lançamentos de débitos do Empréstimos Revisados.' );
                end
                else if QryAuxConsulta.RecordCount > 1 then
                begin
                      if (CmbPlano1.keyValue > 0) then
                      begin
                           sAuxSqlTemp := '';
                           QryAux.Close;
                           QryAux.Sql.Clear;
                           if QryAuxConsulta.FieldbyName('IDPLANPREVCONTAB').AsString <> (CmbPlano1.keyvalue) then
                           begin
                               QryAux.Sql.Add( ' update TMPDESC set IDPLANOPREV = ' + QryPlano1.FieldByName('IDPLANOPREVPREV').AsString
                                             + ' , IDPLANPREVCONTAB = ' + QryPlano1.FieldByName('IDPLANOPREV').AsString
                                             + ' WHERE iddesconto = ' + QryAuxConsulta.FieldbyName('iddesconto').AsString
                                             + ' and MESCOBRANCA = ' + QuotedStr(QryAuxConsulta.FieldbyName('MESCOBRANCA').AsString )
                                             + ' AND IDPLANOPREV = ' + QryAuxConsulta.FieldbyName('IDPLANOPREV').AsString
                                             + ' AND IDPLANPREVCONTAB = ' + QryAuxConsulta.FieldbyName('IDPLANPREVCONTAB').AsString);
                           end;
                           QryAux.ExecSql;
                           memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' --> Revisado: ' + QryPlano1.FieldbyName('NOME').AsString + ' - Valores Inalterados!');
                           Application.ProcessMessages;
                      end;
                      CommitTransacao;
                      memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - Lançamentos de débitos do Empréstimos Revisados.' );
                end
                else if QryAuxConsulta.RecordCount < 1 then
                begin
                     memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - Nenhum lançamento encontrado! ');
                     RollBackTransacao;
                end;

            except
                RollBackTransacao;
            end;

      end;
      //Ewerton Beltramini - SIG56011 - Fim.........................................................................................

      //vai para página de Resultados
      ntbPrincipal.PageIndex := 1;
      Repaint;

   finally
      memResult.Lines.Add(' ');
      memResult.Lines.Add('Final do Processo      : ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      memResult.Lines.Add('Tempo total do Processo: ' + FormatDateTime('hh:nn:ss', (Now - dDataIni)));

    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //memResult.Lines.SaveToFile(Sistema.TempDir + 'EP - ResultEnvio ' + FormatDateTime('yyyy-mm-dd hh-nn-ss', Now) + '.log');
      memResult.Lines.SaveToFile(ftempregra + '\' + 'EP - ResultEnvio ' + FormatDateTime('yyyy-mm-dd hh-nn-ss', Now) + '.log');

      HabilitaBotoes;
   end;
end;



function TfrmExecEnvio.AtualizaSitPart(var sMsgErro: String): Boolean;
var
   sSQL        : String;
   qryAux      : TwwQuery;
begin
   Result := True;

   MostraEspera('Atualizando forma de envio de acordo com a Situação dos Participantes...');

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      try
         // ----------------------------------------------------------------------------------------
         // Se Excepcional, muda o forma de cobranca das parcelas atrasadas para a forma original do contrato
         if dtmEmptmo.qryparamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            sSQL :=
            //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
            'UPDATE '                   + #13 +
            //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim
            '   HISTMOVEMPTMO H '                                                               + #13 +
            'SET '                                                                              + #13 +

            '   HMETIPOFOLHA              = (SELECT DECODE(C.FLGFORMAREC, ''F'', ''P'', NULL) FROM CONTRATOEMPTMO C WHERE C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO), '  + #13 +
            // Denise Arruda 25/09/2008 N.Sol: 96058 N.Kintana: 415878
            //'   HMEFORMACOBRANCA          = (SELECT C.FLGFORMAREC FROM CONTRATOEMPTMO C WHERE C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO), '                              + #13 +
            '   CODDOCUMENTO              = NULL '                                              + #13 +
            'WHERE '                                                                            + #13 +
            '       HMEANOCOBRANCA        = ' + FormatFloat('0000', DBspnAno.Value)             + #13 +
            '   AND HMEMESCOBRANCA        = ' + FormatFloat('00', cboMes.itemIndex + 1)         + #13 +
            '   AND HMEDATAVENCTO        >= HMEDATAPREVISTA '                                   + #13;

            if length(trim(edtDataVenctoIni.Text)) > 0 then sSQL := sSQL +
            '   AND HMEDATAVENCTO        >= ' + OraData(edtDataVenctoIni.Date)                  + #13;

            if length(trim(edtDataVenctoFim.Text)) > 0 then sSQL := sSQL +
            '   AND HMEDATAVENCTO        <= ' + OraData(edtDataVenctoFim.Date)                  + #13;

            sSQL := sSQL +
            '   AND FLGENVIO              = 0 '                                                 + #13 +
            '   AND FLGBAIXADO            = 0 '                                                 + #13 +
            '   AND HMEVLREFETIVO         IS NULL '                                             + #13 +
            '   AND HMEDATAEFETIVA        IS NULL '                                             + #13 +
            '   AND HMETIPOMOV            IN (1, 4, 6, 7) '                                     + #13 +
            '   AND NVL(FLGESTORNADO, 0)  = 0 '                                                 + #13 +
            '   AND NVL(FLGABONADO, 0)    = 0 '                                                 + #13 +
            '   AND NVL(FLGQUITADO, 0)    = 0 '                                                 + #13 +
            '   AND (HMECENTRALIZA        = 1 OR HMEDESTACADO = 1) '                            + #13;

            if molContratoEmptmo.IDContrato > 0 then
               sSQL := sSQL +
            '   AND H.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)   + #13;

            // Renato Visoni SOL 105543 Kintana 472315
            if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then
               sSQL := sSQL +
//             '  AND H.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
             '  AND H.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

            if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then
                sSQL := sSQL +
//             '  AND H.IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
             '  AND H.IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO
            // Fim Renato Visoni


            sSQL := sSQL +
            '   AND H.IDCONTRATOEMPTMO IN '                                                     + #13 +
            '       ( '                                                                         + #13 +
            '       SELECT '                                                                    + #13 +
            '          CON.IDCONTRATOEMPTMO '                                                   + #13 +
            '       FROM '                                                                      + #13 +
            '          CONTRATOEMPTMO  CON, '                                                   + #13 +
            '          ELEGPATRO       ELP, '                                                   + #13 +
            '          TIPOCONTREMPTMO TCE '                                                    + #13 +
            '       WHERE '                                                                     + #13 +
            '              CON.FLGSITUACAO         NOT IN (''C'', ''Q'') '                      + #13;

            if trim(DBcboTipoEmptmo.LookupValue) <> EmptyStr then sSQL := sSQL +
            '          AND TCE.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue            + #13;

            if (DBcboTipoContrato.LookupValue) <> EmptyStr then
                sSQL := sSQL +
            '          AND CON.IDTIPOCONTREMPTMO   = ' + DBcboTipoContrato.LookupValue          + #13;

            sSQL := sSQL +
            '          AND ( '                                                                  + #13 +
            '              CON.IDPATRO             IN ( ' + molListaPatro.PegaPatro + ' ) '     + #13 +
            '           OR ELP.IDPESSJURCEDIDO     IN ( ' + molListaPatro.PegaPatro + ' ) '     + #13 +
            '              ) '                                                                  + #13 +
            '          AND CON.IDPLANOPREV         IN ( ' + molListaPlano.PegaPlano + ' ) '     + #13 +

            '          AND CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO '                    + #13 +
            '          AND CON.IDPATRO             = ELP.IDPESSJUR '                            + #13 +
            '          AND CON.IDPESSOA            = ELP.IDPESSOA '                             + #13 +
            '          AND CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO '                    + #13 +
            '       ) ';

            qryAux.SQL.Clear;
            qryAux.SQL.Text := sSQL;
          //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
          //qryAux.SQL.SaveToFile(Sistema.TempDir + 'EP-Envio-UpdateFormaOrigem.txt');
            qryAux.SQL.SaveToFile(ftempregra + '\' + 'EP-Envio-UpdateFormaOrigem.txt');
            qryAux.ExecSQL;

            // -------------------------------------------------------------------------------------
            // André Pontes - 11/01/2006 - LogDocumento - OK

            LimpaRegistroLog(rLogTotalPrev);

            rLogTotalPrev.IDModulo   := Sistema.IDModulo;
            rLogTotalPrev.IDContrato := -1;
            rLogTotalPrev.IDHistMov  := -1;
            rLogTotalPrev.CodPlanDoc := -1;
            rLogTotalPrev.Origem     := 19;
            rLogTotalPrev.Operacao   := 'Limpa CodDocumento (AtualizaSitPart-UpdateFormaOrigem) ';
            rLogTotalPrev.Data       := SysDate;
            rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
            rLogTotalPrev.Versao     := Sistema.Versao;

            GravaLogTotalPrev(rLogTotalPrev);

            // -------------------------------------------------------------------------------------
         end;
         // ----------------------------------------------------------------------------------------

         Application.ProcessMessages;

         // ----------------------------------------------------------------------------------------
         // Contas a Receber - MA, MP, MS, CA (não pensionista)
         //                    No caso FUNCEF, IDPessjurCedido <> IDPessjur

         sSQL :=
         'UPDATE '                                                                              + #13 +
         '   HISTMOVEMPTMO '                                                                    + #13 +
         'SET '                                                                                 + #13 +
         // Denise Arruda 25/09/2008 N.Sol: 96058 N.Kintana: 415878
         //'   HMEFORMACOBRANCA          = ''C'', '                                               + #13 +
         '   HMETIPOFOLHA              = NULL '                                                 + #13 +
         'WHERE '                                                                               + #13 +
         '       HMEFORMACOBRANCA      = ''F'' '                                                + #13 +
         '   AND FLGENVIO              = 0 '                                                    + #13 +
         '   AND FLGBAIXADO            = 0 '                                                    + #13 +
         '   AND HMEVLREFETIVO         IS NULL '                                                + #13 +
         '   AND HMEDATAEFETIVA        IS NULL '                                                + #13 +
         '   AND HMETIPOMOV            NOT IN (5, 8) '                                          + #13 +
         '   AND HMEANOCOBRANCA        = ' + FormatFloat('0000', DBspnAno.Value)                + #13 +
         '   AND HMEMESCOBRANCA        = ' + FormatFloat('00', cboMes.itemIndex + 1)            + #13;

         if length(trim(edtDataVenctoIni.Text)) > 0 then sSQL := sSQL +
         '   AND HMEDATAVENCTO        >= ' + OraData(edtDataVenctoIni.Date)                     + #13;

         if length(trim(edtDataVenctoFim.Text)) > 0 then
            sSQL := sSQL +
         '   AND HMEDATAVENCTO        <= ' + OraData(edtDataVenctoFim.Date)                     + #13;

         sSQL := sSQL +
         '   AND ( HMECENTRALIZA       = 1 OR HMEDESTACADO = 1 ) '                              + #13 +
         '   AND NVL(FLGESTORNADO, 0)  = 0 '                                                    + #13 +
         '   AND NVL(FLGABONADO, 0)    = 0 '                                                    + #13 +
         '   AND NVL(FLGQUITADO, 0)    = 0 '                                                    + #13;

         if (molContratoEmptmo.IDContrato > 0) then
            sSQL := sSQL +
         '   AND IDCONTRATOEMPTMO      = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)    + #13;


         // Renato Visoni SOL 105543 Kintana 472315
         if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then
             sSQL := sSQL +
//           '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
           '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

         if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then
            sSQL := sSQL +
//           '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
           '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO
         // Fim Renato Visoni


         sSQL := sSQL +
         '   AND IDCONTRATOEMPTMO      IN '                                                     + #13 +
         '       ( '                                                                            + #13 +
         '       SELECT '                                                                       + #13 +
         '          CON.IDCONTRATOEMPTMO '                                                      + #13 +
         '       FROM '                                                                         + #13 +
         '          CONTRATOEMPTMO  CON, '                                                      + #13 +
         '          ELEGPATRO       ELP, '                                                      + #13 +
         '          TIPOCONTREMPTMO TCE, '                                                      + #13 +
         '          PARTPREVPLAN    PPP, '                                                      + #13 +
         '          SITPART         SP,  '                                                      + #13 +
         '          SITFUNC         SF   '                                                      + #13 +
         '       WHERE '                                                                        + #13 +
         '              CON.FLGSITUACAO         NOT IN (''C'', ''Q'') '                         + #13 +

         //  NAO Assistido (pode ser Cancelado ou Mantido (total, parcial e saldo de conta))
         '-- NAO Assistido (pode ser Cancelado ou Mantido (total, parcial e saldo de conta)) '  + #13 +
         '          AND SP.FLGINTERNO          <> ''AS'' '                                      + #13 +
         '---------------------------------------------------------------------------------- '  + #13 +

         //  NAO Pensionista (com titular cancelado)
         '-- NAO Pensionista (com titular cancelado) '                                          + #13 +
         '          AND NOT(CON.IDPESSOA       <> CON.IDBENEF AND SP.FLGINTERNO  = ''CA'' ) '   + #13 +
         '---------------------------------------------------------------------------------- '  + #13;

         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1 then
            sSQL := sSQL +
         //  NAO (proprio e Ativo na Patro)
         '-- NAO (proprio e Ativo na Patro) '                                                   + #13 +
         '          AND NOT(CON.IDPESSOA        = CON.IDBENEF AND SF.TIPOSIT     = ''A'' ) '    + #13 +
         '---------------------------------------------------------------------------------- '  + #13;

         // André Pontes - pendência 17160 - 06/07/2004
         if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
             sSQL := sSQL +
         //  NAO (proprio e Ativo na Patro)
         '-- NAO (proprio e Ativo/Afastado na Patro) '                                                + #13 +
         '          AND NOT(CON.IDPESSOA        = CON.IDBENEF AND '                                   + #13 +
         '                  CON.IDPATRO        <> ' + FormatFloat('#0', Sistema.IDEmpresa) + ' AND '  + #13 +
         '                  SF.TIPOSIT          = ''A'' '                                             + #13 +
         '                 ) '                                                                        + #13 +
         '          AND NOT(CON.IDPESSOA        = CON.IDBENEF AND '                                   + #13 +
         '                  CON.IDPATRO         = ' + FormatFloat('#0', Sistema.IDEmpresa) + ' AND '  + #13 +
         '                  SF.TIPOSIT          IN (''A'', ''F'') '                                   + #13 +
         '                 ) '                                                                        + #13 +
         '---------------------------------------------------------------------------------- '        + #13 +
         '          AND ELP.IDPESSJURCEDIDO     IS NULL '                                             + #13;
         // FIM André Pontes - pendência 17160 - 06/07/2004

         if trim(DBcboTipoEmptmo.LookupValue) <> EmptyStr then
            sSQL := sSQL +
         '          AND TCE.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue               + #13;

         if trim(DBcboTipoContrato.LookupValue) <> EmptyStr then
            sSQL := sSQL +
         '          AND CON.IDTIPOCONTREMPTMO   = ' + trim(DBcboTipoContrato.LookupValue)             + #13;

         sSQL := sSQL +
         '          AND ( '                                                                     + #13 +
         '              CON.IDPATRO             IN ( ' + molListaPatro.PegaPatro + ' ) '        + #13 +
         '           OR ELP.IDPESSJURCEDIDO     IN ( ' + molListaPatro.PegaPatro + ' ) '        + #13 +
         '              ) '                                                                     + #13 +
         '          AND CON.IDPLANOPREV         IN ( ' + molListaPlano.PegaPlano + ' ) '        + #13 +

         '          AND CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO '                       + #13 +
         '          AND CON.IDPESSOA            = ELP.IDPESSOA '                                + #13 +
         '          AND CON.IDPATRO             = ELP.IDPESSJUR '                               + #13 +
         '          AND CON.IDPESSOA            = PPP.IDPESSOA '                                + #13 +
         '          AND CON.IDPATRO             = PPP.IDPESSJUR '                               + #13 +
         '          AND PPP.IDSITPART           = SP.IDSITPART '                                + #13 +
         '          AND ELP.IDSITFUNC           = SF.IDSITFUNC '                                + #13 +
         //Pendência 26775 - 27/12/2007
         //'          AND PPP.FLGDESATIVADO       = 0 '                                           + #13 +
         //'          AND ((PPP.FLGDESATIVADO     = 0 AND CON.IDPLANOCOB IS NULL) OR '            + #13 +
//Ádler Souza - SOL N° 121503 KTN N°586687 - Início

{        '     AND ((PPP.FLGDESATIVADO  = 0'+ #13 +
         '     OR'+ #13 +
         '    (PPP.FLGDESATIVADO = 1 AND NOT EXISTS (SELECT 1 FROM partprevplan ppp1'              + #13 +
         '                                           WHERE ppp1.idpessoa = ppp.idpessoa'           + #13 +
         '                                             AND ppp1.flgdesativado = 0)'                + #13 +
         '                           AND (ppp.idsitplanoprev = 25'                                 + #13 +
         '                                OR'                                                      + #13 +
         '                               (ppp.idplanoprev = (select max(ppp1.idplanoprev) from partprevplan ppp1'                + #13 +
         '                                                   where ppp1.idpessoa = ppp.idpessoa'                                 + #13 +
         '                                                   and   ppp1.datacancelamento = (SELECT MAX(ppp2.datacancelamento)'   + #13 +
         '                                                                                  FROM partprevplan ppp2'              + #13 +
         '                                                                                  WHERE ppp2.idpessoa = ppp1.idpessoa)'+ #13 +
         '                                                   and   not exists (select 1 from partprevplan ppp2'                  + #13 +
         '                                                                     where ppp2.idpessoa = ppp1.idpessoa'              + #13 +
         '                                                                     and   ppp2.idsitplanoprev = 25))))))'             + #13 +}
//Ádler Souza - SOL N° 121503 KTN N°586687 - Fim
//Ádler Souza - SOL N° 140060 KTN N°873169
         '          AND ((ppp.idplanoprev = '                                          + #13 +
         '        (SELECT MAX(ppp2.idplanoprev) '                                      + #13 +
         '          FROM partprevplan ppp2 '                                           + #13 +
         '         WHERE ppp2.flgdesativado = 0 '                                      + #13 +
         '           AND ppp2.idpessoa = ppp.idpessoa) OR '                            + #13 +
         '        (PPP.FLGDESATIVADO = 1 AND NOT EXISTS '                              + #13 +
         '        (SELECT 1 '                                                          + #13 +
         '           FROM partprevplan ppp1 '                                          + #13 +
         '          WHERE ppp1.idpessoa = ppp.idpessoa '                               + #13 +
         '            AND ppp1.flgdesativado = 0) AND '                                + #13 +
         '        (ppp.idsitplanoprev = 25 OR '                                        + #13 +
         '        (ppp.idplanoprev = '                                                 + #13 +
         '        (SELECT MAX(ppp1.idplanoprev)'                                       + #13 +
         '             FROM partprevplan ppp1 '                                        + #13 +
         '            WHERE ppp1.idpessoa = ppp.idpessoa '                             + #13 +
         '              AND nvl(ppp1.datacancelamento, TRIM(SYSDATE)) = '              + #13 +
         '                  (SELECT nvl(MAX(ppp2.datacancelamento), TRIM(SYSDATE)) '   + #13 +
         '                     FROM partprevplan ppp2 '                                + #13 +
         '                    WHERE ppp2.idpessoa = ppp1.idpessoa) '                   + #13 +
         '              AND NOT EXISTS (SELECT 1 '                                     + #13 +
         '                     FROM partprevplan ppp2 '                                + #13 +
         '                    WHERE ppp2.idpessoa = ppp1.idpessoa '                    + #13 +
         '                      AND ppp2.idsitplanoprev = 25)))))) '                   + #13 +
         '           AND CON.IDPLANOCOB IS NULL)  '                                    + #13 +
         '           OR  (PPP.IDPLANOPREV       = CON.IDPLANOCOB) '                    + #13 +

//Fim - Ádler Souza - SOL N° 140060 KTN N°873169

         //Fim Pendência 26775
         '       ) ';

         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
       //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
       //qryAux.SQL.SaveToFile(Sistema.TempDir + 'EP-Envio-UpdateSitFormaCaR.txt');
         qryAux.SQL.SaveToFile(ftempregra + '\' + 'EP-Envio-UpdateSitFormaCaR.txt');
         qryAux.ExecSQL;
         // ----------------------------------------------------------------------------------------

         Application.ProcessMessages;

         // ----------------------------------------------------------------------------------------
         // Folha da Patrocinadora - AT

         // André Pontes - 11/11/2004, a pedido de José Célio, que passou as hints
         if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.asInteger = 1) then
            sSQL :=
         //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
         'UPDATE '                       + #13
         //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim
         else sSQL :=
         'UPDATE '                                                                              + #13;
         // FIM André Pontes - 11/11/2004, a pedido de José Célio, que passou as hints

         sSQL := sSQL +
         '   HISTMOVEMPTMO '                                                                    + #13 +
         'SET '                                                                                 + #13 +
         '   HMETIPOFOLHA              = ''P'' '                                                + #13 +
         'WHERE '                                                                               + #13 +
         '       HMEFORMACOBRANCA      = ''F'' '                                                + #13 +
         '   AND FLGENVIO              = 0 '                                                    + #13 +
         '   AND FLGBAIXADO            = 0 '                                                    + #13 +
         '   AND HMEVLREFETIVO         IS NULL '                                                + #13 +
         '   AND HMEDATAEFETIVA        IS NULL '                                                + #13 +
         '   AND HMETIPOMOV            NOT IN (5, 8) '                                          + #13 +
         '   AND HMEANOCOBRANCA        = ' + FormatFloat('0000', DBspnAno.Value)                + #13 +
         '   AND HMEMESCOBRANCA        = ' + FormatFloat('00', cboMes.itemIndex + 1)            + #13;

         if length(trim(edtDataVenctoIni.Text)) > 0 then
            sSQL := sSQL +
         '   AND HMEDATAVENCTO        >= ' + OraData(edtDataVenctoIni.Date)                     + #13;

         if length(trim(edtDataVenctoFim.Text)) > 0 then
            sSQL := sSQL +
         '   AND HMEDATAVENCTO        <= ' + OraData(edtDataVenctoFim.Date)                     + #13;

         sSQL := sSQL +
         '   AND ( HMECENTRALIZA       = 1 OR HMEDESTACADO = 1 ) '                              + #13 +
         '   AND NVL(FLGESTORNADO, 0)  = 0 '                                                    + #13 +
         '   AND NVL(FLGABONADO, 0)    = 0 '                                                    + #13 +
         '   AND NVL(FLGQUITADO, 0)    = 0 '                                                    + #13;

         if (molContratoEmptmo.IDContrato > 0) then
             sSQL := sSQL +
         '   AND IDCONTRATOEMPTMO      = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)    + #13;


         // Renato Visoni SOL 105543 Kintana 472315
         if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then
             sSQL := sSQL +
//           '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
           '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

         if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then
             sSQL := sSQL +
//           '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
           '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO
         // Fim Renato Visoni


         sSQL := sSQL +
         '   AND IDCONTRATOEMPTMO      IN '                                                     + #13 +
         '       ( '                                                                            + #13;

         // André Pontes - 11/11/2004, a pedido de José Célio, que passou as hints
         if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.asInteger = 1) then
             sSQL := sSQL +
         //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
         '       SELECT '                                                                       + #13
         //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
         else sSQL := sSQL +
         '       SELECT '                                                                       + #13;
         // FIM André Pontes - 11/11/2004, a pedido de José Célio, que passou as hints

         sSQL := sSQL +
         '          CON.IDCONTRATOEMPTMO '                                                      + #13 +
         '       FROM '                                                                         + #13 +
         '          CONTRATOEMPTMO  CON, '                                                      + #13 +
         '          ELEGPATRO       ELP, '                                                      + #13 +
         '          TIPOCONTREMPTMO TCE, '                                                      + #13 +
         '          PARTPREVPLAN    PPP, '                                                      + #13 +
         '          SITPART         SP,  '                                                      + #13 +
         '          SITFUNC         SF   '                                                      + #13 +
         '       WHERE '                                                                        + #13 +
         '              CON.FLGSITUACAO         NOT IN (''C'', ''Q'') '                         + #13 +

         //  NAO Assistido
         '-- NAO Assistido '                                                                    + #13 +
         '          AND SP.FLGINTERNO          <> ''AS'' '                                      + #13 +
         '---------------------------------------------------------------------------------- '  + #13 +

         //  Mutuario = Titular (proprio)
         '-- Mutuario = Titular (proprio) '                                                     + #13 +
         '          AND CON.IDPESSOA            = CON.IDBENEF '                                 + #13 +
         '---------------------------------------------------------------------------------- '  + #13;

         if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1) then
             sSQL := sSQL +
         //  Ativo na Patro
         '-- Ativo na Patro '                                                                   + #13 +
         '          AND SF.TIPOSIT              = ''A'' '                                       + #13 +
         '---------------------------------------------------------------------------------- '  + #13;

         if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
             sSQL := sSQL +
         //  Ativo na Patro ou cedido a Fundacao '
         '-- Ativo na Patro ou Ativo/Afastado na Fundação ou cedido a Fundacao '                + #13 +
         '          AND ( '                                                                     + #13 +
         '              SF.TIPOSIT              = ''A'' OR '                                    + #13 +
         '              ELP.IDPESSJURCEDIDO     = ' + IntToStr(Sistema.IDEmpresa) + ' OR '      + #13 +
         '              (CON.IDPATRO            = ' + IntToStr(Sistema.IDEmpresa) + ' AND '     + #13 +
         '               SF.TIPOSIT             IN (''A'', ''F'') ) '                           + #13 +
         '              ) '                                                                     + #13 +
         '---------------------------------------------------------------------------------- '  + #13;

         if trim(DBcboTipoEmptmo.LookupValue) <> EmptyStr then
            sSQL := sSQL +
         '          AND TCE.IDTIPOEMPTMO        = ' + trim(DBcboTipoEmptmo.LookupValue)        + #13;

         if trim(DBcboTipoContrato.LookupValue) <> EmptyStr then
            sSQL := sSQL +
         '          AND CON.IDTIPOCONTREMPTMO   = ' + trim(DBcboTipoContrato.LookupValue)             + #13;

         sSQL := sSQL +
         '          AND ( '                                                                     + #13 +
         '              CON.IDPATRO             IN ( ' + molListaPatro.PegaPatro + ' ) '        + #13 +
         '           OR ELP.IDPESSJURCEDIDO     IN ( ' + molListaPatro.PegaPatro + ' ) '        + #13 +
         '              ) '                                                                     + #13 +
         '          AND CON.IDPLANOPREV         IN ( ' + molListaPlano.PegaPlano + ' ) '        + #13 +

         '          AND CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO '                       + #13 +
         '          AND CON.IDPESSOA            = ELP.IDPESSOA '                                + #13 +
         '          AND CON.IDPATRO             = ELP.IDPESSJUR '                               + #13 +
         '          AND CON.IDPESSOA            = PPP.IDPESSOA '                                + #13 +
         '          AND CON.IDPATRO             = PPP.IDPESSJUR '                               + #13 +
         '          AND PPP.IDSITPART           = SP.IDSITPART '                                + #13 +
         '          AND ELP.IDSITFUNC           = SF.IDSITFUNC '                                + #13 +
         //Pendência 26775 - 27/12/2007
         //'          AND PPP.FLGDESATIVADO       = 0 '                                           + #13;
         //'          AND ((PPP.FLGDESATIVADO     = 0 AND CON.IDPLANOCOB IS NULL) OR '            + #13 +
//Ádler Souza - SOL N° 121503 KTN N°586687 - Início
{        '     AND ((PPP.FLGDESATIVADO  = 0'+ #13 +
         '     OR'+ #13 +
         '    (PPP.FLGDESATIVADO = 1 AND NOT EXISTS (SELECT 1 FROM partprevplan ppp1'              + #13 +
         '                                           WHERE ppp1.idpessoa = ppp.idpessoa'           + #13 +
         '                                             AND ppp1.flgdesativado = 0)'                + #13 +
         '                           AND (ppp.idsitplanoprev = 25'                                 + #13 +
         '                                OR'                                                      + #13 +
         '                               (ppp.idplanoprev = (select max(ppp1.idplanoprev) from partprevplan ppp1'                + #13 +
         '                                                   where ppp1.idpessoa = ppp.idpessoa'                                 + #13 +
         '                                                   and   ppp1.datacancelamento = (SELECT MAX(ppp2.datacancelamento)'   + #13 +
         '                                                                                  FROM partprevplan ppp2'              + #13 +
         '                                                                                  WHERE ppp2.idpessoa = ppp1.idpessoa)'+ #13 +
         '                                                   and   not exists (select 1 from partprevplan ppp2'                  + #13 +
         '                                                                     where ppp2.idpessoa = ppp1.idpessoa'              + #13 +
         '                                                                     and   ppp2.idsitplanoprev = 25))))))'             + #13 +}
//Ádler Souza - SOL N° 121503 KTN N°586687 - Fim

//Ádler Souza - SOL N° 140060 KTN N°873169
         '          AND ((ppp.idplanoprev = '                                           + #13 +
         '        (SELECT MAX(ppp2.idplanoprev) '                                      + #13 +
         '          FROM partprevplan ppp2 '                                           + #13 +
         '         WHERE ppp2.flgdesativado = 0 '                                      + #13 +
         '           AND ppp2.idpessoa = ppp.idpessoa) OR '                            + #13 +
         '        (PPP.FLGDESATIVADO = 1 AND NOT EXISTS '                              + #13 +
         '        (SELECT 1 '                                                          + #13 +
         '           FROM partprevplan ppp1 '                                          + #13 +
         '          WHERE ppp1.idpessoa = ppp.idpessoa '                               + #13 +
         '            AND ppp1.flgdesativado = 0) AND '                                + #13 +
         '        (ppp.idsitplanoprev = 25 OR '                                        + #13 +
         '        (ppp.idplanoprev = '                                                 + #13 +
         '        (SELECT MAX(ppp1.idplanoprev)'                                       + #13 +
         '             FROM partprevplan ppp1 '                                        + #13 +
         '            WHERE ppp1.idpessoa = ppp.idpessoa '                             + #13 +
         '              AND nvl(ppp1.datacancelamento, TRIM(SYSDATE)) = '              + #13 +
         '                  (SELECT nvl(MAX(ppp2.datacancelamento), TRIM(SYSDATE)) '   + #13 +
         '                     FROM partprevplan ppp2 '                                + #13 +
         '                    WHERE ppp2.idpessoa = ppp1.idpessoa) '                   + #13 +
         '              AND NOT EXISTS (SELECT 1 '                                     + #13 +
         '                     FROM partprevplan ppp2 '                                + #13 +
         '                    WHERE ppp2.idpessoa = ppp1.idpessoa '                    + #13 +
         '                      AND ppp2.idsitplanoprev = 25)))))) '                   + #13 +
//Fim - Ádler Souza - SOL N° 140060 KTN N°873169

         '           AND CON.IDPLANOCOB IS NULL)  '                     + #13 +
         '           OR  (PPP.IDPLANOPREV       = CON.IDPLANOCOB) '    + #13;


         if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.asInteger = 1) then
             sSQL := sSQL +
         '          AND CON.IDCONTRATOEMPTMO    = HISTMOVEMPTMO.IDCONTRATOEMPTMO '              + #13;

         sSQL := sSQL +
         '       ) ';

         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
       //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
       //qryAux.SQL.SaveToFile(Sistema.TempDir + 'EP-Envio-UpdateSitFormaPatro.txt');
         qryAux.SQL.SaveToFile(ftempregra + '\' + 'EP-Envio-UpdateSitFormaPatro.txt');
         qryAux.ExecSQL;
         // ----------------------------------------------------------------------------------------

         Application.ProcessMessages;

         // ----------------------------------------------------------------------------------------
         // Folha de Benefícios - AS, CA (pensionista)

         sSQL :=
         //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
         'UPDATE '                       + #13 +
         //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim
         '   HISTMOVEMPTMO '                                                                    + #13 +
         'SET '                                                                                 + #13 +
         '   HMETIPOFOLHA              = ''B'' '                                                + #13 +
         'WHERE '                                                                               + #13 +
         '       HMEFORMACOBRANCA      = ''F'' '                                                + #13 +
         '   AND FLGENVIO              = 0 '                                                    + #13 +
         '   AND FLGBAIXADO            = 0 '                                                    + #13 +
         '   AND HMEVLREFETIVO         IS NULL '                                                + #13 +
         '   AND HMEDATAEFETIVA        IS NULL '                                                + #13 +
         '   AND HMETIPOMOV            NOT IN (5, 8) '                                          + #13 +
         '   AND HMEANOCOBRANCA        = ' + FormatFloat('0000', DBspnAno.Value)                + #13 +
         '   AND HMEMESCOBRANCA        = ' + FormatFloat('00', cboMes.itemIndex + 1)            + #13;

         if length(trim(edtDataVenctoIni.Text)) > 0 then
            sSQL := sSQL +
         '   AND HMEDATAVENCTO        >= ' + OraData(edtDataVenctoIni.Date)                     + #13;

         if length(trim(edtDataVenctoFim.Text)) > 0 then
            sSQL := sSQL +
         '   AND HMEDATAVENCTO        <= ' + OraData(edtDataVenctoFim.Date)                     + #13;

         sSQL := sSQL +
         '   AND ( HMECENTRALIZA       = 1 OR HMEDESTACADO = 1 ) '                              + #13 +
         '   AND NVL(FLGESTORNADO, 0)  = 0 '                                                    + #13 +
         '   AND NVL(FLGABONADO, 0)    = 0 '                                                    + #13 +
         '   AND NVL(FLGQUITADO, 0)    = 0 '                                                    + #13;

         if (molContratoEmptmo.IDContrato > 0) then
             sSQL := sSQL +
         '   AND IDCONTRATOEMPTMO      = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)    + #13;

         // Renato Visoni SOL 105543 Kintana 472315
         if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then
             sSQL := sSQL +
//           '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
           '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

         if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then
             sSQL := sSQL +
//           '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
           '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO
         // Fim Renato Visoni


         sSQL := sSQL +
         '   AND IDCONTRATOEMPTMO      IN '                                                     + #13 +
         '       ( '                                                                            + #13 +
         '       SELECT '                                                                       + #13 +
         '          CON.IDCONTRATOEMPTMO '                                                      + #13 +
         '       FROM '                                                                         + #13 +
         '          CONTRATOEMPTMO  CON, '                                                      + #13 +
         '          ELEGPATRO       ELP, '                                                      + #13 +
         '          TIPOCONTREMPTMO TCE, '                                                      + #13 +
         '          PARTPREVPLAN    PPP, '                                                      + #13 +
         '          SITPART         SP,  '                                                      + #13 +
         '          SITFUNC         SF   '                                                      + #13 +
         '       WHERE '                                                                        + #13 +
         '              CON.FLGSITUACAO         NOT IN (''C'', ''Q'') '                         + #13 +

         //  Assistido ou Pensionista
         '-- Assistido ou Pensionista '                                                         + #13 +
         '          AND ( '                                                                     + #13 +
         '              ( SP.FLGINTERNO         = ''AS'' ) '                                    + #13 +
         '           OR ( SP.FLGINTERNO         = ''CA'' AND CON.IDPESSOA <> CON.IDBENEF ) '    + #13 +
         '              ) '                                                                     + #13 +
         '---------------------------------------------------------------------------------- '  + #13;

         if trim(DBcboTipoEmptmo.LookupValue) <> EmptyStr then
            sSQL := sSQL +
         '          AND TCE.IDTIPOEMPTMO        = ' + trim(DBcboTipoEmptmo.LookupValue)               + #13;

         if trim(DBcboTipoContrato.LookupValue) <> EmptyStr then
            sSQL := sSQL +
         '          AND CON.IDTIPOCONTREMPTMO   = ' + trim(DBcboTipoContrato.LookupValue)      + #13;

         sSQL := sSQL +
         '          AND ( '                                                                     + #13 +
         '              CON.IDPATRO             IN ( ' + molListaPatro.PegaPatro + ' ) '        + #13 +
         '           OR ELP.IDPESSJURCEDIDO     IN ( ' + molListaPatro.PegaPatro + ' ) '        + #13 +
         '              ) '                                                                     + #13 +
         '          AND CON.IDPLANOPREV         IN ( ' + molListaPlano.PegaPlano + ' ) '        + #13 +

         '          AND CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO '                       + #13 +
         '          AND CON.IDPESSOA            = ELP.IDPESSOA '                                + #13 +
         '          AND CON.IDPATRO             = ELP.IDPESSJUR '                               + #13 +
         '          AND CON.IDPESSOA            = PPP.IDPESSOA '                                + #13 +
         '          AND CON.IDPATRO             = PPP.IDPESSJUR '                               + #13 +
         '          AND PPP.IDSITPART           = SP.IDSITPART '                                + #13 +
         '          AND ELP.IDSITFUNC           = SF.IDSITFUNC '                                + #13 +
                //Pendência 26775 - 27/12/2007
         //'          AND PPP.FLGDESATIVADO       = 0 '                                           + #13;
         //'          AND ((PPP.FLGDESATIVADO     = 0 AND CON.IDPLANOCOB IS NULL) OR '            + #13 +
         //Ádler Souza - SOL N° 121503 KTN N°586687 - Início

{         '     AND ((PPP.FLGDESATIVADO  = 0'+ #13 +
         '     OR'+ #13 +
         '    (PPP.FLGDESATIVADO = 1 AND NOT EXISTS (SELECT 1 FROM partprevplan ppp1'              + #13 +
         '                                           WHERE ppp1.idpessoa = ppp.idpessoa'           + #13 +
         '                                             AND ppp1.flgdesativado = 0)'                + #13 +
         '                           AND (ppp.idsitplanoprev = 25'                                 + #13 +
         '                                OR'                                                      + #13 +
         '                               (ppp.idplanoprev = (select max(ppp1.idplanoprev) from partprevplan ppp1'                + #13 +
         '                                                   where ppp1.idpessoa = ppp.idpessoa'                                 + #13 +
         '                                                   and   ppp1.datacancelamento = (SELECT MAX(ppp2.datacancelamento)'   + #13 +
         '                                                                                  FROM partprevplan ppp2'              + #13 +
         '                                                                                  WHERE ppp2.idpessoa = ppp1.idpessoa)'+ #13 +
         '                                                   and   not exists (select 1 from partprevplan ppp2'                  + #13 +
         '                                                                     where ppp2.idpessoa = ppp1.idpessoa'              + #13 +
         '                                                                     and   ppp2.idsitplanoprev = 25))))))'             + #13 +}
         //Ádler Souza - SOL N° 121503 KTN N°586687 - Fim
         //Ádler Souza - SOL N° 140060 KTN N°873169
         '          AND ((ppp.idplanoprev = '                                           + #13 +
         '        (SELECT MAX(ppp2.idplanoprev) '                                      + #13 +
         '          FROM partprevplan ppp2 '                                           + #13 +
         '         WHERE ppp2.flgdesativado = 0 '                                      + #13 +
         '           AND ppp2.idpessoa = ppp.idpessoa) OR '                            + #13 +
         '        (PPP.FLGDESATIVADO = 1 AND NOT EXISTS '                              + #13 +
         '        (SELECT 1 '                                                          + #13 +
         '           FROM partprevplan ppp1 '                                          + #13 +
         '          WHERE ppp1.idpessoa = ppp.idpessoa '                               + #13 +
         '            AND ppp1.flgdesativado = 0) AND '                                + #13 +
         '        (ppp.idsitplanoprev = 25 OR '                                        + #13 +
         '        (ppp.idplanoprev = '                                                 + #13 +
         '        (SELECT MAX(ppp1.idplanoprev)'                                       + #13 +
         '             FROM partprevplan ppp1 '                                        + #13 +
         '            WHERE ppp1.idpessoa = ppp.idpessoa '                             + #13 +
         '              AND nvl(ppp1.datacancelamento, TRIM(SYSDATE)) = '              + #13 +
         '                  (SELECT nvl(MAX(ppp2.datacancelamento), TRIM(SYSDATE)) '   + #13 +
         '                     FROM partprevplan ppp2 '                                + #13 +
         '                    WHERE ppp2.idpessoa = ppp1.idpessoa) '                   + #13 +
         '              AND NOT EXISTS (SELECT 1 '                                     + #13 +
         '                     FROM partprevplan ppp2 '                                + #13 +
         '                    WHERE ppp2.idpessoa = ppp1.idpessoa '                    + #13 +
         '                      AND ppp2.idsitplanoprev = 25)))))) '                   + #13 +
         //Fim - Ádler Souza - SOL N° 140060 KTN N°873169
         '           AND CON.IDPLANOCOB IS NULL)  '                     + #13 +
         '           OR  (PPP.IDPLANOPREV       = CON.IDPLANOCOB) '     + #13 +
         //Fim Pendência 26775
         '       ) ';

         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
       //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
       //qryAux.SQL.SaveToFile(Sistema.TempDir + 'EP-Envio-UpdateSitFormaFolha.txt');
         qryAux.SQL.SaveToFile(ftempregra + '\' + 'EP-Envio-UpdateSitFormaFolha.txt');
         qryAux.ExecSQL;
       // ----------------------------------------------------------------------------------------

         Application.ProcessMessages;

      except
         on E:Exception do
         begin
            sMsgErro := E.Message;
            ShowMessage(sMsgErro);
            Result := False;
            Exit;
         end;
      end;

   finally
      qryAux.Free;

      EscondeEspera;
   end;
end;



function TfrmExecEnvio.AtualizaRecPag(var sMsgErro: String): Boolean;
var
   sSQL        : String;
   qryAux      : TwwQuery;
begin
   Result := True;

   MostraEspera('Atualizando Forma de Envio (recebimentos e devoluções)...');

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      try

         // ----------------------------------------------------------------------------------------
         // A Receber
         sSQL :=
         'UPDATE '                                                                              + #13 +
         '   HISTMOVEMPTMO '                                                                    + #13 +
         'SET '                                                                                 + #13 +
         '   HMERECPAG                 = ''R'' '                                                + #13 +
         'WHERE '                                                                               + #13 +
         '       HMEFORMACOBRANCA      = ''C'' '                                                + #13 +
         '   AND ( '                                                                            + #13 +
         '       (HMETIPOMOV           IN (1, 2, 3, 4, 6, 7) AND NVL(HMEVLRPREVISTO,0) >= 0) OR '+ #13 + //RENATO VISONI
         '       (NVL(HMETIPOMOV,0) = 0 AND NVL(HMEVLRPREVISTO,0) < 0) OR '                     + #13 +
         '       (HMETIPOMOV = 4 AND HMEVLRPREVISTO < 0  ) '                                    + #13 +  //RENATO VISONI   //Fanuel Junior SOL 164427 KINTANA 1411500
         '       ) '                                                                            + #13 +  //RENATO VISONI
         '   AND FLGENVIO              IS NOT NULL '                                            + #13 +  //RENATO VISONI
         '   AND FLGBAIXADO            IS NOT NULL '                                            + #13 +
         '   AND HMEVLREFETIVO         IS NULL '                                                + #13 +
         '   AND HMEDATAEFETIVA        IS NULL '                                                + #13 +
         '   AND HMETIPOMOV            NOT IN (5, 8) '                                          + #13 +
         '   AND HMEANOCOBRANCA        = ' + FormatFloat('0000', DBspnAno.Value)                + #13 +
         '   AND HMEMESCOBRANCA        = ' + FormatFloat('00', cboMes.itemIndex + 1)            + #13;

         if (length(trim(edtDataVenctoIni.Text)) > 0) then
             sSQL := sSQL +
         '   AND HMEDATAVENCTO        >= ' + OraData(edtDataVenctoIni.Date)                     + #13;

         if (length(trim(edtDataVenctoIni.Text)) > 0) then sSQL := sSQL +
         '   AND HMEDATAVENCTO        <= ' + OraData(edtDataVenctoFim.Date)                     + #13;

         sSQL := sSQL +
         '   AND ( NVL(HMECENTRALIZA,0)       = 1 OR NVL(HMEDESTACADO,0) = 1 ) '                + #13 + //RENATO VISONI
         '   AND NVL(FLGESTORNADO, 0)  = 0 '                                                    + #13 +
         '   AND NVL(FLGABONADO, 0)    = 0 '                                                    + #13 +
         '   AND NVL(FLGQUITADO, 0)    = 0 '                                                    + #13;

         if (molContratoEmptmo.IDContrato > 0) then
            sSQL := sSQL +
         '   AND IDCONTRATOEMPTMO      = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)    + #13;


         // Renato Visoni SOL 105543 Kintana 472315
         if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//           '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
           '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

         if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//           '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
           '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO
         // Fim Renato Visoni


         sSQL := sSQL +
         '   AND IDCONTRATOEMPTMO      IN '                                                     + #13 +
         '       ( '                                                                            + #13 +
         '       SELECT '                                                                       + #13 +
         '          CON.IDCONTRATOEMPTMO '                                                      + #13 +
         '       FROM '                                                                         + #13 +
         '          CONTRATOEMPTMO  CON, '                                                      + #13 +
         '          ELEGPATRO       ELP, '                                                      + #13 +
         '          TIPOCONTREMPTMO TCE, '                                                      + #13 +
         '          PARTPREVPLAN    PPP, '                                                      + #13 +
         '          SITPART         SP,  '                                                      + #13 +
         '          SITFUNC         SF   '                                                      + #13 +
         '       WHERE '                                                                        + #13 +
         '              CON.FLGSITUACAO         NOT IN (''C'', ''Q'') '                         + #13;

         if trim(DBcboTipoEmptmo.LookupValue) <> EmptyStr then sSQL := sSQL +
         '          AND TCE.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue               + #13;

         if trim(DBcboTipoContrato.LookupValue) <> EmptyStr then sSQL := sSQL +
         '          AND CON.IDTIPOCONTREMPTMO   = ' + trim(DBcboTipoContrato.LookupValue)       + #13;

         sSQL := sSQL +
         '          AND ( '                                                                     + #13 +
         '              CON.IDPATRO             IN ( ' + molListaPatro.PegaPatro + ' ) '        + #13 +
         '           OR ELP.IDPESSJURCEDIDO     IN ( ' + molListaPatro.PegaPatro + ' ) '        + #13 +
         '              ) '                                                                     + #13 +
         '          AND CON.IDPLANOPREV         IN ( ' + molListaPlano.PegaPlano + ' ) '        + #13 +
         '          AND CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO '                       + #13 +
         '          AND CON.IDPESSOA            = ELP.IDPESSOA '                                + #13 +
         '          AND CON.IDPATRO             = ELP.IDPESSJUR '                               + #13 +
         '          AND CON.IDPESSOA            = PPP.IDPESSOA '                                + #13 +
         '          AND CON.IDPATRO             = PPP.IDPESSJUR '                               + #13 +
         '          AND PPP.IDSITPART           = SP.IDSITPART '                                + #13 +
         '          AND ELP.IDSITFUNC           = SF.IDSITFUNC '                                + #13 +
         //Pendência 26775 - 27/12/2007
         //'          AND PPP.FLGDESATIVADO       = 0 '                                           + #13 +
         '          AND ((NVL(PPP.FLGDESATIVADO,0)     = 0 AND CON.IDPLANOCOB IS NULL) OR '            + #13 + //RENATO VISONI
         '               (PPP.IDPLANOPREV       = CON.IDPLANOCOB)) '                            + #13 +
         //Fim Pendência 26775
         '       ) ';

         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;

       //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
       //qryAux.SQL.SaveToFile(Sistema.TempDir + 'EP-Envio-UpdateRec.txt');
         qryAux.SQL.SaveToFile(ftempregra + '\' + 'EP-Envio-UpdateRec.txt');
         qryAux.ExecSQL;
         // ----------------------------------------------------------------------------------------
         
         Application.ProcessMessages;

         // ----------------------------------------------------------------------------------------
         // A Pagar
         sSQL :=
         'UPDATE '                                                                              + #13 +
         '   HISTMOVEMPTMO '                                                                    + #13 +
         'SET '                                                                                 + #13 +
         '   HMERECPAG                 = ''P'' '                                                + #13 +
         'WHERE '                                                                               + #13 +
         '       HMEFORMACOBRANCA      = ''C'' '                                                + #13 +
         '   AND ( '                                                                            + #13 +
         // Marchetti - Pendencia 22666
//       '       (HMETIPOMOV           IN (1, 2, 3, 4, 6, 7) AND HMEVLRPREVISTO < 0) OR '       + #13 +
         '       (HMETIPOMOV           IN (1, 2, 3, 6, 7) AND NVL(HMEVLRPREVISTO,0) < 0) OR '          + #13 +  //RENATO VISONI
         //Fanuel Junior SOL 164427 KINTANA 1411500
         // Fim Marchetti - Pendencia 22666
         '       (NVL(HMETIPOMOV,0)           = 0 AND NVL(HMEVLRPREVISTO,0) >= 0) '                        + #13 +  //RENATO VISONI

         //Fanuel Junior SOL 164427 KINTANA 1411500
         // Marchetti - Pendencia 22666
         //'     OR   (NVL(HMETIPOMOV,0)           = 4 AND NVL(HMEORIGEM,0) <> 7 AND NVL(HMEVLRPREVISTO,0) < 0) '     + #13 +  //RENATO VISONI
         // Fim Marchetti - Pendencia 22666
         '       ) '                                                                            + #13 +
         '   AND FLGENVIO              IS NOT NULL '                                                    + #13 + //RENATO VISONI
         '   AND FLGBAIXADO            IS NOT NULL '                                                    + #13 + //RENATO VISONI
         '   AND HMEVLREFETIVO         IS NULL '                                                + #13 +
         '   AND HMEDATAEFETIVA        IS NULL '                                                + #13 +
         '   AND HMETIPOMOV            NOT IN (5, 8) '                                          + #13 +
         '   AND HMEANOCOBRANCA        = ' + FormatFloat('0000', DBspnAno.Value)                + #13 +
         '   AND HMEMESCOBRANCA        = ' + FormatFloat('00', cboMes.itemIndex + 1)            + #13;

         if length(trim(edtDataVenctoIni.Text)) > 0 then sSQL := sSQL +
         '   AND HMEDATAVENCTO        >= ' + OraData(edtDataVenctoIni.Date)                     + #13;

         if length(trim(edtDataVenctoIni.Text)) > 0 then sSQL := sSQL +
         '   AND HMEDATAVENCTO        <= ' + OraData(edtDataVenctoFim.Date)                     + #13;

         sSQL := sSQL +
         '   AND ( NVL(HMECENTRALIZA,0)       = 1 OR NVL(HMEDESTACADO,0) = 1 ) '                              + #13 + //RENATO VISONI
         '   AND NVL(FLGESTORNADO, 0)  = 0 '                                                    + #13 +
         '   AND NVL(FLGABONADO, 0)    = 0 '                                                    + #13 +
         '   AND NVL(FLGQUITADO, 0)    = 0 '                                                    + #13;

         if (molContratoEmptmo.IDContrato > 0) then sSQL := sSQL +
         '   AND IDCONTRATOEMPTMO      = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)    + #13;

         // Renato Visoni SOL 105543 Kintana 472315
         if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//           '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
           '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

         if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//           '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
           '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO
         // Fim Renato Visoni


         sSQL := sSQL +
         '   AND IDCONTRATOEMPTMO      IN '                                                     + #13 +
         '       ( '                                                                            + #13 +
         '       SELECT '                                                                       + #13 +
         '          CON.IDCONTRATOEMPTMO '                                                      + #13 +
         '       FROM '                                                                         + #13 +
         '          CONTRATOEMPTMO  CON, '                                                      + #13 +
         '          ELEGPATRO       ELP, '                                                      + #13 +
         '          TIPOCONTREMPTMO TCE, '                                                      + #13 +
         '          PARTPREVPLAN    PPP, '                                                      + #13 +
         '          SITPART         SP,  '                                                      + #13 +
         '          SITFUNC         SF   '                                                      + #13 +
         '       WHERE '                                                                        + #13 +
         '              CON.FLGSITUACAO         NOT IN (''C'', ''Q'') '                         + #13;

         if TRIM(DBcboTipoEmptmo.LookupValue) <> EmptyStr then sSQL := sSQL +
         '          AND TCE.IDTIPOEMPTMO        = ' + TRIM(DBcboTipoEmptmo.LookupValue)         + #13;

         if TRIM(DBcboTipoContrato.LookupValue) <> EmptyStr then sSQL := sSQL +
         '          AND CON.IDTIPOCONTREMPTMO   = ' + DBcboTipoContrato.LookupValue             + #13;

         sSQL := sSQL +
         '          AND ( '                                                                     + #13 +
         '              CON.IDPATRO             IN ( ' + molListaPatro.PegaPatro + ' ) '        + #13 +
         '           OR ELP.IDPESSJURCEDIDO     IN ( ' + molListaPatro.PegaPatro + ' ) '        + #13 +
         '              ) '                                                                     + #13 +
         '          AND CON.IDPLANOPREV         IN ( ' + molListaPlano.PegaPlano + ' ) '        + #13 +

         '          AND CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO '                       + #13 +
         '          AND CON.IDPESSOA            = ELP.IDPESSOA '                                + #13 +
         '          AND CON.IDPATRO             = ELP.IDPESSJUR '                               + #13 +
         '          AND CON.IDPESSOA            = PPP.IDPESSOA '                                + #13 +
         '          AND CON.IDPATRO             = PPP.IDPESSJUR '                               + #13 +
         '          AND PPP.IDSITPART           = SP.IDSITPART '                                + #13 +
         '          AND ELP.IDSITFUNC           = SF.IDSITFUNC '                                + #13 +
         //Pendência 26775 - 27/12/2007
         //'          AND PPP.FLGDESATIVADO       = 0 '                                           + #13 +
         '          AND ((NVL(PPP.FLGDESATIVADO,0)     = 0 AND CON.IDPLANOCOB IS NULL) OR '            + #13 + //RENATO VISONI
         '               (PPP.IDPLANOPREV       = CON.IDPLANOCOB)) '                            + #13 +
         //Fim Pendência 26775
         '       ) ';

         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
       //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
         qryAux.SQL.SaveToFile(Sistema.TempDir + 'EP-Envio-UpdatePag.txt');
         qryAux.SQL.SaveToFile(ftempregra + '\' + 'EP-Envio-UpdatePag.txt');
         qryAux.ExecSQL;
         // ----------------------------------------------------------------------------------------

         Application.ProcessMessages;

      except
         on E:Exception do
         begin
            sMsgErro := E.Message;
            ShowMessage(sMsgErro);
            Result := False;
            Exit;
         end;
      end;

   finally
      qryAux.Free;
      EscondeEspera;
   end;
end;



function TfrmExecEnvio.AtualizaRubricas(var sMsgErro: String): Boolean;
var
   i            : Integer;
   qryAux       : TwwQuery;
   sSQL         : String;
   sRubrica     : String;
   sCondicao    : String;
begin
   Result := True;

   MostraEspera('Atualizando Rubricas para Envio...');

   (* Cria a Query Auxiliar *)
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      (* Serão 3 updates: NORMAL, ATRASO e DEVOLUÇÃO *)
      for i := 1 to 3 do
      begin
         case i of
            1: // NORMAL
            begin
               sRubrica  := 'N';
               sCondicao := '(LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, ''0000'')))) || (LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, ''00'')))) = ' + QuotedStr(PegaAnoMes);
            end;

            2: // ATRASO
            begin
               sRubrica  := 'A';
               sCondicao := '((LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, ''0000'')))) ||' +
                            ' (LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, ''00'')))) < ' + QuotedStr(PegaAnoMes) + ') ' +
                            'OR (H.HMETIPOMOV = 4)';
            end;

            3: // DEVOLUÇÃO
            begin
               sRubrica  := 'D';
               sCondicao := 'H.HMEVLRPREVISTO < 0';
            end;

         end;

         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.asInteger = 1 then
         begin
            //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
            sSQL := 'SELECT DISTINCT '                                                       + #13;
            //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
         end
         else
         begin
            //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
            sSQL := 'SELECT DISTINCT '                                  + #13;
            //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim
         end;

         sSQL := sSQL +
         '  H.IDITEMEMPTMO, '                                                                + #13 +
         '  C.IDTIPOCONTREMPTMO, '                                                           + #13 +
         '  C.IDCONTRATOEMPTMO, '                                                            + #13 +
         '  H.IDHISTMOVEMPTMO  '                                                             + #13 +

         'FROM '                                                                             + #13 +
         '  HISTMOVEMPTMO   H, '                                                             + #13 +
         '  CONTRATOEMPTMO  C, '                                                             + #13 +
         '  ELEGPATRO       ELP, '                                                           + #13 +
         '  TIPOCONTREMPTMO TC, '                                                            + #13 +
         '  TIPOEMPTMO      TE '                                                             + #13 +

         'WHERE '                                                                            + #13 +
         '      ( H.HMEANOCOBRANCA     = ' + NumeroIngles(DBspnAno.Value) + ' ) '            + #13 +
         '  AND ( H.HMEMESCOBRANCA     = ' + IntToStr(cboMes.ItemIndex + 1) + ' ) '          + #13 +
         '  AND ( H.HMEFORMACOBRANCA   = ''F'' ) '                                           + #13 +

         '  AND ( (H.HMECENTRALIZA     = 1) OR (H.HMEDESTACADO = 1) ) '                      + #13 +
         '  AND ( (H.FLGDIVERGPEND     = 0) OR (H.FLGDIVERGPEND IS NULL) ) '                 + #13;

         if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
         '  AND ( TC.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue + ' ) ';

         if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
         '  AND ( C.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue + ' ) '           + #13 +
         '  AND ( TC.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '           + #13;

         if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
         '  AND ( C.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + ' ) '  + #13;

         // Renato Visoni SOL 105543 Kintana 472315
         if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//           '  AND C.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
           '  AND C.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

         if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//           '  AND C.IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
           '  AND C.IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO
         // Fim Renato Visoni

         sSQL := sSQL +
         '  AND ( '                                                                          + #13 +
         '      C.IDPATRO              IN ( ' + molListaPatro.PegaPatro + ' ) '              + #13 +
         '   OR ELP.IDPESSJURCEDIDO    IN ( ' + molListaPatro.PegaPatro + ' ) '              + #13 +
         '      ) '                                                                          + #13 +
         '  AND C.IDPLANOPREV          IN ( ' + molListaPlano.PegaPlano + ' ) '              + #13 +
         '  AND ( TE.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa) + ' ) '             + #13 +

         '  AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO ) '                              + #13 +
         '  AND ( C.IDPESSOA           = ELP.IDPESSOA ) '                                    + #13 +
         '  AND ( C.IDPATRO            = ELP.IDPESSJUR ) '                                   + #13 +
         '  AND ( C.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO ) '                            + #13 +
         '  AND ( TC.IDTIPOEMPTMO      = TE.IDTIPOEMPTMO ) '                                 + #13 +
         '  AND ( ' + sCondicao + ' ) '                                                      + #13 +

         'ORDER BY C.IDTIPOCONTREMPTMO, H.IDITEMEMPTMO';

         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;

       //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
       //qryAux.SQL.SaveToFile(Sistema.TempDir + 'EP-Envio-AtualizaRubricas' + IntToStr(i) + '.txt');
         qryAux.SQL.SaveToFile(ftempregra + '\' + 'EP-Envio-AtualizaRubricas' + IntToStr(i) + '.txt');

         try
            qryAux.Open;
            qryAux.First;

            while not(qryAux.EOF) do
            begin
//               if dtmEmptmo.qryparamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
//               begin

(*
    Foi verificado que para cada item na arvore, o sistema estava dando update
    na rubrica, não levando em consideração o Tipo de Contrato associado.

*)
               with qryUpdateRubricaFUNCEF do
               begin
                  LimpaParametros(qryUpdateRubricaFUNCEF);
                  ParamByName('PRUBRICA').AsString             := sRubrica;
                  ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryAux.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
                  ParamByName('PIDITEMEMPTMO').AsInteger       := qryAux.FieldByName('IDITEMEMPTMO').AsInteger;
                  ParamByName('PIDHISTMOVEMPTMO').AsFloat      := qryAux.FieldByName('IDHISTMOVEMPTMO').AsFloat;

                  ExecSQL;
               end;

//               end
//               else
//               begin
//                  with qryUpdateRubrica do
//                  begin

//                     LimpaParametros(qryUpdateRubrica);

//                     ParamByName('PRUBRICA').AsString             := sRubrica;
//                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryAux.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
//                     ParamByName('PIDITEMEMPTMO').AsInteger       := qryAux.FieldByName('IDITEMEMPTMO').AsInteger;
//                     ParamByName('PHMEANOCOBRANCA').AsInteger     := Trunc(DBspnAno.Value);
//                     ParamByName('PHMEMESCOBRANCA').AsInteger     := (cboMes.ItemIndex + 1);
//                     ParamByName('PANOMES').AsString              := PegaAnoMes;

//                     if molContratoEmptmo.IDContrato > 0 then ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;

//                     ExecSQL;
//                  end;
//               end;
               qryAux.Next;
            end;

         except
            on E:Exception do
            begin
               sMsgErro := E.Message;
               ShowMessage(sMsgErro);
               Result := False;
               Exit;
            end;
         end;

      end; (* for *)

   finally
      EscondeEspera;
      qryAux.Close;
      qryAux.Free;
   end;
end;

function TfrmExecEnvio.MontaSelectCAPCAR(const sRecPag: String): String;
var
   sSQL        : String;
   sSeguradora : String;
begin
   sSeguradora := FormatFloat('#0', dtmEmptmo.qryParamEmptmoIDSEGURADORA.AsFloat);

   sSQL :=
//   'SELECT /*+ RULE */ '                                                                     + #13 +
   'SELECT '                                                                                 + #13 +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                         + #13 +
   ' (SELECT ITEDESCRICAO FROM ITEMEMPTMO ITE WHERE  ITE.IDITEMEMPTMO  = HME.IDITEMEMPTMO AND ROWNUM <= 1) AS ITEDESCRICAO, '+ #13 +
   '  '' '' AS FLGTIPODESC,  '+ #13 +  //SOL 147574 KINTANA 1022240
   '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, '                                          + #13 +
   // Marchetti - Pendencia 22666
//   '  ABS(NVL(HME.HMEVLRPREVISTO, 0)) AS HMEVLRPREVISTO, '                                   + #13 +

   // Marchetti - pendencia 26303
//   '  DECODE(HMERECPAG,''P'',ABS(NVL(HME.HMEVLRPREVISTO, 0)),NVL(HME.HMEVLRPREVISTO, 0)) AS HMEVLRPREVISTO, '  + #13 +
   '  DECODE(HMERECPAG,''P'',ABS(NVL(HME.HMEVLRPREVISTO, 0)), '                                       + #13 +
   '                       DECODE(HME.HMETIPOMOV,0,ABS(NVL(HME.HMEVLRPREVISTO, 0)), '                 + #13 +
   '                                               NVL(HME.HMEVLRPREVISTO, 0))) AS HMEVLRPREVISTO, '  + #13 +
   // Fim Marchetti - pendencia 26303

   // Fim Marchetti - Pendencia 22666
   '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                               + #13 +
   '  HME.HMEPARCELA, NVL(HME.HMENUMPARCELAS, 0) AS HMENUMPARCELAS, HME.HMESALDODEV, '       + #13 +
   '  HME.HMETIPOMOV, '                                                                      + #13 +

   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                               + #13 +
   '  || ''/'' || '                                                                          + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '       + #13 +

//   *****************************************************************************************
  //MECHER AQUI PARA COLOCAR  '  DECODE(HME.IDCBANCARIA,NULL,CON.IDCBANCARIADEB,HME.IDCBANCARIA) AS IDCBANCARIADEB,,
//   '  DECODE(ITC.CONTABAIXA,NULL,ITC.CONTARESULTADO,ITC.CONTABAIXA) AS CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, '                                 + #13 +

    '  DECODE(CON.FLGPERDAEFETIVA, 1,ITC.CONTARESULTADO, ITC.CONTABAIXA) AS CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, '                                 + #13 +
//   *****************************************************************************************

   //edilaine - SIG62639 - inicio
   {// André Pontes - 08/07/2004
   //Pendência 23251 - 09/10/2006 - Alberto
   //'  CON.IDPLANOPREV, NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS IDPLANOORIGEM, '           + #13;
   '  CON.IDPLANOPREV, NVL(MIG.IDPLANOCONTATU, CON.IDPLANOPREV) AS IDPLANOORIGEM, '          + #13;
   //Fim Pendência 23251
   // FIM André Pontes - 08/07/2004
   } //comentado

   '   CON.IDPLANOPREV, '         + #13 +
   //Luiz Carlos - SIG67098 - Inicio
   '   NVL(                                                                                '+ #13 +
   '           (SELECT PI.IDPLANPREVCONTAB FROM PERFILINVEST PI                            '+ #13 +
   '           WHERE PI.IDPERFILINVEST = CON.IDPERFILINVEST),                              '+ #13 +
   //Luiz Carlos - SIG67098 - Fim
   '        CASE WHEN EXISTS (SELECT 1                                                     '+ #13 +
   '                       FROM TRANSPERFILINVEST T                                        '+ #13 +
   '                      WHERE T.MESANOCOMPET = TO_CHAR(TO_DATE(''' + DateToStr(dDataHoje) + ''',''DD/MM/YYYY''),''YYYY/MM'') AND '+ #13 +
   '                            T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) THEN            '+ #13 +
   '          (SELECT MAX(PI.IDPLANPREVCONTAB)                                             '+ #13 +
   '             FROM CM.TRANSPERFILINVEST T                                               '+ #13 +
   '                  JOIN PERFILINVEST PI ON T.IDPERFILINVESTANT = PI.IDPERFILINVEST      '+ #13 +
   '            WHERE T.MESANOCOMPET = TO_CHAR(TO_DATE(''' + DateToStr(dDataHoje) + ''',''DD/MM/YYYY''),''YYYY/MM'') AND '+ #13 +
   '                  T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO)                           '+ #13 +
   '        ELSE                                                                           '+ #13 +
   '          (SELECT MAX(PI.IDPLANPREVCONTAB)                                             '+ #13 +
   '             FROM PERFILINVXELEG PIE                                                   '+ #13 +
   '                  JOIN PERFILINVEST PI ON PIE.IDPERFILINVEST = PI.IDPERFILINVEST       '+ #13 +
   '            WHERE PIE.IDPESSOA = CON.IDPESSOA AND                                      '+ #13 +
   '                  PIE.IDPLANOPREV = CON.IDPLANOPREV AND                                '+ #13 +
   '                  PIE.IDPESSJUR = CON.IDPATRO AND                                      '+ #13 +
   '                  PIE.DTFIM IS NULL)                                                   '+ #13 +
   //Luiz Carlos - SIG67098 - Inicio
  //'      END, -1) AS IDPLANOORIGEM,                                                       '+ #13;
  '      END) AS IDPLANOORIGEM,                                                            '+ #13;
  //Luiz Carlos - SIG67098 - Fim
  //edilaine - SIG62639 - fim

   // André Pontes - 16/03/2005 - Quitação por Morte
   if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and not(dtmEmptmo.qryParamEmptmoIDSEGURADORA.isNULL) then
   begin
      sSQL := sSQL +
   '  DECODE(HME.HMEORIGEM, 8, ' + sSeguradora + ', CON.IDBENEF) AS IDBENEF, '               + #13 +
   '  DECODE(HME.HMEORIGEM, 8, ' + sSeguradora + ', CON.IDPESSOA) AS IDPESSOA, '             + #13 +
   //Pendência 23608 - 25/10/2006 - Marchetti
//   '  DECODE(HME.HMEORIGEM, 8, NULL, DECODE(HME.IDCBANCARIA,NULL,CON.IDCBANCARIADEB,HME.IDCBANCARIA)) AS IDCBANCARIADEB, ' + #13 +
//   '  DECODE(HME.HMEORIGEM, 8, NULL, CON.IDCBANCARIA) AS IDCBANCARIA, '                + #13;
   '  DECODE(HME.HMEORIGEM, 8, -1, DECODE(HME.IDCBANCARIA,NULL,CON.IDCBANCARIADEB,HME.IDCBANCARIA)) AS IDCBANCARIADEB, ' + #13 +
   '  DECODE(HME.HMEORIGEM, 8, -1, CON.IDCBANCARIA) AS IDCBANCARIA, '                + #13;
   //Fim Pendência 23608 
   end
   else
   begin
      sSQL := sSQL +
   '  CON.IDBENEF, CON.IDPESSOA, DECODE(HME.IDCBANCARIA,NULL,CON.IDCBANCARIADEB,HME.IDCBANCARIA) AS IDCBANCARIADEB, CON.IDCBANCARIA, ' + #13;
   end;
   // FIM André Pontes - 16/03/2005 - Quitação por Morte

   sSQL := sSQL +
   '  CON.IDPATRO, CON.MATRICULA_TIT AS MATRICULA, '                                         + #13 +
   '  CON.CODFORMAPAG, CON.PORTFORMAPAG,  '                                                  + #13 +
   '  CON.IDTIPOCONTREMPTMO, ITE.ITEDESCRICAO, CON.FLGINTERNO, '                             + #13 +
//   '  TSE.FLGATUALSALDOENV, TSE.IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO '                     + #13 +
   '  0 AS FLGATUALSALDOENV, -1 AS IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO, '                 + #13 +
   '  ITE.FLGABATENEGATIVO,                                                '                 + #13 ;  //Helen SIG101022
   // Marchetti - Pendencia 21225
   if trim(DBcboFormaRecebimento.LookupValue) <> EmptyStr then
        sSQL := sSQL + DBcboFormaRecebimento.LookupValue + ' AS PORTFORMAREC '               + #13
   else sSQL := sSQL + 'CON.PORTFORMAREC '                                                  + #13;
   // Fim Marchetti - Pendencia 21225

   sSQL := sSQL +
   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +
   //Pendência 23251 - 09/10/2006 - Alberto
   '  VWMIGRACONTRATOEP MIG, '                                                                 + #13 +
   //Fim Pendência 23251
   '  ( '                                                                                    + #13 +
   '  SELECT '                                                                               + #13 +
   '     CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CON.IDCONTRQUITACAO, '     + #13 +
   '     CON.IDVERBA,               CON.FLGSITUACAO, '                                       + #13 +
   '     CON.NUMPARCELAS            AS PRAZO, '                                              + #13 +
   '     CON.VLRCONTRATO,           CON.VLRPARCELA,               CON.TXJUROS, '             + #13 +
   '     TEP.IDEMPRESAPROP, '                                                                + #13 +

   // André Pontes - 08/07/2004
   '     CON.IDPLANOPREV, NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS IDPLANOORIGEM, '        + #13 +
   // FIM André Pontes - 08/07/2004

   '     CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO, '                                      + #13 +
   '     TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO, '                                    + #13 +
   '     CON.IDPESSOA,              CON.IDBENEF, '                                           + #13 +
   '     CON.MOECODIGO,             CON.IDCBANCARIADEB, '                                    + #13 +

   '     CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '             + #13 +

   '     DECODE(DEP.MATRICULA, NULL, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA_TIT, '       + #13 +

   '     CON.FLGSUSPENSAOAUTO,      CON.IDTIPOSUSPEMPTMO, '                                  + #13 +

   '     PPP.INSCRICAONUMERO, '                                                              + #13 +
   '     NVL(PPP.SALPARTICIPACAO, 0)   AS SALPARTICIPACAO, '                                 + #13 +
   '     NVL(PPP.SALMANTIDO, 0)        AS SALMANTIDO, '                                      + #13 +
   '     NVL(PPP.SALAUXDOENCA, 0)      AS SALAUXDOENCA, '                                    + #13 +

   '     SIT.IDSITPART,             SIT.FLGINTERNO, '                                        + #13 +
   '     SIT.DESCRICAO                 AS SIT_TITULAR, '                                     + #13 +
   '     CON.IDPATRO, CON.FLGPERDAEFETIVA, '                                                 + #13 +
   '     DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SITDESCRICAO ' + #13 +
   //Luiz Carlos - SIG67098 - Inicio
   '     ,CON.IDPERFILINVEST '                                                               + #13 +
   //Luiz Carlos - SIG67098 - Fim
   '  FROM '                                                                                 + #13 +
   '     CONTRATOEMPTMO  CON, '                                                              + #13 +
   '     PARTPREVPLAN    PPP, '                                                              + #13 +
   '     ELEGPATRO       ELP, '                                                              + #13 +
   '     DEPENTIT        DEP, '                                                              + #13 +
   '     PATRO           PTR, '                                                              + #13 +
   '     TIPOCONTREMPTMO TCE, '                                                              + #13 +
   '     TIPOEMPTMO      TEP, '                                                              + #13 +
   '     SITPART         SIT, '                                                              + #13 +
   '     SITPLANOPREV    SPP  '                                                              + #13 +

   '  WHERE '                                                                                + #13 +
   '         TEP.IDEMPRESAPROP     = ' + FormatFloat('#0', Sistema.IDEmpresa)                + #13 +
   '     AND CON.IDPATRO           = PTR.IDPESSOA '                                          + #13 +
   '     AND CON.IDPESSOA          = ELP.IDPESSOA '                                          + #13 +
   '     AND CON.IDPESSOA          = PPP.IDPESSOA '                                          + #13 +
   '     AND CON.IDPESSOA          = DEP.IDTITULAR '                                         + #13 +
   '     AND CON.IDBENEF           = DEP.IDPESSOA '                                          + #13 +
   '     AND PTR.IDPESSOA          = ELP.IDPESSJUR '                                         + #13 +
   '     AND PTR.IDPESSOA          = PPP.IDPESSJUR '                                         + #13;

// Esse join não cabe por causa da questão dos beneficiários migrados na FUNCEF
// Ademais, o FLGDESATIVADO da PartPrevPlan deve definir um e somente um registro
//   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1 then sSQL := sSQL +
//   '     AND con.IDPLANOPREV       = PPP.IDPLANOPREV '                                       + #13;

   sSQL := sSQL +
   '     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                 + #13 +
   '     AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                      + #13 +
   '     AND PPP.IDSITPART         = SIT.IDSITPART '                                         + #13 +
   '     AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '                                    + #13 +
//Ádler Souza - SOL N° 121503 KTN N°586687 - Início
//   '     AND PPP.FLGDESATIVADO     = 0 '                                                     + #13 +
{   '     AND (PPP.FLGDESATIVADO  = 0'+ #13 +
   '     OR'+ #13 +
   '    (PPP.FLGDESATIVADO = 1 AND NOT EXISTS (SELECT 1 FROM partprevplan ppp1'              + #13 +
   '                                           WHERE ppp1.idpessoa = ppp.idpessoa'           + #13 +
   '                                             AND ppp1.flgdesativado = 0)'                + #13 +
   '                           AND (ppp.idsitplanoprev = 25'                                 + #13 +
   '                                OR'                                                      + #13 +
   '                               (ppp.idplanoprev = (select max(ppp1.idplanoprev) from partprevplan ppp1'                + #13 +
   '                                                   where ppp1.idpessoa = ppp.idpessoa'                                 + #13 +
   '                                                   and   ppp1.datacancelamento = (SELECT MAX(ppp2.datacancelamento)'   + #13 +
   '                                                                                  FROM partprevplan ppp2'              + #13 +
   '                                                                                  WHERE ppp2.idpessoa = ppp1.idpessoa)'+ #13 +
   '                                                   and   not exists (select 1 from partprevplan ppp2'                  + #13 +
   '                                                                     where ppp2.idpessoa = ppp1.idpessoa'              + #13 +
   '                                                                     and   ppp2.idsitplanoprev = 25))))))'             + #13 +}
//Ádler Souza - SOL N° 121503 KTN N°586687 - Fim
//Ádler Souza - SOL N° 140060 KTN N°873169
   '          AND (ppp.idplanoprev = '                                           + #13 +
   '        (SELECT MAX(ppp2.idplanoprev) '                                      + #13 +
   '          FROM partprevplan ppp2 '                                           + #13 +
   '         WHERE ppp2.flgdesativado = 0 '                                      + #13 +
   '           AND ppp2.idpessoa = ppp.idpessoa) OR '                            + #13 +
   '        (PPP.FLGDESATIVADO = 1 AND NOT EXISTS '                              + #13 +
   '        (SELECT 1 '                                                          + #13 +
   '           FROM partprevplan ppp1 '                                          + #13 +
   '          WHERE ppp1.idpessoa = ppp.idpessoa '                               + #13 +
   '            AND ppp1.flgdesativado = 0) AND '                                + #13 +
   '        (ppp.idsitplanoprev = 25 OR '                                        + #13 +
   '        (ppp.idplanoprev = '                                                 + #13 +
   '        (SELECT MAX(ppp1.idplanoprev)'                                       + #13 +
   '             FROM partprevplan ppp1 '                                        + #13 +
   '            WHERE ppp1.idpessoa = ppp.idpessoa '                             + #13 +
   '              AND nvl(ppp1.datacancelamento, TRIM(SYSDATE)) = '              + #13 +
   '                  (SELECT nvl(MAX(ppp2.datacancelamento), TRIM(SYSDATE)) '   + #13 +
   '                     FROM partprevplan ppp2 '                                + #13 +
   '                    WHERE ppp2.idpessoa = ppp1.idpessoa) '                   + #13 +
   '              AND NOT EXISTS (SELECT 1 '                                     + #13 +
   '                     FROM partprevplan ppp2 '                                + #13 +
   '                    WHERE ppp2.idpessoa = ppp1.idpessoa '                    + #13 +
   '                      AND ppp2.idsitplanoprev = 25)))))) '                   + #13 +
//Fim - Ádler Souza - SOL N° 140060 KTN N°873169
   '  ) CON, '                                                                   + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                     + #13 +
   '  ITEMEMPTMO      ITE,  '                                                    + #13 +

   // SOL 117973 Daniel Begnami
   '  TIPOSUSPEMPTMO SUSP '                                                      + #13;
   // FIM

//   '  TIPOSUSPEMPTMO  TSE  '                                                     + #13;

   sSQL := sSQL + MontaWhereCAPCAR(sRecPag);

   //Pendência 23251 - 09/10/2006 - Alberto
   sSQL := sSQL +
   '  AND MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '                                      + #13 +
   '  AND MIG.DATAMIGRA        = (select max(DATAMIGRA) '                                    + #13 +
   '                              from   VWMIGRACONTRATOEP '                                 + #13 +
   '                              where  IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '           + #13 +
   //Pendência 27490 - 28/02/2008
   //'                              and    DATAMIGRA <= HME.HMEDATAPREVISTA) '                 + #13;
   '                              and    DATAMIGRA <= HME.HMEDATAVENCTO) '                   + #13;
   //Fim Pendência 27490
   //Fim Pendência 23251

   sSQL := sSQL +
   'ORDER BY '                                                                               + #13 +
   '   CON.IDCONTRATOEMPTMO, HME.HMEPARCELA, HME.HMEDATAVENCTO ';

   Result := sSQL;
end;



function TfrmExecEnvio.MontaSelectFolha(const iPatro: Integer): String;
var
   sSQL : String;
begin
//   sSQL :=
//   'SELECT /*+ RULE */ '                                                                     + #13 +

   if (dtmEmptmo.qryparamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and
      (molContratoEmptmo.IDContrato <= 0) then
   begin
      sSQL :=
   //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Início
   'SELECT '                                 + #13;
   //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Fim
   end
   else
   begin
      sSQL :=
   'SELECT '                                                                                 + #13;
   end;

   if (dtmEmptmo.qryparamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
   begin
      sSQL := sSQL +
   '   NVL(HME.HMEPARCELAALT, HME.HMEPARCELA) AS HMEPARCELA, '                               + #13;
   end
   else
   begin
      sSQL := sSQL +
   '   HME.HMEPARCELA, '                                                                     + #13;
   end;
//ALEX
   sSQL := sSQL +
   '   HME.IDCONTRATOEMPTMO, HME.IDHISTMOVEMPTMO, '                                          + #13 +
   '   NVL(HME.HMENUMPARCELAS, 0) AS HMENUMPARCELAS, '                                       + #13 +
   '   HME.HMEVLRPREVISTO, HME.HMERECPAG , '                                                 + #13 +
   '   HME.HMEFORMACOBRANCA, HME.HMETIPOFOLHA, HME.HMETIPOMOV, '                             + #13 +
   '  (SELECT ITEDESCRICAO FROM ITEMEMPTMO ITE WHERE  ITE.IDITEMEMPTMO  = HME.IDITEMEMPTMO AND ROWNUM <= 1) AS ITEDESCRICAO, '+ #13 +
   '   ''Normal'' AS FLGTIPODESC,  '+ #13 +
   '   HME.IDRUBRICA, HME.IDITEMEMPTMO, HME.HMESALDODEV, '                                   + #13 +

   '   (LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, ''0000'')))) '                                + #13 +
   '   || '                                                                                  + #13 +
   '   (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, ''00'')))) AS ANOMESCOMPETENCIA, '            + #13 +
   '   CON.IDPATRO, '                                                                        + #13 +
   '   CON.IDEMPRESAPROP, CON.IDTIPOCONTREMPTMO, CON.IDPESSOA, CON.IDBENEF, '                + #13 +
   
// Marchetti - 12/08/2003
//   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
//      sSQL := sSQL +
//   else
//      sSQL := sSQL +
//      '   CON.IDPATRO, '                                                                     + #13;

//   sSQL := sSQL +

   // André Pontes - 08/07/2004
   //Pendência 23251 - 09/10/2006 - Alberto
   //'   CON.IDPLANOPREV, NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS IDPLANOORIGEM, '          + #13 +
   '   CON.IDPLANOPREV, NVL(MIG.IDPLANOCONTATU, CON.IDPLANOPREV) AS IDPLANOORIGEM, '         + #13 +
   //Fim Pendência 23251
   // FIM André Pontes - 08/07/2004

   '   ITC.ITCPRIORIDADE, ITC.TIPCODIGO, ITC.PLANO, ITC.ITCTRATASALDODEV, '                  + #13 +
   '   CON.INSCRICAONUMERO, CON.MATRICULA_TIT AS MATRICULA, CON.FLGINTERNO, '                + #13 +
//   '   TSE.FLGATUALSALDOENV, TSE.IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO  '                   + #13 +
   '  0 AS FLGATUALSALDOENV, -1 AS IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO, '                  + #13 +
   '  ITE.FLGABATENEGATIVO,                                                '                  + #13 +  //edilaine SIG101022
   //Vinicius Maciel - SOL 145571 Kintana 975201
   ' HME.HMEDATAVENCTO ' + #13 +
   //Vinicius Maciel - SOL 145571 Kintana 975201 - FIM

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +
// Marchetti - 12/08/2003

//   '  ELEGPATRO ELP, '                                                                       + #13 +
   //Pendência 23251 - 09/10/2006 - Alberto
   '  VWMIGRACONTRATOEP MIG, '                                                               + #13 +
   //Fim Pendência 23251
   '  ( '                                                                                    + #13 +
//   '  SELECT /*+ RULE */ '                                                                   + #13 +
   '  SELECT '                                                                               + #13 +
   '     CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CON.IDCONTRQUITACAO, '     + #13 +
   '     CON.IDVERBA,               CON.FLGSITUACAO, '                                       + #13 +
   '     CON.NUMPARCELAS               AS PRAZO, '                                           + #13 +
   '     CON.VLRCONTRATO,           CON.VLRPARCELA,               CON.TXJUROS, '             + #13 +
   '     DECODE(ELP.IDPESSJURCEDIDO, NULL, CON.IDPATRO, ELP.IDPESSJURCEDIDO) AS IDPATRO, '   + #13 +
   '     TEP.IDEMPRESAPROP, '                                                                + #13 +

   // André Pontes - 08/07/2004
   '     CON.IDPLANOPREV, NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS IDPLANOORIGEM, '        + #13 +
   // FIM André Pontes - 08/07/2004

   '     CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO, '                                      + #13 +
   '     TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO, '                                    + #13 +
   '     CON.IDPESSOA,              CON.IDBENEF,                  CON.IDCBANCARIA, '         + #13 +
   '     CON.MOECODIGO, CON.IDCBANCARIADEB, '                                                + #13 +

   '     DECODE(DEP.MATRICULA, NULL, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA_TIT, '       + #13 +

   '     CON.FLGSUSPENSAOAUTO,      CON.IDTIPOSUSPEMPTMO, '                                  + #13 +

   '     PPP.INSCRICAONUMERO, '                                                              + #13 +
   '     NVL(PPP.SALPARTICIPACAO, 0)   AS SALPARTICIPACAO, '                                 + #13 +
   '     NVL(PPP.SALMANTIDO, 0)        AS SALMANTIDO, '                                      + #13 +
   '     NVL(PPP.SALAUXDOENCA, 0)      AS SALAUXDOENCA, '                                    + #13 +

   '     SIT.IDSITPART,             SIT.FLGINTERNO, '                                        + #13 +
   '     SIT.DESCRICAO              AS SIT_TITULAR, '                                        + #13 +
   '     DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SITDESCRICAO ' + #13 +

   '  FROM '                                                                                 + #13 +
   '     CONTRATOEMPTMO  CON, '                                                              + #13 +
   '     PARTPREVPLAN    PPP, '                                                              + #13 +
   '     ELEGPATRO       ELP, '                                                              + #13 +
   '     DEPENTIT        DEP, '                                                              + #13 +
   '     PATRO           PTR, '                                                              + #13 +
   '     TIPOCONTREMPTMO TCE, '                                                              + #13 +
   '     TIPOEMPTMO      TEP, '                                                              + #13 +
   '     SITPART         SIT, '                                                              + #13 +
   '     SITPLANOPREV    SPP  '                                                              + #13 +

   '  WHERE '                                                                                + #13 +
   '         TEP.IDEMPRESAPROP     = ' + FormatFloat('#0', Sistema.IDEmpresa)                + #13 +
   '     AND CON.IDPATRO           = PTR.IDPESSOA '                                          + #13 +
   '     AND CON.IDPATRO           = PTR.IDPESSOA '                                          + #13 +    //??
   '     AND CON.IDPESSOA          = ELP.IDPESSOA '                                          + #13 +
   '     AND CON.IDPESSOA          = PPP.IDPESSOA '                                          + #13 +
   '     AND CON.IDPESSOA          = DEP.IDTITULAR '                                         + #13 +
   '     AND CON.IDBENEF           = DEP.IDPESSOA '                                          + #13 +
   '     AND PTR.IDPESSOA          = ELP.IDPESSJUR '                                         + #13 +
   '     AND CON.IDPATRO           = PPP.IDPESSJUR '                                         + #13;

// Esse join não cabe por causa da questão dos beneficiários migrados na FUNCEF
// Ademais, o FLGDESATIVADO da PartPrevPlan deve definir um e somente um registro
//   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1 then sSQL := sSQL +
//   '     AND CON.IDPLANOPREV       = PPP.IDPLANOPREV '                                       + #13;

   sSQL := sSQL +
   '     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                 + #13 +
   '     AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                      + #13 +
   '     AND PPP.IDSITPART         = SIT.IDSITPART '                                         + #13 +
   '     AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '                                    + #13 +
//Ádler Souza - SOL N° 121503 KTN N°586687 - Início
//   '     AND PPP.FLGDESATIVADO     = 0 '                                                     + #13 +
{   '     AND (PPP.FLGDESATIVADO  = 0'+ #13 +
   '     OR'+ #13 +
   '    (PPP.FLGDESATIVADO = 1 AND NOT EXISTS (SELECT 1 FROM partprevplan ppp1'              + #13 +
   '                                           WHERE ppp1.idpessoa = ppp.idpessoa'           + #13 +
   '                                             AND ppp1.flgdesativado = 0)'                + #13 +
   '                           AND (ppp.idsitplanoprev = 25'                                 + #13 +
   '                                OR'                                                      + #13 +
   '                               (ppp.idplanoprev = (select max(ppp1.idplanoprev) from partprevplan ppp1'                + #13 +
   '                                                   where ppp1.idpessoa = ppp.idpessoa'                                 + #13 +
   '                                                   and   ppp1.datacancelamento = (SELECT MAX(ppp2.datacancelamento)'   + #13 +
   '                                                                                  FROM partprevplan ppp2'              + #13 +
   '                                                                                  WHERE ppp2.idpessoa = ppp1.idpessoa)'+ #13 +
   '                                                   and   not exists (select 1 from partprevplan ppp2'                  + #13 +
   '                                                                     where ppp2.idpessoa = ppp1.idpessoa'              + #13 +
   '                                                                     and   ppp2.idsitplanoprev = 25))))))'             + #13 +}
//Ádler Souza - SOL N° 121503 KTN N°586687 - Fim

//Ádler Souza - SOL N° 140060 KTN N°873169
   '     AND (ppp.idplanoprev ='                                                            + #13 +
   '        (SELECT MAX(ppp2.idplanoprev)'                                                  + #13 +
   '            FROM partprevplan ppp2'                                                     + #13 +
   '           WHERE ppp2.flgdesativado = 0'                                                + #13 +
   '             AND ppp2.idpessoa = ppp.idpessoa) OR'                                      + #13 +
   '        (PPP.FLGDESATIVADO = 1 AND NOT EXISTS'                                          + #13 +
   '         (SELECT 1'                                                                     + #13 +
   '             FROM partprevplan ppp1'                                                    + #13 +
   '            WHERE ppp1.idpessoa = ppp.idpessoa'                                         + #13 +
   '              AND ppp1.flgdesativado = 0) AND'                                          + #13 +
   '         (ppp.idsitplanoprev = 25 OR'                                                   + #13 +
   '         (ppp.idplanoprev ='                                                            + #13 +
   '         (SELECT MAX(ppp1.idplanoprev)'                                                 + #13 +
   '               FROM partprevplan ppp1'                                                  + #13 +
   '              WHERE ppp1.idpessoa = ppp.idpessoa'                                       + #13 +
   '                AND nvl(ppp1.datacancelamento, TRIM(SYSDATE)) ='                        + #13 +
   '                    (SELECT nvl(MAX(ppp2.datacancelamento), TRIM(SYSDATE))'             + #13 +
   '                       FROM partprevplan ppp2'                                          + #13 +
   '                      WHERE ppp2.idpessoa = ppp1.idpessoa)'                             + #13 +
   '                AND NOT EXISTS (SELECT 1'                                               + #13 +
   '                       FROM partprevplan ppp2'                                          + #13 +
   '                      WHERE ppp2.idpessoa = ppp1.idpessoa '                             + #13 +
   '                        AND ppp2.idsitplanoprev = 25))))))'                             + #13 +
//Fim - Ádler Souza - SOL N° 140060 KTN N°873169
   '  ) CON, '                                                                              + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                + #13 +
   '  ITEMEMPTMO      ITE, '                                                                + #13 +
   // SOL 117973 Daniel Begnami
   '  TIPOSUSPEMPTMO SUSP '                                                                 + #13;
   // FIM

//   '  TIPOSUSPEMPTMO  TSE  '                                                                 + #13;

   sSQL := sSQL + MontaWhereFolha(iPatro);

   //Pendência 23251 - 09/10/2006 - Alberto
   sSQL := sSQL +
   '  AND MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '                                      + #13 +
   '  AND MIG.DATAMIGRA        = (select max(DATAMIGRA) '                                    + #13 +
   '                              from   VWMIGRACONTRATOEP '                                 + #13 +
   '                              where  IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '           + #13 +
   //Pendência 27490 - 28/02/2008
   //'                              and    DATAMIGRA <= HME.HMEDATAPREVISTA) '                 + #13;
   '                              and    DATAMIGRA <= HME.HMEDATAVENCTO) '                   + #13 +
   //Fim Pendência 27490
   //Fim Pendência 23251

  ' ORDER BY'                                                                               + #13 +
   '   CON.IDCONTRATOEMPTMO, HME.HMEPARCELA ';

   Result := sSQL;
end;

//Fernando Satnana
function TfrmExecEnvio.MontaSelectFolhaInfoFolha(const iPatro: Integer): String;
var
   sSQL : String;
begin

   sSQL := sSQL +
   ' SELECT '                                                                               + #13 +
   '   NVL(HME.HMEPARCELAALT, HME.HMEPARCELA) AS HMEPARCELA, '                              + #13 +
   '   HME.IDCONTRATOEMPTMO, HME.IDHISTMOVEMPTMO,'                                          + #13 +
   '   NVL(HME.HMENUMPARCELAS, 0) AS HMENUMPARCELAS,'                                       + #13 +
   '   (HME.HMEVLRPREVISTO/((100-NVL(susp.percentual,0))/100) * (NVL(susp.percentual,100)/100)) AS HMEVLRPREVISTO, /*CÁLCULO DO VALOR*/' + #13 +
   '   HME.HMERECPAG,'                                                                      + #13 +
   '   HME.HMEFORMACOBRANCA, HME.HMETIPOFOLHA, HME.HMETIPOMOV,'                             + #13 +
   '  (SELECT ITEDESCRICAO FROM ITEMEMPTMO ITE WHERE  ITE.IDITEMEMPTMO  = HME.IDITEMEMPTMO AND ROWNUM <= 1) AS ITEDESCRICAO, '+ #13 +
   '   ''Informativa'''+ 'AS FLGTIPODESC,  '+ #13 +
   '   HME.IDITEMEMPTMO, HME.HMESALDODEV,'                                                  + #13 +
   '   (LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, ''0000''))))'                                + #13 +
   '   ||'                                                                                  + #13 +
   '   (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, ''00'')))) AS ANOMESCOMPETENCIA,'            + #13 +
   '   CON.IDPATRO, ITC.IDRUBRICADIFINFOFPGTO AS IDRUBRICA,'                                + #13 +
   '   CON.IDEMPRESAPROP, CON.IDTIPOCONTREMPTMO, CON.IDPESSOA, CON.IDBENEF,'                + #13 +
   '   CON.IDPLANOPREV, NVL(MIG.IDPLANOCONTATU, CON.IDPLANOPREV) AS IDPLANOORIGEM,'         + #13 +
   '   ITC.ITCPRIORIDADE, ITC.TIPCODIGO, ITC.PLANO, ITC.ITCTRATASALDODEV,'                  + #13 +
   '   CON.INSCRICAONUMERO, CON.MATRICULA_TIT AS MATRICULA, CON.FLGINTERNO,'                + #13 +
   '   0 AS FLGATUALSALDOENV, -1 AS IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO'                 + #13 +
   '   ,ITE.FLGABATENEGATIVO                                               '                + #13 +  //Helen SIG101022
   ' FROM'                                                                                  + #13 +
   '   HISTMOVEMPTMO   HME,'                                                                + #13 +
   '   VWMIGRACONTRATOEP MIG,'                                                              + #13 +
   ' ('                                                                                     + #13 +
   ' SELECT'                                                                                + #13 +
   '    CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CON.IDCONTRQUITACAO,'      + #13 +
   '    CON.IDVERBA,               CON.FLGSITUACAO,'                                        + #13 +
   '    CON.NUMPARCELAS               AS PRAZO,'                                            + #13 +
   '    CON.VLRCONTRATO,           CON.VLRPARCELA,               CON.TXJUROS,'              + #13 +
   '    DECODE(ELP.IDPESSJURCEDIDO, NULL, CON.IDPATRO, ELP.IDPESSJURCEDIDO) AS IDPATRO,'    + #13 +
   '    TEP.IDEMPRESAPROP,'                                                                 + #13 +
   '    CON.IDPLANOPREV, NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS IDPLANOORIGEM,'         + #13 +
   '    CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO,'                                       + #13 +
   '    TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO,'                                     + #13 +
   '    CON.IDPESSOA,              CON.IDBENEF,                  CON.IDCBANCARIA,'          + #13 +
   '    CON.MOECODIGO, CON.IDCBANCARIADEB,'                                                 + #13 +
   '    DECODE(DEP.MATRICULA, NULL, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA_TIT,'        + #13 +
   '    CON.FLGSUSPENSAOAUTO,      CON.IDTIPOSUSPEMPTMO,'                                   + #13 +
   '    PPP.INSCRICAONUMERO,'                                                               + #13 +
   '    NVL(PPP.SALPARTICIPACAO, 0)   AS SALPARTICIPACAO,'                                  + #13 +
   '    NVL(PPP.SALMANTIDO, 0)        AS SALMANTIDO,'                                       + #13 +
   '    NVL(PPP.SALAUXDOENCA, 0)      AS SALAUXDOENCA,'                                     + #13 +
   '    SIT.IDSITPART,             SIT.FLGINTERNO,'                                         + #13 +
   '    SIT.DESCRICAO              AS SIT_TITULAR,'                                         + #13 +
   '    DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SITDESCRICAO'  + #13 +
   ' FROM'                                                                                  + #13 +
   '    CONTRATOEMPTMO  CON,'                                                               + #13 +
   '    PARTPREVPLAN    PPP,'                                                               + #13 +
   '    ELEGPATRO       ELP,'                                                               + #13 +
   '    DEPENTIT        DEP,'                                                               + #13 +
   '    PATRO           PTR,'                                                               + #13 +
   '    TIPOCONTREMPTMO TCE,'                                                               + #13 +
   '    TIPOEMPTMO      TEP,'                                                               + #13 +
   '    SITPART         SIT,'                                                               + #13 +
   '    SITPLANOPREV    SPP  '                                                              + #13 +
   ' WHERE '                                                                                + #13 +
   '        TEP.IDEMPRESAPROP     = ' + FormatFloat('#0', Sistema.IDEmpresa)                + #13 +
   '    AND CON.IDPATRO           = PTR.IDPESSOA '                                          + #13 +
   '    AND CON.IDPATRO           = PTR.IDPESSOA'                                           + #13 +
   '    AND CON.IDPESSOA          = ELP.IDPESSOA'                                           + #13 +
   '    AND CON.IDPESSOA          = PPP.IDPESSOA'                                           + #13 +
   '    AND CON.IDPESSOA          = DEP.IDTITULAR'                                          + #13 +
   '    AND CON.IDBENEF           = DEP.IDPESSOA'                                           + #13 +
   '    AND PTR.IDPESSOA          = ELP.IDPESSJUR'                                          + #13 +
   '    AND CON.IDPATRO           = PPP.IDPESSJUR'                                          + #13 +
   '    AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'                                  + #13 +
   '    AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO'                                       + #13 +
   '    AND PPP.IDSITPART         = SIT.IDSITPART'                                          + #13 +
   '    AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV'                                     + #13 +
   '    AND ppp.idplanoprev       = con.idplanoprev'                                        + #13 +
   ' ) CON,'                                                                                + #13 +
   ' ITEMXTIPOCONTR  ITC,'                                                                  + #13 +
   ' ITEMEMPTMO      ITE,'                                                                  + #13 +
   ' TIPOSUSPEMPTMO SUSP'                                                                   + #13 +
 ' WHERE'                                                                                   + #13 +
  '       ( HME.HMEFORMACOBRANCA   = ''F'' )'                                               + #13 +
  '  AND ( HME.HMETIPOFOLHA        IN (''P'') )'                                            + #13 +
  '  AND ( CON.IDPATRO             = ' + IntToStr(iPatro) +' ) /*DADO VARIÁVEL*/'           + #13 +
  '  AND ( HME.IDRUBRICA           IS NOT NULL )'                                           + #13 +
  '   AND ( HME.HMETIPOMOV         NOT IN (5, 8) )'                                         + #13 +
  '   AND ( HME.FLGENVIO           IS NOT NULL )'                                           + #13 +
  '   AND ( HME.FLGBAIXADO         IS NOT NULL )'                                           + #13 +
  '   AND ( HME.HMEVLREFETIVO      IS NULL )'                                               + #13 +
  '   AND ( HME.HMEDATAEFETIVA     IS NULL )'                                               + #13 +
  '   AND ( HME.HMEVLRPREVISTO     <> 0 )'                                                  + #13 +
  '   AND ( HME.CODDOCUMENTO       IS NULL )'                                               + #13 +
  '   AND ( HME.IDTMPDESC          IS NULL )'                                               + #13 +
  '   AND ( HME.HMEANOCOBRANCA     = ' + FormatFloat('0000', DBspnAno.Value) + ' ) '        + #13 +
  '   AND ( HME.HMEMESCOBRANCA     = ' + IntToStr(cboMes.ItemIndex + 1) + ' ) '             + #13 +
  '   AND ( NVL(HME.HMECENTRALIZA,0)      = 1 OR HME.HMEDESTACADO       = 1 )'              + #13 +
  '   AND ( NVL(HME.FLGESTORNADO,0)       = 0 )'                                            + #13 +
  '   AND ( NVL(HME.FLGABONADO,0)         = 0 )'                                            + #13 +
  '   AND ( NVL(HME.FLGQUITADO,0)         = 0 )'                                            + #13 +
  '   AND ( HME.FLGSUSPENSAO = 1)'                                                          + #13 +
  '   AND HME.IDTIPOSUSPEMPTMO = SUSP.IDTIPOSUSPEMPTMO'                                     + #13 +
  '   AND ITC.FLGENVIADIFINFO = 1'                                                          + #13 +
  '   AND ( CON.FLGSITUACAO        <> ''P'' )'                                              + #13 +
  '   AND ( CON.FLGSITUACAO        <> ''C'' )'                                              + #13;

    if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
    '   AND ( CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + ' ) '     + #13;

    if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
    '   AND ( CON.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue + ' ) '                + #13;

    if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
    '   AND ( CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue + ' ) '              + #13;

    sSQL := sSQL +
  '   AND ( CON.IDEMPRESAPROP      = 1 )'                                                   + #13 +
  '   AND ( CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') ) '                 + #13 +
  '   AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO  )'                               + #13 +
  '   AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'                               + #13 +
  '   AND ( ITC.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )'                                    + #13 +
  '   AND ( ITC.IDITEMEMPTMO       = HME.IDITEMEMPTMO )'                                    + #13 +
  '   AND NOT EXISTS (SELECT 1 FROM tmpdesc t'                                              + #13 +
  '                    WHERE t.idhistmovemptmo = hme.idhistmovemptmo'                       + #13 +
  '                      AND   t.flgtipodesc  = ''E'''                                      + #13 +
  '                      AND   t.FLGDESCFOLHA = ''P'''                                      + #13 +
  '                      AND   t.IDPESSJUR    =   1)'                                       + #13 +   
  '  AND MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO'                                       + #13 +
  '  AND MIG.DATAMIGRA        = (select max(DATAMIGRA)'                                     + #13 +
  '                              from   VWMIGRACONTRATOEP'                                  + #13 +
  '                              where  IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO'            + #13 +
  '                              and    DATAMIGRA <= HME.HMEDATAVENCTO)'                    + #13 +
  ' ORDER BY'                                                                               + #13 +
  '  CON.IDCONTRATOEMPTMO, HME.HMEPARCELA ';

   Result := sSQL;
end;

//Fernando Santana


//BRUNO AZEVEDO SOL 123125 KINTANA 612563
function TfrmExecEnvio.MontaSelectFolhaInformativa(const iPatro: Integer): String;
var
   sSQL : String;
begin
   sSQL := sSQL +
   ' SELECT '                                                                               + #13 +
   '   NVL(HME.HMEPARCELAALT, HME.HMEPARCELA) AS HMEPARCELA, '                              + #13 +
   '   HME.IDCONTRATOEMPTMO, HME.IDHISTMOVEMPTMO,'                                          + #13 +
   '   NVL(HME.HMENUMPARCELAS, 0) AS HMENUMPARCELAS,'                                       + #13 +
   '   (HME.HMEVLRPREVISTO/((100-NVL(susp.percentual,0))/100) * (NVL(susp.percentual,100)/100)) AS HMEVLRPREVISTO, /*CÁLCULO DO VALOR*/' + #13 +
   '   HME.HMERECPAG,'                                                                      + #13 +
   '   HME.HMEFORMACOBRANCA, HME.HMETIPOFOLHA, HME.HMETIPOMOV,'                             + #13 +
   '  (SELECT ITEDESCRICAO FROM ITEMEMPTMO ITE WHERE  ITE.IDITEMEMPTMO  = HME.IDITEMEMPTMO AND ROWNUM <= 1) AS ITEDESCRICAO, '+ #13 +
   '   ''Informativa'''+ 'AS FLGTIPODESC,  '+ #13 +
   '   HME.IDITEMEMPTMO, HME.HMESALDODEV,'                                                  + #13 +
   '   (LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, ''0000''))))'                                + #13 +
   '   ||'                                                                                  + #13 +
   '   (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, ''00'')))) AS ANOMESCOMPETENCIA,'            + #13 +
   '   CON.IDPATRO, ITC.IDRUBRICADIFINFO AS IDRUBRICA,'                                     + #13 +
   '   CON.IDEMPRESAPROP, CON.IDTIPOCONTREMPTMO, CON.IDPESSOA, CON.IDBENEF,'                + #13 +
   '   CON.IDPLANOPREV, NVL(MIG.IDPLANOCONTATU, CON.IDPLANOPREV) AS IDPLANOORIGEM,'         + #13 +
   '   ITC.ITCPRIORIDADE, ITC.TIPCODIGO, ITC.PLANO, ITC.ITCTRATASALDODEV,'                  + #13 +
   '   CON.INSCRICAONUMERO, CON.MATRICULA_TIT AS MATRICULA, CON.FLGINTERNO,'                + #13 +
   '   0 AS FLGATUALSALDOENV, -1 AS IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO'                 + #13 +
   '  ,ITE.FLGABATENEGATIVO                                                '                + #13 +  //Helen SIG101022
   ' FROM'                                                                                  + #13 +
   '   HISTMOVEMPTMO   HME,'                                                                + #13 +
   '   VWMIGRACONTRATOEP MIG,'                                                              + #13 +
   ' ('                                                                                     + #13 +
   ' SELECT'                                                                                + #13 +
   '    CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CON.IDCONTRQUITACAO,'      + #13 +
   '    CON.IDVERBA,               CON.FLGSITUACAO,'                                        + #13 +
   '    CON.NUMPARCELAS               AS PRAZO,'                                            + #13 +
   '    CON.VLRCONTRATO,           CON.VLRPARCELA,               CON.TXJUROS,'              + #13 +
   '    DECODE(ELP.IDPESSJURCEDIDO, NULL, CON.IDPATRO, ELP.IDPESSJURCEDIDO) AS IDPATRO,'    + #13 +
   '    TEP.IDEMPRESAPROP,'                                                                 + #13 +
   '    CON.IDPLANOPREV, NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS IDPLANOORIGEM,'         + #13 +
   '    CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO,'                                       + #13 +
   '    TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO,'                                     + #13 +
   '    CON.IDPESSOA,              CON.IDBENEF,                  CON.IDCBANCARIA,'          + #13 +
   '    CON.MOECODIGO, CON.IDCBANCARIADEB,'                                                 + #13 +
   '    DECODE(DEP.MATRICULA, NULL, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA_TIT,'        + #13 +
   '    CON.FLGSUSPENSAOAUTO,      CON.IDTIPOSUSPEMPTMO,'                                   + #13 +
   '    PPP.INSCRICAONUMERO,'                                                               + #13 +
   '    NVL(PPP.SALPARTICIPACAO, 0)   AS SALPARTICIPACAO,'                                  + #13 +
   '    NVL(PPP.SALMANTIDO, 0)        AS SALMANTIDO,'                                       + #13 +
   '    NVL(PPP.SALAUXDOENCA, 0)      AS SALAUXDOENCA,'                                     + #13 +
   '    SIT.IDSITPART,             SIT.FLGINTERNO,'                                         + #13 +
   '    SIT.DESCRICAO              AS SIT_TITULAR,'                                         + #13 +
   '    DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SITDESCRICAO'  + #13 +
   ' FROM'                                                                                  + #13 +
   '    CONTRATOEMPTMO  CON,'                                                               + #13 +
   '    PARTPREVPLAN    PPP,'                                                               + #13 +
   '    ELEGPATRO       ELP,'                                                               + #13 +
   '    DEPENTIT        DEP,'                                                               + #13 +
   '    PATRO           PTR,'                                                               + #13 +
   '    TIPOCONTREMPTMO TCE,'                                                               + #13 +
   '    TIPOEMPTMO      TEP,'                                                               + #13 +
   '    SITPART         SIT,'                                                               + #13 +
   '    SITPLANOPREV    SPP  '                                                              + #13 +
   ' WHERE '                                                                                + #13 +
   '        TEP.IDEMPRESAPROP     = ' + FormatFloat('#0', Sistema.IDEmpresa)                + #13 +
   '    AND CON.IDPATRO           = PTR.IDPESSOA '                                          + #13 +
   '    AND CON.IDPATRO           = PTR.IDPESSOA'                                           + #13 +
   '    AND CON.IDPESSOA          = ELP.IDPESSOA'                                           + #13 +
   '    AND CON.IDPESSOA          = PPP.IDPESSOA'                                           + #13 +
   '    AND CON.IDPESSOA          = DEP.IDTITULAR'                                          + #13 +
   '    AND CON.IDBENEF           = DEP.IDPESSOA'                                           + #13 +
   '    AND PTR.IDPESSOA          = ELP.IDPESSJUR'                                          + #13 +
   '    AND CON.IDPATRO           = PPP.IDPESSJUR'                                          + #13 +
   '    AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'                                  + #13 +
   '    AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO'                                       + #13 +
   '    AND PPP.IDSITPART         = SIT.IDSITPART'                                          + #13 +
   '    AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV'                                     + #13 +

   // SOL 190014 KTN 1920088 Otacilio ** Inicio **
   // '    AND ppp.idplanoprev       = con.idplanoprev'                                        + #13 + //Ádler Souza - SOL 145518 KTN 975132
   '          AND ((ppp.idplanoprev = '                                          + #13 +
   '        (SELECT MAX(ppp2.idplanoprev) '                                      + #13 +
   '          FROM partprevplan ppp2 '                                           + #13 +
   '         WHERE ppp2.flgdesativado = 0 '                                      + #13 +
   '           AND ppp2.idpessoa = ppp.idpessoa) OR '                            + #13 +
   '        (PPP.FLGDESATIVADO = 1 AND NOT EXISTS '                              + #13 +
   '        (SELECT 1 '                                                          + #13 +
   '           FROM partprevplan ppp1 '                                          + #13 +
   '          WHERE ppp1.idpessoa = ppp.idpessoa '                               + #13 +
   '            AND ppp1.flgdesativado = 0) AND '                                + #13 +
   '        (ppp.idsitplanoprev = 25 OR '                                        + #13 +
   '        (ppp.idplanoprev = '                                                 + #13 +
   '        (SELECT MAX(ppp1.idplanoprev)'                                       + #13 +
   '             FROM partprevplan ppp1 '                                        + #13 +
   '            WHERE ppp1.idpessoa = ppp.idpessoa '                             + #13 +
   '              AND nvl(ppp1.datacancelamento, TRIM(SYSDATE)) = '              + #13 +
   '                  (SELECT nvl(MAX(ppp2.datacancelamento), TRIM(SYSDATE)) '   + #13 +
   '                     FROM partprevplan ppp2 '                                + #13 +
   '                    WHERE ppp2.idpessoa = ppp1.idpessoa) '                   + #13 +
   '              AND NOT EXISTS (SELECT 1 '                                     + #13 +
   '                     FROM partprevplan ppp2 '                                + #13 +
   '                    WHERE ppp2.idpessoa = ppp1.idpessoa '                    + #13 +
   '                      AND ppp2.idsitplanoprev = 25))))))) '                   + #13 +
   // SOL 190014 KTN 1920088 Otacilio ** Fim **
   {   '    AND (PPP.FLGDESATIVADO  = 0'                                                        + #13 +
   '    OR'                                                                                 + #13 +
   '   (PPP.FLGDESATIVADO = 1 AND NOT EXISTS (SELECT 1 FROM partprevplan ppp1'              + #13 +
   '                                          WHERE ppp1.idpessoa = ppp.idpessoa'           + #13 +
   '                                            AND ppp1.flgdesativado = 0)'                + #13 +
   '                          AND (ppp.idsitplanoprev = 25'                                 + #13 +
   '                               OR'                                                      + #13 +
   '                              (ppp.idplanoprev = (select max(ppp1.idplanoprev) from partprevplan ppp1'                  + #13 +
   '                                                  where ppp1.idpessoa = ppp.idpessoa'                                   + #13 +
   '                                                  and   ppp1.datacancelamento = (SELECT MAX(ppp2.datacancelamento)'     + #13 +
   '                                                                                 FROM partprevplan ppp2'                + #13 +
   '                                                                                 WHERE ppp2.idpessoa = ppp1.idpessoa)'  + #13 +
   '                                                  and   not exists (select 1 from partprevplan ppp2'                    + #13 +
   '                                                                    where ppp2.idpessoa = ppp1.idpessoa'                + #13 +
   '                                                                    and   ppp2.idsitplanoprev = 25))))))'               + #13 +}
//Ádler Souza - SOL N° 140060 KTN N°873169
{   '    AND (ppp.idplanoprev ='                                                             + #13 + //Ádler Souza - SOL 145518 KTN 975132
   '        (SELECT MAX(ppp2.idplanoprev)'                                                  + #13 +
   '            FROM partprevplan ppp2'                                                     + #13 +
   '           WHERE ppp2.flgdesativado = 0'                                                + #13 +
   '             AND ppp2.idpessoa = ppp.idpessoa) OR'                                      + #13 +
   '        (PPP.FLGDESATIVADO = 1 AND NOT EXISTS'                                          + #13 +
   '         (SELECT 1'                                                                     + #13 +
   '             FROM partprevplan ppp1'                                                    + #13 +
   '            WHERE ppp1.idpessoa = ppp.idpessoa'                                         + #13 +
   '              AND ppp1.flgdesativado = 0) AND'                                          + #13 +
   '         (ppp.idsitplanoprev = 25 OR'                                                   + #13 +
   '         (ppp.idplanoprev ='                                                            + #13 +
   '         (SELECT MAX(ppp1.idplanoprev)'                                                 + #13 +
   '               FROM partprevplan ppp1'                                                  + #13 +
   '              WHERE ppp1.idpessoa = ppp.idpessoa'                                       + #13 +
   '                AND nvl(ppp1.datacancelamento, TRIM(SYSDATE)) ='                        + #13 +
   '                    (SELECT nvl(MAX(ppp2.datacancelamento), TRIM(SYSDATE))'             + #13 +
   '                       FROM partprevplan ppp2'                                          + #13 +
   '                      WHERE ppp2.idpessoa = ppp1.idpessoa)'                             + #13 +
   '                AND NOT EXISTS (SELECT 1'                                               + #13 +
   '                       FROM partprevplan ppp2'                                          + #13 +
   '                      WHERE ppp2.idpessoa = ppp1.idpessoa '                             + #13 +
   '                        AND ppp2.idsitplanoprev = 25))))))'                             + #13 + }//Fim - Ádler Souza - SOL 145518 KTN 975132
//Fim - Ádler Souza - SOL N° 140060 KTN N°873169
   ' ) CON,'                                                                                + #13 +
   ' ITEMXTIPOCONTR  ITC,'                                                                  + #13 +
   ' ITEMEMPTMO      ITE,'                                                                  + #13 +
   ' TIPOSUSPEMPTMO SUSP'                                                                   + #13 +
 ' WHERE'                                                                                   + #13 +
  '       ( HME.HMEFORMACOBRANCA   = ''F'' )'                                               + #13 +
  '  AND ( HME.HMETIPOFOLHA        IN (''B'') )'                                            + #13 +
  '  AND ( CON.IDPATRO             = ' + IntToStr(iPatro) +' ) /*DADO VARIÁVEL*/'           + #13 +
  '  AND ( HME.IDRUBRICA           IS NOT NULL )'                                           + #13 +
  '   AND ( HME.HMETIPOMOV         NOT IN (5, 8) )'                                         + #13 +
  '   AND ( HME.FLGENVIO           IS NOT NULL )'                                           + #13 +
  '   AND ( HME.FLGBAIXADO         IS NOT NULL )'                                           + #13 +
  '   AND ( HME.HMEVLREFETIVO      IS NULL )'                                               + #13 +
  '   AND ( HME.HMEDATAEFETIVA     IS NULL )'                                               + #13 +
  '   AND ( HME.HMEVLRPREVISTO     <> 0 )'                                                  + #13 +
  '   AND ( HME.CODDOCUMENTO       IS NULL )'                                               + #13 +
  '   AND ( HME.IDTMPDESC          IS NULL )'                                               + #13 +
  '   AND ( HME.HMEANOCOBRANCA     = ' + FormatFloat('0000', DBspnAno.Value) + ' ) '        + #13 +
  '   AND ( HME.HMEMESCOBRANCA     = ' + IntToStr(cboMes.ItemIndex + 1) + ' ) '             + #13 +
  '   AND ( NVL(HME.HMECENTRALIZA,0)      = 1 OR HME.HMEDESTACADO       = 1 )'              + #13 +
  '   AND ( NVL(HME.FLGESTORNADO,0)       = 0 )'                                            + #13 +
  '   AND ( NVL(HME.FLGABONADO,0)         = 0 )'                                            + #13 +
  '   AND ( NVL(HME.FLGQUITADO,0)         = 0 )'                                            + #13 +
  '   AND ( HME.FLGSUSPENSAO = 1)'                                                          + #13 +
  '   AND HME.IDTIPOSUSPEMPTMO = SUSP.IDTIPOSUSPEMPTMO'                                     + #13 +
  '   AND ITC.FLGENVIADIFINFO = 1'                                                          + #13 +
  '   AND ( CON.FLGSITUACAO        <> ''P'' )'                                              + #13 +
  '   AND ( CON.FLGSITUACAO        <> ''C'' )'                                              + #13;

    if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
    '   AND ( CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + ' ) '     + #13;

    if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
    '   AND ( CON.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue + ' ) '                + #13;

    if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
    '   AND ( CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue + ' ) '              + #13;

    sSQL := sSQL +
  '   AND ( CON.IDEMPRESAPROP      = 1 )'                                                   + #13 +
  '   AND ( CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') ) '                 + #13 +
  '   AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO  )'                               + #13 +
  '   AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'                               + #13 +
  '   AND ( ITC.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )'                                    + #13 +
  '   AND ( ITC.IDITEMEMPTMO       = HME.IDITEMEMPTMO )'                                    + #13 +
  '   AND NOT EXISTS (SELECT 1 FROM tmpdesc t'                                              + #13 + //Ádler Souza - SOL 145518 KTN 975132
  '                    WHERE t.idhistmovemptmo = hme.idhistmovemptmo'                       + #13 +
  '                      AND   t.flgtipodesc = ''K'')'                                      + #13 + //Fim - Ádler Souza - SOL 145518 KTN 975132
  '  AND MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO'                                       + #13 +
  '  AND MIG.DATAMIGRA        = (select max(DATAMIGRA)'                                     + #13 +
  '                              from   VWMIGRACONTRATOEP'                                  + #13 +
  '                              where  IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO'            + #13 +
  '                              and    DATAMIGRA <= HME.HMEDATAVENCTO)'                    + #13 +
  'ORDER BY'                                                                                + #13 +
  '  CON.IDCONTRATOEMPTMO, HME.HMEPARCELA ';

   Result := sSQL;
end;
//BRUNO AZEVEDO SOL 123125 KINTANA 612563

function TfrmExecEnvio.MontaUpdateCAPCAR(const sRecPag: String): String;
var
   sSQL : String;
begin
   sSQL :=
   'UPDATE '                                                                                 + #13 +
   '  HISTMOVEMPTMO '                                                                        + #13 +
   'SET '                                                                                    + #13 +
   '  FLGENVIO     = NULL '                                                                  + #13 ;
//SOL 122042 KINTANA 594314 - Ádler Souza.
//   '  FLGSUSPENSAO = NULL '                                                                  + #13;

   sSQL := sSQL + MontaWhereCAPCAR(sRecPag);

   Result := sSQL;
end;



function TfrmExecEnvio.MontaWhereComum: String;
var
   sSQL : String;
begin
   sSQL := sSQL +
   '   AND ( HME.HMETIPOMOV         NOT IN (5, 8) ) '                                        + #13 +
   //'   AND ( HME.FLGENVIO           = 0 ) '                                                  + #13 +
   //'   AND ( HME.FLGBAIXADO         = 0 ) '                                                  + #13 +

   '   AND ( HME.FLGENVIO           IS NOT NULL ) '                                          + #13 + //Renato Visoni
   '   AND ( HME.FLGBAIXADO         IS NOT NULL ) '                                          + #13 + //Renato Visoni

   '   AND ( HME.HMEVLREFETIVO      IS NULL ) '                                              + #13 +
   '   AND ( HME.HMEDATAEFETIVA     IS NULL ) '                                              + #13 +
   '   AND ( HME.HMEVLRPREVISTO     <> 0 ) '                                                 + #13 +

   // André Pontes - 22/09/2004
   '   AND ( HME.CODDOCUMENTO       IS NULL ) '                                              + #13 +
   '   AND ( HME.IDTMPDESC          IS NULL ) '                                              + #13 +

   '   AND ( HME.HMEANOCOBRANCA     = ' + FormatFloat('0000', DBspnAno.Value) + ' ) '        + #13 +
   '   AND ( HME.HMEMESCOBRANCA     = ' + IntToStr(cboMes.ItemIndex + 1) + ' ) '             + #13 +

   '   AND ( NVL(HME.HMECENTRALIZA,0)      = 1 OR HME.HMEDESTACADO       = 1 ) '             + #13 + //Renato Visoni

   //'   AND ( HME.FLGESTORNADO       IS NULL OR HME.FLGESTORNADO   = 0 ) '                    + #13 +
   //'   AND ( HME.FLGABONADO         IS NULL OR HME.FLGABONADO     = 0 ) '                    + #13 +
   //'   AND ( HME.FLGQUITADO         IS NULL OR HME.FLGQUITADO     = 0 ) '                    + #13 +
   //'   AND ( HME.FLGSUSPENSAO       IS NULL OR HME.FLGSUSPENSAO   = 0 ) '                    + #13 +

   '   AND ( NVL(HME.FLGESTORNADO,0)       = 0 ) '                    + #13 +  //Renato Visoni
   '   AND ( NVL(HME.FLGABONADO,0)         = 0 ) '                    + #13 +  //Renato Visoni
   '   AND ( NVL(HME.FLGQUITADO,0)         = 0 ) '                    + #13 +  //Renato Visoni


   // SOL 117973 Daniel Begnami
   //   '   AND ( NVL(HME.FLGSUSPENSAO,0)       = 0 ) '                    + #13 +  //Renato Visoni
   '   AND ( (NVL(HME.FLGSUSPENSAO, 0) = 0) OR (NVL(SUSP.FLGENVIA,0) = 1)) '+ #13 +
   '   AND HME.IDTIPOSUSPEMPTMO = SUSP.IDTIPOSUSPEMPTMO(+)  '+ #13 +
   // FIM

   '   AND ( CON.FLGSITUACAO        <> ''P'' ) '                                             + #13 +
   '   AND ( CON.FLGSITUACAO        <> ''C'' ) '                                             + #13;

   // ----------------------------------------------------------------------------------------------

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND ( CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + ' ) '     + #13;

   // Renato Visoni SOL 105543  Kintana 472315
   if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//     '  AND CON.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
     '  AND CON.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

   if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//     '  AND CON.IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
     '  AND CON.IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO
   // Fim Renato Visoni

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND ( CON.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue + ' ) '                + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND ( CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue + ' ) '              + #13;

   // Situação do Participante
   if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
   '   AND ( CON.IDSITPART          = ' + DBcboSitPart.LookupValue + ' ) '                   + #13;

   if dtmEmptmo.qryParamEmptmoFLGENVIODIVERG.AsInteger = 1 then sSQL := sSQL +
   '   AND ( HME.FLGDIVERGPEND      IS NULL OR HME.FLGDIVERGPEND  = 0 ) '                    + #13;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   AND ( CON.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                + #13 +

   '   AND ( CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') ) '                 + #13 +

   '   AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO  ) '                              + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( ITC.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( ITC.IDITEMEMPTMO       = HME.IDITEMEMPTMO ) '                                   + #13 ;

   {WO9375 - Helen V Bianchi - Inicio
// '   AND ( CON.IDPESSOA IN (SELECT PF.IDPESSOA FROM PESSOAFISICA PF WHERE PF.IDPESSOA = CON.IDPESSOA AND PF.DATAMORTE IS NULL) ' + #13 + // Paulo Nobre - SIG136501
   '   AND ( CON.IDBENEF IN (SELECT PF.IDPESSOA FROM PESSOAFISICA PF WHERE PF.IDPESSOA = CON.IDBENEF AND PF.DATAMORTE IS NULL) ' + #13 + // WO8098 Ferrari
   '         OR HME.HMEVLRPREVISTO < 0 )' + #13; //Everson Cunha - WO7488
    WO9375 - Helen V Bianchi - Fim }
   Result := sSQL;
end;



function TfrmExecEnvio.MontaWhereCAPCAR(const sRecPag: String): String;
var
   sSQL     : String;
   sDataIni : String;
   sDataFim : String;
begin
   if trim(edtDataVenctoIni.Text) <> EmptyStr then
      sDataIni := QuotedStr(FormatDateTime('dd/mm/yyyy', edtDataVenctoIni.Date));
   if (edtDataVenctoFim.Text) <> EmptyStr then
      sDataFim := QuotedStr(FormatDateTime('dd/mm/yyyy', edtDataVenctoFim.Date));

   sSQL :=
   'WHERE '                                                                                  + #13 +
   '       ( HME.HMEFORMACOBRANCA   = ''C'' ) '                                              + #13 +
   '   AND ( HME.HMERECPAG          = ''' + sRecPag + ''' ) '                                + #13;

   if trim(edtDataVenctoIni.Text) <> EmptyStr then
      sSQL := sSQL +
   '   AND HME.HMEDATAVENCTO       >= TO_DATE(' + sDataIni + ', ''dd/mm/yyyy'') '            + #13;

   if TRIM(edtDataVenctoFim.Text) <> EmptyStr then
      sSQL := sSQL +
   '   AND HME.HMEDATAVENCTO       <= TO_DATE(' + sDataFim + ', ''dd/mm/yyyy'') '            + #13;

   if sRecPag = 'P' then
   begin
      if not(chkCapDev.Checked) then sSQL := sSQL +
   '   AND ( HME.HMETIPOMOV         = 0 ) '                                                  + #13;

      if not(chkCap.Checked) then sSQL := sSQL +
   '   AND ( HME.HMETIPOMOV        <> 0 ) '                                                  + #13;
   end;

   sSQL := sSQL + MontaWhereComum;

   sSQL := sSQL +
   '  AND ( CON.IDPATRO             IN ( ' + molListaPatro.PegaPatro + ' ) ) '               + #13;

   Result := sSQL;
end;



function TfrmExecEnvio.MontaWhereFolha(const iPatro: Integer): String;
var
   sSQL        : String;
   sTipoFolha  : String;
   sDataIni : String;  // SOL 194460 Kintana 1861972
   sDataFim : String;  // SOL 194460 Kintana 1861972
begin
   if trim(edtDataVenctoIni.Text) <> EmptyStr then
      sDataIni := QuotedStr(FormatDateTime('dd/mm/yyyy', edtDataVenctoIni.Date)); // SOL 194460 Kintana 1861972
   if trim(edtDataVenctoFim.Text) <> EmptyStr then
      sDataFim := QuotedStr(FormatDateTime('dd/mm/yyyy', edtDataVenctoFim.Date)); // SOL 194460 Kintana 1861972
   sSQL :=
   'WHERE '                                                                                  + #13 +
   '       ( HME.HMEFORMACOBRANCA   = ''F'' ) '                                              + #13;

   // ----------------------------------------------------------------------------------------------

   sTipoFolha     := '';

   if chkFolhaPatro.Checked then sTipoFolha := QuotedStr('P');

   if chkFolhaBenef.Checked then
   begin
      if sTipoFolha <> '' then
      begin
         sTipoFolha := sTipoFolha + ',' + QuotedStr('B')
      end else begin
         sTipoFolha := QuotedStr('B');
      end;
   end;

   if sTipoFolha <> '' then sSQL := sSQL +
   '  AND ( HME.HMETIPOFOLHA        IN (' + sTipoFolha + ') ) '                              + #13;

   // SOL 194460 Kintana 1861972

   if edtDataVenctoIni.Text <> '' then sSQL := sSQL +
   '   AND HME.HMEDATAVENCTO       >= TO_DATE(' + sDataIni + ', ''dd/mm/yyyy'') '            + #13;

   if edtDataVenctoFim.Text <> '' then sSQL := sSQL +
   '   AND HME.HMEDATAVENCTO       <= TO_DATE(' + sDataFim + ', ''dd/mm/yyyy'') '            + #13;

   // SOL 194460 Kintana 1861972
   
   sSQL := sSQL +
   '  AND ( CON.IDPATRO             = ' + IntToStr(iPatro) + ' ) '                           + #13 +
   '  AND ( HME.IDRUBRICA           IS NOT NULL ) '                                          + #13;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL + MontaWhereComum;

   Result := sSQL;
end;



procedure TfrmExecEnvio.EnviaItensFolha(const iPatro: Int64; const sNomePatro: String);
var
   sMsgLog           : String;
   sDescricao     : String;
   sResult, sErro    : TStringList;
   fTotalPatro 	   : Currency;
   iLote, iTotalReg  : Integer;
   sTipoFolha        : String;
begin
   sDescricao  := 'Empréstimo - Envio ref: ' + PegaAnoMes;

   // Inicia uma transação para o Lote
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
      StartTransacao;

   try
      sResult := TStringList.Create;
      sErro   := TStringList.Create;

      iLote := -1;

      if IntegraEmptmo.EnviaTMPDESC(MontaSelectFolha(iPatro),
                                    sDescricao,
                                    sNomePatro,
                                    PegaAnoMes,             // Ano e Mês Cobrança
                                    dDataHoje,              // Data Lançamento
                                    sResult,                // Lista de Resultados que será apresentado no memResult
                                    sErro,                  // Lista de Erros que será apresentado no memErro
                                    iPatro,                 // Patrocinadora
                                    iLote,                  // Lote
                                    iTotalReg,              // Total de Registros enviado pela patrocinadora
                                    fTotalPatro,            // Valor Total enviado pela patrocinadora
                                    0,
                                    False,
                                    True,                                                    // Não agrupa
                                    isEnviaFolhaResgate     // AtualizaCtrlInterface se enviar para folha resgate
                                   ) <> 0 then
      begin
         // Erro - Desfaz a transação
         if dtmBaseDados.dbBaseDados.InTransaction then
            RollbackTransacao;
      end
      else
      begin      
         // Todos os registros da patrocinadora foram inseridos com sucesso

          // -------------------------------------------------------------------------------------
          // Log de operações
          // -------------------------------------------------------------------------------------
          sMsgLog := 'Envio Folha(s) ' + PegaAnoMes + ', ' + sNomePatro;
          sMsgLog := copy(sMsgLog, 1, 59);

          if not(Sistema.GravaLogOperacoes(sMsgLog)) then
             Raise Exception.Create('Falha na gravação do Log da operação.');

          // -------------------------------------------------------------------------------------

          LimpaRegistroLog(rLogTotalPrev);

          rLogTotalPrev.IDModulo   := Sistema.IDModulo;
          if (MolContratoEmptmo.IDContrato > 0) then
          begin
             rLogTotalPrev.IDContrato := MolContratoEmptmo.IDContrato;
          end
          else
          begin
             rLogTotalPrev.IDContrato := -1;
          end;

          // -------------------------------------------------------------------------------------

          rLogTotalPrev.IDHistMov  := -1;
          rLogTotalPrev.Origem     := 19;
          rLogTotalPrev.Operacao   := 'Envio de parcela para a folha: ' + IntToStr(cboMes.ItemIndex + 1) + IntToStr(Trunc(DBspnAno.Value));
          rLogTotalPrev.Data       := SysDate;
          rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
          rLogTotalPrev.Versao     := Sistema.Versao;

          GravaLogTotalPrev(rLogTotalPrev);
          // -------------------------------------------------------------------------------------

          if dtmBaseDados.dbBaseDados.InTransaction then
             CommitTransacao;

      end; // if ResultadoPrepara

   finally
      if dtmBaseDados.dbBaseDados.InTransaction then
         CommitTransacao;

      memResult.Lines.AddStrings(sResult);
      sResult.Free;

      memErro.Lines.AddStrings(sErro);
      sErro.Free;
   end;
end;

// Fernando Santana

procedure TfrmExecEnvio.EnviaItensFolhaInfoFolha(const iPatro: Int64; const sNomePatro: String);
var
   sMsgLog           : String;
   sDescricao	      : String;
   sResult, sErro    : TStringList;
   fTotalPatro 	   : Currency;
   iLote, iTotalReg  : Integer;
   sTipoFolha        : String;
begin
   sDescricao  := 'Empréstimo - Envio ref: ' + PegaAnoMes;

   // Inicia uma transação para o Lote
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
      StartTransacao;

   try
      sResult := TStringList.Create;
      sErro   := TStringList.Create;

      iLote := -1;

      if IntegraEmptmo.EnviaTMPDESC(MontaSelectFolhaInfoFolha(iPatro),
                                    sDescricao,
                                    sNomePatro + ' Rubricas informativas',
                                    PegaAnoMes,             // Ano e Mês Cobrança
                                    dDataHoje,              // Data Lançamento
                                    sResult,                // Lista de Resultados que será apresentado no memResult
                                    sErro,                  // Lista de Erros que será apresentado no memErro
                                    iPatro,                 // Patrocinadora
                                    iLote,                  // Lote
                                    iTotalReg,              // Total de Registros enviado pela patrocinadora
                                    fTotalPatro,            // Valor Total enviado pela patrocinadora
                                    0,                      // Não agrupa
                                    False,
                                    False,                   //BRUNO AZEVEDO SOL 153430 KINTANA 1156998
                                    0                      // MARCIO SANCHES SPINOSA SOL 169010 KINTANA 1495798
                                   ) <> 0 then
      begin
         // Erro - Desfaz a transação
         if dtmBaseDados.dbBaseDados.InTransaction then
            RollbackTransacao;
      end
      else
      begin
         // Todos os registros da patrocinadora foram inseridos com sucesso

          // -------------------------------------------------------------------------------------
          // Log de operações
          // -------------------------------------------------------------------------------------
          sMsgLog := 'Envio Folha(s) ' + PegaAnoMes + ', ' + sNomePatro;
          sMsgLog := copy(sMsgLog, 1, 59);

          if not(Sistema.GravaLogOperacoes(sMsgLog)) then
             Raise Exception.Create('Falha na gravação do Log da operação.');
          // -------------------------------------------------------------------------------------

          // -------------------------------------------------------------------------------------

          LimpaRegistroLog(rLogTotalPrev);

          rLogTotalPrev.IDModulo   := Sistema.IDModulo;
          if (MolContratoEmptmo.IDContrato > 0) then
          begin
             rLogTotalPrev.IDContrato := MolContratoEmptmo.IDContrato;
          end
          else
          begin
             rLogTotalPrev.IDContrato := -1;
          end;

          // -------------------------------------------------------------------------------------

          rLogTotalPrev.IDHistMov  := -1;
          rLogTotalPrev.Origem     := 19;
          rLogTotalPrev.Operacao   := 'Envio de parcela para a folha: ' + IntToStr(cboMes.ItemIndex + 1) + IntToStr(Trunc(DBspnAno.Value));
          rLogTotalPrev.Data       := SysDate;
          rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
          rLogTotalPrev.Versao     := Sistema.Versao;

          GravaLogTotalPrev(rLogTotalPrev);
          // -------------------------------------------------------------------------------------

          if dtmBaseDados.dbBaseDados.InTransaction then
             CommitTransacao;

      end; // if ResultadoPrepara

   finally
      if dtmBaseDados.dbBaseDados.InTransaction then
         CommitTransacao;

      memResult.Lines.AddStrings(sResult);
      sResult.Free;

      memErro.Lines.AddStrings(sErro);
      sErro.Free;
   end;
end;


// Fernando Santana



//BRUNO AZEVEDO SOL 123125 KINTANA 612563
procedure TfrmExecEnvio.EnviaItensFolhaInformativa(const iPatro: Int64; const sNomePatro: String);
var
   sMsgLog           : String;
   sDescricao	       : String;
   sResult, sErro    : TStringList;
   fTotalPatro 	     : Currency;
   iLote, iTotalReg  : Integer;
   sTipoFolha        : String;
begin
   sDescricao  := 'Empréstimo - Envio ref: ' + PegaAnoMes;

   // Inicia uma transação para o Lote
   if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

   try
      sResult := TStringList.Create;
      sErro   := TStringList.Create;

      iLote := -1;

      if IntegraEmptmo.EnviaTMPDESC(MontaSelectFolhaInformativa(iPatro),
                                    sDescricao,
                                    sNomePatro + ' Rubricas informativas',
                                    PegaAnoMes,             // Ano e Mês Cobrança
                                    dDataHoje,              // Data Lançamento
                                    sResult,                // Lista de Resultados que será apresentado no memResult
                                    sErro,                  // Lista de Erros que será apresentado no memErro
                                    iPatro,                 // Patrocinadora
                                    iLote,                  // Lote
                                    iTotalReg,              // Total de Registros enviado pela patrocinadora
                                    fTotalPatro,            // Valor Total enviado pela patrocinadora
                                    0,                      // Não agrupa
                                     True                   //BRUNO AZEVEDO SOL 153430 KINTANA 1156998
                                    ,False                  //BRUNO AZEVEDO SOL 153430 KINTANA 1156998
                                    ,isEnviaFolhaResgate    //  MARCIO SANCHES SPINOSA SOL 169010 KINTANA 1495798
                                   ) <> 0 then
      begin
         // Erro - Desfaz a transação
         if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
      end
      else
      begin
         // Todos os registros da patrocinadora foram inseridos com sucesso

          // -------------------------------------------------------------------------------------
          // Log de operações
          // -------------------------------------------------------------------------------------
          sMsgLog := 'Envio Folha(s) ' + PegaAnoMes + ', ' + sNomePatro;
          sMsgLog := copy(sMsgLog, 1, 59);

          if not(Sistema.GravaLogOperacoes(sMsgLog)) then
             Raise Exception.Create('Falha na gravação do Log da operação.');
          // -------------------------------------------------------------------------------------

          // -------------------------------------------------------------------------------------

          LimpaRegistroLog(rLogTotalPrev);

          rLogTotalPrev.IDModulo   := Sistema.IDModulo;
          if MolContratoEmptmo.IDContrato > 0 then
          begin
             rLogTotalPrev.IDContrato := MolContratoEmptmo.IDContrato;
          end
          else
          begin
             rLogTotalPrev.IDContrato := -1;
          end;

          // -------------------------------------------------------------------------------------

          rLogTotalPrev.IDHistMov  := -1;
          rLogTotalPrev.Origem     := 19;
          rLogTotalPrev.Operacao   := 'Envio de parcela para a folha: ' + IntToStr(cboMes.ItemIndex + 1) + IntToStr(Trunc(DBspnAno.Value));
          rLogTotalPrev.Data       := SysDate;
          rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
          rLogTotalPrev.Versao     := Sistema.Versao;

          GravaLogTotalPrev(rLogTotalPrev);
          // -------------------------------------------------------------------------------------

          if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

      end; // if ResultadoPrepara

   finally
      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

      memResult.Lines.AddStrings(sResult);
      sResult.Free;

      memErro.Lines.AddStrings(sErro);
      sErro.Free;
   end;
end;
//BRUNO AZEVEDO SOL 123125 KINTANA 612563

procedure TfrmExecEnvio.EnviaItensCAP;
var
   sResult           : TStringList;
   sErro             : TStringList;
   iPlanilha         : Integer;
   sSQL, sMensagem   : String;
   sSQLUpdate        : String;
   qryAux            : TwwQuery;
begin
   if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

   try
      sResult := TStringList.Create;
      sErro   := TStringList.Create;

      iPlanilha := 0;

      (* prepara o Histórico-padrão que será passado adiante *)
      //BRUNO AZEVEDO SOL 200924 KINTANA 1958353
      //sMensagem  := 'Concessoes/Pagamentos de Emprestimos, ref: ' + Copy(PegaAnoMes, 5, 2) + '/' +
      //              Copy(PegaAnoMes, 1, 4) + ', Contrato: ' + FloatToStr(molContratoEmptmo.IDContrato) ; // SOL 195538 KTN 1917765 Otacilio
      sMensagem  := 'Concessoes/Pagamentos de Emprestimos, ref: ' + Copy(PegaAnoMes, 5, 2) + '/' + Copy(PegaAnoMes, 1, 4);

      // -------------------------------------------------------
      //
      //    chama a função que prepara o Insert no CAPCAR
      //              passando o SQL acima
      //
      // -------------------------------------------------------

      if IntegraEmptmo.EnviaCAPCAR(MontaSelectCAPCAR('P'),
                                   sMensagem,
                                   dDataHoje,
                                   -1,
                                   Modulo.iMoedaCorrente,
                                   Modulo.sCentroCusto,
                                   Modulo.iPrograma,
                                   iPlanilha,
                                   sResult,
                                   sErro
                                  ) <> 0 then
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
      end
      else
      begin
         // -------------------------------------------------------------------------------------
         // Log de operações
         if not(Sistema.GravaLogOperacoes('Envio CaP - ' + Copy(PegaAnoMes, 5, 2) + '/' +
                                          Copy(PegaAnoMes, 1, 4))) then
         begin
            Raise Exception.Create('Falha na gravação do Log da operação.');
         end;
         // -------------------------------------------------------------------------------------

         // -------------------------------------------------------------------------------------

         LimpaRegistroLog(rLogTotalPrev);

         rLogTotalPrev.IDModulo   := Sistema.IDModulo;
         if MolContratoEmptmo.IDContrato > 0 then
            rLogTotalPrev.IDContrato := MolContratoEmptmo.IDContrato
         else
            rLogTotalPrev.IDContrato := -1;

         rLogTotalPrev.IDHistMov  := -1;
         rLogTotalPrev.Origem     := 19;
         rLogTotalPrev.Operacao   := 'Envio de parcela CAP: ' + IntToStr(cboMes.ItemIndex + 1) + IntToStr(Trunc(DBspnAno.Value));
         rLogTotalPrev.Data       := SysDate;
         rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
         rLogTotalPrev.Versao     := Sistema.Versao;

         GravaLogTotalPrev(rLogTotalPrev);

         // -------------------------------------------------------------------------------------

       if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

         sResult.Add('[Financeiro a Pagar] - Envio realizado com sucesso.');
      end;  // if EnviaCAPCAR

   finally
      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

      memResult.Lines.AddStrings(sResult);
      sResult.Free;

      memErro.Lines.AddStrings(sErro);
      sErro.Free;
   end;
end;



procedure TfrmExecEnvio.EnviaItensCaR;
var
   sResult     : TStringList;
   sErro       : TStringList;
   iPlanilha   : Integer;
   sMensagem   : String;
   sSQLUpdate  : String;
   qryAux      : TwwQuery;
begin
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
      StartTransacao;

   try

      sResult := TStringList.Create;
      sErro   := TStringList.Create;

      iPlanilha := 0;

      // prepara o Histórico-padrão que será passado adiante
      //BRUNO AZEVEDO SOL 200924 KINTANA 1958353
      //sMensagem  := 'Parcela de Emprestimos, ref: ' + Copy(PegaAnoMes, 5, 2) + '/' +
      //              Copy(PegaAnoMes, 1, 4) + ', Contrato: ' + FloatToStr(molContratoEmptmo.IDContrato) ;  // SOL 195538 KTN 1917765 Otacilio
      sMensagem  := 'Parcela de Emprestimos, ref: ' + Copy(PegaAnoMes, 5, 2) + '/' +Copy(PegaAnoMes, 1, 4);

      // -------------------------------------------------------
      //
      //    chama a função que prepara o Insert no CAPCAR
      //              passando o SQL acima
      //
      // -------------------------------------------------------



      // -------------------------------------------------------------------------------------------
      //    Envio
      // -------------------------------------------------------------------------------------------

      if not(chkIntegraCaR.Checked) then
      begin
         // se for para gerar os documentos
         if IntegraEmptmo.EnviaCAPCAR(MontaSelectCAPCAR('R'),
                                      sMensagem,
                                      dDataHoje,
                                      -1,
                                      Modulo.iMoedaCorrente,
                                      Modulo.sCentroCusto,
                                      Modulo.iPrograma,
                                      iPlanilha,
                                      sResult,
                                      sErro
                                     ) <> 0 then
         begin
            if dtmBaseDados.dbBaseDados.InTransaction then
               RollbackTransacao;
         end
         else
         begin
            // -------------------------------------------------------------------------------------
            // Log de operações
            if not(Sistema.GravaLogOperacoes('Envio CaR - ' + Copy(PegaAnoMes, 5, 2) + '/' +
                                             Copy(PegaAnoMes, 1, 4))) then
            begin
               Raise Exception.Create('Falha na gravação do Log da operação.');
            end;
            // -------------------------------------------------------------------------------------

            // -------------------------------------------------------------------------------------

            LimpaRegistroLog(rLogTotalPrev);

            rLogTotalPrev.IDModulo   := Sistema.IDModulo;

            if MolContratoEmptmo.IDContrato > 0 then
               rLogTotalPrev.IDContrato := MolContratoEmptmo.IDContrato
            else
               rLogTotalPrev.IDContrato := -1;

            rLogTotalPrev.IDHistMov  := -1;
            rLogTotalPrev.Origem     := 19;
            rLogTotalPrev.Operacao   := 'Envio de parcela CAP: ' + IntToStr(cboMes.ItemIndex + 1) + IntToStr(Trunc(DBspnAno.Value));
            rLogTotalPrev.Data       := SysDate;
            rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
            rLogTotalPrev.Versao     := Sistema.Versao;

            GravaLogTotalPrev(rLogTotalPrev);

            // -------------------------------------------------------------------------------------

            if dtmBaseDados.dbBaseDados.InTransaction then
               CommitTransacao;

         end; (* if EnviaCAPCAR *)
      end
      else // if not(chkIntegraCaR.Checked)
      begin
         // -------------------------------------------------------------------------------------------
         //    Se não for para gerar documentos, apenas faz update do flgEnvio
         // -------------------------------------------------------------------------------------------

         (* Cria a Query Auxiliar *)
         qryAux               := TwwQuery.Create(Application);
         qryAux.DatabaseName  := 'BASEDADOS';

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := MontaUpdateCaPCar('R');  //ALEX

         try
            qryAux.ExecSQL;

            // -------------------------------------------------------------------------------------
            // Log de operações
            if not(Sistema.GravaLogOperacoes('Envio CaR - ' + Copy(PegaAnoMes, 5, 2) + '/' +
                                             Copy(PegaAnoMes, 1, 4))) then
            begin
               Raise Exception.Create('Falha na gravação do Log da operação.');
            end;
            // -------------------------------------------------------------------------------------

            if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
            sResult.Add('[Financeiro a Receber] - Envio realizado com sucesso.');

            qryAux.Free;
         except
            if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
            sErro.Add('[Financeiro a Receber] - ERRO no Envio.');
         end;

      end; // if not(chkIntegraCaR.Checked)

      // -------------------------------------------------------------------------------------------
      //    FIM Envio
      // -------------------------------------------------------------------------------------------

   finally
      if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;

      memResult.Lines.AddStrings(sResult);
      sResult.Free;

      memErro.Lines.AddStrings(sErro);
      sErro.Free;
   end;
end;



procedure TfrmExecEnvio.btnVoltarClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
end;



function TfrmExecEnvio.DesfazSuspensaoAtraso(const sFormaCobranca : String; const iIdContratoEmptmo : Extended; var sMsgErro : string) : Boolean;
var
   qryAux         : TwwQuery;
   sSQL, sAnoMes  : String;
begin
   MostraEspera('Verificando Itens com cobrança suspensa...');

   sAnoMes := FormatFloat('0000', DBspnAno.Value) + FormatFloat('00', (cboMes.ItemIndex + 1));

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      sSQL :=
      'UPDATE '                                                               + #13 +
      '  HISTMOVEMPTMO '                                                      + #13 +
      'SET '                                                                  + #13 +
      '  FLGENVIO     = 0, '                                                  + #13 +
      '  IDTMPDESC    = NULL, '                                               + #13 +
      '  FLGSUSPENSAO = NULL  '                                               + #13 +
      'WHERE '                                                                + #13 +
      '      FLGBAIXADO       = 0 '                                           + #13 +
      '  AND FLGSUSPENSAO     = 1 '                                           + #13 +
      '  AND ( HMECENTRALIZA  = 1 OR HMEDESTACADO = 1 ) '                     + #13 +
      '  AND HMEFORMACOBRANCA = ' + QuotedStr(sFormaCobranca)                 + #13 +
      '  AND HMEANOCOBRANCA   = ' + NumeroIngles(DBspnAno.Value)              + #13 +
      '  AND HMEMESCOBRANCA   = ' + IntToStr(cboMes.ItemIndex + 1)            + #13 +
      '  AND HMEVLREFETIVO    IS NULL '                                       + #13;

      if iIdContratoEmptmo > 0 then
         sSQL := sSQL + '   AND IDCONTRATOEMPTMO = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + #13;

      // Renato Visoni SOL 105543 Kintana 472315
      if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//       '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
       '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

      if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//       '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz -  TIBERO
       '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz -  TIBERO
      // Fim Renato Visoni


      sSQL := sSQL +
      '  AND IDCONTRATOEMPTMO IN '                                            + #13 +
      '      ( '                                                              + #13 +
      '      SELECT '                                                         + #13 +
      '        DISTINCT IDCONTRATOEMPTMO '                                    + #13 +
      '      FROM '                                                           + #13 +
      '        HISTMOVEMPTMO '                                                + #13 +
      '      WHERE '                                                          + #13 +
      '            FLGBAIXADO       = 0 '                                     + #13 +
      '        AND HMEPARCELA       > 0 '                                     + #13;

//      '        AND HMETIPOMOV       NOT IN (0, 5, 8) '                        + #13 +

      sSQL := sSQL +
      '        AND HMETIPOMOV            NOT IN (5, 8) '                      + #13 +
      '        AND HMEVLREFETIVO    IS NULL '                                 + #13 +
      '        AND (HMECENTRALIZA   = 1 OR HMEDESTACADO = 1) '                + #13;

      if iIdContratoEmptmo > 0 then
         sSQL := sSQL + '   AND IDCONTRATOEMPTMO = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + #13;

      // Renato Visoni SOL 105543 Kintana 472315
      if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//        '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
        '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

      if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//        '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
        '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO
      // Fim Renato Visoni
      
      sSQL := sSQL +
      '        AND (LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, ''0000'')))) || '  +
      '            (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, ''00'')))) < '     + QuotedStr(sAnoMes) + #13 +
      '      ) ';

      try
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.ExecSQL;

         Result := True;

      except
         on E:Exception do
         begin
            sMsgErro := E.Message;
            Result := False;
         end;
      end;

   finally
      qryAux.Close;
      qryAux.Free;

      EscondeEspera;
   end;
end;



function TfrmExecEnvio.SuspensaoParcelasAtrasadas(var sMsgErro : string) : Boolean;
var
   qryAux         : TwwQuery;
   sSQL, sAnoMes  : String;
begin
   MostraEspera('Suspendendo itens atrasados...');

   sAnoMes := FormatFloat('0000', DBspnAno.Value) + FormatFloat('00', (cboMes.ItemIndex + 1));

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      sSQL :=
      'UPDATE '                                                               + #13 +
      '  HISTMOVEMPTMO '                                                      + #13 +
      'SET '                                                                  + #13 +
      '  FLGENVIO     = NULL, '                                               + #13 +
      '  FLGSUSPENSAO = 1 '                                                   + #13 +
      'WHERE '                                                                + #13 +
      '      FLGBAIXADO       = 0 '                                           + #13 +
      '  AND FLGENVIO         = 0 '                                           + #13;

      if molContratoEmptmo.IdContrato > 0 then sSQL := sSQL +
      '  AND IDCONTRATOEMPTMO = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + #13;


      // Renato Visoni SOL 105543 Kintana 472315
      if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//        '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
        '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

      if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//        '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
        '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO
      // Fim Renato Visoni

      sSQL := sSQL +
      '  AND ( HMECENTRALIZA  = 1 OR HMEDESTACADO = 1 ) '                     + #13 +
      '  AND HMEFORMACOBRANCA = ''C'' '                                       + #13 +
      '  AND HMEANOCOBRANCA   = ' + NumeroIngles(DBspnAno.Value)              + #13 +
      '  AND HMEMESCOBRANCA   = ' + IntToStr(cboMes.ItemIndex + 1)            + #13 +
      '  AND CODDOCUMENTO     IS NULL '                                       + #13 +
      '  AND HMEVLREFETIVO    IS NULL '                                       + #13 +
      '  AND IDCONTRATOEMPTMO IN '                                            + #13 +
      '      ( '                                                              + #13 +
      '      SELECT '                                                         + #13 +
      '        DISTINCT IDCONTRATOEMPTMO '                                    + #13 +
      '      FROM '                                                           + #13 +
      '        HISTMOVEMPTMO '                                                + #13 +
      '      WHERE '                                                          + #13 +
      '            FLGBAIXADO       = 0 '                                     + #13 +
      '        AND HMEPARCELA       > 0 '                                     + #13;

      if molContratoEmptmo.IdContrato > 0 then sSQL := sSQL +
      '        AND IDCONTRATOEMPTMO = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + #13;


      // Renato Visoni SOL 105543 Kintana 472315
      if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//        '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
        '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

      if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//        '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
        '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO
      // Fim Renato Visoni


      sSQL := sSQL +
      '        AND HMETIPOMOV       NOT IN (5, 8) '                           + #13 +
      '        AND HMEVLREFETIVO    IS NULL '                                 + #13 +
      '        AND (HMECENTRALIZA   = 1 OR HMEDESTACADO = 1) '                + #13 +
      '        AND (LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, ''0000'')))) || '  +
      '            (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, ''00'')))) < '     + QuotedStr(sAnoMes) + #13 +
      '      ) ';

      try
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.ExecSQL;

         Result := True;

      except
         on E:Exception do
         begin
            sMsgErro := E.Message;
            Result := False;
         end;
      end;

   finally
      qryAux.Close;
      qryAux.Free;

      EscondeEspera;
   end;
end;



function TfrmExecEnvio.SuspensaoJudicial(var sMsgErro : string) : Boolean;
var
   sSQL   : String;
   qryAux : TwwQuery;
begin
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   sSQL :=
   'UPDATE HISTMOVEMPTMO '                                           + #13 +
   'SET    FLGENVIO           = NULL, '                              + #13 +
   '       FLGSUSPENSAO       = 1 '                                  + #13 +
   'WHERE '                                                          + #13 +
   '       FLGBAIXADO         = 0 '                                  + #13 +
   'AND    FLGENVIO           = 0 '                                  + #13 +
   'AND    HMECENTRALIZA      = 1 '                                  + #13 +
   'AND    HMEFORMACOBRANCA   = ''C'''                               + #13 +
   'AND    HMEANOCOBRANCA     = ' + NumeroIngles(DBspnAno.Value)     + #13 +
   'AND    HMEMESCOBRANCA     = ' + IntToStr(cboMes.ItemIndex + 1)   + #13 +
   'AND    IDCONTRATOEMPTMO IN '                                     + #13 +
   '       ( '                                                       + #13 +
   '       SELECT '                                                  + #13 +
   '          DISTINCT IDCONTRATOEMPTMO '                            + #13 +
   '       FROM '                                                    + #13 +
   '          CONTRATOEMPTMO '                                       + #13 +
   '       WHERE '                                                   + #13 +
   '          FLGSITUACAO = ''J'''                                   + #13 +
   '       AND IDTIPOSUSPEMPTMO IS NULL '                            + #13;

   if molContratoEmptmo.IdContrato > 0 then
      sSQL := sSQL + '   AND IDCONTRATOEMPTMO = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + #13;

   // Renato Visoni SOL 105543 Kintana 472315
   if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//     '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
     '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

   if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//     '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
     '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO
   // Fim Renato Visoni

   sSQL := sSQL + '      ) ' + #13;

   if molContratoEmptmo.IdContrato > 0 then
      sSQL := sSQL + '   AND IDCONTRATOEMPTMO = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + #13;

   // Renato Visoni SOL 105543 Kintana 472315
   if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//     '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
     '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

   if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//     '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
     '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO
   // Fim Renato Visoni

   try
      try
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.ExecSQL;

         Result := True;
      except
         on E:Exception do
         begin
            sMsgErro := E.Message;
            Result := False;
         end;
      end;

   finally
      qryAux.Close;
      qryAux.Free;
   end;
end;



function TfrmExecEnvio.SuspensaoPorRegra(var sMsgErro : string) : Boolean;
var
   sSQLVerifica : String;
   sSQLRegra    : String;
   sSQL         : String;
   qryAuxRegra  : TwwQuery;
   qryAux       : TwwQuery;
   sSuspende    : String;
   sAnoMesComp  : String;
   sAnoMesCob   : String;
   sMes         : String;
begin
   Result := True;

   if dtmEmptmo.qryParamEmptmoFLGSUSPENSAOAUTO.AsInteger = 1 then
   begin
      sSQLVerifica :=
      'SELECT H.IDHISTMOVEMPTMO, H.IDCONTRATOEMPTMO, H.HMEPARCELA'      + #13 +
      '       TC.IDREGRASUSPCOBR'                                       + #13 +
      '       H.HMEANOCOMPETENCIA, H.HMEMESCOMPETENCIA '                + #13 +
      '       H.HMEANOCOBRANCA, H.HMEMESCOBRANCA '                      + #13 +
      'FROM   HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TC'    + #13 +
      'WHERE                          '                                 + #13 +
      '       H.FLGBAIXADO       = 0          '                         + #13 +
      'AND    H.FLGENVIO         = 0          '                         + #13 +
      'AND    HMECENTRALIZA      = 1 '                                  + #13 +
      'AND    H.HMEANOCOBRANCA   = ' + NumeroIngles(DBspnAno.Value)     + #13 +
      'AND    H.HMEMESCOBRANCA   = ' + IntToStr(cboMes.ItemIndex + 1)   + #13 +
      'AND    TC.FLGSUSPENSAO    = ''S'''                               + #13 +
      'AND    TC.FLGSITUACAO     = ''A'''                               + #13 +
      'AND    C.FLGSUSPENSAOAUTO = 1'                                   + #13 +
      'AND    C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO'                  + #13 +
      'AND    TC.IDTIPOEMPTMO    = C.IDTIPOEMPTMO'                      + #13;

      sSQL :=
      'UPDATE HISTMOVEMPTMO           '                                 + #13 +
      'SET    FLGENVIO = NULL,        '                                 + #13 +
      '       FLGSUSPENSAO = 1        '                                 + #13 +
      'WHERE                          '                                 + #13 +
      '       IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO'                    + #13 +
      'AND    HMEPARCELA       = :PHMEPARCELA'                          + #13;

      try
         MostraEspera('Verificando suspensão automática de cobranca...');

         qryAuxRegra               := TwwQuery.Create(Application);
         qryAuxRegra.DatabaseName  := 'BaseDados';

         qryAux                    := TwwQuery.Create(Application);
         qryAux.DatabaseName       := 'BaseDados';
         try
            qryAuxRegra.SQL.Clear;
            qryAuxRegra.SQL.Text := sSQLVerifica;
            qryAuxRegra.Open;

            qryAux.SQL.Clear;
            qryAux.SQL.Text := sSQL;

            while not(qryAuxRegra.EOF) do
            begin
               sMes := IntToStr(qryAuxRegra.FieldByName('HMEMESCOMPETENCIA').AsInteger);

               if length(sMes) = 1 then sMes := '0' + sMes;

               sAnoMesComp := FormatFloat('0000', qryAuxRegra.FieldByName('HMEANOCOMPETENCIA').AsInteger) + sMes;

               sMes := IntToStr(qryAuxRegra.FieldByName('HMEMESCOBRANCA').AsInteger);

               if length(sMes) = 1 then sMes := '0' + sMes;

               sAnoMesCob  := FormatFloat('0000', qryAuxRegra.FieldByName('HMEANOCOBRANCA').AsInteger) + sMes;

               sSQLRegra :=
                  'SELECT '                                                                       + #13 +
                  qryAuxRegra.FieldByName('IDCONTRATOEMPTMO').AsString + ' AS CONTRATO,'          + #13 +
                  qryAuxRegra.FieldByName('HMEPARCELA').AsString + '       AS PARCELA, '          + #13 +
                  sAnoMesComp +                                          ' AS ANOMESCOMPETENCIA,' + #13 +
                  sAnoMesCob  +                                          ' AS ANOMESCOBRANCA '    + #13 +
                  'FROM DUAL';

               UtilizaRegraBool(qryAuxRegra.FieldByName('IDREGRASUSPCOBR').AsInteger, sSQLRegra,
                                'e Suspensão Automática de Cobrança', sSuspende, True);

               if UpperCase(sSuspende) = 'TRUE' then
               begin
                  LimpaParametros(qryAux);
                  qryAux.ParamByName('PIDCONTRATOEMPTMO').AsFloat   := qryAuxRegra.FieldByName('IDCONTRATOEMPTMO').AsFloat;
                  qryAux.ParamByName('PHMEPARCELA').AsInteger       := qryAuxRegra.FieldByName('HMEPARCELA').AsInteger;
                  qryAux.ExecSQL;
               end;

               qryAuxRegra.Next;
            end;

         except
            on E:Exception do
            begin
               sMsgErro := E.Message;
               Result := False;
            end;
         end;

      finally
         EscondeEspera;
         qryAuxRegra.Close;
         qryAuxRegra.Free;
         qryAux.Free;
      end;

   end;
end;



function TfrmExecEnvio.SuspensaoIndeterminada(var sMsgErro : string) : Boolean;
var
   sSQL         : String;
   qrySuspende  : TwwQuery;
begin
   MostraEspera('Suspendendo cobranças por tempo indeterminado...');

   Result := True;

   qrySuspende               := TwwQuery.Create(Application);
   qrySuspende.DatabaseName  := 'BASEDADOS';

   sSQL :=
   'UPDATE '                                                      + #13 +
   '   HISTMOVEMPTMO '                                            + #13 +
   'SET '                                                         + #13 +
   '   FLGENVIO     = NULL, '                                     + #13 +
   '   FLGSUSPENSAO = 1 '                                         + #13 +
   'WHERE '                                                       + #13 +
   '       ( HMECENTRALIZA    = 1 OR HMEDESTACADO = 1 ) '         + #13 +
   '   AND ( FLGBAIXADO       = 0 ) '                             + #13 +
   '   AND ( FLGENVIO         = 0 ) '                             + #13 +
   '   AND ( IDCONTRATOEMPTMO IN ( '                              + #13 +
   '                             SELECT '                         + #13 +
   '                                IDCONTRATOEMPTMO '            + #13 +
   '                             FROM '                           + #13 +
   '                                CONTRATOEMPTMO '              + #13 +
   '                             WHERE '                          + #13 +
   '                                FLGSUSPENSAOAUTO = 1 '        + #13 +
   '                             AND IDTIPOSUSPEMPTMO IS NULL '   + #13;

   if molContratoEmptmo.IdContrato > 0 then
      sSQL := sSQL + '   AND IDCONTRATOEMPTMO = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + #13;

   // Renato Visoni SOL 105543 Kintana 472315
   if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//     '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
     '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

   if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//     '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
     '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO
   // Fim Renato Visoni

   sSQL := sSQL + '      ) ' + #13;

   if molContratoEmptmo.IdContrato > 0 then
      sSQL := sSQL + '   AND IDCONTRATOEMPTMO = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + #13;

   // Renato Visoni SOL 105543 Kintana 472315
   if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//     '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
     '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

   if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//     '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz -  TIBERO
     '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz -  TIBERO
   // Fim Renato Visoni

   sSQL := sSQL + '      ) ' + #13;
      
   qrySuspende.Close;
   qrySuspende.SQL.Clear;
   qrySuspende.SQL.Text := sSQL;

   try
      qrySuspende.ExecSQL;

   finally
      qrySuspende.Close;
      qrySuspende.Free;

      EscondeEspera;
   end;
end;



procedure TfrmExecEnvio.ntbPrincipalPageChanged(Sender: TObject);
begin
   inherited;
   EscondeEspera;
end;



procedure TfrmExecEnvio.FormCreate(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      chkCaP.Checked := False;
      chkCaP.Enabled := False;

      molContratoEmptmo.Filtro := 'AND CON.FLGSITUACAO IN (''A'', ''E'', ''K'')';
   end;
end;



procedure TfrmExecEnvio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   UFuncoesEmptmo.bBuscaMutuario := false;
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      molContratoEmptmo.Filtro := '';
   end;

   inherited;
end;



procedure TfrmExecEnvio.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmExecEnvio.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmExecEnvio.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TfrmExecEnvio.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TfrmExecEnvio.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);

   // Renato Visoni SOL 105543 Kintana 472315
   chkInArquivo.Enabled    := (molContratoEmptmo.IDContrato <= 0);
   chkNotInArquivo.Enabled := (molContratoEmptmo.IDContrato <= 0);

   if (chkInArquivo.Checked) then chkInArquivo.Checked     := (molContratoEmptmo.IDContrato <= 0);
   if chkNotInArquivo.Checked then chkNotInArquivo.Checked := (molContratoEmptmo.IDContrato <= 0);
   //Fim

end;



procedure TfrmExecEnvio.chkCarClick(Sender: TObject);
begin
   inherited;
   if gbFormaRecDif.Enabled then begin
     DBcboFormaRecebimento.Enabled := chkCar.Checked;
     btnAtribuiParametro.Enabled   := chkCar.Checked;
   end;
end;

procedure TfrmExecEnvio.btnAtribuiParametroClick(Sender: TObject);
begin
   inherited;
   DBcboFormaRecebimento.LookupValue := IntToStr(dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsInteger);
end;



procedure TfrmExecEnvio.DesmarcaNaoEnviar;
var
   sSQL           : String;
   sMensErro      : String;
   i              : Integer;
   iUltimaParcela : Integer;
   sFormaCobranca : String;
   sAnoMes        : String;
begin
   MostraEspera('Verificando itens em atraso que não foram enviados...');

   sAnoMes := FormatFloat('0000', DBspnAno.Value) + FormatFloat('00', (cboMes.ItemIndex + 1));
   sFormaCobranca := '';

   if (chkFolhaPatro.Checked) or (chkFolhaBenef.Checked) then
      sFormaCobranca := sFormaCobranca + QuotedStr('F');

   if chkCar.Checked then
   begin
      if sFormaCobranca <> '' then sFormaCobranca := sFormaCobranca + ',';
      sFormaCobranca := sFormaCobranca + QuotedStr('C');
   end;

   sSQL :=
   'SELECT DISTINCT '                                                                        + #13 +

   // Marchetti - Pendencia 20045
   '   CON.IDCONTRATOEMPTMO,  '                                                              + #13 +
   '   TCE.FLGENVIAPARCMES, '                                                                + #13 +
   '   DECODE(NVL(CON.NUMPARCDESCONTO,0),0,NVL(TCE.NUMPARCDESCONTO,0),NVL(CON.NUMPARCDESCONTO,0)) AS NUMPARCDESCONTO, '                                      + #13 +
   '   NVL(TCE.TCETRATAPARCATRAS,''I'') AS TCETRATAPARCATRAS '                               + #13 +

   'FROM '                                                                                   + #13 +
   '   HISTMOVEMPTMO   HME, '                                                                + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                + #13 +
   '   ELEGPATRO       ELP, '                                                                + #13 +
   '   TIPOCONTREMPTMO TCE  '                                                                + #13 +
   'WHERE '                                                                                  + #13 +
   '       CON.FLGSITUACAO           NOT IN (''C'', ''Q'') '                                 + #13;

   sSQL := sSQL +
   '   AND HME.HMETIPOMOV            NOT IN (0,5,8) '                                        + #13 +
   '   AND HME.HMEANOCOBRANCA        = ' + FormatFloat('0000', DBspnAno.Value)               + #13 +
   '   AND HME.HMEMESCOBRANCA        = ' + FormatFloat('00', cboMes.itemIndex + 1)           + #13 +
   '   AND HME.HMEPARCELA            > 0 '                                                   + #13 +
   '   AND HME.FLGENVIO              = 2 '                                                   + #13 +
   '   AND HME.FLGBAIXADO            = 0 '                                                   + #13 +
   '   AND HME.HMEFORMACOBRANCA      IN ( ' + sFormaCobranca + ') '                          + #13 +
   '   AND NVL(HME.FLGESTORNADO, 0)  = 0 '                                                   + #13 +
   '   AND HME.HMEVLREFETIVO         IS NULL '                                               + #13 +
   '   AND HME.HMEDATAEFETIVA        IS NULL '                                               + #13 +
   '   AND (HME.HMECENTRALIZA        = 1 OR HME.HMEDESTACADO = 1) '                          + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO      = ' + FormatFloat(#0, molContratoEmptmo.IDContrato)     + #13;


   // Renato Visoni SOL 105543 Kintana 472315
   if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//     '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;  //Everson Luiz - TIBERO
     '  AND IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;       //Everson Luiz - TIBERO

   if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then sSQL := sSQL +
//     '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
     '  AND IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO
   // Fim Renato Visoni
   

   sSQL := sSQL +
   '   AND TO_NUMBER((LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, ''0000'')))) || ' +
                    '(LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, ''00'')))) ' +
   '                ) < ' + FormatFloat('0000', DBspnAno.Value) + FormatFloat('00', (cboMes.ItemIndex + 1))   + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO          = ' + DBcboTipoEmptmo.LookupValue                       + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO     = ' + DBcboTipoContrato.LookupValue                     + #13;

   sSQL := sSQL +
   '   AND ( '                                                                               + #13 +
   '       CON.IDPATRO               IN ( ' + molListaPatro.PegaPatro + ' ) '                + #13 +
   '    OR ELP.IDPESSJURCEDIDO       IN ( ' + molListaPatro.PegaPatro + ' ) '                + #13 +
   '       ) '                                                                               + #13 +
   '   AND CON.IDPLANOPREV           IN ( ' + molListaPlano.PegaPlano + ' ) '                + #13 +
   '   AND CON.IDPATRO               = ELP.IDPESSJUR '                                       + #13 +
   '   AND CON.IDPESSOA              = ELP.IDPESSOA '                                        + #13 +
   '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO '                               + #13 +
   '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO ';

   with qryContratosDevedores do
   begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
   // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   // SQL.SaveToFile(Sistema.TempDir + 'EP-Envio-ContratosDevedores.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-Envio-ContratosDevedores.txt');
      Open;
   end;

   MostraEspera('Verificando itens em atraso que não foram enviados...');

   while not(qryContratosDevedores.EOF) do
   begin
      // Somente verifica se for para tratar parcelas em atraso
      if qryContratosDevedoresTCETRATAPARCATRAS.AsString = 'T' then
      begin
         sSQL :=
         'SELECT DISTINCT HME.HMEPARCELA '                                                                      + #13 +
         'FROM '                                                                                                + #13 +
         '   HISTMOVEMPTMO HME '                                                                                + #13 +
         'WHERE '                                                                                               + #13 +
         '    ( HME.IDCONTRATOEMPTMO    = ' + qryContratosDevedoresIDCONTRATOEMPTMO.AsString + ' ) '            + #13 +

         'AND ( HME.FLGBAIXADO          = 0 ) '                                                                 + #13 +
         'AND ( HME.HMEDATAEFETIVA      IS NULL ) '                                                             + #13 +
         'AND ( HME.HMEVLREFETIVO       IS NULL ) '                                                             + #13 +
         'AND ( HME.FLGENVIO            = 2 ) '                                                                 + #13 +
         'AND ( HME.HMETIPOMOV          NOT IN (0, 5, 8) ) '                                                    + #13 +
         'AND ( HME.HMEANOCOBRANCA      = ' + FormatFloat('0000', DBspnAno.Value) + ' ) '                       + #13 +
         'AND ( HME.HMEMESCOBRANCA      = ' + FormatFloat('00', cboMes.itemIndex + 1) + ' ) '                   + #13 +
         'AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ) '                                      + #13 +
         'AND NVL(HME.FLGESTORNADO, 0)  = 0 '                                                                   + #13 +
         'AND NVL(HME.FLGQUITADO, 0)    = 0 '                                                                   + #13 +
         'AND NVL(HME.FLGABONADO, 0)    = 0 '                                                                   + #13;

         if qryContratosDevedoresFLGENVIAPARCMES.AsInteger = 1 then
            sSQL := sSQL +
            'AND (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) || (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) < ' + QuotedStr(sAnoMes) + #13
         else
            sSQL := sSQL +
            'AND (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) || (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) <= '+ QuotedStr(sAnoMes) + #13;

         sSQL := sSQL +
         'ORDER BY '                                                                                            + #13 +
         '   HME.HMEPARCELA '                                                                                   + #13;

         with qryParcelasEmAberto do
         begin
            Close;
            Sql.Text := sSQL;
          //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
          //SQL.SaveToFile(Sistema.TempDir + 'EP-Envio-ParcelasEmAberto.txt');
            SQL.SaveToFile(ftempregra + '\' + 'EP-Envio-ParcelasEmAberto.txt');
            Open;
         end;

         qryParcelasEmAberto.First;

         for i := 1 to (qryContratosDevedoresNUMPARCDESCONTO.AsInteger) do qryParcelasEmAberto.Next;

         while not(qryParcelasEmAberto.EOF) do
         begin
            with qryDesmarcaNaoEnviar do
            begin
               LimpaParametros(qryDesmarcaNaoEnviar);
               ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratosDevedoresIDCONTRATOEMPTMO.AsFloat;
               ParamByName('PHMEPARCELA').AsInteger      := qryParcelasEmAbertoHMEPARCELA.AsInteger;

               ExecSQL;
            end;
            qryParcelasEmAberto.Next;
         end;
      end;
      qryContratosDevedores.Next;
   end;

   EscondeEspera;
end;



procedure TfrmExecEnvio.molContratoEmptmobtnLimpaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContratoEmptmo.btnLimpaContratoClick(Sender);

  // Renato Visoni SOL 105543 Kintana 472315
  chkInArquivo.Enabled   := (molContratoEmptmo.IDContrato <= 0);
  chkNotInArquivo.Enabled := (molContratoEmptmo.IDContrato <= 0);

  //Fim
end;

procedure TfrmExecEnvio.chkInArquivoClick(Sender: TObject);
begin
  inherited;


  if chkInArquivo.Checked = true and chkNotInArquivo.Checked = true then begin
    chkNotInArquivo.Checked := false;
  end;

end;

procedure TfrmExecEnvio.chkNotInArquivoClick(Sender: TObject);
begin
  inherited;


  if chkInArquivo.Checked = true and chkNotInArquivo.Checked = true then begin
    chkInArquivo.Checked := false;
  end;

end;
//Monica Gonzaga - Inicio - SOL169010
procedure TfrmExecEnvio.FLGRESGATEClick(Sender: TObject);
begin
  inherited;

  if  FLGRESGATE.Checked = True then
  begin
    chkFolhaBenef.Checked := True;
    chkFolhaPatro.Checked := False;
    chkFolhaPatro.Enabled := False;
    chkCar.Checked := False;
    chkCar.Enabled := False;
    chkCapDev.Checked := False;
    chkCapDev.Enabled := False;
    chkCaP.Checked := False;
    chkCaP.Enabled := False;

    //Ewerton Beltramini - SIG56011 - 08/01/2020 - Inicio...
    CmbPlano1.Enabled := True;
    CmbPlano2.Enabled := True;
    CmbPlano3.Enabled := True;
    CmbPlano4.Enabled := True;
//    EdtValor1.Enabled := True;
//    EdtValor2.Enabled := True;
//    EdtValor3.Enabled := True;
//    EdtValor4.Enabled := True;

    CmbPlano1.Color := clWindow;
    CmbPlano2.Color := clWindow;
    CmbPlano3.Color := clWindow;
    CmbPlano4.Color := clWindow;
//    EdtValor1.Color := clWindow;
//    EdtValor2.Color := clWindow;
//    EdtValor3.Color := clWindow;
//    EdtValor4.Color := clWindow;
    //Ewerton Beltramini - SIG56011 - 08/01/2020 - Fim.

  end
  else
  begin
    chkFolhaBenef.Checked := False;
    chkFolhaPatro.Enabled := True;
    chkCar.Enabled := True;
    chkCapDev.Enabled := True;

     if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
     begin
      chkCaP.Checked := False;
      chkCaP.Enabled := False;
     end
     else
     begin
      chkCaP.Enabled := True;
     end;

    //Ewerton Beltramini - SIG56011 - 08/01/2020 - Inicio...
    CmbPlano1.Enabled := False;
    CmbPlano2.Enabled := False;
    CmbPlano3.Enabled := False;
    CmbPlano4.Enabled := False;
    EdtValor1.Enabled := False;
    EdtValor2.Enabled := False;
    EdtValor3.Enabled := False;
    EdtValor4.Enabled := False;

    CmbPlano1.Color := clBtnFace;
    CmbPlano2.Color := clBtnFace;
    CmbPlano3.Color := clBtnFace;
    CmbPlano4.Color := clBtnFace;
    EdtValor1.Color := clBtnFace;
    EdtValor2.Color := clBtnFace;
    EdtValor3.Color := clBtnFace;
    EdtValor4.Color := clBtnFace;
    //Ewerton Beltramini - SIG56011 - 08/01/2020 - Fim.

  end ;

  Application.ProcessMessages; //Ewerton Beltramini - SIG56011 - 08/01/2020


end;

//Monica Gonzaga - FIM - SOL169010 - Inicio

procedure TfrmExecEnvio.EnviaFolhaResgate;
begin
   if FLGRESGATE.Checked then
       isEnviaFolhaResgate := 1
   else
       isEnviaFolhaResgate := 0;

end;
//Monica Gonzaga - FIM - SOL169010 - FIM

procedure TfrmExecEnvio.EdtValor1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  FormatarComoMoeda( Sender, Key );
end;

procedure TfrmExecEnvio.EdtValor2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  FormatarComoMoeda( Sender, Key );
end;

procedure TfrmExecEnvio.EdtValor3KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  FormatarComoMoeda( Sender, Key );
end;

procedure TfrmExecEnvio.EdtValor4KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  FormatarComoMoeda( Sender, Key );
end;

Procedure TfrmExecEnvio.FormatarComoMoeda( Componente : TObject; var Key: Char );
var
   str_valor  : String;
   dbl_valor  : double;
begin

   { verificando se estamos recebendo o TEdit realmente }
   IF Componente is TEdit THEN
   BEGIN
      { se tecla pressionada é um numero, backspace ou del deixa passar }
      IF ( Key in ['0'..'9', #8, #9] ) THEN
      BEGIN
         { guarda valor do TEdit com que vamos trabalhar }
         str_valor := TEdit( Componente ).Text ;
         { verificando se nao esta vazio }
         IF str_valor = EmptyStr THEN str_valor := '0,00' ;
         { se valor numerico ja insere na string temporaria }
         IF Key in ['0'..'9'] THEN str_valor := Concat( str_valor, Key ) ;
         { retira pontos e virgulas se tiver! }
         str_valor := Trim( StringReplace( str_valor, '.', '', [rfReplaceAll, rfIgnoreCase] ) ) ;
         str_valor := Trim( StringReplace( str_valor, ',', '', [rfReplaceAll, rfIgnoreCase] ) ) ;
         {inserindo 2 casas decimais}
         dbl_valor := StrToFloat( str_valor ) ;
         dbl_valor := ( dbl_valor / 100 ) ;

         {reseta posicao do tedit}
         TEdit( Componente ).SelStart := Length( TEdit( Componente ).Text );
         {retornando valor tratado ao TEdit}
         TEdit( Componente ).Text := FormatFloat( '###,##0.00', dbl_valor ) ;
      END;
      {se nao e' key relevante entao reseta}
      IF NOT( Key in [#8, #9] ) THEN key := #0;
   END;

end;

procedure TfrmExecEnvio.CmbPlano1CloseUp(Sender: TObject);
begin
  inherited;
  if CmbPlano1.keyValue > 0 then
  begin
       EdtValor1.Enabled := True;
       EdtValor1.Color := clWindow;
  end
  else
  begin
       EdtValor1.Enabled := False;
       EdtValor1.Color := clBtnFace;
  end;
end;

procedure TfrmExecEnvio.CmbPlano2CloseUp(Sender: TObject);
begin
  inherited;
  if CmbPlano2.keyValue > 0 then
  begin
       EdtValor2.Enabled := True;
       EdtValor2.Color := clWindow;
  end
  else
  begin
       EdtValor2.Enabled := False;
       EdtValor2.Color := clBtnFace;
  end;
end;

procedure TfrmExecEnvio.CmbPlano3CloseUp(Sender: TObject);
begin
  inherited;
  if CmbPlano3.keyValue> 0 then
  begin
       EdtValor3.Enabled := True;
       EdtValor3.Color := clWindow;
  end
  else
  begin
       EdtValor3.Enabled := False;
       EdtValor3.Color := clBtnFace;
  end;
end;

procedure TfrmExecEnvio.CmbPlano4CloseUp(Sender: TObject);
begin
  inherited;
  if CmbPlano4.keyValue > 0 then
  begin
       EdtValor4.Enabled := True;
       EdtValor4.Color := clWindow;
  end
  else
  begin
       EdtValor4.Enabled := False;
       EdtValor4.Color := clBtnFace;
  end;
end;

end.
