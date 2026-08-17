//******************************************************************************
// Autor     : Marco Turon
// Data      : 21/09/2007
// Código    : AL_4
// Pendencia : 26357
// SOL       : 69119
// Desc      : Ajuste para: Empréstimo de Ações (Segregação Plano / Patro)   
//******************************************************************************
// Autor     : Fabio Fagundes
// Data      : 20/10/2006
// Código    : AL_3
// Pendencia : 22982
// SOL       :
// Desc      : Implementacao Plano e Patro (QryInsOperEmpAcoes)
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
//Query 	  : QryEmprestimo,QryCustodiante
//Motivo(S)       : Passado o Active da qry para 'False'
//******************************************************************************

unit FCadConfirmaEmprestimo;
                                          
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, Grids,
  Wwdbigrd, Wwdbgrid, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, MontaSelect;

type
  TFrmCadConfirmaEmprestimo = class(TfrmOkCancelarInv)
    PnlSelecao: TPanel;
    PnlGrid: TPanel;
    DbgOperEmprestimo: TwwDBGrid;
    PnlSaldoEmp: TPanel;
    QryEmprestimo: TwwQuery;
    DsEmprestimo: TwwDataSource;
    QryEmprestimoDESCINVESTIMENTO: TStringField;
    QryEmprestimoDATAOPERACAO: TDateTimeField;
    s: TDateTimeField;
    QryEmprestimoPUOPERACAO: TFloatField;
    QryEmprestimoTAXAOPERACAO: TFloatField;
    QryEmprestimoVLRJUROS: TFloatField;
    QryEmprestimoFLGREVERSAO: TStringField;
    QryEmprestimoTIPOOPER: TStringField;
    UpdEmprestimo: TUpdateSQL;
    QryEmprestimoVLRRESGATE: TFloatField;
    QryEmprestimoIDOPEREMPACOES: TFloatField;
    QryEmprestimoIDOPEREMPACOESAP: TFloatField;
    QryEmprestimoIDINVESTIMENTO: TFloatField;
    QryEmprestimoVLROPERACAO: TFloatField;
    QryEmprestimoQTDOPERACAO: TFloatField;
    QryEmprestimoIDCUSTODIANTE: TFloatField;
    QryEmprestimoIDTIPOOPERACAO: TFloatField;
    QryEmprestimoNATUREZAOPERACAO: TStringField;
    QryEmprestimoVENCIMENTO: TFloatField;
    QryEmprestimoDESCTIPOOPERACAO: TStringField;
    QryEmprestimoFLGGERACONTAB: TFloatField;
    QryEmprestimoFLGGERACAPCAR: TFloatField;
    QryEmprestimoCODTIPDOC: TFloatField;
    QryEmprestimoIDCARTEIRAINVEST: TFloatField;
    QryEmprestimoIDTIPOINVEST: TFloatField;
    QryEmprestimoVLRIR: TFloatField;
    QryEmprestimoFLGPRECO: TStringField;
    QryEmprestimoTRGDTINCLUSAO: TDateTimeField;
    QryEmprestimoTRGUSERINCLUSAO: TStringField;
    QryEmprestimoCODDOCUMENTO: TFloatField;
    QryEmprestimoPLNCODIGO: TFloatField;
    QryEmprestimoPLANO: TFloatField;
    QryEmprestimoTIPOCONFIRMADO: TStringField;
    QryEmprestimoCOLOR: TFloatField;
    dDataEmprestimo: TCMDateTimePicker;
    Label1: TLabel;
    QryInvestimento: TwwQuery;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    dblInvestimento: TwwDBLookupCombo;
    lblInvestimento: TLabel;
    RgOperacao: TRadioGroup;
    QryEmprestimoDESCCARTINVEST: TStringField;
    QryCustodiante: TwwQuery;
    QryCustodianteSGLCUSTODIANTE: TStringField;
    QryCustodianteIDCUSTODIANTE: TFloatField;
    dblCustodiante: TwwDBLookupCombo;
    QryEmprestimoSGLCUSTODIANTE: TStringField;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtExcluir: TSpeedButton;
    MontaSelect: TMontaSelect;
    QryUpdConfirEmpr: TwwQuery;
    QryVerOperRevertida: TwwQuery;
    QryEmprestimoIDPLANPREVCTBPATR: TFloatField;
    procedure dDataEmprestimoExit(Sender: TObject);
    procedure dDataEmprestimoCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblInvestimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure RgOperacaoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DbgOperEmprestimoKeyPress(Sender: TObject; var Key: Char);
    procedure QryEmprestimoBeforePost(DataSet: TDataSet);
    procedure BtExcluirClick(Sender: TObject);
    procedure DbgOperEmprestimoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbgOperEmprestimoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbreQuery;
    procedure AtualizaGrid;
    function  VerificaOperRevertida(iIdOperEmpAcoes : Integer) : Boolean;        

  public
    { Public declarations }
    bFormConfEmpr : Boolean;
    fSaldo, fSaldoHist, fSaldoBloq, fSaldoLib, fSldHist, fSldQtdHist : Double;    
  end;

var
  FrmCadConfirmaEmprestimo: TFrmCadConfirmaEmprestimo;

implementation

uses UOperComum, UOperacaoInvest, UBibliotecaInvest, uEmprestAcoes, FTelaAut,
     dEmprestAcoes, UMensErro, dBaseDados, UDataBase, USistema,
     UDiasUteisInv, FCadTransfCarteira;

{$R *.DFM}

procedure TFrmCadConfirmaEmprestimo.AbreQuery;
var
   fSldHist, fSldQtdHist : Double;
   iPos : Integer;
   sSql : String;
begin

   dblCustodiante.Enabled   := True;
   QryEmprestimo.FieldByName('SGLCUSTODIANTE').ReadOnly   := False;
   QryEmprestimo.FieldByName('FLGREVERSAO').ReadOnly      := False;
   QryEmprestimo.FieldByName('TIPOCONFIRMADO').ReadOnly   := False;
   QryEmprestimo.FieldByName('DESCINVESTIMENTO').ReadOnly := False;
   QryEmprestimo.FieldByName('DATAOPERACAO').ReadOnly     := False;
   QryEmprestimo.FieldByName('DATAVENCOPER').ReadOnly     := False;
   QryEmprestimo.FieldByName('PUOPERACAO').ReadOnly       := False;
   QryEmprestimo.FieldByName('QTDOPERACAO').ReadOnly      := False;
   QryEmprestimo.FieldByName('TAXAOPERACAO').ReadOnly     := False;
   QryEmprestimo.FieldByName('VLRJUROS').ReadOnly         := False;   

   sSql := QryEmprestimo.SQL.Text;
   iPos := pos('AND TIPOCONFIRMADO', sSql);
   if iPos > 1 then begin
      Delete(sSql, iPos, 40);
      QryEmprestimo.SQL.Text := sSql;
   end;

   OperComum.LimpaParametros(QryEmprestimo);
   QryEmprestimo.ParamByName('DATA').AsDateTime             := dDataEmprestimo.Date;

   If dblInvestimento.Text <> '' Then
      QryEmprestimo.ParamByName('IDINVESTIMENTO').AsInteger :=
                    qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger
   Else
      QryEmprestimo.ParamByName('IDINVESTIMENTO').Clear;

   If RgOperacao.ItemIndex      = 0 Then
   Begin
      BtExcluir.Enabled        := True;
      QryEmprestimo.SQL.Add('AND TIPOCONFIRMADO IN (''S'',''E'')');
   end
   Else If RgOperacao.ItemIndex = 1  Then
   Begin
      BtExcluir.Enabled        := False;
      QryEmprestimo.SQL.Add('AND TIPOCONFIRMADO = ''N''');
   end;

   QryEmprestimo.Open;

   QryEmprestimo.DisableControls;
   QryEmprestimo.First;

   If Not QryEmprestimo.IsEmpty Then
   begin
      DbgOperEmprestimo.Options := DbgOperEmprestimo.Options + [TwwDBgridOption(dgEditing)];
      While Not QryEmprestimo.Eof Do
      begin
         QryEmprestimo.Edit;
         // Busca o saldo de Empréstimos de Ações não Vencidos
         EmprestAcoes.BuscaSaldosHist(dDataEmprestimo.Date,
                                      QryEmprestimo.FieldByName('IDINVESTIMENTO').AsInteger,
                                      QryEmprestimo.FieldByName('IDOPEREMPACOESAP').AsInteger,
                                      QryEmprestimo.FieldByName('IDOPEREMPACOES').AsInteger,
                                      //AL_3
                                      QryEmprestimo.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                      fSldHist,fSldQtdHist);

         QryEmprestimo.FieldByName('VLRJUROS').AsFloat        :=
                      (QryEmprestimo.FieldByName('VLRRESGATE').AsFloat -
                                     QryEmprestimo.FieldByName('VLROPERACAO').AsFloat);

         If QryEmprestimo.FieldByName('TIPOCONFIRMADO').AsString  = 'S' Then
            QryEmprestimo.FieldByName('TIPOCONFIRMADO').AsString := 'E';

         QryEmprestimo.Post;
         QryEmprestimo.Next;
      end;
      QryEmprestimo.First;
   end
   Else
     DbgOperEmprestimo.Options := DbgOperEmprestimo.Options - [TwwDBgridOption(dgEditing)];

   QryEmprestimo.EnableControls;

   If RgOperacao.ItemIndex      = 0 Then
   begin
      QryEmprestimo.FieldByName('SGLCUSTODIANTE').ReadOnly:= True;
      dblCustodiante.Enabled := False;
   end;
   QryEmprestimo.FieldByName('FLGREVERSAO').ReadOnly      := True;
   QryEmprestimo.FieldByName('TIPOCONFIRMADO').ReadOnly   := True;
   QryEmprestimo.FieldByName('DESCINVESTIMENTO').ReadOnly := True;
   QryEmprestimo.FieldByName('DATAOPERACAO').ReadOnly     := True;
   QryEmprestimo.FieldByName('DATAVENCOPER').ReadOnly     := True;
   QryEmprestimo.FieldByName('PUOPERACAO').ReadOnly       := True;
   QryEmprestimo.FieldByName('QTDOPERACAO').ReadOnly      := True;
   QryEmprestimo.FieldByName('TAXAOPERACAO').ReadOnly     := True;
   QryEmprestimo.FieldByName('VLRJUROS').ReadOnly         := True;

   DbgOperEmprestimo.SetFocus;

end;

procedure TFrmCadConfirmaEmprestimo.AtualizaGrid;
begin
   AbreQuery;

   If QryEmprestimo.IsEmpty Then
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

procedure TFrmCadConfirmaEmprestimo.dDataEmprestimoExit(Sender: TObject);
begin
  inherited;
   AtualizaGrid;
end;

procedure TFrmCadConfirmaEmprestimo.dDataEmprestimoCloseUp(Sender: TObject);
begin
  inherited;
    AtualizaGrid;
end;

procedure TFrmCadConfirmaEmprestimo.FormShow(Sender: TObject);
begin
  inherited;
   dDataEmprestimo.Date   := pRPI.DATAULTFECHEMP + 1;
   while not DiasUteisInv.DiaUtil(dDataEmprestimo.Date,-1,1,'',True,False,False) Do
     dDataEmprestimo.Date := dDataEmprestimo.Date + 1;   // Achar o proximo dia útil

   QryInvestimento.Close;
   QryInvestimento.Open;

   QryCustodiante.Close;
   QryCustodiante.Open;

   AtualizaGrid;

end;

procedure TFrmCadConfirmaEmprestimo.bbtnConfirmarClick(Sender: TObject);
var
   dDataAnt, dDataVenc, dDataLiq      : TDateTime;
   I, iPlanilha, iDocumento : Integer;
   bFaz                     : Boolean;    
begin

   If QryEmprestimo.IsEmpty Then
      Exit;

   bFormConfEmpr := True;

  inherited;

   Try
      QryEmprestimo.First;
      While Not QryEmprestimo.Eof Do
      begin
         If QryEmprestimo.FieldByname('TIPOCONFIRMADO').AsString = 'E' Then
         begin
            QryEmprestimo.Next;
            Continue;
         end;

         If QryEmprestimo.FieldByname('IDCUSTODIANTE').AsInteger = 0 Then
         begin
            MsgDlg('Falta indicar o Custodiante!','Mensagem do Sistema', mtInformation ,[MbOk],0);
            DbgOperEmprestimo.SetFocus;
            Exit;
         end;

         fSaldoHist := 0;
         fSaldoBloq := 0;
         fSaldoLib  := 0;
         fSaldo     := 0;

         //AL_4
         EmprestAcoes.VerificaSaldoCustodia(dDataEmprestimo.Date,
                                            QryEmprestimo.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                            QryEmprestimo.FieldByName('IDINVESTIMENTO').AsInteger,
                                            QryEmprestimo.FieldByName('IDCUSTODIANTE').AsInteger,
                                            -1,
                                            fSaldoHist, fSaldoBloq, fSaldoLib, fSaldo);

         fSaldo      := fSaldoBloq - fSaldoHist;
         fSldHist    := QryEmprestimo.FieldByName('VLROPERACAO').AsFloat;
         fSldQtdHist := QryEmprestimo.FieldByName('QTDOPERACAO').AsFloat;

         If (fSaldo < 0) Then
         begin
            fSaldo   := 0;
            If ExisteForm(frmCadTransfCarteira) Then
               frmCadTransfCarteira.Free;
            AbrirFormModal(frmCadTransfCarteira, TfrmCadTransfCarteira);
         end;

         bFaz          := True;     
         While bFaz Do
         begin
            if not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;

            fSaldoHist := 0;
            fSaldoBloq := 0;
            fSaldoLib  := 0;
            fSaldo     := 0;

            //AL_4
            EmprestAcoes.VerificaSaldoCustodia(dDataEmprestimo.Date,
                                               QryEmprestimo.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                               QryEmprestimo.FieldByName('IDINVESTIMENTO').AsInteger,
                                               QryEmprestimo.FieldByName('IDCUSTODIANTE').AsInteger,
                                               -1,
                                               fSaldoHist, fSaldoBloq, fSaldoLib, fSaldo);

            fSaldo     := fSaldoBloq - fSaldoHist;

            If (fSaldo < 0) Or (fSaldoBloq = 0) Then
            begin
               fSaldo := 0;
               If ExisteForm(frmCadTransfCarteira) Then
                  frmCadTransfCarteira.Free;

               AbrirFormModal(frmCadTransfCarteira, TfrmCadTransfCarteira);

               //AL_4
               EmprestAcoes.VerificaSaldoCustodia(dDataEmprestimo.Date,
                                                  QryEmprestimo.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                  QryEmprestimo.FieldByName('IDINVESTIMENTO').AsInteger,
                                                  QryEmprestimo.FieldByName('IDCUSTODIANTE').AsInteger,
                                                  -1,
                                                  fSaldoHist, fSaldoBloq, fSaldoLib, fSaldo);

               fSaldo     := fSaldoBloq - fSaldoHist;

               If (fSaldo < 0) Then
               begin
                  If MsgDlg('O Saldo na Carteira de Empréstimo não é suficiente para essa operação!' + #13 +
                            'Deseja continuar a Transferir?','Mensagem ',mtInformation,
                     [mbYes, mbNo],0) = mrNo  Then
                     bFaz := False;
               end
               Else
                  bFaz := False;
            End
            Else
               bFaz := False;
         End;

         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         QryEmprestimo.Edit;
         QryEmprestimo.FieldByName('IDOPEREMPACOESAP').AsInteger := 0;

         If QryEmprestimo.FieldByName('IDOPEREMPACOESAP').AsInteger  = 0 Then
            QryEmprestimo.FieldByName('IDOPEREMPACOESAP').AsInteger :=
                        QryEmprestimo.FieldByName('IDOPEREMPACOES').AsInteger;

         QryEmprestimo.FieldByName('TIPOCONFIRMADO').ReadOnly   := False;
         QryEmprestimo.FieldByName('TIPOCONFIRMADO').AsString   := 'E';
         QryEmprestimo.FieldByName('TIPOCONFIRMADO').ReadOnly   := True;

         QryEmprestimo.Post;
         QryEmprestimo.CommitUpdates;

         // Grava Histórico
         if not EmprestAcoes.GravaHistEmpAcoes(LeUltRegistro(nil, 'HISTEMPACOES'),
                                               QryEmprestimo.FieldByName('IDCUSTODIANTE').AsInteger,
                                               QryEmprestimo.FieldByName('IDINVESTIMENTO').AsInteger,
                                               QryEmprestimo.FieldByName('IDTIPOOPERACAO').AsInteger,
                                               QryEmprestimo.FieldByName('IDOPEREMPACOES').AsInteger,
                                               QryEmprestimo.FieldByName('IDOPEREMPACOESAP').AsInteger,
                                               //AL_3
                                               QryEmprestimo.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                               QryEmprestimo.FieldByName('DATAOPERACAO').AsDateTime,
                                               QryEmprestimo.FieldByName('VLROPERACAO').AsFloat,
                                               fSldHist,
                                               QryEmprestimo.FieldByName('QTDOPERACAO').AsFloat,
                                               fSldQtdHist,
                                               QryEmprestimo.FieldByName('NATUREZAOPERACAO').AsString) then
            Raise Exception.Create('Não foi possível incluir o histórico desta operação.');

         if QryEmprestimo.FieldByName('DATAOPERACAO').AsDateTime <= pRPI.DATAULTFECHEMP then
         begin
            dDataAnt := QryEmprestimo.FieldByName('DATAOPERACAO').AsDateTime;
            while not DiasUteisInv.DiaUtil(dDataAnt,-1,1,'',True,False,False) Do
               dDataAnt := dDataAnt - 1;   // Achar o dia útil ANTERIOR

            //AL_2
            //OperComum.AlteraDataFechRV(dDataAnt);
         end;            

         DtmBaseDados.dbBaseDados.Commit;

         QryEmprestimo.Next;
      End;

      Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');

      MsgDlg('Operação concluída com Sucesso!', 'Mensagem do Sistema', mtConfirmation ,[MbOk],0);

      dDataEmprestimo.Date   := pRPI.DATAULTFECHEMP;
      while not DiasUteisInv.DiaUtil(dDataEmprestimo.Date,-1,1,'',True,False,False) Do
         dDataEmprestimo.Date := dDataEmprestimo.Date + 1;   // Achar o proximo dia útil

      AbreQuery;      

      If QryEmprestimo.IsEmpty Then
      begin
         RgOperacao.ItemIndex   := 0;
         RgOperacaoClick(Sender);
      end;

   Except
      on E:Exception do
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Na operação de '+QryEmprestimo.FieldByName('TIPOOPER').AsString+' ocorreu problema :'+ #13 +
                E.Message, 'Mensagem do Sistema', MtError,[MbOk],0);
      end;
   End;

end;

procedure TFrmCadConfirmaEmprestimo.dblInvestimentoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
    If modified Then
       AtualizaGrid;
end;

procedure TFrmCadConfirmaEmprestimo.RgOperacaoClick(Sender: TObject);
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

procedure TFrmCadConfirmaEmprestimo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
   QryEmprestimo.Close;
   QryCustodiante.Close;
   QryInvestimento.Close;
end;

procedure TFrmCadConfirmaEmprestimo.DbgOperEmprestimoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  If Key = Chr(VK_TAB) Then
     Key := #00;
end;

procedure TFrmCadConfirmaEmprestimo.QryEmprestimoBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  If QryEmprestimo.FieldByName('IDOPEREMPACOES').AsInteger = 0 Then
     SysUtils.Abort;
end;

procedure TFrmCadConfirmaEmprestimo.BtExcluirClick(Sender: TObject);
Var
   dDataRef : TDateTime;
   iPos     : Integer;
   sSql     : String;
begin

  inherited;

  If QryEmprestimo.IsEmpty then
     Exit;

  If VerificaOperRevertida(QryEmprestimo.FieldByName('IDOPEREMPACOES').AsInteger) Then
  begin
     MsgDlg('Operação de Empréstimo já Revertida. Não pode excluir.','Mensagem do Sistema',mtConfirmation,[mbOk],0);
     Exit;
  end;

  If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
            [mbYes, mbNo],0) = mrYes  Then
  Begin

    Try
       MontaSelect.Filtro.Clear;
       MontaSelect.Filtro.Add('OPERCUSTODIA.IDINVESTIMENTO    = INVESTIMENTO.IDINVESTIMENTO');
       MontaSelect.Filtro.Add('OPERCUSTODIA.IDCARTEIRAORIG   <> OPERCUSTODIA.IDCARTEIRADEST');
       MontaSelect.Filtro.Add('OPERCUSTODIA.IDCARTEIRAORIG    = CARTEIRAINVEST.IDCARTEIRAINVEST');
       MontaSelect.Filtro.Add('OPERCUSTODIA.IDCARTEIRAORIG   <> '+IntToStr(pRPI.IDCARTEMPACOES));
       MontaSelect.Filtro.Add('OPERCUSTODIA.IDINVESTIMENTO    = '+
                   QryEmprestimo.FieldByname('IDINVESTIMENTO').AsString+'');
       MontaSelect.Filtro.Add('OPERCUSTODIA.DATAMOVCUSTOD     = TO_DATE('''+
                                 dDataEmprestimo.Text+''',''DD/MM/YYYY'')');
       MontaSelect.Filtro.Add('OPERCUSTODIA.QUANTIDADE        = '+
                      QryEmprestimo.FieldByname('QTDOPERACAO').AsString+'');
       MontaSelect.Executar;

       if not dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.StartTransaction;

       if MontaSelect.RetornouValor then
       begin
          if StrToDate(MontaSelect.ValoresChave[5]) <= pRPI.DATAULTFECH then
          begin
             if MsgDlg('Para excluir a operação, será necessário'+#13+
                       'reprocessar o Sistema. Confirma a exclusão ?','Atenção',mtConfirmation,[mbYes, mbNo],0) = mrNo then
                Abort;
          end;

          // Verifica se Pode transferir quando for Carteira de Empréstimo de Ações
          //AL_4
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

       OperComum.LimpaParametros(QryUpdConfirEmpr);
       QryUpdConfirEmpr.ParamByName('IDOPEREMPACOES').AsInteger :=
                        QryEmprestimo.FieldByName('IDOPEREMPACOESAP').AsInteger;
       QryUpdConfirEmpr.ExecSQL;

       dDataRef := dDataEmprestimo.Date - 1;
       while not DiasUteisInv.DiaUtil(dDataRef,-1,1,'',True,False,False) Do
          dDataRef  := dDataRef - 1;   // Achar o dia útil anterior

       //AL_2
       //OperComum.AlteraDataFechRV(dDataRef);

       DtmBaseDados.dbBaseDados.Commit;

       AbreQuery;

       MsgDlg('Operação Concluída com Sucesso.','Mensagem do Sistema',mtConfirmation,[mbOk],0);

       If QryEmprestimo.IsEmpty Then
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

function  TFrmCadConfirmaEmprestimo.VerificaOperRevertida(iIdOperEmpAcoes : Integer) : Boolean;
begin
   QryVerOperRevertida.Close;
   QryVerOperRevertida.ParamByName('IDOPEREMPACOESAP').AsInteger := iIdOperEmpAcoes;
   QryVerOperRevertida.Open;
   If Not QryVerOperRevertida.IsEmpty Then
      Result := True
   Else
      Result := False;
end;

procedure TFrmCadConfirmaEmprestimo.DbgOperEmprestimoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
   If (Key = 27) Or (Key = 9) Then
      Key := 0;
end;

procedure TFrmCadConfirmaEmprestimo.DbgOperEmprestimoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   If (Key = 27) Or (Key = 9) Then
      Key := 0;
end;

procedure TFrmCadConfirmaEmprestimo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   AtualizaGrid;
end;

end.




