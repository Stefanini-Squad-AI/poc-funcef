//******************************************************************************
// Rotina     : MONTASELECT
// SOL        : 169792
// Kintana    : 1507622
// Data       : 02/12/2011
// Responsável: Ricardo Cristiano
// Descrição  : Adicionar o número da boleta na resultado da pesquisa para
//              exlusao no "montaselect".
//******************************************************************************
// Data      : 21/09/2007
// Código    : AL_19
// Pendencia : 26357
// SOL       : 69119
// Desc      : Ajuste para: Empréstimo de Ações (Segragação Plano / Patro)
//******************************************************************************
// Data      : 20/04/2007
// Código    : AL_18
// Pendencia : 24388
// SOL       : 53035
// Desc      : Tratamento para verificar se está marcado para Reprocessamento
//******************************************************************************
// Data      : 18/10/2006
// Código    : AL_17
// Pendencia : 23564
// Desc      : Ajuste de Segregação e da TRC CC e CCI
//******************************************************************************
// Data      : 03/10/2006
// Código    : AL_16
// Desc      : Segregação de Planos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_15
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_14
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_13
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_12
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//******************************************************************************
// Data     : 07/03/2006
// Código   : AL_11
// Motivo   : Ajuste para fazer a última transferencia da carteira (Saldo final 0)
//               ocorria erro "div by zero", além de outros ajustes para a tela
//               não ficar inoperável depois do erro.
//******************************************************************************
// Data     : 16/02/2006
// Código   : AL_10
// Motivo   : Ajustes para o novo reprocessamento linear por data
//            Ajuste na mascara dos saldos CC e CCI (DFM)
//            Implementação de bloqueio de fechamento
//******************************************************************************
// Data     : 03/02/2006
// Código   : AL_9
// Motivo   : Ajuste na chamada da MarcaInvRV, uma chamada para cada carteira
//               (Por causa da Exclusão)
//******************************************************************************
// Data     : 13/01/2006
// Código   : AL_8
// Motivo   : Acerto na passagem do parâmentro de TipoConta para 0 qdo = '' ao
//            invés de -1
//******************************************************************************
// Data     : 12/12/2005
// Código   : AL_7
// Motivo   : Nâo deve voltar a data do Parâmetro
//*****************************************************************************
//Data	    : 28/10/2005
//Código    : Al_6
//Motivo(S) : Ajuste para Mostrar saldos CC e CCI
//*****************************************************************************
//Data	    : 31/08/2005
//Código    : Al_5
//Motivo(S) : Implementação da Propriedade DataRef para data de referencia
//*****************************************************************************
//Data	    : 29/06/2005
//Código    : Al_4
//Motivo(S) : Implementação da verificação de transação
//*****************************************************************************
//Data	    : 29/06/2005
//Código    : Al_3
//Motivo(S) : Implementação do Exception e ajuste da mensagem.
//*****************************************************************************
//Data	    : 20/06/2005
//Código    : Al_2
//Motivo(S) : Implementação do tipo de conta, para quantidade nova ou antiga.
//*****************************************************************************
//Data	    : 24/05/2005
//Código    : Al_1
//Motivo(S) : Implementação do teste de período contabil em 3 camadas
//********************************************************************************************************
// Data     : 13/04/2004
// Origem   : Refer
// Função   : QryCustodia
// Linha(s) :
// Motivo   : Acerto no tipo de Parâmetro IDLOTE que estava ftInteger ao invés de ftString
//********************************************************************************************************

unit FCadTransfCarteira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, wwdblook, Db, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, TREdit,
  DBGrids, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, uCMMath,
  CmEventosCadastro, ImgList, Menus, uCtrlInvContab, uCtrlRendaVariavel, uCtrlPadroes,
  faMensagem;

type
  TfrmCadTransfCarteira = class(TfrmCadastroCS)
    QryCarteira: TwwQuery;
    QryCarteiraDESCCARTINVEST: TStringField;
    QryCarteiraIDCARTEIRAINVEST: TFloatField;
    QryInvestimento: TwwQuery;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    pnlGrid: TPanel;
    dsCustodia: TwwDataSource;
    updCustodia: TUpdateSQL;
    QryInsHistCustodia: TwwQuery;
    QryAltCustodia: TwwQuery;
    qryIDCUSTODIA: TFloatField;
    qryIDOPERACAOINVEST: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDCUSTODIANTE: TFloatField;
    qryDATAMOVCUSTOD: TDateTimeField;
    qryQTDEMOVCUSTOD: TFloatField;
    qrySALDOLIBERADO: TFloatField;
    qrySALDOBLOQUEADO: TFloatField;
    qryFLGCALCSALDO: TStringField;
    qryIDLOTE: TStringField;
    qryTIPOCUSTODIA: TStringField;
    qryIDMOTIVOBLOQUEIO: TFloatField;
    QryCarteiraTransf: TwwQuery;
    Panel3: TPanel;
    edData: TCMDateTimePicker;
    Label6: TLabel;
    dblCarteira: TwwDBLookupCombo;
    Label2: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    Label1: TLabel;
    Panel4: TPanel;
    pnlSeta: TPanel;
    BtnRemover: TSpeedButton;
    pnlTransferir: TPanel;
    Label7: TLabel;
    Label4: TLabel;
    pnlTransfDest: TPanel;
    EdQuantidade: TRealEdit;
    dblCarteiraTransf: TwwDBLookupCombo;
    qryDelHistCustodia: TwwQuery;
    qryDelOperCustodia: TwwQuery;
    qryDelHistCartInv: TwwQuery;
    QryMotBlq: TwwQuery;
    QryMotBlqDESCMOTBLOQ: TStringField;
    QryMotBlqSIGLAMOTBLOQ: TStringField;
    QryMotBlqIDMOTIVOBLOQUEIO: TFloatField;
    dblMotBlq: TwwDBLookupCombo;
    lblMotBloq: TLabel;
    qryUpdOperCustodia: TwwQuery;
    QryAux: TwwQuery;
    QryInvestimentoIDEMISSOR: TFloatField;
    qryBuscaPlnCodigo: TwwQuery;
    qryBuscaPlnCodigoPLNCODIGO: TFloatField;
    QryCustodia: TwwQuery;
    QryCustodiaSGLCUSTODIANTE: TStringField;
    QryCustodiaSIGLAMOTBLOQ: TStringField;
    QryCustodiaDESCMOTBLOQ: TStringField;
    QryCustodiaSALDO: TFloatField;
    QryCustodiaIDCARTEIRAINVEST: TFloatField;
    QryCustodiaIDINVESTIMENTO: TFloatField;
    QryCustodiaIDCUSTODIANTE: TFloatField;
    QryCustodiaIDLOTE: TStringField;
    QryCustodiaIDMOTIVOBLOQUEIO: TFloatField;
    QryCarteiraIDMERCADO: TFloatField;
    QryCarteiraTransfIDCARTEIRAINVEST: TFloatField;
    QryCarteiraTransfDESCCARTINVEST: TStringField;
    QryCarteiraTransfIDMERCADO: TFloatField;
    qryTipoOperacao: TwwQuery;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    //Al_2
    qryTipoConta: TwwQuery;
    qryTipoContaDESCRICAO: TStringField;
    qryTipoContaIDTIPOCONTA: TFloatField;
    LblTipoConta: TLabel;    
    dblTipoConta: TwwDBLookupCombo;
    QryCustodiaSALDOCC: TFloatField;
    QryCustodiaSALDOCCI: TFloatField;
    Panel5: TPanel;
    GrdCustodia: TDBGrid;
    Panel1: TPanel;
    QryCustodiaIDPLANPREVCTBPATR: TFloatField;
    QryCustodiaPLANPRVCONTABPATRO: TStringField;
    fraProg: TfraMensagem;
    //Al_2 - Fim
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure BtnRemoverClick(Sender: TObject);
    procedure MontaQrySaldoCustodia;
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure AlimentaQryConsulta;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dblCarteiraTransfExit(Sender: TObject);
    procedure dblCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    Function ExisteFormulario : Boolean;
    procedure edDataEnter(Sender: TObject);
    procedure dblCarteiraEnter(Sender: TObject);
    procedure dblCarteiraExit(Sender: TObject);
    procedure dblInvestimentoEnter(Sender: TObject);
    procedure dblInvestimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblInvestimentoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    { Private declarations }
    //AL_16
    CtrlRV: TCtrlRendaVariavel;
    wCartAnt, wInvAnt: Integer;
    wDataAnt: TDateTime;
    // AL_5
    FdData: TDateTime;
    procedure Setdata(dData: TDateTime);
    procedure CloseUpGeral(Combo: TObject; QueryLookUp, Query: TDataSet; Alterado: Boolean;
                           Campo: String; iValorAnt: Integer);
    procedure AbreQry;

  // AL_5
  published
    Property DataRef : TDateTime read FdData write SetData;

  public
    { Public declarations }
  end;

  //AL_16 - Rotina para atualização do Frame de Progresso
  procedure AtualizaProg(sMsg: String = ''; iMax: Integer = -1);

var
  frmCadTransfCarteira: TfrmCadTransfCarteira;
  iIdHistCartInv : integer;
  iIdHistCustodia,iIdHistCustodiaOrig,iIdHistCustodiaDest,idOperCustodia : Integer;
  iIdHistCartInvOrig,iIdHistCartInvDest,iIdCarteiraOrig,iIdCarteiraDest : Integer;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, DBaseDados, uDataBase, UBibliotecaInvest, UOperacaoInvest,
     UOperComum, dOperComum, dAGE,UDiasUteisInv,UEmprestAcoes, URendaVariavel;

procedure TfrmCadTransfCarteira.FormShow(Sender: TObject);
begin
   inherited;
   //AL_16
   fraProg.Apaga;

   Qry.Open;
   QryMotBlq.Open;
   QryCarteira.Open;
   QryInvestimento.Open;
   QryCarteiraTransf.Open;

   sbtnApagar.Enabled := True;
   // AL_5
   if DataRef > 0 then
      edData.Text := DateToStr(DataRef)
   else
      edData.Text := DateToStr(pRPI.DATAULTFECH);

   //AL_19 - Fim
   pnlFundo.Enabled := True;
   if edData.CanFocus then
      edData.SetFocus;
end;

procedure TfrmCadTransfCarteira.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
   Qry.Close;
   QryCarteira.Close;
   QryInvestimento.Close;
   QryCarteiraTransf.Close;
   QryMotBlq.Close;
   inherited;
end;

procedure TfrmCadTransfCarteira.bbtnConfirmarClick(Sender: TObject);
Var
  //Al_2
  iIdHistCartInvDest,iIdMotBloqDest, iTipoConta :Integer;
begin
   If Trim(dblMotBlq.Text) = '' Then
      iIdMotBloqDest := -1
   Else
      iIdMotBloqDest := QryMotBlq.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;

   //Al_2
   If Trim(dblTipoConta.Text) = '' Then
      //AL_8
      iTipoConta := 0
   Else
      iTipoConta := qryTipoConta.FieldByName('IDTIPOCONTA').AsInteger;
   //Al_2 - Fim
   try // Finally
      Try //Except
         if not dtmBaseDados.dbBaseDados.InTransaction then
             dtmBaseDados.dbBaseDados.StartTransaction;

         // AL_1
         //AL_15
         if not CtrlInvContab.TestaPeriodo(edData.Text, 2) then
            Raise Exception.Create(CtrlInvContab.MessageInfo);

         //AL_18
         if RendaVariavel.VerificaMarcado(QryCustodia.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                          QryCustodia.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          QryCustodia.FieldByName('IDINVESTIMENTO').AsInteger) then
            Raise Exception.Create('O Investimento ' + QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString + ' está marcado para reprocessamwnto.'+ #13 +
                                   'Efetue primeiramente o Reprocessamento.');

         //Al_2
         //AL_16 - Assinala a rotina AtualizaProg ao evento AtualizaProcesso da unit OperComum
         uOperComum.AtualizaProcesso := AtualizaProg;
         fraProg.Mostra;
         fraProg.Max := 8;

         if OperComum.TransfEntreCarteiras(QryInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                           QryCustodia.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           QryCarteiraTransf.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           QryCustodia.FieldByName('IDINVESTIMENTO').AsInteger,
                                           QryCustodia.FieldByName('IDCUSTODIANTE').AsInteger,
                                           QryCustodia.FieldByName('IDCUSTODIANTE').AsInteger,
                                           QryCustodia.FieldByName('IDMOTIVOBLOQUEIO').AsInteger,
                                           iIdMotBloqDest,
                                           QryCarteira.FieldByName('IDMERCADO').AsInteger,
                                           QryCarteiraTransf.FieldByName('IDMERCADO').AsInteger,
                                           QryInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                           QryCustodia.FieldByName('SALDO').AsFloat,
                                           EdQuantidade.Value,
                                           edData.Date,
                                           False,
                                           QryCustodia.FieldByName('IDLOTE').AsString,
                                           '',
                                           iIdHistCartInvDest,
                                           QryCustodia.FieldByName('IDPLANPREVCTBPATR').AsInteger, -1,
                                           iTipoConta) then
         begin
            //AL_16 - Desassinala a rotina AtualizaProg ao evento AtualizaProcesso da unit uOperComum
            uOperComum.AtualizaProcesso := Nil;
            fraProg.Mes := 'Atualizando os Saldos Origem';
            fraProg.Incrementa;

            //AL_11
            QryCustodia.DisableControls;
            dblCarteiraTransf.Clear;
            HabilitaCampos;
            AbreQry;
            AlimentaQryConsulta;
            QryCustodia.EnableControls;
            sbtnApagar.Enabled := True;
            sbtnApagar.Down    := False;
            iIdHistCartInvTRC  := -1;
            pnlFundo.Enabled   := True;

            if DtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Commit;

            if not ExisteFormulario then
               MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema',mtInformation,[mbOK],0);

         end;

      Except
         //AL_15
         on E:Exception do
         begin
            if DtmBaseDados.dbBaseDados.InTransaction then
               DtmBaseDados.dbBaseDados.Rollback;
            if not ExisteFormulario then
               MsgDlg('Não foi possível efetuar esta operação.' + #13 +
                       E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
         end;
      end;
   finally
      //AL_16
      fraProg.Apaga;
   end;
end;

procedure TfrmCadTransfCarteira.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadTransfCarteira.AbreQry;
begin
   //AL_16 - Ini
   if (Trim(edData.Text) <> '') and (Trim(dblCarteira.Text) <> '') and (Trim(dblInvestimento.Text) <> '') Then
   Begin
      OperComum.LimpaParametros(QryCustodia);
      QryCustodia.ParamByName('IDCARTEIRAINVEST').AsInteger  := QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
      QryCustodia.ParamByName('IDINVESTIMENTO').AsInteger    := QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
      QryCustodia.Open;

      AlimentaQryConsulta;

      If Not QryCustodia.EOF Then
      Begin
         BtnRemover.Enabled := True;
         if GrdCustodia.CanFocus then
            GrdCustodia.SetFocus;
         GrdCustodia.SelectedIndex := 0;
      End
      Else
         BtnRemover.Enabled := False;
   End
   Else
   Begin
      QryCustodia.Close;
      BtnRemover.Enabled := False;
   End;
   //AL_16 - Fim
end;

procedure TfrmCadTransfCarteira.BtnRemoverClick(Sender: TObject);
begin
   // AL_10
   if RendaVariavel.VerEmAbertura then
      Exit;
   inherited;
   CmeCadastro.Insert(Self);
   DesabilitaCampos;

   if dblCarteiraTransf.CanFocus then
      dblCarteiraTransf.SetFocus;

   If EdQuantidade.Value <> 0 Then
   begin
      if EdQuantidade.CanFocus then
         EdQuantidade.SetFocus;
   end;
end;

procedure TfrmCadTransfCarteira.MontaQrySaldoCustodia;
begin
   dtmAGE.qrySaldoCustodia.ParamByName('IdCarteira').AsInteger :=
                    QryCustodia.FieldByName('IdCarteiraInvest').AsInteger;
   dtmAGE.qrySaldoCustodia.ParamByName('IdInvestimento').AsInteger :=
                    QryCustodia.FieldByName('IdInvestimento').AsInteger;
   dtmAGE.qrySaldoCustodia.ParamByName('IdLote').AsString :=
                    QryCustodia.FieldByName('IdLote').AsString;
   dtmAGE.qrySaldoCustodia.ParamByName('DataMov').AsDateTime :=
                    StrToDate(edData.Text);
   dtmAGE.qrySaldoCustodia.ParamByName('IDCUSTODIANTE').AsInteger :=
                    QryCustodia.FieldByName('IDCUSTODIANTE').AsInteger;
   dtmAGE.qrySaldoCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger :=
                    QryCustodia.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;
   dtmAGE.qrySaldoCustodia.ParamByName('IdCustodia').AsInteger := 9999999;
end;

procedure TfrmCadTransfCarteira.AlimentaQryConsulta;
var fNulo, fSldQtd, fSldQtdCC, fSldQtdCCI: Double;
begin
   //AL_17
   if (QryCustodia.Active) and (QryCustodia.RecordCount > 0) then
   begin
      // AL_11 - Ini
      try  // Finally
         QryCustodia.DisableControls;
         QryCustodia.Filtered := False;
         QryCustodia.Filter   := '';
         QryCustodia.First;
         While Not QryCustodia.Eof Do
         Begin
            //AL_16 - Ini - A BuscaSaldosRV traz os saldos de custódia, Liberado e Bloqueado
            CtrlRV.BuscaSaldoRV.Executa(edData.DateTime,
                                        QryCustodia.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                        QryCustodia.FieldByName('IDINVESTIMENTO').AsInteger,
                                        QryCustodia.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        -1, High(Integer),
                                        QryCustodia.FieldByName('IDCUSTODIANTE').AsInteger,
                                        QryCustodia.FieldByName('IDLOTE').AsString,
                                        QryCustodia.FieldByName('IDMOTIVOBLOQUEIO').AsInteger);

            QryCustodia.Edit;
            if QryCustodia.FieldByName('IDMOTIVOBLOQUEIO').AsInteger = -1 then
            begin
               fSldQtdCC := (OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoQtdCC, CtrlRV.BuscaSaldoRV.SaldoQtdTotal) * CtrlRV.BuscaSaldoRV.SldQtdLibCustodia);
               fSldQtdCCI := (OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoQtdCCI, CtrlRV.BuscaSaldoRV.SaldoQtdTotal) * CtrlRV.BuscaSaldoRV.SldQtdLibCustodia);

               QryCustodia.FieldByName('SALDO').AsFloat  := CtrlRV.BuscaSaldoRV.SldQtdLibCustodia;
               QryCustodia.FieldByName('SALDOCC').AsFloat  := RoundCM(fSldQtdCC, 0);
               QryCustodia.FieldByName('SALDOCCI').AsFloat  := RoundCM(fSldQtdCCI, 0);
            end
            else
            begin
               fSldQtdCC := (OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoQtdCC, CtrlRV.BuscaSaldoRV.SaldoQtdTotal) * CtrlRV.BuscaSaldoRV.SldQtdBloqCustodia);
               fSldQtdCCI := (OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoQtdCCI, CtrlRV.BuscaSaldoRV.SaldoQtdTotal) * CtrlRV.BuscaSaldoRV.SldQtdBloqCustodia);

               QryCustodia.FieldByName('SALDO').AsFloat  := CtrlRV.BuscaSaldoRV.SldQtdBloqCustodia;
               QryCustodia.FieldByName('SALDOCC').AsFloat  := RoundCM(fSldQtdCC, 0);
               QryCustodia.FieldByName('SALDOCCI').AsFloat  := RoundCM(fSldQtdCCI, 0);
            end;
            // AL_6 - Fim
            QryCustodia.Post;
            QryCustodia.Next;
            //AL_16 - Fim
         end;
      finally
         QryCustodia.Filtered := True;
         QryCustodia.Filter   := 'SALDO > 0 ';
         QryCustodia.First;
         QryCustodia.EnableControls;
      end;
      // AL_11 - Fim
   end;
End;

procedure TfrmCadTransfCarteira.HabilitaCampos;
begin
   dblCarteira.Enabled         := True;
   dblInvestimento.Enabled     := True;
   edData.Enabled              := True;
   TB97oKCancelar.Enabled      := False;
   bbtnConfirmar.Enabled       := False;
   bbtnCancelar.Enabled        := False;
   BtnRemover.Enabled          := True;
   EdQuantidade.Value          := 0 ;
   Label4.Enabled              := False;
   dblCarteiraTransf.Enabled   := False;
   Label7.Enabled              := False;
   EdQuantidade.Enabled        := False;
   dblMotBlq.Enabled           := False;
   lblMotBloq.Enabled          := False;
   //Al_2
   LblTipoConta.Enabled        := False;
   dblTipoConta.Enabled        := False;
   pnlFundo.Enabled            := True;
   //AL_16
   pnlTransfDest.Color         := clGray;
end;

procedure TfrmCadTransfCarteira.DesabilitaCampos;
begin
   dblCarteira.Enabled         := False;
   dblInvestimento.Enabled     := False;
   edData.Enabled              := False;
   sbtnProcurar.Enabled        := False;
   BtnRemover.Enabled          := False;
   Label4.Enabled              := True;
   dblCarteiraTransf.Enabled   := True;
   Label7.Enabled              := True;
   EdQuantidade.Enabled        := True;
   dblMotBlq.Enabled           := True;
   lblMotBloq.Enabled          := True;
   TB97oKCancelar.Enabled      := True;
   bbtnConfirmar.Enabled       := True;
   bbtnCancelar.Enabled        := True;
   //Al_2
   LblTipoConta.Enabled        := True;
   dblTipoConta.Enabled        := True;
   //AL_16
   pnlTransfDest.Color         := clNavy;
end;

procedure TfrmCadTransfCarteira.bbtnCancelarClick(Sender: TObject);
begin
   HabilitaCampos;
   Exit;
end;

procedure TfrmCadTransfCarteira.bbtnSairClick(Sender: TObject);
begin
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
   Qry.Close;
   QryCarteira.Close;
   QryInvestimento.Close;
   QryCarteiraTransf.Close;
   Close;
end;

procedure TfrmCadTransfCarteira.sbtnApagarClick(Sender: TObject);
var
   dDataAnt : TDateTime;
   bPergunta, bMarcaRep: Boolean;
   //AL_8
   iIdHistCartInvOrig, iIdHistCartInvDest : Integer;
begin
   // AL_10 - Não deixa nem entrar na herança pois ao sair iria continuar a exclusão
   if RendaVariavel.VerEmAbertura then
   begin
      sbtnApagar.Down := False;
      Exit;
   end;

   inherited;

   try
      MontaSelect.Executar;
      bPergunta := True;
      bMarcaRep := False;

      if MontaSelect.RetornouValor then
      begin
         // Se for Transferência de Cesta de Opções de Índice
         if Copy(MontaSelect.ValoresChave[13],1,2) = 'OI' then
         begin
            MsgDlg('Esta Transferência é uma Alteração de Cesta de Opções de Índice.'+#13+
                   'Deve-se Excluir a Alteração da Cesta para Excluir suas Transferências',
                   'Atenção',mtInformation,[mbOk],0);
            Exit;
         end;

         // Se a Carteira de Destino for a de Opções
         if StrToInt(MontaSelect.ValoresChave[11]) = pRPI.IDCARTOPC then
         begin
            if MsgDlg('Existe Operações de Opções para esta Transferência.'+#13+
                      'Confirma a exclusão ?','Atenção',mtConfirmation,[mbYes, mbNo],0) = mrNo then
               Exit
            else
               bPergunta := False;
         end;

         // Verifica se Pode transferir quando for Carteira de Empréstimo de Ações
         //AL_19 - Plano Patro
         if not EmprestAcoes.VerificaTransfEmptmoAcoes(StrToInt(MontaSelect.ValoresChave[14]),
                                                       StrToInt(MontaSelect.ValoresChave[11]),
                                                       StrToInt(MontaSelect.ValoresChave[10]),
                                                       StrToInt(MontaSelect.ValoresChave[6]),
                                                       StrToFloat(MontaSelect.ValoresChave[12]),
                                                       MontaSelect.ValoresChave[5]) then
            Exit;

         if StrToDate(MontaSelect.ValoresChave[5]) <= pRPI.DATAULTFECH then
         begin
            if MsgDlg('Ao Excluir a Transferência, O Sistema Reprocessará este Investimento no Próximo Fechamento.'+#13+
                      'Confirma a exclusão ?','Atenção',mtConfirmation,[mbYes, mbNo],0) = mrNo then
               Exit;
            bMarcaRep := True;
         end
         else
         begin
            if bPergunta then
            begin
               if MsgDlg('Confirma a exclusão ?','Atenção',mtInformation,[mbYes, mbNo],0) = mrNo then
                  Exit;
            end;
         end;

         Try
            if not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;

            //AL_16
            fraProg.Mostra;
            fraProg.Max := 12;

            //AL_16 - Assinala a rotina AtualizaProg ao evento AtualizaProcesso da unit OperComum
            uOperComum.AtualizaProcesso := AtualizaProg;

            //AL_8 Ini
            iIdHistCartInvOrig := 0;
            if MontaSelect.ValoresChave[3] <> '' then
               iIdHistCartInvOrig := StrToInt(MontaSelect.ValoresChave[3]);
            iIdHistCartInvDest:= 0;
            if MontaSelect.ValoresChave[4] <> '' then
               iIdHistCartInvDest := StrToInt(MontaSelect.ValoresChave[4]);

            if not OperComum.ProcExcluiCustodia(StrToInt(MontaSelect.ValoresChave[0]),
                                                iIdHistCartInvOrig,
                                                iIdHistCartInvDest,
                                                StrToDate(MontaSelect.ValoresChave[5])) then
            begin
               bbtnCancelar.Click;
               Exit;
            end;
            //AL_8 Fim

            //AL_16
            fraProg.Mes := 'Limpando Cestas de Opção de Índice';
            fraProg.Incrementa;
            with dtmOperComum.qryAuxiliar do
            begin
               Close;
               SQL.Clear;
               SQL.Text := 'UPDATE CESTAOPCIND SET IDBOLETA = NULL WHERE  IDBOLETA = '+ QuotedStr(MontaSelect.ValoresChave[13]);
               ExecSQL;
               Close;
            end;

            // Exclui a Boleta
            //AL_16
            fraProg.Mes := 'Excluindo a Boleta ' + MontaSelect.ValoresChave[13];
            fraProg.Incrementa;
            with dtmOperComum.qryAuxiliar do
            begin
               Close;
               SQL.Clear;
               SQL.Text := 'DELETE FROM BOLETA WHERE IDBOLETA = ' + QuotedStr(MontaSelect.ValoresChave[13]);
               ExecSQL;
               Close;
            end;

            if bMarcaRep then
            begin
               // Se a TRC for anterior a data de último fechamento da carteira então,
               // Marca-se o FLG = 5 para Reprocessar os Investimento nas Carteiras

               // AL_9 - Ini
               // Marca carteira Origem
               //AL_16
               fraProg.Mes := 'Marcando o Investimento para Reprocessamento na Carteira Origem';
               fraProg.Incrementa;
               if not RendaVariavel.MarcarFlagReproc(StrToInt(MontaSelect.ValoresChave[6]){iInvestimento},
                                                     StrToInt(MontaSelect.ValoresChave[9]){iCarteiraInvest},
                                                     StrToInt(MontaSelect.ValoresChave[14]){iPlanPrev},
                                                     StrToDate(MontaSelect.ValoresChave[5]){dDataRef}) then
                  //Al_3
                  Raise Exception.Create('Não foi possível marcar para Reprocessamento, a Carteira de Destino .');

               // Marca carteira Destino
               //AL_16
               fraProg.Mes := 'Marcando o Investimento para Reprocessamento na Carteira Destino';
               fraProg.Incrementa;
               if not RendaVariavel.MarcarFlagReproc(StrToInt(MontaSelect.ValoresChave[6]){iInvestimento},
                                                     StrToInt(MontaSelect.ValoresChave[11]){iCarteiraInvest},
                                                     StrToInt(MontaSelect.ValoresChave[14]){iPlanPrev},
                                                     StrToDate(MontaSelect.ValoresChave[5]){dDataRef}) then
                  Raise Exception.Create('Não foi possível marcar para Reprocessamento, a Carteira de Destino .');
               // AL_9 - Fim
            end;

            if DtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Commit;

            fraProg.Mes := 'Atualizando os Saldos Origem';
            fraProg.Incrementa;
            QryCustodia.DisableControls;
            AbreQry;
            AlimentaQryConsulta;
            QryCustodia.EnableControls;

         //Al_3
         Except on E: Exception do
            begin
               if DtmBaseDados.dbBaseDados.InTransaction then
                  DtmBaseDados.dbBaseDados.Rollback;

               MsgDlg(E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
               //AL_11
               AbreQry;
            end;
         end;
      end;
   finally
      pnlFundo.Enabled     := True;
      sbtnApagar.Down      := False;
      //AL_16
      fraProg.Apaga;
      //AL_16 - Desassinala a rotina AtualizaProg ao evento AtualizaProcesso da unit OperComum
      uOperComum.AtualizaProcesso := Nil;
   end;
end;

procedure TfrmCadTransfCarteira.dblCarteiraTransfExit(Sender: TObject);
begin
   // AL_10
   if pRPI.IDCARTEMPACOES = QryCarteiraTransf.FieldByName('IDCARTEIRAINVEST').AsInteger then
   begin
      QryMotBlq.Locate('IDMOTIVOBLOQUEIO', pRPI.IDMOTBLOQEMPAC, []);
      dblMotBlq.Text := QryMotBlq.FieldByName('DESCMOTBLOQ').AsString;
      dblMotBlq.Enabled := False;
   end
   else
      dblMotBlq.Enabled := True;
   inherited;
end;

Function TfrmCadTransfCarteira.ExisteFormulario : Boolean;
Var
  I:Integer;
Begin
  Result := False;
  { Testa se existe algum Formulario }
  For I := 0 to Screen.FormCount-1 Do
  Begin
     { Verifica se Formulario herda do TForm }
     If ((Copy(Screen.Forms[I].Name,1,1) = 'F')  Or
         (Copy(Screen.Forms[I].Name,1,1) = 'f')) And
        (Screen.Forms[I].Name = 'FrmCadConfirmaReversao') Then
     Begin
        { Caso Formulario Exista (esteja criado) e esteja Visivel, seta Flg }
        If Screen.Forms[I].Visible = True Then
           Result := True;
     End;
  End;
  For I := 0 to Screen.FormCount-1 Do
  Begin
     // Verifica se Formulario herda do TForm
     If ((Copy(Screen.Forms[I].Name,1,1) = 'F')  Or
         (Copy(Screen.Forms[I].Name,1,1) = 'f')) And
        (Screen.Forms[I].Name = 'FrmCadConfirmaEmprestimo')  Then
     Begin
        // Caso Formulario Exista (esteja criado) e esteja Visivel, seta Flg
        If Screen.Forms[I].Visible = True Then
           Result := True;
     End;
  End;
End;

procedure TfrmCadTransfCarteira.Setdata(dData: TDateTime);
begin
   FdData := dData;
   edData.Text := DateToStr(dData);
   edData.DateTime := dData;
end;

//AL_16
procedure TfrmCadTransfCarteira.CloseUpGeral(Combo: TObject; QueryLookUp, Query: TDataSet; Alterado: Boolean;
                                             Campo: String; iValorAnt: Integer);
begin
   if Alterado then
   begin
      if (OperComum.IIF(Trim(TwwDBLookupCombo(Combo).Text) <> '', QueryLookUp.FieldByName(Campo).AsInteger, 0) <> iValorAnt) then
         AbreQry;
   end;
end;

//AL_16
procedure TfrmCadTransfCarteira.edDataEnter(Sender: TObject);
begin
  inherited;
  wDataAnt := edData.DateTime;
end;

//AL_16
procedure TfrmCadTransfCarteira.dblCarteiraEnter(Sender: TObject);
begin
   inherited;
   if Trim(dblCarteira.Text) <> '' then
      wCartAnt := QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger
   else
      wCartAnt := 0;
end;

//AL_16
procedure TfrmCadTransfCarteira.dblCarteiraCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   CloseUpGeral(dblCarteira, LookupTable, FillTable, modified, 'IDCARTEIRAINVEST', wCartAnt);
   if Trim(dblCarteira.Text) <> '' then
      wCartAnt := QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger
   else
      wCartAnt := 0;
end;

//AL_16
procedure TfrmCadTransfCarteira.dblCarteiraExit(Sender: TObject);
begin
   inherited;
   CloseUpGeral(dblCarteira, QryCarteira, nil, True, 'IDCARTEIRAINVEST', wCartAnt);
end;

procedure TfrmCadTransfCarteira.dblInvestimentoEnter(Sender: TObject);
begin
   inherited;
   if Trim(dblInvestimento.Text) <> '' then
      wInvAnt := QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger
   else
      wInvAnt := 0;
end;

procedure TfrmCadTransfCarteira.dblInvestimentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   CloseUpGeral(dblInvestimento, LookupTable, FillTable, modified, 'IDINVESTIMENTO', wInvAnt);
   if Trim(dblInvestimento.Text) <> '' then
      wInvAnt := QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger
   else
      wInvAnt := 0;
end;

procedure TfrmCadTransfCarteira.dblInvestimentoExit(Sender: TObject);
begin
   inherited;
   CloseUpGeral(dblInvestimento, QryInvestimento, nil, True, 'IDINVESTIMENTO', wInvAnt);
end;

procedure TfrmCadTransfCarteira.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRV := TCtrlRendaVariavel.Create;
  CtrlRV.InitializeAs(Padroes);
end;

procedure TfrmCadTransfCarteira.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
   Qry.Close;
   QryCarteira.Close;
   QryInvestimento.Close;
   QryCarteiraTransf.Close;
   QryMotBlq.Close;
   FreeAndNil(CtrlRV);
   inherited;
end;

procedure AtualizaProg(sMsg: String = ''; iMax: Integer = -1);
begin
   if iMax = -2 then
      frmCadTransfCarteira.fraProg.Apaga
   else if iMax > 0 then
      frmCadTransfCarteira.fraProg.Mostra;

   if sMsg <> '' then
      frmCadTransfCarteira.fraProg.Mes := sMsg;

   if iMax > 0 then
   begin
      frmCadTransfCarteira.fraProg.Max := iMax;
      frmCadTransfCarteira.fraProg.Min := 0;
      frmCadTransfCarteira.fraProg.Pos := 0;
   end
   else
   if iMax = -1 then
      frmCadTransfCarteira.fraProg.Incrementa;

   Application.ProcessMessages;
end;

end.




