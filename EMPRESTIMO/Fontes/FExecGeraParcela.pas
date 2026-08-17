{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : WO32005
Responsável : Leandro Pocebon
Data        : 11/03/2026
Descrição   : Tratamento para itens suspensos
--------------------------------------------------------------------------------
Pendência   : migraco-orcle
Responsável : Leandro Pocebon
Data        : 16/10/2025
Descrição   : Ajuste qryH3 , qreyUmContrato
--------------------------------------------------------------------------------
Pendência   : WO14072
Responsável : Luis Ferrari
Data        : 24/10/2024
Descrição   : Incluido o Campo CARENCIA na qryContratosGeracao.
--------------------------------------------------------------------------------
Pendência   : SIG131238
Responsável : Luis Ferrari
Data        : 05/01/2023
Descrição   : Incluido a tabela HISTSUSPCOBEP na qryContratosGeracao para validar a suspensão na ultima parcela.
--------------------------------------------------------------------------------
Pendência   : SIG114941
Responsável : Ewerton Beltramini
Data        : 09/11/2021
Descrição   : Comentada crítica genérica que impedia o fluxo da geração da parcela.
--------------------------------------------------------------------------------
Pendência   : SIG TIBERO
Responsável : Everson Cunha
Data        : 25/10/2018
Descrição   : .dfm (Alterar owner da tabela CONTRATOAD)
--------------------------------------------------------------------------------
Pendência   : 70512 e 70325
Responsável : Darivaldo Alencar
Data        : 20/06/2018
Descrição   : Alteração na query dtmCalcEmptmo.qrySaldoAntAtuDia no fonte uCalcEmptmo
--------------------------------------------------------------------------------
Pendência   : SOL 262264 PPM 1087069
Responsável : Marcelo Cardoso/Fernando Xaxier
Data        : 29/09/2015
Descrição   : Ao gerar parcela, a funcionalidade está inserindo suspensão
(Suspensão Novo Credinâmico - Redução 50% Parcela)
--------------------------------------------------------------------------------
Pendência   : SOL 261550 PPM 771995
Responsável : William Moreira da Silva
Data        : 15/09/2015
Descrição   : Ajuste de queries de alteração da HME para desfazer envio. (.DFM)
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
Pendência   : SOL 208835 KINTANA 2016972
Responsável : Marcio Sanches Spinosa SOL 208835 KINTANA 2016972
Data        : 10/06/2013
Descrição   : Ajuste na validação do update de suspensão
--------------------------------------------------------------------------------
Pendência   : SOL 182431 KINTANA 1700846
Responsável : RODRIGO DE BRITO FIGUEREDO
Data        : 08/05/2013
Descrição   : Criada suspensão de itens da parcela
--------------------------------------------------------------------------------
Pendência   : SOL 179167 KINTANA 1647976
Responsável : BRUNO AZEVEDO
Data        : 26/04/2012
Descrição   : Ajuste nas regras de marcação dos checkbox.
-------------------------------------------------------------------------------
Pendência   : SOL 169288 KINATNA 1501886
Responsável : Vinicius Ferreira
Data        : 16/05/2012
Descrição   : Na geração de parcelas em que haja suspensão do tipo judicial
              para o contrato, todos os itens da movimentação de prestação
              devem ser suspensos, mesmo se não for "passível para suspensão".
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
--------------------------------------------------------------------------------
Pendência   : SOL 78818 - Kintana 523335
Responsável : Fernando Santana
Data        : 14/06/2010
Descrição   : Na query qrySuspendeParcela gerar a situação como suspensa
             quando a o campo ITEMXTIPOCONTR.Flgsuspenso entiver com o valor = 1
--------------------------------------------------------------------------------
Pendência   : SOL 139630 KINTANA 859932
Responsável : BRUNO AZEVEDO
Data        : 13/07/2010
Descrição   : Para realizar a suspensão, verificar a data inicial e a data final.
--------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
--------------------------------------------------------------------------------
Pendência   : SOL 116271 - Kintana 545808
Responsável : Renato Visoni
Data        : 07/05/2009
Descrição   : Passamos a tratar se a data da geração da parcela está entre a
data de inicio e fim de suspensão, se não estiver nesse periodo temos que passar
-1 como parametro para a regra no campo Tipo de Suspensao.
--------------------------------------------------------------------------------
Pendência   : SOL 115818  KINTANA 543736
Responsável : Daniel Begnami
Data        : 04/05/2009
Descrição   : Passagem de novos parametros de suspensão para as regras
              de geração de parcelas.
--------------------------------------------------------------------------------
Pendência   : SOL 100074  KINTANA 442190
Responsável : Renato Visoni
Data        : 03/11/2008
Descrição   : O sistema não está gerando as parcelas para os contratos das
              modalidades "CREDINÂMICO FUNCEF 13º NOVEMBRO" e "CREDINÂMICO FUNCEF 13º FEVEREIRO".
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : GeraItensParcela
Data      : 06/11/2007
Autor     : Marchetti
Pendência : 26806
Padrão    : 16
Descrição : Chamada da regra de calculo da data de vencimento da parcela quando
            a mesma estiver parametrizada.
            Inclusao dos campos IDREGRAVENCPARC e FLGUSAMARGEMALT nas queries
            qryUmContrato, qryUmContrato_old, qryVariosContratos e
            qryVariosContratos_old.
--------------------------------------------------------------------------------
Rotina    : qryUmContrato e qryVariosContratos
Data      : 15/01/2007
Autor     : Alberto
Pendência : 23384
Padrão    : 14
Descrição : Inclusão do atributo DATAMORTE para avaliação durante a geração de
            parcelas.
--------------------------------------------------------------------------------
Rotina    : GeraItensParcela (ExecutaAjusteSaldo)
Data      : 11/07/2005
Autor     : André Pontes
Pendência : 19661 - FUNCEF apenas
Descrição : Correção do ajuste de saldo na geração da parcela. Estava iniciando
            o ajuste desde a (dataconsiderada + 1) o que dava saldo duplicado em
            caso de concessão / amortização após o dia 20 anterior. Passa a
            considerar a (data do saldo anterior + 1).
--------------------------------------------------------------------------------
Rotina    : Várias (VerificaPreenchimento e declarações em outros lugares)
Data      : 03/06/2005
Autor     : André Pontes
Pendência : 19404
Descrição : Bloqueio de lançamento e contabilização / estorno / exclusão de
            acordo com parâmetro contábil por módulo + TestaPeríodo.
--------------------------------------------------------------------------------
Rotina    : GeraItensParcela
Data      : 25/05/2005
Autor     : André Pontes
Pendencia :
Descrição : Correção do saldo devedor gravado incorretamente na prestação:
            Estava pegando a (data da prestação - 1), onde o saldo era ZERO.
            Passou a pegar a DataConsiderada como início
--------------------------------------------------------------------------------
Rotina    : Contabiliza
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19264
Descrição : '   AND NVL(ITC.FLGNAOCONTAB, 0) = 0 '
--------------------------------------------------------------------------------
Rotina    : Contabiliza
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19249
Descrição : '   AND H.HMESEQCOBRANCA         = 1 '
--------------------------------------------------------------------------------
Rotina    : Várias
Data      : 01/11/2004
Autor     : André Pontes
Descrição : Verificação do parâmetro do tipo de contrato que não obriga a
            existência de prestacão no mês imediatamente anterior (para casos de
            13º FUNCEF)
--------------------------------------------------------------------------------
Rotina    : -
Data      : 27/04/2004 a 28/04/2004
Autor     : André Pontes
Descrição : [FUNCEF] Reescrita do processo, passando as verificações que faziam
            parte da query principal (sub-queries H1, H2, H3, H4) para queries
            independentes dentro do loop.
--------------------------------------------------------------------------------
Rotina    : SaldoDevAnt
Data      : 12/02/2003
Autor     : Marchetti
Descrição : Criada função local que retorna o saldo devedor conforme atualização
            diária calculada.
--------------------------------------------------------------------------------
Rotina    : VerificaParcelaCobrancaJudicial
Data      : 05/02/2003
Autor     : Marchetti
Descrição : Rotina que verifica se contrato deve ser suspenso judicialmente.
--------------------------------------------------------------------------------
Rotina    : SelecionaContratosGeracao
Data      : 05/02/2003
Autor     : Marchetti
Descrição : Colocada chamada rotina para verificação de geração ou não de
            parcelas.
--------------------------------------------------------------------------------
Rotina    : FormShow
Data      : 18/01/2003
Autor     : André Pontes
Descrição : Marca chkNAOContabiliza e o desabilita se o parâmetro do sistema que
            regula a contabilização estiver marcado para NÃO contabilizar.
--------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 17/12/2002
Autor     : Marchetti
Descrição : O saldo devedor passado para a regra de cálculo dos itens refere-se
            à data a ser considerada, ou seja, geralmente dia 20 para a FUNCEF.
            Quando não possuir atualização para o dia 20, leva-se em
            consideração a data de crédito.
--------------------------------------------------------------------------------
Rotina    : VerificaContratosNaoEfetivados
Data      : 12/12/2002
Autor     : André Pontes
Descrição : Só é chamado se flgCalcDia = 1 (FUNCEF)
--------------------------------------------------------------------------------
Rotina    : SelecionaContratosGeracao
Data      : 12/12/2002
Autor     : André Pontes
Descrição : O SQL da qryContratosGeracao deixa de ser definido em tempo de
            execução, e a query passa a apenas receber os parâmetros.
--------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 25/11/2002
Autor     : Marchetti
Descrição : É passado o record dos dados da concessão. Nesse processo os dados
            seguem sem valor, pois os mesmos somente serão utilizados na
            alteração de valores da concessão.
--------------------------------------------------------------------------------
Rotina    : GeraItensParcela
Data      : 19/11/2002
Autor     : André Pontes
Descrição : Correção da gravação do número de parcelas remanescentes. No momento
            do cálculo, estava pegando o nº de parcelas remanescentes da query
            de busca do saldo devedor anterior (o que é o correto). Porém, logo
            antes da gravação, estava pegando NumParcelas da query principal de
            ContratosGeração, o que fazia com que não fossem levados em conta
            eventuais refinanciamentos com alteração do prazo contratual.
--------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 12/11/2002
Autor     : Marchetti
Descrição : Passado o número de parcelas pagas
--------------------------------------------------------------------------------
Rotina    : qryParcelasDivergentes
Data      : 06/11/2002
Autor     : Marchetti
Descrição : Não pode levar em consideração itens de atualização diária
--------------------------------------------------------------------------------
Rotina    : SelecionaContratosGeracao
Data      : 09/10/2002
Autor     : Marchetti
Descrição : Acertado o filtro do periodo de competencia para levar em
            consideracao os contratos com parcelas do mes anterior geradas.
--------------------------------------------------------------------------------
Rotina    : VerificaContratosNaoEfetivados
Data      : 09/10/2002
Autor     : Marchetti
Descrição : Criada rotina para verificar se existem contratos não efetivados
--------------------------------------------------------------------------------
Rotina    : ExisteAtualizacaoDiaria
Data      : 08/10/2002
Autor     : Marchetti
Descrição : Criada rotina para verificar quantidade de linhas na HISTMOVEMPTMO
            correspondentes a atualização diária na data da geração da parcela.
--------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 03/10/2002
Autor     : Marchetti
Descrição : Colocada critica para validar atualizacao diaria antes de gerar
            parcela.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecGeraParcela;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, fcButton,
   fcImgBtn, fcShapeBtn, wwdbdatetimepicker, CMDateTimePicker, Mask,
   wwdbedit, Wwdbspin, wwdblook, ExtCtrls, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, CheckLst, Db, DBTables,
   Wwquery, mPatro, mContratoEmptmo, uCalcEmptmo, FSairAjudaImob, DBGrids, TREdit,
   uCtrlContab, uCtrlPadroes, UFuncoesEmptmo,
   uTypesEmptmo, mListaPlano, mListaPatro;

type
   TfrmExecGeraParcela = class(TfrmSairAjudaImob)
      ntbPrincipal: TNotebook;
      Panel1: TPanel;
      Label15: TLabel;
      Label5: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      Bevel3: TBevel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label1: TLabel;
      Label2: TLabel;
      btnContinuar: TfcShapeBtn;
      Bevel1: TBevel;
      btnVoltar: TfcShapeBtn;
      edtDataLancto: TwwDBDateTimePicker;
      qryAux: TwwQuery;
      lblTitulo: TfcLabel;
      molContratoEmptmo: TmolContratoEmptmo;
      qryMarcaContratoEncerrado: TwwQuery;
      Total: TLabel;
      edtNumResult: TRealEdit;
      edtNumErro: TRealEdit;
      memErro: TMemo;
      memResult: TMemo;
      Panel3: TPanel;
      Panel4: TPanel;
      edtVlrTotParcela: TRealEdit;
      Label4: TLabel;
      Label8: TLabel;
      qryParcelasDivergentes: TwwQuery;
      qryParcelasDivergentesITENS_DIVERGENTES: TFloatField;
      chkNAOGera: TCheckBox;
      lblDataConsiderar: TLabel;
      edtDataConsiderada: TwwDBDateTimePicker;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      chkNAOContabiliza: TCheckBox;
      qryParcelasAtrasadas: TwwQuery;
      qryParcelasAtrasadasIDCONTRATOEMPTMO: TFloatField;
      qryParcelasAtrasadasIDTIPOCONTREMPTMO: TFloatField;
      qryParcelasAtrasadasTOTAL: TFloatField;
      qryParcelasAtrasadasIDTIPOEMPTMO: TFloatField;
      qryUpdateContrato: TwwQuery;
      qryInsertHistSuspensao: TwwQuery;
      qrySaldoAnt: TwwQuery;
      qrySaldoAntHMESALDODEV: TFloatField;
      qrySaldoAntTXJUROS: TFloatField;
      qrySaldoAntHMEPARCELA: TFloatField;
      qrySaldoAntHMENUMPARCELAS: TFloatField;
      qrySaldoAntHMEDATAATUALIZA: TDateTimeField;
      qrySuspendeParcela: TwwQuery;
      qryTipoContr: TwwQuery;
      qryTipoContrIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContrTCEDESCRICAO: TStringField;
      qryTipoContrIDREGRAJURCONC: TFloatField;
      qryTipoContrIDREGRALIMITES: TFloatField;
      qryTipoContrIDREGRASUSPCOBR: TFloatField;
      qryTipoContrIDREGRASLDDIA: TFloatField;
      qryTipoContrIDREGRAJURANTCONC: TFloatField;
      qryTipoContrIDREGRAELEG: TFloatField;
      qryTipoContrIDREGRARESERVA: TFloatField;
      qryTipoContrIDREGRAMARGEM: TFloatField;
      qryTipoContrIDREGRAPRAZOSCONC: TFloatField;
      qryTipoContrFLGSITUACAO: TStringField;
      qryTipoContrFLGSUSPENSAO: TStringField;
      qryTipoContrFLGSEGURO: TStringField;
      qryTipoContrTCEMAXCONTRATO: TFloatField;
      qryTipoContrTCEMAXINSCR: TFloatField;
      qryTipoContrTCEMAXPARC: TFloatField;
      qryTipoContrTCEMINPARC: TFloatField;
      qryTipoContrTCEMINQUIT: TFloatField;
      qryTipoContrIDREPORTS: TFloatField;
      qryTipoContrTCETRATAPARCATRAS: TStringField;
      qryTipoContrTCETRATAPARCPARC: TStringField;
      qryTipoContrIDTIPOEMPTMO: TFloatField;
      qryTipoContrDESCTIPOEMPTMO: TStringField;
      qryTipoContrIDREGRASALBAS: TFloatField;
      qryTipoContrTCEMINRENOVA: TFloatField;
      qryTipoContrMOECODIGO: TFloatField;
      qryTipoContrIDREGRADATACRED: TFloatField;
      qryTipoContrIDREGRAQUITADO: TFloatField;
      qryTipoContrFLGCOBRJUDIC: TFloatField;
      qryTipoContrTCEMAXMESDEB: TFloatField;
      qryTipoContrIDREGRAVLRMAX: TFloatField;
      qryTipoContrNUMPARCDESCONTO: TFloatField;
      qryTipoContrIDREGRAPRAZOMAX: TFloatField;
      qryUmContrato: TwwQuery;
      qryVariosContratos: TwwQuery;
      chkCommit: TCheckBox;
      qryVariosContratos_old: TwwQuery;
      qryUmContrato_old: TwwQuery;
      qryH1: TwwQuery;
      qryH2: TwwQuery;
      qryH3: TwwQuery;
      qryH4: TwwQuery;
      qryH1IDCONTRATOEMPTMO: TFloatField;
      qryH2HMEPARCELA: TFloatField;
      qryH4IDCONTRATOEMPTMO: TFloatField;
      qryH3HMENUMPARCELAS: TFloatField;
      chkInArquivo: TCheckBox;
      chkNotInArquivo: TCheckBox;
      qryTipoContrFLGPERMITEPARCELA: TFloatField;
      qryDataUltSaldo: TwwQuery;
      qryDataUltSaldoDATA: TDateTimeField;
      qryH5: TwwQuery;
      qryH5HMEPARCELA: TFloatField;
    qryH6: TwwQuery;
    qryH6BDEDesigner1: TFloatField;
    qrySuspendeParcelaJudicial: TwwQuery;
    qryUptSuspItem: TwwQuery;//SOL 182431 Kintana 1700846 Rodrigo de Brito Figueredo

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure btnContinuarClick(Sender: TObject);
      procedure cboMesExit(Sender: TObject);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure btnVoltarClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);

      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure qryVariosContratosBeforeOpen(DataSet: TDataSet);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkInArquivoClick(Sender: TObject);
    procedure chkNotInArquivoClick(Sender: TObject);


   private  // Private declarations

      Contab               : TCtrlContab;   // André Pontes - 03/06/2005 - pendência 19404

      rSaldoDevAnt         : TSaldoDevAnt;
      rContrato            : TDadosContrato;
      rConcessao           : TDadosConcessao;
      vItens               : TListaItem;
      fVlrTotParcelas      : Currency;
      iQuantParcela        : Integer;
      iQuantErro           : Integer;

      iPais                : Integer;
      sEstado              : String;
      iCidade              : Integer;

      qryContratosGeracao  : TwwQuery;

      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;

      function PegaAnoMes: String;
      function PegaAnoMesAnt: String;

      function SelecionaParcelasAtrasadas(const IDPatro   : Int64;
                                          const IDPlano   : Int64
                                         ) : Boolean;

      function SelecionaContratosGeracao(const IDPatro: Int64;
                                         const IDPlano: Int64
                                         ) : Boolean;

      function ProcessaContratos(const sPatro: String;
                                 const sPlano: String
                                ): Boolean;

      function GeraItensParcela(bGravaQueryRegra: Boolean): Boolean;
      function MarcaContratoEncerrado: Boolean;

      function Contabiliza: Integer;

      procedure AbreQueries;
      function  VerificaPreenchimento: Boolean;
      function  ExisteAtualizacaoDiaria : Boolean;

       //SOL 182431 Kintana 1700846 Rodrigo de Brito Figueredo - Inicio
      function Suspende( idContratoEmptmo,hmePcarcela : String; pflgsuspcobranca : Boolean = False ): string;
       // Function que verifica quias itens da parcela deve ser suspenso
       //SOL 182431 Kintana 1700846 Rodrigo de Brito Figueredo - Fim

       //WO4072 Leaznddo Pcoebon - Inicio
      function SuspendePorCarencia( idContratoEmptmo,hmePcarcela : String; pflgsuspcobranca : Boolean = False ): string;
       // Function que verifica quias itens da parcela deve ser suspenso em caso de carencia do contrato
       //WO4072 Leaznddo Pcoebon - Fim

      procedure VerificaContratosNaoEfetivados;

      function VerificaParcelaCobrancaJudicial: Integer;

      // André Pontes - 06/01/2005
      function DataConsiderandoAmortizacaoAjuste(const IDContrato  : Extended;
                                                 const dData       : TDateTime
                                                ): TDateTime;

   public   // Public declarations

   end;



var
  frmExecGeraParcela: TfrmExecGeraParcela;



implementation
{$R *.DFM}
uses
  uSistema, uMensErro, uDatabase, dBaseDados, uModulo, uVerificaPreenchimento,
  dLookEmptmo, dMS, uDiasUteis, dEmptmo, uIntegraEmptmo, uLancContab,
  FProgresso, dAtualizacaoDiaria;



procedure TfrmExecGeraParcela.HabilitaBotoes;
begin
   btnContinuar.Enabled := True;
   btnVoltar.Enabled    := True;
   bbtnSair.Enabled     := True;

   ntbPrincipal.Enabled := True;
   Screen.Cursor        := crDefault;
end;



procedure TfrmExecGeraParcela.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   ntbPrincipal.Enabled := False;

   btnContinuar.Enabled := False;
   btnVoltar.Enabled    := False;
   bbtnSair.Enabled     := False;
end;



function TfrmExecGeraParcela.PegaAnoMes: String;
var
   dData : TDateTime;
begin
   inherited;

   dData    := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1);
   Result   := FormatDateTime('YYYYMM', dData);
end;



function TfrmExecGeraParcela.PegaAnoMesAnt: String;
var
   dData : TDateTime;
begin
   inherited;

   dData    := DiasUteis.SomaMeses(EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1), -1);
   Result   := FormatDateTime('YYYYMM', dData);
end;



procedure TfrmExecGeraParcela.btnContinuarClick(Sender: TObject);
var
   dDataIni       : TDateTime;
   iResultContab  : Integer;
   iContadorPatro : Integer;
   iContadorPlano : Integer;
begin
   inherited;

   if not(VerificaPreenchimento) then Exit;

    if UFuncoesEmptmo.bBuscaMutuario then
    begin
       MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                         'O usuário é o próprio mutuário do '+
                         'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
       Abort;
    end;


   try
      DesabilitaBotoes;

      if not(chkNAOGera.Checked) then
      begin
         // inicializa os acumuladores
         iQuantErro        := 0;
         iQuantParcela     := 0;
         fVlrTotParcelas   := 0;

         // limpa os memos de resultado e erro
         memResult.Clear;
         memErro.Clear;

         dDataIni := Now;
         memResult.Lines.Add('Início do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', dDataIni));
         memResult.Lines.Add(' ');

         // coloca os cabeçalhos nos memos
         memResult.Lines.Add('           Nº Contrato     Matrícula       Plano Patro Tipo Parcela Valor          ');
         memResult.Lines.Add('           --------------- --------------- ----- ----- ---- ------- ---------------');

         memErro.Lines.Add('           Nº Contrato     Matrícula       Plano Patro Tipo Erro                                                   ');
         memErro.Lines.Add('           --------------- --------------- ----- ----- ---- -------------------------------------------------------');

         if molContratoEmptmo.IDContrato > 0 then
         begin
            // -------------------------------------------------------------------------------------
            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
            begin
               qryContratosGeracao := qryUmContrato;
            end
            else
            begin
               qryContratosGeracao := qryUmContrato_old;
            end;
            // -------------------------------------------------------------------------------------

            if not(SelecionaContratosGeracao(-1, -1)) then
            begin
               EscondeEspera;
               Repaint;
            end
            else
            begin
               // Itera pelos contratos, gerando (ou não) as parcelas
               if not(ProcessaContratos('', '')) then
               begin
                  ntbPrincipal.PageIndex := 1;
                  Exit;
               end;
               qryContratosGeracao.Close;
            end;

         end
         else // if molContratoEmptmo.IDContrato > 0
         begin
            // -------------------------------------------------------------------------------------
            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
            begin
               qryContratosGeracao := qryVariosContratos;
            end
            else
            begin
               qryContratosGeracao := qryVariosContratos_old;
            end;
            // -------------------------------------------------------------------------------------

            for iContadorPatro := 0 to (molListaPatro.lstPatro.Items.Count - 1) do
            begin
               if molListaPatro.lstPatro.Checked[iContadorPatro] then
               begin
                  for iContadorPlano := 0 to (molListaPlano.lstPlano.Items.Count - 1) do
                  begin
                     if molListaPlano.lstPlano.Checked[iContadorPlano] then
                     begin
                        // Verifica se há contratos a gerar com a combinação Plano-Patro atual
                        if not(SelecionaContratosGeracao(molListaPatro.vIDPatro[iContadorPatro],
                                                         molListaPlano.vIDPlano[iContadorPlano])
                                                         ) then
                        begin
                           EscondeEspera;
                           Repaint;
                        end
                        else  // if not(SelecionaContratosGeracao(...
                        begin
                           // Itera pelos contratos, gerando (ou não) as parcelas
                           if not(ProcessaContratos(molListaPatro.lstPatro.Items[iContadorPatro],
                                                    molListaPlano.lstPlano.Items[iContadorPlano])
                           ) then
                           begin
                              ntbPrincipal.PageIndex := 1;
                              Exit;
                           end;
                           qryContratosGeracao.Close;
                        end;  // if not(SelecionaContratosGeracao(...
                     end;
                  end;  // for(Plano)
               end;
            end;  // for(Patro)

         end; // molContratoEmptmo.IDContrato > 0

         // ----------------------------------------------------------------------------------------
         // Log de operações
         if not(Sistema.GravaLogOperacoes('Geração de Parcelas ref: ' + Copy(PegaAnoMes, 5, 2) +
                                          '/' + Copy(PegaAnoMes, 1, 4))) then
         begin
            Raise Exception.Create('Falha na gravação do Log da operação.');
         end;
         // ----------------------------------------------------------------------------------------

      end;  // if not(chkNAOGera.Checked)

      // ----------------------------------------------------------------------------------------
      // ----------------------------------------------------------------------------------------
      // ----------------------------------------------------------------------------------------

      if not(chkNAOContabiliza.Checked) then
      begin
         if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
         begin
            iResultContab := Contabiliza;
            case iResultContab of
               -2: MsgDlg('Não foram encontrados Itens a contabilizar!', 'Empréstimo', mtWarning, [mbOk], 0);
               -1: MsgDlg('Não foi possível abrir a seleção de Itens a contabilizar!', 'Empréstimo', mtWarning, [mbOk], 0);
            end;
            Repaint;
         end;
      end;  // if not(chkNAOContabiliza.Checked)

      // ----------------------------------------------------------------------------------------
      // ----------------------------------------------------------------------------------------
      // ----------------------------------------------------------------------------------------

   finally
      memErro.Lines.Add(' ');
      memErro.Lines.Add('Quantidade de Parcelas NÃO geradas: ' + IntToStr(iQuantErro));

      memResult.Lines.Add(' ');
      memResult.Lines.Add('Quantidade de Parcelas geradas:   ' + IntToStr(iQuantParcela));
      memResult.Lines.Add('Valor Total das Parcelas geradas: ' + FormatFloat('#,#0.00', fVlrTotParcelas));
      memResult.Lines.Add(' ');
      memResult.Lines.Add('Final do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      memResult.Lines.Add(' ');
      memResult.Lines.Add('Tempo total do Processo: ' + FormatDateTime('hh:nn:ss', (Now - dDataIni)));

   // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   // memErro.Lines.SaveToFile(Sistema.TempDir + 'EP-ErroParcela ' + FormatDateTime('yyyy-mm-dd hh-nn-ss', Now) + '.log');
      memErro.Lines.SaveToFile(ftempregra + '\' + 'EP-ErroParcela ' + FormatDateTime('yyyy-mm-dd hh-nn-ss', Now) + '.log');
   // memResult.Lines.SaveToFile(Sistema.TempDir + 'EP-ResultParcela ' + FormatDateTime('yyyy-mm-dd hh-nn-ss', Now) + '.log');
      memResult.Lines.SaveToFile(ftempregra + '\' + 'EP-ResultParcela ' + FormatDateTime('yyyy-mm-dd hh-nn-ss', Now) + '.log');

      edtNumResult.Value      := iQuantParcela;
      edtNumErro.Value        := iQuantErro;
      edtVlrTotParcela.Value  := fVlrTotParcelas;

      MsgDlg('Geração de Parcelas finalizada.', 'Empréstimo', mtInformation, [mbOk], 0);
      Repaint;

      ntbPrincipal.PageIndex := 1;

      HabilitaBotoes;
   end;
   end;



function TfrmExecGeraParcela.SelecionaParcelasAtrasadas(const IDPatro   : Int64;
                                                        const IDPlano   : Int64
                                                       ) : Boolean;
begin
   Result := False;

   try
      MostraEspera('Selecionando Prestações em atraso para suspensão...');
      Application.ProcessMessages;

      with qryParcelasAtrasadas do
      begin
         LimpaParametros(qryParcelasAtrasadas);
         Application.ProcessMessages;

         ParamByName('PANOMESCOBRANCA').AsString      := PegaAnoMes;
         ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContrIDTIPOCONTREMPTMO.AsInteger;
         ParamByName('PQUANTPARCATRAS').AsInteger     := qryTipoContrTCEMAXMESDEB.AsInteger;

         if molContratoEmptmo.IDContrato > 0    then  ParamByName('PIDCONTRATOEMPTMO').AsFloat     := molContratoEmptmo.IDContrato;
         if DBcboTipoEmptmo.LookupValue <> ''   then  ParamByName('PIDTIPOEMPTMO').AsInteger       := StrToInt(DBcboTipoEmptmo.LookupValue);
         if IDPatro > 0 then                          ParamByName('PIDPATRO').AsInteger            := IDPatro;
         if IDPlano > 0 then                          ParamByName('PIDPLANOPREV').AsInteger        := IDPlano;

         Open;
         Application.ProcessMessages;

         if not(isEmpty) then Result := True;
      end;

   except
      MsgDlg('Erro na seleção de Prestaçoes em atraso!', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
   end;
end;



function TfrmExecGeraParcela.SelecionaContratosGeracao(const IDPatro: Int64;
                                                       const IDPlano: Int64
                                                      ) : Boolean;
var
   sData : String;
   dData : TDateTime;
begin
   Result := False;

   dData  := DiasUteis.SomaMeses(EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1), 1);
   sData  := FormatDateTime('dd/mm/yyyy', dData);

   try
      MostraEspera('Selecionando Contratos para geração...');
      Application.ProcessMessages;

      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         // ----------------------------------------------------------------------------------------
         with qryContratosGeracao do
         begin
            LimpaParametros(qryContratosGeracao);
            Application.ProcessMessages;

            ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
            ParamByName('PDATAPRIMPARC').AsDateTime      := dData;

            if molContratoEmptmo.IdContrato > 0 then     ParamByName('PIDCONTRATOEMPTMO').AsFloat     := molContratoEmptmo.IdContrato;
            if DBcboTipoEmptmo.LookupValue <> '' then    ParamByName('PIDTIPOEMPTMO').AsInteger       := StrToInt(DBcboTipoEmptmo.LookupValue);
            if DBcboTipoContrato.LookupValue <> '' then  ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := StrToInt(DBcboTipoContrato.LookupValue);
            if IDPatro > 0 then                          ParamByName('PIDPATRO').AsInteger            := IDPatro;
            if IDPlano > 0 then                          ParamByName('PIDPLANOPREV').AsInteger        := IDPlano;

            //leandro wo14072 - inicio
            ParamByName('PHMEANOCOMPETENCIA').AsInteger  := word(trunc(DBspnAno.Value));
            ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
            //leandro wo14072 - fim

            // -------------------------------------------------------------------------------------
            if molContratoEmptmo.IDContrato <= 0 then
            begin
               if chkInArquivo.Checked then              ParamByName('PINARQUIVO').AsInteger          := 1;
               if chkNotInArquivo.Checked then           ParamByName('PNOTINARQUIVO').AsInteger       := 1;
            end;
            // -------------------------------------------------------------------------------------

            Open;
            Application.ProcessMessages;

            if not(isEmpty) then Result := True;
         end;  // with qryContratosGeracao
         // ----------------------------------------------------------------------------------------
      end
      else  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
      begin
         // ----------------------------------------------------------------------------------------
         with qryContratosGeracao do
         begin
            LimpaParametros(qryContratosGeracao);
            Application.ProcessMessages;

            ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
            ParamByName('PDATAPRIMPARC').AsDateTime      := dData;
            ParamByName('PANOMESANTERIOR').AsString      := PegaAnoMesAnt;

            if molContratoEmptmo.IdContrato > 0 then     ParamByName('PIDCONTRATOEMPTMO').AsFloat     := molContratoEmptmo.IdContrato;
            if DBcboTipoEmptmo.LookupValue <> '' then    ParamByName('PIDTIPOEMPTMO').AsInteger       := StrToInt(DBcboTipoEmptmo.LookupValue);
            if DBcboTipoContrato.LookupValue <> '' then  ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := StrToInt(DBcboTipoContrato.LookupValue);
            if IDPatro > 0 then                          ParamByName('PIDPATRO').AsInteger            := IDPatro;
            if IDPlano > 0 then                          ParamByName('PIDPLANOPREV').AsInteger        := IDPlano;

            Open;
            Application.ProcessMessages;

            if not(isEmpty) then Result := True;
         end;  // with qryContratosGeracao
         // ----------------------------------------------------------------------------------------
      end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1

   except
      MsgDlg('Erro na seleção de Contratos!', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
   end;
end;



function TfrmExecGeraParcela.ProcessaContratos(const sPatro: String;
                                               const sPlano: String
                                               ): Boolean;
var
   i              : Integer;
   sMsg           : String;
   bGerou         : Boolean;
   bGeraParcela   : Boolean;
   rLogTotalPrev  : TLogTotalPrev;
   rParcela       : TSaldoDevAnt;
begin
   i        := 0;
   bGerou   := False; // nenhuma parcela gerada ainda
   Result   := True;

   // query que seleciona contratos ativos cuja última parcela (não estornada) é de
   // competência anterior ao mês de geração escolhido
   try
      with qryContratosGeracao do
      begin
         EscondeEspera; // ver observação acima
         MostraFormProgresso('Processando Contratos - ' + sPatro + '/' + sPlano + '...',
                             0,
                             RecordCount,
                             True,
                             True
                            );

         First;
         while not(qryContratosGeracao.EOF) do
         begin
            inc(i);
            AndaFormProgresso(i);

            // Verifica se o usuário Cancelou a Operação
            if frmProgresso.Cancelou then
            begin
               sMsg := 'Processo interrompido pelo usuário.' + #13;
               if bGerou then
               begin
                  sMsg := sMsg + 'Entretanto, pelo menos uma parcela foi gerada.';
               end
               else
               begin
                  sMsg := sMsg + 'Não foi gerada parcela alguma.';
               end;

               MsgDlg(sMsg, 'Empréstimo', mtInformation, [mbOk], 0);
               Repaint;

               Result := False;
               Break;
            end;

            bGeraParcela := True;

            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
            begin
               // André Pontes - 27/04/2004

               // ----------------------------------------------------------------------------------
               //    Verificações que antes ficavam na própria query de contratos
               // ----------------------------------------------------------------------------------

               //  ----------------------------------------------------------------------------------
               //    Verifica se existe prestação gerada (ou concessão) para o mês imediatamente anterior
               // ----------------------------------------------------------------------------------
               with qryH1 do
               begin
                  LimpaParametros(qryH1);
                  ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat;
                  ParamByName('PHMEANOCOMPETENCIA').AsInteger  := DiasUteis.ExtraiAno(DiasUteis.SomaMeses(EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1), -1));
                  ParamByName('PHMEMESCOMPETENCIA').AsInteger  := DiasUteis.ExtraiMes(DiasUteis.SomaMeses(EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1), -1));
                  Open;
               end;

               //Pendência 23384 - 15/01/2007 - Alberto - Padrão 14
               if not qryContratosGeracao.FieldByName('DATAMORTE').IsNull then
               begin
                 inc(iQuantErro);
                 memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                                   CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                                   CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                                   CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                                   CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                                   CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                                   'Mutuário possui data de falecimento preenchida'
                                  );
                 Next;
                 Continue;
               end;
               //Fim Pendência 23384

               // Pendência 20379 - 28/06/2006 - Alberto
               if (qryH1.IsEmpty) and
                  ((qryContratosGeracao.FieldByName('idtipocontremptmo').AsInteger <> 82) and (qryContratosGeracao.FieldByName('idtipocontremptmo').AsInteger <> 83)) then // Renato Visoni SOL 100074  KINTANA 442190
               begin
                  if not(qryContratosGeracao.FieldByName('FLGPERMITEPARCELA').AsInteger = 1) then  // Andre Pontes - 01/11/2004
                  begin
                     qryH1.Close;
                     inc(iQuantErro);
                     memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                                       CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                                       CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                                       CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                                       CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                                       CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                                       'Não foi localizada prestação nem concessão efetivada no mês anterior'
                                      );
                     Next;
                     Continue;
                  end
                  else  // if not(qryContratosGeracao.FieldByName('FLGPERMITEPARCELA').AsInteger = 1)
                  begin
                     // ----------------------------------------------------------------------------------
                     //    Verifica se já existe alguma prestação anterior
                     // ----------------------------------------------------------------------------------
                     with qryH6 do                   //qryContratosGeracao
                     begin
                        LimpaParametros(qryH6);
                        ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat;
                        Open;
                     end;
                    //Ewerton Beltramini - 09/11/2021 - SIG114941 - Inicio... (Comentado todo o bloco abaixo)
                    (*
                     if not(qryH6.IsEmpty) then
                     begin
                        qryH6.Close;
                        inc(iQuantErro);
                        memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                                          CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                                          CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                                          CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                                          CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                                          CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                                          'O Contrato já tem prestação anterior gerada'
                                         );
                        Next;
                        Continue;
                     end;  // if not(qryH6.IsEmpty)
                     *)
                     //Ewerton Beltramini - 09/11/2021 - SIG114941 - Fim
                  end;  // if not(qryContratosGeracao.FieldByName('FLGPERMITEPARCELA').AsInteger = 1)
               end;  // if qryH1.IsEmpty
               // Fim Pendência 20379
               // ----------------------------------------------------------------------------------

               // ----------------------------------------------------------------------------------
               //    Busca o nº da prestação imediatamente anterior
               // ----------------------------------------------------------------------------------
               with qryH2 do
               begin
                  LimpaParametros(qryH2);
                  ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat;
                  ParamByName('PHMEANOCOMPETENCIA').AsInteger  := word(trunc(DBspnAno.Value));
                  ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                  Open;
               end;

               if not(qryContratosGeracao.FieldByName('FLGPERMITEPARCELA').AsInteger = 1) then  // Andre Pontes - 01/11/2004
               begin
                  if qryH2.IsEmpty then
                  begin
                     qryH2.Close;
                     inc(iQuantErro);
                     memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                                       CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                                       CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                                       CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                                       CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                                       CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                                       'Não foi possível determinar o nº da prestação'
                                      );
                     Next;
                     Continue;
                  end;
               end;
               // ----------------------------------------------------------------------------------

               // ----------------------------------------------------------------------------------
               //    Busca o nº de prestações restantes
               // ----------------------------------------------------------------------------------
               with qryH3 do
               begin
                  LimpaParametros(qryH3);
                  ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat;
                  ParamByName('PHMEANOCOMPETENCIA').AsInteger  := word(trunc(DBspnAno.Value));
                  ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                  Open;
               end;

               if qryH3.IsEmpty then
               begin
                  if not(qryContratosGeracao.FieldByName('FLGPERMITEPARCELA').AsInteger = 1) then  // Andre Pontes - 01/11/2004
                  begin
                     inc(iQuantErro);
                     memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                                       CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                                       CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                                       CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                                       CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                                       CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                                       'Não foi possível determinar o nº de prestações restantes'
                                      );
                     Next;
                     Continue;
                  end;
               end;
               // ----------------------------------------------------------------------------------

               // ----------------------------------------------------------------------------------
               //    Verifica se já existe prestação gerada para o próprio mês
               // ----------------------------------------------------------------------------------
               with qryH4 do
               begin
                  LimpaParametros(qryH4);
                  ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat;
                  ParamByName('PHMEANOCOMPETENCIA').AsInteger  := word(trunc(DBspnAno.Value));
                  ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                  Open;
               end;

               if not(qryH4.IsEmpty) then
               begin
                  qryH4.Close;
                  inc(iQuantErro);
                  memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                                    CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                                    CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                                    CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                                    CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                                    CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                                    'O Contrato já tem prestação gerada para o mês selecionado'
                                   );
                  Next;
                  Continue;
               end;
               // ----------------------------------------------------------------------------------

               // ----------------------------------------------------------------------------------
               //    FIM Verificações que antes ficavam na própria query de contratos
               // ----------------------------------------------------------------------------------

               // FIM André Pontes - 27/04/2004
            end;


            // -------------------------------------------------------------------------------------
            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
            begin
               // não possui suspensão
               bGeraParcela := qryContratosGeracao.FieldByName('IDTIPOSUSPEMPTMO').IsNull;

               // ----------------------------------------------------------------------------------

               if not(bGeraParcela) then
               begin
                  // Possui suspensão, mas gera parcela
                  bGeraParcela := (qryContratosGeracao.FieldByName('FLGGERAPARCELAS').AsInteger = 1);
               end;

               // ----------------------------------------------------------------------------------

               if not(bGeraParcela) then
               begin
                  // Possui suspensão, tipo não parcela, está liberado e periodo de cobrança permite geração
                  //Pendência 20379 - 08/03/2007 - Alberto - Padrão 15
                  bGeraParcela := (not qryContratosGeracao.FieldByName('DATAFIMSUSP').IsNull) and
                                  (    qryContratosGeracao.FieldByName('DATAFIMSUSP').AsDateTime <= edtDataLancto.Date);
                  //Fim Pendência 20379
               end;

               // ----------------------------------------------------------------------------------
            end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1

            // -------------------------------------------------------------------------------------
            if not(bGeraParcela) then
            begin
               // Possui suspensão, tipo não parcela, está liberado e periodo de cobrança permite geração
               //Pendência 20379 - 08/03/2007 - Alberto - Padrão 15
                  bGeraParcela := (not qryContratosGeracao.FieldByName('DATAFIMSUSP').IsNull) and
                                  (    qryContratosGeracao.FieldByName('DATAFIMSUSP').AsDateTime <= edtDataLancto.Date);
               //Fim Pendência 20379
            end;
            // -------------------------------------------------------------------------------------

            if bGeraParcela then
            begin
               if not(dtmBaseDados.dbBaseDados.InTransaction) then dtmBaseDados.dbBaseDados.StartTransaction;

               // ----------------------------------------------------------------------------------
               // Para a FUNCEF, as queries "de crítica", que também determinam o nº da parcela e
               // o nº de prestações restantes são separadas. Para os outros clientes (especialmente
               // a CBS), por questões de desempenho, essas verificações são sub-queries da query
               // principal.
               // ----------------------------------------------------------------------------------
               if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
               begin
                  if qryH3.IsEmpty then
                  begin
                     bGeraParcela := qryContratosGeracao.FieldByName('FLGPERMITEPARCELA').AsInteger = 1;
                  end
                  else
                  begin
                     bGeraParcela := qryH3HMENUMPARCELAS.AsInteger > 0;
                  end;
               end
               else  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
               begin
                  bGeraParcela := qryContratosGeracao.FieldByName('HMENUMPARCELAS').AsInteger > 0;
               end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
               // ----------------------------------------------------------------------------------


               // ----------------------------------------------------------------------------------
               // Última verificação antes da efetiva geração (acima: se a parcela superou o total
               // de parcelas previstas)
               // ----------------------------------------------------------------------------------
               if not(bGeraParcela) then
               begin
                  memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                                    CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                                    CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                                    CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                                    CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                                    CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                                    'Contrato encerrado'
                                   );

                  inc(iQuantErro);

                  // troca o flgSituacao do Contrato para 'E'
                  MarcaContratoEncerrado;


                  if not(chkCommit.Checked) then CommitTransacao;
               end
               else  // if not(bGeraParcela)
               // ----------------------------------------------------------------------------------
               // Aqui ocorre o cálculo efetivo da parcela
               // ----------------------------------------------------------------------------------

               if GeraItensParcela((sPatro = '') and (sPlano = '')) then
               begin
                  inc(iQuantParcela);

                  if not(chkCommit.Checked) then CommitTransacao;
                  bGerou := True; // pelo menos 1 parcela gerada
               end
               else  // if GeraItensParcela...
               begin
                  inc(iQuantErro);

                  RollBackTransacao;
               end;  // if GeraItensParcela
            //Pendência 19660 - 03/07/2006 - Alberto
            end  // if bGeraParcela
            else
            begin
                     memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                                       CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                                       CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                                       CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                                       CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                                       CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                                       'Contrato com suspensão'
                                      );
            end;
            //Fim Pendência 19660
            // -------------------------------------------------------------------------------------
            // FIM do cálculo
            // -------------------------------------------------------------------------------------

            qryContratosGeracao.Next;
         end; // while not(qryContratosGeracao.EOF) do

         qryContratosGeracao.Close;
      end; // with qryContratosGeracao do

   finally
      if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
      EscondeFormProgresso;
   end;
end;

 //SOL 182431 Kintana 1700846 Rodrigo de Brito Figueredo - Inicio
function  TfrmExecGeraParcela.Suspende( idContratoEmptmo,hmePcarcela : String; pflgsuspcobranca : Boolean = False ): string;
Var
  qrySuspensao         :TwwQuery;
  sSuspensos           :String;
begin
   try
      sSuspensos :=' ';
      qrySuspensao               := TwwQuery.Create(Application);
      qrySuspensao.DatabaseName  := 'BaseDados';
      qrySuspensao.SQL.clear;
      //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
      qrySuspensao.SQL.Text :=' SELECT            '+
      //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
                              '            T.FLGSUSPENSAOITEM,  I.FLGSUSPENSO,       H.IDHISTMOVEMPTMO,           '+
                              '            H.FLGSUSPENSAO,      H.IDTIPOSUSPEMPTMO,  H.HMEPARCELA,                '+
                              '            I.FLGDESTACADO,      I.FLGCENTRALIZA,     I.ITCEVENTO, I.FLGSUSPCOBRANCA                  '+
                              '       FROM HISTMOVEMPTMO  H, TIPOSUSPEMPTMO T, ITEMXTIPOCONTR I, CONTRATOEMPTMO C '+
                              '      WHERE C.IDCONTRATOEMPTMO = '+idContratoEmptmo+'                              '+
                              '        AND T.IDTIPOSUSPEMPTMO(+) = C.IDTIPOSUSPEMPTMO                             '+
                              '        AND H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO                                '+
                              '        AND H.HMEPARCELA = '+hmePcarcela+'                                         '+
                              '        AND H.HMETIPOMOV = 1                                                       '+
                              '        AND NVL(H.FLGESTORNADO, 0) = 0                                             '+
                              '        AND I.IDTIPOCONTREMPTMO = C.IDTIPOCONTREMPTMO                              '+
                              '        AND I.IDITEMEMPTMO = H.IDITEMEMPTMO                                        ';

      qrySuspensao.open;

      if (qrySuspensao.IsEmpty)then
      begin
           result:= sSuspensos;
           exit;
      end;

      qrySuspensao.first;
      while not qrySuspensao.eof do
      begin
          if(qrySuspensao.FieldByName('FLGSUSPENSO').AsInteger <> 0)then
          begin
            if (qrySuspensao.FieldByName('ITCEVENTO').AsInteger = 1) then
            begin
              // Inicio SIG 131238 Ferrari
              if pflgsuspcobranca then
              begin
                if(qrySuspensao.FieldByName('FLGSUSPCOBRANCA').AsInteger = 1)then
                begin
                  sSuspensos := sSuspensos + qrySuspensao.FieldByName('IDHISTMOVEMPTMO').AsString + ' ,';
                end ;

              end
              else
              Begin
                //if(qrySuspensao.FieldByName('FLGSUSPENSAOITEM').AsInteger = 0)thenv  //WO32005 Leandro
                if((qrySuspensao.FieldByName('FLGSUSPENSAOITEM').AsInteger = 0) or     //WO32005 Leandro
                  (qrySuspensao.FieldByName('FLGSUSPCOBRANCA').AsInteger = 1)) then   //WO32005 Leandro
                begin
                  sSuspensos := sSuspensos + qrySuspensao.FieldByName('IDHISTMOVEMPTMO').AsString + ' ,';
                end
                else if((qrySuspensao.FieldByName('FLGSUSPENSAOITEM').AsInteger = 1) and
                       (((qrySuspensao.FieldByName('FLGCENTRALIZA').AsInteger = 0)   and
                       (qrySuspensao.FieldByName('FLGDESTACADO').AsInteger = 0))    or
                       (qrySuspensao.FieldByName('FLGCENTRALIZA').AsInteger = 1)))   then
                     begin
                       sSuspensos := sSuspensos + qrySuspensao.FieldByName('IDHISTMOVEMPTMO').AsString + ' ,';
                     end
                     else if(qrySuspensao.FieldByName('FLGSUSPENSAOITEM').AsInteger = 2) and
                            ( qrySuspensao.FieldByName('FLGDESTACADO').AsInteger = 1)   then
                          begin
                            sSuspensos := sSuspensos + qrySuspensao.FieldByName('IDHISTMOVEMPTMO').AsString + ' ,';
                          end
              end;
              // Fim SIG 131238
            end;
          end;
          qrySuspensao.next;
      end;
      sSuspensos[length(sSuspensos)]:=' ';
   finally
     FreeAndNil(qrySuspensao);
     result := trim(sSuspensos);
   end;
end; // function  Suspende( idContratoEmptmo,hmePcarcela : Integer ): String;                                                            1

 //SOL 182431 Kintana 1700846 Rodrigo de Brito Figueredo - Fim

 //WO14072 - Leandro Pocebon - Inicio
function  TfrmExecGeraParcela.SuspendePorCarencia( idContratoEmptmo,hmePcarcela : String; pflgsuspcobranca : Boolean = False ): string;
Var
  qrySuspensao         :TwwQuery;
  sSuspensos           :String;
begin
   try
      sSuspensos :=' ';
      qrySuspensao               := TwwQuery.Create(Application);
      qrySuspensao.DatabaseName  := 'BaseDados';
      qrySuspensao.SQL.clear;
      qrySuspensao.SQL.Text :=' SELECT            '+
                              '            H.IDHISTMOVEMPTMO,           '+
                              '            H.FLGSUSPENSAO,      H.IDTIPOSUSPEMPTMO,  H.HMEPARCELA                '+
                              '       FROM HISTMOVEMPTMO  H,  CONTRATOEMPTMO C '+
                              '      WHERE C.IDCONTRATOEMPTMO = '+idContratoEmptmo+'                              '+
                              '        AND H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO                                '+
                              '        AND H.HMEPARCELA = '+hmePcarcela+'                                         '+
                              '        AND H.HMETIPOMOV = 1                                                       '+
                              '        AND NVL(H.FLGESTORNADO, 0) = 0                                             '+
                              '        AND H.IDITEMEMPTMO IN (159,165)                                            ';

      qrySuspensao.open;

      if (qrySuspensao.IsEmpty)then
      begin
           result:= sSuspensos;
           exit;
      end;

      qrySuspensao.first;
      while not qrySuspensao.eof do
      begin
        sSuspensos := sSuspensos + qrySuspensao.FieldByName('IDHISTMOVEMPTMO').AsString + ' ,';
          qrySuspensao.next;
      end;
      sSuspensos[length(sSuspensos)]:=' ';
   finally
     FreeAndNil(qrySuspensao);
     result := trim(sSuspensos);
   end;
end;

 //WO14072 - Leandro Pocebon - Fim


function TfrmExecGeraParcela.GeraItensParcela(bGravaQueryRegra: Boolean): Boolean;
var
   bOk                  : Boolean;
   bErro                : Boolean;
   iRegraTxJuros        : Int64;
   dDataPrevista        : TDateTime;
   dDataVencto          : TDateTime;
   dDataAConsiderar     : TDateTime;
   rSitPart             : TSitPart;
   iParcelaAtual, i     : Integer;
   fVlrParcela          : Currency;
   fTxJuros             : Currency;
   bAlteraSaldoDevedor  : Boolean;
   rSaldosAntPos        : TSaldosAntPos;
   rSaldoDevAux         : TSaldoDevAnt;
   sSQL, tpsusp         : String;
   sData                : String;
   sIdsSuspensos        : String;  //SOL 182431 Kintana 1700846 Rodrigo de Brito Figueredo

   iIdTipoSuspEmptmo    : Integer; //Renato Visoni SOL 116271 - Kintana 545808


begin
   Result := True;

   try   // try..finally
      try   // try..except

         // ----------------------------------------------------------------------------------------
         // 1º - Determinação do nº da Parcela a ser gerada
         // ----------------------------------------------------------------------------------------

         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            iParcelaAtual := qryH2HMEPARCELA.AsInteger + 1;
         end
         else
         begin
            iParcelaAtual := qryContratosGeracao.FieldByName('HMEPARCELA').AsInteger + 1;
         end;

         if iParcelaAtual <= 0 then if qryContratosGeracao.FieldByName('FLGPERMITEPARCELA').AsInteger = 1 then iParcelaAtual := 1;

         // ----------------------------------------------------------------------------------------



         // ----------------------------------------------------------------------------------------
         // 2º - Verifica se o contrato já atingiu o total de prestações previstas (prazo)
         // ----------------------------------------------------------------------------------------

         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            bErro := (not(qryH3HMENUMPARCELAS.isNULL) and (qryH3HMENUMPARCELAS.AsInteger = 0)) and
                     not(qryContratosGeracao.FieldByName('FLGPERMITEPARCELA').AsInteger = 1);
         end
         else
         begin
            bErro := (not(qryContratosGeracao.FieldByName('HMENUMPARCELAS').isNULL) and
                       (qryContratosGeracao.FieldByName('HMENUMPARCELAS').AsInteger = 0)) and
                     not(qryContratosGeracao.FieldByName('FLGPERMITEPARCELA').AsInteger = 1);
         end;

         if bErro then
         begin
            memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                              CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                              CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                              CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                              CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                              CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                              'Contrato encerrado'
                             );

            // troca o flgSituacao do Contrato para 'E'
            MarcaContratoEncerrado;

            Result := False;
            Exit;
         end;  // if bErro

         // ----------------------------------------------------------------------------------------



         // ----------------------------------------------------------------------------------------
         // 3º - Busca o saldo devedor anterior, que será base para o cálculo da parcela
         // ----------------------------------------------------------------------------------------
         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            // André Pontes - 06/01/2005
            // Quando há amortização com data posterior à prestação anterior, o saldo fica errado
            // É preciso buscar a ÚLTIMA atualização de saldo devedor antes da prestação atual,
            // mas sem considerar atualizações diárias
            dDataAConsiderar := DataConsiderandoAmortizacaoAjuste(qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat,
                                                                  edtDataConsiderada.Date
                                                                 );

            // André Pontes - 29/09/2005
            // Na query da função acima foi incluído o hmetipomov = 0 também, para pegar eventuais
            // acertos de concessão, que seriam ignorados


            // Utiliza a busca do saldo específico
            rSaldoDevAnt  := CalcEmptmo.SaldoDevAnt(qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat,
                                                    // edtDataConsiderada.Date,  // André Pontes - 06/01/2005
                                                    dDataAConsiderar,            // André Pontes - 06/01/2005
                                                    0,
                                                    0,
                                                    True
                                                    ,False,True //Darivaldo Alencar SIG70512
                                                   );

            if rSaldoDevAnt.dDataAtuAnt < edtDataConsiderada.Date then
            begin
               rSaldoDevAnt  := CalcEmptmo.SaldoDevAnt(qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat,
                                                       qryContratosGeracao.FieldByName('DATACREDITO').AsDateTime,
                                                       0,
                                                       0,
                                                       True
                                                       ,False,True //Darivaldo Alencar SIG70512
                                                      );
            end;  // if rSaldoDevAnt.dDataAtuAnt <> edtDataConsiderada.Date
         end
         else  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
         begin
            // Utiliza a busca do saldo genérico
            rSaldoDevAnt := CalcEmptmo.SaldoDevAnt(qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat,
                                                   edtDataLancto.Date,
                                                   Trunc(DBspnAno.Value),
                                                   (cboMes.ItemIndex + 1),
                                                   False
                                                   ,False,True //Darivaldo Alencar SIG70512
                                                  );
         end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1

         // ----------------------------------------------------------------------------------------



         // ----------------------------------------------------------------------------------------
         // 4º - verifica se o saldo devedor está zerado
         // ----------------------------------------------------------------------------------------
         //Pendência 20379 - 28/06/2006 - Alberto
         if rSaldoDevAnt.fSaldoDevAnt <= 0 then
         begin
            memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                              CompletaInicio(FormatFloat('#0',  qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                              CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                              CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                              CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                              CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                              'Saldo devedor menor ou igual a ZERO'
                             );
         //Fim Pendência 20379

            Result := False;
            Exit;
         end;  // if rSaldoDevAnt.fSaldoDevAnt = 0

         // ----------------------------------------------------------------------------------------



         // ----------------------------------------------------------------------------------------
         // André Pontes - 16/09/2004
         // No caso da FUNCEF, não dá para usar o nº de prestações restantes do saldo devedor
         // ----------------------------------------------------------------------------------------
         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1 then
         begin
            if rSaldoDevAnt.iParcRestaAnt = 0 then
            begin
               memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                                 CompletaInicio(FormatFloat('#0',  qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                                 CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                                 CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                                 CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                                 CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                                 'Contrato encerrado'
                                );

               // troca o flgSituacao do Contrato para 'E'
               MarcaContratoEncerrado;

               Result := False;
               Exit;
            end;  // if rSaldoDevAnt.iParcRestaAnt = 0
         end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1

         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         // 5º - verifica se existem parcelas anteriores com divergência não tradada
         // ----------------------------------------------------------------------------------------
         if dtmEmptmo.qryParamEmptmoFLGPARCDIVERG.AsInteger = 1 then
         begin
            try   // try..finally
               with qryParcelasDivergentes do
               begin
                  LimpaParametros(qryParcelasDivergentes);
                  ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat;
                  ParamByName('PHMEPARCELA').AsInteger         := iParcelaAtual;
                  Open;

                  if FieldByName('ITENS_DIVERGENTES').AsInteger > 0 then
                  begin
                     memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                                       CompletaInicio(FormatFloat('#0',  qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                                       CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                                       CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                                       CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                                       CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                                       'Itens anteriores com divergência não tratada'
                                      );

                     Result := False;
                     LimpaParametros(qryParcelasDivergentes);
                     Exit;
                  end;  // if FieldByName('ITENS_DIVERGENTES').AsInteger > 0
               end;  // with qryParcelasDivergentes

            finally
               qryParcelasDivergentes.Close;
            end;
         end; // if dtmEmptmo.qryParamEmptmoFLGPARCDIVERG.AsInteger = 1

         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------

         // Limpa o registro com os dados do Contrato
         LimpaRegistroContrato(rContrato);
         LimpaRegistroConcessao(rConcessao);

         // ----------------------------------------------------------------------------------------



         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // André Pontes - 10/10/2005
         // Isso agora é o que vale para todos, INCLUSIVE FUNCEF. O código acima perdeu o sentido.
         // O registro do saldo anterior já está contemplando a prestação, uma vez que busca a última
         // atualização imediatamente anterior à prestação que se está tentando gerar
         rContrato.NumParcelas         := rSaldoDevAnt.iParcRestaAnt;
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------


         // Inicializa o registro com os dados do Contrato
         rContrato.IDContratoEmptmo    := qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat;
         rContrato.IDPessoa            := qryContratosGeracao.FieldByName('IDPESSOA').AsInteger;
         rContrato.IDTipoContrEmptmo   := qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
         rContrato.IDTipoEmptmo        := qryContratosGeracao.FieldByName('IDTIPOEMPTMO').AsInteger;
         rContrato.IDPlanoPrev         := qryContratosGeracao.FieldByName('IDPLANOPREV').AsInteger;
         rContrato.IDPatro             := qryContratosGeracao.FieldByName('IDPATRO').AsInteger;
         rContrato.IDBenef             := qryContratosGeracao.FieldByName('IDBENEF').AsInteger;

         rContrato.DataCredito         := qryContratosGeracao.FieldByName('DATACREDITO').AsDateTime;
         rContrato.DataSituacao        := qryContratosGeracao.FieldByName('DATASITUACAO').AsDateTime;
         rContrato.DataAssinatura      := qryContratosGeracao.FieldByName('DATAASSINATURA').AsDateTime;
         rContrato.DataPrimParc        := qryContratosGeracao.FieldByName('DATAPRIMPARC').AsDateTime;
         rContrato.DataCanc            := qryContratosGeracao.FieldByName('DATACANC').AsDateTime;
         rContrato.DataInscricao       := qryContratosGeracao.FieldByName('DATAINSC').AsDateTime;
         rContrato.VlrContrato         := qryContratosGeracao.FieldByName('VLRCONTRATO').AsCurrency;
         rContrato.VlrParcela          := qryContratosGeracao.FieldByName('VLRPARCELA').AsCurrency;
         rContrato.Txjuros             := qryContratosGeracao.FieldByName('TXJUROS').AsCurrency;
         rContrato.FlgFormaRec         := qryContratosGeracao.FieldByName('FLGFORMAREC').AsString;
         rContrato.FlgFormaPag         := qryContratosGeracao.FieldByName('FLGFORMAPAG').AsString;
         rContrato.Indexador           := qryContratosGeracao.FieldByName('MOECODIGO').AsInteger;
         rContrato.SiglaIndexador      := qryContratosGeracao.FieldByName('MOESIGLA').AsString;

         //BRUNO AZEVEDO - VOTO DE EMPRESTIMO - 23/12/2013
         rContrato.sFlagPerdaEfetiva := 0;
         //BRUNO AZEVEDO - VOTO DE EMPRESTIMO - 23/12/2013

         // busca a situação do participante
         rSitPart := FuncoesEmptmo.BuscaSitPart(rContrato.IDPessoa);

         // ----------------------------------------------------------------------------------------
         // 6º - Determina as datas prevista e de vencimento da prestação
         // ----------------------------------------------------------------------------------------
         try
            // verifica a data prevista para recebimento

            // Marchetti - pendencia 26806
            dDataPrevista := -1;
            if not qryContratosGeracao.FieldByName('IDREGRAVENCPARC').IsNull then
            begin
               sSQL :=
               'SELECT '                                                                                            + #13 +
               '  0' + qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsString  + ' AS IDTIPOCONTREMPTMO, '   + #13 +
               '   ' + QuotedStr(FormatDateTime('dd/mm/yyyy',qryContratosGeracao.FieldByName('DATACREDITO').AsDateTime)) + ' AS DATACREDITO, '         + #13 +
               '   ' + IntToStr(cboMes.ItemIndex + 1)                                 + ' AS MESPROCESSO, '         + #13 +
               '   ' + FloatToStr(DBspnAno.Value)                                     + ' AS ANOPROCESSO, '         + #13 +
               '   ' + QuotedStr(dtmEmptmo.qryParamEmptmoCODESTADO.AsString)          + ' AS CODESTADO, '           + #13 +
               '   ' + IntToStr(dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger)             + ' AS IDPAIS, '              + #13 +
               '   ' + IntToStr(dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger)          + ' AS IDCIDADES, '           + #13 +
               '   ' + IntToStr(rSitPart.IDSitPart)                                   + ' AS IDSITPART, '           + #13 +
               '   ' + qryContratosGeracao.FieldByName('IDPLANOPREV').AsString        + ' AS IDPLANOPREV, '         + #13 +
               '   ' + qryContratosGeracao.FieldByName('IDBENEF').AsString            + ' AS IDPESSOA, '            + #13 +
               '   ' + qryContratosGeracao.FieldByName('IDPATRO').AsString            + ' AS IDPESSJUR, '           + #13 +
               '   ' + qryContratosGeracao.FieldByName('IDPESSOA').AsString           + ' AS IDTITULAR, '           + #13 +
               '   ' + QuotedStr(rSitPart.flgInterno)                                 + ' AS FLGINTERNO, '          + #13 +
               '   ' + qryContratosGeracao.FieldByName('FLGUSAMARGEMALT').AsString    + ' AS FLGUSAMARGEMALT, '     + #13 +
               '   ' + QuotedStr(FormatDateTime('dd/mm/yyyy',edtDataLancto.Date))     + ' AS DATAREF '              + #13 +
               'FROM '                                                                                              + #13 +
               '  DUAL ';

               if UtilizaRegraData(qryContratosGeracao.FieldByName('IDREGRAVENCPARC').AsInteger,
                                   sSQL,
                                   'e Data de Vencimento da Parcela',
                                   sData,
                                   False  // bMostraMsg
                                  ) then
               begin
                  if (sData <> '') and (sData <> 'NULO') then
                  begin
                     dDataPrevista := StrToDate(sData);
                  end;
               end;
            end;

            if dDataPrevista = -1 then
            begin
               dDataPrevista  := StrToDate(CalcEmptmo.CritDataEmptmo(qryAux, IntToStr(rContrato.IDPatro),
                                 IntToStr(rContrato.IDPlanoPrev), rSitPart.flgInterno, 'N', // NORMAL
                                 IntToStr(cboMes.ItemIndex + 1), FloatToStr(DBspnAno.Value),
                                 rContrato.FlgFormaRec, FormatDateTime('dd/mm/yyyy', rContrato.DataAssinatura),
                                 iParcelaAtual));
            end;
         except
            memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                              CompletaInicio(FormatFloat('#0',  qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                              CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                              CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                              CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                              CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                              'Erro na busca da Data Prevista para a parcela.'
                             );
            Result := False;
            Exit;
         end;  // try..except

         //Pendência 22750 - 07/07/2006 - Alberto
         vItens := nil;

         if Sistema.TipoCliente = 19991 then
         begin
            if rSaldoDevAnt.iParcRestaAnt = 1 then
            begin
               rSaldoDevAux := calcemptmo.SaldoDevAnt(qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat, dDataPrevista, 0, 0, True
                                                      ,False,True //Darivaldo Alencar SIG70512
                                                      );

               if rSaldoDevAux.fSaldoDevAnt = 0 then
               begin
                  memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                                    CompletaInicio(FormatFloat('#0',  qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                                    CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                                    CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                                    CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                                    CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                                    'Saldo do contrato não encontra-se atualizado para a data da prestação.');
                  Result := False;
                  Exit;
               end;
            end;
         end;
         //Fim Pendência 22750

         dDataVencto := dDataPrevista;

         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            if not(DiasUteis.DiaUtil(dDataVencto, iCidade, iPais, sEstado, True, True, False)) then
            begin
               repeat
                  dDataVencto := dDataVencto + 1;
               until
                  DiasUteis.DiaUtil(dDataVencto, iCidade, iPais, sEstado, True, True, False);
            end;
         end;
         // ----------------------------------------------------------------------------------------



         // ----------------------------------------------------------------------------------------
         // 7º - Determina a taxa de juros a utilizar
         // ----------------------------------------------------------------------------------------

         // traz os dados do histórico imediatamente anterior
         if qryContratosGeracao.FieldByName('IDREGRAJURCONC').IsNull then
         begin
            memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                              CompletaInicio(FormatFloat('#0',  qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                              CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                              CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                              CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                              CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                              'Regra de Taxa de Juros não foi informada.'
                             );
            Result := False;
            Exit;
         end;  // if qryContratosGeracaoIDREGRAJURCONC.IsNull

         iRegraTxJuros  := qryContratosGeracao.FieldByName('IDREGRAJURCONC').AsInteger;

         // ----------------------------------------------------------------------------------------

         fTxJuros       := CalcEmptmo.BuscaTxJuros(rContrato,
                                                   iRegraTxJuros,
                                                   iParcelaAtual,
                                                   dDataPrevista,
                                                   rSaldoDevAnt.fTxJurosAnt,
                                                   rSaldoDevAnt.fSaldoDevAnt,
                                                   False,
                                                   rContrato.Indexador,
                                                   1,
                                                   1,
                                                   1
                                                  );

         // ----------------------------------------------------------------------------------------

         if fTxJuros <= 0 then
         begin
            memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                              CompletaInicio(FormatFloat('#0',  qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                              CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                              CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                              CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                              CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                              'ERRO na busca da taxa de Juros.'
                             );
            Result := False;
            Exit;
         end;  // if fTxJuros <= 0

         // ----------------------------------------------------------------------------------------



         // ----------------------------------------------------------------------------------------
         bAlteraSaldoDevedor := (qryContratosGeracao.FieldByName('FLGATUALSALDOPARC').IsNull) or
                                (qryContratosGeracao.FieldByName('FLGATUALSALDOPARC').AsInteger = 1);
         // ----------------------------------------------------------------------------------------



         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         // 8º - faz o cálculo
         // ----------------------------------------------------------------------------------------

         //Renato Visoni SOL 116271 - Kintana 545808
         iIdTipoSuspEmptmo := -1;

         if (dDataPrevista >= qryContratosGeracao.FieldByName('DATAINICIOSUSP').AsDateTime) and (dDataPrevista <= qryContratosGeracao.FieldByName('DATAFIMSUSP').AsDateTime) then begin
           iIdTipoSuspEmptmo := qryContratosGeracao.FieldByName('IDTIPOSUSPEMPTMO').AsInteger;
         end;
         //Renato Visoni SOL 116271 - Kintana 545808


         bOk := CalcEmptmo.CalculaItens(rContrato,
                                        rConcessao,
                                        1, // Evento = Parcela
                                        1, // Origem = Geração de Parcelas
                                        iPais, sEstado, iCidade,
                                        iParcelaAtual,
                                        rSitPart.IDSitPart,
                                        rContrato.FlgFormaRec,
                                        fTxJuros,
                                        rSaldoDevAnt.fSaldoDevAnt,
                                        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                        0, 0, 0,
                                        dDataPrevista,
                                        dDataAConsiderar,
                                        PegaAnoMes,
                                        True,
                                        False,
                                        False,
                                        vItens,
                                        0, 0, 0,
                                        bAlteraSaldoDevedor,
                                        0, 0, -1,
                                        False,
                                        0, 0, 0, 0, 0,
                                        bGravaQueryRegra,
                                        // SOL115818 - Daniel Begnami
                                        0,
                                        False,
                                        qryContratosGeracao.FieldByName('TSEMESES').AsInteger,
                                        iIdTipoSuspEmptmo, //Renato Visoni SOL 116271 - Kintana 545808  qryContratosGeracao.FieldByName('IDTIPOSUSPEMPTMO').AsInteger
                                        // FIM
                                        //Leandro WO14072 inicio
                                        nil,
                                        0,
                                        '-1',
                                        false,
                                        qryContratosGeracao.FieldByName('QTDE_PARCELAS_GERADAS').AsInteger,
                                        qryContratosGeracao.FieldByName('CARENCIA').AsInteger,
                                        qryContratosGeracao.FieldByName('SALDODEVATU').AsFloat,
                                        qryContratosGeracao.FieldByName('VLRPARCELA').AsFloat
                                        //Leandro WO14072 fim
                                       );

         // ----------------------------------------------------------------------------------------

         if bOk then
         begin
            // -------------------------------------------------------------------------------------

            // inicializa o totalizador do valor da parcela
            fVlrParcela := 0;

            // -------------------------------------------------------------------------------------
            // verifica o valor total da Parcela
            // -------------------------------------------------------------------------------------
            for i := 0 to High(vItens) do
            begin
               if vItens[i].iEvento = 1 then
               begin
                  vItens[i].ParcelaAlt := rSaldoDevAnt.iParcelaAltAnt + 1; // já incrementando o nº da prestação
                  vItens[i].ValorBase  := rSaldoDevAnt.fSaldoDevAnt;
               end;

               // se for o item centralizador
               //Pendência 24445 - 08/02/2007 - Alberto
               if ( (vItens[i].iEvento = 1) and ((vItens[i].FlgCentraliza = 1) or (vItens[i].FlgDestacado = 1)) ) then
               begin
                  fVlrParcela          := fVlrParcela + vItens[i].Valor;
                  vItens[i].DataVencto := dDataVencto;
               end;
               //Fim Pendência 24445
            end; // for i := 0 to High(vItens)
            // -------------------------------------------------------------------------------------


            // -------------------------------------------------------------------------------------
            // NumParcelas será a quantidade de parcelas que faltam para acabar o EP
            // Para a gravação, subtrai 1 das parcelas remanescentes
            if ( (qryContratosGeracao.FieldByName('FLGDEDUZPARCREST').AsInteger = 1) or
                 (qryContratosGeracao.FieldByName('FLGDEDUZPARCREST').IsNull)
               ) then
            begin
               rContrato.NumParcelas := rContrato.NumParcelas - 1;
            end
            else
            begin
               rContrato.NumParcelas := rContrato.NumParcelas;
            end;
            // -------------------------------------------------------------------------------------

            CalcEmptmo.GravaMovEmptmo(rContrato,
                                      vItens,
                                      1, // = parcela
                                      iParcelaAtual,
                                      trunc(DBspnAno.Value),
                                      (cboMes.ItemIndex + 1),
                                      DiasUteis.ExtraiAno(dDataPrevista),
                                      DiasUteis.ExtraiMes(dDataPRevista),
                                      rContrato.NumParcelas, // nº de parcelas remanescentes
                                      dDataPrevista,
                                      dDataPrevista,
                                      '',
                                      '',
                                      False
                                     );

            // -------------------------------------------------------------------------------------
            // Suspensão da prestação
            // -------------------------------------------------------------------------------------
            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
            begin
               if not(qryContratosGeracao.FieldByName('IDTIPOSUSPEMPTMO').IsNull) and
                  ((qryContratosGeracao.FieldByName('DATAFIMSUSP').IsNull or
                  ((not qryContratosGeracao.FieldByName('DATAFIMSUSP').IsNull) and
                  (dDataPrevista <= qryContratosGeracao.FieldByName('DATAFIMSUSP').AsDateTime))) and
                  //BRUNO AZEVEDO SOL 139630 KINTANA 859932
                  ((qryContratosGeracao.FieldByName('DATAINICIOSUSP').IsNull or
                  ((not qryContratosGeracao.FieldByName('DATAINICIOSUSP').IsNull) and
                  (dDataPrevista >= qryContratosGeracao.FieldByName('DATAINICIOSUSP').AsDateTime))))
                  //BRUNO AZEVEDO SOL 139630 KINTANA 859932
                  ) then
               begin
                  // André Pontes - 20/06/2005 - pendência 19405
                  if not((rContrato.NumParcelas = 0) and (qryContratosGeracao.FieldByName('FLGATUALSALDOPARC').AsInteger = 0)) then
                  begin
                     // André Pontes - 07/04/2006 - pendência
                     // Query alterada para filtrar por HmeTipoMov = 1 (estava pegando outros itens
                     // de mesmo nº de parcela - apontado por Luciana)
                 //SOL 182431 Kintana 1700846 Rodrigo de Brito Figueredo - Inicio
                     // Vinicius Ferreira SOL 169288 KINATNA 1501886 - Inicio - Comentado
                  {   If qryContratosGeracao.FieldByName('FLGCOBRJUDICIAL').AsInteger = 1 then
                     begin
                       LimpaParametros(qrySuspendeParcelaJudicial);
                       qrySuspendeParcelaJudicial.ParamByName('PIDCONTRATOEMPTMO').AsFloat    := rContrato.IDContratoEmptmo;
                       qrySuspendeParcelaJudicial.ParamByName('PHMEPARCELA').AsInteger        := iParcelaAtual;
                       qrySuspendeParcelaJudicial.ParamByName('PIDTIPOSUSPEMPTMO').AsInteger  := qryContratosGeracao.FieldByName('IDTIPOSUSPEMPTMO').AsInteger;
                       qrySuspendeParcelaJudicial.ExecSql;
                     End else begin
                       LimpaParametros(qrySuspendeParcela);
                       qrySuspendeParcela.ParamByName('PIDCONTRATOEMPTMO').AsFloat    := rContrato.IDContratoEmptmo;
                       qrySuspendeParcela.ParamByName('PHMEPARCELA').AsInteger        := iParcelaAtual;
                       qrySuspendeParcela.ParamByName('PIDTIPOSUSPEMPTMO').AsInteger  := qryContratosGeracao.FieldByName('IDTIPOSUSPEMPTMO').AsInteger;
                       qrySuspendeParcela.ExecSql;
                     end;
                     // Vinicius Ferreira SOL 169288 KINATNA 1501886 - Fim}
                  //SOL 182431 Kintana 1700846 Rodrigo de Brito Figueredo - Fim - Comentado
                  end;  // if (rContrato.NumParcelas > 0)
               end;  // if not...
            end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1

           //Inicio - SOL 262264 PPM1087069 - Marcelo Cardoso/Fernando Xavier

           if not(qryContratosGeracao.FieldByName('IDTIPOSUSPEMPTMO').IsNull) and
              ((qryContratosGeracao.FieldByName('DATAFIMSUSP').IsNull or
              ((not qryContratosGeracao.FieldByName('DATAFIMSUSP').IsNull) and
              (dDataPrevista <= qryContratosGeracao.FieldByName('DATAFIMSUSP').AsDateTime))) and

              ((qryContratosGeracao.FieldByName('DATAINICIOSUSP').IsNull or
              ((not qryContratosGeracao.FieldByName('DATAINICIOSUSP').IsNull) and
              (dDataPrevista >= qryContratosGeracao.FieldByName('DATAINICIOSUSP').AsDateTime))))

              ) then
           begin
                 sIdsSuspensos := suspende(floatToStr(rContrato.IDContratoEmptmo),intToStr(iParcelaAtual));
           end
           // Inicio SIG 131238
           else if qryContratosGeracao.FieldByName('FLGSUSPCOBRANCA').asinteger = 1 then
                 sIdsSuspensos := suspende(floatToStr(rContrato.IDContratoEmptmo),intToStr(iParcelaAtual), True)
                //WO17042 - INICIO
                else
                  if (qryContratosGeracao.FieldByName('QTDE_PARCELAS_GERADAS').asinteger <= qryContratosGeracao.FieldByName('CARENCIA').asinteger) then
                    sIdsSuspensos := suspendeporcarencia(floatToStr(rContrato.IDContratoEmptmo),intToStr(iParcelaAtual), True);

                //WO17042 - FIM

           //Fim - SOL 262264 PPM1087069 - Marcelo Cardoso/Fernando Xavier

           if (not( sIdsSuspensos = '' ) and
           (qryContratosGeracao.FieldByName('IDTIPOSUSPEMPTMO').AsString <> ''))
           or (not( sIdsSuspensos = '' ) and
           (qryContratosGeracao.FieldByName('FLGSUSPCOBRANCA').asinteger = 1)) //Marcio Sanches Spinosa SOL 208835 KINTANA 2016972
           or (not( sIdsSuspensos = '' ) and
           (qryContratosGeracao.FieldByName('QTDE_PARCELAS_GERADAS').asinteger <= qryContratosGeracao.FieldByName('CARENCIA').asinteger)) then //Leandro WO14072
              begin
                 if qryContratosGeracao.FieldByName('IDTIPOSUSPEMPTMO').AsString = '' then
                   tpsusp := '1'
                 else
                   tpsusp := qryContratosGeracao.FieldByName('IDTIPOSUSPEMPTMO').AsString;
                 qryUptSuspItem.SQL.Add('UPDATE HISTMOVEMPTMO                                                                            '+
                                        '   SET FLGSUSPENSAO     = 1 ,                                                                   '+
                                        '       IDTIPOSUSPEMPTMO = '+tpsusp+'      '+
                                        ' WHERE IDHISTMOVEMPTMO IN ('+sIdsSuspensos+')                                                   ');
                 qryUptSuspItem.ExecSql;
                 qryUptSuspItem.SQL.Clear;
              end;
            //SOL 182431 Kintana 1700846 Rodrigo de Brito Figueredo - Fim
            // Fim SIG 131238

            // -------------------------------------------------------------------------------------

            // -------------------------------------------------------------------------------------

            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
            begin
               dtmAtualizacaoDiaria.ExecutaAjusteSaldo(qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat,
                                                       (rSaldoDevAnt.dDataAtuAnt + 1),    // André Pontes - pendência 19661 - 11/07/2005
                                                       rSaldoDevAnt.fSaldoDevAnt          // -1 // O saldo deve ser buscado
                                                      );
            end;

            // -------------------------------------------------------------------------------------

            // grava o resultado no memo
            memResult.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                                CompletaInicio(FormatFloat('#0', qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                                CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                                CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                                CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                                CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                                CompletaInicio(IntToStr(iParcelaAtual), ' ', 7) + ' ' +
                                CompletaInicio(FormatFloat('#0.00', fVlrParcela), ' ', 15)
                               );

            // -------------------------------------------------------------------------------------

            // acumulador de valor total das parcelas geradas
            fVlrTotParcelas := fVlrTotParcelas + fVlrParcela;

            // Verifica NOVAMENTE a quantidade de parcelas restantes, depois do cálculo.
            // Se a quantidade for ZERO, ie, é a última parcela, marca o contrato como ENCERRADO
            // (é necessário para que o recebimento possa quitar o contrato)

            if rContrato.NumParcelas = 0 then MarcaContratoEncerrado;
         end
         else  // if bOk
         begin
            // grava o erro no memo
            memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                              CompletaInicio(FormatFloat('#0',  qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                              CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                              CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                              CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                              CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                              'ERRO no cálculo dos itens de parcela'
                             );

            Result := False;
         end;  // if bOk

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

      except
         // grava o erro no memo
         memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                           CompletaInicio(FormatFloat('#0',  qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) +
                           CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                           CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                           CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                           CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                           'ERRO no processo'
                          );

         Repaint;
         Result := False;
      end;  // try..except

   finally
      // Limpa o registro com os dados do Contrato
      LimpaRegistroContrato(rContrato);
      LimpaRegistroConcessao(rConcessao);
   end;  // try..finally
end;



function TfrmExecGeraParcela.MarcaContratoEncerrado: Boolean;
begin
   Result := True;

   try
      try
         with qryMarcaContratoEncerrado do
         begin
            LimpaParametros(qryMarcaContratoEncerrado);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryContratosGeracao.FieldByName('IDCONTRATOEMPTMO').AsFloat;
            ExecSQL;
         end;
      except;
         Result := False;
      end;

   finally
      qryMarcaContratoEncerrado.Close;
   end;
end;



function TfrmExecGeraParcela.Contabiliza: Integer;
var
   sResult     : TStringList;
   sErro       : TStringList;
   sSQL        : String;
   sHistorico  : String;
   iPlanilha   : Integer;
begin
   // Pendência 19929 - 26/06/2006 - Alberto Carvalho
   sErro := TStringList.Create;

   // monta o select que será passado para para a função de contabilização
   sSQL :=
   'SELECT '                                                                                 + #13 +
   '   H.IDHISTMOVEMPTMO, '                                                                  + #13 +
   '   H.IDCONTRATOEMPTMO, TC.IDTIPOCONTREMPTMO, '                                           + #13 +
   '   C.IDPLANOORIGEM, '                                                                    + #13 +
   '   DECODE(C.IDPLANOORIGEM, NULL, C.IDPLANOPREV, C.IDPLANOORIGEM) AS IDPLANOPREV, '       + #13 +

   '   C.IDPATRO, '                                                                          + #13 +
   '   H.IDITEMEMPTMO, ITE.ITEDESCRICAO, H.IDITEMCENTRALIZA, '                               + #13 +
   '   ( ' +
   '   (LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, ''0000'')))) ' +
   '   || ' +
   '   (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, ''00'')))) ' +
   '   ) AS ANOMES, '                                                                        + #13 +

   '   H.HMEFORMACOBRANCA, '                                                                 + #13 +
   '   H.HMEVLRPREVISTO, H.HMEVLREFETIVO, '                                                  + #13 +

   '   ITC.TIPCODIGO '                                                                       + #13 +

   'FROM '                                                                                   + #13 +
   '   HISTMOVEMPTMO   H,   '                                                                + #13 +
   '   ITEMXTIPOCONTR  ITC, '                                                                + #13 +
   '   ITEMEMPTMO      ITE, '                                                                + #13 +
   '   CONTRATOEMPTMO  C,   '                                                                + #13 +
   '   TIPOCONTREMPTMO TC,  '                                                                + #13 +
   '   TIPOEMPTMO      TE   '                                                                + #13 +

   'WHERE '                                                                                  + #13 +
   '       ( C.FLGSITUACAO          <> ''C'') '                                              + #13 +
   '   AND ( H.HMEANOCOMPETENCIA    = ' + FormatFloat('0000', DBspnAno.Value) + ' ) '        + #13 +
   '   AND ( H.HMEMESCOMPETENCIA    = ' + IntToStr(cboMes.ItemIndex + 1) + ' ) '             + #13 +
   '   AND ( H.HMETIPOMOV           = 1 ) '                                                  + #13 +
   '   AND ( H.HMEORIGEM            = 1 ) '                                                  + #13 +

   // André Pontes - 17/05/2005 - pendência 19249
   '   AND H.HMESEQCOBRANCA         = 1 '                                                    + #13 +
   '   AND H.HMEVLRPREVISTO        <> 0 '                                                    + #13 +
   // FIM André Pontes - 17/05/2005 - pendência 19249

   // André Pontes - 17/05/2005 - pendência 19264
   '   AND NVL(ITC.FLGNAOCONTAB, 0) = 0 '                                                    + #13 +
   // FIM André Pontes - 17/05/2005 - pendência 19264

   '   AND ( H.HMECENTRALIZA        = 0 OR H.HMECENTRALIZA IS NULL ) '                       + #13 +

   '   AND ( '                                                                               + #13 +
   '       ( H.FLGESTORNADO         = 0 OR H.FLGESTORNADO IS NULL ) OR '                     + #13 +
   '       ( H.FLGESTORNADO         = 1 AND H.PLNCODIGOESTORNO IS NOT NULL ) '               + #13 +
   '       ) '                                                                               + #13 +

   '   AND ( H.PLNCODIGO            IS NULL ) '                                              + #13;

   if molContratoEmptmo.IdContrato > 0 then sSQL := sSQL +
   '   AND ( C.IDCONTRATOEMPTMO     = ' + FloatToStr(molContratoEmptmo.IdContrato) + ' ) '   + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND ( TC.IDTIPOEMPTMO        = ' + DBcboTipoEmptmo.LookupValue + ' ) '                + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND ( C.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue + ' ) '              + #13 +
   '   AND ( TC.IDTIPOCONTREMPTMO   = ' + DBcboTipoContrato.LookupValue + ' ) '              + #13;

   sSQL := sSQL +
   '   AND ( C.IDPATRO              IN (' + molListaPatro.PegaPatro + ') ) '                 + #13 +
   '   AND ( C.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') ) '                 + #13 +
   '   AND ( TE.IDEMPRESAPROP       = ' + IntToStr (Sistema.IDEmpresa) + ' ) '               + #13 +
   '   AND ( H.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTMO ) '                                 + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO ) '                               + #13 +
   '   AND ( TC.IDTIPOEMPTMO        = TE.IDTIPOEMPTMO ) '                                    + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( H.IDITEMEMPTMO         = ITC.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( ITC.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( H.IDITEMEMPTMO         = ITE.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( ITC.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO ) '                               + #13 +

   'ORDER BY ' +
   '   HMEANOCOMPETENCIA, HMEMESCOMPETENCIA, H.IDCONTRATOEMPTMO ';


   // prepara o Histórico-padrão que será passado adiante
   sHistorico  := 'EMPRESTIMOS DE PARTICIPANTES - Prestacoes de Emprestimo, ref: ' +
                  Copy(PegaAnoMes, 5, 2) + '/' + Copy(PegaAnoMes, 1, 4);

   if DBcboTipoContrato.LookupValue <> '' then sHistorico  := sHistorico + ', para contratos do tipo ' + DBcboTipoContrato.LookupValue;
   sHistorico  := sHistorico + '.';

   // ----------------------------------------------------------------------------------------------

   Result := IntegraEmptmo.ContabilizaItens('C',
                                            'N',
                                            sSQL,
                                            sHistorico,
                                            edtDataLancto.Date,
                                            sResult,
                                            sErro,
                                            iPlanilha
                                           );

   // ----------------------------------------------------------------------------------------------

   //Pendência 19929 - 26/06/2006 - Alberto Carvalho
   sErro.Free;
end;



procedure TfrmExecGeraParcela.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;
end;



function TfrmExecGeraParcela.VerificaPreenchimento: Boolean;
var
   dData       : TDateTime;
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := False;

   try
      ParametrosSistema;

      if cboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

      if DBspnAno.Value <= 1980 then
         raise EValidacao.CreateVal('É necessário indicar o Ano de Competência!', DBspnAno);

      if length(trim(edtDataLancto.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Lançamento!', edtDataLancto);

      // Marchetti - pendencia 26697
      if (dtmEmptmo.qryParamEmptmoFLGTRATAATUSLD.AsInteger = 1) and not(ExisteAtualizacaoDiaria) then
         raise EValidacao.CreateVal('Não existe Atualização de Saldo para este período!', cboMes);

      // -------------------------------------------------------------------------------------------
      // André Pontes - 03/06/2005 - pendência 19404
      if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
      begin
         // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
         // estorno na data de cancelamento indicada
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';

         // ----------------------------------------------------------------------------------------
         dData       := edtDataLancto.Date;
         sDataLanc   := FormatDateTime('dd/mm/yyyy', dData);

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível fazer o estorno contábil na data indicada:' + #13 + '"' + sMsgContab + '"', edtDataLancto);

         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
            sMsgContab := Contab.MessageInfo;
            raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', edtDataLancto);
         end;
         // ----------------------------------------------------------------------------------------
      end;
      // FIM André Pontes - 03/06/2005 - pendência 19404
      // -------------------------------------------------------------------------------------------

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



procedure TfrmExecGeraParcela.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;


   chkInArquivo.Visible    := (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1);
   chkNotInArquivo.Visible := (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1);

   chkCommit.Visible       := false;
   chkCommit.Enabled       := false;

   ntbPrincipal.PageIndex  := 0;

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex        := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasUteis.ExtraiAno(Date);

   if Sistema.TipoCliente = 20071 then
      edtDataLancto.Date      := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 25)
   else
      edtDataLancto.Date      := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1);

   // Marca a não contabilização se o parâmetro do sistema assim obrigar ---------------------------
   if dtmEmptmo.qryParamEmptmoFLGCONTABPARCELA.AsInteger = 1 then
   begin
      chkNAOContabiliza.Checked     := True;
      chkNAOContabiliza.Enabled     := False;
   end
   else
   begin
      chkNAOContabiliza.Checked     := False;
      chkNAOContabiliza.Enabled     := True;
   end;
   // ----------------------------------------------------------------------------------------------

   // só mostra "data a considerar" se for FUNCEF --------------------------------------------------
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
//      qryContratosGeracao.SQL.Strings[0] := 'SELECT /*+RULE */ ';

      edtDataConsiderada.Date    := StrToDate('20/' + MesAnoAnterior(cboMes.ItemIndex + 1, trunc(DBspnAno.Value)));
      lblDataConsiderar.Visible  := True;
      edtDataConsiderada.Visible := True;
   end
   else
   begin
      lblDataConsiderar.Visible  := False;
      edtDataConsiderada.Visible := False;

      chkInArquivo.Checked       := False;
      chkNotInArquivo.Checked    := False;
   end;
   // ----------------------------------------------------------------------------------------------

   iPais       := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
   sEstado     := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;
   iCidade     := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;

   AbreQueries;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



procedure TfrmExecGeraParcela.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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
         Open;

         DBcboTipoContrato.Enabled := True;
      end
      else
      begin
         DBcboTipoContrato.Enabled := False;
      end;
   end;
end;



procedure TfrmExecGeraParcela.cboMesExit(Sender: TObject);
begin
   inherited;
   // preenche a data de lançamento e a data a considerar
   edtDataLancto.Date      := EncodeDate(StrToInt(IntToStr(trunc(DBspnAno.Value))), (cboMes.ItemIndex + 1), 1);
   edtDataConsiderada.Date := StrToDate('20/' + MesAnoAnterior(cboMes.ItemIndex + 1, trunc(DBspnAno.Value)));

   if Sistema.TipoCliente = 20071 then
   begin
      edtDataLancto.Date      := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 25);
      edtDataConsiderada.Date := StrToDate('25/' + MesAnoAnterior(cboMes.ItemIndex + 1, trunc(DBspnAno.Value)));
   end;
end;



procedure TfrmExecGeraParcela.DBcboTipoEmptmoExit(Sender: TObject);
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
         Open;

         DBcboTipoContrato.Enabled := True;
      end
      else
      begin
         DBcboTipoContrato.Enabled := False;
      end;
   end;
end;



procedure TfrmExecGeraParcela.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.Filtro := 'AND CON.FLGSITUACAO = ''A''';
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TfrmExecGeraParcela.btnVoltarClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
end;



procedure TfrmExecGeraParcela.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
  inherited;
  molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



function TfrmExecGeraParcela.ExisteAtualizacaoDiaria: Boolean;
var
   sSQL  : String;
   dData : TDateTime;
   iDia, iMes, iAno : Word;
begin
   dData  := DiasUteis.SomaMeses(EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1), -1);
   DecodeDate(dData, iAno, iMEs, iDia);
   dData  := DiasUteis.UltDiaMes(iAno, iMes);

   sSQL := 'SELECT COUNT(*) AS TOTAL FROM HISTMOVEMPTMO WHERE HMETIPOMOV = 5 AND HMEDATAPREVISTA = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dData)) + ',''dd/mm/yyyy'')';

   dtmEmptmo.qryAux.Close;
   dtmEmptmo.qryAux.SQL.Clear;
   dtmEmptmo.qryAux.SQL.Text := sSQL;
   dtmEmptmo.qryAux.Open;

   Result := (dtmEmptmo.qryAux.FieldByName('TOTAL').AsInteger > 0);

   dtmEmptmo.qryAux.Close;
end;



procedure TfrmExecGeraParcela.VerificaContratosNaoEfetivados;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                + #13 +
   '    CNT.IDCONTRATOEMPTMO '                              + #13 +
   'FROM '                                                  + #13 +
   '    HISTMOVEMPTMO HME, CONTRATOEMPTMO CNT'              + #13 +
   'WHERE '                                                 + #13 +
   '    HME.HMETIPOMOV       = 0 '                          + #13 +
   'AND HME.HMEDATAEFETIVA   IS NULL '                      + #13 +
   'AND CNT.FLGSITUACAO      = ''A'' '                      + #13 +
   'AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1) ' + #13 +
   'AND HME.IDCONTRATOEMPTMO = CNT.IDCONTRATOEMPTMO '       + #13;

   if molContratoEmptmo.IdContrato > 0 then
   begin
      sSQL := sSQL + 'AND HME.IDCONTRATOEMPTMO = ' + FloatToStr(molContratoEmptmo.IdContrato) + #13;
   end;

   dtmEmptmo.qryAux.Close;
   dtmEmptmo.qryAux.SQL.Clear;
   dtmEmptmo.qryAux.SQL.Text := sSQL;
   dtmEmptmo.qryAux.Open;

   dtmEmptmo.qryAux.First;
   while not(dtmEmptmo.qryAux.EOF) do
   begin
      memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                        CompletaInicio(dtmEmptmo.qryAux.FieldByName('IDCONTRATOEMPTMO').AsString, ' ', 15) + ' ' +
                        CompletaFim(qryContratosGeracao.FieldByName('MATRICULA').AsString, ' ', 15) + ' ' +
                        CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                        CompletaFim(FormatFloat(#0, qryContratosGeracao.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                        CompletaInicio(FormatFloat(#0, qryContratosGeracao.FieldByName('IDTIPOCONTREMPTMO').AsFloat), ' ', 4) + ' ' +
                        'Contrato não efetivado'
                       );
      inc(iQuantErro);
      dtmEmptmo.qryAux.Next;
   end;

   dtmEmptmo.qryAux.Close;
end;



procedure TfrmExecGeraParcela.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmExecGeraParcela.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmExecGeraParcela.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TfrmExecGeraParcela.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



Function TfrmExecGeraParcela.VerificaParcelaCobrancaJudicial : Integer;
var
   bParcela          : Boolean;
   dDataSusp         : TDateTime;
   sSql              : String;
   iIdTipoSuspEmptmo : Int64;
   iQuantParcAtras   : Integer;
   iContadorPatro    : Integer;
   iContadorPlano    : Integer;
begin
   iIdTipoSuspEmptmo := -1;

   qryAux.Close;
   qryAux.Sql.Text := 'SELECT IDTIPOSUSPEMPTMO FROM TIPOSUSPEMPTMO WHERE FLGCOBRJUDICIAL = 1';
   qryAux.Open;
   if not(qryAux.IsEmpty) then iIdTipoSuspEmptmo := qryAux.FieldByName('IDTIPOSUSPEMPTMO').AsInteger;
   qryAux.Close;

   Result := 0;
   // Se não houver suspensão judicial, segue em frente...
   if iIdTipoSuspEmptmo = -1 then Exit;

   dDataSusp := SysDate;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------


   // ----------------------------------------------------------------------------------------------
   // 1º - Abre os tipos de contrato,
   // 2º - Itera pelos tipos de Contrato, verificando quantidade de prestações em aberto permitidas
   // 3º - Dentro desse loop, haverá mais 2 loops, por Plano e Patrocinadora, para tornar as query
   //      de parcelas atrasadas mais leve
   // 4º - Suspende os contratos com parcelas atrasadas
   // ----------------------------------------------------------------------------------------------

   with qryTipoContr do
   begin
      LimpaParametros(qryTipoContr);

      ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;

      if molContratoEmptmo.IDContrato > 0    then ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := Sistema.IDEmpresa;
      if molContratoEmptmo.IDContrato > 0    then ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := molContratoEmptmo.IDTipoContr;
      if DBcboTipoEmptmo.LookupValue <> ''   then ParamByName('PIDTIPOEMPTMO').AsInteger        := StrToInt(DBcboTipoEmptmo.LookupValue);
      if DBcboTipoContrato.LookupValue <> '' then ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := StrToInt(DBcboTipoContrato.LookupValue);

      Open;
      First;
   end;

   while not(qryTipoContr.EOF) do
   begin
      if molContratoEmptmo.IDContrato > 0 then
      begin
         if not(SelecionaParcelasAtrasadas(-1, -1)) then
         begin
            EscondeEspera;
            Repaint;
         end
         else
         begin
            // -------------------------------------------------------------------------------------
            if not(dtmBaseDados.dbBaseDados.InTransaction) then dtmBaseDados.dbBaseDados.StartTransaction;

            try
               while not(qryParcelasAtrasadas.EOF) do
               begin
                  LimpaParametros(qryUpdateContrato);
                  qryUpdateContrato.ParamByName('PIDTIPOSUSPEMPTMO').AsInteger := iIdTipoSuspEmptmo;
                  qryUpdateContrato.ParamByName('PANOSUSPENSAO').AsInteger     := Trunc(DBspnAno.Value);
                  qryUpdateContrato.ParamByName('PMESSUSPENSAO').AsInteger     := cboMes.ItemIndex + 1;
                  qryUpdateContrato.ParamByName('PIDCONTRATOEMPTMO').AsFloat   := qryParcelasAtrasadasIDCONTRATOEMPTMO.AsFloat;
                  qryUpdateContrato.ExecSql;

                  LimpaParametros(qryInsertHistSuspensao);
                  with qryInsertHistSuspensao do
                  begin
                     ParamByName('PIDHISTSUSPCOBEP').AsInteger  := LeUltRegistro(nil, 'HISTSUSPCOBEP');
                     ParamByName('PIDTIPOSUSPEMPTMO').AsInteger := iIdTipoSuspEmptmo;
                     ParamByName('PIDCONTRATOEMPTMO').AsFloat   := qryParcelasAtrasadasIDCONTRATOEMPTMO.AsFloat;
                     ParamByName('PFLGSTATUS').AsString         := 'A';
                     ParamByName('PHSCINICIOSUSP').AsDateTime   := dDataSusp;
                     ParamByName('PHSCUSUATEND').AsString       := Sistema.NomeUsuario;
                     ParamByName('PHSCDATAATEND').AsDateTime    := dDataSusp;
                     ExecSql;
                  end;

                  qryParcelasAtrasadas.Next;
               end;
               dtmBaseDados.dbBaseDados.Commit;
            except
               Result := -1;
               dtmBaseDados.dbBaseDados.RollBack;
            end;
            qryParcelasAtrasadas.Close;
            // -------------------------------------------------------------------------------------
         end;

      end
      else // if molContratoEmptmo.IDContrato > 0
      begin

         for iContadorPatro := 0 to (molListaPatro.lstPatro.Items.Count - 1) do
         begin
            if molListaPatro.lstPatro.Checked[iContadorPatro] then
            begin
               for iContadorPlano := 0 to (molListaPlano.lstPlano.Items.Count - 1) do
               begin
                  if molListaPlano.lstPlano.Checked[iContadorPlano] then
                  begin
                     // Verifica se há contratos a gerar com a combinação Plano-Patro atual
                     if not(SelecionaParcelasAtrasadas(molListaPatro.vIDPatro[iContadorPatro],
                                                      molListaPlano.vIDPlano[iContadorPlano])
                                                      ) then
                     begin
                        EscondeEspera;
                        Repaint;
                     end
                     else  // if not(SelecionaContratosGeracao(...
                     begin
                        // -------------------------------------------------------------------------
                        if not(dtmBaseDados.dbBaseDados.InTransaction) then dtmBaseDados.dbBaseDados.StartTransaction;

                        try
                           while not(qryParcelasAtrasadas.EOF) do
                           begin
                              LimpaParametros(qryUpdateContrato);
                              qryUpdateContrato.ParamByName('PIDTIPOSUSPEMPTMO').AsInteger := iIdTipoSuspEmptmo;
                              qryUpdateContrato.ParamByName('PANOSUSPENSAO').AsInteger     := Trunc(DBspnAno.Value);
                              qryUpdateContrato.ParamByName('PMESSUSPENSAO').AsInteger     := cboMes.ItemIndex + 1;
                              qryUpdateContrato.ParamByName('PIDCONTRATOEMPTMO').AsFloat   := qryParcelasAtrasadasIDCONTRATOEMPTMO.AsFloat;
                              qryUpdateContrato.ExecSql;

                              LimpaParametros(qryInsertHistSuspensao);
                              with qryInsertHistSuspensao do
                              begin
                                 ParamByName('PIDHISTSUSPCOBEP').AsInteger  := LeUltRegistro(nil, 'HISTSUSPCOBEP');
                                 ParamByName('PIDTIPOSUSPEMPTMO').AsInteger := iIdTipoSuspEmptmo;
                                 ParamByName('PIDCONTRATOEMPTMO').AsFloat   := qryParcelasAtrasadasIDCONTRATOEMPTMO.AsFloat;
                                 ParamByName('PFLGSTATUS').AsString         := 'A';
                                 ParamByName('PHSCINICIOSUSP').AsDateTime   := dDataSusp;
                                 ParamByName('PHSCUSUATEND').AsString       := Sistema.NomeUsuario;
                                 ParamByName('PHSCDATAATEND').AsDateTime    := dDataSusp;
                                 ExecSql;
                              end;

                              qryParcelasAtrasadas.Next;
                           end;
                           dtmBaseDados.dbBaseDados.Commit;
                        except
                           Result := -1;
                           dtmBaseDados.dbBaseDados.RollBack;
                        end;
                        qryParcelasAtrasadas.Close;
                        // -------------------------------------------------------------------------
                     end;  // if not(
                  end;
               end;  // for(Plano)
            end;
         end;  // for(Patro)

      end; // molContratoEmptmo.IDContrato > 0

      qryTipoContr.Next;
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmExecGeraParcela.qryVariosContratosBeforeOpen(DataSet: TDataSet);
begin
   inherited;
 // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 // qryContratosGeracao.SQL.SaveToFile(Sistema.TempDir + 'EP-GeracaoParcela.txt');
    qryContratosGeracao.SQL.SaveToFile(ftempregra + '\' + 'EP-GeracaoParcela.txt');
end;



function TfrmExecGeraParcela.DataConsiderandoAmortizacaoAjuste(const IDContrato  : Extended;
                                                               const dData       : TDateTime
                                                              ): TDateTime;
begin
   try
      LimpaParametros(qryDataUltSaldo);
      qryDataUltSaldo.ParamByName('PIDCONTRATOEMPTMO').AsFloat    := IDContrato;
      qryDataUltSaldo.ParamByName('PHMEDATAPREVISTA').AsDateTime  := dData;

      qryDataUltSaldo.Open;

      Result := dData;
      if qryDataUltSaldoDATA.AsDateTime > dData then Result := qryDataUltSaldoDATA.AsDateTime;
   finally
      qryDataUltSaldo.Close;
   end;
end;



procedure TfrmExecGeraParcela.FormCreate(Sender: TObject);
begin
   inherited;

   // André Pontes - 03/06/2005 - pendência 19404
   Contab := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True
                    );

   Contab.OpenTransaction := False;
   // FIM André Pontes - 03/06/2005 - pendência 19404
end;



procedure TfrmExecGeraParcela.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   UFuncoesEmptmo.bBuscaMutuario := false;
   Contab.Free;   // André Pontes - 03/06/2005 - pendência 19404
   inherited;
end;

//BRUNO AZEVEDO SOL 179167 KINTANA 1647976 - INICIO
procedure TfrmExecGeraParcela.chkInArquivoClick(Sender: TObject);
begin
  inherited;
  if chkInArquivo.Checked = true and chkNotInArquivo.Checked = true then begin
    chkNotInArquivo.Checked := false;
  end;
end;

procedure TfrmExecGeraParcela.chkNotInArquivoClick(Sender: TObject);
begin
  inherited;
  if chkInArquivo.Checked = true and chkNotInArquivo.Checked = true then begin
    chkInArquivo.Checked := false;
  end;
end;
//BRUNO AZEVEDO SOL 179167 KINTANA 1647976 - FIM

end.
