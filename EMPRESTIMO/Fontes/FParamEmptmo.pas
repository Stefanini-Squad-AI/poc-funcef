unit FParamEmptmo;

// Alterações:
{
Atender     : WO7986
Autor(a)    : Luis Ferrari
Data        : 05/08/2024
Descrição   : Incluido um parametro para a parametrização do horário de encerramento diário
              para os Débitos (amortização/quitação)
--------------------------------------------------------------------------------------------------
Rotina      : -
Autor(a)    : Darivaldo Alencar
Data        : 10/02/2016
Pendência   : SOL 224034/17909 - PPM.1165556
Descrição   : Incluido combobox evento de acordo judicial.
--------------------------------------------------------------------------------------------------
Autor(a)    : Petri Nocentini
Data        : 07/07/2015
Pendência   : SOL 257429 PPM 957952
Descrição   : Reimplementação do SOL 199356, que sofreu sobreposição de código
--------------------------------------------------------------------------------------------------
Rotina      : -
Autor(a)    : MARCIO SANCHES SPINOSA
Data        : 25/07/2013
Pendência   : SOL 199356 KINTANA 1931062
Descrição   : Na aba Geral foi adicionado a combo Documento de obito referenciado a tabela
            tipodocpessoa .
--------------------------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
--------------------------------------------------------------------------------------------------
Rotina      : -
Autor(a)    : TADEU PASSOS
Data        : 12/11/2012
Pendência   : SOL 182258 KINTANA 1697187
Descrição   : Na aba Integrações foi incluso combo para escolher Rubrica e campo para mostrar o
              IDPROVENDO e CODPROVDESC da Rubrica escolhida. E também foi incluso o novo campo na qry.
----------------------------------------------------------------------------------------------------
Rotina    : qry e upd
Data      : 26/12/2007
Pendência : 26775
Autor     : Alberto
Descrição : Inclusão da parametrização da regra de identificação do plano de cobrança
            PARAMEMPTMO.IDREGRAPLANOCOB
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 25/09/2007
Pendência : 26402
Autor     : Marchetti
Descrição : Criação de Flags para identificar a utilização de margem consignável alternativa e
            Obrigatoriedade de Avalista ao selecionar margem consignável alternativa
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 10/07/2007
Pendência : 25812
Autor     : Marchetti
Descrição : Criação de Flag para permitir amoortização com data retroativa á ultima atualização de saldo
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 23/07/2004 a 26/07/20040
Pendência : 23733
Autor     : Alberto Carvalho
Descrição : Acrescentada a aba "Validação na Concessão"
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 23/07/2004 a 26/07/20040
Autor     : André Pontes
Descrição : Parâmetro FLGAGRUPAPARCFOL: indica se as prestações enviadas para Folha(s) devem ir
            "fechadas", ie, agrupadas por nº da parcela - quando os outros parâmetros (rubrica,
            contas contábeis, etc.) permitirem
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 10/03/2004
Autor     : André Pontes
Descrição : Parâmetro IDITEMIOFCOMPLCON: indica o ID do item referente ao IOF complementar na
            Concessão
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 02/06/2003
Autor     : André Pontes
Descrição : Parâmetro FLGUSAFLOATCONC: indica se deve ser levado em conta o FLOAT associado ao
            PortadorForma (tabela da Folha) para modificar a data de vencimento da Concessão
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 02/06/2003
Autor     : Marchetti
Descrição : Parâmetro FLGCONTROLAINSC para determinar se deve haver controle de recebimento de
            contrato para permitir concessão
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 28/05/2003
Autor     : André Pontes
Descrição : Parâmetro FLGINTEGRACONC associado ao controle DBchkEnviaConcessao "NÃO enviar para
            Contas a Pagar no momento da Concessão".
---------------------------------------------------------------------------------------------------}



// Descrição dos Parâmetros:
//
// IdEmpresaProp           identificador da empresa proprietaria
//
// IdCidades               ID da Cidade de "domicílio" do Sistema.
// IdEstado                ID do Estado de "domicílio" do Sistema.
// IdPais                  ID do Pais de "domicílio" do Sistema.
//
// IdEmpresa               Empresa proprietária do Sistema (é chave do Centro de Custo)
// CodCentroCusto          Centro de Custo para integração financeira
// IdPrograma              ID do Programa a ser usado para integração com CaR.
//
// IDItemIOF               ID sequencial do item de empréstimo que corresponde ao IOF
//                         (indica para o sistema IRRF qual item usar para gerar o DARF de IOF)
// IDItemIOFCompl          ID sequencial do item de empréstimo que corresponde ao IOF Complementar
//                         (indica para o sistema IRRF qual item usar para gerar o DARF de IOF)
//
// IDGRUPOREGRA            Identificador do grupo de regras que será permitido ao Sistema usar
// IDREGRAAVAL             Regra para validar obrigatoriedade de avalistas
//
// -- Integração Contábil --------------------------------------------------------------------------
//
// flgIntegraContab        Flag que indica se o módulo deve-se integrar à contabilidade.
// FLGCONTABCONC           Indica se contabiliza automaticamente na concessao:
//                            0 - Contabiliza
//                            1 - Nao contabiliza
// FlgContabParcela        Flag que indica se parcelas devem ser contabilizadas na geração
//                            0 - Contabiliza
//                            1 - NÃO Contabiliza
// FlgContabEncargo        Flag que indica se encargos devem ser contabilizadas no Tratamento de Divergências
//                            0 - Contabiliza
//                            1 - NÃO Contabiliza
// FlgIntegraQuita         Flag que indica se deve ser gerada integração contábil no momento da quitação
//                            0 = SIM, gerar
//                            1 = NÃO gerar
// -------------------------------------------------------------------------------------------------
//
// -- Integração com CaP/CaR -----------------------------------------------------------------------
//
// flgIntegraCAPCAR        Flag que indica se o módulo deve-se integrar ao CaP/CaR.
// FlgIntegraEnvio         Flag que indica se devem ser gerados documentos de CaP/CaR no momento do Envio
//                            0 = SIM, gerar
//                            1 = NÃO gerar
//
// FLGSUSPENDEATRASO       Identifica se o envio suspende ou nao cobranca de parcelas em atraso.
//
// TipoDocRec              Tipo de Documento a ser usado para integração com CaR (por default)
// TipoDocPag              Tipo de Documento a ser usado para integração com CaP.
//
// PortFormaRecto          ID do Portador-Forma de Recebimento.
// PortFormaPagto          ID do Portador-Forma de Pagamento (ver flgFormaPort).
// CodFormaPagto           ID da forma de pagamento (ver flgFormaPort).
// flgFormaPag             Flag que indica a forma de envio de pagamentos. C = CAP/CAR F = Folha
// flgFormaRec             Flag que indica a forma de envio de recebimentos. C = CAP/CAR F = Folha
//
// -------------------------------------------------------------------------------------------------
//
// -- Concessão ------------------------------------------------------------------------------------
//
// flgPendConcessao        Indica quais itens levar em consideração para totalizar pendências de contratos anteriores na concessão:
//                            0 = itens em aberto vencidos;
//                            1 = itens em aberto vencidos e vincendos
// flgDataAtuSld           Flag que indica qual a data de atualização do Saldo devedor, no momento da concessão.
//                            0 = Data do Crédito
//                            1 = Data da 1ª Parcela
//                            2 = Data equivalente, no mês anterior ao da 1ª parcela.
// FLGTRAVARDATA           Indica se o sistema trava data de inclusão.
//
//
// flgImprimeInsc          Flag que indica se é permitido imprimir o Contrato definido no tipo de contrato no momento da inscrição.
//
// -------------------------------------------------------------------------------------------------
//
// -- Outros Processos -----------------------------------------------------------------------------
//
// FLGAMTPRESTAB           Permite ou não amortização com prestações anteriores em aberto:
//                            0 - Permite
//                            1 - Não permite
// FLGRENPRESTAB           Permite ou não renovação com prestações anteriores em aberto:
//                            0 - Permite
//                            1 - Não permite
//
// flgParcDiverg           Flag que indica se itens divergentes devem impedir geração da parcela
// flgEnvioDiverg          Flag que indica se itens divergentes devem impedir o envio
//
// FlgSuspensaoAuto        Flag que indica se o sistema deve trabalhar com suspensão automática de Envio:
//                            0 = não
//                            1 = sim
//
// flgSaldoDevAnt          Flag que indica como buscar o saldo devedor anterior em uma determindada data:
//                            0: INclusive o dia em questão
//                            1: EXclusive o dia em questão.
//
// FLGQUITAPARCMORTE       Flag que indica se a quitação por Morte NÃO deve quitar parcelas, apenas
//                            saldo devedor
//
// -------------------------------------------------------------------------------------------------
//
// FlgObrigaVerba          Flag que indica se é obrigatória a consulta à verba disponível no momento da inscricão / concessão de um empréstimo.
// FLGVERBAUNICA           Identifica se o controle de verbas será único (null ou 0) ou por filial (1).
//
// flgGeraRubrica          Flag que indica se as rubricas (para a(s) Folha(s) dever ser geradas automaticamente.
// flgUsaFiario            Flag que indica se se deseja gerar automaticamente protocolo para os evento do Empréstimo:
//                            0 - Não
//                            1 - Sim
//
// -------------------------------------------------------------------------------------------------
//
// -- FUNCEF ---------------------------------------------------------------------------------------
// HORAENCERRADEBITO       indica o horário de encerramento diário para os Débitos (amortização/quitação)
// FLGCALCDIA              Flag que indica se o sistema deve trabalhar com atualização diária de saldo devedor.
// HORAENCERRA             Indica o horário de encerramento para concessões.
// FLGMOSTRATIT            Define se mostra ou não os dados do titular.
// FLGTRATAASSINAT         Indica se o sistema trabalha com assinatura de contrato.
// FLGCONCULTDIAMES        Determina se é permitido conceder empréstimo no último dia útil do mes.
// FLGOBRIGAAVALISTA       Identifica se é obrigatória a informação de avalista.
// FLGEXCEPCIONAL          Identifica se a Fundação trabalha com Excepcionalizações
// IDREGRAATUALDIA         Regra que identifica a atualização diária
// IDITEMSEGCONC           Item de concessão referente ao seguro
// IDITEMDEVSEGCONC        Item de concessão referente à devolução de seguro
// IDITEMDEVSEGQUIT        Item de quitação referente à devolução de seguro
// IDITEMSEGCOMPL          Item referente a seguro complementar
// IDREGRADEVSEG           Regra que calcula devolução de seguro para repasse
//
// -------------------------------------------------------------------------------------------------
//                         *** NÃO MAIS/AINDA UTILIZADOS ***
//
// flgIntegraFolha         Flag que indica se o módulo deve-se integrar à(s) Folha(s).
//
// flgIntegraConc          Flag que indica se a concessão deve ser integrada no ato:
//                            0 = integração posterior
//                            1 = integração no ato
//
// flgFormaPort            Flag que indica qual escolha é possível no momento da Inscrição:
//                            F = Forma
//                            P = Portador-Forma
//
// IdTipoCliente           Identificador do tipo de cliente a ser usado para integração com CaR.
//
// FLGTRATQUITCANC         Indica se trata ou não divergências de contratos quitados ou cancelados.
//
// FlgFormaSitPart         Flag que indica se a forma de recebimento deve ser regida pela situação do Participante:
//                            0 = NÃO (usar defaults definidos acima)
//                            1 = SIM (Ativo = Folha, Assistido = CaR).
//

interface

uses
   {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroCSImob, StdCtrls, wwdblook, ComCtrls, CmEventosCadastro,
   ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti,
   IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
   DBCtrls, Mask, mRegraDB, wwdbdatetimepicker, CMDateTimePicker, wwdbedit,
  Wwdotdot, Wwdbcomb;

type
   TfrmParamEmptmo = class(TfrmCadastroCSImob)
      pgcParametros: TPageControl;
      tbsConcessao: TTabSheet;
      DBCheckBox1: TDBCheckBox;
      tbsIntegra: TTabSheet;
      tbsGeral: TTabSheet;
      DBcboGrupoRegra: TwwDBLookupCombo;
      Label2: TLabel;
      Label3: TLabel;
      DBcboFormaPagto: TwwDBLookupCombo;
      DBrdgFormaPort: TDBRadioGroup;
      Label4: TLabel;
      DBcboPortFormaPagto: TwwDBLookupCombo;
      Label5: TLabel;
      DBcboPortFormaRecto: TwwDBLookupCombo;
      Label6: TLabel;
      DBcboPrograma: TwwDBLookupCombo;
      GroupBox1: TGroupBox;
      DBedtCidade: TDBEdit;
      Label7: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      DBEdit2: TDBEdit;
      DBEdit3: TDBEdit;
      btnBuscaCidade: TBitBtn;
      btnLimpaCidade: TBitBtn;
      DBEdit4: TDBEdit;
      DBCheckBox3: TDBCheckBox;
      qryIDEMPRESAPROP: TFloatField;
      qryIDGRUPOREGRA: TFloatField;
      qryFLGOBRIGAVERBA: TFloatField;
      qryFLGFORMAPORT: TStringField;
      qryCODFORMAPAGTO: TFloatField;
      qryPORTFORMARECTO: TFloatField;
      qryPORTFORMAPAGTO: TFloatField;
      qryFLGFORMAREC: TStringField;
      qryFLGFORMAPAG: TStringField;
      qryFLGDATAATUSLD: TFloatField;
      qryIDTIPOCLIENTE: TFloatField;
      qryIDPROGRAMA: TFloatField;
      qryIDCIDADES: TFloatField;
      qryIDESTADO: TStringField;
      qryIDPAIS: TFloatField;
      qryFLGINTEGRACONC: TFloatField;
      qryFLGIMPRIMEINSC: TFloatField;
      qryFLGINTEGRACONTAB: TFloatField;
      qryFLGINTEGRAFOLHA: TFloatField;
      qryFLGINTEGRACAPCAR: TFloatField;
      qryNOME_CIDADE: TStringField;
      qryCODESTADO: TStringField;
      qryNOMEESTADO: TStringField;
      qryNOMEPAIS: TStringField;
      Label10: TLabel;
      DBcboTipoDocPag: TwwDBLookupCombo;
      Label11: TLabel;
      DBcboTipoDocRec: TwwDBLookupCombo;
      qryTIPODOCPAG: TFloatField;
      qryTIPODOCREC: TFloatField;
      Label1: TLabel;
      Bevel1: TBevel;
      DBCheckBox4: TDBCheckBox;
      qryFLGGERARUBRICA: TFloatField;
      TabSheet1: TTabSheet;
      DBCheckBox5: TDBCheckBox;
      DBCheckBox7: TDBCheckBox;
      DBCheckBox6: TDBCheckBox;
      qryFLGVERBAUNICA: TFloatField;
      DBCheckBox8: TDBCheckBox;
      DBCheckBox2: TDBCheckBox;
      qryFLGSUSPENSAOAUTO: TFloatField;
      tbsSaldoDev: TTabSheet;
      DBRadioGroup4: TDBRadioGroup;
      DBRadioGroup3: TDBRadioGroup;
      Label12: TLabel;
      DBcboCentroCusto: TwwDBLookupCombo;
      qryIDEMPRESA: TFloatField;
      qryCODCENTROCUSTO: TStringField;
      qryFLGSALDODEVANT: TFloatField;
      qryIDITEMIOF: TFloatField;
      DBRadioGroup1: TDBRadioGroup;
      DBRadioGroup2: TDBRadioGroup;
      Bevel3: TBevel;
      Label16: TLabel;
      DBchkFiario: TDBCheckBox;
      qryFLGUSAFIARIO: TFloatField;
      qryIDITEMIOFCOMPL: TFloatField;
      DBCheckBox11: TDBCheckBox;
      qryFLGCONCULTDIAMES: TFloatField;
      qryFLGAGRUPAPARC: TFloatField;
      DBCheckBox13: TDBCheckBox;
      qryFLGSUSPENDEATRASO: TFloatField;
      Label17: TLabel;
      qryFLGOBRIGAAVALISTA: TFloatField;
      DBCheckBox14: TDBCheckBox;
      qryFLGCALCDIA: TFloatField;
      qryFLGMOSTRATIT: TFloatField;
      DBCheckBox15: TDBCheckBox;
      DBCheckBox16: TDBCheckBox;
      DBCheckBox17: TDBCheckBox;
      qryFLGTRAVARDATA: TFloatField;
      qryFLGTRATAASSINAT: TFloatField;
      molRegraDB4: TmolRegraDB;
      qryIDREGRAAVAL: TFloatField;
      qryNOMEREGRA: TStringField;
      TabSheet2: TTabSheet;
      DBCheckBox18: TDBCheckBox;
      qryFLGENVIODIVERG: TFloatField;
      qryFLGPARCDIVERG: TFloatField;
      qryFLGTRATQUITCANC: TFloatField;
      DBCheckBox20: TDBCheckBox;
      Label18: TLabel;
      qryHORAENCERRA: TStringField;
      dbEdtHoraEncerra: TDBEdit;
      Bevel4: TBevel;
      Bevel5: TBevel;
      Bevel6: TBevel;
      qryFLGPENDCONCESSAO: TFloatField;
      DBRadioGroup5: TDBRadioGroup;
      Bevel7: TBevel;
      DBCheckBox9: TDBCheckBox;
      DBCheckBox10: TDBCheckBox;
      Bevel8: TBevel;
      Label19: TLabel;
      DBCheckBox21: TDBCheckBox;
      DBCheckBox22: TDBCheckBox;
      qryFLGAMTPRESTAB: TFloatField;
      qryFLGRENPRESTAB: TFloatField;
      DBCheckBox23: TDBCheckBox;
      qryFLGCONTABCONC: TFloatField;
      qryFLGCONTABPARCELA: TFloatField;
      qryFLGINTEGRAENVIO: TFloatField;
      qryFLGINTEGRAQUITA: TFloatField;
      Bevel9: TBevel;
      tbsSeguro: TTabSheet;
      Label20: TLabel;
      wwDBLookupCombo2: TwwDBLookupCombo;
      Label21: TLabel;
      wwDBLookupCombo3: TwwDBLookupCombo;
      Label22: TLabel;
      wwDBLookupCombo4: TwwDBLookupCombo;
      Label23: TLabel;
      molRegraDB1: TmolRegraDB;
      molRegraDB2: TmolRegraDB;
      DBCheckBox24: TDBCheckBox;
      wwDBLookupCombo1: TwwDBLookupCombo;
      qryIDITEMSEGCONC: TFloatField;
      qryIDITEMDEVSEGCONC: TFloatField;
      qryIDITEMDEVSEGQUIT: TFloatField;
      qryIDITEMSEGCOMPL: TFloatField;
      qryFLGEXCEPCIONAL: TFloatField;
      qryIDREGRADEVSEG: TFloatField;
      qryIDREGRAATUALDIA: TFloatField;
      qryREGRADEV: TStringField;
      qryREGRAATU: TStringField;
      chkContabilizaEncargo: TDBCheckBox;
      Bevel10: TBevel;
      DBchkQuitaParcMorte: TDBCheckBox;
      qryFLGQUITAPARCMORTE: TFloatField;
      qryFLGCONTABENCARGO: TFloatField;
      qryFLGINSCRET: TFloatField;
      DBCheckBox26: TDBCheckBox;
      DBchkEnviaConcessao: TDBCheckBox;
      qryFLGCONTROLAINSC: TFloatField;
      qryFLGUSAFLOATCONC: TFloatField;
      DBCheckBox27: TDBCheckBox;
      DBCheckBox28: TDBCheckBox;
      qryFLGPARTIDADOBRADA: TFloatField;
      DBCheckBox29: TDBCheckBox;
      Label24: TLabel;
      wwDBLookupCombo5: TwwDBLookupCombo;
      Label25: TLabel;
      wwDBLookupCombo6: TwwDBLookupCombo;
      qryIDITEMSEGESPECIAL: TFloatField;
      TabSheet3: TTabSheet;
      Label13: TLabel;
      Label14: TLabel;
      DBcboItemIOF: TwwDBLookupCombo;
      Label15: TLabel;
      DBcboIOFCompl: TwwDBLookupCombo;
      Label26: TLabel;
      wwDBLookupCombo7: TwwDBLookupCombo;
      Bevel2: TBevel;
      qryIDITEMIOFCOMPLCON: TFloatField;
      Bevel11: TBevel;
      Label27: TLabel;
      wwDBLookupCombo8: TwwDBLookupCombo;
      Label28: TLabel;
      wwDBLookupCombo9: TwwDBLookupCombo;
      Label29: TLabel;
      wwDBLookupCombo10: TwwDBLookupCombo;
      qryIDITEMINESPERADO: TFloatField;
      qryIDITEMSLDMAIS: TFloatField;
      qryIDITEMSLDMENOS: TFloatField;
      qryFLGIMPRINSCRICAO: TFloatField;
      TabSheet4: TTabSheet;
      DBCheckBox32: TDBCheckBox;
      DBCheckBox33: TDBCheckBox;
      DBCheckBox34: TDBCheckBox;
      DBCheckBox19: TDBCheckBox;
      Bevel12: TBevel;
      Bevel13: TBevel;
      Bevel14: TBevel;
      qryFLGAGRUPAPARCFOL: TFloatField;
      DBCheckBox36: TDBCheckBox;
      qryFLGESTORNOPOSQUIT: TFloatField;
      DBCheckBox12: TDBCheckBox;
      btnBuscaSeguradora: TBitBtn;
      DBedtRegra: TDBEdit;
      Regra: TLabel;
      btnLimpaSeguradora: TBitBtn;
      Label31: TLabel;
      Label32: TLabel;
      qryIDSEGURADORA: TFloatField;
      qryNOME_SEGURADORA: TStringField;
      DBCheckBox25: TDBCheckBox;
      qryFLGESTORNADIVERG: TFloatField;
      DBCheckBox37: TDBCheckBox;
      DBCheckBox38: TDBCheckBox;
      qryFLGENVIAQUITA: TFloatField;
      qryFLGENVIAAMORTIZA: TFloatField;
      DBCheckBox39: TDBCheckBox;
      Bevel15: TBevel;
      qryFLGABONODIVERG: TFloatField;
      qryFLGCTABANCOPREF: TFloatField;
      DBCheckBox40: TDBCheckBox;
      tbsValidaConcessao: TTabSheet;
      Label33: TLabel;
      qryIDREGRATIPOCONTR: TFloatField;
      qryREGRATIPOCONTR: TStringField;
      molRegraDB3: TmolRegraDB;
      DBCheckBox30: TDBCheckBox;
      qryFLGAMORTRETROATIV: TFloatField;
      qryFLGUSAMARGEMALT: TFloatField;
      qryFLGOBRIGAAVALALT: TFloatField;
      Bevel16: TBevel;
      DBCheckBox31: TDBCheckBox;
      DBCheckBox35: TDBCheckBox;
    qryFLGTRATAATUSLD: TFloatField;
    DBCheckBox41: TDBCheckBox;
    Label34: TLabel;
    molRegraDB5: TmolRegraDB;
    Bevel17: TBevel;
    qryIDREGRAPLANOCOB: TFloatField;
    qryREGRAPLANOCOB: TStringField;
    dbeIDPROVENTO: TDBEdit;
    qryIDPROVENTO: TFloatField;
    DBcboRubEmprestimo: TwwDBLookupCombo;
    Label35: TLabel;
    dblCODPROVDESC: TDBEdit;
    Label36: TLabel;
    dboIDDOCUMENTO: TwwDBLookupCombo; //MARCIO SANCHES SPINOSA SOL 199356 KINTANA 1931062
    qryIDDOCUMENTO: TFloatField;
    lblEventoAJ: TLabel;
    qryEvento: TwwQuery;
    dsEvento: TwwDataSource;
    qryIDEVENTOJUDICIAL: TFloatField;
    cbCboEvento: TwwDBLookupCombo;
    Label37: TLabel;
    dbEdtHoraEncerraDebito: TDBEdit;
    qryHORAENCERRADEBITO: TStringField;//MARCIO SANCHES SPINOSA SOL 199356 KINTANA 1931062

      procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);

      procedure AbreQueries(i: integer);
      procedure FechaQueries; override;

      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure btnBuscaCidadeClick(Sender: TObject);
      procedure bbtnSairClick(Sender: TObject);
      procedure btnLimpaSeguradoraClick(Sender: TObject);
      procedure btnBuscaSeguradoraClick(Sender: TObject);
      procedure sbtnAlterarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBcboRubEmprestimoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);


   private  // Private declarations

      procedure Sel(iEmpresaProp: integer);

      procedure PreencheDefaults;
      function VerificaPreenchimento: boolean;


   public { Public declarations }

   end;



var
  frmParamEmptmo: TfrmParamEmptmo;



implementation
{$R *.DFM}
uses
   FPrincipal, uSistema, uMensErro, uVerificaPreenchimento, uFuncoesEmptmo, dEmptmo, dMS,
  DLookEmptmo;



procedure TfrmParamEmptmo.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
	inherited;

   // habilita o painel de fundo (que contém o PageControl - orelhas)
   pnlFundo.Enabled := True;

   tbsGeral.Enabled        := False;
   tbsConcessao.Enabled    := False;
   tbsIntegra.Enabled      := False;

   if CmeCadastro.Operacao in [opInserir, opAlterar] then
   begin
      tbsGeral.Enabled     := True;
      tbsConcessao.Enabled := True;
      tbsIntegra.Enabled   := True;
   end;

	// só permite alteração
   sbtnInserir.Enabled  := False;
   sbtnAlterar.Enabled  := True;
   sbtnApagar.Enabled   := False;
   sbtnProcurar.Enabled := False;
end;



procedure TfrmParamEmptmo.CmeCadastroEdit(Sender: TObject);
begin
	// o primeiro Edit na query será um Insert
   if (qry.IsEmpty) then
   begin
      qry.Insert;
      qryIDEMPRESAPROP.AsInteger := Sistema.IDEmpresa;
   end
   else
   begin
      inherited; // qry.Edit
   end;

   // Preenche valores default ---------------------------------------------------------------------
   if qry.State in dsEditModes then PreencheDefaults;
end;



procedure TfrmParamEmptmo.Sel(iEmpresaProp: integer);
begin
  with qry do
    begin
      LimpaParametros(qry);
      ParamByName('PIDEMPRESAPROP').AsInteger := iEmpresaProp;
      Open;
   end;

   // Darivaldo SOL 224034/17909 - PPM.1165556 - inicio
   qryEvento.Close;
   qryEvento.Open;
   // Darivaldo SOL 224034/17909 - PPM.1165556 - fim
end;



procedure TfrmParamEmptmo.CmeCadastroConfirma(Sender: TObject);
begin
   if qry.State in dsEditModes then
   begin

      (* Preenchimento de campos com valores obrigatorios --------------------------------------- *)

      (* Empresa proprietária *)
      qryIDEMPRESAPROP.AsInteger := Sistema.IDEmpresa;

      if qryCODCENTROCUSTO.IsNull then
      begin
         qryIDEMPRESA.Clear;
      end
      else
      begin
         qryIDEMPRESA.AsInteger  := Sistema.IDEmpresa;
      end;

      (* Preenche os valores default ------------------------------------------------------------ *)
      PreencheDefaults;

      inherited;
   end;
end;



procedure TfrmParamEmptmo.PreencheDefaults;
begin
   // -- Geral -------------------------------------------------------------------------------------
   if qryFLGIMPRIMEINSC.isNULL      then  qryFLGIMPRIMEINSC.AsInteger      := 0;
   if qryFLGGERARUBRICA.isNULL      then qryFLGGERARUBRICA.AsInteger       := 0;
   if qryFLGMOSTRATIT.IsNull        then qryFLGMOSTRATIT.AsInteger         := 0;

   // -- Concessão ---------------------------------------------------------------------------------
   if qryFLGOBRIGAVERBA.isNULL      then  qryFLGOBRIGAVERBA.AsInteger      := 0;
   if qryFLGVERBAUNICA.IsNull       then  qryFLGVERBAUNICA.AsInteger       := 0;

   if qryFLGOBRIGAAVALISTA.IsNull   then  qryFLGOBRIGAAVALISTA.AsInteger   := 0;
   if qryFLGTRATAASSINAT.IsNull     then  qryFLGTRATAASSINAT.AsInteger     := 0;
   if qryFLGTRAVARDATA.IsNull       then  qryFLGTRAVARDATA.AsInteger       := 0;
   if qryFLGCONCULTDIAMES.IsNull    then  qryFLGCONCULTDIAMES.AsInteger    := 0;
   if qryFLGUSAMARGEMALT.IsNull     then  qryFLGUSAMARGEMALT.AsInteger     := 0;
   if qryFLGOBRIGAAVALALT.IsNull    then  qryFLGOBRIGAAVALALT.AsInteger    := 0;

   // -- Saldo Devedor -----------------------------------------------------------------------------
   if qryFLGSALDODEVANT.isNULL      then  qryFLGSALDODEVANT.AsInteger      := 0;
   if qryFLGDATAATUSLD.isNULL       then  qryFLGDATAATUSLD.AsInteger       := 2;
   if qryFLGPENDCONCESSAO.IsNull    then  qryFLGPENDCONCESSAO.AsInteger    := 0;

   if qryFLGCALCDIA.IsNull          then  qryFLGCALCDIA.AsInteger          := 0;

   // -- Integrações -------------------------------------------------------------------------------
   if qryFLGINTEGRACAPCAR.IsNull    then  qryFLGINTEGRACAPCAR.AsInteger    := 1;
   if qryFLGSUSPENDEATRASO.IsNull   then  qryFLGSUSPENDEATRASO.AsInteger   := 1;

   if qryFLGINTEGRACONTAB.IsNull    then  qryFLGINTEGRACONTAB.AsInteger    := 1;
   if qryFLGCONTABCONC.IsNull       then  qryFLGCONTABCONC.AsInteger       := 0;
   if qryFLGCONTABPARCELA.IsNull    then  qryFLGCONTABPARCELA.AsInteger    := 0;
   if qryFLGINTEGRAQUITA.IsNull     then  qryFLGINTEGRAQUITA.AsInteger     := 0;

   if qryFLGUSAFIARIO.IsNull        then qryFLGUSAFIARIO.AsInteger         := 0;

   if qryFLGFORMAPAG.isNULL         then qryFLGFORMAPAG.AsString           := 'C';
   if qryFLGFORMAREC.isNULL         then qryFLGFORMAREC.AsString           := 'F';

   // -- Outros Processos --------------------------------------------------------------------------
   if qryFLGPARCDIVERG.IsNull       then  qryFLGPARCDIVERG.AsInteger       := 0;
   if qryFLGENVIODIVERG.IsNull      then  qryFLGENVIODIVERG.AsInteger      := 1;

   if qryFLGAMTPRESTAB.isNULL       then  qryFLGAMTPRESTAB.AsInteger       := 1;
   if qryFLGRENPRESTAB.isNULL       then  qryFLGRENPRESTAB.AsInteger       := 0;

   if qryFLGTRATQUITCANC.IsNull     then  qryFLGTRATQUITCANC.AsInteger     := 0;
   if qryFLGEXCEPCIONAL.IsNull      then  qryFLGEXCEPCIONAL.AsInteger      := 0;

   // -- Não Usados --------------------------------------------------------------------------------
   if qryFLGINTEGRACONC.isNULL      then qryFLGINTEGRACONC.AsInteger       := 0;
   if qryFLGFORMAPORT.isNULL        then qryFLGFORMAPORT.AsString          := 'F';
   if qryFLGAGRUPAPARC.IsNull       then qryFLGAGRUPAPARC.AsInteger        := 0;
   if qryFLGINSCRET.IsNull          then qryFLGINSCRET.AsInteger           := 0;
   if qryFLGPARTIDADOBRADA.IsNull   then qryFLGPARTIDADOBRADA.AsInteger    := 0;
   if qryFLGIMPRINSCRICAO.IsNull    then qryFLGIMPRINSCRICAO.AsInteger     := 0;
   if qryFLGIMPRINSCRICAO.IsNull    then qryFLGIMPRINSCRICAO.AsInteger     := 0;
   if qryFLGESTORNADIVERG.IsNull    then qryFLGESTORNADIVERG.AsInteger     := 0;

   if qryFLGCTABANCOPREF.IsNull     then qryFLGCTABANCOPREF.AsInteger      := 0;
   if qryFLGAMORTRETROATIV.IsNull   then qryFLGAMORTRETROATIV.AsInteger    := 0;
   if qryFLGESTORNOPOSQUIT.IsNull   then qryFLGESTORNOPOSQUIT.AsInteger    := 0;
   if qryFLGABONODIVERG.IsNull      then qryFLGABONODIVERG.AsInteger       := 0;
   if qryFLGTRATAATUSLD.IsNull      then qryFLGTRATAATUSLD.AsInteger       := 0;
   IF qryIDDOCUMENTO.IsNull         then qryIDDOCUMENTO.AsInteger          := 0;  //MARCIO SANCHES SPINOSA SOL 199356 KINTANA 1931062

end;



procedure TfrmParamEmptmo.AbreQueries(i: integer);
begin
   LimpaParametros(dtmLookEmptmo.qryLookItemEmprestimo);
   dtmLookEmptmo.qryLookItemEmprestimo.Open;
   //MARCIO SANCHES SPINOSA SOL 199356 KINTANA 1931062 - inicio
   LimpaParametros(dtmLookEmptmo.qryLookTipoDocPessoa);
   dtmLookEmptmo.qryLookTipoDocPessoa.Open;
   //MARCIO SANCHES SPINOSA SOL 199356 KINTANA 1931062 - Fim
   LimpaParametros(dtmLookEmptmo.qryLookGrupoRegra);
   dtmLookEmptmo.qryLookGrupoRegra.Open;

   LimpaParametros(dtmLookEmptmo.qryLookPrograma);
   dtmLookEmptmo.qryLookPrograma.Open;

   LimpaParametros(dtmLookEmptmo.qryLookTipoCliente);
   dtmLookEmptmo.qryLookTipoCliente.Open;

   with dtmLookEmptmo.qryLookPortadorFormaR do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger  := Sistema.IDEmpresa;
      Open;
   end;

   with dtmLookEmptmo.qryLookPortadorFormaP do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaP);
      ParamByName('PIDPESSOA').AsInteger  := Sistema.IDEmpresa;
      Open;
   end;

   with dtmLookEmptmo.qryLookFormaRecPag do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookFormaRecPag);
      ParamByName('PIDPESSOA').AsInteger  := Sistema.IDEmpresa;
      ParamByName('PRECPAG').AsString     := 'P';
      Open;
   end;

   with dtmLookEmptmo.qryLookCentroCusto do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookCentroCusto);
      ParamByName('PIDEMPRESA').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   dtmLookEmptmo.qryLookTipoDocPag.Open;
   dtmLookEmptmo.qryLookTipoDocRec.Open;
   dtmLookEmptmo.qryLookTipoDocRecDevol.Open;
   dtmLookEmptmo.qryLookRubricaParaEnvio.Open;

   Sel(i);
end;



procedure TfrmParamEmptmo.FechaQueries;
begin
   inherited;

   // força o fechamento dos parâmetros do sistema
   if dtmEmptmo.qryParamEmptmo.Active then dtmEmptmo.qryParamEmptmo.Close;

   LimpaParametros(dtmLookEmptmo.qryLookGrupoRegra);
   LimpaParametros(dtmLookEmptmo.qryLookPrograma);
   LimpaParametros(dtmLookEmptmo.qryLookTipoCliente);
   LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
   LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaP);
   LimpaParametros(dtmLookEmptmo.qryLookFormaRecPag);
   LimpaParametros(dtmLookEmptmo.qryLookCentroCusto);
   LimpaParametros(dtmLookEmptmo.qryLookTipoDocPessoa); //MARCIO SANCHES SPINOSA SOL 199356 KINTANA 1931062
end;



function TfrmParamEmptmo.VerificaPreenchimento: boolean;
begin
   Result := False;

   (* Geral *)
   try

      if ( qryIDGRUPOREGRA.IsNull ) then
         raise EValidacao.CreateVal('É necessário indicar o Grupo de Regras de Empréstimo!', DBcboGrupoRegra);

      if ( (qryIDCIDADES.IsNull) or (qryIDESTADO.IsNull) or (qryIDPAIS.IsNull) ) then
         raise EValidacao.CreateVal('É necessário indicar o "Domicílio"!', btnBuscaCidade);

   except

      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         pgcParametros.ActivePage := tbsGeral;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;


   (* Concessão *)
   try
      if DBcboFormaPagto.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Forma de Pagamento para Concessão!', DBcboFormaPagto);

      if DBcboPortFormaPagto.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar a Conta de Caixa x Forma de Pagamento para Concessão!', DBcboPortFormaPagto);
	except

      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
			pgcParametros.ActivePage := tbsConcessao;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;


   (* Integração *)
   try
      if ( qryPORTFORMARECTO.IsNull ) then
         raise EValidacao.CreateVal('É necessário indicar a Conta de Caixa x Forma de Recebimento para Empréstimos!', DBcboPortFormaRecto);

      if ( DBcboCentroCusto.LookupValue = '' ) then
         raise EValidacao.CreateVal('É necessário indicar o Centro de Custo para Integração Financeira!', DBcboCentroCusto);

      if ( qryTIPODOCPAG.IsNull ) then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Documento para Pagamentos (Contas a Pagar)!', DBcboTipoDocPag);

      if ( qryTIPODOCREC.IsNull ) then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Documento para Recebimentos (Contas a Receber)!', DBcboTipoDocRec);

      if ( DBcboItemIOF.LookupValue = '' ) then
         raise EValidacao.CreateVal('É necessário indicar o Item de Empréstimo referente ao I.O.F.!', DBcboItemIOF);

	except

      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
			pgcParametros.ActivePage := tbsConcessao;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmParamEmptmo.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;



procedure TfrmParamEmptmo.FormShow(Sender: TObject);
var
  i : Integer;
begin
   pgcParametros.ActivePage := tbsGeral;

   Application.ProcessMessages;

   // filtra pela Empresa Proprietária
   AbreQueries(Sistema.IDEmpresa);

   //Pendência 24351 - 30/01/2007 - Alberto
   for i := 0 to pgcParametros.PageCount - 1 do pgcParametros.Pages[i].Enabled := false;

	inherited;
end;



procedure TfrmParamEmptmo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FechaQueries;
   inherited;
end;



procedure TfrmParamEmptmo.bbtnConfirmarClick(Sender: TObject);
var
  i : Integer;
begin
   inherited;
   pgcParametros.ActivePage := tbsGeral;

   // Pendência 24351 - 30/01/2007 - Alberto
   for i := 0 to pgcParametros.PageCount - 1 do pgcParametros.Pages[i].Enabled := false;
end;



procedure TfrmParamEmptmo.bbtnCancelarClick(Sender: TObject);
var
  i : Integer;
begin
   inherited;
   pgcParametros.ActivePage := tbsGeral;

   // Pendência 24351 - 30/01/2007 - Alberto
   for i := 0 to pgcParametros.PageCount - 1 do pgcParametros.Pages[i].Enabled := false;
end;



procedure TfrmParamEmptmo.btnBuscaCidadeClick(Sender: TObject);
begin
   inherited;

   if qry.State in [dsInsert, dsEdit] then
   begin

      dtmMS.MS_Cidade.Executar;

      // redesenha o form na volta do MontaSelect
      Repaint;

      // se houve busca, abre a query principal com apenas o registro buscado
      if dtmMS.MS_Cidade.RetornouValor then
      begin

         Screen.Cursor := crHourGlass;

         qryIDCIDADES.AsInteger  := StrToInt(dtmMS.MS_Cidade.ValoresChave[0]);
         qryNOME_CIDADE.AsString := dtmMS.MS_Cidade.ValoresChave[1];
         qryIDESTADO.AsInteger   := StrToInt(dtmMS.MS_Cidade.ValoresChave[2]);
         qryCODESTADO.AsString   := dtmMS.MS_Cidade.ValoresChave[3];
         qryNOMEESTADO.AsString  := dtmMS.MS_Cidade.ValoresChave[4];
         qryIDPAIS.AsInteger     := StrToInt(dtmMS.MS_Cidade.ValoresChave[5]);
         qryNOMEPAIS.AsString    := dtmMS.MS_Cidade.ValoresChave[6];

         Screen.Cursor := crDefault;
      end;
   end;
end;



procedure TfrmParamEmptmo.bbtnSairClick(Sender: TObject);
begin
   dtmEmptmo.qryParamEmptmo.Close;
   inherited;
end;



procedure TfrmParamEmptmo.btnLimpaSeguradoraClick(Sender: TObject);
begin
   inherited;

   if qry.State in dsEditModes then
   begin
      qryIDSEGURADORA.Clear;
      qryNOME_SEGURADORA.Clear;
   end;
end;



procedure TfrmParamEmptmo.btnBuscaSeguradoraClick(Sender: TObject);
begin
   inherited;

   if qry.State in dsEditModes then
   begin
      dtmMS.MS_Seguradora.Executar;
      Repaint;

      if dtmMS.MS_Seguradora.RetornouValor then
      begin
         qryIDSEGURADORA.AsInteger     := StrToInt(dtmMS.MS_Seguradora.ValoresChave[0]);
         qryNOME_SEGURADORA.AsString   := dtmMS.MS_Seguradora.ValoresChave[1];
      end;
   end;
end;


procedure TfrmParamEmptmo.sbtnAlterarClick(Sender: TObject);
var
  i : Integer;
begin
   inherited;

   //Pendência 24351 - 30/01/2007 - Alberto
   for i := 0 to pgcParametros.PageCount - 1 do pgcParametros.Pages[i].Enabled := true;
end;



procedure TfrmParamEmptmo.FormActivate(Sender: TObject);
begin
  inherited;

  // TADEU PASSOS SOL 182258 KINTANA 1697187
  // Se o IDPROVENTO em PARAMEMPTMO estiver nulo não mostra dados no campo dblCODPROVDESC
  if qryIDPROVENTO.IsNull then
    dblCODPROVDESC.DataField := '';
  // TADEU PASSOS SOL 182258 KINTANA 1697187
end;

procedure TfrmParamEmptmo.DBcboRubEmprestimoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  // TADEU PASSOS SOL 182258 KINTANA 1697187
  if dblCODPROVDESC.DataField = '' then
    dblCODPROVDESC.DataField := 'CODPROVDESC';
  // TADEU PASSOS SOL 182258 KINTANA 1697187
end;

end.
