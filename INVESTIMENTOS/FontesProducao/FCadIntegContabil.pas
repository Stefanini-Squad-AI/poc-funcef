unit FCadIntegContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, cmseldlg, wwDialog, wwidlg, ImgList, Db, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, DBCtrls, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, ExtCtrls, DBTables, Wwquery, UOperacaoInvest, MontaSelect;

type
  TFrmCadIntegContabil = class(TfrmCadastro)
    dbdDta: TCMDateTimePicker;
    Label1: TLabel;
    QryRegAtualizacao: TwwQuery;
    qryConsCartRendVar: TwwQuery;
    qryConsCartRendVarIDCARTEIRAINVEST: TFloatField;
    qryConsCartRendVarIDINVESTIMENTO: TFloatField;
    qryConsCartRendVarIDLOTE: TStringField;
    qryConsCartRendVarQTDE: TFloatField;
    qryConsCartRendVarSALDO: TFloatField;
    qryConsCartRendVarQTDEANTERIOR: TFloatField;
    qryConsCartRendVarSALDOANTERIOR: TFloatField;
    qryConsCartRendVarIDTIPOINVEST: TFloatField;
    MontaSelect: TMontaSelect;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbdDtaExit(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
     function ExcluiContabil  : Boolean;
     function IntegraContabil : Boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadIntegContabil: TFrmCadIntegContabil;

implementation

uses DBaseDados, fAguarde, dOperComum, UmensErro, UDiasUteisInv,
     UOperComum, UBibliotecaInvest, USistema;

{$R *.DFM}

procedure TFrmCadIntegContabil.bbtnConfirmarClick(Sender: TObject);
begin
  Try
     If not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

     If Not ExcluiContabil Then
        Abort;

     If Not IntegraContabil Then
        Abort;

     If dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Commit;

     MsgDlg('Processo concluído.','Mensagem do Sistema',
               mtInformation,[MbOk],0);
  Except
      MsgDlg('Não foi possível concluir a Integração.','Mensagem do Sistema',
               mtInformation,[MbOk],0);
      dtmBaseDados.dbBaseDados.Rollback;
  End;
end;

function TFrmCadIntegContabil.ExcluiContabil  : Boolean;
begin
   QryRegAtualizacao.Close;
   QryRegAtualizacao.ParamByName('DATAMOVCARTINV').AsDateTime := StrToDate(dbdDta.Text);
   QryRegAtualizacao.Open;
   If QryRegAtualizacao.RecordCount > 0 Then
   Begin
      frmAguarde.Pos := 0;
      frmAguarde.Max := QryRegAtualizacao.RecordCount;
      frmAguarde.Mostra('Limpando Base para Atualização');
   End;
   While Not QryRegAtualizacao.Eof Do
   Begin
      Try
          // HistCartinv - Limpa Registro
          with dtmOperComum.qryAuxiliar do begin
             Close;
             SQL.Clear;
             SQL.Text := 'UPDATE HISTCARTINV SET PLNCODIGO = NULL '+
                         'WHERE PLNCODIGO = ' +
                            IntToStr(QryRegAtualizacao.FieldByName('PLNCODIGO').AsInteger);
             ExecSQL;
             Close;
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
         frmAguarde.Apaga;
         MsgDlg('Não foi possível excluir os lançamentos Contábeis.','Mensagem do Sistema',
            mtInformation,[MbOk],0);
         Result := false;
         Exit;
      End;

      QryRegAtualizacao.Next;

      frmAguarde.Pos := frmAguarde.Pos + 1;
   End;
   Result := True;
   frmAguarde.Apaga;
end;

function TFrmCadIntegContabil.IntegraContabil : Boolean;
Var
   QryLocal           : TwwQuery;
   dDtaAnterior       : TDateTime;
   wMensErro, wTipoRecDesBol, wNaturezaMovimento, wTipoPapel  : String;
   wPlano, wPlanilha, wDocumento, wMoedaReg, wIdForCli, wTipoOperacao : Integer;
   wVariacao, wCotacao1, wCotacao2                 : Double;
   bCriaLancto        : Boolean;
begin

   // Cria Objetos Locais
   QryLocal              := TwwQuery.Create(Application);
   QryLocal.DatabaseName := 'BaseDados';

   dDtaAnterior := dbdDta.Date - 1;
   While not DiasUteisInv.DiaUtil(dDtaAnterior,-1,1,'',True,False,False) Do
      dDtaAnterior := dDtaAnterior - 1;   // Achar o dia útil anterior

   wTipoRecDesBol := '';
   wPlano         := -1;
   wPlanilha      := -1;
   wDocumento     := -1;
   wTipoOperacao  := 0;
   wMoedaReg      := 0;

   qryConsCartRendVar.Close;
   qryConsCartRendVar.ParamByName('DATAATUAL').AsDateTime    := dbdDta.Date;
   qryConsCartRendVar.ParamByName('DATAANTERIOR').AsDateTime := dDtaAnterior;
   qryConsCartRendVar.Open;

   If qryConsCartRendVar.RecordCount > 0 Then
   Begin
      frmAguarde.Pos := 0;
      frmAguarde.Max := qryConsCartRendVar.RecordCount;
      frmAguarde.Mostra('Aguarde - Atualizando Contabilidade');
   End;

   Try
      While Not qryConsCartRendVar.EOF Do
      Begin

         wCotacao1 := OperComum.BuscaCotacaoAcao(qryConsCartRendVar.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 dbdDta.Date, True);

         wCotacao2 := OperComum.BuscaCotacaoAcao(qryConsCartRendVar.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 dDtaAnterior, True);

         wVariacao := (qryConsCartRendVar.FieldByName('QTDE').AsFloat*wCotacao1) -
                      (qryConsCartRendVar.FieldByName('QTDEANTERIOR').AsFloat*wCotacao2);


// Contabiliza Atualização

        // Verifica Tipo de Lancamento
         If (wVariacao) < 0 Then
             wNaturezaMovimento := 'P'
         Else
             wNaturezaMovimento := 'G';

         If qryConsCartRendVar.FieldByName('IDTIPOINVEST').AsInteger = 2 then
         begin
            // Busca Dados de Contabilização de Renda Variável

            FazQuery(QryLocal,
                'SELECT CODTIPOACAO '+
                'FROM ACAO '+
                'WHERE (IDACAO = '+QuotedStr(qryConsCartRendVar.FieldByName('IDINVESTIMENTO').AsString)+')');

            wTipoPapel    := QryLocal.FieldByName('CODTIPOACAO').AsString;
            if (wVariacao) > 0 then
               wTipoOperacao := -1    // Variação Positiva de RV
            else
               wTipoOperacao := -9;   // Variação Negativa de RV
         End;

         wIdForCli := -1;

         OperComum.LancaOperRFRV(
            Sistema.IdEmpresa, 79,qryConsCartRendVar.FieldByName('IDTIPOINVEST').AsInteger,
            qryConsCartRendVar.FieldByName('IDINVESTIMENTO').AsInteger,wTipoOperacao, -1,
            wIdForCli,qryConsCartRendVar.FieldByName('IDCARTEIRAINVEST').AsInteger,
            wMoedaReg, wTipoPapel,qryConsCartRendVar.FieldByName('IDLOTE').AsString, '','',
            '', wTipoRecDesBol, bCriaLancto, 0, wVariacao,
            dbdDta.Date, dbdDta.Date,wPlano, wPlanilha, wDocumento, wMensErro);

         if Trim(wMensErro) <> '' then
         begin
            MsgDlg('Ocorreu um erro na contabilisação da operação: '+
                   IntToStr(wTipoOperacao),
                   'Erro', mtError, [mbOk], 0);
            Abort;
         end;

         qryConsCartRendVar.Next;

         frmAguarde.Pos := frmAguarde.Pos + 1;

      End;

      Result := True;

   Except

      frmAguarde.Apaga;

      MsgDlg('Não foi possível excluir os lançamentos Contábeis.','Mensagem do Sistema',
              mtInformation,[MbOk],0);

      Result := false;
   End;

   frmAguarde.Apaga;
end;

procedure TFrmCadIntegContabil.FormCreate(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled       := True;
   TB97oKCancelar.Visible := True;
   dbnav.Visible          := False;
   bbtnConfirmar.Visible  := True;
end;

procedure TFrmCadIntegContabil.dbdDtaExit(Sender: TObject);
begin
  inherited;
   bbtnConfirmar.SetFocus;
end;

procedure TFrmCadIntegContabil.sbtnProcurarClick(Sender: TObject);
begin
  inherited;

  PnlFundo.Enabled :=True;

  if MontaSelect.RetornouValor then
     dbdDta.Text := montaSelect.ValoresChave[0];

end;

end.
