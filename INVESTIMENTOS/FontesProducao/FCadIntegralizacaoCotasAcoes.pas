//******************************************************************************
// Rotina     : 
// SOL        : 99876
// Kintana    : 441255  
// Data       : 28/11/2008  
// Responsável: Ricardo Cristiano
// Descrição  : Implementação para unificar as subscrições quando ocorrer a operação 
//              de transferência entre planos
//******************************************************************************
// Data      : 04/07/2007
// Código    : AL_36
// Pendencia : 25766
// SOL       : 63646
// Motivo    : Acerto na data de parâmetro passado para verificar se há integralização no dia.
//******************************************************************************
// Data      : 09/05/2007
// Código    : AL_35
// Pendencia : 25308
// SOL       : 59872
// Motivo    : Acerto na data de parâmetro passado para verificar se há integralização no dia.
//******************************************************************************
// Data      : 18/04/2007
// Código    : AL_35
// Pendencia : 23857
// SOL       :
// Motivo    : Implementação de ajustes para aceitar "n" subscrições(total), com a mesma
//             data de subscrição.
//******************************************************************************
// Data      : 17/04/2007
// Código    : Al_34
// Pendencia : 25071
// SOL       : 58166
// Motivo    : Implementação de ajuste em consequência da separação da rotina de
//             unificação de aplicações(PesqAplicMesmoDia) da alimentafundo
//******************************************************************************
// Data      : 15/03/2007
// Código    : AL_33
// Pendencia : 24658
// SOL       : 55067
// Motivo    : Implementação do fechto das query(qryCotaIntegrFundo)
//             determinando o dmfundocomum e com a função OperComum.LimpaParametros.
//******************************************************************************
// Data      : 14/03/2007
// Código    : AL_32
// Pendencia : 24658
// SOL       : 55067
// Motivo    : Implementação do filtro por TIPMOVCOTAINTEGR <> 'TRP'
//******************************************************************************
// Data      : 12/03/2007
// Código    : AL_31
// Pendencia : 24658
// SOL       : 55067
// Motivo    : Implementação do filtro por plano no montaselect e na exclusão do
//             registro
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_30
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro
//******************************************************************************
// Data      : 04/01/2006
// Código    : AL_29
// Pendencia : 23857
// Motivo    : Implementação de ajustes para aceitar "n" subscrições(total), com a mesma
//             data de subscrição.
//******************************************************************************
// Data      : 06/09/2006
// Código    : AL_28
// Motivo    : Implementação de ajuste no funcionamento de tela
//******************************************************************************
// Data      : 06/09/2006
// Código    : AL_27
// Motivo    : Implementação da rotina de verificação de Integralização de cotas
//             Futuras
//******************************************************************************
// Data      : 26/07/2006
// Código    : AL_26
// Motivo    : A exclusão dos historicos de fundos foi retirada devido ao
//             reprocessamento do fundo executar a atualização apenas de um fundo.
//             Implementada apenas a exclusão do registro referente ao fundo em questão.
//             Implementação de mensagem para executação de uma exclusão
//******************************************************************************
// Data      : 25/07/2006
// Código    : AL_25
// Motivo    : Ajuste no Form, retirada de processos, implementações, ajustes em mensagens e
//             tratamento de tela
//******************************************************************************
// Data      : 24/07/2006
// Código    : AL_24
// Motivo    : Ajuste na rotina de exclusão, no item historico do fundo
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_23
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 20/03/2006
// Código    : AL_22
// Motivo    : Ajuste no tratamento da data da subscrição na GravaHistCotaIntegraliza.
//******************************************************************************
// Data      : 06/06/2006
// Código    : AL_21
// Motivo    : Ajustes no ordenamento de funcionalidades e tratamento de componentes.
//******************************************************************************
// Data      : 20/03/2006
// Código    : AL_20
// Motivo    : Ajuste no tratamento da data da subscrição na GravaHistCotaIntegraliza.
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_19
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 12/12/2005
// Código   : AL_18
// Motivo   : Implementação do tratamento de saldo sintetico conforme a susbcrição
//******************************************************************************
// Data     : 10/11/2005
// Código   : AL_17
// Motivo   : Implementação da atualização de ganho ou perda conforme a cota cadastrada
//            para o dia da operação
//******************************************************************************
// Data     : 22/08/2005
// Código   : AL_16
// Motivo   : Implementação do tipo de Fundo e alterada a qryInvest
//******************************************************************************
// Data     : 18/08/2005
// Código   : AL_15
// Motivo   : Implementação da Operação e Atualização do Histórico de Cotas a Integralizar
//******************************************************************************
// Data     : 18/08/2005
// Código   : AL_14
// Motivo   : Implementação da exclusão do fluxo de cotas e variações contabeis.
//******************************************************************************
// Data     : 18/08/2005
// Linha(s) : Al_13
// Motivo   : Alteração da QryCotasIntegraliza para buscar da nova tabela de historico.
//            Implementação da QryAux1, dFundoComum e retirada a QryUpdQtdIntegralizar
//******************************************************************************
// Data     : 07/06/2005
// Linha(s) : Al_12
// Motivo   : Alteração no layout das descrições do Titulo, na grid e na data, ref. a subscrição
//******************************************************************************
// Data     : 30/05/2005
// Código   : AL_13
// Descr.   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 07/06/2005
// Linha(s) : Al_12
// Motivo   : Retirada a critica de qtde maior que zero, pois não atualizava
//******************************************************************************
// Data     : 07/06/2005
// Linha(s) : Al_11
// Motivo   : Implementação das query's QryDelHistFundo e QryUpdQtdIntegralizar.
//            E Implementação do tipo dos parametros da qryUpdOperacaoFundo.
//******************************************************************************
// Data     : 07/06/2005
// Linha(s) : Al_10
// Motivo   : Deleção do histórico de fundos
//******************************************************************************
// Data     : 07/06/2005
// Linha(s) : Al_9
// Motivo   : Ajuste na exclusão, desatualizada
//******************************************************************************
// Data     : 07/06/2005
// Linha(s) : Al_8
// Motivo   : Implementação de variveis para guardar o plano, planilha e documento
//******************************************************************************
// Data     : 07/06/2005
// Linha(s) : Al_7
// Motivo   : Implementado a ligação da cota a integralizar
//******************************************************************************
// Data     : 07/06/2005
// Linha(s) : Al_6
// Motivo   : Implementação da FLGCONTAINVEST na rotina de integralização contabil.
//******************************************************************************
// Data     : 07/06/2005
// Linha(s) : Al_5
// Motivo   : Alteração da mensagem de erro para uma similar e possivel tratamento de trasa;áo e tela
//******************************************************************************
// Data     : 07/06/2005
// Linha(s) : Al_4
// Motivo   : Atualização das cotas a integralizar
//******************************************************************************
// Data     : 07/06/2005
// Linha(s) : Al_3
// Motivo   : tratamento do setfocus com teste do canfocus
//******************************************************************************
// Data     : 29/04/2005
// Linha(s) : Al_2
// Motivo   : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
// Data     : 29/11/2004
// Query    : qryUpdOperacaoFundo
// Descrição: Nova query do Form
//            qryUpdOperacaoFundo - Atualiza tabela OPERACAOFUNDO.
//******************************************************************************
// Data     : 06/10/2004
// Linha(s) : Alt_1
// Motivo   : Inclusão do campo DTAINIPROC na qryInvest e na funcao Reprocessamento
//******************************************************************************
//Data	    : 29/06/2004
//Origem    : FUNCEF
//Query     : qryDetalhe
//Motivo(S) : Passado o Active da qry para 'False'
//******************************************************************************

unit FCadIntegralizacaoCotasAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroRMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, uOperacaoInvest, TREdit, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, FTelaAut, uCtrlInvContab;

type

//******************************************************************************
//  TDadosCotas = Record
//                 DataCota : TDate;
//                 VlrCota  : Double;
//               End;
//
//******************************************************************************

  TfrmCadIntegralizacaoCotasAcoes = class(TfrmCadastroRMDetInv)
    qryInvest: TwwQuery;
    qryInvestDESCFUNDOINVEST: TStringField;
    qryInvestIDFUNDOINVEST: TFloatField;
    qryInvestIDGESTORCARTEIRA: TFloatField;
    //Al_16
    qryInvestMOECODIGO: TFloatField;
    qryInvestIDCARTEIRAINVEST: TFloatField;
    qryInvestIDTIPOFUNDOINVEST: TFloatField;
    //Al_16
    qryInvestSTAEXCLUSIVO: TStringField;
    qryInvestPZOCARENCIA: TFloatField;
    qryInvestPZOANIVERSARIO: TFloatField;
    //Al_16
    qryInvestQTDDECQTD: TFloatField;
    qryInvestQTDDECVALOR: TFloatField;
    qryInvestSTAFUNDO: TStringField;
    qryInvestPZOAMORTIZACAO: TFloatField;
    qryInvestPERCTXPERFORM: TFloatField;
    qryInvestPERCTXADM: TFloatField;
    //Al_16
    qryInvestDATAREFERENCIA: TStringField;
    qryInvestIDTIPOINVEST: TFloatField;
    qryAux: TwwQuery;
    QryTipoFundoInvest: TwwQuery;
    dbdDta: TCMDateTimePicker;
    DBEQtdCota: TDBRealEdit;
    DBEVlrCota: TDBRealEdit;
    DBEVlrPago: TDBRealEdit;
    DBEVlrDesconto: TDBRealEdit;
    DBEVlrLiquido: TDBRealEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dblInvest: TwwDBLookupCombo;
    Investimento: TLabel;
    qryDetalheIDOPERACAOFUNDO: TFloatField;
    qryDetalheIDCARTEIRAINVEST: TFloatField;
    qryDetalheIDPEDIDOFUNDO: TFloatField;
    qryDetalheIDTIPOINVEST: TFloatField;
    qryDetalheIDTIPOOPERACAO: TFloatField;
    qryDetalheIDFUNDOINVEST: TFloatField;
    qryDetalheDATAOPERACAO: TDateTimeField;
    qryDetalheDATALIQUIDACAO: TDateTimeField;
    qryDetalheQTDOPERACAO: TFloatField;
    qryDetalheVLROPERACAO: TFloatField;
    qryDetalheVLRCOTA: TFloatField;
    qryDetalheVLRIR: TFloatField;
    qryDetalheVLRIOF: TFloatField;
    qryDetalheVLRRENDIMENTO: TFloatField;
    qryDetalheSTACONFIRMA: TStringField;
    qryDetalheIDOPERACAOORIGEM: TFloatField;
    qryDetalheIDPLANPREVCTBPATR: TFloatField;
    qryDetalheDATACOTIZACAO: TDateTimeField;
    qryDetalheVLRDESCONTO: TFloatField;
    qryDetalheVLRPAGO: TFloatField;
    QryCotasIntegraliza: TwwQuery;
    //Al_13
    dblDataIntegraliza: TwwDBLookupCombo;
    QryVerOperSubDia: TwwQuery;
    qryDetalhePLANO: TFloatField;
    qryDetalhePLNCODIGO: TFloatField;
    qryDetalheCODDOCUMENTO: TFloatField;
    qryInvestDTAINIPROC: TDateTimeField;
    //Al_13
    QryCotasIntegralizaIDTIPOCOTA: TFloatField;
    QryCotasIntegralizaIDFUNDOINVEST: TFloatField;
    QryCotasIntegralizaIDTIPOINVEST: TFloatField;
    //Al_18
    QryCotasIntegralizaIDPLANPREVCTBPATR: TFloatField;
    QryCotasIntegralizaDATAHISTCOTAINTEG: TDateTimeField;
    QryCotasIntegralizaQTDHISTCOTAINTEGR: TFloatField;
    //Al_18
    QryCotasIntegralizaIDOPERACAOFUNDO: TFloatField;
    QryCotasIntegralizaDATAAPLICACAO: TDateTimeField;
    qryAux1: TwwQuery;
    QryTipoFundo: TwwQuery;
    QryTipoFundoIDTIPOFUNDOINVEST: TFloatField;
    QryTipoFundoIDTIPOINVEST: TFloatField;
    QryTipoFundoDESCTIPOFUNDOINV: TStringField;
    QryTipoFundoDATAULTFECH: TDateTimeField;
    dblTipoFundo: TwwDBLookupCombo;
    lbTipoFundo: TLabel;
    //AL_27
    QryVerIntegrCotas: TwwQuery;
    //AL_29
    QryCotasIntegralizaID: TFloatField;
    qryDetalheID: TFloatField;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure DBEQtdCotaExit(Sender: TObject);
    procedure DBEVlrDescontoExit(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblDataIntegralizaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure dblDataIntegralizaExit(Sender: TObject);
    //Al_16
    procedure dblTipoFundoExit(Sender: TObject);
    //Al_18
    procedure dbdDtaExit(Sender: TObject);
    procedure dblInvestExit(Sender: TObject);
    //AL_28
    procedure sbtnConsDetClick(Sender: TObject);
  private
    { Private declarations }
    //AL_29
    bModif : Boolean;

    procedure StatusGeral;
    procedure StatusInclui;
    procedure Decimais;
    procedure PreparaGrid;        

    function  VerificaResgates : boolean;
    //AL_27 
    function  VerIntegralizaCotas : Boolean;    

  public
    { Public declarations }
  end;

var
  frmCadIntegralizacaoCotasAcoes : TfrmCadIntegralizacaoCotasAcoes;
  //Al_25
  iFundoInvest, iIdTipoOperacao, iFlgContaInvest: Integer;
  sDescOperacao                  : String;

implementation

uses UDataBase, UOperComum, UmensErro, UBibliotecaInvest, dBaseDados,
     UFundoComum,
     //Al_13
     dFundoComum,
     //Al_17
     uSistema;

{$R *.DFM}

procedure TfrmCadIntegralizacaoCotasAcoes.sbtnProcurarClick(Sender: TObject);
var x: Integer;
    wDisplay: String;
begin
  inherited;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;

  sbtnInsDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
  dblInvest.Enabled := True;

  if MontaSelect.RetornouValor then
  begin
     //Al_16
     dblTipoFundo.LookupValue := MontaSelect.ValoresChave[2];
     dblTipoFundo.PerformSearch;

     OperComum.LimpaParametros(qryInvest);
     if trim(dblTipoFundo.LookupValue) <> '' then
        qryInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
     qryInvest.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
     qryInvest.Open;
     //Al_16 - Fim
     dblInvest.LookupValue := MontaSelect.ValoresChave[0];
     dblInvest.PerformSearch;

     OperComum.LimpaParametros(qryDetalhe);
     qryDetalhe.ParambyName('IDTIPOINVEST').asInteger       := iTipoInvestUsu;
     qryDetalhe.ParambyName('IDPLANPREVCTBPATR').asInteger  := iPlanPrevCtbPatro;
     qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger      := StrToInt(montaSelect.ValoresChave[0]);
     qryDetalhe.ParambyName('IDTIPOOPERACAO').asInteger     := StrToInt(montaSelect.ValoresChave[1]);

     DBEQtdCota.DecDigits := QryInvest.FieldByName('QTDDECQTD').AsInteger;
     qryDetalheQTDOPERACAO.DisplayFormat := MontaMascaraDecQtd(StrToInt(montaSelect.ValoresChave[0]));

     DBEVlrCota.DecDigits := QryInvest.FieldByName('QTDDECVALOR').AsInteger;
     qryDetalheVLRCOTA.DisplayFormat     := MontaMascaraDecVlr(StrToInt(montaSelect.ValoresChave[0]));

     qryDetalhe.Open;
  end;

// Define o status dos controles do form
  StatusGeral;
end;

procedure TfrmCadIntegralizacaoCotasAcoes.DBEQtdCotaExit(Sender: TObject);
begin
  inherited;
    //Al_13
   If QryCotasIntegraliza.FieldByName('QTDHISTCOTAINTEGR').Asfloat < DBEQtdCota.Value Then
   begin
     ShowMessage('A Quantidade de Cotas é maior que a Quantidade de Cotas a Intgralizar ( '+
                 FloatToStrF(QryCotasIntegraliza.FieldByName('QTDHISTCOTAINTEGR').Asfloat,ffNumber,23,9)+')');
     DBEQtdCota.SetFocus;
     Exit;
   end;
   DBEVlrPago.Value    := DBEQtdCota.Value*DBEVlrCota.Value;
   //Al_25
   DBEVlrLiquido.Value := DBEVlrPago.Value - DBEVlrDesconto.Value;
end;

procedure TfrmCadIntegralizacaoCotasAcoes.DBEVlrDescontoExit(
  Sender: TObject);
begin
  inherited;
   DBEVlrLiquido.Value := DBEVlrPago.Value - DBEVlrDesconto.Value;
end;

procedure TfrmCadIntegralizacaoCotasAcoes.sbtnInsDetClick(Sender: TObject);
begin
  //Al_18
  If trim(dblTipoFundo.text) = '' then
  Begin
     MsgDlg('Informe o Tipo de Fundo para realizar a Operação.','Mensagem do Sistema', mtInformation,[MbOk],0);
     if dblTipoFundo.CanFocus then
        dblTipoFundo.SetFocus;
     Exit;
  End;

  //Al_18
  If trim(dblInvest.text) = '' then
  Begin
     MsgDlg('Informe o Fundo de Investimento para realizar a Operação.','Mensagem do Sistema', mtInformation,[MbOk],0);
     if dblInvest.CanFocus then
        dblInvest.SetFocus;
     Exit;
  End;

  StatusInclui;

  inherited;

  //AL_21

  qryDetalhe.FieldByName('DATAOPERACAO').AsString := qryTipoFundo.FieldByName('DATAULTFECH').AsString;

  if dbdDta.canfocus then
     dbdDta.setfocus;
end;

procedure TfrmCadIntegralizacaoCotasAcoes.sbtnExcluiDetClick(
  Sender: TObject);
var
   wStr     : String;
   wQtdOper : Double;
   wDataOper: TDateTime;
   //Al_18
   //Al_8
   iOperacao, iFundo, iPlanilha, iDocumento, iPlano : Integer;
begin
   // AL_13 - Inicio
   try // Finally
      if (not qryDetalhe.IsEmpty) then
      begin

         If Not VerificaResgates Then
         Begin
            MsgDlg('Já ocorreram Resgates para essa Aplicação, não é possível excluir essa Operação.','Mensagem do Sistema',
                      mtInformation,[MbOk],0);
            Exit;
         End;

         //AL_29

         //AL_19
         if VerEmAbertura(QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
            Exit;

         //AL_23
         if not CtrlInvContab.TestaPeriodo(qryDetalhe.FieldByName('DATAOPERACAO').AsString, iTipoInvestUsu) then
         begin
            MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            Exit;
         end;

         //AL_29

         If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
                   [mbYes, mbNo],0) = mrYes Then
         Begin
           Try
             //Al_18
             //Al_8
             iOperacao := qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger;
             iDocumento:= qryDetalhe.FieldByName('CODDOCUMENTO').AsInteger;
             iPlanilha := qryDetalhe.FieldByName('PLNCODIGO').AsInteger;
             iPlano    := qryDetalhe.FieldByName('PLANO').AsInteger;
             iFundo    := qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger;
             wDataOper := QryDetalhe.FieldByName('DATAOPERACAO').AsDateTime;
             //Al_8 - fim

             // Inicia Transação
             If not dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.StartTransaction;

             //AL_32
             //AL_31
             //Al_18
             //Al_14
             FazQuery(qryAux, 'SELECT PLANO, PLNCODIGO FROM HISTCOTAINTEGRALIZA WHERE '+
                              'DATAHISTCOTAINTEG >= TO_DATE(' + QuotedStr(DateToStr(wDataOper)) + ',' + QuotedStr('dd/mm/yyyy') + ') '+
                              ' AND IDOPERACAOFUNDO    = '+qryDetalheIDOPERACAOORIGEM.AsString+
                              ' AND IDPLANPREVCTBPATR  = '+IntToStr(iPlanPrevCtbPatro)+
                              ' AND TIPMOVCOTAINTEGR   <> ''TRP''');
             //AL_32
             //AL_31
             //Al_26
             //Al_18
             if Not ExecutaQuery(qryAux1, 'UPDATE HISTCOTAINTEGRALIZA SET PLANO = NULL, PLNCODIGO = NULL WHERE '+
                                          'DATAHISTCOTAINTEG >= TO_DATE(' + QuotedStr(DateToStr(wDataOper)) + ',' + QuotedStr('dd/mm/yyyy') + ') '+
                                          ' AND IDOPERACAOFUNDO    = '+qryDetalheIDOPERACAOORIGEM.AsString+
                                          ' AND IDPLANPREVCTBPATR  = '+IntToStr(iPlanPrevCtbPatro)+
                                          ' AND TIPMOVCOTAINTEGR   <> ''TRP''') then
                Raise Exception.Create('Ocorreu um Problema na exclusão da operação.');

             //AL_24
             While Not qryAux.Eof Do
             begin
                If ((qryAux.FieldByName('PLANO').AsInteger > 0) And
                    (qryAux.FieldByName('PLNCODIGO').AsInteger > 0)) Then
                begin
                   If Not ProcExcluiContabil(qryAux.FieldByName('PLANO').AsInteger,
                                             qryAux.FieldByName('PLNCODIGO').AsInteger) Then
                      Raise Exception.Create('Ocorreu um problema na exclusão dos Resgistros de Atualização da Integralização - Contábil.');
                end;
                qryAux.Next;
             end;

             //AL_32
             //Al_26
             //Al_18 
             if Not ExecutaQuery(qryAux, 'DELETE FROM HISTCOTAINTEGRALIZA WHERE '+
                                         'DATAHISTCOTAINTEG >= TO_DATE(' + QuotedStr(DateToStr(wDataOper)) + ',' + QuotedStr('dd/mm/yyyy') + ') '+
                                         ' AND IDOPERACAOFUNDO    = '+qryDetalheIDOPERACAOORIGEM.AsString+
                                         ' AND IDPLANPREVCTBPATR  = '+IntToStr(iPlanPrevCtbPatro)+
                                         ' AND TIPMOVCOTAINTEGR   <> ''TRP''') then
                Raise Exception.Create('Ocorreu um Problema na exclusão da operação.');

             if Not ExecutaQuery(qryAux, 'DELETE FROM HISTFUNDO WHERE '+
                                         'IDTIPOINVEST           = '+IntToStr(iTipoInvestUsu)+' AND '+
                                         'IDPLANPREVCTBPATR      = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                                         'IDFUNDOINVEST          = '+IntToStr(iFundo)+' AND '+
                                         'DATAAPLICACAO          = TO_DATE(' + QuotedStr(DateToStr(wDataOper)) + ',' + QuotedStr('dd/mm/yyyy') + ') AND '+
                                         'DATAMOVFUNDO           = TO_DATE(' + QuotedStr(DateToStr(wDataOper)) + ',' + QuotedStr('dd/mm/yyyy') + ') ') then
                Raise Exception.Create('Ocorreu um Problema na exclusão da operação.');

             // Exclui Dados do Historico
             If Not ProcExcluiFundo(iDocumento, iPlanilha, iPlano, iTipoInvestUsu,
                                    wDataOper, True) Then
                Raise Exception.Create('Ocorreu um Problema na exclusão do Contábil da operação.');

             inherited;

             //Al_26

             // Confirma Transação
             If dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.Commit;

             //Al_13
             AplicaAlteracoes([qryDetalhe]);

             QryTipoFundoInvest.Close;
             QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
             QryTipoFundoInvest.Open;

             //Al_18
             If wDataOper <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
             begin
                If Not Reprocessamento(iTipoInvestUsu,
                                       qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                       qryInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                       iPlanPrevCtbPatro,
                                       wDataOper,
                                       QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                       qryInvest.FieldByName('DTAINIPROC').AsDateTime,
                                       True) Then
                   MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                          'Mensagem do Sistema', MtInformation,[MbOk],0)
                else
                   MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
             end
             else
                MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);

           Except
              On E:Exception Do
              Begin
                 //Al_5
                 MsgDlg('Não foi possível excluir a Integralização:'+#13+
                        E.Message,'Mensagem do Sitema',mtWarning,[mbOk],0);
                 dtmBaseDados.dbBaseDados.Rollback;
                 //Al_25
                 pnlControlesDet.SendToBack;
                 CmeDetalhe.Cancel(Self);
                 AplicaAlteracoes([qryDetalhe]);
              End;
           End;
         end;
      end;
   finally
     //Al_25
     bbtnCancelarDetClick(Sender);
     StatusGeral;
     PreparaGrid;
     QryAux.Close;
     QryAux1.Close;
     QryTipoFundoInvest.Close;
   end;
   // AL_13 - Fim
end;

procedure TfrmCadIntegralizacaoCotasAcoes.bbtnOkDetClick(Sender: TObject);
Var
  //Al_17
  iSegmentacao, iTipoOperacao, iIdForCli, iPlanilha, iDocumento, iPlano : Integer;
  fVlrAtualizado, fVlrCustoAcoes, fVlrVarAcoes : Currency;
  sTipoTitulo, sNatureza : String;
  DadosCota              : TDadosCota;
begin
  fVlrCustoAcoes := 0;
  fVlrVarAcoes   := 0;

  if dbdDta.Text = '' then
  begin
    MsgDlg('O Campo Data da Subscrição deve ser preenchido.','Mensagem do Sistema',
               mtInformation,[MbOk],0);
    //Al_3
    if dbdDta.Canfocus then
       dbdDta.Setfocus;
    Exit;
  end;

  //AL_29
  //AL_19
  if VerEmAbertura(QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     Exit;

  //AL_27
  //AL_23
  if not CtrlInvContab.TestaPeriodo(dbdDta.Text, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbdDta.CanFocus then
        dbdDta.SetFocus;
     //AL_29
     Exit;
  end;

  //AL_29

  if dblDataIntegraliza.Text = '' then
  begin
    MsgDlg('O Campo Data da Integralização deve ser preenchido.','Mensagem do Sistema',
               mtInformation,[MbOk],0);
    //Al_3
    if dblDataIntegraliza.Canfocus then
       dblDataIntegraliza.SetFocus;
    Exit;
  end;

  //AL_29

  //Al_17
  if StrToDate(dbdDta.Text) < StrToDate(dblDataIntegraliza.Text) Then
  begin
    MsgDlg('A Data da Operação não pode ser menor que a Data da Integralização.','Mensagem do Sistema',
           mtInformation,[MbOk],0);
    if dbdDta.Canfocus then
       dbdDta.SetFocus;
    Exit;
  end;

  if DBEQtdCota.Value <= 0 then
  begin
    MsgDlg('O Campo Quantidade de Cotas deve ser maior que zero.','Mensagem do Sistema',
               mtInformation,[MbOk],0);
    //Al_3
    if DBEQtdCota.Canfocus then
       DBEQtdCota.SetFocus;
    Exit;
  end;

  if DBEVlrCota.value <= 0 then
  begin
    MsgDlg('O Campo Valor da Cota Integralizada deve ser maior que zero.','Mensagem do Sistema',
               mtInformation,[MbOk],0);
    //Al_3
    if DBEVlrCota.Canfocus then
       DBEVlrCota.SetFocus;
    Exit;
  end;

  if DBEVlrPago.value <= 0 Then
  begin
    MsgDlg('O Campo Valor Pago deve ser maior que zero.','Mensagem do Sistema',
               mtInformation,[MbOk],0);
    //Al_3
    if DBEVlrPago.Canfocus then
       DBEVlrPago.SetFocus;
    Exit;
  end;

  if DBEVlrLiquido.value <= 0 Then
  begin
    MsgDlg('O Campo Valor Líquido deve ser maior que zero.','Mensagem do Sistema',
               mtInformation,[MbOk],0);
    //Al_3
    if DBEVlrLiquido.Canfocus then
       DBEVlrLiquido.SetFocus;
    Exit;
  end;

  //AL_29
  //AL_27
  //Verifica se já ocorreu integralização de cotas desse fundo para datas futuras
  if not VerIntegralizaCotas then
  begin
     if dblDataIntegraliza.CanFocus then
        dblDataIntegraliza.SetFocus;
     Exit;
  end;  

  OperComum.LimpaParametros(QryVerOperSubDia);
  QryVerOperSubDia.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
  QryVerOperSubDia.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblInvest.LookupValue);
  //AL_35
  //AL_36
  QryVerOperSubDia.ParamByName('DATAOPERACAO').AsString       := dbdDta.Text;
  QryVerOperSubDia.ParamByName('DATACOTIZACAO').AsString      :=
                   QryCotasIntegraliza.FieldByName('DATAAPLICACAO').AsString;
  QryVerOperSubDia.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
  QryVerOperSubDia.ParamByName('IDTIPOOPERACAO').AsInteger    := iIdTipoOperacao;
  //AL_29
  QryVerOperSubDia.ParamByName('IDOPERACAOORIGEM').AsInteger  := QryCotasIntegraliza.FieldByName('ID').AsInteger;
  QryVerOperSubDia.Open;
  If Not QryVerOperSubDia.IsEmpty Then
  begin
     MsgDlg('Já existe operação para essa Data de Susbcrição.','Mensagem do Sistema',
             mtInformation,[MbOk],0);
     QryVerOperSubDia.Close;
     bbtnCancelarDetClick(Sender);
     Exit;
  end;
  QryVerOperSubDia.Close;

  // AL_13 - Inicio
  //AL_27

  try // Finally
     Try  // Except
       //AL_21
       // Inicia Transação
       If not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

       //AL_29
       if dsDet.DataSet.State in [dsInsert] then
             qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger := LeUltRegistro(nil,'OPERACAOFUNDO');

       qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblInvest.LookupValue);
       qryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger    := iIdTipoOperacao;
       qryDetalhe.FieldByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
       //AL_29
       qryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime   := dbdDta.Date;
       qryDetalhe.FieldByName('DATACOTIZACAO').AsDateTime    := QryCotasIntegraliza.FieldByName('DATAAPLICACAO').AsDateTime;
       qryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger  :=
                               qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger;
       qryDetalhe.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
       qryDetalhe.FieldByName('STACONFIRMA').AsString        := 'S';
       //Al_18
       qryDetalhe.FieldByName('IDOPERACAOORIGEM').AsInteger := QryCotasIntegraliza.FieldByName('IDOPERACAOFUNDO').AsInteger;
       //Al_26

       //AL_20
       If Not GravaHistCotaIntegraliza(iTipoInvestUsu,
                                       StrToInt(dblInvest.LookupValue),
                                       -1, -1, -1, -1,
                                       iPlanPrevCtbPatro,
                                       qryDetalhe.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                       dbdDta.Date,
                                       StrToDate(dblDataIntegraliza.Text),
                                       DBEVlrPago.Value,
                                       DBEQtdCota.Value, DBEQtdCota.Value,
                                       DBEVlrCota.Value, 0, 'OPE') then
          Raise Exception.Create('Não foi possível fazer a baixa da Integralização.');

       with DmFundoComum do
       begin
          //AL_33
          OperComum.LimpaParametros(DmFundoComum.qryCotaIntegrFundo);
          qryCotaIntegrFundo.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblInvest.LookupValue);
          qryCotaIntegrFundo.ParamByName('DATACOTA').AsString       := DateToStr(dbdDta.Date);
          qryCotaIntegrFundo.Open;
       end;

       //AL_20
       //Al_18
       If Not GravaHistCotaIntegraliza(iTipoInvestUsu,
                                       StrToInt(dblInvest.LookupValue),
                                       -1, -1, -1, -1,
                                       iPlanPrevCtbPatro,
                                       QryCotasIntegraliza.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                       dbdDta.Date,
                                       StrToDate(dblDataIntegraliza.Text),
                                       OperComum.Round((QryCotasIntegralizaQTDHISTCOTAINTEGR.AsFloat-DBEQtdCota.Value)*
                                                        DmFundoComum.qryCotaIntegrFundo.FieldByName('VLRCOTA').AsFloat,2),
                                       QryCotasIntegralizaQTDHISTCOTAINTEGR.AsFloat-DBEQtdCota.Value,
                                       DBEQtdCota.Value,
                                       DmFundoComum.qryCotaIntegrFundo.FieldByName('VLRCOTA').AsFloat, 0, 'ATU') then
          Raise Exception.Create('Não foi possível atualização da Integralização.');

       //Al_31
       OperComum.LimpaParametros(DmFundoComum.qryCotaIntegrFundo);
       //Al_15 - Fim

       bbtnConfirmar.Enabled := True;

       //Al_34 - Ini
       //Al_17
       //Apuração da atualização de ganho ou perda conforme a cota cadastrada para o dia da operação
       DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                               qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                               qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime);

       DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
       DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;

       fVlrAtualizado     := qryDetalhe.FieldByName('VLROPERACAO').AsFloat;
       fVlrVarAcoes       := 0;
       if DadosCota.VlrCota <> 0 then
       begin
          fVlrAtualizado  := OperComum.Round(qryDetalhe.FieldByName('QTDOPERACAO').AsFloat*DadosCota.VlrCota,2);
          fVlrVarAcoes    := fVlrAtualizado - qryDetalhe.FieldByName('VLROPERACAO').AsFloat;
       end;

       If Not GravaAplicacaoResgate(iTipoInvestUsu,
                                    iIdTipoOperacao,
                                    qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                    qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                    qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                                    qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                                    qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                                    Trim(sDescOperacao)+' / '+qryInvest.FieldbyName('DESCFUNDOINVEST').AsString,
                                    'A', 'OPE',
                                    qryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                                    qryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                                    0, 0, fVlrVarAcoes,
                                    qryDetalhe.FieldByName('QTDOPERACAO').AsFloat,
                                    qryDetalhe.FieldByName('QTDOPERACAO').AsFloat,
                                    fVlrAtualizado,
                                    qryDetalhe.FieldByName('VLRCOTA').AsFloat,
                                    qryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                                    iPlanPrevCtbPatro, -1, 0, 0) Then
          Raise Exception.Create('Não foi possível efetuar Atualização de Variação da Operação.');

       //AL_35
       if not PesqAplicMesmoDia(iTipoInvestUsu,
                                iIdTipoOperacao,
                                qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                qryDetalhe.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                -1, -1,
                                qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                                qryDetalhe.FieldByName('VLRCOTA').AsFloat,
                                'A',
                                Trim(sDescOperacao)+' / '+qryInvest.FieldbyName('DESCFUNDOINVEST').AsString) then
          Raise Exception.Create('Não efetuar a unificação das aplicações na operação de Integralização de Cotas do Fundo : '+#13+
                                 qryInvest.FieldByName('DESCFUNDOINVEST').AsString +#13+
                                 'No dia : '+qryDetalhe.FieldByName('DATAOPERACAO').AsString);
       iPlanilha  := -1;
       iDocumento := -1;
       iPlano     := -1;

       iIdForCli := OperComum.BuscaForCli(iTipoInvestUsu,
                                          qryInvest.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                          iIdTipoOperacao, pRPI.IDTIPOCLIENTEEMI);
       //Al_34
       //Al_2
       If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                       iIdTipoOperacao,
                                       iTipoInvestUsu,
                                       qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                       iIdForCli,
                                       qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                       qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                                       qryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime,
                                       'OPE', 'A',
                                       qryInvest.FieldbyName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                       True,
                                       //Al_34
                                       qryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, iFlgContaInvest) Then
          Raise Exception.Create('Não foi possível efetuar a integralização do Contábil/Financeiro.');

       //Al_34
       if fVlrVarAcoes <> 0 then
       begin
          if fVlrVarAcoes < 0 then
             iTipoOperacao := -13   //Atualização Negativa
          else
             iTipoOperacao := -12;  //Atualização Positiva

          //Al_25
          If (POS('ACO',UpperCase(QryTipoFundo.FieldByName('DESCTIPOFUNDOINV').AsString)) > 0) Or
             (POS('AÇÕ',UpperCase(QryTipoFundo.FieldByName('DESCTIPOFUNDOINV').AsString)) > 0) Then
              sTipoTitulo := 'FRVAR'
          else if Pos('PART',QryTipoFundo.FieldByName('DESCTIPOFUNDOINV').AsString) > 0 then
              sTipoTitulo := 'FRFIP'
          else
              sTipoTitulo := 'FRVAR';

          //Al_34
          iIdForCli := OperComum.BuscaForCli(iTipoInvestUsu,
                                             qryInvest.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                             iTipoOperacao, pRPI.IDTIPOCLIENTEEMI);

         //Renan CGPC28
         iSegmentacao := OperComum.RetornaSegmentacaoFdos(qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                                          qryInvest.FieldByName('IDFUNDOINVEST').AsInteger);

         If Not ContabilizaAtualizacao(iSegmentacao, iTipoOperacao, Sistema.IdEmpresa, Sistema.IdModulo,
                                       iTipoInvestUsu,
                                       qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       iIdForCli,
                                       iPlanoPrevContab,
                                       iPatrocinadora,
                                       ABS(fVlrVarAcoes),
                                       sTipoTitulo,
                                       Trim(sDescOperacao) + ' - '+
                                         Trim(qryInvest.FieldByName('DESCFUNDOINVEST').AsString)+' / '+
                                            sPlanPrevCtbPatro,
                                       qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                                       True, iPlano, iPlanilha, iDocumento) Then
            Raise Exception.Create('Não foi possível efetuar a integralização do Contábil/Financeiro de Variação da Operação.');
       end;
       //Al_17 - Fim
       //Al_34 - Fim

       //Al_26
       //AL_29
       qryDetalhe.FieldByName('PLANO').Clear;
       if iPlano > 0 then
          qryDetalhe.FieldByName('PLANO').AsInteger     := iPlano;

       qryDetalhe.FieldByName('PLNCODIGO').Clear;
       if iPlanilha > 0 then
          qryDetalhe.FieldByName('PLNCODIGO').AsInteger := iPlanilha;

          qryDetalhe.FieldByName('CODDOCUMENTO').Clear;
       if iDocumento > 0 then
          qryDetalhe.FieldByName('CODDOCUMENTO').AsInteger := iDocumento;

       qryDetalhe.Post;
       qryDetalhe.CommitUpdates;

       inherited;

       If dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Commit;

       //Al_25
       AplicaAlteracoes([qryDetalhe]);
       pnlControlesDet.SendToBack;
       CmeDetalhe.Cancel(Self);

       QryTipoFundoInvest.Close;
       QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                          qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
       QryTipoFundoInvest.Open;

       If StrToDate(dbdDta.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
       begin
          //Alt_1
          If Not Reprocessamento(iTipoInvestUsu,
                                 qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                 qryInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                 iPlanPrevCtbPatro,
                                 StrToDate(dbdDta.Text),
                                 QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                 qryInvest.FieldByName('DTAINIPROC').AsDateTime,
                                 True) Then
             MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                    'Mensagem do Sistema', MtInformation,[MbOk],0)
          else
             MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
       end
       else
          MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);

     Except
       On E:Exception Do
       Begin
         //Al_5
         MsgDlg('Não foi possível efetuar a Operação:'+#13+
                E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
         dtmBaseDados.dbBaseDados.Rollback;
         //Al_25
         pnlControlesDet.SendToBack;
         CmeDetalhe.Cancel(Self);
         AplicaAlteracoes([qryDetalhe]);
       End;
     End;
  finally
     bbtnCancelarDetClick(Sender);
     //Al_25
     StatusGeral;
     PreparaGrid;
     QryAux.Close;
     QryAux1.Close;
     QryTipoFundoInvest.Close;
     //AL_33
     OperComum.LimpaParametros(DmFundoComum.qryCotaIntegrFundo);
  end;
  // AL_3 - Fim
end;

procedure TfrmCadIntegralizacaoCotasAcoes.StatusGeral;
begin
   //AL_28
   lbTipoFundo.Enabled  := True;
   dblTipoFundo.Enabled := True;
   Investimento.Enabled := True;
   dblInvest.Enabled    := True;
   dbdDta.Enabled       := True;
   sbtnProcurar.Enabled := True;

   sbtnInserir.Visible  := False;
   sbtnAlterar.Visible  := False;
   sbtnApagar.Visible   := False;

   if ((Trim(dblTipoFundo.Text) = '') Or
       (Trim(dblInvest.Text)    = '')) then
   begin
      sbtnInsDet.Enabled    := False;
      sbtnAltDet.Enabled    := False;
      sbtnExcluiDet.Enabled := False;
   end
   else
   begin
      sbtnInsDet.Enabled    := True;
      if qryDetalhe.IsEmpty then
      begin
         sbtnAltDet.Enabled    := False;
         sbtnExcluiDet.Enabled := False;
         sbtnConsDet.Enabled   := False;         
      end
      else
      begin
         sbtnAltDet.Enabled    := True;
         sbtnExcluiDet.Enabled := True;
         sbtnConsDet.Enabled   := True;
      end;
   end;

   bbtnOkDet.Enabled        := False;
   bbtnCancelarDet.Enabled  := False;
   bbtnVoltarDet.Enabled    := False;
   bbtnConfirmar.Enabled    := False;
   bbtnCancelar.Enabled     := False;
end;

procedure TfrmCadIntegralizacaoCotasAcoes.StatusInclui;
begin
   sbtnProcurar.Enabled    := False;
   // AL_17
   lbTipoFundo.Enabled     := False;
   dblTipoFundo.Enabled    := False;
   Investimento.Enabled    := False;
   dblInvest.Enabled       := False;

   pnlMestre.Enabled       := False;

   sbtnExcluiDet.Enabled   := False;
   //AL_28
   pnlControlesDet.Enabled := True;   

   bbtnOkDet.Visible       := True;
   bbtnCancelarDet.Visible := True;
   bbtnVoltarDet.Visible   := True;   

   bbtnOkDet.Enabled       := True;
   bbtnCancelarDet.Enabled := True;
   bbtnVoltarDet.Enabled   := True;
end;

function  TfrmCadIntegralizacaoCotasAcoes.VerificaResgates : Boolean;
begin
   FazQuery(QryAux,'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE IDOPERACAOORIGEM = '+
                   qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsString);
   If QryAux.Isempty Then
      Result := True
   Else
      Result := False;
   QryAux.Close;
end;

procedure TfrmCadIntegralizacaoCotasAcoes.FormShow(Sender: TObject);
begin
  inherited;

  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;

 //Abre Qry's
  OperComum.LimpaParametros(qryInvest);
  if trim(dblTipoFundo.LookupValue) <> '' then
     qryInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
  qryInvest.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
  qryInvest.Open;

  OperComum.LimpaParametros(qryDetalhe);
  qryDetalhe.Open;
  //Al_16 - Fim
//Mostra a Grid do Detalhe
  dbgrdDet.BringToFront;

// Carrega quantidade de casas decimais
  Decimais;

// Define o status dos controles do form
  StatusGeral;

  //Al_25
  if Not FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE '+
                         '     (IDTIPOINVEST   = '+IntToStr(iTipoInvestUsu)+')'+
                         ' AND (IDTIPOOPERACAO = -105) ') then
     MsgDlg('O tipo de operação Integralização de Cotas(-105), não foi cadastrado! Não será possível efetuar a operação.',
            'Mensagem do Sistema',mtInformation,[MbOk],0);

  //Al_6
  iFlgContaInvest := QryAux.FieldByName('FLGCONTAINVEST').AsInteger;
  iIdTipoOperacao := QryAux.FieldByName('IDTIPOOPERACAO').AsInteger;
  sDescOperacao   := QryAux.FieldByName('DESCTIPOOPERACAO').AsString;

  MontaSelect.Filtro.Add('OPERACAOFUNDO.IDTIPOINVEST   = '+IntToStr(iTipoInvestUsu));
  MontaSelect.Filtro.Add('OPERACAOFUNDO.IDTIPOOPERACAO = '+IntToStr(iIdTipoOperacao));
  //AL_31
  MontaSelect.Filtro.Add('OPERACAOFUNDO.IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro));

  //Al_25
  OperComum.LimpaParametros(QryTipoFundo);
  QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryTipoFundo.Open;
  if QryTipoFundo.RecordCount = 1 then
  begin
     dblTipoFundo.LookupValue := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString;
     dblTipoFundo.PerformSearch;
  end;

  if dblTipoFundo.CanFocus then
     dblTipoFundo.SetFocus;

end;

Procedure TfrmCadIntegralizacaoCotasAcoes.Decimais;
var tmpQry : TQuery;
begin
   tmpQry := TQuery.Create(Self);
   tmpQry.DatabaseName := 'BaseDados';
   tmpQry.sql.Add('SELECT MAX(QTDDECQTD) AS DECIMAIS FROM FUNDOINVEST');
   tmpQry.Open;

   if tmpQry.RecordCount > 0 then
      DBEQtdCOTA.DecDigits := tmpQry.FieldByName('DECIMAIS').AsInteger
   else
      DBEQtdCOTA.DecDigits := 0;

   tmpQry.Free;
end;

procedure TfrmCadIntegralizacaoCotasAcoes.dblInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   //AL_28
   //Al_25
   if modified then
   begin
      iFundoInvest := -1;    
      if trim(dblInvest.Text) <> '' then
         iFundoInvest := StrToInt(dblInvest.LookupValue);
      if ((trim(dblTipoFundo.Text) <> '') and (trim(dblInvest.Text) <> '')) then
         PreparaGrid;
   end
   else
     StatusGeral;

   if dbgrdDet.CanFocus Then
      dbgrdDet.SetFocus;
end;

procedure TfrmCadIntegralizacaoCotasAcoes.dblInvestExit(Sender: TObject);
begin
  inherited;
   //AL_28
   if ((trim(dblTipoFundo.Text) <> '') and (trim(dblInvest.Text) <> '')) then
   begin
      if iFundoInvest <> StrToInt(dblInvest.LookupValue) then
         PreparaGrid;
   end;      
end;

procedure TfrmCadIntegralizacaoCotasAcoes.dblDataIntegralizaCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
//AL_29
var DadosCota : TDadosCota;
begin
  inherited;
   //Al_13
   //AL_17
   //AL_29
   bModif := modified;
   if ((modified) and (Trim(dblDataIntegraliza.Text) <> '')) then
   begin
      DBEQtdCota.Value := QryCotasIntegraliza.FieldByName('QTDHISTCOTAINTEGR').AsFloat;
      If ((dbdDta.Text <> '') And (QryDetalhe.State = dsInsert)) Then
      begin
         //Busca dados da Cota
         DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                                 StrToInt(dblInvest.LookupValue),
                                                 StrToDate(dbdDta.Text));

         DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
         DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;
         DBEVlrCota.Value   := DadosCota.VlrCota;

         DBEVlrPago.Value   := DBEQtdCota.Value*DBEVlrCota.Value;
         DBEVlrLiquido.Value:= DBEVlrPago.Value - DBEVlrDesconto.Value;         

         QryAux.Close;
      end;
   end;
end;

procedure TfrmCadIntegralizacaoCotasAcoes.bbtnCancelarDetClick(
  Sender: TObject);
begin

  inherited;

  If dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.Rollback;

   pnlMestre.Enabled       := True;

   sbtnProcurar.Enabled    := True;

   //AL_28
   pgctrlDetalhe.Enabled   := True;

   sbtnConsDet.Down        := False;   

   StatusGeral;

end;

procedure TfrmCadIntegralizacaoCotasAcoes.dblDataIntegralizaExit(
  Sender: TObject);
//AL_29
var DadosCota : TDadosCota;
begin
   inherited;
   //AL_29
   if ((Not bModif) and (Trim(dblDataIntegraliza.Text) <> '')) then
   begin
      //Al_13                                                                                 
      //AL_17
      DBEQtdCota.Value := QryCotasIntegraliza.FieldByName('QTDHISTCOTAINTEGR').AsFloat;

      If ((dbdDta.Text <> '') And (QryDetalhe.State = dsInsert)) Then
      begin
         //Busca dados da Cota
         DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                                 StrToInt(dblInvest.LookupValue),
                                                 StrToDate(dbdDta.Text));

         DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
         DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;
         DBEVlrCota.Value   := DadosCota.VlrCota;

         DBEVlrPago.Value   := DBEQtdCota.Value*DBEVlrCota.Value;
         DBEVlrLiquido.Value:= DBEVlrPago.Value - DBEVlrDesconto.Value;         

         QryAux.Close;
      end;
   end;
   
   bModif := False;

end;
//Al_16
procedure TfrmCadIntegralizacaoCotasAcoes.dblTipoFundoExit(
  Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(qryInvest);
   if trim(dblTipoFundo.LookupValue) <> '' then
      qryInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
   qryInvest.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
   qryInvest.Open;
end;
//Al_16 - Fim

//Al_18
procedure TfrmCadIntegralizacaoCotasAcoes.dbdDtaExit(Sender: TObject);
begin
  //Al_18
  If trim(dblInvest.text) = '' then
  Begin
     MsgDlg('Informe o Fundo de Investimento para realizar a Operação.','Mensagem do Sistema', mtInformation,[MbOk],0);
     bbtnCancelarDetClick(Sender);     
     if dblInvest.CanFocus then
        dblInvest.SetFocus;
     Exit;
  End;

  inherited;

  //AL_28
  OperComum.LimpaParametros(QryCotasIntegraliza);
  QryCotasIntegraliza.ParamByName('IDFUNDOINVEST').AsInteger       := StrToInt(dblInvest.LookupValue);
  QryCotasIntegraliza.ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanPrevCtbPatro;
  QryCotasIntegraliza.ParamByName('IDTIPOINVEST').AsInteger        := iTipoInvestUsu;
  QryCotasIntegraliza.ParamByName('DATAHISTCOTAINTEG').AsString    := dbdDta.Text;
  QryCotasIntegraliza.Open;

  If QryCotasIntegraliza.IsEmpty Then
  Begin
     MsgDlg('Não há Quantidade de Cotas a Integralizar para esse Fundo de Investimento.','Mensagem do Sistema',
            mtInformation,[MbOk],0);
     //AL_21
     bbtnCancelarDetClick(Sender);
     Exit;
  End;

  //AL_29
  if QryCotasIntegraliza.RecordCount = 1 Then
     dblDataIntegraliza.LookupValue := QryCotasIntegraliza.fieldByname('IDOPERACAOFUNDO').AsString;

  if dblDataIntegraliza.CanFocus then
     dblDataIntegraliza.SetFocus;     

end;

procedure TfrmCadIntegralizacaoCotasAcoes.PreparaGrid;
begin
   inherited;
   OperComum.LimpaParametros(qryDetalhe);
   if ((dblTipoFundo.lookupvalue <> '') And (dblInvest.lookupvalue <> '')) then
   begin
      qryDetalhe.ParambyName('IDTIPOINVEST').asInteger      := iTipoInvestUsu;
      qryDetalhe.ParambyName('IDPLANPREVCTBPATR').asInteger := iPlanPrevCtbPatro;
      qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger  := StrToInt(dblInvest.LookupValue);
      qryDetalhe.ParambyName('IDTIPOOPERACAO').asInteger := iIdTipoOperacao;
      qryDetalhe.Open;

      //AL_21

      // Altera Formato do Valor da Cota
      DBEQtdCota.DecDigits   := QryInvest.FieldByName('QTDDECQTD').AsInteger;
      qryDetalheQTDOPERACAO.DisplayFormat :=
                         MontaMascaraDecQtd(StrToInt(dblInvest.LookupValue));
      DBEVlrCota.DecDigits   := QryInvest.FieldByName('QTDDECVALOR').AsInteger;
      qryDetalheVLRCOTA.DisplayFormat :=
                         MontaMascaraDecVlr(StrToInt(dblInvest.LookupValue));
   end
   else
      qryDetalhe.Open;

   // Define o status dos controles do form
   StatusGeral;
end;

//AL_27
function TfrmCadIntegralizacaoCotasAcoes.VerIntegralizaCotas : Boolean;
begin
   OperComum.LimpaParametros(QryVerIntegrCotas);
   QryVerIntegrCotas.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblInvest.LookupValue);
   QryVerIntegrCotas.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QryVerIntegrCotas.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   QryVerIntegrCotas.ParamByName('DATAHISTCOTAINTEG').AsString  := dbdDta.Text;
   //AL_35
   QryVerIntegrCotas.ParamByName('IDOPERACAOFUNDO').AsInteger   := StrToInt(dblDataIntegraliza.LookupValue);
   QryVerIntegrCotas.Open;

   Result := True;

   if not QryVerIntegrCotas.IsEmpty then
   begin
      if QryVerIntegrCotas.FieldByName('QTDHISTCOTAINTEGR').AsFloat = 0 then
      begin
         MsgDlg('A subscrição do dia  "'+dblDataIntegraliza.Text+'" já sofreu Integralização de Cotas Total. '#13+
                'Verificar lançamentos Futuros.','Mensagem do Sistema', mtInformation,[MbOk],0);
         Result := False;
      end;
   end;

   OperComum.LimpaParametros(QryVerIntegrCotas);
end;

//AL_28
procedure TfrmCadIntegralizacaoCotasAcoes.sbtnConsDetClick(
  Sender: TObject);
begin
   OperComum.LimpaParametros(QryCotasIntegraliza);
   QryCotasIntegraliza.ParamByName('IDFUNDOINVEST').AsInteger       := StrToInt(dblInvest.LookupValue);
   QryCotasIntegraliza.ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanPrevCtbPatro;
   QryCotasIntegraliza.ParamByName('IDTIPOINVEST').AsInteger        := iTipoInvestUsu;
   QryCotasIntegraliza.ParamByName('DATAHISTCOTAINTEG').AsString    := dbdDta.Text;
   QryCotasIntegraliza.Open;

  inherited;
   bbtnVoltarDet.Enabled   := True;
   sbtnConsDet.Enabled     := False;
   sbtnInsDet.Enabled      := False;
   sbtnExcluiDet.Enabled   := False;
   lbTipoFundo.Enabled     := False;
   dblTipoFundo.Enabled    := False;
   dblInvest.Enabled       := False;
   Investimento.Enabled    := False;
   pnlControlesDet.Enabled := False;
   pgctrlDetalhe.Enabled   := False;
end;

end.
