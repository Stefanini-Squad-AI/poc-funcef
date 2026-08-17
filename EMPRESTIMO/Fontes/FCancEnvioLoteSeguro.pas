{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCancEnvioLoteSeguro;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
   wwdblook, wwdbdatetimepicker, Db, DBTables, Wwquery, Wwdatsrc,
   uTypesEmptmo;

type
   TfrmCancEnvioLoteSeguro = class(TfrmWizardMTEP)
      GroupBox3: TGroupBox;
      Label5: TLabel;
      Label6: TLabel;
      edtDataIni: TwwDBDateTimePicker;
      edtDataFim: TwwDBDateTimePicker;
      Panel3: TPanel;
      DBgrdHistMov: TwwDBGrid;
      qryDocumento: TwwQuery;
      dsDocumento: TwwDataSource;
    qryDocumentoCODDOCUMENTO: TFloatField;
    qryDocumentoIDPESSOA: TFloatField;
    qryDocumentoCODPORTFORMA: TFloatField;
    qryDocumentoIDFORCLI: TFloatField;
    qryDocumentoIDMODULO: TFloatField;
    qryDocumentoRECPAG: TStringField;
    qryDocumentoNODOCUMENTO: TFloatField;
    qryDocumentoCOMPLDOCUMENTO: TStringField;
    qryDocumentoDATAVENCTO: TDateTimeField;
    qryDocumentoSTATUS_DOC: TStringField;
    qryDocumentoOPERACAO: TStringField;
    qryDocumentoNUMAPGR: TFloatField;
    qryDocumentoVALOR: TFloatField;
    qryDocumentoPORTADORFORMA: TStringField;
    qryDocumentoNOME: TStringField;

      procedure FormShow(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);


   private  // Private declarations

      procedure AbreQueries;
      function  VerificaPreenchimentoFiltro: Boolean;
      function  VerificaPreenchimentoArquivo: Boolean;

      function  AbreDocumentos: Boolean;


   public   // Public declarations

   end;



var
  frmCancEnvioLoteSeguro: TfrmCancEnvioLoteSeguro;



implementation
{$R *.DFM}
uses
   uFuncoesEmptmo, uSistema, dLookEmptmo, uVerificaPreenchimento, dEmptmo,
   uMensErro, dBaseDados, uIntegraEmptmo, uDatabase, uModulo, fProgresso;




procedure TfrmCancEnvioLoteSeguro.AbreQueries;
begin
   // PortadorForma
   with dtmLookEmptmo.qryLookPortadorFormaP do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaP);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IDEmpresa;
      Open;
   end;
end;



function TfrmCancEnvioLoteSeguro.VerificaPreenchimentoFiltro: Boolean;
begin
   Result := False;

   try
      // data inicial
      if length(trim(edtDataIni.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data Inicial!', edtDataIni);

      // data final
      if length(trim(edtDataFim.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data Final!', edtDataFim);

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;




function TfrmCancEnvioLoteSeguro.VerificaPreenchimentoArquivo: Boolean;
var
   sMsg        : String;
   iStatusDoc  : Integer;
begin
   Result := False;

   try
      iStatusDoc := IntegraEmptmo.VerificaDocumento(qryDocumentoCODDOCUMENTO.AsFloat, sMsg);

      if (iStatusDoc = -5) or (iStatusDoc = -3) or (iStatusDoc = -2) then
         raise EValidacao.CreateVal(sMsg, DBgrdHistMov);

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;




procedure TfrmCancEnvioLoteSeguro.FormShow(Sender: TObject);
begin
   inherited;

   edtDataIni.Date   := Date;
   edtDataFim.Date   := Date;

   AbreQueries;
end;



function TfrmCancEnvioLoteSeguro.AbreDocumentos: Boolean;
begin
   Result := False;

   try
      with qryDocumento do
      begin
         LimpaParametros(qryDocumento);
         ParamByName('PDATAINI').AsDate := trunc(edtDataIni.Date);
         ParamByName('PDATAFIM').AsDate := trunc(edtDataFim.Date);
         Open;

         if not(IsEmpty) then Result := True;
      end;

   except
      on E:Exception do
      begin
         MsgDlg('Ocorreu um ERRO ao buscar o(s) Documento(s): ' + E.Message + '!',
                'Empréstimo', mtError, [mbOk], 0);
         Repaint;
      end;
   end;
end;



procedure TfrmCancEnvioLoteSeguro.bbtnConfirmarClick(Sender: TObject);
var
   rLogTotalPrev  : TLogTotalPrev;
begin
   if VerificaPreenchimentoArquivo then
   begin
      IntegraEmptmo.DesfazEnvioPorDocumentoProc(qryDocumentoCODDOCUMENTO.AsFloat, True);

      // -------------------------------------------------------------------------------------------
      // André Pontes - 11/01/2006 - LogDocumento - OK

      LimpaRegistroLog(rLogTotalPrev);

      rLogTotalPrev.IDModulo   := Sistema.IDModulo;
      rLogTotalPrev.IDContrato := -1;
      rLogTotalPrev.IDHistMov  := -1;
      rLogTotalPrev.CodPlanDoc := qryDocumentoCODDOCUMENTO.AsFloat;
      rLogTotalPrev.Origem     := 63;
      rLogTotalPrev.Operacao   := 'DesfazEnvioPorDocumentoProc';
      rLogTotalPrev.Data       := SysDate;
      rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
      rLogTotalPrev.Versao     := Sistema.Versao;

      GravaLogTotalPrev(rLogTotalPrev);

      // -------------------------------------------------------------------------------------------

      AbreDocumentos;

      MsgDlg('Envio desfeito.', 'Empréstimo', mtInformation, [mbOK], 0);
      Repaint;

      inherited;
   end;
end;



procedure TfrmCancEnvioLoteSeguro.btnContinuarClick(Sender: TObject);
begin
   if VerificaPreenchimentoFiltro then
   begin
      if AbreDocumentos then
      begin
         inherited;
      end
      else
      begin
         MsgDlg('Não há Documentos para o período de datas indicado!', 'Empréstimo', mtWarning, [mbOK], 0);
         Repaint;
      end;
   end;
end;



end.
