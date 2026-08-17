unit FPrincipal;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// *****************************************************************************
                        
{-------------------------------------------------------------------------------
Alteração  : AbreFormEventoDM
Nº SIG.....: 92308
Data       : 02/10/2019
Responsável: Fábio Sampaio
Descrição..: Correção para usar as variaveis sIdEventoGerador e sFlgInterno
             da UAdmPrev
-------------------------------------------------------------------------------
Alteração  : mnuPrevCClick
Nº SOL.....: 207951/18304
KTN / PPM  : -
Data       : 15/07/2016
Responsável: Felipe Azevedo dos Santos
Descrição..: Criação da funcionalidade Consultas -> Prev,C.
-------------------------------------------------------------------------------
Alteração  : AbreFormEventoCI
Nº SOL.....: 271518
KTN / PPM  : 1368136
Data       : 08/04/2016
Responsável: William Moreira da Silva
Descrição..: Alteração no evento de cancelamento por inadimplência
-------------------------------------------------------------------------------
Alteração  : AbreFormEventoFL, AbreFormEventoBI, AbreFormEventoTS, AbreFormEventoID,
             AbreFormEventoCP, AbreFormEventoCD, AbreFormEventoIN, AbreFormEventoOE
Nº SOL.....: 253577-18129
KTN / PPM  : 1303078
Data       : 03/03/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - separação das interfaces
--------------------------------------------------------------------------------}
//Autor(a)    : Higor Nayde Ferreira
//Data        : 09/06/2014
//Pendência   : SOL 201318 KINTANA 1958253
//Descricao   : Validação para Bloqueio de campos do IR.
//-------------------------------------------------------------------------------------------------
//Pendência   : SOL 242983 PPM 581156
//Responsável : Marcio Sanches Spinosa SOL 242983 PPM 581156            
//Data        : 17/11/2014
//Descrição   : Ajuste de erro de versão.
//--------------------------------------------------------------------------------
// Autor(a)    : Higor Nayde Ferreira
// Data        : 09/07/2014
// Pendência   : SOL 213547/15854 Kintana 2061373
// Alteração   : Transferencia de menu do módulo Funcef para Cadastro
// *****************************************************************************
// Autor(a)    : Higor Nayde Ferreira
// Data        : 02/04/2013
// Pendência   : SOL 84337 Kintana 525168
// Alteração   : SPC\Gerar Arquivo para SPC - MAPA PREVIC
// *****************************************************************************
// Autor(a)    : Felipe Azevedo dos Santos
// Data        : 29/10/2013
// Pendência   : SOL 200445 KTN 1943221
// Alteração   : inclusão do menu "Cadastros / conta bancária em lote".
// *****************************************************************************
// Autor(a)    : Felipe A. Santos
// Data        : 14/11/2013
// Pendência   : SOL 201126 Kintana 1947118
// Alteração   : Criação do menu Manutenção/ Solicitação de conta salário.
// *****************************************************************************
// Autor(a)    : Higor Nayde Ferreira
// Data        : 08/07/2013
// Pendência   : SOL 200950 Kintana 1952039
// Alteração   : Solicitamos transferência de todas as funcionalidades do
//               menu "Eventos" do módulo do Benefícioprev para o Cadastroprev
// *****************************************************************************
// Autor(a)    : Otacilio Aquino
// Data        : 18/09/2012
// Pendência   : SOL 190491 Kintana 1801489
// Alteração   : Erro ao abrir consulta geral de pessoas
// *****************************************************************************
// Autor(a)    : Fanuel Junior
// Data        : 05/04/2012
// Pendência   : SOL 167842 Kintana 1483724
// Alteração   : Alteração de funcionalidade para o módulo CadastroPrev
// *****************************************************************************
// Autor(a)    : Fernando Santana
// Data        : 10/09/2010
// Pendência   : SOL 131787 Kintana 753270
// Alteração   : Criação da funcionalidade "Envio de`Periódico"
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 12/07/2010
// Pendência   : SOL 127062 Kintana 670853
// Alteração   : Criação da funcionalidade "Inscricao Participante em Lote"
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 05/04/2010
// Pendência   : SOL 127144 Kintana 670910
// Alteração   : Criaçã da funcionalidade "Alteração de Percentual de Contribuição em Lote"
//------------------------------------------------------------------------------
// Autor(a)    : Jéssica Lana
// Rotina      : Varias
// Data        : 04/02/2009
// Pendência   : 130362
// Alteração   : Correção do erro ao abrir o frm de cadastro de evolução funcional.
//------------------------------------------------------------------------------
// Autor(a)    : Ádler Souza
// Rotina      : Cadastro de Evolução funcional
// Pendência   : SOL 121368 Kintana 589276
// Data        : 14/07/2009
// Descrição   : Alterações nas propriedades da tela e ao chamar o form.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 23/06/2009
// Pendência   : SOL 116.572 -  KINTANA 547.247
// Rotina      : Cadastro de Histórico de Evolução Funcional
// Descricao   : Alteração de propriedades da tela para não maximizar
//------------------------------------------------------------------------------
// Autor(a)    : Jéssica Lana Nunes dos Santos
// Data        : 05/03/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   : Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 09/05/2007
// Pendência   : 26825
// Rotina      : AppPadraoConfigReportPadrao, AppPadraoPrintReportPadrao
// Descricao   : Ajuste no Relatório de Tempo de Serviço
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 09/05/2007
// Pendência   : 25264
// Rotina      : ---
// Descricao   : Retirar o botão de Atalho para Cadastros de Pessoa
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  StdCtrls, TB97, Db, DBTables, Wwquery, Wwdatsrc, wwdblook, Mask, wwdbedit,
  DBCtrls, MontaSelect, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio,
  IvAMulti, IvBinDic, IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts,
  CMApplicationEvents, StdActns, ActnList, ImgList, fcStatusBar,
  SConnect, MConnect, DBClient, UConsPart, uResource, JclFileUtils,  FIndicadorRecebedor,
  CMNetUsers, FConsEnderGeral, wwstorep;

const
   indNivelEventos          = 1;


   //   indNivelEventos   =  1;
   indNivelBeneficio =  0;
    //   indNivelEventoDO  =  0;
    //   indNivelEventoAC  =  1;
       indNivelEventoTS  =  0;
       indNivelEventoID  =  2;
       indNivelEventoIN  =  3;
    //   indNivelEventoRC  =  7;
       indNivelEventoFL  =  5;
       indNivelEventoOE  =  6;
       indNivelEventoAI  = 8;
       indNivelEventoBI  = 9;

   indNivelCadastrais     = 2;

       indNivelEventoIP     = 0;
       indNivelEventoRM     = 1;
       indNivelEventoMP     = 2;
       indNivelEventoRA     = 3;
       indNivelTranferencia = 4;

         indNivelEventoTR   = 0;
         indNivelEventoTP   = 1;
         indNivelEventoTE   = 2;

     indNivelAfastamento    = 3;

       indNivelEventoAF     = 0;
       indNivelEventoAR     = 1;

     indNivelDemissao       = 4;

       indNivelEventoDP     = 0;
       indNivelEventoDC     = 1;
       indNivelEventoDM     = 2;
       indNivelEventoDS     = 3;
       indNivelEventoDA     = 4;
       indNivelEventoPD     = 5;

     indNivelCalncelamento  = 5;

       indNivelEventoCP     = 0;
       indNivelEventoCD     = 1;
       indNivelEventoCI     = 2;








type

  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuCadResponsavel: TMenuItem;
    mnuCadElegiveis: TMenuItem;
    N21: TMenuItem;
    mnuEventos: TMenuItem;
    mnuEventoAfastManut: TMenuItem;
    mnuEventoCancelIniciativa: TMenuItem;
    mnuEventoDemissManut: TMenuItem;
    mnuEventoDemisManutSaldo: TMenuItem;
    mnuEventoCancelInadimpl: TMenuItem;
    qryAux: TwwQuery;
    mnuCadDependente: TMenuItem;
    RegistrodeEventos1: TMenuItem;
    MontaSelectPart: TMontaSelect;
    MontaSelectPatro: TMontaSelect;
    mnuEventoTransfPlano: TMenuItem;
    HistricoFuncional1: TMenuItem;
    mnuEventoRetornoAtivo: TMenuItem;
    mnuEventoInscricao: TMenuItem;
    mnuEventoReinscricao: TMenuItem;
    mnuEventoCancelDescump: TMenuItem;
    CancelarEventoRegistrado1: TMenuItem;
    mnuEventoManutPDV: TMenuItem;
    mnuEventoAfastSemManut: TMenuItem;
    EmissodeCartasparaRecadastramento1: TMenuItem;
    RecebimentodeRecadastramento1: TMenuItem;
    RetenoporFaltadeRecadastramento1: TMenuItem;
    N31: TMenuItem;
    N10: TMenuItem;
    Etiquetas1: TMenuItem;
    mnuEtiqConfigura: TMenuItem;
    mnuEtiqImprime: TMenuItem;
    ContaBancria1: TMenuItem;
    mnuHistFuncAntesPatro: TMenuItem;
    mnuEvolFuncPart: TMenuItem;
    mnuRegistroFalecBenef: TMenuItem;
    RegistrodeOperaes1: TMenuItem;
    DemissodaPatrocinadora1: TMenuItem;
    mnuConsCargoFuncao: TMenuItem;
    N1: TMenuItem;
    mnuRubricas1: TMenuItem;
    mnuEventoTransfPatro: TMenuItem;
    mnuCadDepenCadastro: TMenuItem;
    mnuCadDepenCancelamento: TMenuItem;
    mnuEventoTransfReserva: TMenuItem;
    mnuEventoTransferencias: TMenuItem;
    N37: TMenuItem;
    mnuExtDelisg: TMenuItem;
    mnuConfExtDeslig: TMenuItem;
    mnuImpExtDeslig: TMenuItem;
    Cadastrais1: TMenuItem;
    AfastamentodaEmpresa1: TMenuItem;
    DemissodaEmpresa1: TMenuItem;
    DemissodaFundao1: TMenuItem;
    Manuteno1: TMenuItem;
    mnuEventoDemissAposent: TMenuItem;
    mnuContribuicoesParticip: TMenuItem;
    AlteraodePDV1: TMenuItem;
    mnuParticCalculaTempoServicoLote: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    mnuAssociacaodeReservas: TMenuItem;
    mnuEventoManutParcial: TMenuItem;
    mnuEventoDemissCancel: TMenuItem;
    MnuSimulaEnquadramento: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    mnuEntradaManualRubrica: TMenuItem;
    mnuAltPercLote: TMenuItem;
    mnuEnviodePeridico: TMenuItem;
    mnuAlteraodeRecebedordeParticipante: TMenuItem;
    ConsultaGeraldeEndereos1: TMenuItem;
    Eve1: TMenuItem;
    mnuEventoTempoServ: TMenuItem;
    mnuEventoIdade: TMenuItem;
    mnuEventoIncapacidade: TMenuItem;
    mnuEventoFalecimento: TMenuItem;
    mnuEventoOutrosTemp: TMenuItem;
    mnuEventoINSSPart: TMenuItem;
    mnuEventoINSSBenef: TMenuItem;
    _: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    mnuRequerimentodeBenefciosdoINSSemLote: TMenuItem;
    N14: TMenuItem;
    mnuSolContaSal: TMenuItem;
	mnuCadContaEmLote: TMenuItem;
    mnuMapaPevic: TMenuItem;
    mnuBloqueioIR: TMenuItem;
    NovoPlano2: TMenuItem;
    MnuItPreparo: TMenuItem;
    NovasinscrieseativosReplan1: TMenuItem;
    N15: TMenuItem;
    MnuSaldamentoDeAtivos: TMenuItem;
    N16: TMenuItem;
    MnuSaldamentoDeAposentados: TMenuItem;
    a: TMenuItem;
    MnuSaldamentoDePensionistas: TMenuItem;
    N17: TMenuItem;
    MnuDesfazerSaldamento: TMenuItem;
    MnuItExecImportaReserva: TMenuItem;
    mnuPrevC: TMenuItem;
    mnuAlterarEvento: TMenuItem;

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AppPadraoShowParamReportPadrao(sender: TObject; IdReports: Integer; var sParams: String;
                                             var PrintReport: Boolean);
    procedure fcLabel2Click(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);

    procedure CancelarEventoRegistrado1Click(Sender: TObject);
    procedure EmissodeCartasparaRecadastramento1Click(Sender: TObject);
    procedure RecebimentodeRecadastramento1Click(Sender: TObject);
    procedure RetenoporFaltadeRecadastramento1Click(Sender: TObject);
    procedure mnuRegistroFalecBenefClick(Sender: TObject);
    procedure mnuCadElegiveisClick(Sender: TObject);
    procedure mnuCadDepenCadastroClick(Sender: TObject);
    procedure mnuCadDepenCancelamentoClick(Sender: TObject);
    procedure mnuCadResponsavelClick(Sender: TObject);
    procedure ContaBancria1Click(Sender: TObject);
    procedure mnuHistFuncAntesPatroClick(Sender: TObject);
    procedure mnuEvolFuncPartClick(Sender: TObject);
    procedure mnuContribuicoesParticipClick(Sender: TObject);
    procedure AlteraodePDV1Click(Sender: TObject);
    procedure mnuParticCalculaTempoServicoLoteClick(Sender: TObject);
    procedure mnuAssociacaodeReservasClick(Sender: TObject);
    procedure ActLoginExecute(Sender: TObject);
    procedure mnuEtiqImprimeClick(Sender: TObject);
    procedure mnuEtiqConfiguraClick(Sender: TObject);
    procedure mnuConfExtDesligClick(Sender: TObject);
    procedure mnuImpExtDesligClick(Sender: TObject);
    procedure mnuRubricas1Click(Sender: TObject);
    procedure mnuConsCargoFuncaoClick(Sender: TObject);
    procedure RegistrodeOperaes1Click(Sender: TObject);
    procedure RegistrodeEventos1Click(Sender: TObject);
    procedure MnuSimulaEnquadramentoClick(Sender: TObject);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure MnuConsPart_PadraoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure mnuAltPercLoteClick(Sender: TObject);
    procedure mnuEnviodePeridicoClick(Sender: TObject);
    procedure mnuAlteraodeRecebedordeParticipanteClick(Sender: TObject);
	procedure ConsultaGeraldeEndereos1Click(Sender: TObject);
    procedure mnuRequerimentodeBenefciosdoINSSemLoteClick(Sender: TObject);
    procedure mnuSolContaSalClick(Sender: TObject);
	procedure mnuCadContaEmLoteClick(Sender: TObject);
    procedure mnuMapaPevicClick(Sender: TObject);
    procedure mnuBloqueioIRClick(Sender: TObject);
    procedure NovasinscrieseativosReplan1Click(Sender: TObject);
    procedure MnuItPreparoClick(Sender: TObject);
    procedure MnuSaldamentoDeAtivosClick(Sender: TObject);
    procedure MnuSaldamentoDeAposentadosClick(Sender: TObject);
    procedure MnuSaldamentoDePensionistasClick(Sender: TObject);
    procedure MnuDesfazerSaldamentoClick(Sender: TObject);
    procedure MnuItExecImportaReservaClick(Sender: TObject);
    procedure mnuPrevCClick(Sender: TObject);
    procedure mnuAlterarEventoClick(Sender: TObject);

  private
    { Private declarations }

    procedure AbreFormEventoIP(Sender: TObject);
    procedure AbreFormEventoRM(Sender: TObject);
    procedure AbreFormEventoRA(Sender: TObject);
    procedure AbreFormEventoTR(Sender: TObject);
    procedure AbreFormEventoTP(Sender: TObject);
    procedure AbreFormEventoTE(Sender: TObject);
    procedure AbreFormEventoAF(Sender: TObject);
    procedure AbreFormEventoAR(Sender: TObject);
    procedure AbreFormEventoDP(Sender: TObject);
    procedure AbreFormEventoDC(Sender: TObject);
    procedure AbreFormEventoDM(Sender: TObject);
    procedure AbreFormEventoDS(Sender: TObject);
    procedure AbreFormEventoDA(Sender: TObject);
    procedure AbreFormEventoMP(Sender: TObject);
    procedure AbreFormEventoCI(Sender: TObject);
    procedure AbreFormEventoCP(Sender: TObject);
    procedure AbreFormEventoCD(Sender: TObject);

    procedure AbreFormDesfazerEvento(Sender: TObject);
    procedure AbreFormProrrogarEvento(Sender: TObject);

    procedure AbreInscricaoLote(Sender: TObject);// Renato Visoni SOL 127062


    procedure MontaMenu;
    procedure verifica_situacao_empresa;
    procedure CriaDataModule;

    // Higor Nayde Ferreira SOL 200950 Ktn 1952039 Incio
    procedure AbreFormEventoTS(Sender: TObject);
    procedure AbreFormEventoID(Sender: TObject);
    procedure AbreFormEventoIN(Sender: TObject);
    procedure AbreFormEventoFL(Sender: TObject);
    procedure AbreFormEventoOE(Sender: TObject);
    procedure AbreFormEventoAI(Sender: TObject);
    procedure AbreFormEventoBI(Sender: TObject);
    // Higor Nayde Ferreira SOL 200950 Ktn 1952039 FIM
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

uses DBaseDados, uAutorizacao, FTelaAut, USistema, UModulo, UIntegraBack,
     UAdmPrev, UMensErro, uCtrlParamIntegra,
     FCancelaEvento, FEmissaoRecadastramento, FRecebeRecadastramento,
     FRecebeRecadTXT, FSuspendeBeneficio, FRegFalBenef, FCadDepenBenef,
     FCancelaDependente, FCadResponsa, FCadContaBanco, fCadHistFuncPartCS,
     FCadEvolFuncPrev, FTipoBenefConcede, FCadElegivel,
     FPRelHisFuncionalMT, uCmCtrlReports,
     FEventoReinscricao, FEventoRetornoMantidoParaAtivo, FEventoTransfReserva,
     FEventoAfastamento, FEventoAfastSemRemun, FEventoDemissaoPatrocinadora,
     FEventoDemissaoManutContrib, FEventoDemissaoManutSaldo,
     FEventoDemissaoCancel, {FEventoRegInadimplencia,}FEventoRegInadimplencia_Cadastro, FEventoCancelInicia,
     FDesfazerEvento, FEventoProrrogacao, DRelatAdmPrev, dRelRetroRegional,
     DRelatGerencial, DRelatAdmPREV2, DRelTempoServicoMT, DRelatEspecificos,
     DRelTransfPlano, DRelatorios, uDataBase, FEventoTransfPlanoNOVO,
     FEventoTransfPlano, fTransfPatroBatch, dAprev, FCadContribParticipante,
     FCadAlteraPdv, FCalculaTempoServicoLote, FAssocReservaPart, fEmisEtiq,
     FCfgEtiqueta, FConfSimulaDeslig, FParamRelExtratoDeslig,
     FEventoManutParcial, FConsRubricas, FSolicitaPatro, FConsCargoFuncao,
     FConsLogTotalPREV, FConsEventosPrev, FSimulacaoEnquadramento, FCadRubricaManualCS,
     uCmCtrlRpt, uAltPercContribLote,FInscricaoParticipanteLote,fEnvioPeriodico,
     FEventoMorte, FEventoAssistido,FEventoAposentadoria,
     FEventoReclusao,FEventoAssistidoINSS,FCadRequerBenefInssLote,
     FSolContaSal {// Felipe A. Santos}, FCadContaEmLote {Felipe A. Santos},
     FMapaPrevi{Higor Nayde SOL84337},FBloqueioIR,
     fInscricaoNovoPlano,FPreparoSaldamento,FSeparadorArqFinanc,
     FSaldamento,FCancSaldamento,FExecImportaReserva, FPrevC, FAlteraEvento;
     {Higor Nayde SOL21354715854}
{$R *.DFM}

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

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
Var
  X, Y, Z, NumItems, NumSubItens :Integer;
begin
  inherited;

  if not(Sistema.FezLogin) then Exit;

  stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;

  try

    if Sistema.MudouEmpresa then ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB','PARAMCAP',tiCAP);

    Verifica_Situacao_Empresa;

    iIdFundacao      := Sistema.IdEmpresa;
    iIdFundacaoAtual := Sistema.IdEmpresa;

    prmNumTentativasSalario    := 36;
    LeParam('BaseDados', True);
    MudaCaptionFundacao(Sender);

  finally
    MontaMenu;
    MontaSelectPatro.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
    MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
  end;
end;



procedure TfrmPrincipal.MontaMenu;
var
  NovoItem, ItemAtual : TMenuItem;
  iCont               : integer;
  ComponentAtual      : TComponent;
begin
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
                    ' WHERE FLGINTERNO = ''FL'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' ORDER BY NOME ');
     qryAux.Open;
     qryAux.First;
     iCont := 0;
     while not qryAux.EOF do
        begin
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

  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoOE].Name);

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
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoAI].Name);

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
       NovoItem := TMenuItem.Create(Self);
       NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
       NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
       NovoItem.OnClick := AbreFormEventoAI;
       mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoAI].Insert(iCont, NovoItem);

      Inc(iCont);
      qryAux.Next;
     end;
  end;
  {Fim - Monta Menu Beneficio do INSS para Participante - AI}

  { Monta Menu Beneficio do INSS para Beneficiario - BI }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoBI].Name);

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
             NovoItem := TMenuItem.Create(Self);
             NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
             NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
             NovoItem.OnClick := AbreFormEventoBI;
             mnu.Items[indNivelEventos].Items[indNivelBeneficio].Items[indNivelEventoBI].Insert(iCont, NovoItem);

            Inc(iCont);
            qryAux.Next;
        end;
  end;
  {Fim - Monta Menu Beneficio do INSS para Beneficiario - BI}
  { Monta menu inscrição do participante - IP }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelCadastrais].Items[indNivelEventoIP].Name);
  If (ComponentAtual As TMenuItem).Enabled Then
  Begin

     FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                       'WHERE FLGINTERNO = ''IP'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+'  '+
                       'ORDER BY NOME ' );

     iCont := 0;

     while not qryAux.EOF do
     begin
         NovoItem         := TMenuItem.Create(Self);

         NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
         NovoItem.Name    := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
         NovoItem.OnClick := AbreFormEventoIP;
         NovoItem.Tag     := -1;
         //Brunno Mattos - SOL 157980 - KTN 1269651 Inicio
         if (qryAux.FieldByName('NOME').AsString = 'Reversão Aposentadoria - Inscrição Novo Plano') then
         begin
           NovoItem.Enabled := False;
         end;
         //Brunno Mattos - SOL 157980 - KTN 1269651 Fim

         mnu.Items[indNivelEventos].Items[indNivelCadastrais].Items[indNivelEventoIP].Insert(iCont, NovoItem);

         Inc(iCont);
         qryAux.Next;
     end;
     //Inscrição Participante em Lote
     //Renato Visoni SOL 127062
     NovoItem         := TMenuItem.Create(Self);
     NovoItem.Caption := 'Inscrição em Lote';
     NovoItem.Name    := 'mnuInscricaoLote';
     NovoItem.OnClick := AbreInscricaoLote;
     mnu.Items[indNivelEventos].Items[indNivelCadastrais].Items[indNivelEventoIP].Insert(iCont, NovoItem);
     NovoItem.Tag     := -1;
     //Renato Visoni SOL 127062
  End;

  { Monta Menu ReInscrição do Participante - RM }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelCadastrais].Items[indNivelEventoRM].Name);
  If (ComponentAtual As TMenuItem).Enabled Then
  Begin

    FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                       'WHERE FLGINTERNO = ''RM'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+ '  ' +
                       'ORDER BY NOME ');
    iCont := 0;

    while not qryAux.EOF do
    begin
      NovoItem := TMenuItem.Create(Self);

      NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
      NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormEventoRM;
      mnu.Items[indNivelEventos].Items[indNivelCadastrais].Items[indNivelEventoRM].Insert(iCont, NovoItem);

      Inc(iCont);
      qryAux.Next;
    end;

  End;

  { Monta Menu Manutenção Parcial - MP }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelCadastrais].Items[indNivelEventoMP].Name);
  if (ComponentAtual As TMenuItem).Enabled
  then begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                    ' WHERE FLGINTERNO = ''MP'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+
                    ' ORDER BY NOME ');
     qryAux.Open;
     qryAux.First;
     iCont := 0;
     while not qryAux.EOF do
     begin
       NovoItem := TMenuItem.Create(Self);
       NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
       NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
       NovoItem.OnClick := AbreFormEventoMP;
       mnu.Items[indNivelEventos].Items[indNivelCadastrais].Items[indNivelEventoMP].Insert(iCont, NovoItem);
       
       Inc(iCont);
       qryAux.Next;
     end;

  end;

  { Monta Menu Retorno de Mantido Para Ativo - RA }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelCadastrais].Items[indNivelEventoRA].Name);
  If (ComponentAtual As TMenuItem).Enabled Then
  Begin

    FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                      'WHERE FLGINTERNO = ''RA'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
                      'ORDER BY NOME ' );
    iCont := 0;
    while not qryAux.EOF do
    begin
      NovoItem := TMenuItem.Create(Self);
      NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
      NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormEventoRA;
      mnu.Items[indNivelEventos].Items[indNivelCadastrais].Items[indNivelEventoRA].Insert(iCont, NovoItem);

      Inc(iCont);
      qryAux.Next;
    end;

  end;


  { Monta Menu Transferência de Reserva - TR }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelCadastrais].Items[indNivelTranferencia].Items[indNivelEventoTR].Name);
  If (ComponentAtual As TMenuItem).Enabled Then
  Begin
    FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                      'WHERE FLGINTERNO = ''TR'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
                      'ORDER BY NOME ' );
    qryAux.Open;
    qryAux.First;
    iCont := 0;
    while not qryAux.EOF do
    begin
      NovoItem := TMenuItem.Create(Self);

      NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
      NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormEventoTR;
      mnu.Items[indNivelEventos].Items[indNivelCadastrais].Items[indNivelTranferencia].Items[indNivelEventoTR].Insert(iCont, NovoItem);

      Inc(iCont);
      qryAux.Next;
    end;
  End;


  { Monta Menu Transferência de Plano - TP }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelCadastrais].Items[indNivelTranferencia].Items[indNivelEventoTP].Name);
  If (ComponentAtual As TMenuItem).Enabled Then
  Begin
    FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                      'WHERE FLGINTERNO = ''TP'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
                      'ORDER BY NOME ');
     iCont := 0;
     while not qryAux.EOF do
     begin
       NovoItem := TMenuItem.Create(Self);

       NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
       NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
       NovoItem.OnClick := AbreFormEventoTP;
       mnu.Items[indNivelEventos].Items[indNivelCadastrais].Items[indNivelTranferencia].Items[indNivelEventoTP].Insert(iCont, NovoItem);

       Inc(iCont);
       qryAux.Next;
     end;
  End;


  { Monta Menu Transferência de Patro - TE }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelCadastrais].Items[indNivelTranferencia].Items[indNivelEventoTE].Name);
  If (ComponentAtual As TMenuItem).Enabled Then
  Begin
    FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                      'WHERE FLGINTERNO = ''TE'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
                      'ORDER BY NOME ');
    iCont := 0;
    while not qryAux.EOF do
    begin
      NovoItem := TMenuItem.Create(Self);

      NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
      NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormEventoTE;
       mnu.Items[indNivelEventos].Items[indNivelCadastrais].Items[indNivelTranferencia].Items[indNivelEventoTE].Insert(iCont, NovoItem);

      Inc(iCont);
      qryAux.Next;
    end;
  End;


  { Monta Menu Afastamento - AF }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelAfastamento].Items[indNivelEventoAF].Name);
  If (ComponentAtual As TMenuItem).Enabled Then
  Begin
    FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                      'WHERE FLGINTERNO = ''AF'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
                      'ORDER BY NOME ' );
    iCont := 0;
    while not qryAux.EOF do
    begin
      NovoItem := TMenuItem.Create(Self);

      NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
      NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormEventoAF;
      mnu.Items[indNivelEventos].Items[indNivelAfastamento].Items[indNivelEventoAF].Insert(iCont, NovoItem);

      Inc(iCont);
      qryAux.Next;
    end;

    if qryAux.RecordCount <> 0  then
    begin
      NovoItem := TMenuItem.Create(Self);
      NovoItem.Caption := '-';
      mnu.Items[indNivelEventos].Items[indNivelAfastamento].Items[indNivelEventoAF].Insert(iCont, NovoItem);

      Inc(iCont);
      NovoItem := TMenuItem.Create(Self);
      NovoItem.Caption := 'Retorno';
      NovoItem.Name := 'D' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormDesfazerEvento;
      mnu.Items[indNivelEventos].Items[indNivelAfastamento].Items[indNivelEventoAF].Insert(iCont, NovoItem);

      Inc(iCont);
      NovoItem := TMenuItem.Create(Self);
      NovoItem.Caption := '-';
      mnu.Items[indNivelEventos].Items[indNivelAfastamento].Items[indNivelEventoAF].Insert(iCont, NovoItem);

      Inc(iCont);
      NovoItem := TMenuItem.Create(Self);
      NovoItem.Caption := 'Prorrogação do Evento - '+'Afastamento';
      NovoItem.Name    := 'P' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormProrrogarEvento;
      mnu.Items[indNivelEventos].Items[indNivelAfastamento].Items[indNivelEventoAF].Insert(iCont, NovoItem);

    end;
  End;


  { Monta Menu Afastamento - AR }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelAfastamento].Items[indNivelEventoAR].Name);
  If (ComponentAtual As TMenuItem).Enabled Then
  Begin
    FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                      'WHERE FLGINTERNO = ''AR'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
                      'ORDER BY NOME ' );
    iCont := 0;
    while not qryAux.EOF do
    begin
      NovoItem := TMenuItem.Create(Self);
      NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
      NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormEventoAR;
      mnu.Items[indNivelEventos].Items[indNivelAfastamento].Items[indNivelEventoAR].Insert(iCont, NovoItem);

      Inc(iCont);
      qryAux.Next;
    end;

    if qryAux.RecordCount <> 0  then
    begin
      NovoItem := TMenuItem.Create(Self);
      NovoItem.Caption := '-';
      mnu.Items[indNivelEventos].Items[indNivelAfastamento].Items[indNivelEventoAR].Insert(iCont, NovoItem);

      Inc(iCont);
      NovoItem := TMenuItem.Create(Self);
      NovoItem.Caption := 'Retorno';
      NovoItem.Name := 'D' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormDesfazerEvento;
      mnu.Items[indNivelEventos].Items[indNivelAfastamento].Items[indNivelEventoAR].Insert(iCont, NovoItem);

      Inc(iCont);
      NovoItem := TMenuItem.Create(Self);
      NovoItem.Caption := '-';
      mnu.Items[indNivelEventos].Items[indNivelAfastamento].Items[indNivelEventoAR].Insert(iCont, NovoItem);

      Inc(iCont);
      NovoItem := TMenuItem.Create(Self);
      NovoItem.Caption := 'Prorrogação do Evento - '+'Afastamento sem Remuneração';
      NovoItem.Name    := 'P' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormProrrogarEvento;
      mnu.Items[indNivelEventos].Items[indNivelAfastamento].Items[indNivelEventoAR].Insert(iCont, NovoItem);

    end;
  End;


  { Monta Menu Demissão com Cancelamento - DP }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelDemissao].Items[indNivelEventoDP].Name);
  If (ComponentAtual As TMenuItem).Enabled
  Then Begin
    FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                      'WHERE FLGINTERNO = ''DP'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
                      'ORDER BY NOME ');
    iCont := 0;
    while not qryAux.EOF do
    begin
      NovoItem := TMenuItem.Create(Self);

      NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
      NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormEventoDP;
      mnu.Items[indNivelEventos].Items[indNivelDemissao].Items[indNivelEventoDP].Insert(iCont, NovoItem);

      Inc(iCont);
      qryAux.Next;
    end;

  end;

  { Monta Menu Demissão com Cancelamento - DC }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelDemissao].Items[indNivelEventoDC].Name);
  if (ComponentAtual As TMenuItem).Enabled
  then begin
   FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                      'WHERE FLGINTERNO = ''DC'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
                      'ORDER BY NOME ' );
     iCont := 0;
     while not qryAux.EOF do
     begin
       NovoItem := TMenuItem.Create(Self);
       NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
       NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
       NovoItem.OnClick := AbreFormEventoDC;
       mnu.Items[indNivelEventos].Items[indNivelDemissao].Items[indNivelEventoDC].Insert(iCont, NovoItem);

       Inc(iCont);
       qryAux.Next;
     end;

  end;

  { Monta Menu Demissão com Manutenção de Contribuição - DM }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelDemissao].Items[indNivelEventoDM].Name);
  If (ComponentAtual As TMenuItem).Enabled
  Then begin
    FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                      'WHERE FLGINTERNO = ''DM'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
                      'ORDER BY NOME ' );
    iCont := 0;
    while not qryAux.EOF do
    begin
      NovoItem := TMenuItem.Create(Self);

      NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
      NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormEventoDM;
      mnu.Items[indNivelEventos].Items[indNivelDemissao].Items[indNivelEventoDM].Insert(iCont, NovoItem);

      Inc(iCont);
      qryAux.Next;
    end;
  End;


  { Monta Menu Demissão com Manutenção de Saldo de Conta - DS }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelDemissao].Items[indNivelEventoDS].Name);
  If (ComponentAtual As TMenuItem).Enabled Then
  Begin
    FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                      'WHERE FLGINTERNO = ''DS'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
                      'ORDER BY NOME ' );
    iCont := 0;
    while not qryAux.EOF do
    begin
      NovoItem := TMenuItem.Create(Self);

      NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
      NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormEventoDS;
      mnu.Items[indNivelEventos].Items[indNivelDemissao].Items[indNivelEventoDS].Insert(iCont, NovoItem);

      Inc(iCont);
      qryAux.Next;
    end;
  End;

  { Monta Menu Demissão PARA APOSENTADORA - DA }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelDemissao].Items[indNivelEventoDA].Name);
  If (ComponentAtual As TMenuItem).Enabled Then
  Begin
    FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                      'WHERE FLGINTERNO = ''DA'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
                      'ORDER BY NOME ');
    iCont := 0;
    while not qryAux.EOF do
    begin
      NovoItem := TMenuItem.Create(Self);

      NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
      NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormEventoDA;
      mnu.Items[indNivelEventos].Items[indNivelDemissao].Items[indNivelEventoDA].Insert(iCont, NovoItem);

      Inc(iCont);
      qryAux.Next;
    end;
  End;

 {Monta Menu Programa de Incentivo - PD}
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelDemissao].Items[indNivelEventoPD].Name);
  if (ComponentAtual As TMenuItem).Enabled
  then begin
    FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                      'WHERE FLGINTERNO = ''PD'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
                      'ORDER BY NOME ');
    iCont := 0;
    while not qryAux.EOF do
    begin
      NovoItem := TMenuItem.Create(Self);
      NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
      NovoItem.Name    := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormEventoDM;
      mnu.Items[indNivelEventos].Items[indNivelDemissao].Items[indNivelEventoPD].Insert(iCont, NovoItem);

      Inc(iCont);
      qryAux.Next;
    end;

  end;

  { Monta Menu Cancelamento por Iniciativa do Participante - CP }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelCalncelamento].Items[indNivelEventoCP].Name);
  If (ComponentAtual As TMenuItem).Enabled Then
  Begin
     FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                       'WHERE FLGINTERNO = ''CP'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
                       'ORDER BY NOME ' );
     iCont := 0;
     while not qryAux.EOF do
     begin
       NovoItem := TMenuItem.Create(Self);

       NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
       NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
       NovoItem.OnClick := AbreFormEventoCP;
       mnu.Items[indNivelEventos].Items[indNivelCalncelamento].Items[indNivelEventoCP].Insert(iCont, NovoItem);

       Inc(iCont);
       qryAux.Next;
     end;

     if qryAux.RecordCount <> 0  then
     begin
       NovoItem := TMenuItem.Create(Self);

       NovoItem.Caption := '-';
       mnu.Items[indNivelEventos].Items[indNivelCalncelamento].Items[indNivelEventoCP].Insert(iCont, NovoItem);

       Inc(iCont);
       NovoItem := TMenuItem.Create(Self);
       NovoItem.Caption := 'Retorno';
       NovoItem.Name := 'D' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
       NovoItem.OnClick := AbreFormDesfazerEvento;
       mnu.Items[indNivelEventos].Items[indNivelCalncelamento].Items[indNivelEventoCP].Insert(iCont, NovoItem);
     end;
  End;


  { Monta Menu Descumprimento de Prazo - CD }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelCalncelamento].Items[indNivelEventoCD].Name);
  If (ComponentAtual As TMenuItem).Enabled Then
  Begin

     FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                       'WHERE FLGINTERNO = ''CD'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
                       'ORDER BY NOME ' );
     iCont := 0;
     while not qryAux.EOF do
     begin
       NovoItem := TMenuItem.Create(Self);

       NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
       NovoItem.Name    := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
       NovoItem.OnClick := AbreFormEventoCD;
       mnu.Items[indNivelEventos].Items[indNivelCalncelamento].Items[indNivelEventoCD].Insert(iCont, NovoItem);

       Inc(iCont);
       qryAux.Next;
     end;
  End;

  
  { Monta Menu Cancelamento por Inadimplência - CI }
  ComponentAtual := FindComponent(mnu.Items[indNivelEventos].Items[indNivelCalncelamento].Items[indNivelEventoCI].Name);
  If (ComponentAtual As TMenuItem).Enabled Then
  Begin
    FazQuery( QryAux, 'SELECT IDEVENTOGERADOR, NOME, FLGACEITARETORNO FROM EVENTOGERADOR ' +
                      'WHERE FLGINTERNO = ''CI'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
                      'ORDER BY NOME ' );
    qryAux.Open;
    qryAux.First;
    iCont := 0;
    while not qryAux.EOF do
    begin
      NovoItem := TMenuItem.Create(Self);

      NovoItem.Caption := qryAux.FieldByName('NOME').AsString;
      NovoItem.Name := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormEventoCI;
      mnu.Items[indNivelEventos].Items[indNivelCalncelamento].Items[indNivelEventoCI].Insert(iCont, NovoItem);

      Inc(iCont);
      qryAux.Next;
    end;

    qryAux.First;
    if (qryAux.RecordCount <> 0) and (qryAux.FieldByName('FLGACEITARETORNO').AsInteger = 1)
    then begin
      NovoItem := TMenuItem.Create(Self);

      NovoItem.Caption := '-';
      mnu.Items[indNivelEventos].Items[indNivelCalncelamento].Items[indNivelEventoCI].Insert(iCont, NovoItem);

      Inc(iCont);
      NovoItem := TMenuItem.Create(Self);
      NovoItem.Caption := 'Retorno';
      NovoItem.Name := 'D' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick := AbreFormDesfazerEvento;
      mnu.Items[indNivelEventos].Items[indNivelCalncelamento].Items[indNivelEventoCI].Insert(iCont, NovoItem);
    end;

  End;


End;

procedure TfrmPrincipal.AbreFormEventoIP;
begin
  CriaDataModule; 
  IniciaEventoInscricao(qryAux,
                        copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name)),
                        'Evento de Inscrição de Participante',
                        False); 
end;

procedure TfrmPrincipal.AbreFormEventoRM;
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

  Application.CreateForm(TfrmEventoReinscricao, frmEventoReinscricao );
  frmEventoReinscricao.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoReinscricao.HelpContext := 160006; 
  frmEventoReinscricao.ShowModal;
end;

procedure TfrmPrincipal.AbreFormEventoRA;
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

  Application.CreateForm(TfrmEventoRetornoMantidoParaAtivo, frmEventoRetornoMantidoParaAtivo);
  frmEventoRetornoMantidoParaAtivo.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoRetornoMantidoParaAtivo.HelpContext := 160019; 
  frmEventoRetornoMantidoParaAtivo.ShowModal;
end;

procedure TfrmPrincipal.AbreFormEventoTR;
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

  Application.CreateForm(TfrmEventoTransfReserva, frmEventoTransfReserva);
  frmEventoTransfReserva.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoTransfReserva.HelpContext := 160031; 
  frmEventoTransfReserva.ShowModal;
end;

procedure TfrmPrincipal.AbreFormEventoTP;
begin
  CriaDataModule;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO, FLGSIMULA FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) );

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  if qryAux.FieldByName('FLGSIMULA').AsString = '1'
  then begin
     Application.CreateForm(TfrmEventoTransfPlanoNOVO, frmEventoTransfPlanoNOVO);
     frmEventoTransfPlanoNOVO.Caption := qryAux.FieldByName('NOME').AsString;
     frmEventoTransfPlanoNOVO.HelpContext := 160032;
     frmEventoTransfPlanoNOVO.ShowModal;
  end
  else
  begin
     Application.CreateForm(TfrmEventoTransfPlano, frmEventoTransfPlano);
     frmEventoTransfPlano.Caption := qryAux.FieldByName('NOME').AsString;
     frmEventoTransfPlano.HelpContext := 160032;
     frmEventoTransfPlano.ShowModal;
  end;
end;

procedure TfrmPrincipal.AbreFormEventoTE;
begin
  CriaDataModule;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO, FLGSIMULA FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) ); 

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  Application.CreateForm(TfrmTransfPatroBatch, frmTransfPatroBatch);
  frmTransfPatroBatch.Caption := qryAux.FieldByName('NOME').AsString;
  frmTransfPatroBatch.ShowModal;
end;

procedure TfrmPrincipal.AbreFormEventoAF;
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

  Application.CreateForm(TfrmEventoAfastamento, frmEventoAfastamento);
  frmEventoAfastamento.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoAfastamento.HelpContext := 160008; 
  frmEventoAfastamento.ShowModal;
end;

procedure TfrmPrincipal.AbreFormEventoAR;
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

  Application.CreateForm(TfrmEventoAfastSemRemun, frmEventoAfastSemRemun);
  frmEventoAfastSemRemun.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoAfastSemRemun.HelpContext := 160009; 
  frmEventoAfastSemRemun.ShowModal;
end;

procedure TfrmPrincipal.AbreFormEventoDP;
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

  Application.CreateForm(TfrmEventoDemissaoPatrocinadora, frmEventoDemissaoPatrocinadora);
  frmEventoDemissaoPatrocinadora.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoDemissaoPatrocinadora.HelpContext := 160014;
  frmEventoDemissaoPatrocinadora.ShowModal;
end;

procedure TfrmPrincipal.AbreFormEventoDC;
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


  Application.CreateForm(TfrmEventoDemissaoCancel, frmEventoDemissaoCancel);
  frmEventoDemissaoCancel.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoDemissaoCancel.pflginterno := qryAux.FieldByName('FLGINTERNO').AsString; //Marcio Sanches Spinosa SOL 242983 PPM 581156
  frmEventoDemissaoCancel.HelpContext := 160015; 
  frmEventoDemissaoCancel.ShowModal;
end;

procedure TfrmPrincipal.AbreFormEventoDM;
begin
  CriaDataModule;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) );

  qryAux.Open;
  UAdmPrev.sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString; // Alterado por FHBS - 03/10/2019 - SIG92308
  UAdmPrev.sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;      // Alterado por FHBS - 03/10/2019 - SIG92308

  Application.CreateForm(TfrmEventoDemissaoManutContrib, frmEventoDemissaoManutContrib);
  frmEventoDemissaoManutContrib.Caption := qryAux.FieldByName('NOME').AsString;

  If UAdmPrev.sFlgInterno = 'PD' Then                                          // Alterado por FHBS - 02/10/2019 - SIG92308
    frmEventoDemissaoManutContrib.HelpContext := 160018
  Else
    frmEventoDemissaoManutContrib.HelpContext := 160016;
//frmEventoDemissaoManutContrib.ShowModal;
  frmEventoDemissaoManutContrib.Show;// Jéssica Lana SOL 130362 04/02/2010


end;

procedure TfrmPrincipal.AbreFormEventoDS;
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

  Application.CreateForm(TfrmEventoDemissaoManutSaldo, frmEventoDemissaoManutSaldo);
  frmEventoDemissaoManutSaldo.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoDemissaoManutSaldo.HelpContext := 160017;
  frmEventoDemissaoManutSaldo.ShowModal;
end;

procedure TfrmPrincipal.AbreFormEventoDA;
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

  Application.CreateForm(TfrmEventoDemissaoCancel, frmEventoDemissaoCancel);
  frmEventoDemissaoCancel.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoDemissaoCancel.HelpContext := 160020;
  frmEventoDemissaoCancel.ShowModal;
end;

procedure TfrmPrincipal.AbreFormEventoMP;
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

  Application.CreateForm(TfrmEventoManutParcial, frmEventoManutParcial);
  frmEventoManutParcial.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoManutParcial.HelpContext := 160007;
  frmEventoManutParcial.ShowModal;
end;

procedure TfrmPrincipal.AbreFormEventoCI;
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

  //William Moreira da Silva - SOL 271518 - PPM 1368136
  //Application.CreateForm(TfrmEventoRegInadimplencia, frmEventoRegInadimplencia);
  //frmEventoRegInadimplencia.Caption := qryAux.FieldByName('NOME').AsString;
  //frmEventoRegInadimplencia.HelpContext := 160027;
  //frmEventoRegInadimplencia.Show;

  Application.CreateForm(TfrmEventoRegInadimplencia_Cadastro, frmEventoRegInadimplencia_Cadastro);
  frmEventoRegInadimplencia_Cadastro.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoRegInadimplencia_Cadastro.HelpContext := 160027;
  frmEventoRegInadimplencia_Cadastro.Show;
  //William Moreira da Silva - SOL 271518 - PPM 1368136
end;

procedure TfrmPrincipal.AbreFormEventoCP;
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

  Application.CreateForm(TfrmEventoCancelInicia, frmEventoCancelInicia);
  frmEventoCancelInicia.name := 'frmEventoCancelIniciaCP';                     // edilaine - SOL 253577-18129 / PPM 1303078
  frmEventoCancelInicia.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoCancelInicia.HelpContext := 160028;
  frmEventoCancelInicia.ShowModal;
end;

procedure TfrmPrincipal.AbreFormEventoCD;
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

  Application.CreateForm(TfrmEventoCancelInicia, frmEventoCancelInicia);
  frmEventoCancelInicia.name := 'frmEventoCancelIniciaCD';                     // edilaine - SOL 253577-18129 / PPM 1303078
  frmEventoCancelInicia.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoCancelInicia.HelpContext := 160029;
  frmEventoCancelInicia.ShowModal;
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

procedure TfrmPrincipal.AbreFormProrrogarEvento;
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

  Application.CreateForm(TfrmEventoProrrogacao, frmEventoProrrogacao);
  frmEventoProrrogacao.Caption := 'Prorrogação do Evento - ' + qryAux.FieldByName('NOME').AsString;
  frmEventoProrrogacao.ShowModal;
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
     qryIntegraBack.Free; 
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
  end; 

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
end;

procedure TfrmPrincipal.CriaDataModule;
begin
  inherited;


  If dtmAPrev = nil
   Then Begin
     Screen.Cursor := crSQLWait;
     try
       application.processmessages;
       Application.CreateForm(TdtmAPrev, dtmAPrev);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "dtmAPrev".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;
  End;

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

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  Sistema.IdModulo := 452;
  Screen.OnActiveFormChange := MudaCaptionFundacao;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  inherited;
  sTipoTelaBenef    := '';
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case IdReports of
    20322 : FrmPreviewReports := TfrmPRelHisFuncionalMT.Create(Self);
  else
    FrmPreviewReports := nil;
  end;
    inherited;
end;

procedure TfrmPrincipal.fcLabel2Click(Sender: TObject);
begin
  inherited;
  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  //sArquivo:='c:\LOGBPLADMPREV.TXT';
  sArquivo:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\LOGBPLADMPREV.TXT';


  {$I-}
  AssignFile(Arquivo, sArquivo);
  ReWrite(Arquivo);
  EnumModules(ForEachModule, nil);
  CloseFile(Arquivo);
  {$I+}
end;

procedure TfrmPrincipal.CancelarEventoRegistrado1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCancelaEvento, TfrmCancelaEvento, False);
end;

procedure TfrmPrincipal.EmissodeCartasparaRecadastramento1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmEmiteRecadastramento, TfrmEmiteRecadastramento, False);
end;

procedure TfrmPrincipal.RecebimentodeRecadastramento1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;

  With frmTipoBenefConcede do Begin
     Caption := 'Tipo de Recebimento desejado';
     frmTipoBenefConcede.HelpContext := 160104;
     rgrpTipo.Items.Clear;
     rgrpTipo.Items.Add('Recebimento de Cartas para digitação');
     rgrpTipo.Items.Add('Recebimento de arquivo TXT para importação');
     ShowModal;

     If (cTipoBeneficio = 'C') or (cTipoBeneficio = 'S')
     Then Exit;

     Case rgrpTipo.ItemIndex of
       0: AbrirForm(frmRecebeRecadastramento, TfrmRecebeRecadastramento, False);
       1: AbrirForm(frmRecebeRecadTXT, TfrmRecebeRecadTXT, False);
     End;
  End;
end;

procedure TfrmPrincipal.RetenoporFaltadeRecadastramento1Click(
  Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmSuspendeBeneficio, TfrmSuspendeBeneficio, False);
end;

procedure TfrmPrincipal.mnuRegistroFalecBenefClick(
  Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( frmRegFalBenef, TfrmRegFalBenef, False);
end;

procedure TfrmPrincipal.mnuCadElegiveisClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  sIdEventoGerador := '';
  sFlgInterno      := '';
  IniciaEventoInscricao(qryAux, '-1','Cadastro de Elegível e Participante', True);
end;

procedure TfrmPrincipal.mnuCadDepenCadastroClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadDepenBenef,TfrmCadDepenBenef,False);
end;

procedure TfrmPrincipal.mnuCadDepenCancelamentoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCancelaDependente,TfrmCancelaDependente,False);
end;

procedure TfrmPrincipal.mnuCadResponsavelClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirFormModal(frmCadResponsa, TfrmCadResponsa);
end;

procedure TfrmPrincipal.ContaBancria1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadContaBanco, TfrmCadContaBanco, False);
end;

procedure TfrmPrincipal.mnuHistFuncAntesPatroClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadHistFuncPartCS, TfrmCadHistFuncPartCS, False);
end;

procedure TfrmPrincipal.mnuEvolFuncPartClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
//SOL 121368 - KINTANA 589276 - Álder Souza - INÍCIO
//  AbrirForm( frmCadEvolFuncPrev, TfrmCadEvolFuncPrev,FALSE); //SOL 116572 - KINTANA 547247 - Renato Visoni
try
  frmCadEvolFuncPrev := TfrmCadEvolFuncPrev.Create(Application);
  if frmCadEvolFuncPrev.FormStyle <> fsMDIChild then
  begin
    TfrmCadEvolFuncPrev(frmCadEvolFuncPrev).WindowState := wsMaximized;
    TfrmCadEvolFuncPrev(frmCadEvolFuncPrev).FormStyle := fsMDIChild;
    TfrmCadEvolFuncPrev(frmCadEvolFuncPrev).Visible := false;
  end;


  TfrmCadEvolFuncPrev(frmCadEvolFuncPrev).Show;
  TfrmCadEvolFuncPrev(frmCadEvolFuncPrev).Release;
Except
end;
//SOL 121368 - KINTANA 589276 - Álder Souza - FIM
end;

procedure TfrmPrincipal.mnuContribuicoesParticipClick(Sender: TObject);
begin
  inherited;
  AbrirFormModal(frmCadContribParticipante,TfrmCadContribParticipante);
end;

procedure TfrmPrincipal.AlteraodePDV1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadAlteraPdv, TfrmCadAlteraPdv, False);
end;

procedure TfrmPrincipal.mnuParticCalculaTempoServicoLoteClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCalculaTempoServicoLote,TfrmCalculaTempoServicoLote,False);
end;

procedure TfrmPrincipal.mnuAssociacaodeReservasClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmAssocReservaPart, TfrmAssocReservaPart, False);
end;

procedure TfrmPrincipal.ActLoginExecute(Sender: TObject);
Var
  X, Y, T, Z, NumItems, NumItemsT, NumSubItens : Integer;
begin

  For X := 0 To mnuEventos.count - 1 Do Begin { Nivel Eventos }

    NumItems := mnuEventos.Items[X].Count - 1;
    For Y := NumItems DownTo 0 Do Begin         

      If (mnuEventos.Items[X].Items[Y].Name  = 'mnuEventoTransferencias') Then Begin

        NumItemsT := mnuEventos.Items[X].Items[Y].Count - 1;
        For T := NumItemsT DownTo 0 Do Begin

          NumSubItens := mnuEventos.Items[X].Items[Y].Items[T].Count-1;
          For Z := NumSubItens DownTo 0 Do Begin
            mnuEventos.Items[X].Items[Y].Items[T].Items[Z].Free;
          End;

        End;

      End Else Begin
        NumItemsT := mnuEventos.Items[X].Items[Y].Count - 1;
        For T := NumItemsT DownTo 0 Do Begin
          mnuEventos.Items[X].Items[Y].Items[T].Free
        End;
      End;

    End;

  End;

  inherited;

end;

procedure TfrmPrincipal.mnuEtiqImprimeClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmEmisEtiq, TfrmEmisEtiq, False);
end;

procedure TfrmPrincipal.mnuEtiqConfiguraClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCfgEtiqueta,TfrmCfgEtiqueta,False);
end;

procedure TfrmPrincipal.mnuConfExtDesligClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(FrmConfSimulaDeslig, TFrmConfSimulaDeslig, False);
end;

procedure TfrmPrincipal.mnuImpExtDesligClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(FrmParamRelExtratoDeslig, TFrmParamRelExtratoDeslig, False);
end;

procedure TfrmPrincipal.mnuRubricas1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmConsRubricas, TfrmConsRubricas, False);
end;

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

procedure TfrmPrincipal.RegistrodeOperaes1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  FrmConsLogTotalPREV.ConsultaLogTotalPrev(sistema.idmodulo);
end;

procedure TfrmPrincipal.RegistrodeEventos1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmConsEventosPrev,TfrmConsEventosPrev,False);
end;

procedure TfrmPrincipal.MnuSimulaEnquadramentoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( FrmSimulacaoEnquadramento, TFrmSimulacaoEnquadramento,False);
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,
  liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
Var
 CmCtrlRpt : TCmCtrlRpt;
begin
  inherited;

  //CPrev - 26825 - Inicio
  CmCtrlRpt := TCmCtrlRpt.Create;
  try
    Config := ConfigReport(liIdReports, liOrigemCm, CmCtrlRpt, DesReport);
    CmCtrlRpt.free;
  except
    CmCtrlRpt.free;
    raise;
  end;
  //CPrev - 26825 - Fim
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
Var
 CmCtrlRpt : TCmCtrlRpt;
begin
  inherited;

  //CPrev - 26825 - Inicio
  CmCtrlRpt := TCmCtrlRpt.Create;
  Try
    Printed := ShowReport(IdReports, CmCtrlRpt);
    CmCtrlRpt.Free;
  Except
    CmCtrlRpt.Free;
    Raise;
  End;
  //CPrev - 26825 - Fim
end;

procedure TfrmPrincipal.MnuConsPart_PadraoClick(Sender: TObject);
var
  ConsPart1: TConsPart;
//  ConsEnder1: TfrmConsEnderGeral;
begin
   inherited;
   try
//      Application.CreateForm(TfrmConsEnderGeral, ConsEnder1);
//      ConsEnder1.show;
// código original
      Application.CreateForm(TconsPart, Conspart1);
      ConsPart1.sIdPessoa    := '0';
      ConsPart1.sIdPessjur   := '0';
      ConsPart1.sIdPlanoprev := '0';
      ConsPart1.sSeqProposta := '0';
      ConsPart1.DataBaseName := 'BaseDados';
      ConsPart1.MostraConsulta;
   finally
      // SOL 190491 KTN 1801489 Otacilio
      //FreeAndNil(Conspart1);
   end;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(FrmAltPercContribLote,TFrmAltPercContribLote,False);
end;

procedure TfrmPrincipal.mnuAltPercLoteClick(
  Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(FrmAltPercContribLote,TFrmAltPercContribLote,False);

end;

procedure TfrmPrincipal.AbreInscricaoLote(Sender: TObject);
begin
  CriaDataModule;
  AbrirForm(frmInscricaoParticipanteLote,TfrmInscricaoParticipanteLote,False);

end;

procedure TfrmPrincipal.mnuEnviodePeridicoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmEnvioPeriodico,TfrmEnvioPeriodico,False);
end;

procedure TfrmPrincipal.mnuAlteraodeRecebedordeParticipanteClick(
  Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmIndicadorRecebedor, TfrmIndicadorRecebedor, False);
end;

procedure TfrmPrincipal.ConsultaGeraldeEndereos1Click(Sender: TObject);
var
  ConsEnder1: TfrmConsEnderGeral;

begin
   inherited;
   try
      Application.CreateForm(TfrmConsEnderGeral, ConsEnder1);
      ConsEnder1.show;
   finally
   end;
end;

// Higor Nayde Ferreira SOL 200950 Ktn 1952039 Incio
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

  Application.CreateForm(TfrmEventoAposentadoria, frmEventoAposentadoria);
  frmEventoAposentadoria.name := 'frmEventoAposentadoriaTC';                     // edilaine - SOL 253577-18129 / PPM 1303078
  frmEventoAposentadoria.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoAposentadoria.HelpContext := 160021;
  frmEventoAposentadoria.ShowModal;

end;

procedure TfrmPrincipal.AbreFormEventoID(Sender: TObject);
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

  Application.CreateForm(TfrmEventoAposentadoria, frmEventoAposentadoria);
  frmEventoAposentadoria.name := 'frmEventoAposentadoriaID';                     // edilaine - SOL 253577-18129 / PPM 1303078
  frmEventoAposentadoria.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoAposentadoria.HelpContext := 160022;
  frmEventoAposentadoria.ShowModal;

end;

procedure TfrmPrincipal.AbreFormEventoIN(Sender: TObject);
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

  Application.CreateForm(TfrmEventoAssistido, frmEventoAssistido);
  frmEventoAssistido.name := 'frmEventoAssistidoIN';                            // edilaine - SOL 253577-18129 / PPM 1303078
  frmEventoAssistido.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoAssistido.HelpContext := 160023;
  frmEventoAssistido.ShowModal;

end;

procedure TfrmPrincipal.AbreFormEventoFL(Sender: TObject);
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
  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  case StrToInt(sIdEventoGerador) of
    346 : frmEventoMorte.Name  := 'frmEventoMorteRE';
    367 : frmEventoMorte.Name  := 'frmEventoMortePE';
  end;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim
  frmEventoMorte.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoMorte.HelpContext := 160033;
  frmEventoMorte.ShowModal;

end;

procedure TfrmPrincipal.AbreFormEventoOE(Sender: TObject);
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

  Application.CreateForm(TfrmEventoAssistido, frmEventoAssistido);
  frmEventoAssistido.name := 'frmEventoAssistidoOE';                            // edilaine - SOL 253577-18129 / PPM 1303078
  frmEventoAssistido.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoAssistido.HelpContext := 160013;
  frmEventoAssistido.ShowModal;

end;

procedure TfrmPrincipal.AbreFormEventoAI(Sender: TObject);
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

procedure TfrmPrincipal.AbreFormEventoBI(Sender: TObject);
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
  frmEventoAssistidoINSS.Name    := 'frmEventoAssistidoINSSBI';                  // edilaine - SOL 253577-18129 / PPM 1303078
  frmEventoAssistidoINSS.Caption := qryAux.FieldByName('NOME').AsString;
  frmEventoAssistidoINSS.HelpContext := 160025;
  frmEventoAssistidoINSS.ShowModal;
end;
// Higor Nayde Ferreira SOL 200950 Ktn 1952039 FIM
procedure TfrmPrincipal.mnuRequerimentodeBenefciosdoINSSemLoteClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadRequerBenefInssLote,TFrmCadRequerBenefInssLote, False);//douglas siqueira 3564
end;

procedure TfrmPrincipal.mnuSolContaSalClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmSolContaSal, TfrmSolContaSal, False); // Felipe A. Santos  SOL 201126 Kintana 1947118
end;

procedure TfrmPrincipal.mnuCadContaEmLoteClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadContaEmLote, TfrmCadContaEmLote, False);  // Felipe A. Santos SOL 200445 KTN 1943221
end;

procedure TfrmPrincipal.mnuMapaPevicClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMapaPrevic, TFrmMapaPrevic, False);
end;

procedure TfrmPrincipal.mnuBloqueioIRClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmBloqueioIR, TfrmBloqueioIR, False);
end;

procedure TfrmPrincipal.NovasinscrieseativosReplan1Click(Sender: TObject);
begin
  inherited;
    AbrirForm(frmInscricaoNovoPlano, TfrmInscricaoNovoPlano, False );
end;

procedure TfrmPrincipal.MnuItPreparoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmPreparoSaldamento, TFrmPreparoSaldamento, False );
end;

procedure TfrmPrincipal.MnuSaldamentoDeAtivosClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm( TFrmSaldamento, FrmSaldamento );
  FrmSaldamento.Tag := 1; { Saldamento de ativo }
  FrmSaldamento.HelpContext:= 3360020; //CPrev - 29/01/2008
  FrmSaldamento.ShowModal;

end;

procedure TfrmPrincipal.MnuSaldamentoDeAposentadosClick(Sender: TObject);
begin
  inherited;

  Application.CreateForm( TFrmSaldamento, FrmSaldamento );
  FrmSaldamento.Tag := 0; { Saldamento de Assistido }
  FrmSaldamento.HelpContext:= 3360019; //CPrev - 29/01/2008
  FrmSaldamento.ShowModal;

end;

procedure TfrmPrincipal.MnuSaldamentoDePensionistasClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm( TFrmSaldamento, FrmSaldamento );
  FrmSaldamento.Tag := 2; { Saldamento de Pensionistas }
  FrmSaldamento.HelpContext:= 3360021; //CPrev - 29/01/2008
  FrmSaldamento.ShowModal;
end;

procedure TfrmPrincipal.MnuDesfazerSaldamentoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCancSaldamento, TfrmCancSaldamento, False );
end;

procedure TfrmPrincipal.MnuItExecImportaReservaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmExecImportaReserva, TFrmExecImportaReserva, False );
end;
    {Higor Nayde SOL21354715854}

// Felipe Azevedo dos Santos - SOL 207951/18304 - início
procedure TfrmPrincipal.mnuPrevCClick(Sender: TObject);
begin
  inherited;
  try
    frmPrevC := TfrmPrevC.Create(Self);
    frmPrevC.btnProcurarClick(Self);
    frmPrevC.ShowModal;
  finally
    FreeAndNil(frmPrevC);
  end;
end;
// Felipe Azevedo dos Santos - SOL  207951/18304 - fim

procedure TfrmPrincipal.mnuAlterarEventoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmAlteraEvento, TfrmAlteraEvento, False);
end;

initialization
   Sistema.NomeModulo     := 'CadastroPrev';
   Sistema.IdModulo       := 452 ;
   Sistema.Versao := '3.00.07';
   Sistema.NomeAplicativo := 'Cadastro Previdenciário';
   IntegraBack            := TIntegraBack.Create(True,True,True);
   Modulo                 := TModulo.Create;
finalization
   Modulo.Free;
   IntegraBack.Free;
end.
