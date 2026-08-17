//********************************************************************************************************
// Autor    : Marco Turon
// Data     : 06/10/2004
// Código   : AL_2
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************
// Sistema  .: INVESTIMENTOS
// Objetivo .: Formulário para executar o fechamento diário das Operações
//             Calcula Rubricas, Cotacoes dos Investimentos e Atualiza
//             Saldos dos Investimentos
// Form     .: FrmFechamentoDiario - Unit .: FFechamentoDiario
// Data     .: 15/06/1999
// Autor    .: Alexandre Ramos  **--> Serious Developer
//------------------------------------------------------------------------------
// Alterações :
//  Autor     : Ricardo Cristiano
//  06/06/2001  - Incluida a função de atualização dos fundos
//------------------------------------------------------------------------------
// Alterações :
//  06/12/1999  - Controle de Vencimentos de Contratos, Executa a Operacao de
//   (REFER)      nao exercicio automaticamente, Rotina de Execucao de Operacao.
//  21/03/2000  - Rotina de Execucao de Operacao. foi transferida para a
//   (CM)         UBibliotecaInvest.
//------------------------------------------------------------------------------
unit FFechamentoDiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwQuery, UBibliotecaInvest, UOperacaoInvest, UOperComum,
  dOperComum, URegra, Db, Wwdatsrc, DBTables, Grids, DBGrids, FOkCancelar, 
  wwdbdatetimepicker, CMDateTimePicker, Wwdbigrd, Wwdbgrid, wwdblook, FAguarde;

type
  TFrmFechamentoDiario = class(TfrmOkCancelar)
    pgcFechamento: TPageControl;
    tbsFechamento: TTabSheet;
    Label4: TLabel;
    BtProcessar: TBitBtn;
    grbRendaVariavel: TGroupBox;
    prbVencContr: TProgressBar;
    prbCalculaCotacao: TProgressBar;
    prbAtualizaRV: TProgressBar;
    dteDataInicio: TCMDateTimePicker;
    QryDespesasOperacao: TwwQuery;
    DsDespesasOperacao: TwwDataSource;
    QryBuscaDespesa: TwwQuery;
    QryBuscaDespesaIDTIPODESPINVEST: TFloatField;
    QryBuscaDespesaMOECODIGO: TFloatField;
    QryBuscaDespesaDESCTIPODESPINV: TStringField;
    QryBuscaCredor: TwwQuery;
    QryDespesasOperacaoIDDESPOPERINVEST: TFloatField;
    QryDespesasOperacaoIDOPERACAOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOOPERACAO: TFloatField;
    QryDespesasOperacaoIDTIPODESPINVEST: TFloatField;
    QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField;
    QryDespesasOperacaoIDREGRACALCUSADA: TFloatField;
    QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField;
    QryDespesasOperacaoDESCDESP2: TStringField;
    QryDespesasOperacaoDESCCRED2: TStringField;
    UpdDespesas: TUpdateSQL;
    ChkVencContr: TCheckBox;
    chkCalculaCotacao: TCheckBox;
    chkAtualizaRV: TCheckBox;
    bevFundo: TBevel;
    DsImpostosOperacao: TwwDataSource;
    QryImpostosOperacao: TwwQuery;
    UpdImpostos: TUpdateSQL;
    QryImpostosOperacaoIDIMPOSTOINVEST: TFloatField;
    QryImpostosOperacaoIDPESSOA: TFloatField;
    QryImpostosOperacaoIDOPERACAOINVEST: TFloatField;
    QryImpostosOperacaoIDTIPOINVEST: TFloatField;
    QryImpostosOperacaoIDTIPOOPERACAO: TFloatField;
    QryImpostosOperacaoVLRIMPOSTOOPER: TFloatField;
    QryImpostosOperacaoDATAVENCIMPINVEST: TDateTimeField;
    QryImpostosOperacaoIDREGRACALCUSADA: TFloatField;
    QryImpostosOperacaoIDREGRAVENCUSADA: TFloatField;
    QryImpostosOperacaoFLGCALCDIARIO: TFloatField;
    QryImpostosOperacaoDESCCRED: TStringField;
    QryBuscaImposto: TwwQuery;
    QryImpostosOperacaoDESCIMP: TStringField;
    QryAux: TwwQuery;
    QryDespesasOperacaoIDFORCLI: TFloatField;
    QryBuscaCredorIDPESSOA: TFloatField;
    QryBuscaCredorRAZAOSOCIAL: TStringField;
    dteDataFinal: TCMDateTimePicker;
    Label1: TLabel;
    pnlMensagens: TPanel;
    QryDespesasOperacaoVLRDESPOPER: TFloatField;
    QryDespesasOperacaoNUMDOCUMENTO: TStringField;
    QryDespesasOperacaoFLGCALCDIARIO: TStringField;
    QryDespesasOperacaoIDINVESTIMENTO: TFloatField;
    QryDespesasOperacaoIDCARTEIRAINVEST: TFloatField;
    QryDespesasOperacaoVLROPERACAO: TFloatField;
    QryDespesasOperacaoQTDEOPERACAO: TFloatField;
    QryDespesasOperacaoDESCTIPOOPERACAO: TStringField;
    QryDespesasOperacaoDESCINVESTIMENTO: TStringField;
    QryDespesasOperacaoNATUREZAOPERACAO: TStringField;
    QryDespesasOperacaoDATAOPERACAO: TDateTimeField;
    QryDespesasOperacaoMOECODIGO: TFloatField;
    QryDespesasOperacaoTIPOTITULO: TStringField;
    QryBuscaDespesaNATUREZAOPERACAO: TStringField;
    QryDespesasOperacaoNATOPERDESP: TStringField;
    grbRendaFixa: TGroupBox;
    chkAtualizaRF: TCheckBox;
    prbAtualizaRF: TProgressBar;
    qryTestaFechBoleta: TwwQuery;
    QryConsulta: TwwQuery;
    QryConsultaSGLBOLSAVALORES: TStringField;
    QryConsultaDATAOPERACAO: TDateTimeField;
    QryConsultaDATAVENCOPER: TDateTimeField;
    QryConsultaQTDEOPERACAO: TFloatField;
    QryConsultaIDOPERACAOINVEST: TFloatField;
    QryConsultaPRECOUNITOPERACAO: TFloatField;
    QryConsultaVLROPERACAO: TFloatField;
    QryConsultaDESCMERCADO: TStringField;
    QryConsultaNOME: TStringField;
    QryConsultaDESCINVESTIMENTO: TStringField;
    QryConsultaDESCTIPOOPERACAO: TStringField;
    QryConsultaNUMDOCUMENTO: TStringField;
    QryConsultaNATUREZAOPERACAO: TStringField;
    QryConsultaIDTIPOOPERACAO: TFloatField;
    QryConsultaIDTIPOINVEST: TFloatField;
    QryConsultaIDTIPOOPERACAO_1: TFloatField;
    QryConsultaIDFORCLI: TFloatField;
    QryConsultaIDCARTEIRAINVEST: TFloatField;
    QryConsultaCODTIPOACAO: TStringField;
    QryConsultaMOECODIGO: TFloatField;
    QryConsultaIDINVESTIMENTO: TFloatField;
    QryConsultaIDLOTE: TStringField;
    QryConsultaRECPAG: TStringField;
    qryContabOperDireito: TwwQuery;
    qryContabOperDireitoNUMDOCUMENTO: TStringField;
    chkIRLitigio: TCheckBox;
    QryExcluiFluxoTitulo: TwwQuery;
    QryDelExcluiFluxoTitulo: TwwQuery;
    QryInsFluxoTitulo: TwwQuery;
    QryInsFluxoTituloIDOPERACAOINVEST: TFloatField;
    QryInsFluxoTituloIDCUSTODIANTE: TFloatField;
    QryInsFluxoTituloIDCARTEIRAINVEST: TFloatField;
    QryInsFluxoTituloIDTIPOINVEST: TFloatField;
    QryInsFluxoTituloIDTIPOOPERACAO: TFloatField;
    QryInsFluxoTituloIDINSTFIN: TFloatField;
    QryInsFluxoTituloDATAOPERACAO: TDateTimeField;
    QryInsFluxoTituloNUMDOCUMENTO: TStringField;
    QryInsFluxoTituloQTDEOPERACAO: TFloatField;
    QryInsFluxoTituloPRECOUNITOPERACAO: TFloatField;
    QryInsFluxoTituloVLROPERACAO: TFloatField;
    QryInsFluxoTituloDATAVENCOPER: TDateTimeField;
    QryInsFluxoTituloIDINVESTIMENTO: TFloatField;
    QryInsFluxoTituloEMPRESAPROP: TFloatField;
    QryInsFluxoTituloIDFORCLI: TFloatField;
    QryInsFluxoTituloIDCORRETVALORES: TFloatField;
    QryInsFluxoTituloMOECODIGO: TFloatField;
    QryInsFluxoTituloIDLOTE: TStringField;
    QryInsFluxoTituloOBSERVACAO: TStringField;
    QryInsFluxoTituloFLGCUSTODIA: TStringField;
    QryInsFluxoTituloVLRIR: TFloatField;
    QryDelOperInvFluxoTitulo: TwwQuery;
    QryRegAtualizacao: TwwQuery;
    qryInsBetaCarteira: TwwQuery;
    qryExcluiOperacoesRF: TwwQuery;
    qryExcluiOperacoesRFIDTIPOINVEST: TFloatField;
    qryExcluiOperacoesRFIDOPERACAOINVEST: TFloatField;
    qryExcluiOperacoesRFDATAMOVCARTINV: TDateTimeField;
    qryExcluiOperacoesRFNUMDOCUMENTO: TStringField;
    QryBuscaDataFech: TwwQuery;
    qryExcluiOperacoesRV: TwwQuery;
    qryExcluiOperacoesRVNUMDOCUMENTO: TStringField;
    qryExcluiOperacoesRVIDTIPOINVEST: TFloatField;
    qryExcluiOperacoesRVIDOPERACAOINVEST: TFloatField;
    qryExcluiOperacoesRVDATAMOVCARTINV: TDateTimeField;
    qryExcluiOperacoesRVTIPMOVCARTINV: TStringField;
    qryExcluiOperacoesRVIDHISTCARTINV: TFloatField;
    qryExcluiOperacoesRVIDOPERACAODIREITO: TFloatField;
    qryExcluiOperacoesCustodia: TwwQuery;
    qryVencEmpAcoes: TwwQuery;
    qryRevEmpAcoes: TwwQuery;
    QryBuscaOrdem: TwwQuery;
    QryBuscaOrdemIDCORRETVALORES: TFloatField;
    QryBuscaOrdemIDINVESTIMENTO: TFloatField;
    QryBuscaOrdemPUORDMOVINV: TFloatField;
    QryBuscaOrdemQTDEORDMOVINV: TFloatField;
    QryBuscaOrdemQTDEORDENADA: TFloatField;
    QryBuscaOrdemNUMDOCMOVINV: TStringField;
    QryBuscaOrdemSTATMOVINV: TStringField;
    QryBuscaOrdemIDTIPOINVEST: TFloatField;
    QryBuscaOrdemIDTIPOOPERACAO: TFloatField;
    QryBuscaOrdemIDCARTEIRAINVEST: TFloatField;
    QryBuscaOrdemIDLOTE: TStringField;
    QryBuscaOrdemIDBOLSAVALORES: TFloatField;
    QryBuscaOrdemIDCUSTODIANTE: TFloatField;
    QryBuscaOrdemDESCINVESTIMENTO: TStringField;
    QryBuscaOrdemIDCARTEIRAGERENC: TFloatField;
    QryBuscaOrdemIDPLANPREVCTBPATR: TFloatField;
    procedure BtProcessarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dteDataInicioExit(Sender: TObject);
  private
    { Private declarations }
    function  ProcFluxoTitulo(fVlrJurosInc,fVlrJurosPago,fVlrAmortizacao,wCotaIni:Double;
                              iCarteira,iInvestimento,wMoedaReg,iEmissor:Integer;DataProc:TDateTime;sLote,wTipoPapel:String):Boolean;

    function  ExcluiFluxoTitulo(iTipoOperacao,iCarteira,iInvestimento : Integer;
                              DataProc:TDateTime) : Boolean;

    function  ExcluiRegAtualizacao(iInv: Integer = 0): Boolean;

    procedure AlimentaFluxoTitulo(fVlrFluxoTitulo,fVlrJuros,wCotaIni:Double;iTipoOperacao,
                                  iCarteira,iInvestimento,wMoedaReg,iEmissor:Integer;DataProc:TDateTime;
                                  sLote,wTipoPapel,sTipoOperacao:String);

    function AtualizaEmprestimoAcoes(dDataProc:TDateTime):boolean;

    function ExcluiOperacoesRF: Boolean;

    function ExcluiOperacoesRV(iInv: Integer = 0): Boolean;

    function ExcluiOperacoesCustodia(iInv: Integer = 0): Boolean;

    function VerificaVencEmpAcoes(sDataIni, sDataFim: String): Boolean;

  public
    { Public declarations }
    Function  CalcCotacaoInvest(DataProc:TDateTime) : Boolean;
    Function  ContabilizaOperDireito : Boolean;
    Function  AtualizaSaldoInvest(DataProc:TDateTime; Tipo:Char) :Boolean;

    Procedure ProcVencimentosContrato(DataProc:TDateTime);
    procedure MontaQryConsulta;
  end;

var
  FrmFechamentoDiario: TFrmFechamentoDiario;
  DataProxFech, DataUltFech : TDate;
  wStrData, wTipoRecDesBol:String;
  bCriaLancto: boolean;
  iIdHistCartInv, iInvProc: Integer;
  fVlrRendimento : Double;
  
implementation

uses dOperacaoInvest, dBaseDados, UMensErro, USistema, UDataBase, UDiasUteis,UImpostos,
     ULancContab, UFuncoesRendaFixa,UDiasUteisInv,URendaFixa,
     UFundoComum, FPrincipal, dEmprestAcoes,uEmprestAcoes, UCotaComum,
     UOpcoes, UOpcaoIndice;

Var  wTotalLiquido : Double;
     wDocumento    : String;

{$R *.DFM}

procedure TFrmFechamentoDiario.BtProcessarClick(Sender: TObject);
Var
  DataAnt, DataProc : TDateTime;
  Inicio            : TTime;
  wQtdCotaIni, wExercicio, wPeriodo, wIdEmpresa, wMoeCodigo, wNumReg : Integer;
  wMensContab       : String;
  bFechado, bOk     : Boolean;
begin
   inherited;
   iInvProc := 0;
   wMoecodigo  := 0;
   wQtdCotaini := 1;
   If (dteDataInicio.Text = '') Or (dteDataFinal.Text = '') Then Begin
     ShowMessage('Datas devem ser Preenchidas !!!!');
     dteDataInicio.SetFocus;
     Exit;
   End;

   wNumReg := 0;
   // Testa se existe Operação não Fechada no Período para RV.
   if grbRendaVariavel.Visible then
   begin
      with qryBuscaOrdem do
      begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('DATAINI').asString := dteDataInicio.Text;
         ParamByName('DATAFIM').asString := dteDataFinal.Text;
         if pRPI.FLGPLANPREVCTBPAT = 'S' then
            ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro
         else
            ParamByName('IDPLANPREVCTBPATR').Clear;
         Open;

         If Not IsEmpty Then
         begin
            ShowMessage('Existem Boletas que não foram fechadas nesse período !!!!');
            Close;
            dteDataFinal.SetFocus;            
            Exit;
         end;
         Close;
      end;

      with qryTestaFechBoleta do begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('DATAINICIO').asDateTime := StrToDate(dteDataInicio.Text);
         ParamByName('DATAFIM').asDateTime    := StrToDate(dteDataFinal.Text);
         Open;
         If Not IsEmpty Then
         begin
            ShowMessage('Existem Boletas que não foram fechadas nesse período !!!!');
            Close;
            dteDataFinal.SetFocus;
            Exit;
         end;
         Close;
      end;

      if not OpcaoIndice.VerificaBoletaAberta(StrToDate(dteDataInicio.Text),
                                              StrToDate(dteDataFinal.Text)) then
      begin
         dteDataFinal.SetFocus;
         Exit;
      end;
            
      // Testa se existem operações de empréstimo vencidas e não revertidas
{      if not VerificaVencEmpAcoes(dteDataInicio.Text, dteDataFinal.Text) then
      begin
         ShowMessage('Existem Operações de Empréstimo Vencidas e não Revertidas no Período !!!!');
         dteDataFinal.SetFocus;
         Exit;
      end;    }
   end;

   // Testa se Periodo Contabil esta Fechado
   wIdEmpresa:=Sistema.IdEmpresa;
   //  If TestaPeriodo(True, 'BASEDADOS', dteDataInicio.Text, IntToStr(Sistema.IdModulo),
   //       wExercicio, wPeriodo, wIdEmpresa, wMensContab) <> 0 Then Begin
   //    MsgDlg('Atenção:'+#13+'O Periodo Contábil nesta data esta Fechado. ',
   //           'Mensagem do Sistema', MtError, [MbOk], 0);
   //    Exit;
   //  End;

   Inicio:=Time;
   // Inicia a Transacao
   //  DtmBaseDados.dbBaseDados.StartTransaction;
   // Altera Group Box
   //  grbRendaVariavel.Visible:=True;
   //  grbRendaVariavel.Caption:=' Aguarde Processando ';
   DataProc      :=StrToDate(dteDataInicio.Text);

   // Busca Inicio da Carteira
   FazQuery(QryAux,'SELECT * FROM PARAMINVEST');
   wQtdCotaIni := QryAux.FieldByName('VLRCOTAINICART').AsInteger;
   wMoeCodigo  := QryAux.FieldByName('MoeCodigo').AsInteger;

   If TipoMenuInvest = 'V' then  // RENDA VARIAVEL
   Begin
      If (QryAux.FieldByName('DATAULTIMPCOT').AsDateTime = 0) Or
      (QryAux.FieldByName('DATAULTIMPCOT').AsDateTime < StrToDateTime(dteDataInicio.Text))  Or
     ((QryAux.FieldByName('DATAULTIMPCOT').AsDateTime > StrToDateTime(dteDataInicio.Text))  And
      (QryAux.FieldByName('DATAULTIMPCOT').AsDateTime < StrToDateTime(dteDataFinal.Text))) Then
      Begin
         MsgDlg('Não foram importadas as cotações para esse período.',
             'Mensagem do Sistema', mtInformation,[MbOk],0);
         Exit;
      End;

      try
//VOLTAR
//{
        If Not DtmBaseDados.dbBaseDados.InTransaction Then
           DtmBaseDados.dbBaseDados.StartTransaction;

        // VOLTAR
        // Processar um único investimento
//        iInvProc := 9359;
        // -------------------------------

        //Exclui Atualizações
        if not ExcluiRegAtualizacao(iInvProc) then
           Raise Exception.Create('Excluir Atualizações Posteriores');

        //Exclui Operações
        if not ExcluiOperacoesRV(iInvProc) then
           Raise Exception.Create('Excluir Operações Posteriores');

        //Exclui Movimentação de Custódia
        if not ExcluiOperacoesCustodia(iInvProc) then
           Raise Exception.Create('Excluir Movimentação de Custódia Posterior');

        // Comita as Exclusões
        DtmBaseDados.dbBaseDados.Commit;

        If Not DtmBaseDados.dbBaseDados.InTransaction Then
           DtmBaseDados.dbBaseDados.StartTransaction;

        // Atualiza os Saldos das Carteiras
        if not OperComum.AtualizaSaldos(wQtdCotaini,-1) then
           Raise Exception.Create('Atualizar os Saldos das Carteiras');

        DtmBaseDados.dbBaseDados.Commit;

        // Atualiza Registro do Parametro
        OperacaoInvest.RetParamInvest1(pRPI, 'BaseDados');
//}
      except
         on E:Exception do
         begin
            MsgDlg('Não Foi Possível Preparar a Base para o Reprocessamento : '+ #13 +
                   'Erro ao ' + E.Message, 'Mensagem do Sistema', MtError,[MbOk],0);
            DtmBaseDados.dbBaseDados.RollBack;
            Exit;
         end;
      end;
   End
   else if TipoMenuInvest = 'F' then  // RENDA FIXA
   begin
      try
// VOLTAR
//{
        if not DtmBaseDados.dbBaseDados.InTransaction then
           DtmBaseDados.dbBaseDados.StartTransaction;

        //Exclui Atualizações
        if not ExcluiRegAtualizacao then
           Raise Exception.Create('Excluir Atualizações Anteriores');

        // Excluir Operações
        if not ExcluiOperacoesRF then
           Raise Exception.Create('Excluir Operações Anteriores');

        DtmBaseDados.dbBaseDados.Commit;
//}
      Except
         on E:Exception do
         begin
            MsgDlg('Não Foi Possível Preparar a Base para o Reprocessamento : '+ #13 +
                   'Erro ao ' + E.Message, 'Mensagem do Sistema', MtError,[MbOk],0);
            DtmBaseDados.dbBaseDados.RollBack;
            Exit;
         end;
      end;
   end;

   // Abre uma única transação para todo o fechamento
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   // Faz da Ultima data de Fechamento até hoje

   While DataProc <= StrToDate(dteDataFinal.Text) Do
   Begin
      pnlMensagens.Caption := 'Processando Dia : '+DateToStr(DataProc);
      pnlMensagens.Repaint;
      grbRendaVariavel.Repaint;
      grbRendaFixa.Repaint;

      // Atualiza Cotacoes dos Investimentos Renda Variavel
//{
      If chkCalculaCotacao.Checked Then
      Begin
         If Not CalcCotacaoInvest(DataProc) Then
         Begin
            bbtnCancelar.Click;
            Exit;
         End;
         grbRendaVariavel.Repaint;
         grbRendaFixa.Repaint;
      End;
//}
//VOLTAR
//{
      // Atualiza os Investimentos Renda Variavel
      if chkAtualizaRV.Checked then
      begin
         If not AtualizaSaldoInvest(DataProc,'2') then
         begin
            bbtnCancelar.Click;
            Exit;
         end;

         // Baixa Automatica de Opções no Vencimento
         if not Opcoes.GeraReversaoOpcoes(DataProc,-1,-1,-1,-1,0,False,'') then
         begin
            bbtnCancelar.Click;
            Exit;
         end;

         // Atualiza Opções de Indice
         if not OpcaoIndice.AtualizaSaldosOpcInd(DataProc) then
         begin
            bbtnCancelar.Click;
            Exit;
         end;

         {if not OpcaoIndice.AtualizaTransferencia(DataProc) then
         begin
            bbtnCancelar.Click;
            Exit;
         end;}

         grbRendaVariavel.Repaint;
         grbRendaFixa.Repaint;
      end;
//}

      // Atualiza os Investimentos Renda Fixa
      If chkAtualizaRF.Checked Then begin
         If Not AtualizaSaldoInvest(DataProc,'1') Then
            bbtnCancelar.Click;
         grbRendaVariavel.Repaint;
         grbRendaFixa.Repaint;
      end;

      // Atualização de IR Litígio   (em teste)
      //if chkIRLitigio.Checked then
         //UImpostos.AtualizaIrLitigio(DataProc);

      // Mostra Resultado do Processamento de Vencimento de Contratos
//      If ChkVencContr.Checked Then
//         ProcVencimentosContrato(DataProc);

      If pRPI.FLGCARTGERENC = 'S' Then
      begin
         //Verifica data de fechamnto dos FAQ/FIF, se esses estao fechados
         QryBuscaDataFech.Close;
         QryBuscaDataFech.Open;
         bFechado := False;
         While not QryBuscaDataFech.Eof Do
         Begin
            If QryBuscaDataFech.FieldByName('DATAULTFECH').AsDateTime  >= DataProc Then
               bFechado := True;

            QryBuscaDataFech.Next;

            If QryBuscaDataFech.RecordCount > 1 Then
            begin
                If QryBuscaDataFech.FieldByName('DATAULTFECH').AsDateTime  >= DataProc Then
                    bFechado := True
                else
                    bFechado := False;
            end;
            QryBuscaDataFech.Next;
         end;

         If (bFechado) Then
         begin
            //Para obter a data util do modulo de Fundos
            iTipoInvestUsu := 2;
            DataAnt := DataProc - 1;
            While not DiasUteisInv.DiaUtil(DataAnt,-1,1,'',True,False,False) Do
               DataAnt  := DataAnt - 1;   // Achar o dia útil anterior

            //Atualiza o Saldo de Caixa e Calcula a Cota
            CotaComum.CalculaCaixaCota(DataAnt, DataProc);
         end;
      end;

      // Incrementa data de Processamento
      DataProc      :=DataProc+1;
      While not DiasUteisInv.DiaUtil(DataProc,-1,1,'',True,False,False) Do
         DataProc  := DataProc+1;   // Achar o próximo dia útil

      // Limpa Progressbars
      prbAtualizaRF.Position:=0;
      prbCalculaCotacao.Position:=0;
      prbAtualizaRV.Position:=0;
      prbVencContr.Position:=0;
   End;

  // Altera Group Box
   grbRendaVariavel.Repaint;
   grbRendaVariavel.Caption:=' Acompanhamento do Processo ';
   BtProcessar.Enabled   := False;
   bbtnCancelar.Enabled  := True;
   bbtnConfirmar.Enabled := True;
 // Limpa Progressbars
   prbAtualizaRF.Position:=0;
   prbCalculaCotacao.Position:=0;
   prbAtualizaRV.Position:=0;
   prbVencContr.Position:=0;
   pnlMensagens.Caption  := 'Processamento Ok.  '+DateToStr(DataProc-1);
   DataProxFech := DataProc - 1;
   While not DiasUteisInv.DiaUtil(DataProxFech,-1,1,'',True,False,False) Do
      DataProxFech  := DataProxFech - 1;   // Achar o dia útil anterior
end;


//-------------------------------------------------------------------
// Calcula Cotacao dos Investimento
function TFrmFechamentoDiario.CalcCotacaoInvest(DataProc:TDateTime) : Boolean;
Var
  QryLocal, QryLocalAux :TwwQuery;
  wQtdLote, wVolNegociado, wVlrMedia : Double;
  wDec:Char;
Begin
  Result := False;
  // Cria Objetos Locais
  QryLocal              := TwwQuery.Create(Application);
  QryLocal.DatabaseName := 'BaseDados';
  QryLocalAux              := TwwQuery.Create(Application);
  QryLocalAux.DatabaseName := 'BaseDados';

  Try
     Try
        // Busca Dados dos Investimentos
        FazQuery(QryLocal,'SELECT DISTINCT CI.IDACAO AS IDINVESTIMENTO, IV.DESCINVESTIMENTO '+
                          'FROM COTACAOACAO CI, INVESTIMENTO IV '+
                          'WHERE  (CI.IDACAO = IV.IDINVESTIMENTO) AND '+
                          '       (IV.IDTIPOINVEST = 2) ');

        prbCalculaCotacao.Max:=QryLocal.RecordCount;

        While Not QryLocal.Eof Do
        Begin
           // Busca Volume Negociado do Investimento na maior Bolsa
           FazQuery(QryLocalAux,
                    'SELECT VOLNEGOCIADO, VLRMEDIA, QTDELOTE '+
                    'FROM COTACAOACAO '+
                    'WHERE 	(IDACAO = '''+
                      QryLocal.FieldByName('IDINVESTIMENTO').AsString+''') AND '+
                    '      	(DATACOTAACAO = TO_DATE( '''+DateToStr(DataProc)+''',''DD/MM/YYYY'')) '+
                    'ORDER BY VOLNEGOCIADO DESC ');
           wVolNegociado:= QryLocalAux.FieldByName('VOLNEGOCIADO').AsFloat;
           wVlrMedia    := QryLocalAux.FieldByName('VLRMEDIA').AsFloat;
           wQtdLote     := QryLocalAux.FieldByName('QTDELOTE').AsFloat;

           If (QryLocalAux.IsEmpty) Or (wVolNegociado < 0 ) Then Begin
             QryLocal.Next;
             prbCalculaCotacao.StepIt;
             Continue;
           End;

           // Caso Já Exista Cotacao no Dia Altera se não Insere
           wDec := DecimalSeparator;
           DecimalSeparator := '.';
           If FazQuery(QryLocalAux,
                'SELECT IDINVESTIMENTO '+
                'FROM COTACAOINVEST '+
                'WHERE 	(IDINVESTIMENTO = '''+QryLocal.FieldByName('IDINVESTIMENTO').AsString+''') AND '+
                '      	(DATACOTACAO    = TO_DATE( '''+DateToStr(DataProc)+''',''DD/MM/YYYY''))') Then
           Begin
              // Atualiza Registro de Cotacao
              If Not ExecutaQuery(QryLocalAux,
                       'UPDATE COTACAOINVEST SET '+
                       '  DATACOTACAO      = TO_DATE( '''+DateToStr(DataProc)+''',''DD/MM/YYYY''),'+
                       '  IDINVESTIMENTO   = '''+QryLocal.FieldByName('IDINVESTIMENTO').AsString+''', '+
                       '  VLRCONTABIL      = '+FloatToStr(wVlrMedia)+','+
                       '  VLRGERENCIAL     = '+FloatToStr(wVlrMedia)+','+
                       '  QTDTITLOTE       = '+FloatToStr(wQtdLote) +' '+
                       'WHERE  (IDINVESTIMENTO = '''+QryLocal.FieldByName('IDINVESTIMENTO').AsString+''') AND '+
                       '       (DATACOTACAO    = TO_DATE('''+DateToStr(DataProc)+''',''DD/MM/YYYY'''+'))') Then
                 Raise Exception.Create('Atualizar Cotação de ' + QryLocal.FieldByName('DESCINVESTIMENTO').AsString );
           End Else Begin
              // Inclui Registro de Cotacao
              if not ExecutaQuery(QryLocalAux,
                       'INSERT INTO COTACAOINVEST '+
                       '(DATACOTACAO, IDINVESTIMENTO, VLRCONTABIL, VLRGERENCIAL, QTDTITLOTE ) '+
                       'VALUES (TO_DATE( '''+DateToStr(DataProc)+''',''DD/MM/YYYY''),'+
                       ''''+ QryLocal.FieldByName('IDINVESTIMENTO').AsString +''','+
                       FloatToStr(wVlrMedia) +','+
                       FloatToStr(wVlrMedia) +','+
                       FloatToStr(wQtdLote)  +')') then
                 Raise Exception.Create('Incluir Cotação de ' + QryLocal.FieldByName('DESCINVESTIMENTO').AsString );
           End;
           DecimalSeparator := wDec;
           QryLocal.Next;
           prbCalculaCotacao.StepIt;
        End;
        Result := True;
     Except
        on E:Exception do
        begin
           MsgDlg('Não foi possível atualizar a Cotação das Ações. '+ #13 +
                  'Erro ao ' + E.Message, 'Mensagem do Sistema', MtError,[MbOk],0);
           Result := False;
        end;
     end;
  finally
     // Libera Objetos Locais
     QryLocal.Free;
     QryLocalAux.Free;
  end;
End;

//------------------------------------------------------------------------------
// Atualiza os Saldos dos Investimentos
Function TFrmFechamentoDiario.AtualizaSaldoInvest(DataProc:TDateTime; Tipo:Char) : Boolean;
Var
   QryLocal, QryLocalCont,QryBuscaSaldoInvest  :TwwQuery;
   wVlrNovaCotacao, wVlrNovoSaldo, wQtdInvest, wVlrSaldoInvest, wVlrSaldoInvestAnt, wQtdTitLote,wVariacaoContab : Double;
   wSaldoInutil, wSaldoJuros, wSaldoVariacao, wSaldoAcertaBaca : Double;
   WPuJuros,wPuVariacao,fVlrVariacao, fVlrJuros,wSaldoVariacaoDia,wSaldoJurosDia, wSaldoAqui,
   wValorAContabilizar,wSaldoIRProv,wSaldoIOFProv, wSaldoAgioDesagio : Double;
   wNaturezaMovimento, wTipoPapel, wMensErro, wHistorico,wApuraIR,WQUERY : String;
   wQtdCotaIni, wPlanilha, wDocumento, wPlanoAC, wPlanilhaAC, wDocumentoAC, wPlano, wCodDebug, wMoedaReg, wTipoOperacao : Integer;
   wFatura, wIdForCli, wIdHistCartInv, wIdTipoDespInvest, wMoeCodigo, wIdOperacao : Integer;
   wDia, wMes, wAno : Word;
   wDataProcAnt, wDataFim :TDate;
   wOprContabil : shortint;
   wNoDoc    :Extended;
   wVlrAntCotacao, fVlrJurosInc,fVlrAmortizacao,fVlrJurosPago,fPUAgioDesagio,wAgioDesagio,fVlrAgioDesagio,fVlrJurosAcu : Double;
Const
   wMensagem: Array[-9..0] Of String =
              (' ',
               ' ',
               'Não foi possível efetuar o lançamento de CAP/CAR.',
               'Não foi possível efetuar o lançamento contábil.',
               'Não foi encontrado Padrão de Lançamento que atenda os parâmetros passados.',
               'Erro de gravação.',
               'Ambigüidade no Padrão de Lançamento.',
               'Operação com valor igual a "ZERO".',
               'Tipo de Operação não gera Lançamento Contábil nem Lançamento CAP/CAR.',
               'Lançamento(s) realizados com sucesso.');
Begin
   Result := True;
   // Cria Objetos Locais
   QryLocal                  := TwwQuery.Create(Application);
   QryLocal.DatabaseName     := 'BaseDados';
   QryLocalCont              := TwwQuery.Create(Application);
   QryLocalCont.DatabaseName := 'BaseDados';

   wQtdCotaini   :=  1;
   wMoedaReg     :=  0;
   wAgioDesagio  :=  0;
   wMoecodigo    :=  0;

   wTipoOperacao := -1;
   wPlanilha     := -1;
   wPlano        := -1;
   wFatura       := -1;
   wNoDoc        := -1;
   wDocumento    := -1;
   wPlanilhaAC   := -1;
   wPlanoAC      := -1;
   wDocumentoAC  := -1;

   // Busca Dados dos Investimentos nas Carteiras
   if iInvProc > 0 then
   begin
      // Processa um único Investimento
      WQUERY:='SELECT DISTINCT '+
            '   HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO, HC.IDLOTE, IV.DESCINVESTIMENTO, '+
            '   IV.IDTIPOINVEST, CI.FLGCALCDIARIO, TR.DATAEMTITRENFIX, TT.FLGIOF, TT.FLGAPURAIR,'+
            '   TT.FLGPROVISIONAIR AS FLGIRRFX,AC.FLGPROVISIONAIR AS FLGIRRVA, IV.IDEMISSOR,    '+
            '   TR.PERIODICIDADE, TR.CODTIPRENFIXA                                            '+
            'FROM                                                                               '+
            '   HISTCARTINV HC,INVESTIMENTO   IV, CARTEIRAINVEST CI,                   '+
            '   TITRENFIXA TR ,TIPOTITRENFIXA TT, ACAO AC                              '+
            'WHERE (HC.IDTIPOINVEST     = '+QuotedStr(Tipo)+') AND '+
            '      (HC.DATAMOVCARTINV  <= TO_DATE('+QuotedStr(DateToStr(DataProc))+',''DD/MM/YYYY'')) AND '+
            '      (HC.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST) AND '+
            '      (IV.FLGATIVO         = ''S'') AND               '+
            '      ((IV.STAOPCAO <> ''S'') OR (IV.STAOPCAO IS NULL)) AND '+
            '      (HC.IDINVESTIMENTO   = IV.IDINVESTIMENTO)  AND '+         
               '      (HC.IDINVESTIMENTO = ' + IntToStr(iInvProc) + ')  AND ' +
            '      (HC.IDINVESTIMENTO   = TR.IDTITRENFIXA(+)) AND '+
            '      (HC.IDINVESTIMENTO   = AC.IDACAO(+))       AND '+
            '      (TR.CODTIPRENFIXA = TT.CODTIPRENFIXA(+)) '+
           'ORDER BY DESCINVESTIMENTO, HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC ';
   end
   else
   begin
      // Processa todos os investimentos ( ou varios juntos)
      WQUERY:='SELECT DISTINCT '+
            '   HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO, HC.IDLOTE, IV.DESCINVESTIMENTO, '+
            '   IV.IDTIPOINVEST, CI.FLGCALCDIARIO, TR.DATAEMTITRENFIX, TT.FLGIOF, TT.FLGAPURAIR,'+
            '   TT.FLGPROVISIONAIR AS FLGIRRFX,AC.FLGPROVISIONAIR AS FLGIRRVA, IV.IDEMISSOR,    '+
            '   TR.PERIODICIDADE, TR.CODTIPRENFIXA                                            '+
            'FROM                                                                               '+
            '   HISTCARTINV HC,INVESTIMENTO   IV, CARTEIRAINVEST CI,                   '+
            '   TITRENFIXA TR ,TIPOTITRENFIXA TT, ACAO AC                              '+
            'WHERE (HC.IDTIPOINVEST     = '+QuotedStr(Tipo)+') AND '+
            '      (HC.DATAMOVCARTINV  <= TO_DATE('+QuotedStr(DateToStr(DataProc))+',''DD/MM/YYYY'')) AND '+
            '      (HC.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST) AND '+
            '      (IV.FLGATIVO         = ''S'') AND               '+
// Verificar, na produção não estava comentado
//            '      ((IV.STAOPCAO <> ''S'') OR (IV.STAOPCAO IS NULL)) AND '+
            '      (HC.IDINVESTIMENTO   = IV.IDINVESTIMENTO)  AND '+
// VOLTAR
//            '      (HC.IDINVESTIMENTO   IN (9500,9501,9503,9507))  AND '+
            '      (HC.IDINVESTIMENTO   = TR.IDTITRENFIXA(+)) AND '+
            '      (HC.IDINVESTIMENTO   = AC.IDACAO(+))       AND '+
            '      (TR.CODTIPRENFIXA = TT.CODTIPRENFIXA(+)) '+
            'ORDER BY DESCINVESTIMENTO, HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC ';
   end;

   FazQuery(QryLocal,WQUERY);
   // Inicia o Progressbar
   If Tipo = '1' Then
      prbAtualizaRF.Max:=QryLocal.RecordCount
   Else
      prbAtualizaRV.Max:=QryLocal.RecordCount;

   // Decodifica Data
   DecodeDate(DataProc, wAno, wMes, wDia);

   wDataProcAnt    := DataProc - 1;
   While not DiasUteisInv.DiaUtil(wDataProcAnt, -1, 1,'',True,False,False) Do
      wDataProcAnt:= wDataProcAnt - 1;   // Achar o dia útil anterior

   // Enquanto existem Registro na tabela calcula Atualização
   While Not QryLocal.Eof Do
   Begin
      // Testa Tipo de Atualização da Carteira (M-mensal, D-Diario, N-Nao Altera);
      If QryLocal.FieldByName('FLGCALCDIARIO').AsString = 'N' Then Begin
         QryLocal.Next;
      // Avança Progress Bar
      If Tipo = '1' Then prbAtualizaRF.StepIt Else prbAtualizaRV.StepIt;
         Continue;
      End Else If (QryLocal.FieldByName('FLGCALCDIARIO').AsString = 'M') And Not
                  (DiasUteis.UltDiaMes(wAno,wMes) = DataProc)
      Then Begin
         QryLocal.Next;
         // Avança Progress Bar
         If Tipo = '1' Then prbAtualizaRF.StepIt Else prbAtualizaRV.StepIt;
         Continue;
      End;

      // Verifica o Saldo do Investimento em questão na Carteira em Questao
      wQtdInvest      :=0;
      wVlrSaldoInvest :=0;
      wVlrNovoSaldo   :=0;
      wSaldoJurosDia    :=0;
      wSaldoVariacaoDia :=0;
      wVlrIRDia :=0;
      wVlrIOF :=0;
      wVlrNovaCotacao:=0;
      wSaldoIRProv:=0;
      wSaldoIOFProv:=0;
      fVlrJurosInc := 0;
      fVlrJurosPago := 0;
      fVlrAmortizacao := 0;
      wVlrSaldoInvestAnt := 0;
      wSaldoInutil := 0;
      wSaldoAqui := 0;
      wSaldoVariacao := 0;
      wSaldoJuros := 0;
      wSaldoAgioDesagio := 0;
      fVlrAgioDesagio := 0;

//VOLTAR
//{
      // Exclui atualização se já houver para Titulos com Fluxo de Pagto
      if (QryLocal.FieldByName('IDTIPOINVEST').AsInteger = 1 ) and
         (QryLocal.FieldByName('PERIODICIDADE').AsInteger <> Null) and
         (QryLocal.FieldByName('PERIODICIDADE').AsInteger = pRPI.IDTPPERIODICIDADE) then
      begin

         If Not RendaFixa.ExcluiAtuFluxoTitulo(DataProc,
                                     QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
                                     QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger) Then
         Begin
            QryLocal.Free;
            Result := False;
            Exit;
         End;

         If Not ExcluiFluxoTitulo(-17,
                        QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
                        DataProc)  Then
         Begin
            QryLocal.Free;
            Result := False;
            Exit;
         End;

         If Not ExcluiFluxoTitulo(-18,
                        QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
                        DataProc) Then
         Begin
            QryLocal.Free;
            Result := False;
            Exit;
         End;

         If Not ExcluiFluxoTitulo(-19,
                        QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
                        DataProc)  Then
         Begin
            QryLocal.Free;
            Result := False;
            Exit;
         End;
      end;
//}
      // Busca Todos os Saldos do Investimento
      //AL_1
      //AL_2
      OperComum.BuscaTodosSaldosInvestLote(
            QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
            QryLocal.FieldByName('IDCARTEIRAGERENC').AsInteger,
            QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
            9999999, -1,
            QryLocal.FieldByName('IDLOTE').AsString,
            DateToStr(DataProc), -1,
            wQtdInvest, wVlrSaldoInvest, wSaldoInutil, wSaldoInutil, wSaldoAqui,
            wSaldoInutil, wSaldoInutil, wSaldoVariacao, wSaldoJuros, wSaldoInutil,
            wSaldoIRProv, wSaldoInutil, wSaldoIOFProv, wSaldoInutil, wSaldoAgioDesagio,
            wSaldoInutil, wSaldoInutil, wSaldoInutil);

      // Caso Saldo zerado pula
      If (wQtdInvest = 0) then // (wVlrSaldoInvest = 0) Then
      Begin
         QryLocal.Next;
         //  Avança Progress Bar
         If Tipo = '1' Then
            prbAtualizaRF.StepIt
         Else prbAtualizaRV.StepIt;
            Continue;
      End;

      // Atualiza Renda Variável
      If QryLocal.FieldByName('IDTIPOINVEST').AsInteger = 2 then
      Begin
         // Busca Cotacao do Investimento
         wVlrNovaCotacao := OperComum.BuscaCotacaoInvest(
                                           QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
                                           DataProc, True);
         // Se o ativo estiver na Carteira de Opçõe, Verifica a Cotação Máxima com o Preço de Exercício
         wVlrNovaCotacao := OperComum.BuscaCotacaoOpcao(
                               QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
                               QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                               DataProc,
                               QryLocal.FieldByName('IDLOTE').AsString,
                               wVlrNovaCotacao);

         if wVlrNovaCotacao = 0 then // Não existe Cotação
            wVlrNovoSaldo  := wVlrSaldoInvest
         else
            wVlrNovoSaldo  := OperComum.Trunca(wQtdInvest*wVlrNovaCotacao,2);

         // Busca Cotacao do Investimento
         wVlrAntCotacao := OperComum.BuscaCotacaoInvest(
                                           QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
                                           wDataProcAnt, True);

         if wVlrNovoSaldo <> wVlrSaldoInvest then // Se for igual é porque nunca teve cotação
            wVariacaoContab    :=(wVlrNovoSaldo     - OperComum.Trunca(wQtdInvest*wVlrAntCotacao,2));

         wSaldoVariacaoDia  := wVlrNovoSaldo     - wSaldoAqui;

         fVlrVariacao       := wSaldoVariacaoDia - wSaldoVariacao;

      End;
      // Atualiza Renda Fixa
      If QryLocal.FieldByName('IDTIPOINVEST').AsInteger = 1 then
      Begin
         wVlrNovaCotacao :=  OperacaoInvest.CalculaInvRenFixAtu(
                             QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                             QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
                             1,QryLocal.FieldByName('IDLOTE').AsString,DataProc,
                             fVlrVariacao, fVlrJuros,fVlrJurosInc,fVlrAmortizacao,
                             fVlrJurosPago,fPUAgioDesagio);
         // Calcula Novo Valor do Saldo caso Renda Fixa (Recalculando o saldo com PU)
         wVlrNovoSaldo := (wVlrNovaCotacao * wQtdInvest);
         // Juros
         if wSaldoJuros <> 0 then
         begin
            fVlrJurosAcu := fVlrJuros;
            fVlrJuros := fVlrJuros - wSaldoJuros;
         end;
         // Agio/Desagio
         wAgioDesagio    := 0;
         fVlrAgioDesagio := 0;
         if fPUAgioDesagio <> 0 then
         begin
            wAgioDesagio :=  (wQtdInvest * (OperComum.DivValorZero(wSaldoAgioDesagio,wQtdInvest) - fPUAgioDesagio)) * -1;
            wAgioDesagio := StrToFloat(FormatFloat('#0.##',wAgioDesagio));
            fVlrAgioDesagio := fPUAgioDesagio * wQtdInvest;
         end;
         // Variação
         if wSaldoVariacao <> 0 then
         begin
            fVlrVariacao := fVlrVariacao - wSaldoVariacao;
            // Variação para Titulos com Fluxo de Pagto
            if (QryLocal.FieldByName('IDTIPOINVEST').AsInteger = 1 ) and
               (QryLocal.FieldByName('PERIODICIDADE').AsInteger <> Null) and
               (QryLocal.FieldByName('PERIODICIDADE').AsInteger = pRPI.IDTPPERIODICIDADE) then
            begin
               // VERIFICAR SE FICA CERTO, ALTERAÇÃO PASSADA PELO FÁBIO POR TELEFONE
               if QryLocal.FieldByName('CODTIPRENFIXA').AsString = 'NTN-C' then
               begin
                  fVlrVariacao := wVlrNovoSaldo - wSaldoAqui - fVlrJurosAcu - wSaldoVariacao;
                  wVlrNovoSaldo := wVlrNovoSaldo + fVlrAgioDesagio;
               end
               else
               fVlrVariacao := wVlrNovoSaldo - wVlrSaldoInvest - fVlrJuros;
            end;
         end
         else
         begin
            // Calculo da variação para NTN-C independente de existir Saldo Anterior de Variação
            // Turon - 23/01/2003
            // Variação para Titulos com Fluxo de Pagto
            if (QryLocal.FieldByName('IDTIPOINVEST').AsInteger = 1 ) and
               (QryLocal.FieldByName('PERIODICIDADE').AsInteger <> Null) and
               (QryLocal.FieldByName('PERIODICIDADE').AsInteger = pRPI.IDTPPERIODICIDADE) then
            begin
               // VERIFICAR SE FICA CERTO, ALTERAÇÃO PASSADA PELO FÁBIO POR TELEFONE
               if QryLocal.FieldByName('CODTIPRENFIXA').AsString = 'NTN-C' then
               begin
                  fVlrVariacao := wVlrNovoSaldo - wSaldoAqui - fVlrJuros - wSaldoVariacao;
                  wVlrNovoSaldo := wVlrNovoSaldo + fVlrAgioDesagio;
               end;
            end;
         end;
      End;
      wSaldoInutil := wSaldoJurosDia;
      // Arredonda Saldos Calculados
      fVlrJuros    := StrToFloat(FormatFloat('###############0.00',fVlrJuros));
      fVlrVariacao := StrToFloat(FormatFloat('###############0.00',fVlrVariacao));
      wVlrNovoSaldo     := StrToFloat(FormatFloat('###############0.00',wVlrNovoSaldo));
      wVlrSaldoInvest   := StrToFloat(FormatFloat('###############0.00',wVlrSaldoInvest));

      // Caso não tenha tido alteração nos saldos não inclui registro de atuaização
      // Pula e volta no proximo ...
      If (wVlrNovoSaldo=wVlrSaldoInvest) Then
      Begin
         QryLocal.Next;
         // Avança Progress Bar
         If Tipo = '1' Then
            prbAtualizaRF.StepIt
         Else
            prbAtualizaRV.StepIt;
         // Loop
         Continue
      End;

      // Verifica Tipo de Lancamento
      If (wVlrNovoSaldo - wVlrSaldoInvest) < 0 Then
         wNaturezaMovimento := 'P'
      Else
         wNaturezaMovimento := 'G';

      // Contabiliza Atualização

      wIdForCli :=-1;  // especificar

      If QryLocal.FieldByName('IDTIPOINVEST').AsInteger = 2 then
      begin
      // Busca Dados de Contabilização de Renda Variável

         FazQuery(QryLocalCont,
             'SELECT CODTIPOACAO '+
             'FROM ACAO '+
             'WHERE (IDACAO = '+QuotedStr(QryLocal.FieldByName('IDINVESTIMENTO').AsString)+')');

         wTipoPapel := QryLocalCont.FieldByName('CODTIPOACAO').AsString;
         wMoedaReg   := wMoecodigo;
         wTipoOperacao := -1;
      End;

      If QryLocal.FieldByName('IDTIPOINVEST').AsInteger = 1 then
      begin
         // Busca Dados de Contabilização de Renda Fixa

          FazQuery(QryLocalCont,
             'SELECT TR.CODTIPRENFIXA, TT.IDMOEDAREG '+
             'FROM TITRENFIXA TR, TIPOTITRENFIXA TT '+
             'WHERE (TR.IDTITRENFIXA = '+QuotedStr(QryLocal.FieldByName('IDINVESTIMENTO').AsString)+') AND '+
             '      (TR.CODTIPRENFIXA = TT.CODTIPRENFIXA)');

          wTipoPapel   := QryLocalCont.FieldByName('CODTIPRENFIXA').AsString;
          wMoedaReg     := QryLocalCont.FieldByName('IDMOEDAREG').AsInteger;
          wTipoOperacao := -2;
      End;

      // Testar se provisiona ou não. Dependendo do mercado
      If QryLocal.FieldByName('IDTIPOINVEST').AsInteger = 2 Then
         wApuraIR:=QryLocal.FieldByName('FLGIRRVA').AsString
      Else
         wApuraIR:=QryLocal.FieldByName('FLGIRRFX').AsString;

      // Calcula IOF
      // Está sendo usado o mesmo tratamento de provisionamento de IR
      wVlrIOF := Impostos.CalculaIOF(QryLocal.FieldByName('IDTIPOINVEST').AsInteger,
                             QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                             dataProc,
                             wSaldoAqui,
                             wVlrNovoSaldo,
                             wApuraIR);
      // Calcula Imposto de Renda
      fVlrRendimento := 0;
      wVlrIRDia:= Impostos.CalculaIR(QryLocal.FieldByName('IDTIPOINVEST').AsInteger,
                            QryLocal.FieldByName('IDINVESTIMENTO').AsInteger, 0{CARTEIRAGERENC},
                            QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                            -1,-1,QryLocal.FieldByName('IDLOTE').AsString,
                            QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                            DataProc,
                            wSaldoAqui,
                            wVlrNovoSaldo,
                            wVlrIOF,
                            wApuraIR,
                            'G',fVlrRendimento);

      try
         // Alimenta Carteira
         If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
             QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
             QryLocal.FieldByName('IDTIPOINVEST').AsInteger, -1,-1,
             wTipoOperacao,
             QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
             QryLocal.FieldByName('IDCARTEIRAGERENC').AsInteger,
             -1, -1, wPlanilhaAC, wDocumentoAC, wPlanoAC, DataProc,
             Abs(wVlrNovoSaldo - wVlrSaldoInvest), 0, wValIniCotasGlobal,
             fVlrVariacao,fVlrJuros,
            (wVlrIRDia-wSaldoIRProv),0,(wVlrIOF-wSaldoIOFProv),0, wAgioDesagio, 0, 0,
             wNaturezaMovimento,   ' ', QryLocal.FieldByName('IDLOTE').AsString,
            'ATUALIZAÇÃO.: '+QryLocal.FieldByName('DESCINVESTIMENTO').AsString,
            'ATU', '', '', True,
            -1, iPlanPrevCtbPatro,iIdHistCartInv) Then
            Abort;
      except
         Result := False;
         QryLocal.Free;
            // Mostra Mensagens e sai da Rotina
         MsgDlg('Erro ao Alimentar as Carteiras ','Mensagem do Sistema ',
                   MtWarning,[MbOk],0);
         Exit;
      end;

      try
         If Not OperComum.AtualizaSaldos(wQtdCotaini,-1) Then
            Abort;         
      except
         Result := False;
         QryLocal.Free;   
         MsgDlg('Erro ao Atualizar Saldos das Carteiras ','Mensagem do Sistema ',
                   MtWarning,[MbOk],0);
         Exit;
      end;

      // Contabiliza
      if QryLocal.FieldByName('IDTIPOINVEST').AsInteger = 2 then
      begin
         // Busca Dados de Contabilização de Renda Variável
         FazQuery(QryLocalCont,
           'SELECT CODTIPOACAO '+
           'FROM ACAO '+
           'WHERE (IDACAO = '+QuotedStr(QryLocal.FieldByName('IDINVESTIMENTO').AsString)+')');
         wTipoPapel := QryLocalCont.FieldByName('CODTIPOACAO').AsString;
         wMoedaReg   := wMoecodigo;

//         if  (wVlrNovoSaldo - wVlrSaldoInvest) > 0 then
         if fVlrVariacao >0 then
            wTipoOperacao := -1    // Variação Positiva de RV
         else
            wTipoOperacao := -9;   // Variação Negativa de RV
      end;

      if QryLocal.FieldByName('IDTIPOINVEST').AsInteger = 1 then
      begin
         // Busca Dados de Contabilização de Renda Fixa
         FazQuery(QryLocalCont,
           'SELECT TR.CODTIPRENFIXA, TT.IDMOEDAREG '+
           'FROM TITRENFIXA TR, TIPOTITRENFIXA TT '+
           'WHERE (TR.IDTITRENFIXA = '+QuotedStr(QryLocal.FieldByName('IDINVESTIMENTO').AsString)+') AND '+
           '      (TR.CODTIPRENFIXA = TT.CODTIPRENFIXA)');

         wTipoPapel   := QryLocalCont.FieldByName('CODTIPRENFIXA').AsString;
         wMoedaReg     := QryLocalCont.FieldByName('IDMOEDAREG').AsInteger;
         wTipoOperacao := -2;
      end;
      wIdForCli     := -1;
      wPlanilha     := -1;

      if (fVlrVariacao = 0) and (fVlrJuros <> 0) and (QryLocal.FieldByName('IDTIPOINVEST').AsInteger = 1) then
         fVlrVariacao := 1; // Para forçar a contabilização do Juros quando a variação = 0
//VOLTAR
//{
      try
         If OperComum.LancaOperRFRV(
            Sistema.IdEmpresa, 79,QryLocal.FieldByName('IDTIPOINVEST').AsInteger,
            QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,wTipoOperacao, -1,
            wIdForCli,QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
            wMoedaReg, wTipoPapel,QryLocal.FieldByName('IDLOTE').AsString, '','',
            '', wTipoRecDesBol, bCriaLancto, 0,fVlrVariacao,
            DataProc, DataProc,wPlano, wPlanilha, wDocumento, wMensErro) <> 0 then
            Abort;

            if (RecBuscaTipoOperVarRV.VLRSALDO <> 0) and
               (QryLocal.FieldByName('IDTIPOINVEST').AsInteger = 2) then // Sobrou saldo de variacao para contabilizar
               If OperComum.LancaOperRFRV(
                  Sistema.IdEmpresa, 79,QryLocal.FieldByName('IDTIPOINVEST').AsInteger,
                  QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
                  RecBuscaTipoOperVarRV.TIPOOPERSALDO, -1,
                  wIdForCli,QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                  wMoedaReg, wTipoPapel,QryLocal.FieldByName('IDLOTE').AsString, '','',
                  '', wTipoRecDesBol, bCriaLancto, 0,RecBuscaTipoOperVarRV.VLRSALDO,
                  DataProc, DataProc,wPlano, wPlanilha, wDocumento, wMensErro) <> 0 then
                  Abort;

         RecBuscaTipoOperVarRV.VLRSALDO := 0;
         RecBuscaTipoOperVarRV.TIPOOPERSALDO := 0;
      except
         Result := False;
         QryLocal.Free;
         MsgDlg('Erro ao Atualizar Saldos das Carteiras ','Mensagem do Sistema ',
                   MtWarning,[MbOk],0);
         Exit;
      end;
//}
      if Trim(wMensErro) <> '' then
      begin
         MsgDlg('Ocorreu um erro na contabilisação da operação: '+
                IntToStr(wTipoOperacao),
                'Erro', mtError, [mbOk], 0);
         Result := False;
         Exit;
      end;
      //Processa Fluxo de Titulo se Houver
      if (QryLocal.FieldByName('IDTIPOINVEST').AsInteger = 1 ) and
         ((fVlrJurosInc <> 0) or (fVlrJurosPago <>0) or (fVlrAmortizacao <> 0)) and
         (QryLocal.FieldByName('PERIODICIDADE').AsInteger <> Null) and
         (QryLocal.FieldByName('PERIODICIDADE').AsInteger = pRPI.IDTPPERIODICIDADE) then
      begin
         if not ProcFluxoTitulo(fVlrJurosInc,fVlrJurosPago,fVlrAmortizacao, pRPI.VLRCOTAINICART,
                                QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,wMoedaReg,
                                QryLocal.FieldByName('IDEMISSOR').AsInteger,DataProc,
                                QryLocal.FieldByName('IDLOTE').AsString,wTipoPapel) then
         begin
            Result := False;
            Exit;
         end;
      end;

      // Pula para o Proximo Registro
      QryLocal.Next;
      // Avança Progress Bar
      If Tipo = '1' Then prbAtualizaRF.StepIt Else prbAtualizaRV.StepIt;
   End; // Fecha o While da QryLocal.Eof

   FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOOPERACAO = '+IntToStr(wTipoOperacao));

   // Busca Inicio da Carteira
   FazQuery(QryAux,'SELECT * FROM PARAMINVEST');
   wQtdCotaIni:= QryAux.FieldByName('VLRCOTAINICART').AsInteger;
   wMoeCodigo  := QryAux.FieldByName('MoeCodigo').AsInteger;

   // Busca próxima data de fechamento
   If DataProc = StrToDate(dteDataFinal.Text) Then
      wDataFim := -1
   Else
      wDataFim := DataProc+1;

   // Libera Objetos Locais
   QryLocal.Free;
   QryLocalCont.Free;
End;

 //------------------------------------------------------------------------------
 // Fecha Formulario
procedure TFrmFechamentoDiario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// Caso o Banco esteja em Transacao Cancela
  If DtmBaseDados.dbBaseDados.InTransaction Then
    DtmBaseDados.dbBaseDados.Rollback;
  inherited;
// Fecha Querys
  QryDespesasOperacao.Close;
  QryDespesasOperacao.UnPrepare;
  QryBuscaDespesa.Close;
  QryBuscaCredor.Close;  
end;

//------------------------------------------------------------------------------
// Mostra Formulario
procedure TFrmFechamentoDiario.FormShow(Sender: TObject);
Var
  TipoInvest:String;
begin
  inherited;

   Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');  

   bCriaLancto := true;
   wTipoRecDesBol := '';
   pgcFechamento.ActivePage:=tbsFechamento;
   BtProcessar.Enabled :=True;
   // Pega data de Acordo com o Tipo de Menu
   if TipoMenuInvest = 'A' then
   begin
      MsgDlg('Sistema utilizado para Ambos os Tipos de Investimento.'+#13+
             'Escolha apenas um dos Tipos.','Mensagem do Sistema', MtError, [MbOk],0);
      Close;
      Exit;
   end;
   {End
   Else If TipoMenuInvest = 'F' Then
     wStrData := 'DATAULTFECHRF'
   Else If TipoMenuInvest = 'V' Then
     wStrData := 'DATAULTFECH';}

   // Preenche Datas com o ultimo fechamento + 1
   {if FazQuery(QryAux,'SELECT '+wStrData+' FROM PARAMINVEST') then
   begin
      // Caso Nao exista ultimo fechamento Cria com a primeira operacao feita
      if QryAux.FieldByName(wStrData).AsDateTime = 0 then
      begin
         // Busca data da Primeira Operacao
         if FazQuery(QryAux,'SELECT DATAOPERACAO FROM OPERACAOINVEST ORDER BY DATAOPERACAO') then
         begin
            // Preenche Textos
            pnlMensagens.Caption := 'Último Fechamento .: '+DateToStr(QryAux.FieldByName('DATAOPERACAO').AsDateTime);
            dteDataInicio.Text := DateToStr(QryAux.FieldByName('DATAOPERACAO').AsDateTime+1);
            dteDataFinal.Text := DateToStr(QryAux.FieldByName('DATAOPERACAO').AsDateTime+1);
            // Data do Ultimo fechamento = Data da primeira Operacao
            ExecutaQuery(QryAux,'UPDATE PARAMINVEST SET '+wStrData+' = TO_DATE('''+
                            QryAux.FieldByName('DATAOPERACAO').AsString+
                            ''',''DD/MM/YYYY'')');
         end
         else
         begin
            MsgDlg('Não Existem Operações Feitas ','Mensagem do Sistema ',MtWarning,[MbOk],0);
            Exit;
         end;
      end
      else
      begin
         // Preenche Textos
         DataUltFech    := QryAux.FieldByName(wStrData).AsDateTime+1;
         pnlMensagens.Caption := 'Último Fechamento .: '+DateToStr(QryAux.FieldByName(wStrData).AsDateTime);
         dteDataInicio.Text := DateToStr(QryAux.FieldByName(wStrData).AsDateTime+1);
         dteDataFinal.Text := DateToStr(QryAux.FieldByName(wStrData).AsDateTime+1);
      end;
   end
   else
   begin
      MsgDlg('Atenção, Tabela de Parâmetros não preenchida !!','Mensagem do Sistema ',MtWarning,[MbOk],0);
      Exit;
   end;}

   // Preenche Datas com o ultimo fechamento + 1

   QryDespesasOperacao.Prepare;

   if TipoMenuInvest = 'F' then   // RENDA FIXA
   begin
      wStrData := 'DATAULTFECHRF';
      if pRPI.DATAULTFECHRF <> 0 then
      begin
         dteDataInicio.Date := pRPI.DATAULTFECHRF+1;
         dteDataFinal.Date := pRPI.DATAULTFECHRF+1;
      end;
      grbRendaVariavel.Visible    := False;
      grbRendaFixa.Visible   := True;
      BtProcessar.Top   := 84;
      chkAtualizaRF.Checked := True;
      chkCalculaCotacao.Checked := False;
      chkAtualizaRV.Checked := False;
      ChkVencContr.Checked := False;
      FrmFechamentoDiario.Caption := 'Renda Fixa (Fechamento)';
   end
   else if TipoMenuInvest = 'V' then  // RENDA VARIAVEL
   begin
      wStrData := 'DATAULTFECH';
      if pRPI.DATAULTFECH <> 0 then
      begin
         dteDataInicio.Date := pRPI.DATAULTFECH+1;
         dteDataFinal.Date := pRPI.DATAULTFECH+1;
      end;
      grbRendaVariavel.Visible  := True;
      grbRendaFixa.Visible := False;  
      BtProcessar.Top := 127;
      chkCalculaCotacao.Checked := True;
      chkAtualizaRV.Checked := True;
      ChkVencContr.Checked := True;
      chkAtualizaRF.Checked := False;
      FrmFechamentoDiario.Caption := 'Renda Variável (Fechamento)';
   end  
   else if TipoMenuInvest = 'B' then  // BM&F
   begin
      wStrData := 'DATAULTFECHBMF';
      if pRPI.DATAULTFECHBMF <> 0 then
      begin
         dteDataInicio.Date := pRPI.DATAULTFECHBMF+1;
         dteDataFinal.Date := pRPI.DATAULTFECHBMF+1;
      end;
   end
   else
   begin
      dteDataInicio.Date := Now;
      dteDataFinal.Date := Now;
      MsgDlg('Atenção: Não foi especificado um módulo para o Fechamento Diário!',
              'Mensagem do Sistema', MtWarning, [MbOk], 0);
   end;
   While not DiasUteisInv.DiaUtil(dteDataInicio.Date,-1,1,'',True,False,False) Do
      dteDataInicio.Date  := dteDataInicio.Date + 1;   // Achar o próximo dia útil
   dteDataFinal.Date := dteDataInicio.Date;

end;

//------------------------------------------------------------------------------
procedure TFrmFechamentoDiario.bbtnConfirmarClick(Sender: TObject);
Var
   iTipoFundoInvest : Integer;
begin
  inherited;
   if not dtmBaseDados.dbBaseDados.InTransaction then
   begin
      MsgDlg('Erro no Controle de Transações. Transação já Comitada', 'Mensagem do Sistema', mtInformation,[MbOk],0);
      DtmBaseDados.dbBaseDados.StartTransaction;
   end;
   // Guarda a Data do Ultimo Fechamento
   If DataProxFech <> 0 Then
      ExecutaQuery(QryAux,'UPDATE PARAMINVEST SET '+wStrData+' = TO_DATE('''+
                      DateToStr(DataProxFech)+''',''DD/MM/YYYY'')');

   // Caso o Banco esteja em Transacao Commita
   If DtmBaseDados.dbBaseDados.InTransaction Then
//VOLTAR
      DtmBaseDados.dbBaseDados.Commit;

   // Monta Registro do Parâmetro
   Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');      

   // Inabilita Botao
   bbtnCancelar.Enabled  := False;
   bbtnConfirmar.Enabled := False;
   BtProcessar.Enabled   := True;
   // Preenche Datas com o ultimo fechamento + 1
   If FazQuery(QryAux,'SELECT '+wStrData+' FROM PARAMINVEST') Then
   Begin
      // Caso Nao exista ultimo fechamento Cria com a primeira operacao feita
      If QryAux.FieldByName(wStrData).AsDateTime = 0 Then
      Begin
         // A Desenvolver
      End;
      pnlMensagens.Caption := 'Último Fechamento .: '+DateToStr(QryAux.FieldByName(wStrData).AsDateTime);
      dteDataInicio.Date := QryAux.FieldByName(wStrData).AsDateTime+1;
      While not DiasUteisInv.DiaUtil(dteDataInicio.Date,-1,1,'',True,False,False) Do
         dteDataInicio.Date  := dteDataInicio.Date + 1;   // Achar o próximo dia útil

      dteDataFinal.Date := dteDataInicio.Date;
   End Else Begin
     pnlMensagens.Caption := 'Último Fechamento .: '+DateToStr(Date);
   End;

   // Click no Cancelar
   bbtnCancelar.Click;
   pnlMensagens.Caption := '';
end;

//------------------------------------------------------------------------------
procedure TFrmFechamentoDiario.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Cancela Despesas
  If Not QryDespesasOperacao.IsEmpty Then Begin
    Try
      QryDespesasOperacao.CancelUpdates;
    Except
    End;
  End;
// Cancela Impostos
  If Not QryImpostosOperacao.IsEmpty Then Begin
    Try
      QryImpostosOperacao.CancelUpdates;
    Except
    End;
  End;
// Caso o Banco esteja em Transacao Rollbacka
  If DtmBaseDados.dbBaseDados.InTransaction Then
    DtmBaseDados.dbBaseDados.Rollback;
    
// Inabilita Botao
  bbtnCancelar.Enabled  := False;
  bbtnConfirmar.Enabled := False;
  BtProcessar.Enabled   := True;

  prbCalculaCotacao.Max := 0;
  prbCalculaCotacao.StepIt;

  prbAtualizaRV.Max := 0;
  prbAtualizaRV.StepIt;
  
// Fecha Querys
  QryImpostosOperacao.Close;
  QryDespesasOperacao.Close;
  
// Preenche Datas com o ultimo fechamento + 1
   If FazQuery(QryAux,'SELECT '+wStrData+' FROM PARAMINVEST') Then
   Begin
      // Caso Nao exista ultimo fechamento Cria com a primeira operacao feita
      If QryAux.FieldByName(wStrData).AsDateTime = 0 Then Begin

      End;
      pnlMensagens.Caption := 'Último Fechamento .: '+DateToStr(QryAux.FieldByName(wStrData).AsDateTime);
      dteDataInicio.Text := DateToStr(QryAux.FieldByName(wStrData).AsDateTime+1);
      While not DiasUteisInv.DiaUtil(StrToDate(dteDataInicio.Text),-1,1,'',True,False,False) Do
         dteDataInicio.Text  := DateToStr(StrToDate(dteDataInicio.Text) + 1);   // Achar o próximo dia útil
   End Else Begin
      pnlMensagens.Caption := 'Último Fechamento .: '+DateToStr(Date);
   End;
   pgcFechamento.ActivePage:=tbsFechamento;
end;



//------------------------------------------------------------------------------
// Botao Sair
procedure TFrmFechamentoDiario.bbtnSairClick(Sender: TObject);
begin
// Caso esteja em transacao mostra mensagem informando
  If DtmBaseDados.dbBaseDados.InTransaction Then Begin
    If MsgDlg( 'As alterações não foram confirmadas, Deseja Sair ?','Mensagem do Sistema ',
             MtWarning,[MbOk, MbCancel],0) = MrCancel Then
      Exit;

  End;

// Executa Botao Cancelar
  bbtnCancelarClick(Self);
  inherited;
end;

//******************************************************************************
// Processa Contratos Vencendo na Data de Processamento (NAO EXERCICIO)
Procedure TFrmFechamentoDiario.ProcVencimentosContrato(DataProc:TDateTime);
Var
  QryLocal:TwwQuery;

  wSaldoQtd, wQtdOperacao, wSaldoInutil, wPrecoUnitario  : Double;

  wIdTipoOperacao, wIdBolsaValores, wIdCorretValores, wIdInvestimento,
  wIdCarteira, wIdCartOriDest  : Integer;

  wCodTipoAcao, wIdLote :String;

Begin
// Cria Objetos Locais
  QryLocal              := TwwQuery.Create(Application);
  QryLocal.DatabaseName := 'BaseDados';

// Busca Contratos Vencendo na Data de Processamento, caso não encontre, Sai.
  If Not FazQuery(QryLocal,
    'SELECT CIN.IDCONTRATOINVEST, CIN.IDEMISSOR,     CIN.IDCORRETVALORES, CIN.IDBOLSAVALORES, CIN.IDTIPOCONTRINVEST,    '+
	   '       CIN.IDINVESTIMENTO,   CIN.IDLOTE,        CIN.DATACOMPRALOTE,  CIN.DATAVENCIM,     CIN.VLRCOMPRATITLOTE,     '+
	   '       CIN.QTDETITLOTE,      CIN.SALDOTITLOTE,  CIN.VLRRESGATE,      CIN.PRECOVENCIM,    CIN.IDCARTLASTRO,         '+
    '       CIN.IDCARTAVISTA,     TCI.IDNAOEXPADRAO, CIN.SERIE, '+
    '       CIN.IDEMISSOR '+
    'FROM CONTRATOINVESTIM CIN, TIPOCONTRINVEST TCI '+
    'WHERE (DATAVENCIM = TO_DATE( '''+DateToStr(DataProc)+''',''DD/MM/YYYY'')) AND '+
    '      (CIN.IDTIPOCONTRINVEST = TCI.IDTIPOCONTRINVEST) ') Then Begin
// Libera Objetos Locais
    QryLocal.Free;
// Sai
    Exit;
  End;
// Inicia o Progressbar
  prbVencContr.Max:=QryLocal.RecordCount;
// Enquanto Existirem Registros no Dia Processa
  While Not QryLocal.Eof Do
  Begin
// Preenche Parametros
    wIdTipoOperacao   := QryLocal.FieldByName('IDNAOEXPADRAO').AsInteger;
    wIdBolsaValores   := QryLocal.FieldByName('IDBOLSAVALORES').AsInteger;
    wIdCorretValores  := QryLocal.FieldByName('IDCORRETVALORES').AsInteger;
    wIdInvestimento   := QryLocal.FieldByName('IDINVESTIMENTO').AsInteger;

    wIdCarteira       := QryLocal.FieldByName('IDCARTLASTRO').AsInteger; { Origem }
    wIdCartOriDest    := QryLocal.FieldByName('IDCARTAVISTA').AsInteger; { Destino }

    wIdLote           := QryLocal.FieldByName('IDLOTE').AsString;

//------------------------------------------------------------------------------
// Busca Saldos na Carteira na Carteira de Lastro {IdCarteira - Origem}
    wSaldoQtd:=0;
    //AL_1
    //AL_2
    OperComum.BuscaTodosSaldosInvestLote(
      wIdCarteira, 0{IDCARTEIRAGERENC}, wIdInvestimento, 9999999, -1, wIdLote,
      DateToStr(DataProc), -1,
      wSaldoQtd,    wSaldoInutil,    wSaldoInutil, wSaldoInutil, wSaldoInutil,
      wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,wSaldoInutil,
      wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,wSaldoInutil,
      wSaldoInutil, wSaldoInutil, wSaldoInutil);
// Guarda Saldo
    wQtdOperacao  :=wSaldoQtd;
    wPrecoUnitario:=-1;
// Caso não exista saldo na Carteira Carteira de Lastro {IdCarteira - Origem}
// Continua do Inicio com o proximo contrato .
    If (wSaldoQtd <= 0) Then Begin
// Proximo Registro
      QryLocal.Next;
// Avanca Progressbar
      prbVencContr.StepIt;
// Volto ao Loop
      Continue;
    End;  
// Executa a Operacao de Nao exercicio padrão do Tipo de Contrato
    ExecutaOperacao(wIdTipoOperacao, wIdBolsaValores, wIdCorretValores,
                    wIdInvestimento, wIdCarteira,     wIdCartOriDest,
                    wIdLote, wQtdOperacao, wPrecoUnitario,
                    DataProc);
// Avanca Progressbar
      prbVencContr.StepIt;
// Proximo Registro
    QryLocal.Next;
  End;
// Libera Objetos Locais
  QryLocal.Free;
End;


procedure TFrmFechamentoDiario.dteDataInicioExit(Sender: TObject);
begin
  inherited;
{  Try
    If (StrToDate(dteDataInicio.Text) > DataUltFech+1) Then Begin
      MsgDlg('Data Inicial não pode ser maior que o dia seguinte ao Último Fechamento. ',
             'Mensagem do Sistema',MtError,[MbOk],0);
      dteDataInicio.SetFocus;
      dteDataInicio.Text:=DateToStr(DataUltFech);
    End;
  Except
  End;
}
end;

// Contabiliza Operações de Direito
Function TFrmFechamentoDiario.ContabilizaOperDireito : Boolean;
Var
  wMensErro, wRecPagBol, wTipoRecDesBol :String;
  wPlanilha, wDocumCont, wPlano :Integer;
  wTotalContab : Double;
  bCriaLancto: boolean;
Begin
   Result := True;
   // Busca Documentos de Operação de Direito
   with qryContabOperDireito do begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('DATAINICIO').asDateTime := StrToDate(dteDataInicio.Text);
      ParamByName('DATAFIM').asDateTime    := StrToDate(dteDataFinal.Text);
      Open;

      While Not Eof Do Begin

       // Trata variáveis da Integração Contábil-Financeira
         wPlanilha  :=-1;
         wPlano     :=-1;
         wDocumCont :=-1;

         bCriaLancto    := true;
         wTipoRecDesBol := '';

         wDocumento := FieldByName('NUMDOCUMENTO').AsString;
         QryConsulta.ParamByName('NUMDOC').AsString    := wDocumento;
         QryConsulta.Open;

         QryConsulta.First;

         // Acha Valor Líqiuido da Boleta de define sRecPagBol (Se a Boleta é a pagar ou receber)
         wTotalLiquido:=0;
         While Not QryConsulta.EOF Do Begin
       // Soma de Acordo com Tipo de Natureza(Venda/Compra)
           If (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'A') Or
              (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'V') Or
              (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'U') Or
              (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'M') Then Begin
             wTotalLiquido := wTotalLiquido +
                              QryConsulta.FieldByName('VLROPERACAO').AsFloat;
           End Else If (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'D') Or
                       (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'S') Or
                       (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'O') Or
                       (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'R') Or
                       (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'I') Then Begin
             wTotalLiquido := wTotalLiquido -
                              QryConsulta.FieldByName('VLROPERACAO').AsFloat ;
           End;

       // Pula Registro
           QryConsulta.Next;
         End;

         If (wTotalLiquido < 0) Then wRecPagBol := 'R'
         Else  wRecPagBol := 'P';
         wTotalContab := Abs(wTotalLiquido);

         MontaQryConsulta; //Ordenando pelo tipo de Natureza (P/R)

       // Contabiliza Operação

         QryConsulta.First;

         While Not QryConsulta.EOF Do Begin
             Try
                // Inicia Transação
//                If not dtmBaseDados.dbBaseDados.InTransaction then
//                   dtmBaseDados.dbBaseDados.StartTransaction;

                If OperComum.LancaOperRFRV(
                             Sistema.IdEmpresa, Sistema.IdModulo,
                             QryConsulta.FieldByName('IDTIPOINVEST').AsInteger,
                             QryConsulta.FieldByName('IDINVESTIMENTO').AsInteger,
                             QryConsulta.FieldByName('IDTIPOOPERACAO').AsInteger,
                             QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger,
                             QryConsulta.FieldByName('IDFORCLI').AsInteger,
                             QryConsulta.FieldByName('IDCARTEIRAINVEST').AsInteger,
                             QryConsulta.FieldByName('MOECODIGO').AsInteger,
                             QryConsulta.FieldByName('CODTIPOACAO').AsString,
                             QryConsulta.FieldByName('IDLOTE').AsString,
                             '',
                             QryConsulta.FieldByName('NUMDOCUMENTO').AsString,
                             wRecPagBol, wTipoRecDesBol, bCriaLancto, wTotalContab,
                             QryConsulta.FieldByName('VLROPERACAO').AsFloat,
                             QryConsulta.FieldByName('DATAOPERACAO').AsDateTime,
                             QryConsulta.FieldByName('DATAVENCOPER').AsDateTime,
                             wPlano, wPlanilha, wDocumCont, wMensErro) <> 0 Then
                    Abort;
                // Confirma Transação
//                dtmBaseDados.dbBaseDados.Commit;
             Except
//                DtmBaseDados.dbBaseDados.RollBack;
                Result := False;
                MsgDlg('Não foi possível contabilizar as Operações de Direitos.','Mensagem do Sistema',
                       MtError,[MbOk],0);   
                Exit;       
             End;
       // Proximo Registro de Operacao
           QryConsulta.Next;
         End;

         Next;
      end;
      Close;
   end;

End;

procedure TFrmFechamentoDiario.MontaQryConsulta;
begin
   With QryConsulta Do
   Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER,');
      SQL.Add('       OI.QTDEOPERACAO, OI.IDOPERACAOINVEST,OI.PRECOUNITOPERACAO,');
      SQL.Add('       OI.VLROPERACAO, DS.TOTALDESPESAS,');
      SQL.Add('       SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO,');
      SQL.Add('       PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,15) AS DESCINVESTIMENTO,');
      SQL.Add('       TI.DESCTIPOOPERACAO, OI.NUMDOCUMENTO,');
      SQL.Add('       TI.NATUREZAOPERACAO, OI.IDTIPOOPERACAO,');
      SQL.Add('       TI.IDTIPOINVEST, OI.IDTIPOOPERACAO, OI.IDFORCLI,');
      SQL.Add('       OI.IDCARTEIRAINVEST, AC.CODTIPOACAO, OI.MOECODIGO,');
      SQL.Add('       OI.IDINVESTIMENTO, OI.IDLOTE, OI.FLGSTATUSFECHBOL,');
      SQL.Add('       DECODE(TI.NATUREZAOPERACAO, ''D'',''R'',');
      SQL.Add('          DECODE(TI.NATUREZAOPERACAO, ''S'',''R'',');
      SQL.Add('             DECODE(TI.NATUREZAOPERACAO, ''O'',''R'',');
      SQL.Add('                DECODE(TI.NATUREZAOPERACAO, ''R'',''R'',');
      SQL.Add('                   DECODE(TI.NATUREZAOPERACAO, ''I'',''R'',''P''))))) AS  RECPAGBOL');
      SQL.Add('FROM OPERACAOINVEST OI, OPRACAO OA,  PESSOA PS, BOLSAVALORES BV,');
      SQL.Add('     INVESTIMENTO IV, TIPOOPERACAO TI, MERCADO ME, ACAO AC,');
      SQL.Add('      	(SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS');
      SQL.Add('         FROM   DESPOPERINVEST DOI, TIPODESPINVEST TDI');
      SQL.Add('         WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST 	AND');
      SQL.Add('                TDI.NATUREZAOPERACAO NOT IN (''N'')');
      SQL.Add('         GROUP BY DOI.IDOPERACAOINVEST) DS');
      SQL.Add('WHERE (OI.NUMDOCUMENTO     = '''+wDocumento+''')     AND');
      SQL.Add('      (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST)    AND');
      SQL.Add('      (OI.IDOPERACAOINVEST = DS.IDOPERACAOINVEST(+)) AND');
      SQL.Add('      (OI.IDCORRETVALORES  = PS.IDPESSOA(+)) 	    AND');
      SQL.Add('      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)	    AND');
      SQL.Add('      (OA.IDACAO 	  = IV.IDINVESTIMENTO)      AND');
      SQL.Add('      (TI.IDMERCADO 	  = ME.IDMERCADO)	    AND');
      SQL.Add('      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)      AND');
      SQL.Add('      (OI.IDINVESTIMENTO   = AC.IDACAO)');
      If (wTotalLiquido < 0) Then
         SQL.Add('   ORDER BY RECPAGBOL DESC')
      Else
         SQL.Add('   ORDER BY RECPAGBOL     ');
      Open;
   End;
end;

function TFrmFechamentoDiario.ProcFluxoTitulo(fVlrJurosInc,fVlrJurosPago,fVlrAmortizacao,wCotaIni:Double;
                                              iCarteira,iInvestimento,wMoedaReg,iEmissor:Integer;DataProc:TDateTime;
                                              sLote,wTipoPapel:String):Boolean;
var
   sTipoOperacao : String;
   iTipoOperacao : Integer;
   fVlrFluxoTitulo,fVlrJuros : Double;
begin
//   if not(dtmBaseDados.dbBaseDados.InTransaction) then
//      DtmBaseDados.dbBaseDados.StartTransaction;
   Result := True;
   try
      if fVlrJurosInc <> 0 then // Alimenta Carteira com Juros Incorporado
      begin
         fVlrFluxoTitulo := fVlrJurosInc;
         fVlrJuros := fVlrJurosInc * -1;
         iTipoOperacao := -19;
//         ExcluiFluxoTitulo(iTipoOperacao,iCarteira,iInvestimento,DataProc);
         sTipoOperacao := 'Incorporação de Juros';
         AlimentaFluxoTitulo(fVlrFluxoTitulo,fVlrJuros,wCotaIni,iTipoOperacao,iCarteira,
                             iInvestimento,wMoedaReg,iEmissor,DataProc,sLote,wTipoPapel,sTipoOperacao);
      end;
      if fVlrJurosPago <> 0 then // Alimenta Carteira com Juros Pagos
      begin
         fVlrFluxoTitulo := fVlrJurosPago;
         fVlrJuros := fVlrJurosPago * -1;
         iTipoOperacao := -17;
//         ExcluiFluxoTitulo(iTipoOperacao,iCarteira,iInvestimento,DataProc);
         sTipoOperacao := 'Pagamentos de Juros';
         AlimentaFluxoTitulo(fVlrFluxoTitulo,fVlrJuros,wCotaIni,iTipoOperacao,iCarteira,
                             iInvestimento,wMoedaReg,iEmissor,DataProc,sLote,wTipoPapel,sTipoOperacao);
      end;
      if fVlrAmortizacao <> 0 then // Alimenta Carteira com Amortização de Principal
      begin
         fVlrFluxoTitulo := fVlrAmortizacao;
         fVlrJuros := 0;
         iTipoOperacao := -18;
//         ExcluiFluxoTitulo(iTipoOperacao,iCarteira,iInvestimento,DataProc);
         sTipoOperacao := 'Amortização de Principal';
         AlimentaFluxoTitulo(fVlrFluxoTitulo,fVlrJuros,wCotaIni,iTipoOperacao,iCarteira,
                             iInvestimento,wMoedaReg,iEmissor,DataProc,sLote,wTipoPapel,sTipoOperacao);
      end;
//      if dtmBaseDados.dbBaseDados.InTransaction then
//         DtmBaseDados.dbBaseDados.Commit;
      Result := True;
   except on E: Exception do
      begin
         Screen.Cursor := crDefault;
         Result := False;
         MsgDlg('Ocorreu um problema no cálculo da Amortização/Pagamento de Juros'+
                E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
//         if dtmBaseDados.dbBaseDados.InTransaction then
//            DtmBaseDados.dbBaseDados.Rollback;
      end;
   end;
end;

function TFrmFechamentoDiario.ExcluiFluxoTitulo(iTipoOperacao,iCarteira,iInvestimento : Integer;
                              DataProc:TDateTime) : Boolean;
begin
   Result := True;
   try
//      if not dtmBaseDados.dbBaseDados.InTransaction then
//         dtmBaseDados.dbBaseDados.StartTransaction;

      // Exclui Registro se já houver lançamento
      with QryExcluiFluxoTitulo do
      begin
         Close;
         ParamByName('iCarteira').AsInteger     := iCarteira;
         ParamByName('iInvestimento').AsInteger := iInvestimento;
         ParamByName('iTipoOperacao').AsInteger := iTipoOperacao;
         ParamByName('DataProc').AsString       := DateToStr(DataProc);
         Open;
         if not QryExcluiFluxoTitulo.IsEmpty then Begin
            If Not OperComum.ProcExclui(FieldByName('CODDOCUMENTO').AsInteger,
                                 FieldByName('PLNCODIGO').AsInteger,
                                 FieldByName('PLANO').AsInteger,
                                 -1,DataProc,True,False) Then
               Abort;
         End;
         // HistCartinv - Limpa
         with QryDelExcluiFluxoTitulo do begin
            Close;
            ParamByName('iCarteira').AsInteger     := iCarteira;
            ParamByName('iInvestimento').AsInteger := iInvestimento;
            ParamByName('iTipoOperacao').AsInteger := iTipoOperacao;
            ParamByName('DataProc').AsString       := DateToStr(DataProc);
            ExecSQL;
         end;
         // OperacaoInvest - Limpa
         with QryDelOperInvFluxoTitulo do begin
            Close;
            ParamByName('iCarteira').AsInteger     := iCarteira;
            ParamByName('iInvestimento').AsInteger := iInvestimento;
            ParamByName('iTipoOperacao').AsInteger := iTipoOperacao;
            ParamByName('DataProc').AsString       := DateToStr(DataProc);
            ExecSQL;
         end;
      end;
//      dtmBaseDados.dbBaseDados.Commit;
   Except
      Result := False;
//      dtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('Ocorreu um problema na exclusão do Fluxo de Título.','Mensagem do Sistema ',mtError,[mbOK],0);
   End;
end;

procedure TFrmFechamentoDiario.AlimentaFluxoTitulo(fVlrFluxoTitulo,fVlrJuros,wCotaIni:Double;
                                              iTipoOperacao,iCarteira,iInvestimento,wMoedaReg,iEmissor:Integer;
                                              DataProc:TDateTime;sLote,wTipoPapel,sTipoOperacao:String);
var
   iOperacaoInvest : integer;
   wPlanilha,wPlano : integer;
   wDocumento : integer;
begin
   bCriaLancto := True;
   iEmissor := OperComum.BuscaForCli(1,iEmissor,iTipoOperacao,pRPI.IDTIPOCLIENTECOR);
   // Grava OPERACAOINVEST
   with QryInsFluxoTitulo do
   begin
      Close;
      iOperacaoInvest := LeUltRegistro(nil,'OPERACAOINVEST');
      ParamByName('IDOPERACAOINVEST').AsInteger       := iOperacaoInvest;
      ParamByName('IDCORRETVALORES').Clear;
      ParamByName('MOECODIGO').AsInteger              :=wMoedaReg;
      ParamByName('IDMODULO').Clear;
      ParamByName('EMPRESAPROP').AsInteger            := Sistema.IdEmpresa;
      ParamByName('IDINVESTIMENTO').AsInteger         := iInvestimento;
      ParamByName('IDCARTEIRAINVEST').AsInteger       := iCarteira;
      ParamByName('IDTIPOINVEST').AsInteger           := 1;
      ParamByName('IDTIPOOPERACAO').AsInteger         := iTipoOperacao;
      ParamByName('DATAOPERACAO').AsDateTime          := DataProc;
      ParamByName('NUMDOCUMENTO').AsString            := '';
      ParamByName('VLROPERACAO').AsFloat              := fVlrFluxoTitulo;
      ParamByName('DATAVENCOPER').AsDateTime          := DataProc;
      ParamByName('IDFORCLI').AsInteger               := iEmissor;
      ParamByName('IDLOTE').AsString                  := sLote;
      ParamByName('IDCUSTODIANTE').Clear;
      ParamByName('IDORDMOVINV').Clear;
      ExecSQL;
   end;

   // Alimenta Carteira
   if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,iInvestimento,1,
             iOperacaoInvest,-1,iTipoOperacao,iCarteira,0{IDCARTEIRAGERENC},-1, -1, -1, -1, -1,
             DataProc,fVlrFluxoTitulo, 0,wCotaIni,0,fVlrJuros,0,0,0,0,0,0,0,
             'C', ' ',sLote,sTipoOperacao,'OPE', '', '', True,
             -1, iPlanPrevCtbPatro,iIdHistCartInv) then
   begin
      MsgDlg('Erro ao Alimentar as Carteiras : '+sTipoOperacao+'','Mensagem do Sistema ',MtWarning,[MbOk],0);
      Exit;
   end
   else
   begin
      If Not OperComum.AtualizaSaldos(wCotaIni,-1) Then
         Abort;
         
      wPlanilha := -1;
      wPlano    := -1;
      wDocumento:= -1;
// VOLTAR
//{
      OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,1,iInvestimento,iTipoOperacao, -1, iEmissor,
                         iCarteira,wMoedaReg, wTipoPapel,sLote,'', '','', wTipoRecDesBol,
                         bCriaLancto, 0,fVlrFluxoTitulo, DataProc, DataProc,
                         wPlano, wPlanilha, wDocumento, wMensErro);
      if Trim(wMensErro) <> '' then
      begin
         MsgDlg('Atenção: Ocorreu um erro na contabilisação da operação '+sTipoOperacao+' ',
                'Mensagem do Sistema', MtWarning, [MbOk], 0);
         Exit;
      end;
//}
   end;
end;

function  TFrmFechamentoDiario.ExcluiRegAtualizacao(iInv: Integer = 0): Boolean;
Var
   wQtdCotaini : Double;
begin
   result      := True;
   wQtdCotaini := 1;
   Try
      OperComum.LimpaParametros(QryRegAtualizacao);
      QryRegAtualizacao.ParamByName('DATAMOVCARTINV').AsDateTime := StrToDate(dteDataInicio.Text);
      if TipoMenuInvest = 'F' then
         QryRegAtualizacao.ParamByName('IDTIPOINVEST').AsInteger := 1
      else if TipoMenuInvest = 'V' then
         QryRegAtualizacao.ParamByName('IDTIPOINVEST').AsInteger := 2;

      // Processar um único investimento
      if iInv > 0 then
         QryRegAtualizacao.ParamByName('IDINVESTIMENTO').AsInteger := iInv;

      QryRegAtualizacao.Open;
      If QryRegAtualizacao.RecordCount > 0 Then
      Begin
         frmAguarde.Pos := 0;
         frmAguarde.Max := QryRegAtualizacao.RecordCount;
         frmAguarde.Mostra('Limpando Base - Atualizações');
      End;
      While Not QryRegAtualizacao.Eof Do
      Begin
         Try
             if QryRegAtualizacao.FieldByName('PLNCODIGO').IsNull then
             begin
                with dtmOperComum.qryAuxiliar do begin
                   Close;
                   SQL.Clear;
                   SQL.Text := 'DELETE FROM HISTCARTINV WHERE IDHISTCARTINV = '+IntToStr(QryRegAtualizacao.FieldByName('IDHISTCARTINV').AsInteger);
                   ExecSQL;
                   Close;
                end;
             end else begin
                with dtmOperComum.qryAuxiliar do begin
                   Close;
                   SQL.Clear;
                   SQL.Text := 'DELETE FROM HISTCARTINV WHERE PLNCODIGO = '+IntToStr(QryRegAtualizacao.FieldByName('PLNCODIGO').AsInteger);
                   ExecSQL;
                   Close;
                end;
             end;

             with dtmOperComum.qryAuxiliar do
             begin
               Close;
               SQL.Clear;
               SQL.Text := 'DELETE FROM LANCAMENTO WHERE PLNCODIGO = ' + IntToStr(QryRegAtualizacao.FieldByName('PLNCODIGO').AsInteger);
               ExecSQL;
               Close;
            end;

            with dtmOperComum.qryAuxiliar do begin
               Close;
               SQL.Clear;
               SQL.Text := 'DELETE FROM PLANILHA WHERE PLNCODIGO = ' + IntToStr(QryRegAtualizacao.FieldByName('PLNCODIGO').AsInteger);
               ExecSQL;
               Close;
             end;
         Except
            Result := false;
            Exit;
         End;

         QryRegAtualizacao.Next;
         frmAguarde.Pos := frmAguarde.Pos + 1;
      End;

      If QryRegAtualizacao.RecordCount > 0 Then
         frmAguarde.Apaga;

      QryRegAtualizacao.Close;

   Except
      QryRegAtualizacao.Close;
      Result := False;
   End;
end;

function TFrmFechamentoDiario.AtualizaEmprestimoAcoes(dDataProc:TDateTime):boolean;
var
   fSldHist,fSldQtdHist,fResult,fPrincipal : Double;
   iIdHistEmpAcoes,iPlanilha,iDocumento : integer;
   dDataDia   : TDateTime;
   sHistorico : string;
   Regra : TRegra;
begin
   Result := True;

   Regra                 := TRegra.Create(Application);
   Regra.DatabaseName    := 'BaseDados';
   Regra.TipoCliente     := tcFundacao;   

   if not EmprestAcoes.BuscaSaldosHist(dDataProc,-1,-1,-1,fSldHist,fSldQtdHist) then
   begin
      MsgDlg('Não foi possível buscar os saldos de empréstimo de ações.','Mensagem do Sistema',mtWarning,[mbOk],0);
      Result := False;
      Exit;
   end
   else
   begin
      // Calcula a Atualizacao do Emprestimo
      try
         // Exclui atualizações se já houver sido feito o fechamento
         if not EmprestAcoes.ExcluiEmprestimoAcoes(-1,DateToStr(dDataProc),'ATU',False) then
         begin
            MsgDlg('Não foi possível excluir as atualizações.','Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
            Exit;
         end;

         with DMEmprestAcoes.qryBuscaSaldoHist do
         begin
            while not Eof do
            begin
               // Não atualiza na data da aplicação
               if (DMEmprestAcoes.qryBuscaSaldoHistDATAOPERACAO.AsDateTime = dDataProc) And
                  (DMEmprestAcoes.qryBuscaSaldoHistNATURMOV.AsString       = 'A') then
               begin
                  Next;
                  Continue;
               end;
               // Montar SQL
               DMEmprestAcoes.qryAux.SQL.Clear;

               dDataDia := DMEmprestAcoes.qryBuscaSaldoHistDATAOPERACAO.AsDateTime + 1;
               While not DiasUteisInv.DiaUtil(dDataDia,-1,1,'',True,False,False) Do
                  dDataDia  := dDataDia + 1;

               DMEmprestAcoes.qryAux.SQL.Add('SELECT ');
               DMEmprestAcoes.qryAux.SQL.Add(QuotedStr(FormatDateTime('dd/mm/yyyy',DMEmprestAcoes.qryBuscaSaldoHistDATAOPERACAO.AsDateTime)) + ' AS DATAEMISSAO,');
               DMEmprestAcoes.qryAux.SQL.Add(QuotedStr(FormatDateTime('dd/mm/yyyy',dDataDia)) + ' AS DATAATUAL,');
               DMEmprestAcoes.qryAux.SQL.Add(QuotedStr('N')                                                                                   + ' AS NATUREZAOPER,');
               fPrincipal := OperComum.DivValorZero((DMEmprestAcoes.qryBuscaSaldoHistVLROPERACAO.AsFloat * DMEmprestAcoes.qryBuscaSaldoHistSLDQTDHISTEMPACOE.AsFloat),
                                                     DMEmprestAcoes.qryBuscaSaldoHistQTDOPERACAOAPLIC.AsFloat);
               DMEmprestAcoes.qryAux.SQL.Add(TrocaVirgulaPonto(FormatFloat('0.##',fPrincipal))      + ' AS VLRPRINCIPAL,');
               //DMEmprestAcoes.qryAux.SQL.Add(TrocaVirgulaPonto(FormatFloat('0.##',DMEmprestAcoes.qryBuscaSaldoHistSLDVLRRESGATE.AsFloat))      + ' AS VLRPRINCIPAL,');
               DMEmprestAcoes.qryAux.SQL.Add(TrocaVirgulaPonto(FormatFloat('0.##',DMEmprestAcoes.qryBuscaSaldoHistTAXAOPERACAO.AsFloat))     + ' AS TAXA,');
               DMEmprestAcoes.qryAux.SQL.Add('1 AS IDPAIS,');
               DMEmprestAcoes.qryAux.SQL.Add('-1 AS IDCIDADES,');
               DMEmprestAcoes.qryAux.SQL.Add('-1 AS CODESTADO');
               DMEmprestAcoes.qryAux.SQL.Add('FROM DUAL');
               DMEmprestAcoes.qryAux.Open;

               Regra.RuleName := IntToStr(pRPI.IDREGRAEMPACOES);
               Regra.QueryIn  := DMEmprestAcoes.qryAux;
               try
                  //Regra.PassoaPasso;
                  Regra.Execute;
               except
                  on E:Exception do
                  begin
                     MsgDlg('Erro ao calcular o Valor de Resgate.'+#13+E.Message,
                           'Mensagem do Sistema', MtError,[MbOk],0);
                     Result := False;
                     Exit;
                  end;
               end;
               fResult  := StrToFloat(TrocaPontoVirgula(Regra.Result));
               fSldHist := DMEmprestAcoes.qryBuscaSaldoHistSLDHISTEMPACOES.AsFloat + fResult;

               // Grava Histórico
               iIdHistEmpAcoes := LeUltRegistro(nil, 'HISTEMPACOES');
               if not EmprestAcoes.GravaHistEmpAcoes(iIdHistEmpAcoes,
                                                     DMEmprestAcoes.qryBuscaSaldoHistIDCUSTODIANTE.AsInteger,
                                                     DMEmprestAcoes.qryBuscaSaldoHistIDINVESTIMENTO.AsInteger,
                                                     -54,
                                                     DMEmprestAcoes.qryBuscaSaldoHistIDOPEREMPACOES.AsInteger,
                                                     DMEmprestAcoes.qryBuscaSaldoHistIDOPEREMPACOESAP.AsInteger,
                                                     dDataProc,
                                                     fResult,
                                                     fSldHist,
                                                     DMEmprestAcoes.qryBuscaSaldoHistQTDHISTEMPACOES.AsFloat,
                                                     DMEmprestAcoes.qryBuscaSaldoHistSLDQTDHISTEMPACOE.AsFloat,
                                                     'N') then
               begin
                  MsgDlg('Erro ao gravar o histórico da atualização.','Mensagem do Sistema', MtError,[MbOk],0);
                  Result := False;
                  Exit;
               end;

               FazQuery(DMEmprestAcoes.QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOOPERACAO=-54');

               // Integra Contabiliza / Financeiro
               sHistorico := DMEmprestAcoes.qryBuscaSaldoHistDESCTIPOOPERACAO.AsString + ' - ' +
                             DMEmprestAcoes.qryBuscaSaldoHistDESCINVESTIMENTO.AsString;

               iPlanilha := -1;
               iDocumento := -1;
               // VOLTAR
//               {
               if not EmprestAcoes.IntegraContabCapCar(iIdHistEmpAcoes,
                                                       DMEmprestAcoes.qryBuscaSaldoHistIDINVESTIMENTO.AsInteger,
                                                       -54,
                                                       pRPI.IDCARTEMPACOES,
                                                       DMEmprestAcoes.qryAux.FieldByName('FLGGERACONTAB').AsInteger,
                                                       DMEmprestAcoes.qryAux.FieldByName('FLGGERACAPCAR').AsInteger,
                                                       DMEmprestAcoes.qryBuscaSaldoHistIDCUSTODIANTE.AsInteger,
                                                       DMEmprestAcoes.qryAux.FieldByName('CODTIPDOC').AsInteger,
                                                       -1,
                                                       DMEmprestAcoes.qryBuscaSaldoHistDESCINVESTIMENTO.AsString,
                                                       sHistorico,
                                                       fResult,
                                                       dDataProc,
                                                       dDataProc,
                                                       iPlanilha,
                                                       iDocumento) then
               begin
                  MsgDlg('Não foi possível integrar o Contábil/Financeiro.','Mensagem do Sistema', MtError,[MbOk],0);
                  Result := False;
                  Exit;
               end;
//               }
               Next;
            end;
         end;
      except
         on E:Exception do
         begin
            Result := False;
            MsgDlg('Não foi possível executar a atualização.' + #13 +
                    E.Message,'Mensagem do Sistema',mtError,[mbOk],0);
         end;
      end;
   end;
   Regra.Free;   
end;

function TFrmFechamentoDiario.ExcluiOperacoesRF: Boolean;
begin
   Result := False;
   OperComum.LimpaParametros(qryExcluiOperacoesRF);
   qryExcluiOperacoesRF.ParamByName('DATAMOVCARTINV').AsString := dteDataInicio.Text;
   qryExcluiOperacoesRF.Open;

   while Not qryExcluiOperacoesRF.Eof Do
   Begin
      // Estorna Operacao
      if not OperComum.EstornaOper('',
                                   qryExcluiOperacoesRFIDTIPOINVEST.AsInteger,
                                   qryExcluiOperacoesRFIDOPERACAOINVEST.AsInteger,
                                   qryExcluiOperacoesRFDATAMOVCARTINV.AsDateTime,
                                   pRPI.VLRCOTAINICART, 'X', True) Then
      begin
         MsgDlg('Não é possível fazer a Exclusão dessa Boleta.' +
                qryExcluiOperacoesRFNUMDOCUMENTO.AsString,
                'Mensagem do Sistema', MtError,[MbOk],0);

         Exit;
      end;
      qryExcluiOperacoesRF.Next;
   end;
   Result := True;
end;

function TFrmFechamentoDiario.ExcluiOperacoesRV(iInv: Integer = 0): Boolean;
var
   sTipoOper, sBoleta : string;
begin
   Result := False;

   OperComum.LimpaParametros(qryExcluiOperacoesRV);
   qryExcluiOperacoesRV.ParamByName('DATAMOVCARTINV').AsString := dteDataInicio.Text;
   // Só para o caso de um único investimento
   if iInv > 0 then
      qryExcluiOperacoesRV.ParamByName('IDINVESTIMENTO').AsInteger := iInv;

   sTipoOper := ''+IntToStr(pRPI.IDTIPOOPERDIRJUR)+','+IntToStr(pRPI.IDTIPOOPERDIRDIV)+'';

//   qryExcluiOperacoesRV.ParamByName('TIPOOPERACAO').AsString := sTipoOper;

   qryExcluiOperacoesRV.Open;

   while Not qryExcluiOperacoesRV.Eof Do
   Begin
      // Estorna Operacao
      if Trim(qryExcluiOperacoesRV.FieldByName('NUMDOCUMENTO').AsString) = '' then
         sBoleta := 'null'
      else
      Begin
         sBoleta := qryExcluiOperacoesRV.FieldByName('NUMDOCUMENTO').AsString;
         ExecutaQuery(QryAux, 'UPDATE ORDMOVINV SET STATMOVINV = NULL WHERE NUMDOCMOVINV = '''+
                               qryExcluiOperacoesRV.FieldByName('NUMDOCUMENTO').AsString+'''');
         QryAux.Close;
      End;

{      If qryExcluiOperacoesRV.FieldByName('IDTIPOINVEST').AsInteger <> 0 Then
         ExecutaQuery(QryAux, 'UPDATE OPERACAODIREITO SET  ' +
                              'PLANO = NULL, PLNCODIGO = NULL, CODDOCUMENTO = NULL  ' +
                              'WHERE (IDOPERACAODIREITO = ''' +
                               qryExcluiOperacoesRV.FieldByName('IDOPERACAODIREITO').AsString+''')');

      QryAux.Close;}

      if not OperComum.EstornaOper(sBoleta,
                                   qryExcluiOperacoesRV.FieldByName('IDTIPOINVEST').AsInteger,
                                   qryExcluiOperacoesRV.FieldByName('IDOPERACAOINVEST').AsInteger,
                                   qryExcluiOperacoesRV.FieldByName('DATAMOVCARTINV').AsDateTime,
                                   pRPI.VLRCOTAINICART, 'X', True) Then
      begin
         MsgDlg('Não é possível fazer a Exclusão das Operações.' +
                qryExcluiOperacoesRV.FieldByName('NUMDOCUMENTO').AsString,
                'Mensagem do Sistema', MtError,[MbOk],0);
         Exit;
      end;

      //  Exclui Transferências
      if (Trim(qryExcluiOperacoesRV.FieldByName('TIPMOVCARTINV').AsString) = 'TRF') then
      begin
         with dtmOperComum.qryAuxiliar do begin
            Close;
            SQL.Clear;
            SQL.Text := 'DELETE FROM HISTCARTINV WHERE IDHISTCARTINV = '+
                         qryExcluiOperacoesRV.FieldByName('IDHISTCARTINV').AsString;
            ExecSQL;
            Close;
         end;
      end;

{      else if (Trim(qryExcluiOperacoesRV.FieldByName('TIPMOVCARTINV').AsString) = 'TRC') then
      begin
         OperComum.LimpaParametros(qryExcluiOperacoesCustodia);
         qryExcluiOperacoesCustodia.ParamByName('DATAMOVCUSTOD').AsString := qryExcluiOperacoesRV.FieldByName('DATAMOVCARTINV').AsString;
         qryExcluiOperacoesCustodia.Open;

         if qryExcluiOperacoesCustodia.RecordCount > 0 then
         begin
            frmAguarde.Pos := 0;
            frmAguarde.Max := qryExcluiOperacoesCustodia.RecordCount;
            frmAguarde.Mostra('Aguarde, Excluindo Operações de Transferência...');
         end;

         while not qryExcluiOperacoesCustodia.Eof do
         begin
            with dtmOperComum.qryAuxiliar do
            begin
               Close;
               SQL.Clear;
               SQL.Text := 'UPDATE OPERCUSTODIA SET IDCUSTODIAORIG = NULL, ' +
                           '                        IDCUSTODIADEST = NULL  ' +
                           'WHERE IDOPERCUSTODIA = '+ qryExcluiOperacoesCustodia.FieldByName('IDOPERCUSTODIA').AsString;
               ExecSQL;
               Close;
               SQL.Clear;
               SQL.Text := 'DELETE FROM OPERCUSTODIA WHERE IDOPERCUSTODIA = '+
                            qryExcluiOperacoesCustodia.FieldByName('IDOPERCUSTODIA').AsString;
               ExecSQL;
               Close;
               SQL.Clear;
               SQL.Text := 'DELETE FROM HISTCUSTODIA WHERE IDOPERCUSTODIA = '+
                            qryExcluiOperacoesCustodia.FieldByName('IDOPERCUSTODIA').AsString;
               ExecSQL;
               Close;
               SQL.Clear;
               SQL.Text := 'DELETE FROM HISTCARTINV WHERE IDHISTCARTINV = '+
                            qryExcluiOperacoesCustodia.FieldByName('IDHISTCARTINVORIG').AsString;
               ExecSQL;
               Close;
               SQL.Clear;
               SQL.Text := 'DELETE FROM HISTCARTINV WHERE IDHISTCARTINV = '+
                            qryExcluiOperacoesCustodia.FieldByName('IDHISTCARTINVDEST').AsString;
               ExecSQL;
               Close;
               SQL.Clear;
            end;
            qryExcluiOperacoesCustodia.Next;
            frmAguarde.Pos := frmAguarde.Pos + 1;
         end;
         if qryExcluiOperacoesCustodia.RecordCount > 0 then
            frmAguarde.Apaga;
         qryExcluiOperacoesCustodia.Close;
      end;
}

{      // Exclui direitos
      If qryExcluiOperacoesRVIDTIPOINVEST.AsInteger <> 0 Then
      begin
         ExecutaQuery(QryAux, 'DELETE BOLETA WHERE (IDBOLETA = '''+TRIM(sBoleta)+''')');

         QryAux.Close;

         ExecutaQuery(QryAux, 'UPDATE OPERACAODIREITO SET STATUS = '' '' WHERE (IDOPERACAODIREITO = '''+
                               qryExcluiOperacoesRV.FieldByName('IDOPERACAODIREITO').AsString+''')');
         QryAux.Close;

         ExecutaQuery(QryAux,
            'DELETE FROM HISTCAIXA WHERE IDOPERACAODIREITO = '''+
             qryExcluiOperacoesRV.FieldByName('IDOPERACAODIREITO').AsString+'''');

         ExecutaQuery(QryAux,
            'DELETE FROM HISTPROVISAO WHERE IDOPERACAODIREITO = '''+
             qryExcluiOperacoesRV.FieldByName('IDOPERACAODIREITO').AsString+'''');
      end;}

      qryExcluiOperacoesRV.Next;
   end;

   Result := True;
end;

function TFrmFechamentoDiario.ExcluiOperacoesCustodia(iInv: Integer = 0): Boolean;
begin
   try
      Result := False;
      OperComum.LimpaParametros(qryExcluiOperacoesCustodia);
//      qryExcluiOperacoesCustodia.ParamByName('DATAMOVCUSTOD').AsString := qryExcluiOperacoesRV.FieldByName('DATAMOVCARTINV').AsString;
      qryExcluiOperacoesCustodia.ParamByName('DATAMOVCUSTOD').AsString := dteDataInicio.Text;
      // Processa um único Investimento
      if iInv > 0 then
         qryExcluiOperacoesCustodia.ParamByName('IDINVESTIMENTO').AsInteger := iInv;
      qryExcluiOperacoesCustodia.Open;

      if qryExcluiOperacoesCustodia.RecordCount > 0 then
      begin
         frmAguarde.Pos := 0;
         frmAguarde.Max := qryExcluiOperacoesCustodia.RecordCount;
         frmAguarde.Mostra('Aguarde, Excluindo Operações de Transferência...');
      end;

      while not qryExcluiOperacoesCustodia.Eof do
      begin
         with dtmOperComum.qryAuxiliar do
         begin
            Close;
            SQL.Clear;
            SQL.Text := 'UPDATE OPERCUSTODIA SET IDCUSTODIAORIG = NULL, ' +
                        '                        IDCUSTODIADEST = NULL  ' +
                        'WHERE IDOPERCUSTODIA = '+ qryExcluiOperacoesCustodia.FieldByName('IDOPERCUSTODIA').AsString;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'UPDATE OPERCUSTODIA SET IDHISTCARTINVORIG = NULL, ' +
                        '                        IDHISTCARTINVDEST = NULL  ' +
                        'WHERE IDOPERCUSTODIA = '+ qryExcluiOperacoesCustodia.FieldByName('IDOPERCUSTODIA').AsString;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'DELETE FROM HISTCUSTODIA WHERE IDOPERCUSTODIA = '+
                         qryExcluiOperacoesCustodia.FieldByName('IDOPERCUSTODIA').AsString;
            ExecSQL;
            Close;
            If Not qryExcluiOperacoesCustodia.FieldByName('IDHISTCARTINVORIG').IsNull then
            begin
               SQL.Clear;
               SQL.Text := 'DELETE FROM HISTCARTINV WHERE IDHISTCARTINV = '+
                         qryExcluiOperacoesCustodia.FieldByName('IDHISTCARTINVORIG').AsString;

               ExecSQL;
            end;
            Close;

            If Not qryExcluiOperacoesCustodia.FieldByName('IDHISTCARTINVDEST').IsNull then
            begin
               SQL.Clear;
               SQL.Text := 'DELETE FROM HISTCARTINV WHERE IDHISTCARTINV = '+
                         qryExcluiOperacoesCustodia.FieldByName('IDHISTCARTINVDEST').AsString;
                ExecSQL;
            end;

            Close;
            SQL.Clear;
            SQL.Text := 'DELETE FROM OPERCUSTODIA WHERE IDOPERCUSTODIA = '+
                         qryExcluiOperacoesCustodia.FieldByName('IDOPERCUSTODIA').AsString;
            ExecSQL;
            Close;
            SQL.Clear;
         end;
         qryExcluiOperacoesCustodia.Next;
         frmAguarde.Pos := frmAguarde.Pos + 1;
      end;
      if qryExcluiOperacoesCustodia.RecordCount > 0 then
         frmAguarde.Apaga;
      qryExcluiOperacoesCustodia.Close;
      Result := True;
   except
      if qryExcluiOperacoesCustodia.RecordCount > 0 then
         frmAguarde.Apaga;
      QryRegAtualizacao.Close;
      Result := False;
   end;
end;

function TFrmFechamentoDiario.VerificaVencEmpAcoes(sDataIni, sDataFim: String): Boolean;
begin
    Result := True;
    // Verifica se existem Operações de Empréstimo vencendo na Data.
    OperComum.LimpaParametros(qryVencEmpAcoes);
    qryVencEmpAcoes.ParamByName('DATAINI').AsString := sDataIni;
    qryVencEmpAcoes.ParamByName('DATAFIM').AsString := sDataFim;
    qryVencEmpAcoes.Open;

    while not qryVencEmpAcoes.Eof do
    begin
       // Procura Reversão da operação Vencendo na data.
       OperComum.LimpaParametros(qryRevEmpAcoes);
       qryRevEmpAcoes.ParamByName('IDINVESTIMENTO').AsInteger   := qryVencEmpAcoes.FieldByName('IDINVESTIMENTO').AsInteger;
       qryRevEmpAcoes.ParamByName('IDOPEREMPACOESAP').AsInteger := qryVencEmpAcoes.FieldByName('IDOPEREMPACOES').AsInteger;
       qryRevEmpAcoes.Open;
       if qryRevEmpAcoes.IsEmpty then
       begin
          // Operação de Empréstimo Vencendo não Revertida
          Result := False;
          Exit;
       end;
       qryVencEmpAcoes.Next;
    end;
end;

end.

