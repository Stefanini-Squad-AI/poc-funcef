{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
-------------------------------------------------------------------------------
Pendência   : SOL174268/8141 Kintana 1573410
Responsável : Fanuel Junior
Data        : 15/02/2012
Descrição   : Adicionar o campo DATAFIMANT à query de entrada da regra de validação de suspensão
--------------------------------------------------------------------------------}
unit FExecArqSupensaoCobranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwriched, Menus, Db, DBTables,
  Wwquery;

type
   TfrmExecArqSupensaoCobranca = class(TfrmOkCancelar)
      Label1: TLabel;
      edtNomeArquivo: TEdit;
      SpeedButton1: TSpeedButton;
      memResult: TwwDBRichEdit;
      OpenDialog: TOpenDialog;
      SaveDialog: TSaveDialog;
      ppmMemResult: TPopupMenu;
      Imprimir: TMenuItem;
      Salvar: TMenuItem;
      qryLookTipoSusp: TwwQuery;
      qryBuscaContrato: TwwQuery;
      qryBuscaContratoIDCONTRATOEMPTMO: TFloatField;
      qryBuscaContratoIDTIPOCONTREMPTMO: TFloatField;
      qryLookTipoSuspIDTIPOSUSPEMPTMO: TFloatField;
      qryLookTipoSuspIDTIPOCONTREMPTMO: TFloatField;
      qryLookTipoSuspIDREGRAENVIOPARC: TFloatField;
      qryLookTipoSuspIDREGRARECALCIOF: TFloatField;
      qryLookTipoSuspIDREGRARECALCSEG: TFloatField;
      qryLookTipoSuspIDREGRAVALIDSUSP: TFloatField;
      qryLookTipoSuspTSEDESCRICAO: TStringField;
      qryLookTipoSuspTSEMESES: TFloatField;
      qryLookTipoSuspTSEINICIOSUSP: TDateTimeField;
      qryLookTipoSuspTSEFINALSUSP: TDateTimeField;
      qryLookTipoSuspIDRUBRICAADFERIAS: TFloatField;
      qryLookTipoSuspFLGGERAPARCELAS: TFloatField;
      qryLookTipoSuspFLGATUALSALDOPARC: TFloatField;
      qryLookTipoSuspFLGSUSPCONCESSAO: TFloatField;
      qryLookTipoSuspFLGCOBRAENCARGOS: TFloatField;
      qryLookTipoSuspFLGDEDUZPARCREST: TFloatField;
      qryLookTipoSuspFLGATUALSALDOENV: TFloatField;
      qryLookTipoSuspFLGFERIAS: TFloatField;
      qryLookTipoSuspFLGCOBRJUDICIAL: TFloatField;
      qryExistePrestacao: TwwQuery;
      qryExistePrestacaoHMEDATAPREVISTA: TDateTimeField;
      qryExistePrestacaoHMEVLRPREVISTO: TFloatField;
      qryParcelasEmAberto: TwwQuery;
      qryParcelasEmAbertoTOTAL: TFloatField;
      qryParcelasPagas: TwwQuery;
      qryParcelasPagasTOTAL: TFloatField;
      qryUltimaSuspensaoEncerrada: TwwQuery;
      qryUltimaSuspensaoEncerradaHSCINICIOSUSP: TDateTimeField;
      qryBuscaContratoIDPESSOA: TFloatField;
      qryBuscaContratoIDBENEF: TFloatField;
    qryInsert: TwwQuery;
    Label2: TLabel;
    qryUpdateContrato: TwwQuery;
    qryContrato: TwwQuery;
    qryContratoINSCRICAO: TFloatField;
    qryContratoFLGINTERNET: TFloatField;
    qryContratoINSCRICAONUMERO: TFloatField;
    qryContratoDESCSITCONTRATO: TStringField;
    qryContratoDESCFLGFORMAPAG: TStringField;
    qryContratoDESCFLGFORMAREC: TStringField;
    qryContratoDESCCODFORMAPAG: TStringField;
    qryContratoDESCPORTFORMAPAG: TStringField;
    qryContratoDESCPORTFORMAREC: TStringField;
    qryContratoFLGINTERNO: TStringField;
    qryContratoPLANOPREV: TStringField;
    qryContratoPLANOORIGEM: TStringField;
    qryContratoPATRO: TStringField;
    qryContratoMATRICULA: TStringField;
    qryContratoIDPESSJURCEDIDO: TFloatField;
    qryContratoTITULAR: TStringField;
    qryContratoBENEFICIARIO: TStringField;
    qryContratoTCEDESCRICAO: TStringField;
    qryContratoIDTIPOEMPTMO: TFloatField;
    qryContratoTCELEGENDAEXIBE: TStringField;
    qryContratoTCELEGENDACALC: TStringField;
    qryContratoDESCTIPOEMPTMO: TStringField;
    qryContratoDATAINSC: TDateTimeField;
    qryContratoBANCO: TStringField;
    qryContratoCONTACORRENTE: TStringField;
    qryContratoNUMAGENCIA: TStringField;
    qryContratoIDCONTRATOEMPTMO: TFloatField;
    qryContratoIDCONTRQUITACAO: TFloatField;
    qryContratoIDPESSOA: TFloatField;
    qryContratoIDVERBA: TFloatField;
    qryContratoIDTIPOCONTREMPTMO: TFloatField;
    qryContratoIDPLANOPREV: TFloatField;
    qryContratoIDPATRO: TFloatField;
    qryContratoNUMPARCELAS: TFloatField;
    qryContratoIDINSCRICAOEMPTMO: TFloatField;
    qryContratoIDBENEF: TFloatField;
    qryContratoIDCBANCARIA: TFloatField;
    qryContratoIDCBANCARIADEB: TFloatField;
    qryContratoCODFORMAPAG: TFloatField;
    qryContratoPORTFORMAPAG: TFloatField;
    qryContratoPORTFORMAREC: TFloatField;
    qryContratoDATACANC: TDateTimeField;
    qryContratoDATACREDITO: TDateTimeField;
    qryContratoDATASITUACAO: TDateTimeField;
    qryContratoDATAASSINATURA: TDateTimeField;
    qryContratoDATAPRIMPARC: TDateTimeField;
    qryContratoVLRCONTRATO: TFloatField;
    qryContratoVLRPARCELA: TFloatField;
    qryContratoTXJUROS: TFloatField;
    qryContratoFLGSITUACAO: TStringField;
    qryContratoFLGFORMAREC: TStringField;
    qryContratoFLGFORMAPAG: TStringField;
    qryContratoVLRSALBASE: TFloatField;
    qryContratoVLRMARGEM: TFloatField;
    qryContratoVLRMAXPERMIT: TFloatField;
    qryContratoMOECODIGO: TFloatField;
    qryContratoIDTIPOSUSPEMPTMO: TFloatField;
    qryContratoDATAINICIOSUSP: TDateTimeField;
    qryContratoDATAFIMSUSP: TDateTimeField;
    qryContratoANOSUSPENSAO: TFloatField;
    qryContratoMESSUSPENSAO: TFloatField;
    qryContratoIDPLANOORIGEM: TFloatField;
    qryContratoMOESIGLA: TStringField;
    qryContratoTSEDESCRICAO: TStringField;
    qryContratoNOMERESPONSAVEL: TStringField;
    qryContratoBANCODEB: TStringField;
    qryContratoCONTACORRENTEDEB: TStringField;
    qryContratoNUMAGENCIADEB: TStringField;
    qryContratoNUMPARCDESCONTO: TFloatField;
    qryContratoIDSITPART: TFloatField;
    qryContratoSITUACAO_INT: TStringField;
    qryContratoSITUACAO_INT_PLANO: TStringField;
    qryContratoSITUACAO_INT_FUNC: TStringField;
    qryContratoSITUACAO: TStringField;
    qryContratoSITUACAO_PLANO: TStringField;
    qryContratoSITUACAO_FUNC: TStringField;
    qryEncerraSuspensoes: TwwQuery;
    DateTimeField1: TDateTimeField;
    qryUltimaSuspensaoEncerradaHSCFINALSUSP: TDateTimeField;

      procedure SpeedButton1Click(Sender: TObject);
      procedure SalvarClick(Sender: TObject);
      procedure ImprimirClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);


   private  // Private declarations

      dDataInicioSusp   : TDateTime;
      dDataFimSusp      : TDateTime;

      function DataInicioSuspensao(const IDContrato: Extended): TDateTime;
      function ExisteSuspensaoAtiva(const IDContrato: Extended): Boolean;

      function TestaSuspensao(const IDContrato  : Extended;
                              const iQuantMeses : Integer
                             ): Boolean;


   public   // Public declarations


   end;



var
  frmExecArqSupensaoCobranca: TfrmExecArqSupensaoCobranca;



implementation
{$R *.DFM}
uses
//   uFuncoesFuncef,
   uFuncoesEmptmo, uCalcEmptmo,
   UDataBase, dBaseDados, UMensErro, USistema;



procedure TfrmExecArqSupensaoCobranca.SpeedButton1Click(Sender: TObject);
begin
   inherited;
   if OpenDialog.Execute then edtNomeArquivo.Text := OpenDialog.FileName;
end;



procedure TfrmExecArqSupensaoCobranca.SalvarClick(Sender: TObject);
begin
   inherited;
   if SaveDialog.Execute then MemResult.Lines.SaveToFile(SaveDialog.FileName);
end;



procedure TfrmExecArqSupensaoCobranca.ImprimirClick(Sender: TObject);
begin
   inherited;
   MemResult.Print('');
end;



procedure TfrmExecArqSupensaoCobranca.bbtnConfirmarClick(Sender: TObject);
var
   Arquivo     : TextFile;
   sLinha      : String;
   sMatricula  : String;
   i           : Integer;
   iQuantMeses : Integer;
   iInteger    : Integer;
begin
   inherited;

   MemResult.Lines.Clear;

   if edtNomeArquivo.Text = '' then
   begin
      MsgDlg('Favor informar o arquivo.', 'Aviso', mtWarning, [mbOK], 0);
      Repaint;
      Exit;
   end;

   AssignFile(Arquivo, OpenDialog.FileName);
   Reset(Arquivo);

   memResult.Lines.Add('Início do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
   memResult.Lines.Add(' ');

   memResult.Lines.Add('Atualizando suspensões encerradas...');
   memResult.Lines.Add(' ');

   // ----------------------------------------------------------------------------------------------


   try
      with qryEncerraSuspensoes do
      begin
         LimpaParametros(qryEncerraSuspensoes);
         ParamByName('PHSCFINALSUSP').AsDateTime := Sysdate;
         ExecSQL;

         memResult.Lines.Add(IntToStr(RowsAffected) + ' Suspensões encerradas atualizadas');
         memResult.Lines.Add(' ');
      end;
   except
      memResult.Lines.Add('Erro no processo de encerramento de suspensões');
      memResult.Lines.Add(' ');

      Exit;
   end;


   // ----------------------------------------------------------------------------------------------

   memResult.Lines.Add('                Nº Contrato     Matrícula       Meses Data Fim  ');
   memResult.Lines.Add('                --------------- --------------- ----- ----------');

   i := 0;

   while not(EOF(Arquivo)) do
   begin
      ReadLn(Arquivo, sLinha);
      inc(i);

      sMatricula   := Copy(sLinha, 1, 7);
      iQuantMeses  := StrToInt(Copy(sLinha, 9, 1));

      // -------------------------------------------------------------------------------------------
      // 1º - Determinar o contrato
      // -------------------------------------------------------------------------------------------
      with qryBuscaContrato do
      begin
         LimpaParametros(qryBuscaContrato);
         ParamByName('PMATRICULA').AsString := sMatricula;
         Open;
      end;

      case qryBuscaContrato.RecordCount of

         0:
         begin
            memResult.Lines.Add(CompletaInicio(IntToStr(i), ' ', 4) + ' ' +
                                FormatDateTime('hh:mm:ss', Now) + ' - ' +
                                CompletaInicio(' ', ' ', 15) + ' ' +
                                CompletaFim(sMatricula, ' ', 15) + ' ' +
                                CompletaInicio(IntToStr(iQuantMeses), ' ', 5) + ' ' +
                                CompletaFim(' ', ' ', 10) + ' ' +
                                'Contrato não localizado'
                               );

            Application.ProcessMessages;
            Continue;
         end;

         1: begin end;

      else
         begin
            memResult.Lines.Add(CompletaInicio(IntToStr(i), ' ', 4) + ' ' +
                                FormatDateTime('hh:mm:ss', Now) + ' - ' +
                                CompletaInicio(' ', ' ', 15) + ' ' +
                                CompletaFim(sMatricula, ' ', 15) + ' ' +
                                CompletaInicio(IntToStr(iQuantMeses), ' ', 5) + ' ' +
                                CompletaFim(' ', ' ', 10) + ' ' +
                                'Mais de um contrato localizado'
                               );

            Application.ProcessMessages;
            Continue;
         end;
      end;  // case qryBuscaContrato.RecordCount of


      // -------------------------------------------------------------------------------------------
      // 2º - Abrir os dados de Tipo de Suspensão
      // -------------------------------------------------------------------------------------------
      with qryLookTipoSusp do
      begin
         LimpaParametros(qryLookTipoSusp);
         ParamByName('PIDTIPOCONTREMPTMO').AsFloat := qryBuscaContratoIDTIPOCONTREMPTMO.AsFloat;
         Open;
      end;

      // -------------------------------------------------------------------------------------------
      // 4º - Rodar a regra com a data inicial e a quant de meses
      // -------------------------------------------------------------------------------------------
      if not(TestaSuspensao(qryBuscaContratoIDCONTRATOEMPTMO.AsFloat, iQuantMeses)) then
      begin
         memResult.Lines.Add(CompletaInicio(IntToStr(i), ' ', 4) + ' ' +
                             FormatDateTime('hh:mm:ss', Now) + ' - ' +
                             CompletaInicio(FormatFloat('#0', qryBuscaContratoIDCONTRATOEMPTMO.AsFloat), ' ', 15) + ' ' +
                             CompletaFim(sMatricula, ' ', 15) + ' ' +
                             CompletaInicio(IntToStr(iQuantMeses), ' ', 5) + ' ' +
                             CompletaFim(' ', ' ', 10) + ' ' +
                             'Não é permitida a suspensão'
                            );

         Application.ProcessMessages;
         Continue;
      end;

      // -------------------------------------------------------------------------------------------
      // 5º - Verifica se já existe suspensão ativa
      // -------------------------------------------------------------------------------------------

      if ExisteSuspensaoAtiva(qryBuscaContratoIDCONTRATOEMPTMO.AsFloat) then
      begin
         memResult.Lines.Add(CompletaInicio(IntToStr(i), ' ', 4) + ' ' +
                             FormatDateTime('hh:mm:ss', Now) + ' - ' +
                             CompletaInicio(FormatFloat('#0', qryBuscaContratoIDCONTRATOEMPTMO.AsFloat), ' ', 15) + ' ' +
                             CompletaFim(sMatricula, ' ', 15) + ' ' +
                             CompletaInicio(IntToStr(iQuantMeses), ' ', 5) + ' ' +
                             CompletaFim(' ', ' ', 10) + ' ' +
                             'Já existe suspensão ativa'
                            );

         Application.ProcessMessages;
         Continue;
      end;

      // -------------------------------------------------------------------------------------------
      // 6º - Grava
      // -------------------------------------------------------------------------------------------

      try
         with qryInsert do
         begin
            LimpaParametros(qryInsert);
            ParamByName('PIDTIPOSUSPEMPTMO').AsFloat  := qryLookTipoSuspIDTIPOSUSPEMPTMO.AsFloat;
            ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryBuscaContratoIDCONTRATOEMPTMO.AsFloat;
            ParamByName('PFLGSTATUS').AsString        := 'A';
            ParamByName('PFLGFERIAS').AsInteger       := 1;
            ParamByName('PHSCINICIOSUSP').AsDateTime  := dDataInicioSusp;
            ParamByName('PHSCFINALSUSP').AsDateTime   := dDataFimSusp;
            ParamByName('PHSCMESES').AsInteger        := iQuantMeses;
            ParamByName('PHSCUSUATEND').AsString      := 'Arquivo';
            ExecSQL;
         end;

         with qryUpdateContrato do
         begin
            LimpaParametros(qryUpdateContrato);
            ParamByName('PIDTIPOSUSPEMPTMO').AsFloat  := qryLookTipoSuspIDTIPOSUSPEMPTMO.AsFloat;
            ParamByName('PDATAINICIOSUSP').AsDate     := dDataInicioSusp;
            ParamByName('PDATAFIMSUSP').AsDate        := dDataFimSusp;
            ParamByName('PANOSUSPENSAO').AsInteger    := DiasUteis.ExtraiAno(dDataInicioSusp);
            ParamByName('PMESSUSPENSAO').AsInteger    := DiasUteis.ExtraiMes(dDataInicioSusp);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryBuscaContratoIDCONTRATOEMPTMO.AsFloat;
            ExecSQL;
         end;

         memResult.Lines.Add(CompletaInicio(IntToStr(i), ' ', 4) + ' ' +
                             FormatDateTime('hh:mm:ss', Now) + ' - ' +
                             CompletaInicio(FormatFloat('#0', qryBuscaContratoIDCONTRATOEMPTMO.AsFloat), ' ', 15) + ' ' +
                             CompletaFim(sMatricula, ' ', 15) + ' ' +
                             CompletaInicio(IntToStr(iQuantMeses), ' ', 5) + ' ' +
                             CompletaFim(FormatDateTime('dd/mm/yyyy', dDataFimSusp), ' ', 10) + ' ' +
                             ' '
                            );

      except
         on E:Exception do
         begin
            memResult.Lines.Add(CompletaInicio(IntToStr(i), ' ', 4) + ' ' +
                                FormatDateTime('hh:mm:ss', Now) + ' - ' +
                                CompletaInicio(FormatFloat('#0', qryBuscaContratoIDCONTRATOEMPTMO.AsFloat), ' ', 15) + ' ' +
                                CompletaFim(sMatricula, ' ', 15) + ' ' +
                                CompletaInicio(IntToStr(iQuantMeses), ' ', 5) + ' ' +
                                CompletaFim(' ', ' ', 10) + ' ' +
                                'ERRO ao gravar suspensão' + E.Message
                               );
         end;
      end;

      // -------------------------------------------------------------------------------------------
   end;

   memResult.Lines.Add(' ');
   memResult.Lines.Add('Término do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));

   CloseFile(Arquivo);
end;



function TfrmExecArqSupensaoCobranca.TestaSuspensao(const IDContrato  : Extended;
                                                    const iQuantMeses : Integer
                                                   ): Boolean;
var
   iNumParcAberto    : Integer;
   iNumParcPagas     : Integer;
   iExcepcional      : Integer;
   dDataInicioAnt    : TDateTime;
   dDataFimAnt       : TDateTime;
begin
   Result         := False;

   iNumParcAberto := 0;
   iNumParcPagas  := 0;
   dDataInicioAnt := -1;

   // ----------------------------------------------------------------------------------------------

   with qryContrato do
   begin
      LimpaParametros(qryContrato);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := IDContrato;
      Open;
   end;

   // ----------------------------------------------------------------------------------------------

   dDataInicioSusp := DataInicioSuspensao(IDContrato);

   // ----------------------------------------------------------------------------------------------

   with qryParcelasEmAberto do
   begin
      LimpaParametros(qryParcelasEmAberto);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat     := IDContrato;
      ParamByName('PHMEDATAPREVISTA').AsDateTime   := Date;
      Open;

      iNumParcAberto := qryParcelasEmAbertoTOTAL.AsInteger;

      Close;
   end;

   // ----------------------------------------------------------------------------------------------

   LimpaParametros(qryParcelasPagas);
   qryParcelasPagas.ParamByName('PIDCONTRATOEMPTMO').AsFloat := IDContrato;
   qryParcelasPagas.Open;

   iNumParcPagas := qryParcelasPagasTOTAL.AsInteger;

   qryParcelasPagas.Close;

   // ----------------------------------------------------------------------------------------------

   with qryUltimaSuspensaoEncerrada do
   begin
      LimpaParametros(qryUltimaSuspensaoEncerrada);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := IDContrato;
      Open;

      dDataInicioAnt := qryUltimaSuspensaoEncerradaHSCINICIOSUSP.AsDateTime;
      dDataFimAnt    := qryUltimaSuspensaoEncerrada.FieldByName('HSCFINALSUSP').AsDateTime;//Fanuel Junior SOL174268/8141 Kintana1573410
      Close;
   end;

   // ----------------------------------------------------------------------------------------------

   iExcepcional := 0;
   dDataFimSusp := CalcEmptmo.ValidaSuspensao(qryLookTipoSuspIDREGRAVALIDSUSP.AsInteger,
                                              IDContrato,
                                              qryContratoIDPESSOA.AsInteger,
                                              qryContratoIDBENEF.AsInteger,
                                              qryContratoIDPATRO.AsInteger,
                                              qryContratoFLGINTERNO.AsString,
                                              qryLookTipoSuspIDTIPOSUSPEMPTMO.AsInteger,
                                              iQuantMeses,
                                              dDataInicioSusp,
                                              qryLookTipoSuspTSEFINALSUSP.AsDateTime,
                                              1,
                                              iNumParcAberto,
                                              iNumParcPagas,
                                              dDataInicioAnt,
                                              dDataFimAnt,//Fanuel Junior SOL174268/8141 Kintana
                                              0,
                                              0, // qryContratoIDTIPOSUSPEMPTMO.AsInteger,
                                              iExcepcional,
                                              qryContratoIDPESSJURCEDIDO.AsInteger,
                                              1
                                             );

   // ----------------------------------------------------------------------------------------------

   if dDataFimSusp > Date then
   begin
      Result := True;
   end;
end;



function TfrmExecArqSupensaoCobranca.DataInicioSuspensao(const IDContrato: Extended): TDateTime;
begin
   with qryExistePrestacao do
   begin
      LimpaParametros(qryExistePrestacao);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := IDContrato;
      ParamByName('HMEDATAPREVISTA').AsDateTime := Date;

      Open;

      if not(isEmpty) then
      begin
         Result := qryExistePrestacaoHMEDATAPREVISTA.AsDateTime;
      end
      else
      begin
         Result := Date;
      end;
   end;
end;



function TfrmExecArqSupensaoCobranca.ExisteSuspensaoAtiva(const IDContrato: Extended): Boolean;
var
   query : TwwQuery;
   sSQL  : String;
begin
   Result := False;

   query  := TwwQuery.Create(nil);
   query.DatabaseName := 'BaseDados';

   try
      sSQL := 'SELECT COUNT(*) FROM HISTSUSPCOBEP ' + #13 +
              'WHERE  IDCONTRATOEMPTMO = ' + FormatFloat('#0', IDContrato) + #13 +
              'AND    FLGSTATUS        = ' + QuotedStr('A') + #13;
      query.SQL.Text := sSQL;
      query.Open;

      Result := (query.Fields[0].AsInteger > 0);

      query.Close;

   finally
      query.Close;
      query.Free;
   end;
end;



end.
