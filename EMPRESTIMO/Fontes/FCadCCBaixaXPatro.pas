{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------

Pendência   : WO31744
Responsável : Leandro Pocebon
Data        : 13/02/2026
Descrição   : Tratamento verificação plano conta
--------------------------------------------------------------------------------}
unit FCadCCBaixaXPatro;

interface

uses
   {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroDetalhe, StdCtrls, wwdblook, Db, DBTables, Wwquery,
   CmEventosCadastro, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
   Buttons, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, TB97, ComCtrls, ExtCtrls,
   Mask, DBCtrls;

type
   TfrmCadCCBaixaXPatro = class(TfrmCadastroDetalhe)
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      Panel3: TPanel;
      DBcboPatro: TwwDBLookupCombo;
      Label1: TLabel;
      lblCCDebFinan: TLabel;
      btnLimpaContaCBaixa: TBitBtn;
      btnBuscaContaCBaixa: TBitBtn;
      DBedtCCBaixa: TDBEdit;
      qryIDTIPOCONTRXPATRO: TFloatField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryIDPATRO: TFloatField;
      qryIDPLANOPREV: TFloatField;
      qryCCBAIXA: TStringField;
      qryPLANO: TFloatField;
      qryTCEDESCRICAO: TStringField;
      qryVerificaOcorrencia: TwwQuery;
      DBcboTipoReceb: TwwDBLookupCombo;
      DBcboUnidNegoc: TwwDBLookupCombo;
      DBcboCentroRespon: TwwDBLookupCombo;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      qryIDPESSOA: TFloatField;
      qryRECPAG: TStringField;
      qryCODTIPRECDES: TStringField;
      qryUNIDNEGOC: TFloatField;
      qryCODCENTRORESPON: TStringField;
      Label6: TLabel;
      DBcboTipoDoc: TwwDBLookupCombo;
      Label7: TLabel;
      DBcboPortForma: TwwDBLookupCombo;
      qryCODPORTFORMA: TFloatField;
      qryCODTIPDOC: TFloatField;

      procedure FormCreate(Sender: TObject);
      procedure btnBuscaContaCBaixaClick(Sender: TObject);
      procedure btnLimpaContaCBaixaClick(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure DBedtCCBaixaExit(Sender: TObject);
      procedure DBcboTipoContratoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure DBcboPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure qryBeforeEdit(DataSet: TDataSet);
      procedure qryAfterPost(DataSet: TDataSet);
      procedure DBcboTipoRecebCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoContratoExit(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);


   private // Private declarations

      iIndiceAnterior : Int64;

      procedure Sel(i: Int64);

      function VerificaContaContabil: Boolean;
      function VerificaPreenchimento: Boolean;
      function VerificaOcorrencia: Boolean;


   public // Public declarations

   end;



var
  frmCadCCBaixaXPatro: TfrmCadCCBaixaXPatro;



implementation
{$R *.DFM}
uses
   dMS, dLookEmptmo, dEmptmo,
   uModulo, uSistema, uVerificaPreenchimento, uFuncoesEmptmo,
   uDataBase, uMensErro, uIntegraBack;



procedure TfrmCadCCBaixaXPatro.Sel(i: Int64);
begin
   with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDPATRO').AsInteger := i;
      Open;
   end;
end;



function TfrmCadCCBaixaXPatro.VerificaContaContabil: Boolean;
var
   s        : string;
begin
   Result := False;
   Screen.Cursor := crHourGlass;

   try

      try

         s := trim(qryCCBAIXA.AsString);

         if length(s) > 0 then begin

            // verifica se existe a conta digitada (para ser + rápido', a query só dá COUNT)
            with dtmEmptmo.qryVerificaConta do begin
               LimpaParametros(dtmEmptmo.qryVerificaConta);
               ParamByName('PPLANO').asInteger    := Modulo.iPlano;
               //ParamByName('PPLACONTA').asString  := CompletaFim(s, ' ', 18);  //WO31744 Leandro
               ParamByName('PPLACONTA').asString  := s;                          //WO31744 Leandro
               Open;

               (* se não há registros, a Conta não existe *)
               if dtmEmptmo.qryVerificaConta.isEmpty then
                  raise EValidacao.CreateVal('Essa Conta Contábil não é válida!', DBedtCCBaixa);

            end;(* with *)

         end;

      except

         on ev : EValidacao do begin
            Screen.Cursor := crDefault;
            if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
            if ev.Control.CanFocus then ev.Control.SetFocus;
            Exit;
         end;

      end;

      Result := True;

   finally
      dtmEmptmo.qryVerificaConta.Close;
      Screen.Cursor := crDefault;
   end;
end;



function TfrmCadCCBaixaXPatro.VerificaPreenchimento: Boolean;
var
   s        : string;
begin
   Result := False;

   try

      if DBcboPatro.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar a Patrocinadora!', DBcboPatro);

      s := trim(qryCCBAIXA.AsString);
      if length(s) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Conta Contábil de Baixa!', DBedtCCBaixa);

      if DBcboUnidNegoc.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar a Atividade / Projeto!', DBcboUnidNegoc);

      if DBcboTipoReceb.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Recebimento!', DBcboTipoReceb);

      if DBcboCentroRespon.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Centro de Responsabilidade!', DBcboCentroRespon);

      if DBcboTipoDoc.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Documento!', DBcboTipoDoc);

      if DBcboPortForma.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar a Conta de Caixa x Forma de Recebimento!', DBcboPortForma);

   except

      on ev : EValidacao do begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



// funcão para verificação de duplicidade da descrição digitada
function TfrmCadCCBaixaXPatro.VerificaOcorrencia: boolean;
begin
	with qryVerificaOcorrencia do begin
      LimpaParametros(qryVerificaOcorrencia);
      if DBcboTipoContrato.LookupValue <> '' then begin
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := StrToInt(DBcboTipoContrato.LookupValue);
         ParamByName('PIDPATRO').AsInteger            := StrToInt(DBcboPatro.LookupValue);
         ParamByName('PIDTIPOCONTRXPATRO').AsInteger  := iIndiceAnterior;
      end;
    	Open;
	end;

   Result := True;

   try

      // verifica a ocorrência na query e se não é o próprio
      if not(qryVerificaOcorrencia.IsEmpty) then begin
          Result := False;
          raise EValidacao.CreateVal('Já existe um conjunto de parâmetros para a Patrocinadora e o Tipo de Contrato indicados!', DBcboTipoContrato);
      end;

   except

      on ev : EValidacao do begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;
end;



procedure TfrmCadCCBaixaXPatro.FormCreate(Sender: TObject);
begin
	inherited;
   qryCCBAIXA.EditMask := trim(IntegraBack.MascaraPlano) + ';0;_';
end;



procedure TfrmCadCCBaixaXPatro.btnBuscaContaCBaixaClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_CContabil.Executar;
   Repaint;

   if dtmMS.MS_CContabil.RetornouValor then begin

      Screen.Cursor        := crHourGlass;
      qryCCBaixa.AsString  := dtmMS.MS_CContabil.ValoresChave[0];
      qryPLANO.AsInteger   := StrToInt(dtmMS.MS_CContabil.ValoresChave[4]);

   end;
   Screen.Cursor := crDefault;
end;



procedure TfrmCadCCBaixaXPatro.btnLimpaContaCBaixaClick(Sender: TObject);
begin
   inherited;
   qryCCBAIXA.Clear;
end;



procedure TfrmCadCCBaixaXPatro.CmeCadastroConfirma(Sender: TObject);
begin
   try
      if qry.State = dsInsert then qryIDTIPOCONTRXPATRO.asInteger := LeUltRegistro(nil, 'TIPOCONTRXPPATRO');

      (* preenchimento dos campos não ligados diretamente ao banco *)
      if qry.State in dsEditModes then begin
         qryIDPATRO.asInteger    := StrToInt(DBcboPatro.LookupValue);
         qryIDPESSOA.AsInteger   := Sistema.IDEmpresa;
      end;

      inherited;

   except

   end;
end;



procedure TfrmCadCCBaixaXPatro.DBedtCCBaixaExit(Sender: TObject);
begin
   inherited;
   VerificaContaContabil;
end;



procedure TfrmCadCCBaixaXPatro.DBcboTipoContratoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if qry.State in dsEditModes then begin
      if DBcboTipoContrato.LookupValue <> '' then begin
         qryTCEDESCRICAO.AsString := DBcboTipoContrato.LookupValue;
      end else begin
         qryTCEDESCRICAO.Clear;
      end;
   end;
end;



procedure TfrmCadCCBaixaXPatro.FormShow(Sender: TObject);
begin
   inherited;

   (* Patrocinadora *)
   dtmLookEmptmo.qryLookPatro.Close;
   dtmLookEmptmo.qryLookPatro.Open;

   (* Tipo de Contrato *)
   with dtmLookEmptmo.qryLookTipoContr do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.idEmpresa;
      Open;
   end;

   (* Tipo de Recebimento *)
   with dtmLookEmptmo.qryLookTipoReceb do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoReceb);
      ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
      Open;
   end;

   (* Centro de Responsabilidade *)
   with dtmLookEmptmo.qryLookCentroRespon do begin
      LimpaParametros(dtmLookEmptmo.qryLookCentroRespon);
      ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
      Open;
   end;

   (* Atividade / Projeto *)
   with dtmLookEmptmo.qryLookUnidNegocio do begin
      LimpaParametros(dtmLookEmptmo.qryLookUnidNegocio);
      ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
      Open;
   end;

   (* Tipo de Documento *)
   dtmLookEmptmo.qryLookTipoDocRec.Close;
   dtmLookEmptmo.qryLookTipoDocRec.Open;

   (* Portador-Forma *)
   with dtmLookEmptmo.qryLookPortadorFormaR do begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
      Open;
   end;
end;



procedure TfrmCadCCBaixaXPatro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmLookEmptmo.qryLookPatro.Close;
   dtmLookEmptmo.qryLookTipoContr.Close;
   inherited;
end;



procedure TfrmCadCCBaixaXPatro.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ( VerificaPreenchimento and VerificaOcorrencia);

   if Accept then
   begin
      case CmeCadastro.Operacao of
         opInserir:  Accept := Sistema.GravaLogOperacoes('Cad Param Integração de Rec Patro. Inserção.');
         opAlterar:  Accept := Sistema.GravaLogOperacoes('Cad Param Integração de Rec Patro. Alteração.');
         opApagar:   Accept := Sistema.GravaLogOperacoes('Cad Param Integração de Rec Patro. Exclusão.');
      end;
   end;

   if not(Accept) then Raise Exception.Create('Falha na gravação do Log da operação.');
end;



procedure TfrmCadCCBaixaXPatro.DBcboPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   CmeCadastroFind(Self);
end;



procedure TfrmCadCCBaixaXPatro.qryBeforeEdit(DataSet: TDataSet);
begin
   inherited;
	iIndiceAnterior := qryIDTIPOCONTRXPATRO.asInteger;
end;



procedure TfrmCadCCBaixaXPatro.qryAfterPost(DataSet: TDataSet);
begin
   inherited;
	iIndiceAnterior := qryIDTIPOCONTRXPATRO.asInteger;
end;



procedure TfrmCadCCBaixaXPatro.DBcboTipoRecebCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if qry.State in dsEditModes then begin
      if DBcboTipoReceb.LookupValue <> '' then begin
         qryRECPAG.AsString := 'R';
      end else begin
         qryRECPAG.Clear;
      end;
   end;
end;



procedure TfrmCadCCBaixaXPatro.DBcboTipoContratoExit(Sender: TObject);
begin
   inherited;

   if qry.State in dsEditModes then if DBcboTipoContrato.LookupValue = '' then qryTCEDESCRICAO.Clear;
end;



procedure TfrmCadCCBaixaXPatro.CmeCadastroFind(Sender: TObject);
begin
   if DBcboPatro.LookupValue <> '' then begin
      Sel(StrToInt(DBcboPatro.LookupValue));
   end else begin
      Sel(-1);
   end;

   inherited;
end;



end.
