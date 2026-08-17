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

unit FExcluiOperImportEmp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, StdCtrls, wwdblook, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, CmEventosCadastro, ImgList, 
  uCtrlInvContab,
  //Ricardo Cristiano - 29/09/2011 - N. Sol 165694 -  N. Kintana 1438823
  USistema,
  //AL_8
  uCtrlParamInvest, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmExcluiOperImportEmp = class(TfrmCadastroCS)
    Label1: TLabel;
    lbExclui: TLabel;
    pgbExclusao: TProgressBar;
    dtpUltMovImport: TCMDateTimePicker;
    Query1: TwwQuery;
    Query3: TwwQuery;
    QryBuscaOperDia: TwwQuery;
    QryBuscaOperCustodia: TwwQuery;
    Query2: TwwQuery;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExcluiOperImportEmp: TfrmExcluiOperImportEmp;

implementation

uses DBaseDados, UBibliotecaInvest, UOperComum, UMensErro, uRendaVariavel,
     dRendaVariavel;

{$R *.DFM}

procedure TfrmExcluiOperImportEmp.sbtnProcurarClick(
  Sender: TObject);
begin
  inherited;
   If Not MontaSelect.RetornouValor Then
      Exit;

   dtpUltMovImport.Date := StrToDate(MontaSelect.ValoresChave[0]);


   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;

end;

procedure TfrmExcluiOperImportEmp.FormShow(Sender: TObject);
begin
  inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   pnlFundo.Enabled      := True;
end;

procedure TfrmExcluiOperImportEmp.bbtnConfirmarClick(Sender: TObject);
var iCarteiraOrig, iCarteiraDest : Integer;
    iIdHistCartInvOrig, iIdHistCartInvDest : Integer;
begin

   if Trim(dtpUltMovImport.Text) = '' then
      exit;

  inherited;

   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   pnlFundo.Enabled      := True;

   qry.Close;
   qry.ParamByName('DATAOPERACAO').AsString := dtpUltMovImport.Text;
   qry.Open;

   if qry.isempty then
   begin
      MsgDlg('Não existem operações importadas para esse dia.','Mensagem do Sistema', mtInformation,[MbOk],0);
      exit;
   end;

   if not CtrlInvContab.TestaPeriodo(dtpUltMovImport.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;

   if (MsgDlg('Confirma a exclusão?', 'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
       Exit;

   if RendaVariavel.VerEmAbertura then
      Exit;

   Try
      Try

         RendaVariavel.GravaEmAbertura;

         //Ricardo Cristiano - 29/09/2011 - N. Sol 165694 -  N. Kintana 1438823 - INÍCIO
         lbExclui.caption := 'Preparando exclusão.';

         FazQuery(Query1, 'SELECT DISTINCT H.PLNCODIGO, H.CODDOCUMENTO FROM HISTEMPACOES H WHERE H.DATAHISTEMPACOES = ' + quotedstr(datetostr(dtpUltMovImport.Date)));

         FazQuery(Query2, 'SELECT DISTINCT O.PLNCODIGO, O.CODDOCUMENTO FROM OPEREMPACOES O WHERE O.DATAOPERACAO = ' + quotedstr(datetostr(dtpUltMovImport.Date)));

         pgbExclusao.Max := (qry.RecordCount + qry.RecordCount + Query1.RecordCount + Query2.RecordCount);
         pgbExclusao.Position := 0;

         If Not dtmbasedados.dbBaseDados.InTransaction Then
            dtmbasedados.dbBaseDados.StartTransaction;

         lbExclui.caption := 'Exclusão da movimentação contábil/financeira.';

         Query1.First;
         While Not Query1.eof Do //Exclui juros
            Begin
               pgbExclusao.StepIt;
               Application.ProcessMessages;

               If Query1.FieldByName('CODDOCUMENTO').AsInteger > 0 Then
                  Begin
                     lbExclui.caption := 'Código Doc. ' + Trim(Query1.FieldByName('CODDOCUMENTO').AsString) + ' - Exclui o lancamento Financeiro ...';
                     // Exclui os lancamentos Financeiros
                     If Not CtrlInvContab.Documento.Delete(Query1.FieldByName('CODDOCUMENTO').AsInteger) Then
                        Raise Exception.Create('Não foi possível excluir o Documento Financeiro' + #13 +
                           'Mensagem: ' + CtrlInvContab.Documento.MessageInfo);
                  End;
               If Query1.FieldByName('PLNCODIGO').AsInteger > 0 Then
                  Begin
                     lbExclui.caption := 'Planilha Nº ' + Trim(Query1.FieldByName('PLNCODIGO').AsString) + ' - Exclui o lancamento Contábil ...';
                     // Exclui os lancamentos contábeis
                     If Not CtrlInvContab.InvExcluiLanc(Query1.FieldByName('PLNCODIGO').AsInteger,
                                                        0, Sistema.UsaPlanoPatro, False, sistema.IdUsuario, Sistema.IdModulo) Then
                        Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis ' + #13 +
                           'Mensagem: ' + CtrlInvContab.Documento.MessageInfo);
                  End;
               Query1.Next;
            End;
         pgbExclusao.StepIt;
         Application.ProcessMessages;
         
         Query1.Close;

         Query2.First;
         While Not Query2.eof Do //Exclui reversão
            Begin
               pgbExclusao.StepIt;
               Application.ProcessMessages;

               If Query2.FieldByName('CODDOCUMENTO').AsInteger > 0  Then
                  Begin
                     lbExclui.caption := 'Código Doc. ' + Trim(Query2.FieldByName('CODDOCUMENTO').AsString) + ' - Exclui o lancamento Financeiro ...';
                     // Exclui os lancamentos Financeiros
                     If Not CtrlInvContab.Documento.Delete(Query2.FieldByName('CODDOCUMENTO').AsInteger) Then
                        Raise Exception.Create('Não foi possível excluir o Documento Financeiro' + #13 +
                           'Mensagem: ' + CtrlInvContab.Documento.MessageInfo);
                  End;
               Query2.Next;   
            End;
         pgbExclusao.StepIt;
         Application.ProcessMessages;

         Query2.Close;

         qry.First;
         While Not qry.eof Do
         Begin
            lbExclui.caption := 'Contrato Nº ' + Trim(Qry.FieldByName('NUMCONTRATOCUSTODIA').AsString) + ' - Exclusão da Transferência.';
            If ((Qry.FieldByName('TIPOMOVIMENTO').AsString <> '5') and
                (Qry.FieldByName('TIPOMOVIMENTO').AsString <> '6')) Then
            Begin
               FazQuery(QryBuscaOperDia, 'SELECT OP.* FROM  OPEREMPACOES OP WHERE OP.DATAOPERACAO = TO_DATE(' +
                  quotedstr(datetostr(dtpUltMovImport.Date)) + ',' + quotedstr('DD/MM/YYYY') + ') AND ' +
                  ' OP.NUMCONTRATOCUSTODIA = ' + quotedstr(Qry.FieldByName('NUMCONTRATOCUSTODIA').AsString));

               If QryBuscaOperDia.IsEmpty Then
                  Begin
                     qry.next;
                     pgbExclusao.StepIt;
                     Application.ProcessMessages;
                     continue;
                  End;

               If ((QryBuscaOperDia.FieldByName('TIPOMOVIMENTO').AsString <> '5') and
                   (QryBuscaOperDia.FieldByName('TIPOMOVIMENTO').AsString <> '6')) Then
                  Begin
                     //Concessão do Empréstimo
                     If QryBuscaOperDia.FieldByName('TIPOMOVIMENTO').AsString = '1' Then
                        Begin
                           lbExclui.caption := 'Contrato Nº ' + Trim(Qry.FieldByName('NUMCONTRATOCUSTODIA').AsString) + ' - Concessão do Empréstimo.';
                           iCarteiraOrig := QryBuscaOperDia.FieldByName('IDCARTEIRACUSTODIANTE').AsInteger;
                           iCarteiraDest := QryBuscaOperDia.FieldByName('IDCARTEIRAINVEST').AsInteger;
                        End
                     Else //Reversão e Repactuação
                        Begin
                           lbExclui.caption := 'Contrato Nº ' + Trim(Qry.FieldByName('NUMCONTRATOCUSTODIA').AsString) + ' - Reversão do Empréstimo.';
                           iCarteiraOrig := QryBuscaOperDia.FieldByName('IDCARTEIRAINVEST').AsInteger;
                           iCarteiraDest := QryBuscaOperDia.FieldByName('IDCARTEIRACUSTODIANTE').AsInteger;
                        End;

                     QryBuscaOperCustodia.Close;

                     FazQuery(QryBuscaOperCustodia, 'SELECT OC.* ' +
                        '  FROM OPERCUSTODIA OC ' +
                        ' WHERE OC.IDINVESTIMENTO    = ' + QryBuscaOperDia.FieldByName('IDINVESTIMENTO').AsString +
//                        '   AND OC.IDPLANPREVCTBPATR = ' + QryBuscaOperDia.FieldByName('IDPLANPREVCTBPATR').AsString +
                        '   AND OC.IDCARTEIRADEST    = ' + IntToStr(iCarteiraDest) +
                        '   AND OC.IDCARTEIRAORIG    = ' + IntToStr(iCarteiraOrig) +
                        '   AND OC.DATAMOVCUSTOD     = TO_DATE(' +
                        quotedstr(datetostr(dtpUltMovImport.Date)) + ',' + quotedstr('DD/MM/YYYY') + ')' +
                        ' UNION SELECT OC.* ' +
                        '  FROM OPERCUSTODIA OC ' +
                        ' WHERE OC.IDINVESTIMENTO    = ' + QryBuscaOperDia.FieldByName('IDINVESTIMENTO').AsString +
//                        '   AND OC.IDPLANPREVCTBPATR = ' + QryBuscaOperDia.FieldByName('IDPLANPREVCTBPATR').AsString +
                        '   AND OC.IDCARTEIRADEST    = ' + IntToStr(iCarteiraOrig) +
                        '   AND OC.IDCARTEIRAORIG    = ' + IntToStr(iCarteiraDest) +
                        '   AND OC.DATAMOVCUSTOD     = TO_DATE(' +
                        quotedstr(datetostr(dtpUltMovImport.Date)) + ',' + quotedstr('DD/MM/YYYY') + ')');

                     QryBuscaOperCustodia.First;
                     while not QryBuscaOperCustodia.Eof do
                     begin
                        If Not OperComum.ProcExcluiCustodia(QryBuscaOperCustodia.FieldByName('IDOPERCUSTODIA').AsInteger,
                                                            QryBuscaOperCustodia.FieldByName('IDHISTCARTINVORIG').AsInteger,
                                                            QryBuscaOperCustodia.FieldByName('IDHISTCARTINVDEST').AsInteger,
                                                            StrToDate(dtpUltMovImport.Text)) Then
                           Raise Exception.Create('Ocorreu um problema na exclusão da Custódia de Transferência de Carteira.' + #13 +
                              'A exclusão será toda cancelada!');

                        ExecutaQuery(Query3, 'DELETE FROM BOLETA WHERE IDBOLETA = ' +
                           quotedstr(QryBuscaOperCustodia.FieldByName('IDBOLETA').AsString));

                        Query3.Close;

                        QryBuscaOperCustodia.Next;
                     end;
                     QryBuscaOperCustodia.Close;
                  End;
               QryBuscaOperDia.Close;
            End;

            qry.next;
            pgbExclusao.StepIt;
            Application.ProcessMessages;
         End;

         qry.First;
         While Not qry.eof Do
         Begin
            lbExclui.caption := 'Verificando Carteira para marcação - Empréstimo.';
            pgbExclusao.StepIt;
            Application.ProcessMessages;
            If ((Qry.FieldByName('TIPOMOVIMENTO').AsString <> '5') and
                (Qry.FieldByName('TIPOMOVIMENTO').AsString <> '6')) Then
            Begin
               FazQuery(QryBuscaOperDia, 'SELECT DISTINCT OP.TIPOMOVIMENTO, OP.IDCARTEIRACUSTODIANTE, ' +
                  'OP.IDCARTEIRAINVEST, OP.IDINVESTIMENTO, OP.IDPLANPREVCTBPATR '+
                  'FROM OPEREMPACOES OP WHERE OP.DATAOPERACAO = TO_DATE(' +
                  quotedstr(datetostr(dtpUltMovImport.Date)) + ',' + quotedstr('DD/MM/YYYY') + ') AND ' +
                  ' OP.NUMCONTRATOCUSTODIA = ' + quotedstr(Qry.FieldByName('NUMCONTRATOCUSTODIA').AsString));

               If QryBuscaOperDia.IsEmpty Then
                  Begin
                     qry.next;
                     pgbExclusao.StepIt;
                     Application.ProcessMessages;
                     continue;
                  End;

               If ((QryBuscaOperDia.FieldByName('TIPOMOVIMENTO').AsString <> '5') and
                   (QryBuscaOperDia.FieldByName('TIPOMOVIMENTO').AsString <> '6')) Then
                  Begin
                     //Concessão do Empréstimo
                     If QryBuscaOperDia.FieldByName('TIPOMOVIMENTO').AsString = '1' Then
                        Begin
                           iCarteiraOrig := QryBuscaOperDia.FieldByName('IDCARTEIRACUSTODIANTE').AsInteger;
                           iCarteiraDest := QryBuscaOperDia.FieldByName('IDCARTEIRAINVEST').AsInteger;
                        End
                     Else //Reversão e Repactuação
                        Begin
                           iCarteiraOrig := QryBuscaOperDia.FieldByName('IDCARTEIRAINVEST').AsInteger;
                           iCarteiraDest := QryBuscaOperDia.FieldByName('IDCARTEIRACUSTODIANTE').AsInteger;
                        End;

                     If StrToDate(dtpUltMovImport.Text) <= pRPI.DATAULTFECH Then
                        Begin
                           lbExclui.caption := 'Marcando o Investimento para Reprocessamento na Carteira Origem';
                           // Marca carteira Origem
                           If Not RendaVariavel.MarcarFlagReproc(QryBuscaOperDia.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                 iCarteiraOrig,
                                                                 QryBuscaOperDia.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                                 StrToDate(dtpUltMovImport.Text)) Then
                              Raise Exception.Create('Não foi possível marcar para Reprocessamento, a Carteira de Origem.');

                           lbExclui.caption := 'Marcando o Investimento para Reprocessamento na Carteira Destino';
                           // Marca carteira Destino
                           If Not RendaVariavel.MarcarFlagReproc(QryBuscaOperDia.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                 iCarteiraDest,
                                                                 QryBuscaOperDia.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                                 StrToDate(dtpUltMovImport.Text)) Then
                              Raise Exception.Create('Não foi possível marcar para Reprocessamento, a Carteira de Destino .');
                        End;
                     QryBuscaOperCustodia.Close;
                  End;
               QryBuscaOperDia.Close;
            End;

            qry.next;
         End;
         pgbExclusao.StepIt;
         Application.ProcessMessages;

         qry.Close;

         lbExclui.caption := 'Excluíndo movimentação - Empréstimo.';

         ExecutaQuery(Query3, 'DELETE HISTEMPACOES WHERE DATAHISTEMPACOES = ' + quotedstr(datetostr(dtpUltMovImport.Date)));

         ExecutaQuery(Query3, 'DELETE OPEREMPACOES WHERE DATAOPERACAO = ' + quotedstr(datetostr(dtpUltMovImport.Date)));

         ExecutaQuery(Query3, 'DELETE OPEREMPACOESIMPORTA WHERE DATAOPERACAO = ' + quotedstr(datetostr(dtpUltMovImport.Date)));
         //Ricardo Cristiano - 29/09/2011 - N. Sol 165694 -  N. Kintana 1438823 - FINAL

         dtmbasedados.dbBaseDados.Commit;

         MsgDlg('Operação concluída com sucesso.', 'Mensagem do Sistema', mtInformation, [MbOk], 0);

      Except
         On E: Exception Do
            Begin
               // Rollbacka Transação
               DtmBaseDados.dbBaseDados.Rollback;
               MsgDlg(E.Message, 'Mensagem do Sistema ', mtWarning, [mbOK], 0);
            End;
      End;
   Finally
      QryBuscaOperCustodia.Close;
      QryBuscaOperDia.Close;
      qry.Close;
      Query1.Close;
      Query2.Close;
      Query3.Close;
      pgbExclusao.Max := 0;
      pgbExclusao.Position := 0;
      lbExclui.caption := '';
      RendaVariavel.GravaEmAbertura('N');
   End;
end;

procedure TfrmExcluiOperImportEmp.bbtnCancelarClick(Sender: TObject);
begin
   dtpUltMovImport.clear;
  inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   pnlFundo.Enabled      := True;
end;

end.
