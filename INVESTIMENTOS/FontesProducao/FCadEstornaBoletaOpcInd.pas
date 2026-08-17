//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_5
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 10/06/2005
// Código   : AL_4
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data	    : 29/06/2004
// Origem   : FUNCEF
// Função   : bbtnConfirmarClick
// LINHA(S) : AL_3
// Motivo(S): Retirada a função VerificaFechamentoOperacao, essa altera a data de fechto do parametro
//******************************************************************************
// Data	    : 29/06/2004
// Origem   : FUNCEF
// Função   : bbtnConfirmarClick
// LINHA(S) : AL_2
// Motivo(S): Ajuste do erro na qryBuscaBoletaTRC, essa mesma não executava
//******************************************************************************
// Data     : 24/06/2004
// Código   : AL_1
// Motivo   : Acerto na exclusão de Boletas  na funcao 'ExcluiOperOpcInd'
//******************************************************************************
unit FCadEstornaBoletaOpcInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdblook, ComCtrls, fcLabel,
  uCtrlInvContab;

type
  TfrmCadEstornaBoletaOpcInd = class(TfrmCadastroCS)
    QryBoleta: TwwQuery;
    DsBoleta: TwwDataSource;
    QryBoletaIDBOLETA: TStringField;
    QryBoletaDATAOPERACAO: TDateTimeField;
    QryBoletaPLNCODIGO: TFloatField;
    QryBoletaCODDOCUMENTO: TFloatField;
    qryBuscaCestasFuturas: TwwQuery;
    qryBuscaCestasFuturasIDCESTAOPCIND: TFloatField;
    qryBuscaCestasFuturasIDBOLETA: TStringField;
    qryBuscaCestasFuturasDATAVIGENCIA: TDateTimeField;
    qryBuscaBoletasFuturas: TwwQuery;
    pnlDados: TPanel;
    Label1: TLabel;
    dblBoleta: TwwDBLookupCombo;
    pnlBarras: TPanel;
    qryBuscaBoletasFuturasIDBOLETA: TStringField;
    qryBuscaBoletasFuturasDATAOPERACAO: TDateTimeField;
    qryBuscaBoletasFuturasPLNCODIGO: TFloatField;
    qryBuscaBoletasFuturasCODDOCUMENTO: TFloatField;
    pnlBarraBoleta: TPanel;
    lblBoleta: TfcLabel;
    prbBoletas: TProgressBar;
    pnlBarraProgresso: TPanel;
    prbExclusao: TProgressBar;
    qryBuscaBoletaTRC: TwwQuery;
    qryBuscaBoletaTRCIDBOLETA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dblBoletaChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
    procedure Desabilita;

  public
    { Public declarations }
  end;

var
  frmCadEstornaBoletaOpcInd: TfrmCadEstornaBoletaOpcInd;

implementation

uses DBaseDados, UBibliotecaInvest, UMensErro, UOpcaoIndice, UOperacaoInvest,
     UOperComum;

{$R *.DFM}

procedure TfrmCadEstornaBoletaOpcInd.FormShow(Sender: TObject);
begin
  inherited;
   QryBoleta.Open;
end;

procedure TfrmCadEstornaBoletaOpcInd.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      if QryBoleta.Locate('IDBOLETA', MontaSelect.ValoresChave[1], []) then
         dblBoleta.Text := MontaSelect.ValoresChave[1]
      else
         dblBoleta.Text := '';
   end
   else
      dblBoleta.Text := '';
end;

procedure TfrmCadEstornaBoletaOpcInd.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if not QryBoleta.Locate('IDBOLETA', dblBoleta.Text, []) then
   begin
      MsgDlg('Boleta inexistente.','Mensagem do Sistema', MtWarning,[MbOk],0);
      dblBoleta.Text := '';
      Exit;
   end;

   // AL_4
   //AL_5
   if not CtrlInvContab.TestaPeriodo(QryBoletaDATAOPERACAO.AsString, 2, 8) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
      dblBoleta.Text := '';
      Exit;
   end;

   // Verifica a existencia de cestas com vigencias fechadas em datas posteriores
   OperComum.LimpaParametros(qryBuscaCestasFuturas);
   qryBuscaCestasFuturas.ParamByName('IDBOLETA').AsString     := QryBoletaIDBOLETA.AsString;
   qryBuscaCestasFuturas.ParamByName('DATAVIGENCIA').AsString := QryBoletaDATAOPERACAO.AsString;
   qryBuscaCestasFuturas.Open;
   if not qryBuscaCestasFuturas.IsEmpty then
   begin
      MsgDlg('Esta Ordem possui uma Cesta com Vigência fechada pela boleta ' + #13 +
              qryBuscaCestasFuturasIDBOLETA.AsString + ' em ' + qryBuscaCestasFuturasDATAVIGENCIA.AsString,
             'Mensagem do Sistema', mtInformation, [mbOk],0);
      Exit;
   end;

   If (MsgDlg('Exclui todas as Operações dessa Boleta ?','Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrYes)  Then
   begin
      Try

         // Abre a única transação deste processo
         if not(dtmBaseDados.dbBaseDados.InTransaction) then
            DtmBaseDados.dbBaseDados.StartTransaction;

         //AL_3

         OperComum.LimpaParametros(qryBuscaBoletasFuturas);
         qryBuscaBoletasFuturas.ParamByName('DATAOPERACAO').AsString := QryBoleta.FieldByName('DATAOPERACAO').AsString;
         qryBuscaBoletasFuturas.ParamByName('IDBOLETA').AsString     := dblBoleta.Text;
         qryBuscaBoletasFuturas.Open;
         prbBoletas.Max := qryBuscaBoletasFuturas.RecordCount;
         prbBoletas.Position := 0;
         while not qryBuscaBoletasFuturas.Eof do
         begin
            lblBoleta.Caption := 'Excluindo Boleta ' + qryBuscaBoletasFuturasIDBOLETA.AsString;
            lblBoleta.Invalidate;
            Application.ProcessMessages;

            //AL_2
            // Busca a Boleta da TRC
            OperComum.LimpaParametros(qryBuscaBoletaTRC);
            qryBuscaBoletaTRC.ParamByName('IDBOLETA').AsString     := qryBuscaBoletasFuturasIDBOLETA.AsString;
            qryBuscaBoletaTRC.ParamByName('DATAVIGENCIA').AsString := qryBuscaBoletasFuturasDATAOPERACAO.AsString;
            qryBuscaBoletaTRC.Open;

            //AL_1
            if not OpcaoIndice.ExcluiOperOpcInd(qryBuscaBoletasFuturasIDBOLETA.AsString,
                                                qryBuscaBoletaTRCIDBOLETA.AsString,
                                                qryBuscaBoletasFuturasDATAOPERACAO.AsString,
                                                prbExclusao) then
               Abort;

            qryBuscaBoletasFuturas.Next;

            prbBoletas.StepIt;
            prbBoletas.Invalidate;
            Application.ProcessMessages;
         end;
         OperComum.LimpaParametros(qryBuscaBoletasFuturas);
         Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');
         DtmBaseDados.dbBaseDados.Commit;
         lblBoleta.Caption := 'Operação concluida';
         MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema', mtConfirmation,[MbOk],0);
      Except
         on E: Exception do
         begin
            // Rollbacka Transação
            DtmBaseDados.dbBaseDados.Rollback;
            prbBoletas.Max := 100;
            prbBoletas.Position := 0;
            prbExclusao.Max := 100;
            prbExclusao.Position := 0;
            MsgDlg('Ocorreu um problema na exclusão da Boleta.'+#13+ E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         end;
      End;
   end;
   QryBoleta.Close;
   QryBoleta.Open;
   CmeCadastroAtualizaBotoes(Sender);
   dblBoleta.Text := '';
   lblBoleta.Caption := '';
   prbBoletas.Max := 100;
   prbBoletas.Position := 0;
   prbExclusao.Max := 100;
   prbExclusao.Position := 0;
   Desabilita;
end;

procedure TfrmCadEstornaBoletaOpcInd.sbtnProcurarClick(Sender: TObject);
begin
   inherited;
   CmeCadastroAtualizaBotoes(Sender);
   If dblBoleta.Text <> '' Then
      Habilita
   Else
      Desabilita;
end;

procedure TfrmCadEstornaBoletaOpcInd.dblBoletaChange(Sender: TObject);
begin
  inherited;
   If dblBoleta.Text <> '' Then
      Habilita
   Else
      Desabilita;
end;

procedure TfrmCadEstornaBoletaOpcInd.Habilita;
begin
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;

procedure TfrmCadEstornaBoletaOpcInd.Desabilita;
begin
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
end;

procedure TfrmCadEstornaBoletaOpcInd.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dblBoleta.Text := '';
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.RollBack;
   CmeCadastroAtualizaBotoes(Sender);
end;

procedure TfrmCadEstornaBoletaOpcInd.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled    := True;
end;

end.
