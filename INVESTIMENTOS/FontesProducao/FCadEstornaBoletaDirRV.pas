//******************************************************************************
// Data      : 03/10/2006
// Código    : AL_10
// Pendencia : 22961
// SOL       :
// Desc      : Segregação de Planos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_9
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 01/06/2005
// Código   : AL_8
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 02/05/2005
// Código   : MontaSelect
// Motivo   : Retirado o filtro do "STATUS", não estava trazendo duas operações
//            que por algum motivo não foi gravado como "F". E no momento não influência,
//            essa query foi herdada do FCadEstornaBoleta.
//******************************************************************************
// Data     : 20/04/2005
// Código   : QryBoleta
// Motivo   : Retirado o filtro do "STATUS", não estava trazendo duas operações
//            que por algum motivo não foi gravado como "F". E no momento não influência,
//            essa query foi herdada do FCadEstornaBoleta.
//******************************************************************************
// Data     : 21/02/2005
// Código   : AL_7
// Motivo   : Implementada na query "QryBoletaTodosRec" o campo IDTIPOOPERACAO,
//            para buscar as operações igual a origem da boleta que está sendo excluida.
//******************************************************************************
// Data     : 09/12/2004
// Código   : AL_6
// Motivo   : So exclui as filhas quando for anuncio
//******************************************************************************
// Data     : 08/12/2004
// Código   : AL_5
// Motivo   : Implementado o tratamento da QTDERECDIRPARC para parcial e total
//******************************************************************************
// Data     : 01/12/2004
// Código   : AL_4
// Motivo   : Retirada a exclusão geral(Anuncio, recbto. parcial e final)...
//            a exclusão é conforme a seleção
//******************************************************************************
// Data     : 27/10/2004
// Código   : AL_3
// Motivo   : Exclui os históricos depois de excluir todas as boletas
//            Alterada a query QryBoletaSel (DFM)
//******************************************************************************
// Data     : 26/10/2004
// Código   : AL_2
// Motivo   : Implementação da exclusao de boleta pelo idoperacaodireito
//******************************************************************************
// Data     : 19/10/2004
// Código   : AL_1
// Motivo   : Implementação da limpeza do Finc/Contab da OPERACAODIREITO
//******************************************************************************

unit FCadEstornaBoletaDirRV;

interface                               

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, StdCtrls, wwdblook, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, CmEventosCadastro, ImgList,
  uCtrlInvContab;

type
  TfrmCadEstornaBoletaDirRV = class(TfrmCadastroCS)
    dblBoleta: TwwDBLookupCombo;
    Label1 : TLabel;
    QryAux : TwwQuery;
    QryBoleta: TwwQuery;
    DsBoleta: TwwDataSource;
    QryBoletaNUMDOCUMENTO: TStringField;
    QryBoletaDATAOPERACAO: TDateTimeField;
    QryFlgOpDireito: TwwQuery;
    QryFlgOpDireitoFLGOPDIREITO: TStringField;
    QryBoletaDESCTIPOOPERACAO: TStringField;
    QryBoletaSIGLAEMISSOR: TStringField;
    QryBoletaIDOPERACAODIREITO: TFloatField;
    QryBoletaIDTIPOINVEST: TFloatField;
    QryOperacaoInvest: TwwQuery;
    QryBoletaDESCINVESTIMENTO: TStringField;
    QryBoletaVLROPERACAO: TFloatField;
    QryBoletaIDTIPOOPERACAO: TFloatField;
    QryBoletaTodosRec: TwwQuery;
    QryOperacaoDireito: TwwQuery;
    QryBoletaQTDEOPERACAO: TFloatField;
    QryBoletaTIPMOVBOLETA: TStringField;
    QryBoletaPontaAnuncio: TwwQuery;
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
  frmCadEstornaBoletaDirRV: TfrmCadEstornaBoletaDirRV;

implementation

uses DBaseDados, UBibliotecaInvest, UOperComum, UOperacaoInvest, UImpostos, UMensErro,
  URendaVariavel, uDataBase;

{$R *.DFM}

procedure TfrmCadEstornaBoletaDirRV.CmeCadastroFind(Sender: TObject);
Begin
   If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
   Begin
     If MontaSelect.ValoresChave[0] <> '' Then
     Begin
        dblBoleta.Text := MontaSelect.ValoresChave[0];
        QryBoleta.Locate('NUMDOCUMENTO', MontaSelect.ValoresChave[0],[loPartialKey]);
     End
   End
   Else
      dblBoleta.Text := '';
End;

procedure TfrmCadEstornaBoletaDirRV.bbtnConfirmarClick(Sender: TObject);
var
   sSql : String;
begin
   // AL_8
   if not QryBoleta.Locate('NUMDOCUMENTO', dblBoleta.Text, []) then
   begin
      MsgDlg('Boleta inexistente.','Mensagem do Sistema', MtWarning,[MbOk],0);
      dblBoleta.Text := '';
      if dblBoleta.CanFocus then
         dblBoleta.SetFocus;
      Exit;
   end;

   //AL_9
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

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   Try
     //AL_1
     // Zera a Planilha e o CodDocumento da OperacaoDireito
     QryOperacaoDireito.Close;
     QryOperacaoDireito.ParamByName('IDOPERACAODIREITO').AsInteger :=
                                     QryBoletaIDOPERACAODIREITO.AsInteger;
     QryOperacaoDireito.Open;

     //AL_5
     If ((QryOperacaoDireito.FieldByName('STATUS').AsString  = '')   Or
         (QryOperacaoDireito.FieldByName('STATUS').AsString  = 'L')) Then
        sSql :='UPDATE OPERACAODIREITO SET PLNCODIGO = NULL, CODDOCUMENTO = NULL, '+
               'PLANO = NULL, QTDERECDIRPARC = 0 '+
               'WHERE IDOPERACAODIREITO = ' + QryBoletaIDOPERACAODIREITO.AsString
     Else If QryOperacaoDireito.FieldByName('STATUS').AsString  = 'P' Then
        sSql :='UPDATE OPERACAODIREITO SET PLNCODIGO = NULL, CODDOCUMENTO = NULL, '+
               'PLANO = NULL, '+
               'QTDERECDIRPARC = '+ QuotedStr(QryBoletaQTDEOPERACAO.AsString)+' '+
               ' WHERE IDOPERACAODIREITO = ' + QryBoletaIDOPERACAODIREITO.AsString;

     // Zera a Planilha e o CodDocumento da OperacaoDireito
     ExecutarQuery(QryAux, sSql);

     QryOperacaoDireito.Close;

     //AL_4
     //AL_3
     //AL_2
     //Exclui as boletas sem excluir os históricos
     if not RendaVariavel.ExcluiBoleta(QryBoleta.FieldByName('NUMDOCUMENTO').AsString, true, false) then
        Raise Exception.Create('Não é possível fazer a Exclusão dessa Boleta.');

     //AL_6
     //Caso seja Anuncio de Proventos,Dividendos, juros ou Multa
     if ((QryBoleta.FieldByName('TIPMOVBOLETA').AsString = 'DTA') Or
         (QryBoleta.FieldByName('TIPMOVBOLETA').AsString = 'DTO')) Then
     begin
        //Caso seja Anuncio de Proventos excluirá todos os recebimentos
        if (QryBoleta.FieldByName('TIPMOVBOLETA').AsString = 'DTA') Then
        begin
           QryBoletaPontaAnuncio.Close;
           QryBoletaPontaAnuncio.ParamByName('IDOPERACAODIREITO').AsInteger :=
                        QryBoleta.FieldByName('IDOPERACAODIREITO').AsInteger;
           QryBoletaPontaAnuncio.Open;

           QryBoletaPontaAnuncio.First;
           while not QryBoletaPontaAnuncio.Eof do
           begin
              //AL_1
              // Zera a Planilha e o CodDocumento da OperacaoDireito
              QryOperacaoDireito.Close;
              QryOperacaoDireito.ParamByName('IDOPERACAODIREITO').AsInteger :=
                                              QryBoletaIDOPERACAODIREITO.AsInteger;
              QryOperacaoDireito.Open;

              If ((QryOperacaoDireito.FieldByName('STATUS').AsString  = '')   Or
                  (QryOperacaoDireito.FieldByName('STATUS').AsString  = 'L')) Then
              begin
                 sSql :='UPDATE OPERACAODIREITO SET PLNCODIGO = NULL, CODDOCUMENTO = NULL, '+
                        'PLANO = NULL, QTDERECDIRPARC = 0 '+
                        'WHERE IDOPERACAODIREITO      = ' + QryBoletaIDOPERACAODIREITO.AsString;
                 // Zera a Planilha e o CodDocumento da OperacaoDireito
                 ExecutarQuery(QryAux, sSql);
              end;

              if not RendaVariavel.ExcluiBoleta(
                                   QryBoletaPontaAnuncio.FieldByName('NUMDOCUMENTO').AsString, true, false) then
                 Raise Exception.Create('Não foi possível fazer a Exclusão dessa Boleta.');

              QryBoletaPontaAnuncio.Next;
           end;
        end;

        //AL_7
        //Exclui todos os recebimentos após o anúncio(devido a CCI criar mais de uma boleta para um recebimento)
        QryBoletaTodosRec.Close;
        QryBoletaTodosRec.ParamByName('IDOPERACAODIREITO').AsInteger :=
                     QryBoleta.FieldByName('IDOPERACAODIREITO').AsInteger;
        QryBoletaTodosRec.ParamByName('IDTIPOOPERACAO').AsInteger :=
                     QryBoleta.FieldByName('IDTIPOOPERACAO').AsInteger;
        QryBoletaTodosRec.Open;

        If Not QryBoletaTodosRec.IsEmpty Then
        begin
           sSql :='UPDATE OPERACAODIREITO SET PLNCODIGO = NULL, CODDOCUMENTO = NULL, '+
                  'PLANO = NULL, QTDERECDIRPARC = 0 '+
                  'WHERE IDOPERACAODIREITO      = ' + QryBoletaIDOPERACAODIREITO.AsString;
           // Zera a Planilha e o CodDocumento da OperacaoDireito
           ExecutarQuery(QryAux, sSql);
        end;

        QryBoletaTodosRec.First;
        while not QryBoletaTodosRec.Eof do
        begin
           if not RendaVariavel.ExcluiBoleta(
                                QryBoletaTodosRec.FieldByName('NUMDOCUMENTO').AsString, true, false) then
              Raise Exception.Create('Não é possível fazer a Exclusão dessa Boleta.');

           QryBoletaTodosRec.Next;
        end;
        QryBoletaTodosRec.Close;
     end
     //Em operações que alterem a quantidade, serão excluídos os históricos
     else if ((QryBoleta.FieldByName('TIPMOVBOLETA').AsString = 'DTG') Or
              (QryBoleta.FieldByName('TIPMOVBOLETA').AsString = 'DTS') Or
              (QryBoleta.FieldByName('TIPMOVBOLETA').AsString = 'DTI') Or
              (QryBoleta.FieldByName('TIPMOVBOLETA').AsString = 'DTB') Or
              (QryBoleta.FieldByName('TIPMOVBOLETA').AsString = 'DTD') Or
              (QryBoleta.FieldByName('TIPMOVBOLETA').AsString = 'DRS') Or
              (QryBoleta.FieldByName('TIPMOVBOLETA').AsString = 'DCI')) Then
     begin
        //Exclui todos historicos
        QryBoletaTodosRec.Close;
        QryBoletaTodosRec.ParamByName('IDOPERACAODIREITO').AsInteger :=
                     QryBoleta.FieldByName('IDOPERACAODIREITO').AsInteger;
        QryBoletaTodosRec.Open;

        QryBoletaTodosRec.First;
        while not QryBoletaTodosRec.Eof do
        begin
           //AL_10
           if not RendaVariavel.ExcluiHistRV(
                                QryBoletaTodosRec.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                QryBoletaTodosRec.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                QryBoletaTodosRec.FieldByName('IDINVESTIMENTO').AsInteger,
                                QryBoletaTodosRec.FieldByName('DATAOPERACAO').AsDateTime) then
              Raise Exception.Create('Não foi possível excluir os históricos dessa Boleta.');
           QryBoletaTodosRec.Next;
        end;
        QryBoletaTodosRec.Close;
     end;

     If DtmBaseDados.dbBaseDados.InTransaction Then
        DtmBaseDados.dbBaseDados.Commit;

     // Monta Registro do Parâmetro
     Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');

     MsgDlg('Operação concluída com sucesso.', 'Mensagem do Sistema', mtConfirmation,[MbOk],0);

   Except
      on E:Exception do
      begin
         If DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
      end;
   End;
   QryBoleta.Close;
   QryBoleta.Open;
   QryFlgOpDireito.Close;
   CmeCadastroAtualizaBotoes(sender);
   dblBoleta.Text := '';
   Desabilita;
end;

procedure TfrmCadEstornaBoletaDirRV.FormShow(Sender: TObject);
begin
  inherited;
    CmeCadastroAtualizaBotoes(sender);

    QryBoleta.Open;
end;

procedure TfrmCadEstornaBoletaDirRV.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
    CmeCadastroAtualizaBotoes(sender);

    If dblBoleta.Text <> '' Then
       Habilita
    Else
       Desabilita;
end;

procedure TfrmCadEstornaBoletaDirRV.dblBoletaChange(Sender: TObject);
begin
  inherited;
   If dblBoleta.Text <> '' Then
      Habilita
   Else
      Desabilita;
end;

procedure TfrmCadEstornaBoletaDirRV.Habilita;
begin
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;

procedure TfrmCadEstornaBoletaDirRV.Desabilita;
begin
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
end;

procedure TfrmCadEstornaBoletaDirRV.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dblBoleta.Text := '';

   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.RollBack;
   CmeCadastroAtualizaBotoes(sender);

end;

procedure TfrmCadEstornaBoletaDirRV.bbtnSairClick(Sender: TObject);
begin
  inherited;
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.RollBack;
end;

procedure TfrmCadEstornaBoletaDirRV.dblBoletaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   QryFlgOpDireito.Close;
   QryFlgOpDireito.ParamByName('pNUMDOCUMENTO').AsString := dblBoleta.Text;
   QryFlgOpDireito.Open;
end;

procedure TfrmCadEstornaBoletaDirRV.dblBoletaExit(Sender: TObject);
begin
  inherited;
   QryFlgOpDireito.Close;
   QryFlgOpDireito.ParamByName('pNUMDOCUMENTO').AsString := dblBoleta.Text;
   QryFlgOpDireito.Open;
end;

procedure TfrmCadEstornaBoletaDirRV.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled    := True;
end;

end.
