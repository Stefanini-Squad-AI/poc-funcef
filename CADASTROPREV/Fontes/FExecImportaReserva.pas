unit FExecImportaReserva;

// Alterações:
{ --------------------------------------------------------------------------------------------------
// Autor(a)    :  Jéssica Lana
// Data        :  20/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
--------------------------------------------------------------------------------
Rotina    : LeRegistro
Data      : 26/09/2006
Autor     : Augusto
Pendencia :
Descrição : Alteração para tratar matricula com 7 digitos
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
   MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
   Db, DBTables, Wwquery, wwdbdatetimepicker, CMDateTimePicker, USistema;

type
   TRegistroReserva = Record
      sMatricula     : String;
      fVlrReserva    : Currency;
      fVlrBeneficio  : Currency;
      IDPessoa       : Integer;
      IDPlanoPrev113 : Integer;
      IDPlanoPrev114 : Integer;
      IDPatro113     : Integer;
      IDPatro114     : Integer;
      fVlrReserva113 : Currency;
      fVlrReserva114 : Currency;
   end;

   TfrmExecImportaReserva = class(TfrmWizardMT)
      opdArqReserva: TOpenDialog;
      edtArqReserva: TEdit;
      Label2: TLabel;
      btnArquivo: TBitBtn;
      Panel3: TPanel;
      memResult: TMemo;
      Panel2: TPanel;
      memErro: TMemo;
      Panel1: TPanel;
      Label15: TLabel;
      qryDepentit: TwwQuery;
      qryDepentitIDPESSOA: TFloatField;
      qryReserva: TwwQuery;
      qryReservaIDTIPORESERVA: TFloatField;
      qryReservaIDPLANOPREV: TFloatField;
      qryReservaIDPESSOA: TFloatField;
      qryReservaIDPESSJUR: TFloatField;
      qryReservaDATAREFERENCIASA: TDateTimeField;
      qryReservaSEQPROPOSTA: TFloatField;
      qryReservaVALORRESERVA: TFloatField;
      qryReservaPERCENTUALSAQUE: TFloatField;
      qryReservaFLGATIVO: TFloatField;
      qryReservaDATADESATIV: TDateTimeField;
      qryReservaFLGINCONSISTENCIA: TFloatField;
      qryReservaDATAULTALIM: TDateTimeField;
      qryReservaDATAULTATUALIZA: TDateTimeField;
      qryReservaIDPARTICIPANTE: TFloatField;
      edtDataRef: TCMDateTimePicker;
      qryUpdateReserva: TwwQuery;
      qryInsertMovReserva: TwwQuery;

      procedure btnArquivoClick(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);


   private  // Private declarations

      Arquivo  : TextFile;
      Registro : TRegistroReserva;

      function  VerificaPreenchimento: Boolean;

      function  ContaLinhasArquivo: Integer;
      function  LeRegistro: Integer;

      function  GravaReserva(const IDPessoa        : Integer;
                             const IDTipoReserva   : Integer;
                             const IDPlanoPrev     : Integer;
                             const IDPatro         : Integer;
                             const dDataRef        : TDateTime;
                             const fVlrReservaAnt  : Currency;
                             const fVlrReservaAtu  : Currency
                            ): Integer;


   public   // Public declarations


   end;



var
  frmExecImportaReserva: TfrmExecImportaReserva;



implementation
{$R *.DFM}
uses
   uDataBase, uMensErro, uVerificaPreenchimento, fProgresso, uFuncoesFuncef;



function TfrmExecImportaReserva.VerificaPreenchimento: Boolean;
begin
   Result := False;

   try
      // -------------------------------------------------------------------------------------------

      if length(trim(edtArqReserva.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Arquivo de reservas a importar!', btnArquivo);

      // -------------------------------------------------------------------------------------------

      if length(trim(edtDataRef.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Referência!', edtDataRef);

      // -------------------------------------------------------------------------------------------

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Folha de Benefícios', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



procedure TfrmExecImportaReserva.btnArquivoClick(Sender: TObject);
begin
   inherited;

   opdArqReserva.Execute;
   edtArqReserva.Text := opdArqReserva.FileName;
end;



procedure TfrmExecImportaReserva.btnContinuarClick(Sender: TObject);
var
   sErro          : String;
   iPos           : Integer;
   iTam           : Integer;
   iResultLeitura : Integer;
   iResultReserva : Integer;
begin
   if not(VerificaPreenchimento) then Exit;

   iPos := 0;
   iTam := ContaLinhasArquivo;

   if iTam <= 0 then
   begin
      MsgDlg('Erro ao abrir arquivo, ou arquivo vazio!', 'FUNCEF', mtError, [mbOk], 0);
      Repaint;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   frmProgresso.MostraFormProgresso('Processando arquivo...',
                                    True,
                                    True,
                                    True,
                                    0,
                                    iTam
                                   );

   // ----------------------------------------------------------------------------------------------

   memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + 'Início do processo.');
   memResult.Lines.Add(' ');

   memResult.Lines.Add('         Linha   Matrícula     Valor Reserva Valor Benef.');
   memResult.Lines.Add('         ------- ------------- ------------- -------------');

   memErro.Lines.Add('         Linha   Matrícula     Ocorrência');
   memErro.Lines.Add('         ------- ------------- -----------------------------------------------');

   // ----------------------------------------------------------------------------------------------

   Reset(Arquivo);

   try
      try
         while not(EOF(Arquivo)) do
         begin
            inc(iPos);

            frmProgresso.AndaFormProgresso(iPos);

            // -------------------------------------------------------------------------------------
            if frmProgresso.Cancelou then
            begin
               memResult.Lines.Add(' ');
               memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + 'Processo interrompido pelo usuário.');
               memResult.Lines.Add(' ');

               MsgDlg('Processo interrompido pelo usuário.', 'Folha', mtInformation, [mbOk], 0);
               Repaint;

               Break;
            end;
            // -------------------------------------------------------------------------------------

            // Le a linha, passando o conteúdo para o registro, criticando o resultado
            iResultLeitura := LeRegistro;

            if iResultLeitura < 0 then
            begin
               case iResultLeitura of
                  -1: sErro := 'Erro na leitura da matrícula';
                  -2: sErro := 'Erro na leitura do valor da reserva';
                  -3: sErro := 'Erro na leitura do valor do benefício';
                  -4: sErro := 'Não foi localizado associado para a matrícula';
                  -5: sErro := 'Foi localizado mais de um associado para a matrícula';
                  -6: sErro := 'Não foi localizada reserva matemática para saldamento';
                  -7: sErro := 'Inconsistência na reserva matemática para saldamento';
                  -8: sErro := 'Não foi localizada reserva referente ao benefício saldado';
                  -9: sErro := 'Inconsistência na reserva referente ao benefício saldado';
               end;

               memErro.Lines.Add(FormatDateTime('hh:nn:ss', Now)                    + ' ' +
                                 CompletaInicio(FormatFloat('#,#0', iPos), ' ', 7)  + ' ' +
                                 CompletaFim(Registro.sMatricula, ' ', 13)          + ' ' +
                                 sErro
                                );
               Continue;
            end;

            // ----------------------------------------------------------------------------------------

            StartTransacao;

            // ----------------------------------------------------------------------------------------

            iResultReserva := GravaReserva(Registro.IDPessoa,
                                           113,
                                           Registro.IDPlanoPrev113,
                                           Registro.IDPatro113,
                                           edtDataRef.Date,
                                           Registro.fVlrReserva113,
                                           Registro.fVlrReserva
                                          );

            if iResultReserva < 0 then
            begin
               RollbackTransacao;

               case iResultReserva of
                  -1: sErro := 'Erro ao inserir movimentação de saída da reserva (matemática)';
                  -2: sErro := 'Erro ao inserir movimentação de entrada da reserva (matemática)';
                  -3: sErro := 'Erro ao atualizar saldo da reserva (matemática)';
               end;

               memErro.Lines.Add(FormatDateTime('hh:nn:ss', Now)                    + ' ' +
                                 CompletaInicio(FormatFloat('#,#0', iPos), ' ', 7)  + ' ' +
                                 CompletaFim(Registro.sMatricula, ' ', 13)          + ' ' +
                                 sErro
                                );
               Continue;
            end;

            // ----------------------------------------------------------------------------------------

            iResultReserva := GravaReserva(Registro.IDPessoa,
                                           114,
                                           Registro.IDPlanoPrev114,
                                           Registro.IDPatro114,
                                           edtDataRef.Date,
                                           Registro.fVlrReserva114,
                                           Registro.fVlrBeneficio
                                          );

            if iResultReserva < 0 then
            begin
               RollbackTransacao;

               case iResultReserva of
                  -1: sErro := 'Erro ao inserir movimentação de saída da reserva (benefício saldado)';
                  -2: sErro := 'Erro ao inserir movimentação de entrada da reserva (benefício saldado)';
                  -3: sErro := 'Erro ao atualizar saldo da reserva (benefício saldado)';
               end;

               memErro.Lines.Add(FormatDateTime('hh:nn:ss', Now)                    + ' ' +
                                 CompletaInicio(FormatFloat('#,#0', iPos), ' ', 7)  + ' ' +
                                 CompletaFim(Registro.sMatricula, ' ', 13)          + ' ' +
                                 sErro
                                );
               Continue;
            end;

            // ----------------------------------------------------------------------------------------

            memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now)                                       + ' ' +
                                CompletaInicio(FormatFloat('#,#0', iPos), ' ', 7)                     + ' ' +
                                CompletaFim(Registro.sMatricula, ' ', 13)                             + ' ' +
                                CompletaInicio(FormatFloat('#,#0.00', Registro.fVlrReserva), ' ', 13) + ' ' +
                                CompletaInicio(FormatFloat('#,#0.00', Registro.fVlrBeneficio), ' ', 13)
                               );

            CommitTransacao;

            // ----------------------------------------------------------------------------------------

         end;  // while

      except
         RollbackTransacao;
      end;

   finally
      memResult.Lines.Add(' ');
      memResult.Lines.Add(' ');
      memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + 'Término do processo.');

      frmProgresso.EscondeFormProgresso;
      CloseFile(Arquivo);
   end;

   inherited;
end;



function  TfrmExecImportaReserva.GravaReserva(const IDPessoa         : Integer;
                                              const IDTipoReserva    : Integer;
                                              const IDPlanoPrev      : Integer;
                                              const IDPatro          : Integer;
                                              const dDataRef         : TDateTime;
                                              const fVlrReservaAnt   : Currency;
                                              const fVlrReservaAtu   : Currency
                                             ): Integer;
var
   sMesRef : String;
begin
   sMesRef := FormatDateTime('YYYY/MM', dDataRef);

   try
      // -------------------------------------------------------------------------------------------
      // 1º - Grava movimento de saída na HistMovReserva
      try
         with qryInsertMovReserva do
         begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('PIDTIPORESERVA').AsInteger   := IDTipoReserva;
            ParamByName('PDATA').AsDate               := dDataRef;
            ParamByName('PVALORREAL').AsCurrency      := fVlrReservaAnt * (-1);
            ParamByName('PSALDOREAL').AsCurrency      := fVlrReservaAnt;
            ParamByName('PIDPLANOPREV').AsInteger     := IDPlanoPrev;
            ParamByName('PIDPESSOA').AsInteger        := IDPessoa;
            ParamByName('PIDPESSJUR').AsInteger       := IDPatro;
            ParamByName('PFLGENTRADA').AsInteger      := 0; // saída
            ParamByName('PMESREF').AsString           := sMesRef;
            ExecSQL;
         end;
      except
         Result := -1;
      end;

      // -------------------------------------------------------------------------------------------
      // 2º - Grava movimento de entrada na HistMovReserva

      try
         with qryInsertMovReserva do
         begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('PIDTIPORESERVA').AsInteger   := IDTipoReserva;
            ParamByName('PDATA').AsDate               := dDataRef;
            ParamByName('PVALORREAL').AsCurrency      := fVlrReservaAtu;
            ParamByName('PSALDOREAL').AsCurrency      := 0;
            ParamByName('PIDPLANOPREV').AsInteger     := IDPlanoPrev;
            ParamByName('PIDPESSOA').AsInteger        := IDPessoa;
            ParamByName('PIDPESSJUR').AsInteger       := IDPatro;
            ParamByName('PFLGENTRADA').AsInteger      := 1; // entrada
            ParamByName('PMESREF').AsString           := sMesRef;
            ExecSQL;
         end;
      except
         Result := -2;
      end;

      // -------------------------------------------------------------------------------------------
      // 3º - Faz update na ReservaPart com o novo valor

      try
         with qryUpdateReserva do
         begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('PVALORRESERVA').AsCurrency   := fVlrReservaAtu;
            ParamByName('PIDPESSOA').AsInteger        := IDPessoa;
            ParamByName('PIDTIPORESERVA').AsInteger   := IDTipoReserva;
            ParamByName('PIDPLANOPREV').AsInteger     := IDPlanoPrev;
            ParamByName('PIDPESSJUR').AsInteger       := IDPatro;
            ExecSQL;
         end;
      except
         Result := -3;
      end;

      // -------------------------------------------------------------------------------------------

      Result := 0;

   finally

   end;
end;




function  TfrmExecImportaReserva.ContaLinhasArquivo: Integer;
var
   iLinhas  : Integer;
   sAux     : String;
begin
   iLinhas := 0;

   try
      AssignFile(Arquivo, edtArqReserva.Text);
      Reset(Arquivo);

      while not(EOF(Arquivo)) do
      begin
         ReadLn(Arquivo, sAux);
         inc(iLinhas);
      end;

      // Voltar arquivo para o inicio
      CloseFile(Arquivo);

   except
      iLinhas := -1;
   end;

   Result := iLinhas;
end;


function TfrmExecImportaReserva.LeRegistro: Integer;
var
   sLinha : String;
begin
   Result := 0;

   ReadLn(Arquivo, sLinha);

   // ----------------------------------------------------------------------------------------------

   try
      Registro.sMatricula := trim(copy(sLinha, 1, 07));
   except
      Result := -1;
      Exit;
   end;

   if length(trim(Registro.sMatricula)) = 0 then
   begin
      Result := -1;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   try
      Registro.fVlrReserva := StrToFloat(trim(copy(sLinha, 08, 13))) / 100;
   except
      Result := -2;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   try
      Registro.fVlrBeneficio  := StrToFloat(trim(copy(sLinha, 21, 13))) / 100;
   except
      Result := -3;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   // Procura a matrícula na depentit

   with qryDepentit do
   begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('PMATRICULA').AsString := Registro.sMatricula;
      Open;
   end;

   if qryDepentit.RecordCount = 1 then
   begin
      Registro.IDPessoa := qryDepentitIDPESSOA.AsInteger;
   end
   else
   if qryDepentit.RecordCount <= 0 then
   begin
      Result := -4;
   end
   else
   begin
      Result := -5;
   end;

   qryDepentit.Close;

   // ----------------------------------------------------------------------------------------------

   // Procura as reservas, verificando se estão associadas

   // 113 - Reserva Matemática para Saldamento
   with qryReserva do
   begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('PIDPESSOA').AsInteger        := Registro.IDPessoa;
      ParamByName('PIDTIPORESERVA').AsInteger   := 113;
      Open;
   end;

   if qryReserva.RecordCount = 1 then
   begin
      Registro.fVlrReserva113 := qryReservaVALORRESERVA.AsCurrency;
      Registro.IDPlanoPrev113 := qryReservaIDPLANOPREV.AsInteger;
      Registro.IDPatro113     := qryReservaIDPESSJUR.AsInteger;
   end
   else
   if qryReserva.RecordCount <= 0 then
   begin
      Result := -6;
   end
   else
   begin
      Result := -7;
   end;

   // 114 - Beneficio Saldado
   with qryReserva do
   begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('PIDPESSOA').AsInteger        := Registro.IDPessoa;
      ParamByName('PIDTIPORESERVA').AsInteger   := 114;
      Open;
   end;

   if qryReserva.RecordCount = 1 then
   begin
      Registro.fVlrReserva114 := qryReservaVALORRESERVA.AsCurrency;
      Registro.IDPlanoPrev114 := qryReservaIDPLANOPREV.AsInteger;
      Registro.IDPatro114     := qryReservaIDPESSJUR.AsInteger;
   end
   else
   if qryReserva.RecordCount <= 0 then
   begin
      Result := -8;
   end
   else
   begin
      Result := -9;
   end;

   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmExecImportaReserva.FormCreate(Sender: TObject);
begin
  inherited;
  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  opdArqReserva.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

end;

end.
