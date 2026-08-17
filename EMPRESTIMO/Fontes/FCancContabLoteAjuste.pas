{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SIG 77836 Tibero
Responsável : Everson Cunha
Data        : 05/11/2018
Descrição   : Implementado o cachedupdates para que o usuário não precise carre-
              gar novamente quando for excluir várias planilhas
--------------------------------------------------------------------------------
Pendência   : SOL 253185 Kintana 771995
Responsável : William Moreira da Silva
Data        : 07/05/2015
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : - qryPlanilha
Data      : 11/07/2005
Autor     : André Pontes
Pendência : 19592
Descrição : Considerado evento 7 além do 8, com qryPlanilha "localizada".
--------------------------------------------------------------------------------
Rotina    : - qryPlanilha
Data      : 11/07/2005
Autor     : André Pontes
Pendência : 19592
Descrição : Considerado evento 7 além do 8, com qryPlanilha "localizada".
--------------------------------------------------------------------------------
Rotina    : Várias (VerificaPreenchimento e declarações em outros lugares)
Data      : 03/06/2005
Autor     : André Pontes
Pendência : 19404
Descrição : Bloqueio de contabilização / estorno / exclusão de acordo com
            parâmetro contábil por módulo, além do TestaPeríodo que já era feito
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCancContabLoteAjuste;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
   wwdblook, wwdbdatetimepicker, Db, DBTables, Wwquery, Wwdatsrc,
   uCtrlContab, uCtrlPadroes, uTypesEmptmo;

type
   TfrmCancContabLoteAjuste = class(TfrmWizardMTEP)
      GroupBox3: TGroupBox;
      Label5: TLabel;
      Label6: TLabel;
      edtDataIni: TwwDBDateTimePicker;
      edtDataFim: TwwDBDateTimePicker;
      Panel3: TPanel;
      DBgrdHistMov: TwwDBGrid;
    dsPlanilha: TwwDataSource;
    qryPlanilha: TwwQuery;
    qryPlanilhaPLNDATDIA: TDateTimeField;
    qryPlanilhaPLNCODIGO: TFloatField;
    qryPlanilhaPLNPLANIL: TFloatField;
    qryPlanilhaTOTAL_CONTRATOS: TFloatField;
    qryPlanilhaEFETIVADA: TStringField;
    qryPlanilhaPLNEFETIVADO: TStringField;
    qryPlanilhaPERNUMERO: TFloatField;
    qryPlanilhaPEREXERCICIO: TFloatField;
    qryPlanilhaIDMODULO: TFloatField;
    qryPlanilhaIDPESSOA: TFloatField;
    updPlanilha: TUpdateSQL;

      procedure FormShow(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);


   private  // Private declarations

      Contab : TCtrlContab;   // André Pontes - 03/06/2005 - pendência 19404

      procedure AbreQueries;
      function  VerificaPreenchimentoFiltro: Boolean;
      function  VerificaPreenchimento: Boolean;

      function  AbrePlanilhas: Boolean;


   public   // Public declarations

   
   end;



var
  frmCancContabLoteAjuste: TfrmCancContabLoteAjuste;



implementation
{$R *.DFM}
uses
   uFuncoesEmptmo, uSistema, dLookEmptmo, uVerificaPreenchimento, dEmptmo,
   uMensErro, dBaseDados, uIntegraEmptmo, uDatabase, uModulo, fProgresso,
   uLancContab, dIntegraEmptmo;




procedure TfrmCancContabLoteAjuste.AbreQueries;
begin
   // PortadorForma
   with dtmLookEmptmo.qryLookPortadorFormaP do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaP);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IDEmpresa;
      Open;
   end;
end;



function TfrmCancContabLoteAjuste.VerificaPreenchimentoFiltro: Boolean;
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




function TfrmCancContabLoteAjuste.VerificaPreenchimento: Boolean;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := False;

   try
      // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
      // estorno na data de cancelamento indicada
      sDataLanc   := FormatDateTime('dd/mm/yyyy', qryPlanilhaPLNDATDIA.AsDateTime);
      iEmpresa    := Sistema.idEmpresa;
      sMsgContab  := '';

      if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
         raise EValidacao.CreateVal('Não é possível excluir a planilha contábil:' + #13 + '"' + sMsgContab + '"', bbtnConfirmar);

      // André Pontes - 03/06/2005 - pendência 19404
      if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
      begin
         sMsgContab := Contab.MessageInfo;
         raise EValidacao.CreateVal('Não é possível excluir a planilha contábil:' + #13 + '"' + sMsgContab + '"', bbtnConfirmar);
      end;
      // FIM André Pontes - 03/06/2005 - pendência 19404

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




procedure TfrmCancContabLoteAjuste.FormShow(Sender: TObject);
var
   dDataHoje : TDateTime;
   dDataIni  : TDateTime;
begin
   inherited;

   // preenche as datas - período sempre de Domingo a Sábado
   dDataHoje         :=  Sysdate;

   case DayOfWeek(dDataHoje) of
      1, 2, 3, 4: dDataIni := dDataHoje - (DayOfWeek(dDataHoje) + 6);
      5, 6, 7:    dDataIni := dDataHoje - (DayOfWeek(dDataHoje) - 1);
   end;

   edtDataIni.Date   := dDataIni;
   edtDataFim.Date   := dDataIni + 6;

   ParametrosSistema;

   AbreQueries;
end;



function TfrmCancContabLoteAjuste.AbrePlanilhas: Boolean;
begin
   Result := False;

   //William Moreira da Silva SOL 253185 PPM 771995 - Início
   try
      MostraEspera('Buscando planilhas...');
      try
         with qryPlanilha do
         begin
              LimpaParametros(qryPlanilha);
              ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
              ParamByName('PDATAINI').AsDate            := trunc(edtDataIni.Date);
              ParamByName('PDATAFIM').AsDate            := trunc(edtDataFim.Date);
              Open;

              if not(IsEmpty) then Result := True;
         end;

      except
            on E:Exception do
            begin
                 MsgDlg('Ocorreu um ERRO ao buscar a(s) Planilha(s): ' + E.Message + '!',
                'Empréstimo', mtError, [mbOk], 0);
                Repaint;
            end;
      end;
   finally
      EscondeEspera;
   end;
   //William Moreira da Silva SOL 253185 PPM 771995 - Início
end;



procedure TfrmCancContabLoteAjuste.bbtnConfirmarClick(Sender: TObject);
var
   rLogTotalPrev : TLogTotalPrev;
begin
   if VerificaPreenchimento then
   begin
      IntegraEmptmo.DesfazContabilizacaoPorPlanilha(qryPlanilhaPLNCODIGO.AsFloat, True);

      // -------------------------------------------------------------------------------------------
      // André Pontes - 18/01/2006 - LogPlanilha - OK

      LimpaRegistroLog(rLogTotalPrev);

      rLogTotalPrev.IDModulo   := Sistema.IDModulo;
      rLogTotalPrev.IDContrato := -1;
      rLogTotalPrev.IDHistMov  := -1;
      rLogTotalPrev.CodPlanDoc := qryPlanilhaPLNCODIGO.AsFloat;
      rLogTotalPrev.Origem     := 77;
      rLogTotalPrev.Operacao   := 'DesfazContabilizacaoPorPlanilha - Ajuste';
      rLogTotalPrev.Data       := SysDate;
      rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
      rLogTotalPrev.Versao     := Sistema.Versao;

      GravaLogTotalPrev(rLogTotalPrev);

      // -------------------------------------------------------------------------------------------

      MsgDlg('Contabilização Desfeita', 'Empréstimo', mtInformation, [mbOK], 0);

      //Everson Cunha - SIG 77836 Tibero - 05/11/2018 - Início
      qryPlanilha.CachedUpdates := True;
      qryPlanilha.Delete;
      //Everson Cunha - SIG 77836 Tibero - 05/11/2018 - Fim

      Repaint;

      //AbrePlanilhas; //William Moreira da Silva SOL 253185 PPM 771995

      //Everson Cunha - SIG 77836 Tibero - 05/11/2018 - Início
      if qryPlanilha.RecordCount = 0 then
      begin
        inherited;
      end;
      //Everson Cunha - SIG 77836 Tibero - 05/11/2018 - Fim
   end;
end;



procedure TfrmCancContabLoteAjuste.btnContinuarClick(Sender: TObject);
begin
   if VerificaPreenchimentoFiltro then
   begin
      if AbrePlanilhas then
      begin
         inherited;
      end
      else
      begin
         MsgDlg('Não há Planilhas para o período de datas indicado!', 'Empréstimo', mtWarning, [mbOK], 0);
         Repaint;
      end;
   end;
end;



procedure TfrmCancContabLoteAjuste.FormCreate(Sender: TObject);
begin
   inherited;

   // André Pontes - 03/06/2005 - pendência 19404
   Contab := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True
                    );

   Contab.OpenTransaction := False;
   // FIM André Pontes - 03/06/2005 - pendência 19404
end;



procedure TfrmCancContabLoteAjuste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Contab.Free;   // André Pontes - 03/06/2005 - pendência 19404
   inherited;
end;



end.
