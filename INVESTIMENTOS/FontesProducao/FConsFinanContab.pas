//******************************************************************************
// Autor     : Marco Turon
// Data      : 20/03/2007
// Código    : AL_3
// Pendencia : 24774
// SOL       : 55877
// Desc      : Liga/Desliga a integração contabil financeira por módulo
//******************************************************************************
// Autor     : Marco Turon
// Data      : 06/12/2006
// Código    : AL_2
// Pendencia : 23674
// SOL       : 45954
// Desc      : Segregação de Recursos
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 08/03/2005
// Código   : AL_1
// Motivo   : Passa a não excluir a Planilha e sim Zerar os valores na Lancamento
//            Incluído a qryAux no Form
//******************************************************************************

unit FConsFinanContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid;

type
  TFrmConsFinanContab = class(TfrmCadastroCSInv)
    PnlFinanc: TPanel;
    PnlContab: TPanel;
    DbgFinanc: TwwDBGrid;
    DbgContab: TwwDBGrid;
    Panel4: TPanel;
    Panel1: TPanel;
    PnlConsulta: TPanel;
    GroupBox1: TGroupBox;
    dDataIni: TCMDateTimePicker;
    Label1: TLabel;
    dDataFim: TCMDateTimePicker;
    BtExcFinanc: TSpeedButton;
    BtExcContab: TSpeedButton;
    QryFinanc: TwwQuery;
    DsFinanc: TwwDataSource;
    QryContab: TwwQuery;
    DsContab: TwwDataSource;
    QryFinancDATAEMISSAO: TDateTimeField;
    QryFinancCODDOCUMENTO: TFloatField;
    QryFinancVALOR: TFloatField;
    QryContabPLNDATDIA: TDateTimeField;
    QryContabPLNCODIGO: TFloatField;
    QryContabLACVALOR: TFloatField;
    QryRecbtoPagto: TwwQuery;
    QryLanctoDocum: TwwQuery;
    QryLotexDocum: TwwQuery;
    QryRateioDocum: TwwQuery;
    QryDocumento: TwwQuery;
    QryLancamento: TwwQuery;
    QryPlanilha: TwwQuery;
    QryContabLACHIST1: TStringField;
    QryFinancHISTORICOCOMPL: TStringField;
    BitBtn1: TBitBtn;
    Splitter1: TSplitter;
    qryIRLitigio: TwwQuery;
    qryAux: TwwQuery;
    procedure sbtnApagarClick(Sender: TObject);
    procedure BtExcFinancClick(Sender: TObject);
    procedure BtExcContabClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure AbreQrys;

    Function  ExcluiContabFinac(iPlnCodigo, iCodDocumento : Integer) : Boolean;
    Function  ExcluiFinac(iCodDocumento : Integer)                   : Boolean;
    Function  ExcluiContab(iPlnCodigo   : Integer)                   : Boolean;

  public
    { Public declarations }
  end;

var
  FrmConsFinanContab: TFrmConsFinanContab;

implementation

Uses UOperComum, UMensErro, DBaseDados, uLancContab, uSistema,
  uCtrlInvContab;

{$R *.DFM}

Procedure TFrmConsFinanContab.AbreQrys;
begin
   OperComum.LimpaParametros(QryFinanc);
   QryFinanc.Close;
   QryFinanc.ParamByName('DATAINI').AsString := dDataIni.Text;
   QryFinanc.ParamByName('DATAFIM').AsString := dDataFim.Text;
   QryFinanc.Open;

   OperComum.LimpaParametros(QryContab);
   QryContab.Close;
   QryContab.ParamByName('DATAINI').AsString := dDataIni.Text;
   QryContab.ParamByName('DATAFIM').AsString := dDataFim.Text;
   QryContab.Open;
end;

Function TFrmConsFinanContab.ExcluiContabFinac(iPlnCodigo, iCodDocumento : Integer) : Boolean;
begin
   //Todas as Operações
   Result := False;
   Try
      //Todas as Operações do Financeiro
      If (iCodDocumento = -1) Then
      begin
         QryFinanc.First;
         While Not QryFinanc.Eof Do
         begin
            If Not ExcluiFinac(QryFinanc.FieldByname('CODDOCUMENTO').AsInteger) Then
               Exit;

            QryFinanc.Next;
         end;
      end;
   Except
       on E: Exception do
       begin
          MsgDlg('Erro na Exclusão do Financeiro com a Mensagem: ' + #13 + E.Message,
                 'Mensagem do Sistema ',mtError,[mbOK],0);
          Result := False;
       end;
   end;

   Try
      //Todas as Operações do contabil
      If  (iPlnCodigo = -1) Then
      begin
         QryContab.First;
         While Not QryContab.Eof Do
         begin
            If Not ExcluiContab(QryContab.FieldByname('PLNCODIGO').AsInteger) Then
               Exit;

            QryContab.Next;
         end;
      end;
      Result := True;
   Except
       on E: Exception do
       begin
          MsgDlg('Erro na Exclusão do Contábil com a Mensagem: ' + #13 + E.Message,
                 'Mensagem do Sistema ',mtError,[mbOK],0);
          Result := False;
       end;
   end;

end;

Function TFrmConsFinanContab.ExcluiFinac(iCodDocumento : Integer) : Boolean;
var sTipoExc: String;
begin
   // Exclui Tesouraria
   Result := True;
   if iCodDocumento <> -1 then
   begin
      Try
         //Verifica se foi feito a baixa dessa operação na tesouraria
         OperComum.LimpaParametros(QryRecbtoPagto);
         QryRecbtoPagto.ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;
         QryRecbtoPagto.Open;
         If Not QryRecbtoPagto.EOF Then
         Begin
            MsgDlg('Não é possível excluir essa Operação no Financeiro, esse documento já foi baixado!',
                   'Mensagem do Sistema ',mtError,[mbOK],0);
            QryRecbtoPagto.Close;
            Result := False;
            Exit;
         End;
         QryRecbtoPagto.Close;

         sTipoExc := 'os Lançamentos do Documento';
         OperComum.LimpaParametros(QryLanctoDocum);
         QryLanctoDocum.ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;
         QryLanctoDocum.ExecSQL;

         sTipoExc := 'os Lotes do Documento';
         OperComum.LimpaParametros(QryLotexDocum);
         QryLotexDocum.ParamByName('CODDOCUMENTO').AsInteger  := iCodDocumento;
         QryLotexDocum.ExecSQL;

         sTipoExc := 'o Rateio do Documento';
         OperComum.LimpaParametros(QryRateioDocum);
         QryRateioDocum.ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;
         QryRateioDocum.ExecSQL;

         sTipoExc := 'o Documento';
         OperComum.LimpaParametros(QryDocumento);
         QryDocumento.ParamByName('CODDOCUMENTO').AsInteger   := iCodDocumento;
         QryDocumento.ExecSQL;
      Except
         on E: Exception do
         begin
            MsgDlg('Não foi Possível Excluir ' + sTipoExc + ': ' + IntToStr(iCodDocumento) + #13 +
                   'Erro: ' + E.Message,
                   'Mensagem do Sistema ',mtError,[mbOK],0);
            Result := False;
         end;
      End;
   end;
end;

Function TFrmConsFinanContab.ExcluiContab(iPlnCodigo : Integer) : Boolean;
begin
   // Exclui Contabilidade

   Result := True;
   if iPlnCodigo <> -1 then
   begin

      try
         OperComum.LimpaParametros(qryIRLitigio);
         qryIRLitigio.ParamByName('PLNCODIGO').AsInteger := iPlnCodigo;
         qryIRLitigio.ExecSQL;
      except
         on E: Exception do
         begin
            MsgDlg('Não foi Possível Excluir o IR Litigio da Planilha: ' + IntToStr(iPlnCodigo) + #13 +
                   'Erro: ' + E.Message,
                   'Mensagem do Sistema ',mtError,[mbOK],0);
            Result := False;
         end;
      end;

      //AL_1 Ini
      try
         // Exclui Lançamentos Contábeis da Planilha sem excluir a Planilha
         //AL_2 - Passa a valer a exclusão em 3 camadas
         //AL_3
         if not CtrlInvContab.InvExcluiLanc(iPlnCodigo, 0, CtrlInvContab.UsaPlanoPatro, False, -1) then
            Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis da Planilha ' + IntToStr(iPlnCodigo));

      except on E: Exception do
         begin
            Result := False;
            MsgDlg('Ocorreu um problema na exclusão dos lançamentos Contábeis: '+ #13 +
                   E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         end;
      end;

{      Try
         OperComum.LimpaParametros(QryLancamento);
         QryLancamento.ParamByName('PLNCODIGO').AsInteger := iPlnCodigo;
         QryLancamento.ExecSQL;
      Except
         on E: Exception do
         begin
            MsgDlg('Não foi Possível Excluir os Lançamentos da Planilha: ' + IntToStr(iPlnCodigo) + #13 +
                   'Erro: ' + E.Message,
                   'Mensagem do Sistema ',mtError,[mbOK],0);
            Result := False;
         end;
      End;

      Try
         OperComum.LimpaParametros(QryPlanilha);
         QryPlanilha.ParamByName('PLNCODIGO').AsInteger := iPlnCodigo;
         QryPlanilha.ExecSQL;
      Except
         on E: Exception do
         begin
            MsgDlg('Não foi Possível Excluir a Planilha: ' + IntToStr(iPlnCodigo) + #13 +
                   'Erro: ' + E.Message,
                   'Mensagem do Sistema ',mtError,[mbOK],0);
            Result := False;
         end;
      End;}
      // AL_1 Fim
   end;
end;

procedure TFrmConsFinanContab.sbtnApagarClick(Sender: TObject);
begin
  inherited;
    If (MsgDlg('Excluir TODAS as Operações do Financeiro e Contábil ?',
              'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
        Exit;

    Try
      // Abre a única transação deste processo
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
         DtmBaseDados.dbBaseDados.StartTransaction;

      If Not ExcluiContabFinac(-1,-1) Then
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         Exit;
      end;

      DtmBaseDados.dbBaseDados.Commit;

      AbreQrys;

      MsgDlg('Operação concluída com sucesso.',
                   'Mensagem do Sistema', MtWarning,[MbOk],0);

    Except
       on E: Exception do
       begin
          // Rollbacka Transação
          DtmBaseDados.dbBaseDados.Rollback;
          MsgDlg('Erro: ' + E.Message,
                 'Mensagem do Sistema ',mtError,[mbOK],0);
       end;
    End;

end;

procedure TFrmConsFinanContab.BtExcFinancClick(Sender: TObject);
begin
  inherited;
    Try
      If (MsgDlg('Excluir Todas Operações do Financeiro?',
              'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
      begin
         // Abre a única transação deste processo
         if not(dtmBaseDados.dbBaseDados.InTransaction) then
            DtmBaseDados.dbBaseDados.StartTransaction;

         // Exclui UM lancamento do financeiro
         If Not ExcluiFinac(QryFinanc.FieldByName('CODDOCUMENTO').AsInteger) Then
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end;
      end
      Else
      begin
         // Abre a única transação deste processo
         if not(dtmBaseDados.dbBaseDados.InTransaction) then
            DtmBaseDados.dbBaseDados.StartTransaction;

         // Exclui somente o Financeiro
         If Not ExcluiContabFinac(0,-1) Then
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end;
      end;

      DtmBaseDados.dbBaseDados.Commit;

      AbreQrys;

      MsgDlg('Operação concluída com sucesso.',
                   'Mensagem do Sistema', MtWarning,[MbOk],0);

    Except
       on E: Exception do
       begin
          // Rollbacka Transação
          DtmBaseDados.dbBaseDados.Rollback;
          MsgDlg('Erro: ' + E.Message,
                 'Mensagem do Sistema ', mtError,[mbOK],0);
       end;
    End;
end;

procedure TFrmConsFinanContab.BtExcContabClick(Sender: TObject);
begin
  inherited;
    Try
      If (MsgDlg('Excluir Todas Operações do Contábil?',
              'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
      begin
         // Abre a única transação deste processo
         if not(dtmBaseDados.dbBaseDados.InTransaction) then
            DtmBaseDados.dbBaseDados.StartTransaction;

         // Exclui UMA planilha
         If Not ExcluiContab(QryContab.FieldByName('PLNCODIGO').AsInteger) Then
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end;
      end
      Else
      begin
         // Abre a única transação deste processo
         if not(dtmBaseDados.dbBaseDados.InTransaction) then
            DtmBaseDados.dbBaseDados.StartTransaction;

         // Exclui somente o Contábil
         If Not ExcluiContabFinac(-1,0) Then
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end;
      end;

      DtmBaseDados.dbBaseDados.Commit;

      AbreQrys;

      MsgDlg('Operação concluída com sucesso.',
                   'Mensagem do Sistema', MtWarning,[MbOk],0);


    Except
       on E: Exception do
       begin
          // Rollbacka Transação
          DtmBaseDados.dbBaseDados.Rollback;
          MsgDlg('Erro: ' + E.Message,
                 'Mensagem do Sistema ',mtError,[mbOK],0);
       end;
    End;
end;

procedure TFrmConsFinanContab.FormActivate(Sender: TObject);
begin
  inherited;
   sbtnApagar.Enabled := True;
   pnlFundo.Enabled   := True;
end;

procedure TFrmConsFinanContab.FormShow(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled := True;
   dDataIni.Date    := date;
   dDataFim.Date    := date;
   dDataIni.SetFocus;
   
//   PnlFinanc.Width  := ROUND((FrmConsFinanContab.Width - 22)/2);
end;

procedure TFrmConsFinanContab.bbtnSairClick(Sender: TObject);
begin
  inherited;
  Qry.Close;
  QryFinanc.Close;
  QryContab.Close;
end;

procedure TFrmConsFinanContab.BitBtn1Click(Sender: TObject);
begin
  inherited;
  AbreQrys;
end;

end.


