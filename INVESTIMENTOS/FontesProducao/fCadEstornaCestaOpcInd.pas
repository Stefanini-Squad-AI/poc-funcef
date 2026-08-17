//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_3
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
//Data	    : 06/03/2006
//Código    : Al_2
//Pendencia :
//SOL       :
//Motivo(S) : Implementação da trava de fechamento
//******************************************************************************
// Data     : 10/06/2005
// Código   : AL_1
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************

unit FCadEstornaCestaOpcInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, fcLabel, ComCtrls, uCtrlInvContab;

type
  TfrmCadEstornaCestaOpcInd = class(TfrmCadastroCS)
    qryBuscaOperCustodia: TwwQuery;
    dsBuscaOperCustodia: TwwDataSource;
    qryBoleta: TwwQuery;
    dsBoleta: TwwDataSource;
    qryBuscaOperCustodiaIDOPERCUSTODIA: TFloatField;
    qryBuscaOperCustodiaIDHISTCARTINVDEST: TFloatField;
    qryBuscaOperCustodiaIDHISTCARTINVORIG: TFloatField;
    qryBuscaOperCustodiaIDINVESTIMENTO: TFloatField;
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    Panel1: TPanel;
    Label1: TLabel;
    dblOpcao: TwwDBLookupCombo;
    Panel2: TPanel;
    prbProg: TProgressBar;
    qryBoletaDATAVIGENCIA: TDateTimeField;
    qryBoletaIDBOLETA: TStringField;
    qryBuscaOperCustodiaIDCARTEIRAORIG: TFloatField;
    qryBuscaOperCustodiaIDCARTEIRADEST: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblOpcaoChange(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
    procedure Desabilita;
  public
    { Public declarations }
  end;

var
  frmCadEstornaCestaOpcInd: TfrmCadEstornaCestaOpcInd;
  sIdBoleta : String;

implementation

uses DBaseDados, UBibliotecaInvest, UMensErro,UOperComum, dOpcoes, UOperacaoinvest,
     URendaVariavel;

{$R *.DFM}

procedure TfrmCadEstornaCestaOpcInd.FormShow(Sender: TObject);
begin
  inherited;
   QryBoleta.Open;
end;

procedure TfrmCadEstornaCestaOpcInd.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dblOpcao.Text := '';
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.RollBack;
   CmeCadastroAtualizaBotoes(Sender);
end;

procedure TfrmCadEstornaCestaOpcInd.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled    := True;
end;

procedure TfrmCadEstornaCestaOpcInd.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
    CmeCadastroAtualizaBotoes(Sender);
    If dblOpcao.Text <> '' Then
       Habilita
    Else
       Desabilita;
end;

procedure TfrmCadEstornaCestaOpcInd.Habilita;
begin
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;

procedure TfrmCadEstornaCestaOpcInd.Desabilita;
begin
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
end;

procedure TfrmCadEstornaCestaOpcInd.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      if QryBoleta.Locate('IDBOLETA', MontaSelect.ValoresChave[0], []) then
      begin
         dblOpcao.Text := qryBoleta.FieldByName('IDBOLETA').AsString;
         sIdBoleta := MontaSelect.ValoresChave[0];
      end
      else
         dblOpcao.Text := '';
   end
   else
      dblOpcao.Text := '';
end;

procedure TfrmCadEstornaCestaOpcInd.bbtnConfirmarClick(Sender: TObject);
begin
   //AL_2
   if RendaVariavel.VerEmAbertura then
      Exit;

   inherited;
   try
      if not QryBoleta.Locate('IDBOLETA', sIdBoleta, []) then
      begin
         MsgDlg('Boleta inexistente.','Mensagem do Sistema', MtWarning,[MbOk],0);
         dblOpcao.Text := '';
         Exit;
      end;

      //AL_1
      //AL_3
      if not CtrlInvContab.TestaPeriodo(qryBoletaDATAVIGENCIA.AsString, 2, 8) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
         dblOpcao.Text := '';
         Exit;
      end;

      if (MsgDlg('Exclui o Fechamento das Cestas dessa Boleta ?','Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrYes)  Then
      begin
           sIdBoleta := QryBoleta.FieldByName('IDBOLETA').AsString;

           with qryBuscaOperCustodia, RendaVariavel, OperComum do
           begin
              LimpaParametros(qryBuscaOperCustodia);
              ParamByName('IDBOLETA').AsString := sIdBoleta;
              Open;
              if not IsEmpty then
              begin
                 Try
                    if not(dtmBaseDados.dbBaseDados.InTransaction) then
                       DtmBaseDados.dbBaseDados.StartTransaction;

                    prbProg.Max := qryBuscaOperCustodia.RecordCount + 3;
                    prbProg.Position := 0;
                    // Exclui da OperCustodia / HistCartinv / Contabilidade
                    while not qryBuscaOperCustodia.EOF do
                    begin
                       if not ProcExcluiCustodia(qryBuscaOperCustodia.FieldByName('IDOPERCUSTODIA').AsInteger,
                                                    qryBuscaOperCustodia.FieldByName('IDHISTCARTINVORIG').AsInteger,
                                                    qryBuscaOperCustodia.FieldByName('IDHISTCARTINVDEST').AsInteger,
                                                    qryBoleta.FieldByName('DATAVIGENCIA').AsDateTime) then
                          Abort;

                       // Marca as transferências excluídas para reprocessamento
                       if qryBoleta.FieldByName('DATAVIGENCIA').AsDateTime <= pRPI.DATAULTFECH then
                       begin
                          if not MarcarFlagReproc(qryBuscaOperCustodia.FieldByName('IDINVESTIMENTO').AsInteger,
                                                  qryBuscaOperCustodia.FieldByName('IDCARTEIRAORIG').AsInteger,
                                                  -1,
                                                  qryBoleta.FieldByName('DATAVIGENCIA').AsDateTime) then
                          begin
                             MsgDlg('Ocorreu um problema ao Marcar a Carteira de Origem para Reprocessamento.','Mensagem do Sistema ',mtWarning,[MbOk],0);
                             Abort;
                          end;

                          if not MarcarFlagReproc(qryBuscaOperCustodia.FieldByName('IDINVESTIMENTO').AsInteger,
                                                  qryBuscaOperCustodia.FieldByName('IDCARTEIRADEST').AsInteger,
                                                  -1,
                                                  qryBoleta.FieldByName('DATAVIGENCIA').AsDateTime) then
                          begin
                             MsgDlg('Ocorreu um problema ao Marcar a Carteira de Destino para Reprocessamento.','Mensagem do Sistema ',mtWarning,[MbOk],0);
                             Abort;
                          end;
                       end;

                       qryBuscaOperCustodia.Next;
                       prbProg.StepIt;
                    end;

                    with DMOpcoes.qryAux do
                    begin
                       Close;
                       SQL.Clear;
                       SQL.Text := 'UPDATE CESTAOPCIND SET IDBOLETA = NULL WHERE IDBOLETA = '+ QuotedStr(sIdBoleta);
                       ExecSQL;
                       Close;
                       prbProg.StepIt;
                    end;

                    with DMOpcoes.qryAux do
                    begin
                       Close;
                       SQL.Clear;
                       SQL.Text := 'DELETE FROM BOLETA WHERE IDBOLETA = ' + QuotedStr(sIdBoleta);
                       ExecSQL;
                       Close;
                       prbProg.StepIt;
                    end;

                    DtmBaseDados.dbBaseDados.Commit;
                    prbProg.StepIt;

                    MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema', mtConfirmation,[MbOk],0);
                 except
                    on E: Exception do
                    begin
                       DtmBaseDados.dbBaseDados.Rollback;
                       MsgDlg('Ocorreu um problema na exclusão da Boleta.'+#13+ E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
                    end;
                 end;
              end;
           end;
      end;
   finally
      QryBoleta.Close;
      QryBoleta.Open;
      CmeCadastroAtualizaBotoes(Sender);
      prbProg.Max := 100;
      prbProg.Position := 0;
      dblOpcao.Text := '';
      Desabilita;
   end;
end;

procedure TfrmCadEstornaCestaOpcInd.dblOpcaoChange(Sender: TObject);
begin
  inherited;
   If dblOpcao.Text <> '' Then
   begin
      Habilita;
      sIdBoleta := qryBoleta.FieldByName('IDBOLETA').AsString;
   end
   Else
      Desabilita;
end;

end.
