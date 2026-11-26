unit FPrincipal;

// Alterações:
{


{-------------------------------------------------------------------------------
Atender     : WO13084
Responsável : Luis Ferrari
Data        : 02/09/2024
Descrição   : Criação menu para Cadastro Cadastro Histórico Percentual em Grupo
--------------------------------------------------------------------------------
SIG         : 101440
Autor       : Luis Ferrari
Data        : 24/07/2023
Descrição   : Importação Alteração de Valor do Benefício em Lote.
--------------------------------------------------------------------------------
Alteracao   : InserirControleDividaBenef, ExecutaParcAtivos
Pendência   : SIG33744 (SOL 231442/18314)
Responsável : BRUNO AZEVEDO DOS SANTOS
Data MERGE  : 05/07/2022
Data        : 27/07/2018
Descrição   : Criação dos campos Status, Observação e Numprocinss das dívidas de benefícios,
              assim como a mudança de diversos controles da funcionalidade.
              reajustar dívidas de benefícios vinculadas ao plano REG REPLAN-não Saldada
              em janeiro
--------------------------------------------------------------------------------
Nº SIG.....: 123907
Data       : 16/03/2022
Responsável: Luis Ferrari
Descrição..: Ajuste do texto das telas de Concessão e Manutenção de Processos de Benefícios
-------------------------------------------------------------------------------
Nº SIG.....: 92139
Data       : 21/10/2019
Responsável: Ewerton Beltramini
Descrição..: Alteração do menu: "Liberação de benefício em Exigência ou Retido"
{-------------------------------------------------------------------------------
Nº SIG.....: 93307
Data       : 18/10/2019
Responsável: Rafael Vasconcelos
Descrição..: Recriação dos Submenus, pois os eventos são montados dinamicamente..
-------------------------------------------------------------------------------
Nº SIG.....: 91819
Data       : 14/10/2019
Responsável: Rafael Vasconcelos
Descrição..: Funcionalidades de "Retenção e Encerramento e "Reabertura de Benefício"
			 para o Menu de Manutenção.
{-------------------------------------------------------------------------------
Alteração  : (dfm) mnuRenovaoeReabertura
Nº SOL.....: 253577-18151
KTN / PPM  : 1318910
Data       : 21/03/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - reabertura/renovacao
{-------------------------------------------------------------------------------
Alteração  : eventos de aposentadoria e assistidos
Nº SOL.....: 253577-18129
KTN / PPM  : 1303078
Data       : 24/02/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - separação das interfaces
-------------------------------------------------------------------------------}
//Nº SOL............: 264735
//Nº PPM............: 1155650
//Data da Alteração.: 09/11/2015
//Responsável.......: André Imakawa
//Descrição.........: Sistema efetuava rollback sem verificar se existia
//                    transação com o banco.
//**************************************************************************************
{-------------------------------------------------------------------------------
Alteração  : mnuBenefConcessaoClick
Nº SOL.....: 253577-17464
KTN / PPM  : 955703
Data       : 02/07/2015
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - concessão
{-------------------------------------------------------------------------------
Alteração  : mnuManutenodeProcessosdeBenefciosClick
Nº SOL.....: 253577-17404
KTN / PPM  : 850977
Data       : 30/06/2015
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - Manutenção benefícios
//------------------------------------------------------------------------------
//Pendência   : SOL 253577/17624 PPM 1007094
//Responsável : edilaine
//Data        : 04/08/2015
//Descrição   : Remover item de Menu
                 - Contribuições por Núcleo Familiar;
                 - Entrada Manual de Contribuições por Núcleo Familiar
//Rotina      : Menu
//------------------------------------------------------------------------------
//Pendência   : SOL 218687.17129 KIN 2055744
//Responsável : William Santana
//Data        : 30/03/2015
//Descrição   : alteração do caption
//Rotina      : Menu
//------------------------------------------------------------------------------
//Pendência   : SOL 228244/16260 PPM 442505
//Responsável : Helio Lima Custodio
//Data        : 10/07/2014
//Descrição   : Adicionar no menu tela de
                Parametrização de Parcelamento de Dívida de Benefícios
//Rotina      : Menu
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Nº SOL     : 239897
//Nº PPM     : 525070
//Data       : 06/10/2014
//Responsável: Helio Lima Custodio
//Descrição  : Verifica se o componente já foi criado anteriormente,
               antes de tentar cria-lo na rotina de MontaMenu.
--------------------------------------------------------------------------------
//Pendência   : SOL 174933 KINTANA 1733374
//Responsável : Douglas Siqueira
//Data        : 10/01/2014
//Descrição   : Controle de Saldo devedor.
//Rotina      : mnuControledeDvidasdeBenefciosClick, mnuHistricodeDvidasdeBenefciosClick
--------------------------------------------------------------------------------
//Pendência   : SOL 211709/15287 KINTANA 2050393
//Responsável : Higor Nayde Ferreira
//Data        : 25/12/2013
//Descrição   : Atividade para liberação de versão 15188.
//              Excluir o menu de Evento e passar seus sub-menus para o
//              Menu de Concessão
--------------------------------------------------------------------------------
//Pendência   : SOL 199044/14442 KINTANA 2005143
//Responsável : Higor Nayde Ferreira
//Data        : 20/12/2013
//Descrição   : Implementação de rotina de reajuste de benefícios
--------------------------------------------------------------------------------
Autor(a)   : Douglas.Siqueira
Data       : 08/03/2013
Pendência  : SOL 176272 Kintana 1622576
Descricao  : Reversão Cotas

--------------------------------------------------------------------------------
Autor(a)   : Douglas.Siqueira
Data       : 08/03/2013
Pendência  : SOL 149652/3564 Kintana 1107607
Descricao  : Requerimento e concessão dos benefícios INSS em lote
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Autor(a)   : André Olvieira
Data       : 30/08/2012
Pendência  : SOL 179724 Kintana 1705112
Descricao  : implementação da Tela de Cargos e Funções
--------------------------------------------------------------------------------
Autor(a)   : Fanuel Junior
Data       : 05/04/2012
Pendência  : SOL 167842 Kintana 1483724
Descricao  : Alteração de funcionalidade para o módulo CadastroPrev
--------------------------------------------------------------------------------
Autor(a)   : Eraldo Silva
Data       : 29/02/2012
Pendência  : SOL 175120 Kintana 15940219
Descricao  : CONSULTA GERAL PESSOA Ao consultar alguma matricula no Consulta Geral de
             Pessoa o sistema fecha a tela automaticamente.
--------------------------------------------------------------------------------
------------------------------------------------------------------------------
Autor(a)   : Vinicius Ferreira
Data       : 02/10/2011
Pendência  : SOL 154494 KINTANA 1188399
Descricao  : Criar uma nova funcionalidade que permita efetuar o registro
             de informações da habilitação dos benefícios do INSS para posterior
             requerimento e/ou concessão em lote.
--------------------------------------------------------------------------------
Autor(a)  : Fanuel Junior
Data      : 28/09/2011
Pendência : SOL 162408 Kintana 1380561
Rotina    : Menu Eventos
Descricao : Desabilitar as seguintes categorias de eventos : Acidente, Reclusão
            e Doença
--------------------------------------------------------------------------------
Autor(a)  : Marcos Merola
Data      : 11/10/2011
Pendência : Sol 136386/4901 Kintana 1278330
Rotina    : Menu Manutenção
Descricao : Habilitar Tela Histórico de Pagamentos de Benefícios
--------------------------------------------------------------------------------
Autor(a)  : Ádler Souza
Data      : 30/09/2010
Pendência : SOL 142491 - KTN 911432
Rotina    : Menu Relatórios
Descricao : Habilitar Tela de Consulta de Indices.
--------------------------------------------------------------------------------
Autor(a)  : Augusto
Data      : 23/07/2007
Pendência : 25867
Rotina    : Menu Relatórios
Descricao : Criar DataModules 
--------------------------------------------------------------------------------
Autor(a)  : Augusto
Data      : 15/05/2007
Pendência : 18187
Rotina    : Menu
Descricao : Retirar itens do menu
--------------------------------------------------------------------------------
Autor(a)  :
Data      :
Pendência :
Rotina    :
Descricao :
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  StdCtrls, TB97, Db, DBTables, Wwquery, Wwdatsrc, wwdblook, Mask, wwdbedit,
  DBCtrls, MontaSelect, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio,
  IvAMulti, IvBinDic, IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts,
  CMApplicationEvents, StdActns, ActnList, ImgList, fcStatusBar,{dReports,}
  SConnect, MConnect, DBClient, UConsPart, uResource, JclFileUtils,
  CMNetUsers, wwstorep;

Const
   indNivelEventos   =  1;
   indNivelBeneficio =  2;
  // indNivelEventoDO  =  0;
  // indNivelEventoAC  =  1;
   indNivelEventoTS  =  0;
   indNivelEventoID  =  2;
   indNivelEventoIN  =  3;
 //  indNivelEventoRC  =  8;
   indNivelEventoFL  =  5;
 //  indNivelEventoOE  =  9;
   indNivelEventoAI  = 15;
   indNivelEventoBI  = 16;



   {indNivelEventos   =  1;
   indNivelBeneficio =  0;
   indNivelEventoDO  =  0;
   indNivelEventoAC  =  1;
   indNivelEventoTS  =  2;
   indNivelEventoID  =  4;
   indNivelEventoIN  =  5;
   indNivelEventoRC  =  7;
   indNivelEventoFL  =  8;
   indNivelEventoOE  =  9;
   indNivelEventoAI  = 11;
   indNivelEventoBI  = 12;   }

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuBeneficios: TMenuItem;
    mnuBenefEstimativa: TMenuItem;
    mnuBenefConcessao: TMenuItem;
    qryAux: TwwQuery;
    N28: TMenuItem;
    ProcessosdeBenefcio1: TMenuItem;
    MontaSelectPart: TMontaSelect;
    MontaSelectPatro: TMontaSelect;
    EntradaManualdeRubricas1: TMenuItem;
    N35: TMenuItem;
    DesdobramentodeBenefcio1: TMenuItem;
    N10: TMenuItem;
    Etiquetas1: TMenuItem;
    mnuEtiqConfigura: TMenuItem;
    mnuEtiqImprime: TMenuItem;
    RegistrodeOperaes1: TMenuItem;
    mnuBenefProvLibera: TMenuItem;
    mnuBenefAbreFechaLote: TMenuItem;
    mnuBenefAlteracaoBeneficio: TMenuItem;
    mnuDesfazerConcessaoBenef: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    BenefcioProvisrioAdiantamento1: TMenuItem;
    mnuBenefProvCancela: TMenuItem;
    mnuBenefRetroativo: TMenuItem;
    mnuSimulaRequerimento: TMenuItem;
    mnuSimulaElegibilidade: TMenuItem;
    mnuConsMemoriaCalculo: TMenuItem;
    Manuteno1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    MnuItReconstruirHistricoINSS: TMenuItem;
    Button1: TButton;
    mnuHistPagBeneficio: TMenuItem;
    mnuConsCargoFuncao: TMenuItem;
    MnuConcessodeBenefciosdoINSSemLote: TMenuItem;
    mnuReversodeCotas: TMenuItem;
    RequerimentodeBenefcios1: TMenuItem;
    mnuTempodeContribuio: TMenuItem;
    N3: TMenuItem;
    mnuIdade: TMenuItem;
    mnuInvalidez: TMenuItem;
    N7: TMenuItem;
    mnuPensao: TMenuItem;
    mnuCadastrodoProcessodeHabilitao: TMenuItem;
    mnuAposentadoriaINSS: TMenuItem;
    mnuFalecimentoINSS: TMenuItem;
    mnuRequerimentodeBenefciosdoINSSemLote: TMenuItem;
    mnuReconstruodohistricodoINSS: TMenuItem;
    mnuLiberaodeBenefcioemExignciaouRetido: TMenuItem;
    mnuManutenodeProcessosdeBenefcios: TMenuItem;
    mnuRegistroFalecBenef: TMenuItem;
    mnuReajusteBenef: TMenuItem;
    mnuControledeDvidasdeBenefcios: TMenuItem;
    mnuHistricodeDvidasdeBenefcios: TMenuItem;
    mnuParamParcDvidaBenef: TMenuItem;
    mnuRenteoeEncerramento: TMenuItem; //Rafael SIG91819
    mnuRenovaoeReabertura: TMenuItem; //Rafael - SIG93307
    Retencao: TMenuItem; //Rafael - SIG93307
    ReaberturadeBenefcio1: TMenuItem; //Rafael SIG91819
    N1: TMenuItem; //Ewerton SIG92139
    LiberaodeBenefcioemExignciaouRetido1: TMenuItem;
    mnuAlteraodeValoresdeBenefcioemLote1: TMenuItem;
    mnuCadastroHistricoPercentualemGrupo1: TMenuItem; //Ewerton SIG92139

    {----- Novo menu ------------------------------------------------------------}
    procedure FormActivate(Sender: TObject);

    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
                   IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
             IdReports: Integer; var sParams: String; var PrintReport: Boolean);

    procedure AcertarCdigosInternos1Click(Sender: TObject);
    procedure AtualizaodeSalrios1Click(Sender: TObject);
    procedure CancelarEventoRegistrado1Click(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure mnuBeneficiosClick(Sender: TObject);
    procedure mnuBenefAbreFechaLoteClick(Sender: TObject);
    procedure mnuBenefRequerimento1Click(Sender: TObject);
    procedure mnuBenefConcessaoClick(Sender: TObject);
    procedure mnuSimulaRequerimentoClick(Sender: TObject);
    procedure mnuSimulaElegibilidadeClick(Sender: TObject);
    procedure mnuBenefProvLiberaClick(Sender: TObject);
    procedure mnuBenefProvCancelaClick(Sender: TObject);
    procedure mnuBenefRetencaoClick(Sender: TObject);
    procedure ReaberturaeProrrogao1Click(Sender: TObject);
    procedure LiberaodeBenefcioemExigncia1Click(Sender: TObject);
    procedure DesdobramentodeBenefcio1Click(Sender: TObject);
    procedure ReajusteJudicial1Click(Sender: TObject);
    procedure mnuDesfazerConcessaoBenefClick(Sender: TObject);
    procedure mnuBenefPostoPrismaClick(Sender: TObject);
    procedure CadastrodeBeneficiriosdasMantenedoras1Click(Sender: TObject);
    procedure ManutenodeProcessodoINSS1Click(Sender: TObject);
    procedure SemcontrapartidadoINSS1Click(Sender: TObject);
    procedure EntradaManualdeRubricas1Click(Sender: TObject);
    procedure MnuFechamentodeReembolsoClick(Sender: TObject);
    procedure mnuBenefRetroativoClick(Sender: TObject);
    procedure mnuEtiqConfiguraClick(Sender: TObject);
    procedure mnuEtiqImprimeClick(Sender: TObject);
    procedure ProcessosdeBenefcio1Click(Sender: TObject);
    procedure mnuConsMemoriaCalculoClick(Sender: TObject);
    procedure ParticipantedoINSS1Click(Sender: TObject);
    procedure RegistrodeOperaes1Click(Sender: TObject);
    procedure mnuContribuicoesParticipClick(Sender: TObject);
    //procedure ContribuiesporNcleoFamiliar1Click(Sender: TObject);     // edilaine - SOL 253577/17624 / PPM 1007094
    //procedure mnuBenefEntradaManualContribClick(Sender: TObject);     // edilaine - SOL 253577/17624 / PPM 1007094
    procedure AlteraodeRecebedordeParticipanteFalecido1Click(
      Sender: TObject);
    procedure mnuBenefAlteracaoBeneficioClick(Sender: TObject);
    procedure MnuConsPart_PadraoClick(Sender: TObject);
    procedure MnuItReconstruirHistricoINSSClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Relatorios1Click(Sender: TObject);
    procedure mnuHistPagBeneficioClick(Sender: TObject);
    procedure mnuCadastrodoProcessodeHabilitaoINSSClick(Sender: TObject);
    procedure mnuConsCargoFuncaoClick(Sender: TObject);
    procedure mnuRequerimentodeBenefciosdoINSSemLote1Click(Sender: TObject);
    procedure MnuConcessodeBenefciosdoINSSemLoteClick(Sender: TObject);
    procedure ActLoginExecute(Sender: TObject);
    procedure mnuReversodeCotasClick(Sender: TObject);
    procedure mnuCadastrodoProcessodeHabilitaoClick(Sender: TObject);
    procedure mnuReconstruodohistricodoINSSClick(Sender: TObject);
    procedure mnuRequerimentodeBenefciosdoINSSemLoteClick(Sender: TObject);
    procedure mnuLiberaodeBenefcioemExignciaouRetidoClick(Sender: TObject);
    procedure mnuManutenodeProcessosdeBenefciosClick(Sender: TObject);
    procedure mnuRegistroFalecBenefClick(Sender: TObject);
    procedure mnuReajusteBenefClick(Sender: TObject);
    procedure mnuControledeDvidasdeBenefciosClick(Sender: TObject);
    procedure mnuHistricodeDvidasdeBenefciosClick(Sender: TObject);
    procedure mnuParamParcDvidaBenefClick(Sender: TObject);
    procedure mnuRenteoeEncerramentoClick(Sender: TObject); //RAfael SIG91819
    procedure mnuRenovaoeReaberturaClick(Sender: TObject);
    procedure mnuAlteraodeValoresdeBenefcioemLote1Click(Sender: TObject);
    procedure mnuCadastroHistricoPercentualemGrupo1Click(Sender: TObject); //RAfael SIG91819


  private
    { Private declarations }
    procedure AbreFormEventoDO(Sender: TObject);
    procedure AbreFormEventoAC(Sender: TObject);
    procedure AbreFormEventoTS(Sender: TObject);
    procedure AbreFormEventoID(Sender: TObject);
    procedure AbreFormEventoIN(Sender: TObject);
    procedure AbreFormEventoFL(Sender: TObject);
    procedure AbreFormEventoRC(Sender: TObject);
    procedure AbreFormEventoOE(Sender: TObject);
    procedure AbreFormEventoAI(Sender: TObject);
    procedure AbreFormEventoBI(Sender: TObject);
    procedure AbreFormDesfazerEvento(Sender: TObject);

    procedure MontaMenu;
    procedure verifica_situacao_empresa;
    procedure CriaDataModule;
    procedure limpaMenuDinamico(menu :Integer);
    procedure limpaMenu(menu :Integer);

  public
    { Public declarations }
    liIdPessJurPCS   : longInt;
    sNomePatroPCS    : String;
    liIdPessJurGrupo : longInt;
    sNomePatroGrupo  : String;
    liIdPessJurNivel : longInt;
    sNomePatroNivel  : String;

    liIdPessJurEvolFunc : longInt;
    sNomePatroEvolFunc  : String;

    procedure MudaCaptionFundacao(Sender: TObject);

  end;

var
  frmPrincipal: TfrmPrincipal;
  Arquivo  : TextFile;
  sArquivo : String;

implementation
{$R *.DFM}
{$R MensagemRes.Res}

// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
uses
  UAutorizacao, FTelaAut, USistema, UModulo, DBaseDados, UMascaras, UMensErro, UDataBase,
  uIntegraBack, UAdmPrev, DAPrev, UEtiquetaCM, fEmisEtiq, fCfgEtiqueta, uCtrlParamIntegra,
  uCmCtrlRpt,

  DRelatBeneficios, fParamRelEspecieRI, fParamRelRubricaRI,

  fParamAprevCS, fTipoBenefConcede,
  fCadRequerBenefParticip, fCadRequerBenefBfciario, fCadRequerBenefPensionista,

  fRetemEncerraNOVO, fCtrlInterface, fEventoTransfReserva, fConsReservaPart,
  fAlimentaReserva, fAnaliseRetroLote,

  fParamRelMovReserva, FEventoDemissaoCancel, fEventoAposentadoria, fEventoAssistido,
  fEventoAssistidoINSS, fEventoCancelInicia, fEventoMorte, fEventoReclusao, fDesfazerEvento,
  fCadInicioBenefExigencia, fConsHistMovReserva, fConsEventosPrev, fConsProcessoBenef,
  fCadRubricaManualCS, fCancelaEvento, fDesdobramentoBenef, fReaberturaBeneficio, fReajusteJudicial,
  fAtualizaSalario, fAcertaSequence, fRegFalBenef, fConsLogTotalPrev, fLiberaBeneficioProvisorio,
  fAbertFechaLote, fDesfazConcessaoBenefNOVO, fCadMantenedora, fConciliacao, fResultConciliacao,
  fCadBeneficiarioPP, fRetroativoPrev, fCadUFINSS, fAssocRubINSS,
  fManutReembolsoINSS, fConsPartINSS, fSimulaBeneficio, fCompoeValoresRI_TelaA, fCompoeValoresRI,
  fConsPartTratados, fCadEntrManualINSS, fExtratoINSS, fIdentificaINSS, fEncerraConciliacao,
  fComparaReembDesemb,
  FAlteraBeneficioLote,  // SIG101440
  fCadHstPercGrupo, // WO13084
  fSolicitaPatro,

  FEventoAposentaBenef, FEventoAssistidoBenef,      // edilaine - SOL 253577-18129 / PPM 1303078

  fConsCargoFuncao, fConsRubricas, fParamRelDemonsSRB, fPRelHisFuncionalMT,
  fConsMemoriaCalculo, dRelatorios,
  dRelatAdmPrev, dRelRetroRegional, dRelatGerencial, dRelatAdmPrev2, dRelTempoServicoMT,
  dRelatEspecificos, dRelTransfPlano,

  fParamRelCertificadoPre,
  {FCadContribNucleoFamiliar, FCadHstContribuicaoBeneficiario,}     // edilaine - SOL 253577/17624 / PPM 1007094 
  FIndicadorRecebedor, FAlteraBeneficio,
  FCadContribParticipante, FCancIdentificaINSS, FReconstruirINSS,
  FConsHistPagBeneficio, FCadProcHabINSS,FCadRequerBenefInssLote,FCadConcederBenefInssLote,FReverCotas,
  FReajuesteBenef, {FCtrlDiviBenef,} FHstDividaBenef3, FCtrlDiviBenef_Novo,  //edilaine SIG33744 

  FParamDividaBenef;//Helio - SOL Nº 228244-16260 PPM Nº 442505
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------

function ForEachModule (HInstance: Longint; Data: Pointer): Boolean;
var ModuleName, ModuleDesc: string;
    VersionInfo: TJclFileVersionInfo;
    sLinha: String;
begin
  sLinha := '';
  SetLength (ModuleName, 200);
  GetModuleFileName(HInstance, PChar(ModuleName), Length(ModuleName));
  ModuleName:=PChar(ModuleName);
  sLinha:=ModuleName+';';
  ModuleDesc:=GetPackageDescription(PChar(ModuleName));
  if ModuleDesc <> '' then
  begin
    sLinha:=sLinha+ModuleDesc+';';
    sLinha:=sLinha+DateTimeToStr(FileDateToDateTime(FileAge(ModuleName)))+';';
    VersionInfo := TJclFileVersionInfo.Create(ModuleName);
    try
      sLinha:=sLinha+VersionInfo.ProductVersion+';';
    finally
      VersionInfo.Free;
    end;
  end;
  Writeln(Arquivo, sLinha);
  result:=true;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  inherited;
  sTipoTelaBenef    := '';
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
Var
  X, Y, Z, NumItems, NumSubItens :Integer;
begin
   inherited;

   If ( Not Sistema.FezLogin ) Then
   Begin
     //Andre Imakawa - 09/11/2015 - Sol: 264735
     // Verifico se existe transação antes de efetuar ROLLBACK.
     if dtmBaseDados.dbBaseDados.inTransaction then
     dtmBaseDados.dbBaseDados.Rollback;
     Exit;
     
   End;

   stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;

   try
      if Sistema.MudouEmpresa then
        ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB','PARAMCAP',tiCAP);

      Verifica_Situacao_Empresa;

      iIdFundacao      := Sistema.IdEmpresa;
      iIdFundacaoAtual := Sistema.IdEmpresa;

      prmNumTentativasSalario    := 36;


      LeParam('BaseDados', True);

      MudaCaptionFundacao(Sender);

      // EXCLUI OS ITEMS FILHOS DE EVENTOS/XXXX CASO EXISTAM
     { For X:= 0 To mnuBenefcios.count - 1 Do
      Begin
         NumItems := mnuBenefcios.Items[x].Count - 1;
         For y:= NumItems DownTo 0 Do
         begin
             if mnuBenefcios.Items[x].Items[y].Tag = 0 then
                mnuBenefcios.Items[x].Items[y].Free
             else
             begin
                NumSubItens := mnuBenefcios.Items[x].Items[y].Count-1;
                for z := NumSubItens downto 0 do
                    mnuBenefcios.Items[x].Items[y].Items[z].Free;
             end;
         end;
      End;}
   finally
      MontaMenu;
      MontaSelectPatro.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
      MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
   end;
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
Var
 CmCtrlRpt :TCmCtrlRpt;
begin
  inherited;

  CmCtrlRpt := TCmCtrlRpt.Create;
  try
    Printed := ShowReport(IdReports, CmCtrlRpt);
  finally
    CmCtrlRpt.Free;
  end;
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case IdReports of
    3231:
      FrmPreviewReports := TfrmPRelHisFuncionalMT.Create(Self);
  else
    FrmPreviewReports := nil;
  end;
    inherited;
end;

procedure TfrmPrincipal.MudaCaptionFundacao(Sender: TObject);
var i, iPos, iTam, iTamFrase : word;
    Temp    : TComponent;
begin
  if Screen.ActiveForm = nil then Exit;
  if prmFLGTIPOPREVIDENC = 'I' then
  begin
    iPos      := Pos   ('FUNDA', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('FUNDAÇÃO');
    iTamFrase := Length(Screen.ActiveForm.Caption);
    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Instituto'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
    iPos      := Pos   ('PATROCINADORAS', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('PATROCINADORAS');
    iTamFrase := Length(Screen.ActiveForm.Caption);
    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Entidades'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
    iPos      := Pos   ('PATROCINADORA', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('PATROCINADORA');
    iTamFrase := Length(Screen.ActiveForm.Caption);
    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Entidade'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
    iPos      := Pos   ('PLANOS', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('PLANOS');
    iTamFrase := Length(Screen.ActiveForm.Caption);
    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Regimes'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
    iPos      := Pos   ('PLANO', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('PLANO');
    iTamFrase := Length(Screen.ActiveForm.Caption);
    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Regime'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
    for i := 0 to Screen.ActiveForm.ComponentCount - 1 do
    begin
      Temp := Screen.ActiveForm.Components[i];
      if (Temp is TLabel) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TLabel(Temp).Caption);
        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TLabel(Temp).Caption);
        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TLabel(Temp).Caption);
        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANOS', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TLabel(Temp).Caption);
        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANO', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TLabel(Temp).Caption);
        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
      end;
      if (Temp is TMenuItem) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TMenuItem(Temp).Caption);
        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TMenuItem(Temp).Caption);
        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TMenuItem(Temp).Caption);
        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANOS', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TMenuItem(Temp).Caption);
        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANO', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TMenuItem(Temp).Caption);
        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
      end;
      if (Temp is TGroupBox) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TGroupBox(Temp).Caption);
        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TGroupBox(Temp).Caption);
        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TGroupBox(Temp).Caption);
        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANOS', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TGroupBox(Temp).Caption);
        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANO', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TGroupBox(Temp).Caption);
        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
      end;
      if (Temp is TCheckBox) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TCheckBox(Temp).Caption);
        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TCheckBox(Temp).Caption);
        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TCheckBox(Temp).Caption);
        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANOS', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TCheckBox(Temp).Caption);
        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANO', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TCheckBox(Temp).Caption);
        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
      end;
      if (Temp is TPanel) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TPanel(Temp).Caption);
        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TPanel(Temp).Caption);
        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TPanel(Temp).Caption);
        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANOS', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TPanel(Temp).Caption);
        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
        iPos      := Pos   ('PLANO', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TPanel(Temp).Caption);
        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
      end;
    end;
  end;
end;

procedure TfrmPrincipal.CriaDataModule;
begin
  inherited;
  If DtmRelatorios = nil
   Then Begin
     Screen.Cursor := crSQLWait;
     try
       application.processmessages;
       Application.CreateForm(TDtmRelatorios, DtmRelatorios);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatorios".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;
   End;

  If DtmRelatAdmPrev = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelatAdmPrev, DtmRelatAdmPrev);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatAdmPrev".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If DtmRelRetroRegional = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelRetroRegional, DtmRelRetroRegional);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelRetroRegional".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If DtmRelatorioGerencial = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelatorioGerencial, DtmRelatorioGerencial);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatorioGerencial".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If DtmRelatAdmPrev2 = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelatAdmPrev2, DtmRelatAdmPrev2);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatAdmPrev2".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If dtmRelTempoServicoMT = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TdtmRelTempoServicoMT, dtmRelTempoServicoMT);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TdtmRelTempoServicoMT".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If dtmRelatEspecificos = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TdtmRelatEspecificos, dtmRelatEspecificos);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TdtmRelatEspecificos".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If DtmRelTransfPlano = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelTransfPlano, DtmRelTransfPlano);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelTransfPlano".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If Screen.Cursor = crSqlWait
   Then Screen.Cursor := crDefault;
end;

procedure TfrmPrincipal.Verifica_Situacao_Empresa;
var
  qryIntegraBack : TQuery;
begin
  // Verificar se Previdenciario com Contabilidade
  qryIntegraBack := TQuery.Create(Application);
  qryIntegraBack.DataBaseName := 'Basedados';
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT FLGINTCONTAB, FLGINTCPAGARPREV, FLGINTCRECEBERPR '+
                         ' FROM   PARAMAPREV ');
  qryIntegraBack.open;

  if not (qryIntegraBack.IsEmpty)
  then begin
     if qryIntegraBack.FieldbyName('FLGINTCONTAB').AsInteger = 1
     then IntegraBack.Contabilidade := 'S'
     else IntegraBack.Contabilidade := 'N';

     if (qryIntegraBack.FieldbyName('FLGINTCPAGARPREV').AsInteger = 1) or
        (qryIntegraBack.FieldbyName('FLGINTCRECEBERPR').AsInteger = 1)
     then IntegraBack.Financeiro  := 'S'
     else IntegraBack.Financeiro := 'N';
  end
  else begin
     IntegraBack.Contabilidade := 'N';
     IntegraBack.Financeiro := 'N';
  end;

  if Sistema.IdEmpresa <= 0
  then begin
     qryIntegraBack.Free; // CAMILLE - REFER - 24.06.1999
     Exit;
  end;

  // Preencher parametros da contabilidade
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT PL.MASCARA, PC.PLANO       '+
                         ' FROM   PLANO PL,   PARAMCONTAB PC '+
                         ' WHERE  (PC.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')'+
                         ' AND    (PL.PLANO = PC.PLANO) ');
  qryIntegraBack.Open;
  if not (qryIntegraBack.IsEmpty)
  then begin
      IntegraBack.Plano        := qryIntegraBack.FieldbyName('PLANO').AsInteger;
      IntegraBack.MascaraPlano := qryIntegraBack.FieldbyName('MASCARA').AsString;
  end
  else begin
     IntegraBack.Plano := 0;
     IntegraBack.MascaraPlano := '';
  end; // else - if not PARAMCONTAB.IsEmpty

  if (IntegraBack.Contabilidade = 'S') and
     ( (IntegraBack.Plano <= 0) or (IntegraBack.MascaraPlano = ''))
  then begin
     MsgDlg(' O Sistema de Administração Previdenciária está integrado com o Sistema de Contabilidade. '+
            ' Porém existem dados da contabilidade indispensáveis à integração que não estão cadastrados. '+
            ' Favor entrar em contato com o setor responsável. ','Informação',mtInformation,[mbOK],0);
  end;

  // Preencher parametros de integracao com CAP/CAR
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT PREC.MASCARADESEMB AS MASCARAREC , PPAG.MASCARADESEMB AS MASCARAPAG  '+
                      ' FROM   PARAMCAP PREC, PARAMCAP PPAG'+
                      ' WHERE  (PREC.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')'+
                      ' AND    (PPAG.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
                      ' AND    (PREC.RECPAG = ''R'')'+
                      ' AND    (PPAG.RECPAG = ''P'')');

  qryIntegraBack.Open;

  if (not qryIntegraBack.IsEmpty)
  then begin
     IntegraBack.MascaraReceb := qryIntegraBack.FieldbyName('MASCARAREC').AsString;
     IntegraBack.MascaraDesemb := qryIntegraBack.FieldbyName('MASCARAPAG').AsString;
  end
  else begin
     IntegraBack.MascaraReceb := '';
     IntegraBack.MascaraDesemb := '';
  end;

  if (IntegraBack.Financeiro = 'S') and (Trim(IntegraBack.MascaraDesemb) = '')
  then begin
     MsgDlg(' O Sistema de Administração Previdenciária está integrado com o Sistema de Contas a Receber. '+
            ' Porém existem dados do Contas a Receber indispensáveis à integração que não estão cadastrados. '+
            ' Favor entrar em contato com o setor responsável. ','Informação',mtInformation,[mbOK],0);
  end;
  //Verifica se a empresa utiliza o sistema ABC( Custo Baseado na Atividade)
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT USAABC, USACRESPON, UNIDNEGOC, CODCENTRORESPON '+
                         ' FROM   PARAMGLOBAL '+
                         ' WHERE  IDPESSOA = '+IntToStr(Sistema.idEmpresa));
  qryIntegraBack.open;
  if qryIntegraBack.IsEmpty
  then begin
     IntegraBack.ObrigaABC := 'S';
     IntegraBack.ObrigaCRespon := 'S'; 
     prmUnidNegoc := -1;
     prmCodCentroRespon := '';
  end
  else begin
     if qryIntegraBack.FieldByName('USAABC').AsString = 'N'
     then IntegraBack.ObrigaABC := 'N'
     else IntegraBack.ObrigaABC := 'S';

     if qryIntegraBack.FieldByName('USACRESPON').AsString = 'N'
     then IntegraBack.ObrigaCRespon := 'N'
     else IntegraBack.ObrigaCRespon := 'S';

     if Trim(qryIntegraBack.FieldByName('UnidNegoc').AsString) <> ''
     then prmUnidNegoc := qryIntegraBack.FieldByName('UnidNegoc').AsInteger
     else prmUnidNegoc := -1;

     if Trim(qryIntegraBack.FieldByName('CODCENTRORESPON').AsString) <> ''
     then prmCodCentroRespon := qryIntegraBack.FieldByName('CODCENTRORESPON').AsString
     else prmCodCentroRespon := '-1';
  end;

  qryIntegraBack.Free; 
end;//verifica_situacao_empresa;


procedure TfrmPrincipal.MontaMenu;
var
  NovoItem, ItemAtual : TMenuItem;
  iCont               : integer;

  ComponentAtual      : TComponent;

begin

  {Monta Menu Doença - DO}
  {ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoDO].Name);

  if (ComponentAtual As TMenuItem).Enabled
  then begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                    ' WHERE FLGINTERNO = ''DO'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' ORDER BY NOME ');
     qryAux.Open;
     qryAux.First;
     iCont := 0;
     while not qryAux.EOF do
        begin
             NovoItem := TMenuItem.Create(Self);
             NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
             NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
             NovoItem.OnClick := AbreFormEventoDO;
             mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoDO].Insert(iCont, NovoItem);

            Inc(iCont);
            qryAux.Next;
        end;
  end; }
  {Fim - Monta Menu Doença - DO}

  {Monta Menu Acidente - AC}
  {ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoAC].Name);

  if (ComponentAtual As TMenuItem).Enabled
  then begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                    ' WHERE FLGINTERNO = ''AC'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' ORDER BY NOME ');
     qryAux.Open;
     qryAux.First;
     iCont := 0;
     while not qryAux.EOF do
        begin
             NovoItem := TMenuItem.Create(Self);
             NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
             NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
             NovoItem.OnClick := AbreFormEventoAC;
             mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoAC].Insert(iCont, NovoItem);

            Inc(iCont);
            qryAux.Next;
        end;
  end;    }
  {Fim - Monta Menu Acidente - AC}

  {Monta Menu Tempo de Serviço - TS}
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoTS].Name);

  if (ComponentAtual As TMenuItem).Enabled
  then begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                    ' WHERE FLGINTERNO =  ''TS'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' ORDER BY NOME ');
     qryAux.Open;
     qryAux.First;
     iCont := 0;
     while not qryAux.EOF do
        begin
             //Helio - SOL Nº 239897 PPM Nº 525070
             //não recria o componente caso ele já tenha sido criado
             if FindComponent('A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString) <> nil then
             begin
                  qryAux.Next;
                  Continue;
             end;
             //FIM Helio - SOL Nº 239897 PPM Nº 525070

             NovoItem := TMenuItem.Create(Self);
             NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
             NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
             NovoItem.OnClick := AbreFormEventoTS;
             mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoTS].Insert(iCont, NovoItem);

            Inc(iCont);
            qryAux.Next;
        end;
  end;
  {Fim - Monta Menu Tempo de Serviço - TS}

  {Monta Menu Idade - ID}
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoID].Name);

  if (ComponentAtual As TMenuItem).Enabled
  then begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                    ' WHERE FLGINTERNO = ''ID'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' ORDER BY NOME ');
     qryAux.Open;
     qryAux.First;
     iCont := 0;
     while not qryAux.EOF do
        begin
             //Helio - SOL Nº 239897 PPM Nº 525070
             //não recria o componente caso ele já tenha sido criado
             if FindComponent('A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString) <> nil then
             begin
                  qryAux.Next;
                  Continue;
             end;
             //FIM Helio - SOL Nº 239897 PPM Nº 525070

             NovoItem := TMenuItem.Create(Self);
             NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
             NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
             NovoItem.OnClick := AbreFormEventoID;
             mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoID].Insert(iCont, NovoItem);

            Inc(iCont);
            qryAux.Next;
        end;
  end;
  {Fim - Monta Menu Idade - ID}

  {Monta Menu Incapacidade - IN}
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoIN].Name);

  if (ComponentAtual As TMenuItem).Enabled
  then begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                    ' WHERE FLGINTERNO = ''IN'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' ORDER BY NOME ');
     qryAux.Open;
     qryAux.First;
     iCont := 0;
     while not qryAux.EOF do
        begin
             //Helio - SOL Nº 239897 PPM Nº 525070
             //não recria o componente caso ele já tenha sido criado
             if FindComponent('A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString) <> nil then
             begin
                  qryAux.Next;
                  Continue;
             end;
             //FIM Helio - SOL Nº 239897 PPM Nº 525070

             NovoItem := TMenuItem.Create(Self);
             NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
             NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
             NovoItem.OnClick := AbreFormEventoIN;
             mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoIN].Insert(iCont, NovoItem);

            Inc(iCont);
            qryAux.Next;
        end;
  end;
  {Fim - Monta Menu Incapacidade - IN}

  {Monta Menu Falecimento - FL}
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoFL].Name);

  if (ComponentAtual As TMenuItem).Enabled
  then begin

     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                    ' WHERE FLGINTERNO = ''FL'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+
                    ' AND IDEVENTOGERADOR <> 346 ' +
                    ' ORDER BY NOME ');
     qryAux.Open;
     qryAux.First;
     iCont := 0;
     while not qryAux.EOF do
        begin
             //Helio - SOL Nº 239897 PPM Nº 525070
             //não recria o componente caso ele já tenha sido criado
             if FindComponent('A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString) <> nil then
             begin
                  qryAux.Next;
                  Continue;
             end;
             //FIM Helio - SOL Nº 239897 PPM Nº 525070

             NovoItem := TMenuItem.Create(Self);
             NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
             NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
             NovoItem.OnClick := AbreFormEventoFL;
             mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoFL].Insert(iCont, NovoItem);

            Inc(iCont);
            qryAux.Next;
        end;
  end;
  {Fim - Monta Menu Falecimento - FL}

  {Monta Menu Reclusao - RC}
 { ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoRC].Name);

  if (ComponentAtual As TMenuItem).Enabled
  then begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                    ' WHERE FLGINTERNO = ''RC'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' ORDER BY NOME ');
     qryAux.Open;
     qryAux.First;
     iCont := 0;
     while not qryAux.EOF do
        begin
             NovoItem := TMenuItem.Create(Self);
             NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
             NovoItem.Name    := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
             NovoItem.OnClick := AbreFormEventoRC;
             mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoRC].Insert(iCont, NovoItem);
            Inc(iCont);
            qryAux.Next;
        end;
  end;
  {Fim - Monta Menu Reclusao - RC}

  {Monta Menu Outros Eventos Temporários - OE}
 { ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoOE].Name);

  if (ComponentAtual As TMenuItem).Enabled
  then begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                    ' WHERE FLGINTERNO = ''OE'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' ORDER BY NOME ');
     qryAux.Open;
     qryAux.First;
     iCont := 0;
     while not qryAux.EOF do
        begin
             NovoItem := TMenuItem.Create(Self);
             NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
             NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
             NovoItem.OnClick := AbreFormEventoOE;
             mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoOE].Insert(iCont, NovoItem);

            Inc(iCont);
            qryAux.Next;
        end;

     if qryAux.RecordCount <> 0  then
        begin
             NovoItem := TMenuItem.Create(Self);
             NovoItem.Caption := '-';
             mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoOE].Insert(iCont, NovoItem);

             Inc(iCont);
             NovoItem := TMenuItem.Create(Self);
             NovoItem.Caption := 'Retorno';
             NovoItem.Name := 'D' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
             NovoItem.OnClick := AbreFormDesfazerEvento;
             mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoOE].Insert(iCont, NovoItem);
        end;
  end;
  {Fim - Monta Menu Outros Eventos Temporários - OE}

  {Monta Menu Beneficio do INSS para Participante - AI}
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelEventoAI].Name);

  if (ComponentAtual As TMenuItem).Enabled
  then begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                    ' WHERE FLGINTERNO = ''AI'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' ORDER BY NOME ');
     qryAux.Open;
     qryAux.First;
     iCont := 0;

     If ( QryAux.IsEmpty = True ) Then Begin
       (ComponentAtual As TMenuItem).Visible := False;
     End;

     while not qryAux.EOF do
     begin
       //Helio - SOL Nº 239897 PPM Nº 525070
       //não recria o componente caso ele já tenha sido criado
       if FindComponent('A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString) <> nil then
       begin
            qryAux.Next;
            Continue;
       end;
       //FIM Helio - SOL Nº 239897 PPM Nº 525070

       NovoItem := TMenuItem.Create(Self);
       NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
       NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
       NovoItem.OnClick := AbreFormEventoAI;
       mnu.Items[indNivelEventos].Items[indNivelEventoAI].Insert(iCont, NovoItem);

      Inc(iCont);
      qryAux.Next;
     end;
  end;
  {Fim - Monta Menu Beneficio do INSS para Participante - AI}

  { Monta Menu Beneficio do INSS para Beneficiario - BI }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelEventoBI].Name);

  if (ComponentAtual As TMenuItem).Enabled
  then begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                    ' WHERE FLGINTERNO = ''BI'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' ORDER BY NOME ');
     qryAux.Open;
     qryAux.First;
     iCont := 0;

     If ( QryAux.IsEmpty = True ) Then Begin
       (ComponentAtual As TMenuItem).Visible := False;
     End;

     while not qryAux.EOF do
        begin
             //Helio - SOL Nº 239897 PPM Nº 525070
             //não recria o componente caso ele já tenha sido criado
             if FindComponent('A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString) <> nil then
             begin
                  qryAux.Next;
                  Continue;
             end;
             //FIM Helio - SOL Nº 239897 PPM Nº 525070

             NovoItem := TMenuItem.Create(Self);
             NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
             NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
             NovoItem.OnClick := AbreFormEventoBI;
             mnu.Items[indNivelEventos].Items[indNivelEventoBI].Insert(iCont, NovoItem);

            Inc(iCont);
            qryAux.Next;
        end;
  end;
  {Fim - Monta Menu Beneficio do INSS para Beneficiario - BI}

end;


procedure TfrmPrincipal.AbreFormEventoDO;
begin
  CriaDataModule;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) );

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  {alteração do form frmEventoAssistido para frmEventoAssistidoBenef}
  Application.CreateForm(TfrmEventoAssistidoBenef, frmEventoAssistidoBenef);
  frmEventoAssistidoBenef.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoAssistidoBenef.HelpContext := 160010;
  frmEventoAssistidoBenef.ShowModal;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim

end;

procedure TfrmPrincipal.AbreFormEventoAC;
begin
  CriaDataModule;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) );

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  {alteração do form frmEventoAssistido para frmEventoAssistidoBenef}
  Application.CreateForm(TfrmEventoAssistidoBenef, frmEventoAssistidoBenef);
  frmEventoAssistidoBenef.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoAssistidoBenef.HelpContext := 160011;
  frmEventoAssistidoBenef.ShowModal;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim

end;

procedure TfrmPrincipal.AbreFormEventoTS(Sender: TObject);
begin
  CriaDataModule;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) );

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  {alteração do form frmEventoAposentadoria para frmEventoAposentaBenef}
  Application.CreateForm(TfrmEventoAposentaBenef, frmEventoAposentaBenef);
  frmEventoAposentaBenef.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoAposentaBenef.HelpContext := 160021;
  frmEventoAposentaBenef.ShowModal;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim
end;

procedure TfrmPrincipal.AbreFormEventoID;
begin
  CriaDataModule;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) );

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  {alteração do form frmEventoAposentadoria para frmEventoAposentaBenef}
  Application.CreateForm(TfrmEventoAposentaBenef, frmEventoAposentaBenef);
  frmEventoAposentaBenef.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoAposentaBenef.HelpContext := 160022;
  frmEventoAposentaBenef.ShowModal;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim
end;

procedure TfrmPrincipal.AbreFormEventoIN;
begin
  CriaDataModule;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) );

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  {alteração do form frmEventoAssistido para frmEventoAssistidoBenef}
  Application.CreateForm(TfrmEventoAssistidoBenef, frmEventoAssistidoBenef);
  frmEventoAssistidoBenef.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoAssistidoBenef.HelpContext := 160023;
  frmEventoAssistidoBenef.ShowModal;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim

end;


procedure TfrmPrincipal.AbreFormEventoFL;
begin
  CriaDataModule;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) );

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  Application.CreateForm(TfrmEventoMorte, frmEventoMorte);
  frmEventoMorte.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoMorte.HelpContext := 160033;
  frmEventoMorte.ShowModal;
end;

procedure TfrmPrincipal.AbreFormEventoRC;
begin
  CriaDataModule;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) );

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  Application.CreateForm(TfrmEventoReclusao, frmEventoReclusao);
  frmEventoReclusao.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoReclusao.HelpContext := 160012;
  frmEventoReclusao.ShowModal;
end;

procedure TfrmPrincipal.AbreFormEventoOE;
begin
  CriaDataModule;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) );

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  {alteração do form frmEventoAssistido para frmEventoAssistidoBenef}
  Application.CreateForm(TfrmEventoAssistidoBenef, frmEventoAssistidoBenef);
  frmEventoAssistidoBenef.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoAssistidoBenef.HelpContext := 160013;
  frmEventoAssistidoBenef.ShowModal;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim

end;

procedure TfrmPrincipal.AbreFormEventoAI;
begin
  CriaDataModule; 
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) );

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  Application.CreateForm(TfrmEventoAssistidoINSS, frmEventoAssistidoINSS);
  frmEventoAssistidoINSS.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoAssistidoINSS.HelpContext := 160024;
  frmEventoAssistidoINSS.ShowModal;
end;

procedure TfrmPrincipal.AbreFormEventoBI;
begin
  CriaDataModule;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) );

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  Application.CreateForm(TfrmEventoAssistidoINSS, frmEventoAssistidoINSS);
  frmEventoAssistidoINSS.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoAssistidoINSS.HelpContext := 160025; 
  frmEventoAssistidoINSS.ShowModal;
end;

procedure TfrmPrincipal.AbreFormDesfazerEvento;
begin
  CriaDataModule;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) );

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  Application.CreateForm(TfrmDesfazerEvento, frmDesfazerEvento);
  frmDesfazerEvento.Caption := 'Retorno - ' + qryAux.FieldByName('NOME').AsString;
  If sFlgInterno = 'AF' Then
    frmDesfazerEvento.HelpContext := 160008
  else
    If sFlgInterno = 'AR' Then
      frmDesfazerEvento.HelpContext := 160009
    else
      If sFlgInterno = 'CI' Then
        frmDesfazerEvento.HelpContext := 160027
      else
        frmDesfazerEvento.HelpContext := 160028;
  frmDesfazerEvento.ShowModal;
end;


procedure TfrmPrincipal.AcertarCdigosInternos1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmAcertaSequence,TfrmAcertaSequence, False);
end;

procedure TfrmPrincipal.CancelarEventoRegistrado1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCancelaEvento, TfrmCancelaEvento, False);
end;

procedure TfrmPrincipal.AtualizaodeSalrios1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmAtualizaSalario, TfrmAtualizaSalario, False);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmParamAPrevCS,TfrmParamAPrevCS,False);
end;

procedure TfrmPrincipal.mnuBeneficiosClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
end;

procedure TfrmPrincipal.mnuBenefAbreFechaLoteClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( frmAbertFechaLote, TfrmAbertFechaLote, False);
end;

procedure TfrmPrincipal.mnuBenefRequerimento1Click(Sender: TObject);
var
  sNumerosProcessos: string;
  cTipoBenef : Char;
  iIdCalculo : Integer;
begin
  inherited;
  CriaDataModule;

  If frmTipoBenefConcede = Nil Then
     Application.CreateForm(TfrmTipoBenefConcede, frmTipoBenefConcede);

  with frmTipoBenefConcede do begin
     Caption := 'Tipo de Benefício Desejado';
     frmTipoBenefConcede.HelpContext := 160071;
     rgrpTipo.Items.Clear;
     rgrpTipo.Items.Add('Manutenção de Benefícios para o Participante (Titular)');
     rgrpTipo.Items.Add('Manutenção de Benefícios para Beneficiários Diretos do Participante');
     //rgrpTipo.Items.Add('Manutenção de Benefícios para Beneficiários de um Beneficiário');   //edilaine SIG 123907
     rgrpTipo.Items.Add('Manutenção de Benefícios para Beneficiário Designado/Herdeiro');       //edilaine SIG 123907
     ShowModal;
     cTipoBenef := cTipoBeneficio;
    // Free;
  end; // with

  case cTipoBenef of
     'P' : // Manutencao de Processo para PARTICIPANTE
            AbreRequerParticip(
              'MA','-1', '-1', '-1', '-1',
              DateToStr(date),'', '-1','',sNumerosProcessos,'',
              '','','','','','','','','',
              '');
     'B' : // Manutencao de Processo para BENEFICIARIO
            AbreRequerBfciario('MA','-1', '-1', '-1', '-1',
                               DateToStr(date), '-1','',sNumerosProcessos,
                               '','','','','','','','',
                               iIdCalculo);

     'D' : // Manutencao de Processo para BENEFICIARIO
           AbreRequerPensionista( 'MA',
                                 '-1', '-1', '-1', '-1',
                                 '-1',
                                 DateToStr(date),
                                 sNumerosProcessos);
  end;
end;

procedure TfrmPrincipal.mnuBenefConcessaoClick(Sender: TObject);
var
  sNumerosProcessos : string;
  cTipoBenef : Char;
  iIdCalculo : Integer;
begin
  inherited;
  CriaDataModule;

  If frmTipoBenefConcede = Nil Then
     Application.CreateForm(TfrmTipoBenefConcede, frmTipoBenefConcede);

  with frmTipoBenefConcede do  begin
     Caption := 'Tipo de Benefício a Conceder';
     frmTipoBenefConcede.HelpContext := 160072;
     rgrpTipo.Items.Clear;
     rgrpTipo.Items.Add('Concessão de Benefícios para o Participante (Titular)');
     rgrpTipo.Items.Add('Concessão de Benefícios para Beneficiários Diretos do Participante');
     //rgrpTipo.Items.Add('Concessão de Benefícios para Beneficiários de um Beneficiário');   // edilaine - SOL 253577-17464 / PPM 955703
     //rgrpTipo.Items.Add('Concessão de Benefícios para Herdeiros');                          // edilaine - SOL 253577-17464 / PPM 955703
     rgrpTipo.Items.Add('Concessão de Benefícios para Beneficiário Designado/Herdeiro');      // Luis Ferrari SIG 123907
     ShowModal;
     cTipoBenef := cTipoBeneficio;
     //Free;
  End;
  case  cTipoBenef of
     'P' : // Concessao de Beneficio para PARTICIPANTE
            AbreRequerParticip(
              'CO','-1', '-1', '-1', '-1',
              DateToStr(date),'', '-1','',sNumerosProcessos,'',
              '','','','','','','','','',
              '');
     'B' : // Concessao de Beneficio para BENEFICIARIO
            AbreRequerBfciario( 'CO','-1', '-1', '-1', '-1',
                               DateToStr(date), '-1','',sNumerosProcessos,
                               '','','','','','','','', iIdCalculo);
     'D' : // Manutencao de Processo para BENEFICIARIO
           AbreRequerPensionista( 'CO',
                                 '-1', '-1', '-1', '-1',
                                 '-1',
                                 DateToStr(date),
                                 sNumerosProcessos);
  end;
end;         

procedure TfrmPrincipal.mnuSimulaRequerimentoClick(Sender: TObject);
var sNumerosProcessos : string;
    iIdCalculo : Integer;
begin
  inherited;
  CriaDataModule;

  If frmTipoBenefConcede = Nil Then
     Application.CreateForm(TfrmTipoBenefConcede, frmTipoBenefConcede);

  with frmTipoBenefConcede do
  begin
     Caption := 'Tipo de Benefício a Simular';
     frmTipoBenefConcede.HelpContext := 160074;
     rgrpTipo.Items.Clear;
     rgrpTipo.Items.Add('Simular Benefícios para o Participante (Titular)');
     rgrpTipo.Items.Add('Simular Benefícios para Beneficiários Diretos do Participante');
     //rgrpTipo.Items.Add('Simular Benefícios para Beneficiários de um Beneficiário');       //edilaine SIG123907
     rgrpTipo.Items.Add('Simular Benefícios para Beneficiário Designado/Herdeiro');          //edilaine SIG123907
     ShowModal;
     case cTipoBeneficio of
        'P' : // Concessao de Beneficio para PARTICIPANTE
              AbreRequerParticip(
                'SI','-1', '-1', '-1', '-1',
                DateToStr(date),'', '-1','',sNumerosProcessos,'',
                '','','','','','','','','',
                '');
        'B' : // Concessao de Beneficio para BENEFICIARIO
               AbreRequerBfciario( 'SI','-1', '-1', '-1', '-1',
                                  DateToStr(date), '-1','',sNumerosProcessos,
                                  '','','','','','','','', iIdCalculo);
        'D' : // Manutencao de Processo para BENEFICIARIO
               AbreRequerPensionista( 'SI',
                                  '-1', '-1', '-1', '-1',
                                  '-1',
                                  DateToStr(date),
                                  sNumerosProcessos);

     end;
  end; // with
end;

procedure TfrmPrincipal.mnuSimulaElegibilidadeClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( frmSimulaBeneficio ,TfrmSimulaBeneficio,false);
end;

procedure TfrmPrincipal.mnuBenefProvLiberaClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( frmLiberaBeneficioProvisorio, TfrmLiberaBeneficioProvisorio, False);
end;

procedure TfrmPrincipal.mnuBenefProvCancelaClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  bRetemEncerraProvisorio := True;
  AbrirFormModal(frmRetemEncerraNovo,TfrmRetemEncerraNovo);
end;

procedure TfrmPrincipal.mnuBenefRetencaoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  bRetemEncerraProvisorio := False;
  AbrirFormModal(frmRetemEncerraNOVO,TfrmRetemEncerraNOVO);
end;

procedure TfrmPrincipal.ReaberturaeProrrogao1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmReaberturaBeneficio, TfrmReaberturaBeneficio, False);
end;

procedure TfrmPrincipal.LiberaodeBenefcioemExigncia1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadInicioBenefExigencia,TfrmCadInicioBenefExigencia,False);
end;

procedure TfrmPrincipal.DesdobramentodeBenefcio1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmDesdobramentoBenef, TfrmDesdobramentoBenef, False);
end;

procedure TfrmPrincipal.ReajusteJudicial1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmReajusteJudicial, TfrmReajusteJudicial, False);
end;

procedure TfrmPrincipal.mnuDesfazerConcessaoBenefClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm( frmDesfazConcessaoBeneficioNOVO, TfrmDesfazConcessaoBeneficioNOVO, False);
end;

procedure TfrmPrincipal.mnuBenefPostoPrismaClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
end;





procedure TfrmPrincipal.CadastrodeBeneficiriosdasMantenedoras1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(FrmCadBeneficiarioPP, TFrmCadBeneficiarioPP, False);
end;





procedure TfrmPrincipal.ManutenodeProcessodoINSS1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmManutReembolsoINSS,TfrmManutReembolsoINSS,false);
end;

procedure TfrmPrincipal.SemcontrapartidadoINSS1Click(Sender: TObject);
begin
  inherited;
  // Chama tela 'A'
  CriaDataModule; 
  AbrirForm(frmCompoeValoresRI_TelaA,TfrmCompoeValoresRI_TelaA,false);
end;





procedure TfrmPrincipal.EntradaManualdeRubricas1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCadRubricaManualCS, TfrmCadRubricaManualCS,False);
end;




procedure TfrmPrincipal.MnuFechamentodeReembolsoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm( FrmEncerraConciliacao,tFrmEncerraConciliacao,False);
end;

procedure TfrmPrincipal.mnuBenefRetroativoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  prmMenuChamadorRetroativo := 'B';
  AbrirFormModal(frmRetroativoPrev, TfrmRetroativoPrev);
end;

procedure TfrmPrincipal.mnuEtiqConfiguraClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCfgEtiqueta,TfrmCfgEtiqueta,False);
end;

procedure TfrmPrincipal.mnuEtiqImprimeClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(FrmEmisEtiq,TFrmEmisEtiq,False);
end;

procedure TfrmPrincipal.ProcessosdeBenefcio1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmConsProcessoBenef,TfrmConsProcessoBenef,False);
end;

procedure TfrmPrincipal.mnuConsMemoriaCalculoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmConsMemoriaCalculo,TfrmConsMemoriaCalculo,false);
end;

procedure TfrmPrincipal.ParticipantedoINSS1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm( FrmConsPartINSS,tFrmConsPartINSS,False);
end;

procedure TfrmPrincipal.RegistrodeOperaes1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  FrmConsLogTotalPREV.ConsultaLogTotalPrev(sistema.idmodulo);
end;

procedure TfrmPrincipal.mnuContribuicoesParticipClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirFormModal(frmCadContribParticipante,TfrmCadContribParticipante);
end;

// edilaine - SOL 253577/17624 / PPM 1007094 - inicio
{
procedure TfrmPrincipal.ContribuiesporNcleoFamiliar1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( frmCadContribNucleoFamiliar, TfrmCadContribNucleoFamiliar, False);
end;

procedure TfrmPrincipal.mnuBenefEntradaManualContribClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadHstContribuicaoBeneficiario, TfrmCadHstContribuicaoBeneficiario, False);
end;
} // edilaine - SOL 253577/17624 / PPM 1007094 - fim

procedure TfrmPrincipal.AlteraodeRecebedordeParticipanteFalecido1Click(
  Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmIndicadorRecebedor, TfrmIndicadorRecebedor, False);
end;

procedure TfrmPrincipal.mnuBenefAlteracaoBeneficioClick(Sender: TObject);
begin
  inherited;                               
  CriaDataModule;
  AbrirForm(frmAlteraBeneficio,TfrmAlteraBeneficio,False);
end;

procedure TfrmPrincipal.MnuConsPart_PadraoClick(Sender: TObject);
var
  ConsPart1: TConsPart;
begin
   inherited;
   try
      Application.CreateForm(TconsPart, Conspart1);
      ConsPart1.sIdPessoa    := '0';
      ConsPart1.sIdPessjur   := '0';
      ConsPart1.sIdPlanoprev := '0';
      ConsPart1.sSeqProposta := '0';
      ConsPart1.DataBaseName := 'BaseDados';
      ConsPart1.MostraConsulta;
   finally
      // ELS SOL 175120 Kintana 1594021
      //FreeAndNil(Conspart1);
   end;
end;

procedure TfrmPrincipal.MnuItReconstruirHistricoINSSClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmReconstruirINSS, TFrmReconstruirINSS, False);
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmReconstruirINSS,TFrmReconstruirINSS, False);
end;

procedure TfrmPrincipal.Relatorios1Click(Sender: TObject);
begin
  CriaDataModule;
  inherited;
end;

//Vinicius Maciel SOL 166779 KTN 1459465
procedure TfrmPrincipal.limpaMenuDinamico(menu :Integer);
begin
  while mnu.Items[1].Items[2].Items[menu].count > 0 Do
  begin
  mnu.Items[1].Items[2].Items[menu].Items[0].Destroy;
  end;
end;
//Vinicius Maciel SOL 166779 KTN 1459465 - FIM



procedure TfrmPrincipal.mnuHistPagBeneficioClick(
  Sender: TObject);
begin
  inherited;
  // Sol 136386/4901 Kintana 1278330 Marcos Merola 11/10
  CriaDataModule;
  AbrirForm(frmConsHistPagBeneficio,TfrmConsHistPagbeneficio,False);
  // Sol 136386/4901 Kintana 1278330 Marcos Merola 11/10
end;

procedure TfrmPrincipal.mnuCadastrodoProcessodeHabilitaoINSSClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadProcHabINSS,TfrmCadProcHabINSS, False);
end;

procedure TfrmPrincipal.mnuRequerimentodeBenefciosdoINSSemLote1Click(
  Sender: TObject);
begin
  inherited;
    AbrirForm(FrmCadRequerBenefInssLote,TFrmCadRequerBenefInssLote, False);//douglas siqueira 3564
end;

procedure TfrmPrincipal.ActLoginExecute(Sender: TObject);
begin
//Vinicius Maciel SOL 166779 KTN 1459465
//Destroi os items de menu dinamicos.
  limpaMenuDinamico(0);
  limpaMenuDinamico(1);
  limpaMenuDinamico(2);
  limpaMenuDinamico(3);
  limpaMenuDinamico(4);
  limpaMenuDinamico(5);
//limpaMenuDinamico(7);
//limpaMenuDinamico(8);
//limpaMenuDinamico(9);
  limpaMenu(14);
  limpaMenu(15);
//Vinicius Maciel SOL 166779 KTN 1459465 - FIM


{   indNivelEventos   =  1;
   indNivelBeneficio =  2;
   indNivelEventoTS  =  0;
   indNivelEventoID  =  2;
   indNivelEventoIN  =  3;
   indNivelEventoFL  =  5;
   indNivelEventoAI  = 14;
   indNivelEventoBI  = 15;}



   {indNivelEventos   =  1;
   indNivelBeneficio =  0;
   indNivelEventoDO  =  0;
   indNivelEventoAC  =  1;
   indNivelEventoTS  =  2;
   indNivelEventoID  =  4;
   indNivelEventoIN  =  5;
   indNivelEventoRC  =  7;
   indNivelEventoFL  =  8;
   indNivelEventoOE  =  9;
   indNivelEventoAI  = 11;
   indNivelEventoBI  = 12;   }

  inherited;
end;

procedure TfrmPrincipal.MnuConcessodeBenefciosdoINSSemLoteClick(
  Sender: TObject);
begin
  inherited;
    AbrirForm(FrmCadConcederBenefInssLote,TFrmCadConcederBenefInssLote, False);//douglas siqueira 3564
end;

//inicio André Oliveira SOL 179724 Kintana 1705112
procedure TfrmPrincipal.mnuConsCargoFuncaoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  Application.CreateForm(TfrmSolicitaPatro, frmSolicitaPatro);
  frmSolicitaPatro.ShowModal;

  liIdPessJurPCS := frmSolicitaPatro.iIdPatroSolicit;
  sNomePatroPCS  := frmSolicitaPatro.sNomePatroSolicit;
  frmSolicitaPatro.Free;

  if liIdPessjurPCS > 0 then
     AbrirForm( frmConsCargoFuncao, TfrmConsCargoFuncao, False);
end;
//fim André Oliveira SOL 179724 Kintana 1705112


procedure TfrmPrincipal.mnuReversodeCotasClick(Sender: TObject);
begin
  inherited;
    AbrirForm(FrmReverCotas,TFrmReverCotas, False);//douglas siqueira 176272
end;

procedure TfrmPrincipal.mnuRenteoeEncerramentoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  bRetemEncerraProvisorio := False;
  AbrirFormModal(frmRetemEncerraNOVO,TfrmRetemEncerraNOVO);
end;

procedure TfrmPrincipal.mnuRenovaoeReaberturaClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmReaberturaBeneficio, TfrmReaberturaBeneficio, False);
end;

procedure TfrmPrincipal.mnuCadastrodoProcessodeHabilitaoClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadProcHabINSS,TfrmCadProcHabINSS, False);
end;
procedure TfrmPrincipal.mnuReconstruodohistricodoINSSClick(
  Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCancelaEvento, TfrmCancelaEvento, False);
end;


procedure TfrmPrincipal.mnuRequerimentodeBenefciosdoINSSemLoteClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadRequerBenefInssLote,TFrmCadRequerBenefInssLote, False);
end;

procedure TfrmPrincipal.mnuLiberaodeBenefcioemExignciaouRetidoClick(
  Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadInicioBenefExigencia,TfrmCadInicioBenefExigencia,False);

end;



procedure TfrmPrincipal.mnuManutenodeProcessosdeBenefciosClick(
  Sender: TObject);
var
  sNumerosProcessos: string;
  cTipoBenef : Char;
  iIdCalculo : Integer;
begin
  inherited;
       CriaDataModule;

  If frmTipoBenefConcede = Nil Then
     Application.CreateForm(TfrmTipoBenefConcede, frmTipoBenefConcede);

  with frmTipoBenefConcede do begin
     Caption := 'Tipo de Benefício Desejado';
     frmTipoBenefConcede.HelpContext := 160071;
     rgrpTipo.Items.Clear;
     rgrpTipo.Items.Add('Manutenção de Benefícios para o Participante (Titular)');
     rgrpTipo.Items.Add('Manutenção de Benefícios para Beneficiários Diretos do Participante');
     //rgrpTipo.Items.Add('Manutenção de Benefícios para Beneficiários de um Beneficiário');        // edilaine - SOL 253577-17404 / PPM 850977
     //rgrpTipo.Items.Add('Manutenção de Benefícios para Herdeiros');                               // edilaine - SOL 253577-17404 / PPM 850977
     rgrpTipo.Items.Add('Manutenção de Benefícios para Beneficiário Designado/Herdeiro');            //edilaine SIG 123907
     ShowModal;
     cTipoBenef := cTipoBeneficio;
    // Free;
  end; // with

  case cTipoBenef of
     'P' : // Manutencao de Processo para PARTICIPANTE
            AbreRequerParticip(
              'MA','-1', '-1', '-1', '-1',
              DateToStr(date),'', '-1','',sNumerosProcessos,'',
              '','','','','','','','','',
              '');
     'B' : // Manutencao de Processo para BENEFICIARIO
            AbreRequerBfciario('MA','-1', '-1', '-1', '-1',
                               DateToStr(date), '-1','',sNumerosProcessos,
                               '','','','','','','','',
                               iIdCalculo);

     'D' : // Manutencao de Processo para BENEFICIARIO
           AbreRequerPensionista( 'MA',
                                 '-1', '-1', '-1', '-1',
                                 '-1',
                                 DateToStr(date),
                                 sNumerosProcessos);
  end;
end;

procedure TfrmPrincipal.limpaMenu(menu: Integer);
begin
  while mnu.Items[1].Items[menu].count > 0 Do
  begin
       mnu.Items[1].Items[menu].Items[0].Destroy;
  end;

end;

procedure TfrmPrincipal.mnuRegistroFalecBenefClick(Sender: TObject);
begin
 inherited;
  CriaDataModule;
  AbrirForm( frmRegFalBenef, TfrmRegFalBenef, False);
end;

procedure TfrmPrincipal.mnuReajusteBenefClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmReajusteBenef, TfrmReajusteBenef, False);
end;

procedure TfrmPrincipal.mnuControledeDvidasdeBenefciosClick(
  Sender: TObject);
begin
  inherited;
   //AbrirForm(FrmCtrlDiviBenef,TFrmCtrlDiviBenef, False); //douglas siqueira SOL 174933 KINTANA 1733374
   AbrirForm(FrmCtrlDiviBenef_Novo,TFrmCtrlDiviBenef_Novo, False); //edilaine SIG33744
end;

procedure TfrmPrincipal.mnuHistricodeDvidasdeBenefciosClick(
  Sender: TObject);
begin
  inherited;
   AbrirForm(FrmHstDividaBenef3,TFrmHstDividaBenef3, False); //douglas siqueira SOL 174933 KINTANA 1733374
end;


//Helio - SOL Nº 228244-16260 PPM Nº 442505
procedure TfrmPrincipal.mnuParamParcDvidaBenefClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmParamDividaBenef,TFrmParamDividaBenef, False);
end;
// Inicio SIG101440 Ferrari
procedure TfrmPrincipal.mnuAlteraodeValoresdeBenefcioemLote1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmAlteraBeneficioLote,TfrmAlteraBeneficioLote, False);

end;
// Fim SIG101440 Ferrari

// Inicio WO13084 Ferrari
procedure TfrmPrincipal.mnuCadastroHistricoPercentualemGrupo1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadHstPercGrupo,TfrmCadHstPercGrupo, False);
end;
// Fim WO13084 Ferrari

Initialization
   Sistema.NomeModulo     := 'BeneficioPrev';    // Nome do Módulo
   Sistema.IdModulo       := 454;           // IdModulo cadastrado no SAD
   Sistema.Versao := '3.00.07b';
   Sistema.NomeAplicativo := 'Benefícios Previdenciários';
   IntegraBack            := TIntegraBack.Create(True,True,True);
   Modulo                 := TModulo.Create;


finalization

   Modulo.Free;
   IntegraBack.Free;




end.
