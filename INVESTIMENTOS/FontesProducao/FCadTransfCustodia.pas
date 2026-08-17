//******************************************************************************
// Autor     : Marco Turon
// Data      : 21/09/2007
// Código    : AL_6
// Pendencia : 26357
// SOL       : 69119
// Desc      : Ajuste para: Transferência de Carteira para Empréstimo
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 27/10/2006
// Código   : AL_5
// Pendencia: 22985
// SOL      :
// Desc     : Segregação de Planos
//******************************************************************************
// Autor    : Marco Turon
// Data     : 03/10/2006
// Código   : AL_4
// Pendencia:
// SOL      :
// Motivo   : Segregação de Planos
//******************************************************************************
// Autor    : Marco Turon
// Data     : 16/02/2006
// Código   : AL_3
// Motivo   : Ajustes para o novo reprocessamento linear por data
//            Ajuste na mascara dos saldos CC e CCI (DFM)
//            Implementação de bloqueio de fechamento
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 12/12/2005
// Código   : AL_2
// Pendencia: 20754
// Sol      : 38433
// Motivo   : Nâo deve voltar a data do Parâmetro
//********************************************************************************************************
//Autor     :  Marco Turon
//Data	    :  17/03/2005
//          :  AL_1
//Função    :  Reestruturação no processo para atender ao reprocessamento.
//               passa a lançar uma boleta para reprocessar em caso de exclusão de histcustodia
//               marcando também o investimento para reprocessamento se necessário
//********************************************************************************************************
unit FCadTransfCustodia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, wwdblook, Db, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, TREdit,
  DBGrids, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList;

type
  TfrmCadTransfCustodia = class(TfrmCadastroCS)
    QryCarteira: TwwQuery;
    QryCarteiraDESCCARTINVEST: TStringField;
    QryCarteiraIDCARTEIRAINVEST: TFloatField;
    QryInvestimento: TwwQuery;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    QryCustodia: TwwQuery;
    QryCustodiante: TwwQuery;
    QryCustodianteSGLCUSTODIANTE: TStringField;
    QryCustodianteIDCUSTODIANTE: TFloatField;
    QryMotBlq: TwwQuery;
    QryMotBlqSIGLAMOTBLOQ: TStringField;
    QryMotBlqDESCMOTBLOQ: TStringField;
    QryMotBlqIDMOTIVOBLOQUEIO: TFloatField;
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
    QryTipoOperacao: TwwQuery;
    qryDelOperCustodia: TwwQuery;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    DateTimeField2: TDateTimeField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField19: TFloatField;
    qryDelHistCustodia: TwwQuery;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    DateTimeField3: TDateTimeField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    FloatField28: TFloatField;
    Panel3: TPanel;
    edData: TCMDateTimePicker;
    Label6: TLabel;
    dblCarteira: TwwDBLookupCombo;
    Label2: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    Label1: TLabel;
    Panel4: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    pnlTransferir: TPanel;
    Label5: TLabel;
    Label12: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    dblCustodiante: TwwDBLookupCombo;
    dblMotBlq: TwwDBLookupCombo;
    EdQuantidade: TRealEdit;
    Panel6: TPanel;
    GrdCustodia: TDBGrid;
    pnlSeta: TPanel;
    BtnRemover: TSpeedButton;
    QryCustodiaSGLCUSTODIANTE: TStringField;
    QryCustodiaSIGLAMOTBLOQ: TStringField;
    QryCustodiaIDCARTEIRAINVEST: TFloatField;
    QryCustodiaIDINVESTIMENTO: TFloatField;
    QryCustodiaIDCUSTODIANTE: TFloatField;
    QryCustodiaIDLOTE: TStringField;
    QryCustodiaIDMOTIVOBLOQUEIO: TFloatField;
    QryCustodiaSALDO: TFloatField;
    QryCustodiaDESCMOTBLOQ: TStringField;
    qryUpdOperCustodia: TwwQuery;
    FloatField10: TFloatField;
    FloatField38: TFloatField;
    FloatField39: TFloatField;
    FloatField40: TFloatField;
    FloatField41: TFloatField;
    DateTimeField5: TDateTimeField;
    FloatField42: TFloatField;
    FloatField43: TFloatField;
    FloatField44: TFloatField;
    StringField4: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    FloatField45: TFloatField;
    //AL_5
    QryPlanoPatro: TwwQuery;
    QryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    QryPlanoPatroIDPLANOPREV: TFloatField;
    QryPlanoPatroIDPATRO: TFloatField;
    QryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    dblkPlanPatro: TwwDBLookupCombo;
    lblPlanoPatro: TLabel;
    QryCustodiaIDPLANPREVCTBPATR: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure BtnRemoverClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dblCarteiraExit(Sender: TObject);
    procedure dblInvestimentoExit(Sender: TObject);
    //AL_5
    procedure dblkPlanPatroExit(Sender: TObject);


  private
    { Private declarations }
    procedure AlimentaQryConsulta;
    //AL_5
//    procedure AlteraHistCustodiaOrigem(idOperCustodia:integer;var iIdHistCustodiaOrig:integer);
//    procedure InsereHistCustodiaDestino(idOperCustodia:integer;var iIdHistCustodiaDest:integer);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure AbreQry;
    procedure ProcExcluiCustodia;
  public
    { Public declarations }
  end;

var
  frmCadTransfCustodia: TfrmCadTransfCustodia;
  iMotivoBloc : integer;
  iIdHistCartInv : integer;
  iIdHistCustodia,iIdHistCustodiaOrig,iIdHistCustodiaDest,idOperCustodia : Integer;
  iIdHistCartInvOrig,iIdHistCartInvDest : Integer;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, DBaseDados, uDataBase, UBibliotecaInvest, UOperacaoInvest,
     UOperComum, dOperComum, dAGE,UDiasUteisInv,UEmprestAcoes,
  dRendaVariavel, URendaVariavel;

procedure TfrmCadTransfCustodia.FormShow(Sender: TObject);
begin
  inherited;
   Qry.Open;
   QryCarteira.Open;
   QryInvestimento.Open;
   QryMotBlq.Open;
   QryCustodiante.Open;
   //AL_5
   QryPlanoPatro.Open;
   CMeCadastro.AtualizaBotoes(self);
   sbtnApagar.Enabled := True;
   edData.Text := DateToStr(pRPI.DATAULTFECH + 1);
   pnlFundo.Enabled := True;
end;

procedure TfrmCadTransfCustodia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   QryCarteira.Close;
   QryInvestimento.Close;
   QryMotBlq.Close;
   QryCustodiante.Close;
  inherited;
end;

procedure TfrmCadTransfCustodia.bbtnConfirmarClick(Sender: TObject);
Var
   wPlanilha, wDocumento, wPlano, iIdMotBloqDest    : Integer;
   fCotacao, fValorOper, fQtdOrigem : Double;
   sBoleta: String;
begin
   // Testar se pelo menos uma linha da grid está selecionada.
   iIdMotBloqDest := -1;

   If Trim(dblCustodiante.Text) = '' Then
   Begin
     ShowMessage('Falta preencher o campo Custodiante.');
     if dblCustodiante.CanFocus then
        dblCustodiante.SetFocus;
     Exit;
   End;

   If (Trim(dblCustodiante.Text) =  QryCustodiaSGLCUSTODIANTE.AsString) and
      (QryCustodiaSIGLAMOTBLOQ.AsString = '') and
      (Trim(dblMotBlq.Text) = '') then
   Begin
     ShowMessage('Falta definir o Motivo de Bloqueio.');
     if dblMotBlq.CanFocus then
        dblMotBlq.SetFocus;
     Exit;
   End;

   If (Trim(dblCustodiante.Text) =  QryCustodiaSGLCUSTODIANTE.AsString) and
      (QryCustodiaSIGLAMOTBLOQ.AsString = Trim(QryMotBlqSIGLAMOTBLOQ.AsString)) then
   Begin
     ShowMessage('Mesmo Custodiante e Motivo de Bloqueio.');
     if dblCustodiante.CanFocus then
        dblCustodiante.SetFocus;
     Exit;
   End;

   If EdQuantidade.Value = 0 Then
   Begin
     ShowMessage('Falta preencher o campo Quantidade.');
     if EdQuantidade.CanFocus then
        EdQuantidade.SetFocus;
     Exit;
   End;

   If QryCustodia.FieldByName('SALDO').AsFloat < EdQuantidade.Value then
   Begin
     ShowMessage('A Quantidade é superior ao saldo para transferência/bloqueio.');
     if EdQuantidade.CanFocus then
        EdQuantidade.SetFocus;
     Exit;
   End;

   // Verifica se Pode transferir quando for Carteira de Empréstimo de Ações
   //AL_6
   if not EmprestAcoes.VerificaTransfEmptmoAcoes(QryCustodia.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 QryCustodia.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                 QryCustodia.FieldByName('IDCUSTODIANTE').AsInteger,
                                                 QryCustodia.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 EdQuantidade.Value,
                                                 DateToStr(edData.Date)) then
      Exit;

   fQtdOrigem := QryCustodia.FieldByName('SALDO').AsFloat;

   Try
      QryCustodia.DisableControls;
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      //AL_1 - 17/02/2005 - TURON
      //Cria a Boleta da Operação de Transferencia de Custodia - TCU
      sBoleta := 'RV-'+Copy(DateToStr(edData.Date),9,2)+'/'+FormatFloat('0000',
                       LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(DateToStr(edData.Date),9,2)));

      with dmRendaVariavel.qryInsBoleta  do
      begin
         OperComum.LimpaParametros(dmRendaVariavel.qryInsBoleta, True);
         ParamByName('IDBOLETA').AsString     := sBoleta;
         ParamByName('STATUS').AsString       := 'F';
         ParamByName('DATABOLETA').AsDateTime := edData.DateTime;
         ParamByName('TIPMOVBOLETA').AsString := 'TCU';
         ExecSQL;
      end;

      // Grava OperCustodia
      idOperCustodia := LeUltRegistro(Nil,'OPERCUSTODIA');

      If Trim(dblMotBlq.Text) = '' Then
         iIdMotBloqDest := -1;

      //AL_5
      if not OperacaoInvest.AlimentaOperCustodia(idOperCustodia,-1,-1,-1,-1,
                                                 QryCustodia.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                 QryCustodia.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                 QryCustodia.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 QryCustodia.FieldByName('IDCUSTODIANTE').AsInteger,
                                                 QryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger,
                                                 QryCustodia.FieldByName('IDMOTIVOBLOQUEIO').AsInteger,
                                                 iIdMotBloqDest,
                                                 EdQuantidade.Value,
                                                 edData.Date,
                                                 QryCustodia.FieldByName('IDLOTE').AsString,
                                                 sBoleta,
                                                 QryCustodia.FieldByName('IDPLANPREVCTBPATR').AsInteger) then
         Raise Exception.Create('Não foi possível gravar a operação de custodia');
      // AL_1 - FIM

      //AL_5
      OperComum.AlteraHistCustodiaOrigem(idOperCustodia,
                                        QryCustodia.FieldByName('IDMOTIVOBLOQUEIO').AsInteger,
                                        QryCustodia.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        QryCustodia.FieldByName('IDINVESTIMENTO').AsInteger,
                                        QryCustodia.FieldByName('IDCUSTODIANTE').AsInteger,
                                        QryCustodia.FieldByName('IDLOTE').AsString,
                                        edData.Date, EdQuantidade.Value, iIdHistCustodiaOrig,
                                        QryCustodia.FieldByName('IDPLANPREVCTBPATR').AsInteger);

      OperacaoInvest.AtualizaSaldosCustodia;

      //AL_5
      Opercomum.InsereHistCustodiaDestino(idOperCustodia,
                                          QryCustodia.FieldByName('IDMOTIVOBLOQUEIO').AsInteger,
                                          QryCustodia.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          QryCustodia.FieldByName('IDINVESTIMENTO').AsInteger,
                                          QryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger,
                                          QryCustodia.FieldByName('IDLOTE').AsString,
                                          edData.Date,EdQuantidade.Value,iIdHistCustodiaDest,
                                          QryCustodia.FieldByName('IDPLANPREVCTBPATR').AsInteger);

      OperacaoInvest.AtualizaSaldosCustodia;

      // Altera OperCustodia, gravando os Id's
      if not OperacaoInvest.AtualizaOperCustodia(idOperCustodia,iIdHistCustodiaOrig,iIdHistCustodiaDest, -1,-1) then
         Raise Exception.Create('Não foi possível atualizar a operação de custodia com os históricos');

      // AL_1 - 18/03/2005 - Turon
      // Marca o papel para Reprocessamento
      If edData.DateTime <= pRPI.DATAULTFECH Then
         RendaVariavel.MarcarFlagReproc(QryCustodia.FieldByName('IDINVESTIMENTO').AsInteger, -1, -1, edData.DateTime);

      if DtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Commit;

      MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema',mtConfirmation,[mbOK],0);

      QryCustodia.Filtered := False;
      QryCustodia.Filter   := '';
      QryCustodia.EnableControls;
   Except
      on E: Exception do
      begin
         if DtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Ocorreu o seguinte problema na operação:' + #13 + E.Message,
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         bbtnCancelar.Click;
         Exit;
      end;

   End;
   QryCustodia.DisableControls;
   HabilitaCampos;
   CMeCadastro.AtualizaBotoes(self);
   AbreQry;
   AlimentaQryConsulta;
   QryCustodia.EnableControls;
   QryTipoOperacao.Close;
//  inherited;
end;

procedure TfrmCadTransfCustodia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadTransfCustodia.AbreQry;
begin
   //AL_5
   if (Trim(edData.Text) <> '') and (Trim(dblkPlanPatro.Text) <> '') and
      (Trim(dblCarteira.Text) <> '') and (Trim(dblInvestimento.Text) <> '') Then
   Begin
      OperComum.LimpaParametros(QryCustodia);
      with QryCustodia do
      begin
         //AL_5
         ParamByName('IDPLANPREVCTBPATR').AsInteger := QryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;
         ParamByName('IDCARTEIRAINVEST').AsInteger := QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
         ParamByName('IDINVESTIMENTO').AsInteger := QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
         Open;

         AlimentaQryConsulta;

         If Not EOF Then
         Begin
            BtnRemover.Enabled := True;
            if GrdCustodia.CanFocus then
               GrdCustodia.SetFocus;
            GrdCustodia.SelectedIndex := 0;
         End
         Else
            BtnRemover.Enabled := False;
      End;
   End
   Else
   Begin
      QryCustodia.Close;
      BtnRemover.Enabled := False;
   End;
end;

procedure TfrmCadTransfCustodia.BtnRemoverClick(Sender: TObject);
begin
   // AL_3
   if RendaVariavel.VerEmAbertura then
      Exit;
  inherited;
   iMotivoBloc := QryCustodia.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;
   CmeCadastro.Insert(Self);
   DesabilitaCampos;
   EdQuantidade.Value := QryCustodia.FieldByName('SALDO').AsFloat;   
end;

procedure TfrmCadTransfCustodia.AlimentaQryConsulta;
begin
   With QryCustodia Do
   Begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         // Busca Saldo Liberado/Bloqueado do Custodiante
         dtmAGE.qrySaldoCustodia.Close;
         //AL_5
         dtmAGE.qrySaldoCustodia.ParamByName('IdCarteira').AsInteger :=
                          QryCustodia.FieldByName('IdCarteiraInvest').AsInteger;
         dtmAGE.qrySaldoCustodia.ParamByName('IdInvestimento').AsInteger :=
                          QryCustodia.FieldByName('IdInvestimento').AsInteger;
         dtmAGE.qrySaldoCustodia.ParamByName('IdLote').AsString :=
                          QryCustodia.FieldByName('IdLote').AsString;
         //AL_4 - Segregação
         dtmAGE.qrySaldoCustodia.ParamByName('DataMov').AsString := edData.Text;
         dtmAGE.qrySaldoCustodia.ParamByName('IDCUSTODIANTE').AsInteger :=
                          QryCustodia.FieldByName('IDCUSTODIANTE').AsInteger;
         dtmAGE.qrySaldoCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger :=
                          QryCustodia.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;
         dtmAGE.qrySaldoCustodia.ParamByName('IdCustodia').AsInteger := 9999999;
         dtmAGE.qrySaldoCustodia.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                          QryCustodia.FieldByName('IDPLANPREVCTBPATR').AsInteger;
         dtmAGE.qrySaldoCustodia.Open;

         Edit;

         if FieldByName('IDMOTIVOBLOQUEIO').AsInteger = -1 then
            FieldByName('SALDO').AsFloat  :=
                  dtmAGE.qrySaldoCustodia.FieldByName('SALDOLIBERADO').AsFloat
         else
            FieldByName('SALDO').AsFloat  :=
                  dtmAGE.qrySaldoCustodia.FieldByName('SALDOBLOQUEADO').AsFloat;
         Post;
         Next;
      End;
      First;
      EnableControls;
   End;
   QryCustodia.Filtered := True;
   QryCustodia.Filter   := 'SALDO > 0 ';     
End;

{procedure TfrmCadTransfCustodia.AlteraHistCustodiaOrigem(idOperCustodia:integer;var iIdHistCustodiaOrig:integer);
var
   sTipoCustodia : string;
begin
      If QryCustodia.FieldByName('IDMOTIVOBLOQUEIO').AsInteger = -1 Then
         sTipoCustodia := 'V'
      Else
         sTipoCustodia := 'Z';  //BLOQUEADA

      OperacaoInvest.InsereCustodia(
               QryCustodia.FieldByName('IDCARTEIRAINVEST').AsInteger,
               QryCustodia.FieldByName('IDINVESTIMENTO').AsInteger,
               QryCustodia.FieldByName('IDCUSTODIANTE').AsInteger,
               QryCustodia.FieldByName('IDMOTIVOBLOQUEIO').AsInteger, -1,
               idOperCustodia,
               QryCustodia.FieldByName('IDLOTE').AsString, sTipoCustodia[1],
               StrToDate(edData.Text), EdQuantidade.Value,
               iIdHistCustodia);
      iIdHistCustodiaOrig := iIdHistCustodia;
end;

procedure TfrmCadTransfCustodia.InsereHistCustodiaDestino(idOperCustodia:integer;var iIdHistCustodiaDest:integer);
var
   sTipoCustodia : string;
   iIDMOTIVOBLOQUEIO : Integer;
begin
   If Trim(dblMotBlq.Text) <> '' Then
      iIDMOTIVOBLOQUEIO := QryMotBlq.FieldByName('IDMOTIVOBLOQUEIO').AsInteger
   Else
      iIDMOTIVOBLOQUEIO := -1;

   If iIDMOTIVOBLOQUEIO = -1 Then
      sTipoCustodia := 'C'
   Else
      sTipoCustodia := 'Y';  //BLOQUEADA

   OperacaoInvest.InsereCustodia(
            QryCustodia.FieldByName('IDCARTEIRAINVEST').AsInteger,
            QryCustodia.FieldByName('IDINVESTIMENTO').AsInteger,
            QryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger,
            iIDMOTIVOBLOQUEIO, -1,
            idOperCustodia,
            QryCustodia.FieldByName('IDLOTE').AsString, sTipoCustodia[1],
            StrToDate(edData.Text), EdQuantidade.Value,
            iIdHistCustodia);
   iIdHistCustodiaDest := iIdHistCustodia;
end;
}
procedure TfrmCadTransfCustodia.HabilitaCampos;
begin
   //AL_5
   dblkPlanPatro.Enabled     := True;
   dblCarteira.Enabled       := True;
   dblInvestimento.Enabled   := True;
   edData.Enabled            := True;
   TB97oKCancelar.Enabled    := False;
   bbtnConfirmar.Enabled     := False;
   bbtnCancelar.Enabled      := False;
   BtnRemover.Enabled        := True;
   dblCustodiante.Text       := '';
   dblMotBlq.Text            := '';
   EdQuantidade.Value        := 0 ;
   Label5.Enabled            := False;
   dblCustodiante.Enabled    := False;
   Label12.Enabled           := False;
   dblMotBlq.Enabled         := False;
   Label7.Enabled            := False;
   EdQuantidade.Enabled      := False;
end;

procedure TfrmCadTransfCustodia.DesabilitaCampos;
begin
   //AL_5
   dblkPlanPatro.Enabled     := False;
   dblCarteira.Enabled       := False;
   dblInvestimento.Enabled   := False;
   edData.Enabled            := False;
   sbtnProcurar.Enabled      := False;
   BtnRemover.Enabled        := False;
   Label5.Enabled            := True;
   dblCustodiante.Enabled    := True;
   Label12.Enabled           := True;
   dblMotBlq.Enabled         := True;
   Label7.Enabled            := True;
   EdQuantidade.Enabled      := True;
   TB97oKCancelar.Enabled    := True;
   bbtnConfirmar.Enabled     := True;
   bbtnCancelar.Enabled      := True;
end;

procedure TfrmCadTransfCustodia.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   HabilitaCampos;
   CMeCadastro.AtualizaBotoes(self);
end;

procedure TfrmCadTransfCustodia.edDataExit(Sender: TObject);
begin
  inherited;
   QryCustodia.Filtered := False;
   QryCustodia.Filter   := '';
   if (frmCadTransfCustodia.ActiveControl <> bbtnSair) and
      (frmCadTransfCustodia.ActiveControl <> bbtnCancelar) then
   begin
   // AL_1 - 18/03/2005 - Turon
//      if Trim(edData.Text) <> DateToStr(pRPI.DATAMOVTORV) then
//      begin
//         edData.Text := DateToStr(pRPI.DATAULTFECH);
//         ShowMessage('Data menor ou igual ao último Fechamento.');
//         if edData.CanFocus then
//            edData.SetFocus;
//      end
//      else
         AbreQry;
   end;
end;

procedure TfrmCadTransfCustodia.bbtnSairClick(Sender: TObject);
begin
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
   Qry.Close;
   QryCarteira.Close;
   QryInvestimento.Close;
   QryMotBlq.Close;
   QryCustodiante.Close;
   Close;
end;

procedure TfrmCadTransfCustodia.sbtnApagarClick(Sender: TObject);
begin
   // AL_3 - Não deixa nem entrar na herança pois ao sair iria continuar a exclusão
   if RendaVariavel.VerEmAbertura then
   begin
      sbtnApagar.Down := False;
      Exit;
   end;

  inherited;

   MontaSelect.Executar;
   if MontaSelect.RetornouValor then
   begin
      if StrToDate(MontaSelect.ValoresChave[5]) <= pRPI.DATAULTFECH then
      begin
         if MsgDlg('Para excluir a operação, será necessário'+#13+
                   'reprocessar o Sistema. Confirma a exclusão ?','Atenção',mtConfirmation,[mbYes, mbNo],0) = mrNo then
            Exit;
      end
      else
      begin
         if MsgDlg('Confirma a exclusão da operação ?','Atenção',mtConfirmation,[mbYes, mbNo],0) = mrNo then
            Exit;
      end;

      ProcExcluiCustodia;
   end;
end;

procedure TfrmCadTransfCustodia.ProcExcluiCustodia;
var
   dDataAnt : TDateTime;
begin
   Try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      MarcaFlgHistCustodia(-1,-1,StrToInt(MontaSelect.ValoresChave[0]));

      OperComum.LimpaParametros(qryUpdOperCustodia);
      qryUpdOperCustodia.ParamByName('IDOPERCUSTODIA').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
      qryUpdOperCustodia.ExecSQL;

      OperComum.LimpaParametros(qryDelHistCustodia);
      qryDelHistCustodia.ParamByName('IDOPERCUSTODIA').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
      qryDelHistCustodia.ExecSQL;

      OperComum.LimpaParametros(qryDelOperCustodia);
      qryDelOperCustodia.ParamByName('IDOPERCUSTODIA').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
      qryDelOperCustodia.ExecSQL;

      // Atualiza Saldos da Custodia
      OperacaoInvest.AtualizaSaldosCustodia;

      dDataAnt := DiasUteisInv.UltDiaUtilAnterior(StrToDate(MontaSelect.ValoresChave[5]),-1,1,'',True,False,False);

      //AL_2
      //OperComum.AlteraDataFechRV(dDataAnt);

      DtmBaseDados.dbBaseDados.Commit;

      MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema ',MtConfirmation,[MbOk],0);

   Except
      DtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('Não foi possível excluir a Operação.',
             'Mensagem do Sistema',mtError,[mbOK],0);
      bbtnCancelar.Click;
      Exit;
   end;
end;

procedure TfrmCadTransfCustodia.dblCarteiraExit(Sender: TObject);
begin
  inherited;
   QryCustodia.Filtered := False;
   QryCustodia.Filter   := '';
   AbreQry;
end;

procedure TfrmCadTransfCustodia.dblInvestimentoExit(Sender: TObject);
begin
  inherited;
   QryCustodia.Filtered := False;
   QryCustodia.Filter   := '';
   AbreQry;
end;

//AL_5
procedure TfrmCadTransfCustodia.dblkPlanPatroExit(Sender: TObject);
begin
  inherited;
   QryCustodia.Filtered := False;
   QryCustodia.Filter   := '';
   AbreQry;
end;

end.
