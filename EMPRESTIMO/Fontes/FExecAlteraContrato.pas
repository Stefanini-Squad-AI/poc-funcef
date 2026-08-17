{ --------------------------------------------------------------------------------------------------
Rotina    : AlteraParcelas
Data      : 17/10/2002
Autor     : André Pontes
Descrição : Na alteração da forma de cobrança, todas as parcelas em aberto não enviadas passam a ter
            o HMEFORMACOBRANCA alterado de acordo
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : qry
Data      : 17/10/2002
Autor     : André Pontes
Descrição : Colocado ALTER JOIN na query de Contrato (tabela INSCRICAO)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 01/10/2002
Autor     : Marchetti
Descrição : Colocado as críticas dos beneficiários de seguro, nos mesmos moldes da Inscrição
---------------------------------------------------------------------------------------------------}

unit FExecAlteraContrato;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroCS, Db, CmEventosCadastro, ImgList, Wwdatsrc, MontaSelect,
   DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids, DBGrids, DBCtrls,
   wwdblook, wwdbdatetimepicker, CMDateTimePicker, ComCtrls, Mask, fcLabel,
   FCadastroCSImob, Wwdbigrd, Wwdbgrid, FTelaAut, Menus, wwdbedit, Wwdbspin,
   Wwdotdot, Wwdbcomb;

type
   TfrmExecAlteraContrato = class(TfrmCadastroCSImob)
      qryINSCRICAO: TFloatField;
      qryDATAINSC: TDateTimeField;
      qryIDCONTRATOEMPTMO: TFloatField;
      qryIDBENEF: TFloatField;
      qryDATACREDITO: TDateTimeField;
      qryVLRCONTRATO: TFloatField;
      qryFLGFORMAPAG: TStringField;
      qryFLGFORMAREC: TStringField;
      qryPORTFORMAPAG: TFloatField;
      qryPORTFORMAREC: TFloatField;
      qryDESCSITCONTRATO: TStringField;
      qryINSCRICAONUMERO: TFloatField;
      qrySITUACAO: TStringField;
      qryPLANOPREV: TStringField;
      qryPATRO: TStringField;
      qryMATRICULA: TStringField;
      qryTITULAR: TStringField;
      qryBENEFICIARIO: TStringField;
      qryTCEDESCRICAO: TStringField;
      qryDESCTIPOEMPTMO: TStringField;
      qryBANCO: TStringField;
      qryCONTACORRENTE: TStringField;
      qryNUMAGENCIA: TStringField;
      dsBanco: TDataSource;
      Label27: TLabel;
      Label29: TLabel;
      Label42: TLabel;
      Label8: TLabel;
      Label4: TLabel;
      Label34: TLabel;
      Label41: TLabel;
      Label18: TLabel;
      DBedtCodInsc: TDBEdit;
      DBedtPlanoPrev: TDBEdit;
      DBedtSituacao: TDBEdit;
      DBedtParticipante: TDBEdit;
      DBedtNumContrato: TDBEdit;
      DBedtPatro: TDBEdit;
      DBedtInscricao: TDBEdit;
      DBedtMtrEmpresa: TDBEdit;
      DBedtSitPart: TDBEdit;
      pgcAltContrato: TPageControl;
      tbsInformacoes: TTabSheet;
      Label43: TLabel;
      Label12: TLabel;
      Label17: TLabel;
      Label1: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      DBedtDataInsc: TCMDateTimePicker;
      DBedtDataCredito: TCMDateTimePicker;
      DBedtValSolic: TDBEdit;
      DBedtBeneficiario: TDBEdit;
      DBedtTipoContrato: TDBEdit;
      DBedtTipoEmptmo: TDBEdit;
      tbsAlteraContrato: TTabSheet;
      qryContrato: TwwQuery;
      qryContratoFLGFORMAREC: TStringField;
      qryContratoPORTFORMAREC: TFloatField;
      qryAlteraContrato: TwwQuery;
      qryContratoIDCONTRATOEMPTMO: TFloatField;
      TabSheet1: TTabSheet;
      Dock974: TDock97;
      Toolbar972: TToolbar97;
      sbtnInsereBenef: TToolbarButton97;
      sbtnAlteraBenef: TToolbarButton97;
      sbtnExcluiBenef: TToolbarButton97;
      sbtnNovoBenef: TToolbarButton97;
      dbEdtPercIndeniz: TDBEdit;
      Label36: TLabel;
      wwDBGrid1: TwwDBGrid;
      qryBenefSeguro: TwwQuery;
      qryBenefSeguroNOME: TStringField;
      qryBenefSeguroPERCINDENIZACAO: TFloatField;
      qryBenefSeguroIDBENEFSEGURO: TFloatField;
      dsBenefSeguro: TDataSource;
      updBenefSeguro: TUpdateSQL;
      bbtnOkDetBenef: TBitBtn;
      bbtnCancelarDetBenef: TBitBtn;
      qryIDTIPOSUSPEMPTMO: TFloatField;
      qryDATAINICIOSUSP: TDateTimeField;
      qryDATAFIMSUSP: TDateTimeField;
      qryDATALIBSUSP: TDateTimeField;
      qryHORALIBSUSP: TStringField;
      qryUSUARIOLIBSUSP: TStringField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryFLGSUSPENSAOAUTO: TFloatField;
      qryANOSUSPENSAO: TFloatField;
      qryMESSUSPENSAO: TFloatField;
      qryFLGOBRIGBENEF: TFloatField;
      pnlIntegracao: TPanel;
      Label7: TLabel;
      pnlCAR: TPanel;
      Label30: TLabel;
      Bevel1: TBevel;
      DBcboFormaRecebimento: TwwDBLookupCombo;
      DBrdgDebito: TDBRadioGroup;
      DBgBanco: TDBGrid;
      wwDBLookupCombo1: TwwDBLookupCombo;
    qryAlteraParcelas: TwwQuery;
    qryIDCBANCARIADEB: TFloatField;
    qryContratoIDCBANCARIADEB: TFloatField;
    qryNUMPARCDESCONTO: TFloatField;
    Label11: TLabel;
    wwDBSpinEdit1: TwwDBSpinEdit;
    qryBenefSeguroIDINSCRICAOEMPTMO: TFloatField;
    qryBenefSeguroNUMBANCO: TFloatField;
    qryBenefSeguroCODAGENCIA: TStringField;
    qryBenefSeguroCONTACORRENTE: TStringField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label5: TLabel;

      procedure CmeCadastroFind(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure DBrdgDebitoChange(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure qryAfterOpen(DataSet: TDataSet);
      procedure sbtnExcluiBenefClick(Sender: TObject);
      procedure sbtnNovoBenefClick(Sender: TObject);
      procedure sbtnInsereBenefClick(Sender: TObject);
      procedure sbtnAlteraBenefClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure bbtnOkDetBenefClick(Sender: TObject);
      procedure bbtnCancelarDetBenefClick(Sender: TObject);
      procedure dsBenefSeguroStateChange(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);


   private { Private declarations }

      sTipo : String;

      (* Procedure que abre as queries utilizadas para buscar a Conta Bancária *)
      procedure AbreQueriesBanco;

      (* Procedure que abre as queries utilizadas quando o Débito do Empréstimo será pelo CAR *)
      procedure AbreQueriesDebito;

      (* Seleciona Contrato *)
      procedure Sel(i: Extended);

      (* Cria Log na tabela de ALteraContrato *)
      function AlteraContrato : Boolean;

      (* Verifica se e necessario alterar o contrato e seleciona Tipo de Alteracao*)
      function ValidaAlteracao(const idContrato : Extended; idCBancaria, iPortFormaRec: Int64; const sFormaRec: String): Boolean;

      // Altera a forma de cobrança de todas as parcelas em aberto e não enviadas
      procedure AlteraParcelas;

      function  VerificaBeneficiario : Integer;

      function  CriticaPercentuaisBeneficiarios : Boolean;


   public { Public declarations }


   end;



var
  frmExecAlteraContrato: TfrmExecAlteraContrato;



implementation
{$R *.DFM}
uses
   dMS, DLookEmptmo, dEmptmo, fPessoaBenefSeguro,
   UDatabase,
   DBaseDados,
   USistema,
   UMensErro,        (* MsgDlg *)
   UFuncoesEmptmo, UDiasUteis, UModulo, UCalcEmptmo, UTypesEmptmo;   (* LimpaParametros, AtualizaConjunto *)




procedure TfrmExecAlteraContrato.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      Screen.Cursor := crHourGlass;

      Sel(StrToFloat(MontaSelect.ValoresChave[0]));

      (* Procedure que abre as queries utilizadas para buscar a Conta Bancária *)
      AbreQueriesBanco;

      (* Procedure que abre as queries utilizadas quando o Débito do Empréstimo
       será pelo CAR *)
      AbreQueriesDebito;

      LimpaParametros(dtmLookEmptmo.qryLookTipoSusp);
      dtmLookEmptmo.qryLookTipoSusp.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := qryIDTIPOCONTREMPTMO.AsInteger;
      dtmLookEmptmo.qryLookTipoSusp.Open;
      
      Screen.Cursor := crDefault;
   end;(* if MontaSelect.RetornouValor *)

   (*Habilita botao de confirma se qry estiver populada*)
   bbtnConfirmar.Enabled := not qry.IsEmpty;
end;



procedure TfrmExecAlteraContrato.AbreQueriesBanco;
begin
   (* Procedure que abre as queries utilizadas para buscar a Conta Bancária *)
   with dtmLookEmptmo do
   begin
      with qryLookDadosBancarios do
      begin
        LimpaParametros(qryLookDadosBancarios);
        ParamByName('PIDPESSOA').AsInteger := qryIDBENEF.AsInteger;
        // deveria passar  o idCBancaria...
        Open;
      end;(* with qry *)

   end;(* with dtmLookEmptmo *)
end;



procedure TfrmExecAlteraContrato.AbreQueriesDebito;
begin
  (* Procedure que abre as queries utilizadas quando o Débito do Empréstimo será pelo CAR *)
   with dtmLookEmptmo.qryLookPortadorFormaR do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
   end;(* with dtmLookEmptmo *)
end;



procedure TfrmExecAlteraContrato.Sel(i: Extended);
begin
   (* abre a query principal com os parâmetros passados *)
   (* Procedure da unit UFuncoesEmptmo que fecha a query e limpa todos os parâmetros *)
   LimpaParametros(qry);
   qry.ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
   qry.Open;
end;



procedure TfrmExecAlteraContrato.FormCreate(Sender: TObject);
begin
   inherited;
{
   (* Armazena o Filtro Original do MontaSelect*)
   sFiltroContEmp := dtmMS.MS_ContratoEmptmo.Filtro.Text;
   (* Faz o MontaSelect mostrar, somente os Contratos  que nao estao Encerrados ou Suspensos *)
   (* E -> Encerrado *)
   dtmMS.MS_ContratoEmptmo.Filtro.Add('C.FLGSITUACAO NOT IN (''E'',''S'')');
}
end;



procedure TfrmExecAlteraContrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if (qryBenefSeguro.Active) and (qryBenefSeguro.UpdatesPending) then
   begin
      qryBenefSeguro.RevertRecord;
      qryBenefSeguro.CancelUpdates;
   end;

   inherited;
{
   dtmMS.MS_ContratoEmptmo.Filtro.Clear;
   dtmMS.MS_ContratoEmptmo.Filtro.Add(sFiltroContEmp);
}
end;



procedure TfrmExecAlteraContrato.CmeCadastroEdit(Sender: TObject);
begin
   if qryDESCSITCONTRATO.AsString <> 'Quitado' then
   begin
      inherited;
      pgcAltContrato.ActivePage := tbsAlteraContrato;
      if DBrdgDebito.CanFocus then DBrdgDebito.SetFocus;
   end
   else
   begin
      MsgDlg('Contrato QUITADO NÃO pode ser Alterado.', 'Empréstimo', mtError, [mbOk], 0);
      bbtnCancelarClick(Self);
      Exit;
   end;
end;



procedure TfrmExecAlteraContrato.FormShow(Sender: TObject);
begin
   inherited;

   Sel(-1);
   pgcAltContrato.ActivePage := tbsInformacoes;
end;



(* Verifica se e necessario Alterar, se necessario, retorna o tipo da alteração *)
function TfrmExecAlteraContrato.ValidaAlteracao(const idContrato : Extended; idCBancaria, iPortFormaRec : Int64; const sFormaRec: String) : Boolean;
begin
   Result := False;
   sTipo  := '';

   qryContrato.Close;
   qryContrato.ParamByName('PIDCONTRATOEMPTMO').AsFloat := idContrato;
   qryContrato.Open;

   if not(qryContrato.IsEmpty) then
   begin
      if qryContratoPORTFORMAREC.AsInteger <> iPortFormaRec    then sTipo := 'P';
      if qryContratoIDCBANCARIADEB.AsInteger <> idCBancaria    then sTipo := 'C';
      if qryContratoFLGFORMAREC.AsString <> sFormaRec          then sTipo := 'F';

      if sTipo <> '' then Result := True;
   end;
end;



(* Cria Log da alteração do contrato *)
function TfrmExecAlteraContrato.AlteraContrato: Boolean;
var
   rLogTotalPrev : TLogTotalPrev;
begin
   qryAlteraContrato.Close;
   qryAlteraContrato.ParamByName('PDATA').AsDateTime            := Now;
   qryAlteraContrato.ParamByName('PIDCONTRATOEMPTMO').AsFloat   := qryContratoIDCONTRATOEMPTMO.AsFloat;
   qryAlteraContrato.ParamByName('PIDUSUARIO').AsInteger        := Sistema.IdUsuario;
   qryAlteraContrato.ParamByName('PTIPO').AsString              := sTipo;
   qryAlteraContrato.ParamByName('PIDCBANCARIA').AsInteger      := dtmLookEmptmo.qryLookDadosBancariosIDCBANCARIA.AsInteger;
   qryAlteraContrato.ParamByName('PFLGFORMAREC').AsString       := qryContratoFLGFORMAREC.AsString;

   if not(qryContratoPORTFORMAREC.IsNull) then
   begin
      qryAlteraContrato.ParamByName('PPORTFORMAREC').AsInteger  := qryContratoPORTFORMAREC.AsInteger
   end
   else
   begin
      qryAlteraContrato.ParamByName('PPORTFORMAREC').Clear;
   end;

   try
      qryAlteraContrato.ExecSQL;

      rLogTotalPrev.IDModulo   := Sistema.IDModulo;
      rLogTotalPrev.IDContrato := qryContratoIDCONTRATOEMPTMO.AsFloat;
      rLogTotalPrev.IDHistMov  := -1;
      rLogTotalPrev.Origem     := 0;
      rLogTotalPrev.Operacao   := 'Alteração Contratual de Empréstimo';
      rLogTotalPrev.Data       := SysDate;
      rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
      rLogTotalPrev.Versao     := Sistema.Versao;

      GravaLogTotalPrev(rLogTotalPrev);

      Result := True;
   except
      Result := False;
   end;
end;



procedure TfrmExecAlteraContrato.CmeCadastroConfirma(Sender: TObject);
begin
   if qry.State = dsEdit then
   begin
      qryIDCBANCARIADEB.AsInteger := dtmLookEmptmo.qryLookDadosBancariosIDCBANCARIA.AsInteger;

      AplicaAlteracoes([qry]);
      AlteraContrato;

      if sTipo = 'F' then AlteraParcelas;

      MsgDlg('Processo finalizado. Contrato Alterado.','Empréstimo', mtInformation, [mbOk], 0)
   end;

   inherited;
end;



procedure TfrmExecAlteraContrato.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   //inherited;

   Accept := ValidaAlteracao(qryIDCONTRATOEMPTMO.AsFloat,
                             qryIDCBANCARIADEB.AsInteger,
                             qryPORTFORMAREC.AsInteger,
                             qryFLGFORMAREC.AsString
                             );
{
   if Accept then
   begin
      Accept := Sistema.GravaLogOperacoes('Alteração Contratual : ' +
                                          FloatToStr(qryIDCONTRATOEMPTMO.AsFloat));
   end;

   if not(Accept) then
   begin
      MsgDlg('Falha na gravação do Log da operação.', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
   end;
}
end;



procedure TfrmExecAlteraContrato.DBrdgDebitoChange(Sender: TObject);
begin
   inherited;

   (* Verifica a Forma de Débito do Empréstimo: Contas a Receber ou Folha de Pagamento
      colocando o painel pnlCAR visível ou não *)

   if DBrdgDebito.ItemIndex = 0 then
   begin
      if qry.State = dsEdit then
      begin
         qryPORTFORMAREC.AsInteger  := dtmLookEmptmo.qryLookPortadorFormaRCODPORTFORMA.AsInteger;
         DBcboFormaRecebimento.Text := dtmLookEmptmo.qryLookPortadorFormaRDESCRICAO.AsString;
      end;

      AtualizaConjunto(True, pnlCAR);
   end
   else
   begin
      if qry.State = dsEdit then qryPORTFORMAREC.Clear;
      AtualizaConjunto(False, pnlCAR);
   end;
end;



procedure TfrmExecAlteraContrato.qryAfterOpen(DataSet: TDataSet);
begin
   inherited;
   LimpaParametros(qryBenefSeguro);
   qryBenefSeguro.ParamByName('IDINSCRICAOEMPTMO').AsFloat := qryINSCRICAO.AsFloat;
   qryBenefSeguro.Open;
end;



procedure TfrmExecAlteraContrato.sbtnNovoBenefClick(Sender: TObject);
begin
   inherited;

   AbrirForm(frmPessoaBenefSeguro, TfrmPessoaBenefSeguro, False);

   sbtnNovoBenef.Down := False;
end;



procedure TfrmExecAlteraContrato.sbtnInsereBenefClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_Beneficiario.Executar;

   if dtmMS.MS_Beneficiario.RetornouValor then
   begin
      Repaint;

      qryBenefSeguro.Insert;
      qryBenefSeguroIDINSCRICAOEMPTMO.AsFloat   := qryInscricao.AsFloat;
      qryBenefSeguroIDBENEFSEGURO.AsInteger     := StrToInt(dtmMS.MS_Beneficiario.ValoresChave[0]);
      qryBenefSeguroNOME.AsString               := dtmMS.MS_Beneficiario.ValoresChave[1];
      qryBenefSeguroPERCINDENIZACAO.AsFloat     := 0;

      dbEdtPercIndeniz.SetFocus;
   end;
end;



procedure TfrmExecAlteraContrato.sbtnAlteraBenefClick(Sender: TObject);
begin
   inherited;

   qryBenefSeguro.Edit;
   dbEdtPercIndeniz.SetFocus;
end;



procedure TfrmExecAlteraContrato.sbtnExcluiBenefClick(Sender: TObject);
begin
   inherited;

   if MsgDlg('Confirma a exclusão deste Beneficiário?', 'Empréstimo', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
   begin
      qryBenefSeguro.Delete;
   end;

   sbtnExcluiBenef.Down := False;
end;



procedure TfrmExecAlteraContrato.bbtnConfirmarClick(Sender: TObject);
var
   sMsg: String;
begin
   // ----------------------------------------------------------------------------------------------

   sMsg :=  'Atenção:' + #13 + #13 +
            'Apenas os Itens EM ABERTO e NÃO ENVIADOS serão alterados para refletir a nova ' +
            'forma de cobrança do Contrato.' + #13 + #13 +
            'Se for necessário alterar a forma de cobrança de TODOS os Itens em aberto, ' +
            'é necessário desfazer o envio desses itens ANTES de fazer a alteração contratual. ' + #13 + #10 + '' + #13 + #10 +
            'Deseja prosseguir, alterando APENAS os itens não enviados?';

   if MsgDlg(sMsg, 'Empréstimo', mtWarning, [mbYes, mbNo], 0) = mrNo then
   begin
      Repaint;
      Exit;
   end;
   Repaint;

   // ----------------------------------------------------------------------------------------------

   // Verifica a obrigatoriedade de informaçào de beneficiários de seguro
   if ( qryFLGOBRIGBENEF.AsInteger = 1 ) and ( qryBenefSeguro.RecordCount = 0 ) then
   begin
      MsgDlg('É obrigatória a informação de Beneficiário(s) do Seguro.', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;

   // Verifica os percentuais de indenização
   if not(CriticaPercentuaisBeneficiarios) then
   begin
      if (qryBenefSeguro.Active) and (qryBenefSeguro.UpdatesPending) then
      begin
         qryBenefSeguro.RevertRecord;
         qryBenefSeguro.CancelUpdates;
      end;
      exit;
   end;

   if qry.State in dsEditModes then
   begin
      if (qryBenefSeguro.Active) and (qryBenefSeguro.UpdatesPending) then
      begin
         qryBenefSeguro.ApplyUpdates;
         qryBenefSeguro.CommitUpdates;
      end;

      qry.Post;
      qry.ApplyUpdates;
   end;

   inherited;

   pgcAltContrato.ActivePageIndex := 0;
end;



procedure TfrmExecAlteraContrato.bbtnOkDetBenefClick(Sender: TObject);
var
    Recno : TBookMark;
    fPerc : Real;
    dsEstado   : TDataSetState;
    iInscricao : Extended;
    iBenef     : LongInt;
    sNome      : string;
begin
   inherited;

   dsEstado   := qryBenefSeguro.State;
   iBenef     := qryBenefSeguroIDBENEFSEGURO.AsInteger;
   iInscricao := qryINSCRICAO.AsFloat;
   fPerc      := qryBenefSeguroPERCINDENIZACAO.AsFloat;
   sNome      := qryBenefSeguroNOME.AsString;

   if dsEstado = dsInsert then
   begin
      qryBenefSeguro.Cancel;
      if (qryBenefSeguro.Locate('IDBENEFSEGURO',iBenef,[loCaseInsensitive])) then
      begin
         MsgDlg('Beneficiário Já cadastrado.', 'Empréstimo', mtError, [mbOk], 0);
         qryBenefSeguro.RevertRecord;
         bbtnCancelarDetBenefClick(Self);
         Exit;
      end;
   end;

   if dsEstado = dsInsert then
   begin
      qryBenefSeguro.Insert;
      qryBenefSeguroIDBENEFSEGURO.AsInteger     := iBenef;
      qryBenefSeguroIDINSCRICAOEMPTMO.AsFloat   := iInscricao;
      qryBenefSeguroPERCINDENIZACAO.AsFloat     := fPerc;
      qryBenefSeguroNOME.AsString               := sNome;
   end;

   qryBenefSeguro.Post;

   if qryBenefSeguroIDBENEFSEGURO.AsInteger = qryIDBENEF.AsInteger then
   begin
      MsgDlg('Beneficiário do seguro não pode ser o solicitante do Empréstimo.', 'Empréstimo', mtError, [mbOk], 0);
      qryBenefSeguro.RevertRecord;
      sbtnAlteraBenefClick(Self);
      Exit;
   end;

   if qryBenefSeguroPERCINDENIZACAO.AsFloat = 0 then
   begin
      MsgDlg('Percentual de Indenização não pode ser igual a 0 (zero).', 'Empréstimo', mtError, [mbOk], 0);
      qryBenefSeguro.RevertRecord;
      sbtnAlteraBenefClick(Self);
      Exit;
   end;

   if qryBenefSeguroPERCINDENIZACAO.AsFloat < 0 then
   begin
      MsgDlg('Percentual de Indenização não pode ser negativo.', 'Empréstimo', mtError, [mbOk], 0);
      qryBenefSeguro.RevertRecord;
      sbtnAlteraBenefClick(Self);
      Exit;
   end;

   Recno := qryBenefSeguro.GetBookmark;
   qryBenefSeguro.DisableControls;
   qryBenefSeguro.First;

   fPerc := 0;

   while not qryBenefSeguro.Eof do
   begin
      fPerc := fPerc + qryBenefSeguroPERCINDENIZACAO.AsFloat;
      qryBenefSeguro.Next;
   end;

   qryBenefSeguro.GotoBookmark(Recno);
   qryBenefSeguro.FreeBookmark(Recno);

   qryBenefSeguro.EnableControls;

   if ( fPerc < 100 ) then
   begin
      MsgDlg('ATENÇÃO: Somatório de Percentuais de Indenização ainda não atingiu 100%', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
   end;

   if ( fPerc > 100 ) then
   begin
      MsgDlg('Somatório de Percentuais de Indenização ultrapassa a 100%', 'Empréstimo', mtError, [mbOk], 0);
//      qryBenefSeguro.RevertRecord;
      sbtnAlteraBenefClick(Self);
      Exit;
   end;

end;



procedure TfrmExecAlteraContrato.bbtnCancelarDetBenefClick(Sender: TObject);
begin
   inherited;
   qryBenefSeguro.Cancel;
end;



procedure TfrmExecAlteraContrato.dsBenefSeguroStateChange(Sender: TObject);
begin
   inherited;

   bbtnOkDetBenef.Enabled       := dsBenefSeguro.State in [dsEdit, dsInsert];
   bbtnCancelarDetBenef.Enabled := dsBenefSeguro.State in [dsEdit, dsInsert];
   sbtnInsereBenef.Down         := dsBenefSeguro.State = dsInsert;
   sbtnAlteraBenef.Down         := dsBenefSeguro.State = dsEdit;
end;



procedure TfrmExecAlteraContrato.bbtnCancelarClick(Sender: TObject);
begin
   if (qryBenefSeguro.Active) and (qryBenefSeguro.UpdatesPending) then
   begin
      qryBenefSeguro.RevertRecord;
      qryBenefSeguro.CancelUpdates;
   end;

   pgcAltContrato.ActivePageIndex := 0;
   inherited;
end;



function TfrmExecAlteraContrato.CriticaPercentuaisBeneficiarios : boolean;
begin
   Result := True;
   if ( qryFLGOBRIGBENEF.AsInteger = 1 ) then
   begin
      case VerificaBeneficiario of
         -1:
         begin
            Result := False;
            MsgDlg('Somatório do Percentual de indenização deve ser maior que ZERO.', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
            Exit;
         end;

         -2:
         begin
            Result := False;
            MsgDlg('Somatório do Percentual de indenização deve ser igual a 100%.', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
            Exit;
         end;

         -3:
         begin
            Result := False;
            MsgDlg('Somatório do Percentual de indenização deve ser igual a 100%.', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
            Exit;
         end;
      end;
   end;
end;



function TfrmExecAlteraContrato.VerificaBeneficiario : Integer;
var
   iRecno : TBookMark;
   fPerc  : Real;
begin
   Result := 0;
   iRecno := qryBenefSeguro.GetBookmark;

   with qryBenefSeguro do
   begin
      First;
      fPerc := 0;

      while not(EOF)do
      begin
         fPerc := fPerc + FieldByName('PERCINDENIZACAO').AsFloat;
         Next;
      end;

   end;

   qryBenefSeguro.GotoBookmark(iRecno);
   qryBenefSeguro.FreeBookmark(iRecno);

   if      fPerc = 0   then Result := -1
   else if fPerc < 100 then Result := -2
   else if fPerc > 100 then Result := -3;
end;



procedure TfrmExecAlteraContrato.AlteraParcelas;
begin
   with qryAlteraParcelas do
   begin
      LimpaParametros(qryAlteraParcelas);
      ParamByName('PHMEFORMACOBRANCA').AsString    := qryFLGFORMAREC.AsString;
      ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryIDCONTRATOEMPTMO.AsFloat;
   end;
end;



end.
