{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------

Pendência   : WO31744
Responsável : Leandro Pocebon
Data        : 13/02/2026
Descrição   : Tratamento verificação plano conta
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo

--------------------------------------------------------------------------------
SOl_KINTANA : 163982/7003_KTN1489901
Data        : 22/11/2011
Autor       : Vinicius Eduardo Nascimento Maciel
Rotina      : recuperaAtividadePerd e CmeCadastroFind
Descrição   : Foi criada uma rotina para alterar atividades desativadas.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : frmCadParamIntegraRec
Data      : 07/11/2005
Autor     : Alberto Carvalho
Pendência : 23251
Descrição : Desabilitar preenchimento de Entidade Contabil
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadParamIntegraRec;

interface

uses
   {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroCSImob, Menus, wwdblook, ExtCtrls, StdCtrls, Mask, DBCtrls,
   ComCtrls, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
   DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, Buttons,
   TB97Tlbr, TB97Ctls, TB97;

type
   TTipoConta = (tcCDebFinan, tcCredFinan, tcCDebFolha, tcCredFolha, tcCDebFinanR, tcCredFinanR, tcCDebFolhaR, tcCredFolhaR);

   TfrmCadParamIntegraRec = class(TfrmCadastroCSImob)
      pgcParametros: TPageControl;
      Label2: TLabel;                            
      DBedtDescricao: TDBEdit;
      Label3: TLabel;             
      tbsCAPCAR: TTabSheet;                              
      tbsFolha: TTabSheet;
      DBcboTipoDesembFolha: TwwDBLookupCombo;
      Label5: TLabel;                                           
      tbsGeral: TTabSheet;
      DBcboTipoRecebDesemb: TwwDBLookupCombo;
      Label15: TLabel;
      Label16: TLabel;
      DBcboUnidNegocio: TwwDBLookupCombo;
      GrpCCDebFinan: TGroupBox;
      Label18: TLabel;
      Label20: TLabel;
      lblCCDebFinan: TLabel;
      btnBuscaContaDebFinan: TBitBtn;
      DBcboCCustDebFinan: TwwDBLookupCombo;
      DBedtCodDebFinan: TDBEdit;
      DBcboSubDebFinan: TwwDBLookupCombo;
      GrpCCCredFinan: TGroupBox;
      Label22: TLabel;
      Label23: TLabel;
      Label24: TLabel;
      lblCCredFinan: TLabel;
      btnBuscaContaCredFinan: TBitBtn;
      DBcboCCustCredFinan: TwwDBLookupCombo;
      DBedtCodCredFinan: TDBEdit;
      DBcboSubCredFinan: TwwDBLookupCombo;
      tbsFiltro: TTabSheet;
      Label7: TLabel;
      Label6: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      Label19: TLabel;
      DBcboPatro: TwwDBLookupCombo;
      DBcboPlanPrev: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      DBcboItemEmptmo: TwwDBLookupCombo;
      Label26: TLabel;
      DBcboCentroRespon: TwwDBLookupCombo;
      grpDebFolha: TGroupBox;
      Label1: TLabel;
      Label10: TLabel;
      lblCCDebFolha: TLabel;
      btnBuscaContaDebFolha: TBitBtn;
      DBcboCCustDebFolha: TwwDBLookupCombo;
      DBedtCodDebFolha: TDBEdit;
      DBcboSubDebFolha: TwwDBLookupCombo;
      grpCredFolha: TGroupBox;
      Label12: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      lblCCredFolha: TLabel;
      btnBuscaContaCredFolha: TBitBtn;
      DBcboCCustCredFolha: TwwDBLookupCombo;
      DBedtCodCredFolha: TDBEdit;
      DBcboSubCredFolha: TwwDBLookupCombo;
      DBedtTipoEmpto: TDBEdit;
      qryIDPARAMINTEGRAEP: TFloatField;
      qryDESCPARAMINTEGRA: TStringField;
      qryRECPAG: TStringField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryIDITEMEMPTMO: TFloatField;
      qryIDPESSOA: TFloatField;
      qryIDEMPRESA: TFloatField;
      qryPLANO: TFloatField;
      qryCCDEBFOLHA: TStringField;
      qryCCUSTDEBFOLHA: TStringField;
      qrySUBCDEBFOLHA: TFloatField;
      qryCCCREDFOLHA: TStringField;
      qryCCUSTCREDFOLHA: TStringField;
      qrySUBCCREDFOLHA: TFloatField;
      qryCCDEBFINAN: TStringField;
      qryCCUSTDEBFINAN: TStringField;
      qrySUBCDEBFINAN: TFloatField;
      qryCCCREDFINAN: TStringField;
      qryCCUSTCREDFINAN: TStringField;
      qrySUBCCREDFINAN: TFloatField;
      qryRECPAGFINAN: TStringField;
      qryTIPORECDESFINAN: TStringField;
      qryRECPAGFOLHA: TStringField;
      qryTIPORECDESFOLHA: TStringField;
      qryUNIDNEGOC: TFloatField;
      qryCODCENTRORESPON: TStringField;
      qryIDPLANOPREV: TFloatField;
      qryIDPATRO: TFloatField;
      qryIDPLANOPREVCONTAB: TFloatField;
      qryIDTIPOEMPTMO: TFloatField;
      qryDESCTIPOEMPTMO: TStringField;
      Label4: TLabel;
      DBcboTipoRecDesFinan: TwwDBLookupCombo;
    tbsFolhaR: TTabSheet;
    grpDebFolhaR: TGroupBox;
    Label11: TLabel;
    Label17: TLabel;
    lblCCDebFolhaR: TLabel;
    btnBuscaContaDebFolhaR: TBitBtn;
    DBcboCCustDebFolhaR: TwwDBLookupCombo;
    DBedtCodDebFolhaR: TDBEdit;
    DBcboSubDebFolhaR: TwwDBLookupCombo;
    grpCredFolhaR: TGroupBox;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    lblCCredFolhaR: TLabel;
    btnBuscaContaCredFolhaR: TBitBtn;
    DBcboCCustCredFolhaR: TwwDBLookupCombo;
    DBedtCodCredFolhaR: TDBEdit;
    DBcboSubCredFolhaR: TwwDBLookupCombo;
    Label30: TLabel;
    DBcboTipoDesembFolhaR: TwwDBLookupCombo;
    qryCCDEBFOLHARESULT: TStringField;
    qryCCCREDFOLHARESULT: TStringField;
    qryCCUSTDEBFOLHARESULT: TStringField;
    qryCCUSTCREDFOLHARESULT: TStringField;
    qrySUBCDEBFOLHARESULT: TFloatField;
    qrySUBCCREDFOLHARESULT: TFloatField;
    qryTIPORECDESFOLHARESULT: TStringField;

      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure btnBuscaContaDebFinanClick(Sender: TObject);
      procedure DBedtCodDebFinanExit(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure DBcboTipoContratoCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
      procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      procedure DBcboItemEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure btnRefreshClick(Sender: TObject);
      procedure btnBuscaContaDebFolhaRClick(Sender: TObject);
      procedure DBedtCodDebFolhaRExit(Sender: TObject);
      procedure DBedtCodCredFolhaRExit(Sender: TObject);
      procedure btnBuscaContaCredFolhaRClick(Sender: TObject);


     private  // Private declarations

      bObrigaCC, bObrigaSC   : boolean;

      procedure AbreQueries;

      procedure Sel(i: int64);

      procedure Preenche(tConta: TTipoconta);
      procedure FiltraContabilidade(tConta: TTipoconta);

      function VerificaContaContabil(tConta: TTipoconta): boolean;

      function VerificaPreenchimento: boolean;
      procedure HabilitaContas;


   public   // Public declarations
   function recuperaAtividadePerd(sCodAtividade: String): String;

   end;

var
  frmCadParamIntegraRec: TfrmCadParamIntegraRec;

implementation
{$R *.DFM}
uses
   uSistema, uModulo, dMS, DLookEmptmo, UFuncoesEmptmo, dEmptmo, uIntegraBack,
   uVerificaPreenchimento, uMensErro, dBaseDados, UDataBase;


procedure TfrmCadParamIntegraRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	FechaQueries;
   inherited;
end;

procedure TfrmCadParamIntegraRec.AbreQueries;
begin
   with dtmLookEmptmo do
   begin
      qryLookPatro.Open;
      qryLookPlanPrev.Open;
      qryLookTipoContr.Open;

      qryLookUnidNegocio.Open;
      qryLookPlanPrevContab.Open;

      with qryLookTipoContr do
      begin
         LimpaParametros(qryLookTipoContr);
         ParamByName('PIDEMPRESAPROP').asInteger := Sistema.IdEmpresa;
         Open;
      end;

      with qryLookItemIntegra do
      begin
         LimpaParametros(qryLookItemIntegra);
         ParamByName('PIDTIPOCONTREMPTMO').asInteger := qryLookTipoContrIDTIPOCONTREMPTMO.AsInteger;
         Open;
      end;

      with qryLookTipoRecebDesemb do
      begin
         LimpaParametros(qryLookTipoRecebDesemb);
         ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
         ParamByName('PRECPAG').AsString    := qrylookitemIntegraITCRECPAG.AsString;
         Open;
      end;

      with qryLookCentroRespon do
      begin
         LimpaParametros(qryLookCentroRespon);
         ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
         Open;
      end;

      with qryLookUnidNegocio do
      begin
         LimpaParametros(qryLookUnidNegocio);
         ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
         Open;
      end;

      with qryLookTipoDesemb do
      begin
         LimpaParametros(qryLookTipoDesemb);
         ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
         Open;
      end;

      with qryLookTipoReceb do
      begin
         LimpaParametros(qryLookTipoReceb);
         ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
         Open;
      end;
   end;
end;

procedure TfrmCadParamIntegraRec.FormCreate(Sender: TObject);
begin
   inherited;

   pgcParametros.ActivePage := tbsFiltro;

   // adiciona o filtro por Empresa Proprietária nos MontaSelect
   MontaSelect.Filtro.Add('PI.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));

   qryCCDEBFINAN.EditMask         := trim(IntegraBack.MascaraPlano) + ';0;_';
   qryCCDEBFOLHA.EditMask         := trim(IntegraBack.MascaraPlano) + ';0;_';
   qryCCCREDFINAN.EditMask        := trim(IntegraBack.MascaraPlano) + ';0;_';
   qryCCCREDFOLHA.EditMask        := trim(IntegraBack.MascaraPlano) + ';0;_';
   qryCCDEBFOLHARESULT.EditMask   := trim(IntegraBack.MascaraPlano) + ';0;_';
   qryCCCREDFOLHARESULT.EditMask  := trim(IntegraBack.MascaraPlano) + ';0;_';

   dtmMS.MS_CContabil.Mascaras[0] := trim(IntegraBack.MascaraPlano) + ';0;_';

   dtmLookEmptmo.qryLookTipoDesembCODTIPRECDES.EditMask := trim(Modulo.sMascaraDesemb) + ';0;_';
   dtmLookEmptmo.qryLookTipoRecebCODTIPRECDES.EditMask  := trim(Modulo.sMascaraReceb)  + ';0;_';
end;

procedure TfrmCadParamIntegraRec.Sel(i: int64);
begin
   // abre a query principal com os parâmetros passados
   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDPARAMINTEGRAEP').AsInteger := i;
      ParamByName('PIDPESSOA').AsInteger         :=  Sistema.idEmpresa;
      ParamByName('PIDEMPRESAPROP').AsInteger    :=  Sistema.idEmpresa;
      Open;
   end;
end;


procedure TfrmCadParamIntegraRec.CmeCadastroInsert(Sender: TObject);
begin
	AbreQueries;

  if DBedtDescricao.CanFocus then
     DBedtDescricao.SetFocus;
     Sel(-1);
	inherited;
end;

procedure TfrmCadParamIntegraRec.btnBuscaContaDebFinanClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_CContabil.Executar;
   Repaint;

   if dtmMS.MS_CContabil.RetornouValor then
      begin
      Screen.Cursor := crHourGlass;

      if (Sender as TBitBtn).Name = 'btnBuscaContaDebFinan'  then
          begin
          qryCCDEBFINAN.Text := dtmMS.MS_CContabil.ValoresChave[0];
          Preenche(tcCDebFinan);
          end;

      if (Sender as TBitBtn).Name = 'btnBuscaContaCredFinan'  then begin
         qryCCCREDFINAN.Text := dtmMS.MS_CContabil.ValoresChave[0];
         Preenche(tcCredFinan);
      end;

      if (Sender as TBitBtn).Name = 'btnBuscaContaDebFolha'  then begin
         qryCCDEBFOLHA.Text := dtmMS.MS_CContabil.ValoresChave[0];
         Preenche(tcCDebFolha);
      end;

      if (Sender as TBitBtn).Name = 'btnBuscaContaDebFolhaR'  then begin
         qryCCDEBFOLHARESULT.Text := dtmMS.MS_CContabil.ValoresChave[0];
         Preenche(tcCDebFolhaR);
      end;

      if (Sender as TBitBtn).Name = 'btnBuscaContaCredFolhaR'  then begin
         qryCCCREDFOLHARESULT.Text := dtmMS.MS_CContabil.ValoresChave[0];
         Preenche(tcCredFolhaR);
      end;

      Screen.Cursor := crDefault;
   end;
end;

procedure TfrmCadParamIntegraRec.Preenche(tConta: TTipoconta);
var
   combo : TwwDBLookupCombo;
begin
   combo := nil;

   if qry.State in dsEditModes then begin

      if VerificaContaContabil(tConta) then begin

         FiltraContabilidade(tConta);

         case tConta of
            tcCDebFinan: combo  := DBcboSubDebFinan;
            tcCDebFolha: combo  := DBcboSubDebFolha;
            tcCredFinan: combo  := DBcboSubCredFinan;
            tcCredFolha: combo  := DBcboSubCredFolha;
            tcCDebFolhaR: combo := DBcboSubDebFolhaR;
            tcCredFolhaR: combo := DBcboSubCredFolhaR;
         end;

         if combo.Enabled then begin
            if combo.CanFocus then
               combo.SetFocus;
         end else begin
            if combo.Enabled then
               if combo.CanFocus then
                  combo.SetFocus;
         end;

      end;
      combo.Modified := False;
   end;
end;


function TfrmCadParamIntegraRec.VerificaContaContabil(tConta: TTipoconta): boolean;
var
   s        : string;
   DBcampo  : TField;
   campo    : TDBEdit;
begin
   Result := False;
   Screen.Cursor := crHourGlass;
   try
      try

         Case tConta of
            tcCDebFinan:
            begin
               DBcampo  := qryCCDEBFINAN;
               campo    := DBedtCodDebFinan;
            end;

            tcCDebFolha:
            begin
               DBcampo  := qryCCDEBFOLHA;
               campo    := DBedtCodDebFolha;
            end;

            tcCDebFolhaR:
            begin
               DBcampo  := qryCCDEBFOLHARESULT;
               campo    := DBedtCodDebFolhaR;
            end;


            tcCredFinan:
            begin
               DBcampo  := qryCCCREDFINAN;
               campo    := DBedtCodCredFinan;
            end;


            tcCredFolha:
            begin
               DBcampo  := qryCCCREDFOLHA;
               campo    := DBedtCodCredFolha;
            end;

            tcCredFolhaR:
            begin
               DBcampo  := qryCCCREDFOLHARESULT;
               campo    := DBedtCodCredFolhaR;
            end;

             else begin
               DBcampo  := nil;
               campo    := nil;
            end;
         end;

         bObrigaSC   := False;
         bObrigaCC   := False;

         s := trim(DBcampo.AsString);
         if (length(s) > 0) then
             begin

            // verifica se existe a conta digitada (para ser + rápido', a query só dá COUNT)
            with dtmEmptmo.qryVerificaConta do begin
               LimpaParametros(dtmEmptmo.qryVerificaConta);
               ParamByName('PPLANO').asInteger    := Modulo.iPlano;
               //ParamByName('PPLACONTA').asString  := CompletaFim(s, ' ', 18);    //WO31744 Leandro
               ParamByName('PPLACONTA').asString  := s;                            //WO31744 Leandro
               Open;

               // se não há registros, a Conta não existe
               if dtmEmptmo.qryVerificaConta.isEmpty then begin
                  raise EValidacao.CreateVal('Essa Conta Contábil não é válida!', campo);
               end else begin

                  bObrigaSC   := dtmEmptmo.qryVerificaContaPLASUBCONTA.asString = 'S';
                  bObrigaCC   := dtmEmptmo.qryVerificaContaPLACCUST.asString    = 'S';
                  Case tConta of
                     tcCDebFinan: lblCCDebFinan.Caption   := 'Conta Contábil: ' + FieldByName('PLANOME').asString;
                     tcCredFinan: lblCCredFinan.Caption   := 'Conta Contábil: ' + FieldByName('PLANOME').asString;
                     tcCDebFolha: lblCCDebFolha.Caption   := 'Conta Contábil: ' + FieldByName('PLANOME').asString;
                     tcCDebFolhaR: lblCCDebFolhaR.Caption := 'Conta Contábil: ' + FieldByName('PLANOME').asString;
                     tcCredFolha: lblCCredFolha.Caption   := 'Conta Contábil: ' + FieldByName('PLANOME').asString;
                     tcCredFolhaR: lblCCredFolhaR.Caption := 'Conta Contábil: ' + FieldByName('PLANOME').asString;
                  end;
               end;

            end;(* with *)

         end else begin

            with dtmEmptmo.qryVerificaConta do begin

               Case tConta of
                  tcCDebFinan: lblCCDebFinan.Caption   := 'Conta Contábil: '  + FieldByName('PLANOME').asString;
                  tcCredFinan: lblCCredFinan.Caption   := 'Conta Contábil: '  + FieldByName('PLANOME').asString;
                  tcCDebFolha: lblCCDebFolha.Caption   := 'Conta Contábil: '  + FieldByName('PLANOME').asString;
                  tcCDebFolhaR: lblCCDebFolhaR.Caption := 'Conta Contábil: '  + FieldByName('PLANOME').asString;
                  tcCredFolha: lblCCredFolha.Caption   := 'Conta Contábil: '  + FieldByName('PLANOME').asString;
                  tcCredFolhaR: lblCCredFolhaR.Caption := 'Conta Contábil: '  + FieldByName('PLANOME').asString;
               end;

            end;(* with *)

         end;

      except

         on ev : EValidacao do
            begin
            Screen.Cursor := crDefault;
            if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
               Repaint;
            if ev.Control.CanFocus then
               ev.Control.SetFocus;
            Exit;
         end;
      end;
      Result := True;

   finally
      dtmEmptmo.qryVerificaConta.Close;
      Screen.Cursor := crDefault;
   end;
end;


procedure TfrmCadParamIntegraRec.FiltraContabilidade(tConta: TTipoconta);
begin
   // verifica se a Conta admite SubContas; se admitir, abre a tabela SubConta e habilita as combos
   Case tConta of

      tcCDebFinan:
      if bObrigaSC then begin
         with dtmLookEmptmo.qryLookSubDebFinan do begin
            LimpaParametros(dtmLookEmptmo.qryLookSubDebFinan);
            ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
            Open;
         end;
         DBcboSubDebFinan.Enabled   := True;
      end else begin
         if qry.State in dsEditModes then qrySUBCDEBFINAN.Clear;
         dtmLookEmptmo.qryLookSubDebFinan.Close;
         DBcboSubDebFinan.Clear;
         DBcboSubDebFinan.Enabled   := False;
      end;

      tcCredFinan:
      if bObrigaSC then begin
         with dtmLookEmptmo.qryLookSbCredFinan do begin
            LimpaParametros(dtmLookEmptmo.qryLookSbCredFinan);
            ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
            Open;
         end;
         DBcboSubCredFinan.Enabled   := True;
      end else begin
         if qry.State in dsEditModes then
            qrySUBCDEBFINAN.Clear;
         dtmLookEmptmo.qryLookSbCredFinan.Close;
         DBcboSubCredFinan.Clear;
         DBcboSubCredFinan.Enabled   := False;
      end;

      tcCDebFolha:
      if bObrigaSC then begin
         with dtmLookEmptmo.qryLookSubDebFolha do begin
            LimpaParametros(dtmLookEmptmo.qryLookSubDebFolha);
            ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
            Open;
         end;
         DBcboSubDebFolha.Enabled   := True;
      end else begin
         if qry.State in dsEditModes then qrySUBCDEBFOLHA.Clear;
         dtmLookEmptmo.qryLookSubDebFolha.Close;
         DBcboSubDebFolha.Clear;
         DBcboSubDebFolha.Enabled   := False;
      end;


      tcCDebFolhaR:
      if bObrigaSC then begin
         with dtmLookEmptmo.qryLookSubDebFolha do begin
            LimpaParametros(dtmLookEmptmo.qryLookSubDebFolha);
            ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
            Open;
         end;
         DBcboSubDebFolhaR.Enabled   := True;
      end else begin
         if qry.State in dsEditModes then qrySUBCDEBFOLHA.Clear;
         dtmLookEmptmo.qryLookSubDebFolha.Close;
         DBcboSubDebFolhaR.Clear;
         DBcboSubDebFolhaR.Enabled   := False;
      end;


      tcCredFolha:
      if bObrigaSC then begin
         with dtmLookEmptmo.qryLookSbCredFolha do begin
            LimpaParametros(dtmLookEmptmo.qryLookSbCredFolha);
            ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
            Open;
         end;
         DBcboSubCredFolha.Enabled   := True;
      end else begin
         if qry.State in dsEditModes then qrySUBCDEBFOLHA.Clear;
         dtmLookEmptmo.qryLookSbCredFolha.Close;
         DBcboSubCredFolha.Clear;
         DBcboSubCredFolha.Enabled   := False;
      end;


      tcCredFolhaR:
      if bObrigaSC then begin
         with dtmLookEmptmo.qryLookSbCredFolha do begin
            LimpaParametros(dtmLookEmptmo.qryLookSbCredFolha);
            ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
            Open;
         end;
         DBcboSubCredFolhaR.Enabled   := True;
      end else begin
         if qry.State in dsEditModes then qrySUBCDEBFOLHA.Clear;
         dtmLookEmptmo.qryLookSbCredFolha.Close;
         DBcboSubCredFolhaR.Clear;
         DBcboSubCredFolhaR.Enabled   := False;
      end;


   end;(* case *)

   // idem p/ Centro de Custo
   case tConta of

      tcCDebFinan:

      if bObrigaCC then
      begin
         with dtmLookEmptmo.qryLookCCDebFinan do
         begin
            LimpaParametros(dtmLookEmptmo.qryLookCCDebFinan);
            ParamByName('PPLANO').asInteger    := Modulo.iPlano;
            //ParamByName('PPLACONTA').asString  := CompletaFim(trim(qryCCDEBFINAN.asString), ' ', 18); //WO31744 Leandro
            ParamByName('PPLACONTA').asString  := trim(qryCCDEBFINAN.asString);                               //WO31744 Leandro
            ParamByName('PIDEMPRESA').asInteger := Sistema.idEmpresa;
            Open;
         end;
         DBcboCCustDebFinan.Enabled   := True;
      end
      else
      begin
         if qry.State in dsEditModes then
            qryCCUSTDEBFINAN.Clear;
         dtmLookEmptmo.qryLookCCDebFinan.Close;
         DBcboCCustDebFinan.Clear;
         DBcboCCustDebFinan.Enabled   := False;
      end;

      tcCDebFolha:
      if bObrigaCC then
      begin
         with dtmLookEmptmo.qryLookCCDebFolha do
             begin
            LimpaParametros(dtmLookEmptmo.qryLookCCDebFolha);
            ParamByName('PPLANO').asInteger    := Modulo.iPlano;
            //ParamByName('PPLACONTA').asString  := CompletaFim(trim(qryCCDEBFOLHA.asString), ' ', 18); //WO31744 leandro
            ParamByName('PPLACONTA').asString  := trim(qryCCDEBFOLHA.asString);                         //WO31744 leandro
            ParamByName('PIDEMPRESA').asInteger := Sistema.idEmpresa;
            Open;
         end;
         DBcboCCustDebFolha.Enabled   := True;
      end
      else
      begin
         if qry.State in dsEditModes then
            qryCCUSTDEBFOLHA.Clear;
         dtmLookEmptmo.qryLookCCDebFolha.Close;
         DBcboCCustDebFolha.Clear;
         DBcboCCustDebFolha.Enabled   := False;
      end;

      tcCredFinan:
      if bObrigaCC then
      begin
         with dtmLookEmptmo.qryLookCCredFinan do
         begin
            LimpaParametros(dtmLookEmptmo.qryLookCCredFinan);
            ParamByName('PPLANO').asInteger    := Modulo.iPlano;
            //ParamByName('PPLACONTA').asString  := CompletaFim(trim(qryCCCREDFINAN.asString), ' ', 18); //WO31744 leandro
            ParamByName('PPLACONTA').asString  := trim(qryCCCREDFINAN.asString); //WO31744 leandro
            ParamByName('PIDEMPRESA').asInteger := Sistema.idEmpresa;
            Open;
         end;
         DBcboCCustCredFinan.Enabled   := True;
      end
      else
      begin
         if qry.State in dsEditModes then qryCCUSTCREDFINAN.Clear;
         dtmLookEmptmo.qryLookCCredFinan.Close;
         DBcboCCustCredFinan.Clear;
         DBcboCCustCredFinan.Enabled   := False;
      end;

      tcCredFolha:
      if bObrigaCC then
      begin
         with dtmLookEmptmo.qryLookCCredFolha do
         begin
            LimpaParametros(dtmLookEmptmo.qryLookCCredFolha);
            ParamByName('PPLANO').asInteger    := Modulo.iPlano;
            //ParamByName('PPLACONTA').asString  := CompletaFim(qryCCCREDFOLHA.asString, ' ', 18); //WO31744 leandro
            ParamByName('PPLACONTA').asString  := qryCCCREDFOLHA.asString;                         //WO31744 leandro
            ParamByName('PIDEMPRESA').asInteger := Sistema.idEmpresa;
            Open;
         end;
         DBcboCCustCredFolha.Enabled   := True;
      end
      else
      begin
         if qry.State in dsEditModes then qryCCUSTCREDFOLHA.Clear;
         dtmLookEmptmo.qryLookCCredFolha.Close;
         DBcboCCustCredFolha.Clear;
         DBcboCCustCredFolha.Enabled   := False;
      end;
   end;(* case *)
end;

procedure TfrmCadParamIntegraRec.DBedtCodDebFinanExit(Sender: TObject);
begin
   inherited;
  if (Sender as TDBEdit).Modified then
      begin
      if (Sender as TDBEdit).Name = 'DBedtCodDebFinan'  then Preenche(tcCDebFinan);
      if (Sender as TDBEdit).Name = 'DBedtCodCredFinan' then Preenche(tcCredFinan);
      if (Sender as TDBEdit).Name = 'DBedtCodDebFolha'  then Preenche(tcCDebFolha);
      if (Sender as TDBEdit).Name = 'DBedtCodCredFolha' then Preenche(tcCredFolha);
      if (Sender as TDBEdit).Name = 'DBedtCodDebFolhaR'  then Preenche(tcCDebFolhaR);
      if (Sender as TDBEdit).Name = 'DBedtCodCredFolhaR' then Preenche(tcCredFolhaR);
     end;
end;

procedure TfrmCadParamIntegraRec.CmeCadastroConfirma(Sender: TObject);
begin
   try
      if qry.State = dsInsert then
         qryIDPARAMINTEGRAEP.AsInteger := LeUltRegistro(nil, 'PARAMINTEGRAEP');

      if qry.State in dsEditModes then
      begin
         // grava a os parâmetros fixos
         qryIDPESSOA.asInteger      := Sistema.idEmpresa;
         qryRECPAGFINAN.AsString    := qryRECPAG.AsString;
         qryRECPAGFOLHA.AsString    := 'P';

         // grava o Plano de Contas e a Conta Contábil
         qryPLANO.asInteger := Modulo.iPlano;
      end;

      inherited;

   except
      Raise;
      Repaint;
   end;

   // limpa as Contas Contábeis
   lblCCDebFinan.Caption   := 'Código';
   lblCCDebFolha.Caption   := 'Código';
   lblCCDebFolhaR.Caption  := 'Código';
   lblCCredFinan.Caption   := 'Código';
   lblCCredFolha.Caption   := 'Código';
   lblCCredFolhaR.Caption  := 'Código';

   if not(qry.isEmpty) then
   begin
      // preenche as Contas Contábeis
      Preenche(tcCDebFinan);
      Preenche(tcCredFinan);
      Preenche(tcCDebFolha);
      Preenche(tcCredFolha);
      Preenche(tcCDebFolhaR);
      Preenche(tcCredFolhaR);
   end;
end;

procedure TfrmCadParamIntegraRec.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
	if DBedtDescricao.CanFocus then
     DBedtDescricao.SetFocus;
end;

procedure TfrmCadParamIntegraRec.CmeCadastroFind(Sender: TObject);
begin
   inherited;
	// redesenha o form na volta do MontaSelect
	Repaint;

	// se houve busca, abre a query principal com apenas o registro buscado
	if MontaSelect.RetornouValor then
     begin

      Screen.Cursor := crHourGlass;

      AbreQueries;

      // abre a query
      Sel(StrToInt(MontaSelect.ValoresChave[0]));

      HabilitaContas;

      with dtmLookEmptmo.qryLookItemIntegra do
           begin
           LimpaParametros(dtmLookEmptmo.qryLookItemIntegra);
           ParamByName('PIDTIPOCONTREMPTMO').asInteger := StrToInt(MontaSelect.ValoresChave[1]);
           Open;
      end;
      DBcboItemEmptmo.Enabled := True;

      with dtmLookEmptmo.qryLookTipoRecebDesemb do
           begin
           LimpaParametros(dtmLookEmptmo.qryLookTipoRecebDesemb);
           ParamByName('PIDPESSOA').AsInteger  := Sistema.idEmpresa;
           ParamByName('PRECPAG').AsString     := MontaSelect.ValoresChave[2];
           Open;
      end;
      DBcboTipoRecDesFinan.Enabled := True;
      //Vinicius Maciel - SOL 163982/7003 - KTN 1489901
      if((trim(DBcboUnidNegocio.Text) = EmptyStr) and (trim(DBcboUnidNegocio.LookupValue) <> EmptyStr)) then
          DBcboUnidNegocio.Text := trim(recuperaAtividadePerd(DBcboUnidNegocio.LookupValue));
      //Vinicius Maciel - SOL 163982/7003 - KTN 1489901 - FIM
      if VerificaContaContabil(tcCDebFinan) then
         FiltraContabilidade(tcCDebFinan);

      if VerificaContaContabil(tcCDebFolha) then
         FiltraContabilidade(tcCDebFolha);

      if VerificaContaContabil(tcCDebFolhaR) then
         FiltraContabilidade(tcCDebFolhaR);


      if VerificaContaContabil(tcCredFinan) then
         FiltraContabilidade(tcCredFinan);
      if VerificaContaContabil(tcCredFolha) then
         FiltraContabilidade(tcCredFolha);

      if VerificaContaContabil(tcCredFolhaR) then
         FiltraContabilidade(tcCredFolhaR);

      Screen.Cursor := crDefault;
   end;
end;

procedure TfrmCadParamIntegraRec.DBcboTipoContratoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   qryIDTIPOEMPTMO.AsInteger  := dtmLookEmptmo.qryLookTipoContrIDTIPOEMPTMO.AsInteger;
   qryDESCTIPOEMPTMO.AsString := dtmLookEmptmo.qryLookTipoContrDESCTIPOEMPTMO.AsString;

   with dtmLookEmptmo.qryLookItemIntegra do begin
      LimpaParametros(dtmLookEmptmo.qryLookItemIntegra);
      ParamByName('PIDTIPOCONTREMPTMO').asInteger := dtmLookEmptmo.qryLookTipoContrIDTipoContrEmptmo.AsInteger;
      Open;
   end;

   DBcboItemEmptmo.Enabled := True;
end;

procedure TfrmCadParamIntegraRec.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;

   // habilita o painel de fundo (que contém o PageControl - orelhas)
   pnlFundo.Enabled := True;

   Case CmeCadastro.Operacao of

      opInserir, opAlterar:
      begin
         tbsFiltro.Enabled := True;
         tbsGeral.Enabled  := True;
         tbsCAPCAR.Enabled := True;
         tbsFolha.Enabled  := True;
         tbsFolhaR.Enabled  := True;
      end;

      else begin
         tbsFiltro.Enabled := False;
         tbsGeral.Enabled  := False;
         tbsCAPCAR.Enabled := False;
         tbsFolha.Enabled  := False;
         tbsFolhaR.Enabled  := False;
      end;

   end;(* case *)
end;

procedure TfrmCadParamIntegraRec.DBcboItemEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var
   sRecPag : String;
begin
   inherited;

   HabilitaContas;

   sRecPag := dtmLookEmptmo.qrylookitemIntegraITCRECPAG.AsString;
   if qry.State in dsEditModes then qryRECPAG.AsString := sRecPag;

   with dtmLookEmptmo.qryLookTipoRecebDesemb do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoRecebDesemb);
      ParamByName('PIDPESSOA').AsInteger  := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString     := sRecPag;
      Open;
   end;
end;

procedure TfrmCadParamIntegraRec.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;

   if Accept then
   begin
      case CmeCadastro.Operacao of
         opInserir:  Accept := Sistema.GravaLogOperacoes('Cad Param para Integração, Itens. Inserção.');
         opAlterar:  Accept := Sistema.GravaLogOperacoes('Cad Param para Integração, Itens. Alteração.');
         opApagar:   Accept := Sistema.GravaLogOperacoes('Cad Param para Integração, Itens. Exclusão.');
      end;
   end;

   if not(Accept) then Raise Exception.Create('Falha na gravação do Log da operação.');
end;



function TfrmCadParamIntegraRec.VerificaPreenchimento: boolean;
begin
	Result := False;

	try

      if qryIDTIPOCONTREMPTMO.isNULL then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Contrato!', DBcboTipoContrato);

      if qryIDITEMEMPTMO.isNULL then
         raise EValidacao.CreateVal('É necessário indicar a o Item de Empréstimo!', DBcboItemEmptmo);

      if qryUNIDNEGOC.isNULL then
         raise EValidacao.CreateVal('É necessário indicar a Atividade / Projeto!', DBedtDescricao);

      if qryCODCENTRORESPON.isNULL then
         raise EValidacao.CreateVal('É necessário indicar o Centro de Responsabilidade!', DBcboCentroRespon);

      if qryTIPORECDESFINAN.IsNull then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Recebimento / Desembolso!', DBcboTipoRecDesFinan);

   except

      on ev : EValidacao do begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;

procedure TfrmCadParamIntegraRec.btnRefreshClick(Sender: TObject);
begin
   inherited;
	if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadParamIntegraRec.HabilitaContas;
begin
   (* por default, habilita tudo *)
   AtualizaConjunto(True, grpCCDebFinan, False);
   AtualizaConjunto(True, grpCCCredFinan, False);
   AtualizaConjunto(True, grpCredFolha, False);
   AtualizaConjunto(True, grpDebFolha,False);
   AtualizaConjunto(True, grpCredFolhaR, False);
   AtualizaConjunto(True, grpDebFolhaR,False);

   if (dtmLookEmptmo.qryLookItemIntegraIDITEMEMPTMO.AsInteger > 0) then
   begin
      if (dtmLookEmptmo.qryLookItemIntegraFLGCENTRALIZA.AsInteger = 1) and
         (dtmLookEmptmo.qryLookItemIntegraFLGDESTACADO.AsInteger = 0) then
      begin
         (* se for item centralizador, desabilita contas de Apropriação *)
         AtualizaConjunto(False, grpCCDebFinan,True);
         AtualizaConjunto(False, grpCCCredFinan,True);
      end
      else
      begin
         if (dtmLookEmptmo.qryLookItemIntegraFLGDESTACADO.AsInteger = 0) then
         begin
            (* se for um item NÂO destacado (ie, não enviável), desabilita contas de Interface *)
            AtualizaConjunto(False, grpCredFolha,True);
            AtualizaConjunto(False, grpDebFolha,True);
            AtualizaConjunto(False, grpCredFolhaR,True);
            AtualizaConjunto(False, grpDebFolhaR,True);
         end;
      end;
   end;
end;


//Vinicius Maciel - SOL 163982/7003 - KTN 1489901
function TfrmCadParamIntegraRec.recuperaAtividadePerd(
  sCodAtividade: String): String;
begin
   with dtmLookEmptmo.qryLookUnidNegocioPerdida do begin
      LimpaParametros(dtmLookEmptmo.qryLookUnidNegocioPerdida);
      ParamByName('pUNIDNEGOC').asInteger := StrToInt(sCodAtividade);
      Open;
      Result := FieldByName('NOME').asString;
   end;
end;

//Vinicius Maciel - SOL 163982/7003 - KTN 1489901 - FIM
procedure TfrmCadParamIntegraRec.btnBuscaContaDebFolhaRClick(Sender: TObject);
begin
  inherited;


   dtmMS.MS_CContabil.Executar;
   Repaint;

   if dtmMS.MS_CContabil.RetornouValor then begin
      Screen.Cursor := crHourGlass;

      if (Sender as TBitBtn).Name = 'btnBuscaContaDebFinan'  then begin
         qryCCDEBFINAN.Text := dtmMS.MS_CContabil.ValoresChave[0];
         Preenche(tcCDebFinan);
      end;

      if (Sender as TBitBtn).Name = 'btnBuscaContaCredFinan'  then begin
         qryCCCREDFINAN.Text := dtmMS.MS_CContabil.ValoresChave[0];
         Preenche(tcCredFinan);
      end;

      if (Sender as TBitBtn).Name = 'btnBuscaContaDebFolha'  then begin
         qryCCDEBFOLHA.Text := dtmMS.MS_CContabil.ValoresChave[0];
         Preenche(tcCDebFolha);
      end;

      if (Sender as TBitBtn).Name = 'btnBuscaContaCredFolha'  then begin
         qryCCCREDFOLHA.Text := dtmMS.MS_CContabil.ValoresChave[0];
         Preenche(tcCredFolha);
      end;

       if (Sender as TBitBtn).Name = 'btnBuscaContaDebFolhaR'  then begin
         qryCCDEBFOLHARESULT.Text := dtmMS.MS_CContabil.ValoresChave[0];
         Preenche(tcCDebFolhaR);
      end;

      if (Sender as TBitBtn).Name = 'btnBuscaContaCredFolhaR'  then begin
         qryCCCREDFOLHARESULT.Text := dtmMS.MS_CContabil.ValoresChave[0];
         Preenche(tcCredFolhaR);
      end;

      Screen.Cursor := crDefault;
   end;
end;

procedure TfrmCadParamIntegraRec.DBedtCodDebFolhaRExit(Sender: TObject);
begin
  inherited;
  if (Sender as TDBEdit).Modified then
      begin
      if (Sender as TDBEdit).Name = 'DBedtCodDebFinan'  then Preenche(tcCDebFinan);
      if (Sender as TDBEdit).Name = 'DBedtCodCredFinan' then Preenche(tcCredFinan);
      if (Sender as TDBEdit).Name = 'DBedtCodDebFolha'  then Preenche(tcCDebFolha);
      if (Sender as TDBEdit).Name = 'DBedtCodCredFolha' then Preenche(tcCredFolha);
      if (Sender as TDBEdit).Name = 'DBedtCodDebFolhaR'  then Preenche(tcCDebFolhaR);
      if (Sender as TDBEdit).Name = 'DBedtCodCredFolhaR' then Preenche(tcCredFolhaR);
     end;
end;

procedure TfrmCadParamIntegraRec.DBedtCodCredFolhaRExit(Sender: TObject);
begin
  inherited;
  if (Sender as TDBEdit).Modified then
      begin
      if (Sender as TDBEdit).Name = 'DBedtCodDebFinan'  then Preenche(tcCDebFinan);
      if (Sender as TDBEdit).Name = 'DBedtCodCredFinan' then Preenche(tcCredFinan);
      if (Sender as TDBEdit).Name = 'DBedtCodDebFolha'  then Preenche(tcCDebFolha);
      if (Sender as TDBEdit).Name = 'DBedtCodCredFolha' then Preenche(tcCredFolha);
      if (Sender as TDBEdit).Name = 'DBedtCodDebFolhaR'  then Preenche(tcCDebFolhaR);
      if (Sender as TDBEdit).Name = 'DBedtCodCredFolhaR' then Preenche(tcCredFolhaR);
     end;
end;

procedure TfrmCadParamIntegraRec.btnBuscaContaCredFolhaRClick(
  Sender: TObject);
begin
  inherited;


   dtmMS.MS_CContabil.Executar;
   Repaint;

   if dtmMS.MS_CContabil.RetornouValor then begin
      Screen.Cursor := crHourGlass;

      if (Sender as TBitBtn).Name = 'btnBuscaContaDebFinan'  then begin
         qryCCDEBFINAN.Text := dtmMS.MS_CContabil.ValoresChave[0];
         Preenche(tcCDebFinan);
      end;

      if (Sender as TBitBtn).Name = 'btnBuscaContaCredFinan'  then begin
         qryCCCREDFINAN.Text := dtmMS.MS_CContabil.ValoresChave[0];
         Preenche(tcCredFinan);
      end;

      if (Sender as TBitBtn).Name = 'btnBuscaContaDebFolha'  then begin
         qryCCDEBFOLHA.Text := dtmMS.MS_CContabil.ValoresChave[0];
         Preenche(tcCDebFolha);
      end;

      if (Sender as TBitBtn).Name = 'btnBuscaContaCredFolha'  then begin
         qryCCCREDFOLHA.Text := dtmMS.MS_CContabil.ValoresChave[0];
         Preenche(tcCredFolha);
      end;

       if (Sender as TBitBtn).Name = 'btnBuscaContaDebFolhaR'  then begin
         qryCCDEBFOLHARESULT.Text := dtmMS.MS_CContabil.ValoresChave[0];
         Preenche(tcCDebFolhaR);
      end;

      if (Sender as TBitBtn).Name = 'btnBuscaContaCredFolhaR'  then begin
         qryCCCREDFOLHARESULT.Text := dtmMS.MS_CContabil.ValoresChave[0];
         Preenche(tcCredFolhaR);
      end;

      Screen.Cursor := crDefault;
   end;
end;
end.
