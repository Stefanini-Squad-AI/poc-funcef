//******************************************************************************
// Código    : AL_8
// Pendencia : 26386
//******************************************************************************
// Data      : 20/12/2006
// Código    : AL_7
// Pendencia : 23891
// SOL       : 42459
// Desc      : Acerto na qryBoleta para não trazer operações de Liquidação Com Ações
//             e Transferencia entre Planos e Transf entre CC e CCI
//******************************************************************************
// Data      : 01/09/2006
// Código    : AL_6
// Pendencia : 22965
// SOL       :
// Desc      : Segregação de Plano/Patro
//             Alterada a qryBuscaoperBoleta
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_5
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 15/05/2005
// Código   : AL_4
// Pendencia:
// SOL      :
// Motivo   : Melhoria no sql do MotaSelect para Trazer operações de AJQ (Ajuste de Quantidade)
//******************************************************************************
// Código   : AL_3
// Pendencia:
// SOL      :
// Motivo   : Implementação de melhora na performance. Passa a fazer as exclusões
//            em duas etapas.
//******************************************************************************
//Data	    : 06/03/2006
//Código    : Al_2
//Pendencia :
//SOL       :
//Motivo(S) : Implementação da trava de fechamento
//******************************************************************************
// Data     : 01/06/2005
// Código   : AL_1
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 25/11/2004
// Motivo   : Implementação na QryBoleta da descrição do investimento para as
//            operações do tipo AJQ e do tipo de movto.
//******************************************************************************
// Data	    :17/05/2004
// Origem   :FUNCEF
// Função   :Botão OK
// LINHA(S) :123
// Motivo(S): Não "flega" mais o parâmetro da Ordem para "Aberta" (fica na ExcluiBoleta)
//******************************************************************************

unit FCadEstornaBoletaRV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, StdCtrls, wwdblook, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, CmEventosCadastro, ImgList, 
  uCtrlInvContab,
  //AL_8
  uCtrlParamInvest;

type
  TfrmCadEstornaBoletaRV = class(TfrmCadastroCS)
    dblBoleta: TwwDBLookupCombo;
    Label1: TLabel;
    qryBuscaOperBoleta: TwwQuery;
    DsBoleta: TwwDataSource;
    QryAux1: TwwQuery;
    QryFlgOpDireito: TwwQuery;
    QryFlgOpDireitoFLGOPDIREITO: TStringField;
    QryBuscaCartTerc: TwwQuery;
    QryBoleta: TwwQuery;
    QryBoletaNUMDOCUMENTO: TStringField;
    QryBoletaDATAOPERACAO: TDateTimeField;
    QryBoletaIDTIPOINVEST: TFloatField;
    QryBoletaTIPMOVBOLETA: TStringField;
    QryBoletaDESCINVESTIMENTO: TStringField;
    chkExcluiHist: TCheckBox;
    qryBuscaOperBoletaIDINVESTIMENTO: TFloatField;
    qryBuscaOperBoletaIDCARTEIRAINVEST: TFloatField;
    qryBuscaOperBoletaDATAOPERACAO: TDateTimeField;
    pnlProgresso: TPanel;
    pgbExclusao: TProgressBar;
    Label2: TLabel;
    qryBuscaOperBoletaIDPLANPREVCTBPATR: TFloatField;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
    qryBuscaDirCancAut: TwwQuery;
    qryBuscaOperBoletaIDCUSTODIANTE: TFloatField;
    procedure Habilita;
    procedure Desabilita;

    Procedure CmeCadastroFind(Sender: TObject);

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dblBoletaChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dblBoletaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblBoletaExit(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEstornaBoletaRV: TfrmCadEstornaBoletaRV;
  sOpcao      : String;

implementation

uses DBaseDados, UBibliotecaInvest, UOperComum, UOperacaoInvest, UImpostos, UMensErro, uRendaVariavel,
  dRendaVariavel;

{$R *.DFM}

procedure TfrmCadEstornaBoletaRV.CmeCadastroFind(Sender: TObject);
Begin
   if MontaSelect.RetornouValor then
   begin
      if QryBoleta.Locate('NUMDOCUMENTO', MontaSelect.ValoresChave[0], []) then
         dblBoleta.Text := MontaSelect.ValoresChave[0]
      else
         dblBoleta.Text := '';
   end
   else
      dblBoleta.Text := '';
End;

procedure TfrmCadEstornaBoletaRV.bbtnConfirmarClick(Sender: TObject);
Var
    wQtdCotaIni : Integer;
begin
    //AL_2
    if RendaVariavel.VerEmAbertura then
       Exit;

    if not QryBoleta.Locate('NUMDOCUMENTO', dblBoleta.Text, []) then
    begin
        MsgDlg('Boleta inexistente.','Mensagem do Sistema', MtWarning,[MbOk],0);
        dblBoleta.Text := '';
        Exit;
    end;

    //AL_1
    //AL_5
    if not CtrlInvContab.TestaPeriodo(QryBoletaDATAOPERACAO.AsString, iTipoInvestUsu) then
    begin
       MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
       if dblBoleta.CanFocus then
          dblBoleta.SetFocus;
       Exit;
    end;

    If (MsgDlg('Exclui todas as Operações dessa Boleta ?',
              'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
       Exit;

    sOpcao := 'X';

    QryAux1.Close;
    QryAux1.Open;
    wQtdCotaIni:= QryAux1.FieldByName('VLRCOTAINICART').AsInteger;
    QryAux1.Close;

    Try
      // AL_3
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
         DtmBaseDados.dbBaseDados.StartTransaction;

      // Busca as Operações desta Boleta
      OperComum.LimpaParametros(qryBuscaOperBoleta);
      qryBuscaOperBoleta.ParamByName('BOLETA').AsString := dblBoleta.Text;
      qryBuscaOperBoleta.Open;

      if not RendaVariavel.ExcluiBoleta(dblBoleta.Text, true, false) then
          Raise Exception.Create('Não é possível fazer a Exclusão dessa Boleta.');

      //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611 - Início
      while not qryBuscaOperBoleta.Eof do
      begin
         OperComum.LimpaParametros(qryBuscaDirCancAut);
         qryBuscaDirCancAut.ParamByName('IDINVESTIMENTO').AsInteger    := qryBuscaOperBoleta.FieldByName('IDINVESTIMENTO').AsInteger;
         qryBuscaDirCancAut.ParamByName('IDCARTEIRAINVEST').AsInteger  := qryBuscaOperBoleta.FieldByName('IDCARTEIRAINVEST').AsInteger;
         qryBuscaDirCancAut.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryBuscaOperBoleta.FieldByName('IDPLANPREVCTBPATR').AsInteger;
         qryBuscaDirCancAut.ParamByName('IDCUSTODIANTE').AsInteger     := qryBuscaOperBoleta.FieldByName('IDCUSTODIANTE').AsInteger;
         qryBuscaDirCancAut.ParamByName('DATAOPERACAO').AsString       := qryBuscaOperBoleta.FieldByName('DATAOPERACAO').AsString;
         qryBuscaDirCancAut.Open;

         while not qryBuscaDirCancAut.Eof do
         begin
            if not RendaVariavel.ExcluiBoleta(qryBuscaDirCancAut.FieldByName('NUMDOCUMENTO').AsString, true, false) then
               Raise Exception.Create('Não é possível fazer a Exclusão da Boleta ref. ao Cancelamento de Recebimento.');

            qryBuscaDirCancAut.next;
         end;
         qryBuscaOperBoleta.next;
      end;
      //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611 - Fim

      if dtmBaseDados.dbBaseDados.InTransaction then
         DtmBaseDados.dbBaseDados.Commit;

      if chkExcluiHist.Checked then
      begin
         pnlProgresso.Visible := True;

         if not(dtmBaseDados.dbBaseDados.InTransaction) then
            DtmBaseDados.dbBaseDados.StartTransaction;

         // Busca Todos os Investimentos Marcados para Reprocessamento
         OperComum.LimpaParametros(DMRendaVariavel.qryBuscaFlgReproc);
         DMRendaVariavel.qryBuscaFlgReproc.Open;
         pgbExclusao.Max := DMRendaVariavel.qryBuscaFlgReproc.RecordCount;
         pgbExclusao.Position := 0;

         while not DMRendaVariavel.qryBuscaFlgReproc.Eof do
         begin
            // Procura se este investimento marcado pertence a esta boleta (Só exclui históricos desta boleta)
            //AL_6
            if qryBuscaOperBoleta.Locate('IDINVESTIMENTO;IDCARTEIRAINVEST;IDPLANPREVCTBPATR',
                                         VarArrayOf([DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDINVESTIMENTO').AsInteger,
                                                     DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                     DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDPLANPREVCTBPATR').AsInteger]), []) then
            begin
               //AL_6
               if not RendaVariavel.ExcluiHistRV(
                                    DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                    DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDINVESTIMENTO').AsInteger,
                                    qryBuscaOperBoletaDATAOPERACAO.AsDateTime) then
                  Raise Exception.Create('Não foi possível excluir os históricos posteriores desta boleta.' + #13 +
                                         'O Sistema deverá ser reprocessado antes de efetuar qualquer operação.' + #13 +
                                         'A Boleta foi excluída com sucesso.');
            end;
            DMRendaVariavel.qryBuscaFlgReproc.Next;
            pgbExclusao.StepIt;
            Application.ProcessMessages;
         end;
         
         OperComum.LimpaParametros(DMRendaVariavel.qryBuscaFlgReproc);
         OperComum.LimpaParametros(qryBuscaOperBoleta);

         if dtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.Commit;
         pnlProgresso.Visible := False;
      end;

      //Monta Registro do Parâmetro
      //AL_8
      CtrlPInv.GetParamsInvest(CtrlInvContab.Empresa);

      MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema', mtInformation,[MbOk],0);
    Except
       on E: Exception do
       begin
          // Rollbacka Transação
          DtmBaseDados.dbBaseDados.Rollback;
          //AL_3
          MsgDlg(E.Message, 'Mensagem do Sistema ',mtWarning, [mbOK],0);
       end;
    End;
    QryBoleta.Close;
    QryBoleta.Open;
    QryFlgOpDireito.Close;
    CmeCadastroAtualizaBotoes(Sender);
    dblBoleta.Text := '';
    Desabilita;
end;

procedure TfrmCadEstornaBoletaRV.FormShow(Sender: TObject);
begin
  inherited;
    CmeCadastroAtualizaBotoes(Sender);

    QryBoleta.Open;
end;

procedure TfrmCadEstornaBoletaRV.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
    CmeCadastroAtualizaBotoes(Sender);

    If dblBoleta.Text <> '' Then
       Habilita
    Else
       Desabilita;
end;

procedure TfrmCadEstornaBoletaRV.dblBoletaChange(Sender: TObject);
begin
  inherited;
   If dblBoleta.Text <> '' Then
      Habilita
   Else
      Desabilita;
end;

procedure TfrmCadEstornaBoletaRV.Habilita;
begin
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;

procedure TfrmCadEstornaBoletaRV.Desabilita;
begin
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
end;

procedure TfrmCadEstornaBoletaRV.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dblBoleta.Text := '';

   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.RollBack;
   CmeCadastroAtualizaBotoes(Sender);

end;

procedure TfrmCadEstornaBoletaRV.bbtnSairClick(Sender: TObject);
begin
  inherited;
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.RollBack;
end;

procedure TfrmCadEstornaBoletaRV.dblBoletaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   QryFlgOpDireito.Close;
   QryFlgOpDireito.ParamByName('pNUMDOCUMENTO').AsString := dblBoleta.Text;
   QryFlgOpDireito.Open;
end;

procedure TfrmCadEstornaBoletaRV.dblBoletaExit(Sender: TObject);
begin
  inherited;
   QryFlgOpDireito.Close;
   QryFlgOpDireito.ParamByName('pNUMDOCUMENTO').AsString := dblBoleta.Text;
   QryFlgOpDireito.Open;
end;

procedure TfrmCadEstornaBoletaRV.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled    := True;
end;

end.
