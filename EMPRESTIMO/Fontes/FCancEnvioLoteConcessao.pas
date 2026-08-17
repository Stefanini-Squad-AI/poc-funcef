{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 37831
Responsável : William Moreira da Silva
Data        : 06/02/2017
Descrição   : Melhora da performace na busca dos dados (.dfm)
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : - (qryDocumento)
Data      : 07/06/2006
Autor     : André Pontes
Pendência : -
Descrição : Retirado join (DOC.IDFORCLI = BAN.IDFAVORECIDO), que obrigava
            existência do banco na BancoPortForma, quando o processo de envio
            não obriga. O join passa a ser direto com a tabela PESSOA (para
            trazer o nome do favorecido/banco).
--------------------------------------------------------------------------------
Rotina    : -
Data      : 23/07/2004 a 26/07/20040
Autor     : André Pontes
Pendência : 20170 / 20500
Descrição : Na query que lista os documentos, foi criado join com o campo
            CODDOCUMENTO da HistMovEmptmo, para excluir os documentos de outros
            tipos (envio de seguro, p.ex.)
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCancEnvioLoteConcessao;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
   wwdblook, wwdbdatetimepicker, Db, DBTables, Wwquery, Wwdatsrc,
   uTypesEmptmo;

type
   TfrmCancEnvioLoteConcessao = class(TfrmWizardMTEP)
      GroupBox3: TGroupBox;
      Label5: TLabel;
      Label6: TLabel;
      edtDataIni: TwwDBDateTimePicker;
      edtDataFim: TwwDBDateTimePicker;
      Label3: TLabel;
      Panel3: TPanel;
      DBgrdHistMov: TwwDBGrid;
      DBcboPortadorForma: TwwDBLookupCombo;
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
      qryDocumentoPORTADORFORMA: TStringField;
      qryDocumentoNOME: TStringField;
      qryDocumentoVALOR: TFloatField;

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
  frmCancEnvioLoteConcessao: TfrmCancEnvioLoteConcessao;



implementation
{$R *.DFM}
uses
   uFuncoesEmptmo, uSistema, dLookEmptmo, uVerificaPreenchimento, dEmptmo,
   uMensErro, dBaseDados, uIntegraEmptmo, uDatabase, uModulo, fProgresso;




procedure TfrmCancEnvioLoteConcessao.AbreQueries;
begin
   // PortadorForma
   with dtmLookEmptmo.qryLookPortadorFormaP do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaP);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IDEmpresa;
      Open;
   end;
end;



function TfrmCancEnvioLoteConcessao.VerificaPreenchimentoFiltro: Boolean;
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




function TfrmCancEnvioLoteConcessao.VerificaPreenchimentoArquivo: Boolean;
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




procedure TfrmCancEnvioLoteConcessao.FormShow(Sender: TObject);
begin
   inherited;

   edtDataIni.Date   := Date;
   edtDataFim.Date   := Date;

   AbreQueries;
end;



function TfrmCancEnvioLoteConcessao.AbreDocumentos: Boolean;
begin
   Result := False;

   try
      with qryDocumento do
      begin
         LimpaParametros(qryDocumento);
         ParamByName('PDATAINI').AsDate := trunc(edtDataIni.Date);
         ParamByName('PDATAFIM').AsDate := trunc(edtDataFim.Date);
         if DBcboPortadorForma.LookupValue <> '' then ParamByName('PCODPORTFORMA').AsInteger := StrToInt(DBcboPortadorForma.LookupValue);
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



procedure TfrmCancEnvioLoteConcessao.bbtnConfirmarClick(Sender: TObject);
var
   rLogTotalPrev  : TLogTotalPrev;
begin
   if VerificaPreenchimentoArquivo then
   begin
      IntegraEmptmo.DesfazEnvioPorDocumento(qryDocumentoCODDOCUMENTO.AsFloat, True);

      // -------------------------------------------------------------------------------------------
      // André Pontes - 11/01/2006 - LogDocumento - OK

      LimpaRegistroLog(rLogTotalPrev);

      rLogTotalPrev.IDModulo   := Sistema.IDModulo;
      rLogTotalPrev.IDContrato := -1;
      rLogTotalPrev.IDHistMov  := -1;
      rLogTotalPrev.CodPlanDoc := qryDocumentoCODDOCUMENTO.AsFloat;
      rLogTotalPrev.Origem     := 63;
      rLogTotalPrev.Operacao   := 'DesfazEnvioPorDocumento';
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



procedure TfrmCancEnvioLoteConcessao.btnContinuarClick(Sender: TObject);
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
