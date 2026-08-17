//******************************************************************************
// Autor     : Marco Turon
// Data      : 21/09/2007
// Código    : AL_5
// Pendencia : 26357
// SOL       : 69119
// Desc      : Ajuste para: Empréstimo de Ações (Segregação Plano / Patro)
//******************************************************************************
// Autor     : Fabio Fagundes
// Data      : 20/10/2006
// Código    : AL_4
// Pendencia : 22982
// SOL       :
// Desc      : Implementacao Plano e Patro (QryInsOperEmpAcoes)
//*****************************************************************************
//Autor     : Fabio Fagundes
//Data	    : 02/05/2006
//Código    : Al_3
//Motivo(S) : Inclusao do Paramentro na IntegraContabCapCar
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 12/12/2005
// Código   : AL_2
// Pendencia:
// Sol      :
// Motivo   : Nâo deve voltar a data do Parâmetro
//******************************************************************************
//Autor 	  : Fabio Fagundes
//Data	          : 29/06/2004
//Origem	  : FUNCEF
//Query 	  : QryVerOperRevertida,QryReversao
//Motivo(S)       : Passado o Active da qry para 'False'
//******************************************************************************

unit FCadConfirmaReversao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, Grids,
  Wwdbigrd, Wwdbgrid, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, MontaSelect;

type
  TFrmCadConfirmaReversao = class(TfrmOkCancelarInv)
    PnlSelecao: TPanel;
    PnlGrid: TPanel;
    DbgOperReversao: TwwDBGrid;
    PnlSaldoEmp: TPanel;
    QryReversao: TwwQuery;
    DsReversao: TwwDataSource;
    QryReversaoDESCINVESTIMENTO: TStringField;
    QryReversaoDATAOPERACAO: TDateTimeField;
    QryReversaoDATAVENCOPER: TDateTimeField;
    QryReversaoPUOPERACAO: TFloatField;
    QryReversaoTAXAOPERACAO: TFloatField;
    QryReversaoVLRJUROS: TFloatField;
    QryReversaoFLGREVERSAO: TStringField;
    QryReversaoTIPOOPER: TStringField;
    UpdReversao: TUpdateSQL;
    QryReversaoVLRRESGATE: TFloatField;
    QryReversaoIDOPEREMPACOES: TFloatField;
    QryReversaoIDOPEREMPACOESAP: TFloatField;
    QryReversaoIDINVESTIMENTO: TFloatField;
    QryReversaoVLROPERACAO: TFloatField;
    QryReversaoQTDOPERACAO: TFloatField;
    QryReversaoIDCUSTODIANTE: TFloatField;
    QryReversaoIDTIPOOPERACAO: TFloatField;
    QryReversaoNATUREZAOPERACAO: TStringField;
    QryReversaoVENCIMENTO: TFloatField;
    QryReversaoDESCTIPOOPERACAO: TStringField;
    QryReversaoFLGGERACONTAB: TFloatField;
    QryReversaoFLGGERACAPCAR: TFloatField;
    QryReversaoCODTIPDOC: TFloatField;
    QryReversaoIDCARTEIRAINVEST: TFloatField;
    QryReversaoIDTIPOINVEST: TFloatField;
    QryReversaoVLRIR: TFloatField;
    QryReversaoFLGPRECO: TStringField;
    QryReversaoTRGDTINCLUSAO: TDateTimeField;
    QryReversaoTRGUSERINCLUSAO: TStringField;
    QryReversaoCODDOCUMENTO: TFloatField;
    QryReversaoPLNCODIGO: TFloatField;
    QryReversaoPLANO: TFloatField;
    QryReversaoTIPOCONFIRMADO: TStringField;
    QryReversaoCOLOR: TFloatField;
    dDataReversao: TCMDateTimePicker;
    Label1: TLabel;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    lblInvestimento: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    RgOperacao: TRadioGroup;
    QryReversaoSGLCUSTODIANTE: TStringField;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtExcluir: TSpeedButton;
    QryUpdConfirEmpr: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    QryReversaoIDEMISSOR: TFloatField;
    QryReversaoDESCCARTINVEST: TStringField;
    MontaSelect: TMontaSelect;
    QryTipoOperacao: TwwQuery;
    QryVerOperRevertida: TwwQuery;
    QryReversaoIDPLANPREVCTBPATR: TFloatField;
    procedure dDataReversaoExit(Sender: TObject);
    procedure dDataReversaoCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure RgOperacaoClick(Sender: TObject);
    procedure dblInvestimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BtExcluirClick(Sender: TObject);
    procedure DbgOperReversaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbgOperReversaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbgOperReversaoKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbreQuery;
    procedure AtualizaGrid;
    function  VerificaRevFut(iIdOperEmpAcoes : Integer; dDataOperacao   : TDateTime) : Boolean;

  public
    bFormConfRev : Boolean;
    fSaldo, fSaldoHist, fSaldoBloq, fSaldoLib, fSldHist, fSldQtdHist : Double;      
    { Public declarations }
  end;

var
  FrmCadConfirmaReversao: TFrmCadConfirmaReversao;

implementation

uses UOperComum, UOperacaoInvest, UBibliotecaInvest, uEmprestAcoes, FTelaAut,
     dEmprestAcoes, UMensErro, dBaseDados, UDataBase, USistema,
     UDiasUteisInv, FCadTransfCarteira;

{$R *.DFM}


procedure TFrmCadConfirmaReversao.AbreQuery;
var
   dDataOper : TDateTime;
   iPos      : Integer;
   sSql      : String;
begin

   sSql := QryReversao.SQL.Text;
   iPos := pos(' WHERE TIPOCONFIRMADO', sSql);
   if iPos > 1 then begin
      Delete(sSql, iPos, 50);
      QryReversao.SQL.Text := sSql;
   end;

   dDataOper := dDataReversao.Date;

   QryReversao.FieldByName('VLRJUROS').ReadOnly         := False;
   QryReversao.FieldByName('SGLCUSTODIANTE').ReadOnly   := False;
   QryReversao.FieldByName('FLGREVERSAO').ReadOnly      := False;
   QryReversao.FieldByName('TIPOCONFIRMADO').ReadOnly   := False;
   QryReversao.FieldByName('DESCINVESTIMENTO').ReadOnly := False;
   QryReversao.FieldByName('DATAOPERACAO').ReadOnly     := False;
   QryReversao.FieldByName('DATAVENCOPER').ReadOnly     := False;
   QryReversao.FieldByName('PUOPERACAO').ReadOnly       := False;
   QryReversao.FieldByName('QTDOPERACAO').ReadOnly      := False;
   QryReversao.FieldByName('TAXAOPERACAO').ReadOnly     := False;

   OperComum.LimpaParametros(QryReversao);
   QryReversao.ParamByName('DATA').AsDateTime           := dDataOper;
   QryReversao.ParamByName('DATAVENC').AsDateTime       := dDataOper;

   If dblInvestimento.Text <> '' Then
      QryReversao.ParamByName('IDINVESTIMENTO').AsInteger :=
                    qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger
   Else
      QryReversao.ParamByName('IDINVESTIMENTO').Clear;

   If RgOperacao.ItemIndex      = 0 Then
   begin
      BtExcluir.Enabled        := True;
      QryReversao.SQL.Add(' WHERE TIPOCONFIRMADO = ''R''');
   end
   Else If RgOperacao.ItemIndex = 1  Then
   begin
      BtExcluir.Enabled        := False;
      QryReversao.SQL.Add(' WHERE TIPOCONFIRMADO = ''E''');
   end;

   QryReversao.Open;
   QryReversao.DisableControls;
   QryReversao.First;

   If Not QryReversao.IsEmpty Then
   begin
      DbgOperReversao.Options := DbgOperReversao.Options + [TwwDBgridOption(dgEditing)];
      While Not QryReversao.Eof Do
      begin
         If QryReversao.FieldByName('TIPOCONFIRMADO').AsString = 'E' Then
         begin
            QryReversao.Edit;

            QryReversao.FieldByName('DATAOPERACAO').AsDateTime  := dDataOper;

            // Busca o saldo de Empréstimos de Ações não Vencidos
            EmprestAcoes.BuscaSaldosHist(dDataReversao.Date,
                                         QryReversao.FieldByName('IDINVESTIMENTO').AsInteger,
                                         QryReversao.FieldByName('IDOPEREMPACOESAP').AsInteger,
                                         QryReversao.FieldByName('IDOPEREMPACOES').AsInteger,
                                         //AL_4
                                         QryReversao.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                         fSldHist,fSldQtdHist);

            QryReversao.FieldByName('VLRJUROS').AsFloat        :=
                      OperComum.Round(DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('SLDHISTEMPACOES').AsFloat -
                                     (OperComum.DivValorZero(DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('SLDQTDHISTEMPACOE').AsFloat,
                                      DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('QTDOPERACAOAPLIC').AsFloat) *
                                      DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('VLROPERACAO').AsFloat )-0.0049,2);

            QryReversao.Post;
         end;   
         QryReversao.Next;
      end;
      QryReversao.First;
   end
   Else
     DbgOperReversao.Options := DbgOperReversao.Options - [TwwDBgridOption(dgEditing)];


   QryReversao.EnableControls;

   If RgOperacao.ItemIndex      = 0 Then
      QryReversao.FieldByName('VLRJUROS').ReadOnly      := True;   

   QryReversao.FieldByName('SGLCUSTODIANTE').ReadOnly   := True;
   QryReversao.FieldByName('FLGREVERSAO').ReadOnly      := True;
   QryReversao.FieldByName('TIPOCONFIRMADO').ReadOnly   := True;
   QryReversao.FieldByName('DESCINVESTIMENTO').ReadOnly := True;
   QryReversao.FieldByName('DATAOPERACAO').ReadOnly     := True;
   QryReversao.FieldByName('DATAVENCOPER').ReadOnly     := True;
   QryReversao.FieldByName('PUOPERACAO').ReadOnly       := True;
   QryReversao.FieldByName('QTDOPERACAO').ReadOnly      := True;
   QryReversao.FieldByName('TAXAOPERACAO').ReadOnly     := True;

end;

procedure TFrmCadConfirmaReversao.AtualizaGrid;
begin
   AbreQuery;

   If QryReversao.IsEmpty Then
   begin
      If RgOperacao.ItemIndex  = 0 Then
         RgOperacao.ItemIndex := 1
      Else
         RgOperacao.ItemIndex := 0;

      AbreQuery;

   end;

   If RgOperacao.ItemIndex  = 0 Then
      PnlSaldoEmp.Caption  := 'Operações Confirmadas'
   Else
      PnlSaldoEmp.Caption  := 'Operações a Confirmar';
      
end;

procedure TFrmCadConfirmaReversao.dDataReversaoExit(Sender: TObject);
begin
  inherited;
   AtualizaGrid;
end;

procedure TFrmCadConfirmaReversao.dDataReversaoCloseUp(Sender: TObject);
begin
  inherited;
   AtualizaGrid;            
end;

procedure TFrmCadConfirmaReversao.FormShow(Sender: TObject);
begin
  inherited;
   dDataReversao.Date   := pRPI.DATAULTFECHEMP;
   while not DiasUteisInv.DiaUtil(dDataReversao.Date,-1,1,'',True,False,False) Do
     dDataReversao.Date := dDataReversao.Date + 1;   // Achar o proximo dia útil
   
   qryInvestimento.Open;

   AbreQuery;

   If QryReversao.IsEmpty Then
   begin
      If RgOperacao.ItemIndex  = 0 Then
         RgOperacao.ItemIndex := 1
      Else
         RgOperacao.ItemIndex := 0;

      AbreQuery;
   end;

   DbgOperReversao.SetFocus;
end;

procedure TFrmCadConfirmaReversao.bbtnConfirmarClick(Sender: TObject);
var
   bFaz : Boolean;
   dDataAnt, dDataDiaAtu, dDateVenc, dDataLiq : TDateTime;
   iIdOperEmpAcoes, I, iPlanilha, iDocumento  : Integer;
begin
   bFormConfRev := True;

   If QryReversao.IsEmpty Then
      Exit;

   QryReversao.First;

   While Not QryReversao.Eof Do
   begin

      If EmprestAcoes.VerExisteOperEmprestimo(QryReversao.FieldByName('DATAOPERACAO').AsDateTime, 0) Then
      begin
         MsgDlg('Existem operações já lançadas. Essa operação será cancelada.','Mensagem do Sistema',mtInformation,[mbOk],0);
         bbtnCancelarClick(Sender);
         Exit;
      end;

      QryReversao.Next;
   end;

  inherited;

   Try

      QryReversao.First;
      While Not QryReversao.Eof Do
      begin
         If QryReversao.FieldByname('TIPOCONFIRMADO').AsString = 'R' Then
         begin
            QryReversao.Next;
            Continue;
         end;

         dDataDiaAtu := pRPI.DATAULTFECHEMP + 1;
         while not DiasUteisInv.DiaUtil(dDataDiaAtu,-1,1,'',True,False,False) Do
            dDataDiaAtu := dDataDiaAtu + 1;   // Achar o proximo dia útil

         If ((QryReversao.FieldByName('FLGREVERSAO').AsString    = 'S') AND
             (QryReversao.FieldByName('DATAVENCOPER').AsDateTime > dDataDiaAtu)) Then
         begin
            If (MsgDlg('Reverte essa operação antes do vencimento?',
                       'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
            begin
               QryReversao.Next;
               Continue;
            end;
         end;

         QryTipoOperacao.Close;
         QryTipoOperacao.ParamByName('IDTIPOOPERACAO').AsInteger := -53;
         QryTipoOperacao.Open;

         I := 1;
         dDataLiq := QryReversao.FieldByName('DATAOPERACAO').AsDateTime;
         While I  <= QryTipoOperacao.FieldByName('VENCIMENTO').AsInteger Do
         Begin
            dDataLiq   := dDataLiq+1;
            While not DiasUteisInv.DiaUtil(dDataLiq,-1,1,'',True,False,False) Do
              dDataLiq := dDataLiq+1;   // Achar o próximo dia útil
            I := I+1;
         End;

         if not dtmBaseDados.dbBaseDados.InTransaction then
             dtmBaseDados.dbBaseDados.StartTransaction;

         iIdOperEmpAcoes := LeUltRegistro(nil, 'OPEREMPACOES');


         If Not EmprestAcoes.GravaOperEmpAcoes(iIdOperEmpAcoes,
                                               QryReversao.FieldByName('IDCUSTODIANTE').AsInteger,
                                               QryReversao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                               QryReversao.FieldByName('IDINVESTIMENTO').AsInteger,
                                               QryReversao.FieldByName('IDTIPOINVEST').AsInteger,
                                               -53,
                                               QryReversao.FieldByName('IDOPEREMPACOES').AsInteger,
                                               -1, -1, -1,
                                               //AL_4
                                               QryReversao.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                               QryReversao.FieldByName('DATAOPERACAO').AsDateTime,
                                               QryReversao.FieldByName('DATAVENCOPER').AsDateTime,
                                               QryReversao.FieldByName('QTDOPERACAO').AsFloat,
                                               QryReversao.FieldByName('PUOPERACAO').AsFloat,
                                               QryReversao.FieldByName('TAXAOPERACAO').AsFloat,
                                               QryReversao.FieldByName('VLROPERACAO').AsFloat,
                                               QryReversao.FieldByName('VLRIR').AsFloat,
                                               QryReversao.FieldByName('VLRRESGATE').AsFloat,
                                               QryReversao.FieldByName('VLRJUROS').AsFloat,
                                               QryReversao.FieldByName('FLGREVERSAO').AsString,
                                               QryReversao.FieldByName('FLGPRECO').AsString,
                                               'R'{Confirmado Emprestimo}) Then
            Raise Exception.Create('Não foi possível incluir a operação.');

         // Grava Histórico
         if not EmprestAcoes.GravaHistEmpAcoes(LeUltRegistro(nil, 'HISTEMPACOES'),
                                               QryReversao.FieldByName('IDCUSTODIANTE').AsInteger,
                                               QryReversao.FieldByName('IDINVESTIMENTO').AsInteger,
                                               -53,
                                               iIdOperEmpAcoes,
                                               QryReversao.FieldByName('IDOPEREMPACOES').AsInteger,
                                               //AL_4
                                               QryReversao.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                               QryReversao.FieldByName('DATAOPERACAO').AsDateTime,
                                               QryReversao.FieldByName('VLROPERACAO').AsFloat,
                                               fSldHist,
                                               QryReversao.FieldByName('QTDOPERACAO').AsFloat,
                                               fSldQtdHist,
                                               QryReversao.FieldByName('NATUREZAOPERACAO').AsString) then
            Raise Exception.Create('Não foi possível incluir o histórico desta operação.');


         // Integra Contabiliza / Financeiro
         iPlanilha  := -1;
         iDocumento := -1;

         //AL_3
         if not EmprestAcoes.IntegraContabCapCar(iIdOperEmpAcoes,
                                                 QryReversao.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 -53,
                                                 pRPI.IDCARTEMPACOES,
                                                 QryTipoOperacao.FieldByName('FLGGERACONTAB').AsInteger,
                                                 QryTipoOperacao.FieldByName('FLGGERACAPCAR').AsInteger,
                                                 QryReversao.FieldByName('IDCUSTODIANTE').AsInteger,
                                                 QryTipoOperacao.FieldByName('CODTIPDOC').AsInteger,
                                                 -1{iTipoDespInvest},
                                                 QryReversao.FieldByName('DESCINVESTIMENTO').AsString,
                                                 'REVERSÃO DO EMPRESTIMO DE AÇÃO / JUROS - '+
                                                 QryReversao.FieldByName('DESCINVESTIMENTO').AsString,
                                                 QryReversao.FieldByName('VLRJUROS').AsFloat,
                                                 0,
                                                 QryReversao.FieldByName('DATAOPERACAO').AsDateTime,
                                                 dDataLiq,
                                                 iPlanilha,
                                                 iDocumento) then
            Raise Exception.Create('Não foi integrar Contábil e Financeiro.');

         if QryReversao.FieldByName('DATAOPERACAO').AsDateTime <= pRPI.DATAULTFECHEMP then
         begin
            dDataAnt := QryReversao.FieldByName('DATAOPERACAO').AsDateTime;
            while not DiasUteisInv.DiaUtil(dDataAnt,-1,1,'',True,False,False) Do
               dDataAnt := dDataAnt - 1;   // Achar o dia útil ANTERIOR

            //AL_2
            //OperComum.AlteraDataFechRV(dDataAnt);
         end;

         if dtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.Commit;

         Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');

         //AL_5
         EmprestAcoes.VerificaSaldoCustodia(QryReversao.FieldByName('DATAOPERACAO').AsDateTime,
                                            QryReversao.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                            QryReversao.FieldByName('IDINVESTIMENTO').AsInteger,
                                            QryReversao.FieldByName('IDCUSTODIANTE').AsInteger,
                                            -1,
                                            fSaldoHist, fSaldoBloq, fSaldoLib, fSaldo);

         fSaldo      := 0;
         fSldQtdHist := QryReversao.FieldByName('QTDOPERACAO').AsFloat;
         bFaz        := True;
         While bFaz Do
         begin
            if not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;

            If ExisteForm(frmCadTransfCarteira) Then
               frmCadTransfCarteira.Free;

            AbrirFormModal(frmCadTransfCarteira, TfrmCadTransfCarteira);

            //AL_5
            EmprestAcoes.VerificaSaldoCustodia(dDataReversao.Date,
                                               QryReversao.FieldByName('IDINVESTIMENTO').AsInteger,
                                               QryReversao.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                               QryReversao.FieldByName('IDCUSTODIANTE').AsInteger,
                                               -1,
                                               fSaldoHist, fSaldoBloq, fSaldoLib, fSaldo);

            fSaldo     := fSaldoBloq - fSaldoHist;

            If (fSaldo > fSldQtdHist) Or (fSaldo = 0) Then
            begin
                If MsgDlg('Existe Saldo na Carteira de Empréstimo para esse Investimento!' + #13 +
                          'Deseja continuar a Transferir?','Mensagem ',mtInformation,
                  [mbYes, mbNo],0) = mrNo  Then
                   bFaz := False;
            end
            Else
               bFaz := False;
         End;

         QryReversao.Next;
      End;

      dDataReversao.Date   := pRPI.DATAULTFECHEMP;
      while not DiasUteisInv.DiaUtil(dDataReversao.Date,-1,1,'',True,False,False) Do
         dDataReversao.Date := dDataReversao.Date + 1;   // Achar o proximo dia útil


      AbreQuery;

      MsgDlg('Operação concluída com Sucesso!', 'Mensagem do Sistema', mtInformation ,[MbOk],0);

      If QryReversao.IsEmpty Then
      begin
         RgOperacao.ItemIndex   := 0;
         RgOperacaoClick(Sender);
      end;

   Except
      on E:Exception do
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Na operação de '+QryReversao.FieldByName('TIPOOPER').AsString+' ocorreu problema :'+ #13 +
                E.Message, 'Mensagem do Sistema', MtError,[MbOk],0);
      end;
   End;
end;

procedure TFrmCadConfirmaReversao.RgOperacaoClick(Sender: TObject);
begin
  inherited;
   If RgOperacao.ItemIndex   = 0 Then
   begin
      PnlSaldoEmp.Caption   := 'Operações Confirmadas';
      BtExcluir.Enabled     := True;
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := False;
   end
   Else
   begin
      PnlSaldoEmp.Caption   := 'Operações a Confirmar';
      BtExcluir.Enabled     := False;
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
   end;

   AbreQuery;

end;

procedure TFrmCadConfirmaReversao.dblInvestimentoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

   If modified Then
      AtualizaGrid;
end;

procedure TFrmCadConfirmaReversao.BtExcluirClick(Sender: TObject);
Var
   dDataAnt : TDateTime;
begin

  inherited;

  If QryReversao.IsEmpty then
     Exit;

  If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
            [mbYes, mbNo],0) = mrYes  Then
  Begin

    Try

       MontaSelect.Filtro.Clear;
       MontaSelect.Filtro.Add('OPERCUSTODIA.IDINVESTIMENTO    = INVESTIMENTO.IDINVESTIMENTO');
       MontaSelect.Filtro.Add('OPERCUSTODIA.IDCARTEIRAORIG   <> OPERCUSTODIA.IDCARTEIRADEST');
       MontaSelect.Filtro.Add('OPERCUSTODIA.IDCARTEIRAORIG    = CARTEIRAINVEST.IDCARTEIRAINVEST');
       MontaSelect.Filtro.Add('OPERCUSTODIA.IDCARTEIRAORIG    = '+IntToStr(pRPI.IDCARTEMPACOES));
       MontaSelect.Filtro.Add('OPERCUSTODIA.IDINVESTIMENTO    = '+
                   QryReversao.FieldByname('IDINVESTIMENTO').AsString+'');
       MontaSelect.Filtro.Add('OPERCUSTODIA.DATAMOVCUSTOD     = TO_DATE('''+
                                 dDataReversao.Text+''',''DD/MM/YYYY'')');
       MontaSelect.Filtro.Add('OPERCUSTODIA.QUANTIDADE        = '+
                      QryReversao.FieldByname('QTDOPERACAO').AsString+'');
       MontaSelect.Executar;

       if not dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.StartTransaction;

       if MontaSelect.RetornouValor then
       begin
          if StrToDate(MontaSelect.ValoresChave[5]) <= pRPI.DATAULTFECHEMP then
          begin
             if MsgDlg('Para excluir a operação, será necessário'+#13+
                       'reprocessar o Sistema. Confirma a exclusão ?','Atenção',mtConfirmation,[mbYes, mbNo],0) = mrNo then
                Abort;
          end;

          // Verifica se Pode transferir quando for Carteira de Empréstimo de Ações
          //AL_5
          if not EmprestAcoes.VerificaTransfEmptmoAcoes(StrToInt(MontaSelect.ValoresChave[13]),
                                                        StrToInt(MontaSelect.ValoresChave[11]),
                                                        StrToInt(MontaSelect.ValoresChave[10]),
                                                        StrToInt(MontaSelect.ValoresChave[6]),
                                                        StrToFloat(MontaSelect.ValoresChave[12]),
                                                        MontaSelect.ValoresChave[5]) then
             Abort;


          if not OperComum.ProcExcluiCustodia(StrToInt(MontaSelect.ValoresChave[0]),
                                              StrToInt(MontaSelect.ValoresChave[3]),
                                              StrToInt(MontaSelect.ValoresChave[4]),
                                              StrToDate(MontaSelect.ValoresChave[5])) Then
             Abort;

       end;


       if not EmprestAcoes.ExcluiOperEmpAcoes(QryReversao.FieldByName('IDOPEREMPACOES').AsInteger,
                                              QryReversao.FieldByName('IDOPEREMPACOESAP').AsInteger,
                                              QryReversao.FieldByName('DATAOPERACAO').AsDateTime, 'RES') then
          Abort;

       OperComum.LimpaParametros(QryUpdConfirEmpr);
       QryUpdConfirEmpr.ParamByName('IDOPEREMPACOES').AsInteger :=
                        QryReversao.FieldByName('IDOPEREMPACOESAP').AsInteger;
       QryUpdConfirEmpr.ExecSQL;

       if QryReversao.FieldByName('DATAOPERACAO').AsDateTime <= pRPI.DATAULTFECHEMP then
       begin
          dDataAnt := QryReversao.FieldByName('DATAOPERACAO').AsDateTime;
          while not DiasUteisInv.DiaUtil(dDataAnt,-1,1,'',True,False,False) Do
             dDataAnt := dDataAnt - 1;   // Achar o dia útil ANTERIOR

          //AL_2
          //OperComum.AlteraDataFechRV(dDataAnt);
       end;

       DtmBaseDados.dbBaseDados.Commit;

       Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');

       MsgDlg('Operação Concluída com Sucesso.','Mensagem do Sistema',mtInformation,[mbOk],0);

       dDataReversao.Date   := pRPI.DATAULTFECHEMP;
       while not DiasUteisInv.DiaUtil(dDataReversao.Date,-1,1,'',True,False,False) Do
          dDataReversao.Date := dDataReversao.Date + 1;   // Achar o proximo dia útil

       AbreQuery;       

       If QryReversao.IsEmpty Then
       begin
          If RgOperacao.ItemIndex  = 0 Then
             RgOperacao.ItemIndex := 1
          Else
             RgOperacao.ItemIndex := 0;

          AbreQuery;
       end;

    except
       on E:Exception do
       begin
          DtmBaseDados.dbBaseDados.Rollback;
          MsgDlg('Não foi Possível Excluir a Operação.' + #13 +
                  E.Message,'Mensagem do Sistema',mtError,[mbOk],0);
       end;
    end;

  End;

  BtExcluir.Down := False;

end;

procedure TFrmCadConfirmaReversao.DbgOperReversaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   If (Key = 27) Or (Key = 9) Then
      Key := 0;
end;

procedure TFrmCadConfirmaReversao.DbgOperReversaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   If (Key = 27) Or (Key = 9) Then
      Key := 0;
end;

procedure TFrmCadConfirmaReversao.DbgOperReversaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  If Key = Chr(VK_TAB) Then
     Key := #00;
end;

procedure TFrmCadConfirmaReversao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   AtualizaGrid;
end;

function TFrmCadConfirmaReversao.VerificaRevFut(iIdOperEmpAcoes : Integer;
                                                dDataOperacao   : TDateTime) : Boolean;
begin
   QryVerOperRevertida.Close;
   QryVerOperRevertida.ParamByName('IDOPEREMPACOESAP').AsInteger := iIdOperEmpAcoes;
   QryVerOperRevertida.ParamByName('DATAOPERACAO').AsDateTime    := dDataOperacao;
   QryVerOperRevertida.Open;
   If Not QryVerOperRevertida.IsEmpty Then
      Result := True
   else
      Result := False;
   QryVerOperRevertida.Close;            
end;

end.



