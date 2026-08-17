unit FCadOperacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, wwdbedit, DBCtrls, wwdblook, DBGrids;

type
  TTipoConta = (tcCredito, tcDebito);

  TfrmCadOperacao = class(TfrmCadMestreDetalheCS)
    Label2: TLabel;
    dbedDescricao: TwwDBEdit;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryDESCTIPOOPERACAO: TStringField;
    qryNATUREZAOPERACAO: TStringField;
    qryFLGGERACONTAB: TFloatField;
    qryFLGGERACAPCAR: TFloatField;
    qryRECPAG: TStringField;
    qryCODTIPDOC: TFloatField;
    qryTIPCREDOR: TStringField;
    qryFLGGERACAF: TFloatField;
    GroupBox1: TGroupBox;
    DBchkGeraCAPCAR: TDBCheckBox;
    DBchkGeraCAF: TDBCheckBox;
    DBchkGeraContab: TDBCheckBox;
    DBrdgCustoRec: TDBRadioGroup;
    tbsDebito: TTabSheet;
    tbsCredito: TTabSheet;
    tbsCAP: TTabSheet;
    Label15: TLabel;
    DBedtHistorico: TDBEdit;
    Label12: TLabel;
    DBcboUnidNegoc: TwwDBLookupCombo;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryLookUnidNegocio: TwwQuery;
    qryLookUnidNegocioNOME: TStringField;
    qryLookUnidNegocioUNIDNEGOC: TFloatField;
    qryDetIDPADRLANCCONT: TFloatField;
    qryDetIDTIPOINVEST: TFloatField;
    qryDetIDTIPOOPERACAO: TFloatField;
    qryDetIDTIPODESPINVEST: TFloatField;
    qryDetIDCARTEIRAINVEST: TFloatField;
    qryDetCODTIPTITULO: TStringField;
    qryDetIDFORCLI: TFloatField;
    qryDetTIPLANCINVEST: TStringField;
    qryDetTIPMOVCARTINV: TStringField;
    qryDetRECPAG: TStringField;
    qryDetIDPESSOA: TFloatField;
    qryDetCODTIPRECDES: TStringField;
    qryDetHISTLANCINVEST: TStringField;
    qryDetFLGPAGRECNAO: TStringField;
    qryDetPLANO: TFloatField;
    qryDetCONTADOPERFIN: TStringField;
    qryDetCONTACOPERFIN: TStringField;
    qryDetIDEMPRESA: TFloatField;
    qryDetCENCUSTDINVEST: TStringField;
    qryDetCENCUSTCINVEST: TStringField;
    qryDetCODSUBCONTAD: TFloatField;
    qryDetCODSUBCONTAC: TFloatField;
    qryDetCODCENTRORESPON: TStringField;
    qryDetUNIDNEGOC: TFloatField;
    qryDetTIPCODIGO: TStringField;
    Label8: TLabel;
    mskContaDebito: TMaskEdit;
    btnBuscaContaDebito: TBitBtn;
    lblContaDebito: TLabel;
    Label9: TLabel;
    DBcboSubContaD: TwwDBLookupCombo;
    Label11: TLabel;
    DBcboCentroCustoD: TwwDBLookupCombo;
    Label3: TLabel;
    DBcboTipOperD: TwwDBLookupCombo;
    MontaSelectConta: TMontaSelect;
    qryLookSubConta: TwwQuery;
    qryLookCentroCusto: TwwQuery;
    StringField6: TStringField;
    StringField7: TStringField;
    qryLookTipOper: TwwQuery;
    qryLookTipOperTIPDESCRICAO: TStringField;
    qryLookTipOperTIPCODIGO: TStringField;
    Label5: TLabel;
    mskContaCredito: TMaskEdit;
    btnBuscaContaCredito: TBitBtn;
    lblContaCredito: TLabel;
    Label7: TLabel;
    DBcboSubContaC: TwwDBLookupCombo;
    Label10: TLabel;
    DBcboCentroCustoC: TwwDBLookupCombo;
    Label13: TLabel;
    DBcboTipOperC: TwwDBLookupCombo;
    qryVerificaConta: TwwQuery;
    Label19: TLabel;
    DBcboTipoRecDes: TwwDBLookupCombo;
    Label26: TLabel;
    DBcboCentroRespon: TwwDBLookupCombo;
    qryLookTipoRecDes: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    qryLookCentroRespon: TwwQuery;
    qryLookCentroResponNOME: TStringField;
    qryLookCentroResponCODCENTRORESPON: TStringField;
    Label1: TLabel;
    dblcTipoDoc: TwwDBLookupCombo;
    qryLookTipoDoc: TwwQuery;
    qryLookTipoDocDESCRICAO: TStringField;
    qryLookTipoDocCODTIPDOC: TFloatField;
    qryLookTipoDocRECPAG: TStringField;
    qryLookTipoDocDEBCRE: TStringField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaContaDebitoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mskContaDebitoExit(Sender: TObject);
    procedure btnBuscaContaCreditoClick(Sender: TObject);
    procedure mskContaCreditoExit(Sender: TObject);
    procedure DBrdgCustoRecClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
  private
    { Private declarations }
    bObrigaSubConta, bObrigaCentroCusto: boolean;

    procedure Sel(n : Double);
    procedure FiltraContabilidade(tConta: TTipoconta);
    procedure FiltraRecPag;
    function  VerificaContaContabil(tConta: TTipoconta): boolean;
    function  VerificaPreenchimento: boolean;


  public
    { Public declarations }
    Operacao : TOperacao;
  end;

var
  frmCadOperacao: TfrmCadOperacao;

implementation

uses
  USistema, UMensErro, UDatabase, DBaseDados, UModulo,
  UVerificaPreenchimento, UAutorizacao, UIntegraBack;

{$R *.DFM}

procedure TfrmCadOperacao.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then begin
      Sel(StrToFloat(MontaSelect.ValoresChave[0]));
   end;
end;

procedure TfrmCadOperacao.Sel(n: Double);
begin
   LimpaParametros(qry);
   qry.ParamByName('pIDTIPOOPERACAO').AsFloat := n;
   qry.Open;
   LimpaParametros(qryDet);
   qryDet.ParamByName('pIDTIPOOPERACAO').AsFloat := n;
   qryDet.Open;

   // Abre Lookups
   with qryLookUnidNegocio do begin
      LimpaParametros(qryLookUnidNegocio);
      if not(Prepared) then Prepare;
      Params[0].asInteger := Sistema.idEmpresa;
      Open;
   end;
   with qryLookCentroRespon do begin
      LimpaParametros(qryLookCentroRespon);
      if not(Prepared) then Prepare;
      Params[0].asInteger := Sistema.idEmpresa;
      Open;
   end;

   qryLookTipOper.Open;
   qryLookTipoRecDes.Open;
   qryLookCentroRespon.Open;

   FiltraRecPag;

   // atribui contas contábeis
   mskContaDebito.Text  := qryDet.FieldByName('CONTADOPERFIN').asString;
   mskContaCredito.Text := qryDet.FieldByName('CONTACOPERFIN').asString;
   VerificaContaContabil(tcDebito);
   VerificaContaContabil(tcCredito);      
end;

procedure TfrmCadOperacao.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   if qryDet.IsEmpty then
        qryDet.Insert
   else qryDet.Edit;
end;

procedure TfrmCadOperacao.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   qryDet.Insert;
   dbedDescricao.SetFocus;
   qryFLGGERACAPCAR.AsInteger   := 1;
   qryFLGGERACAF.AsInteger      := 0;
   qryFLGGERACONTAB.AsInteger   := 1;
   qryNATUREZAOPERACAO.asString := 'A';
   dbrdgCustoRec.ItemIndex      := 1;
end;

procedure TfrmCadOperacao.CmeCadastroConfirma(Sender: TObject);
begin
   if qry.State in [dsInsert, dsEdit] then begin
      if VerificaPreenchimento then begin
         if CmeCadastro.Operacao = opInserir then begin
            qryIDTIPOOPERACAO.asInteger  := LeUltRegistro(nil, 'TIPOOPERACAO');
            qryIDTIPOINVEST.asInteger    := 3;
            qryTIPCREDOR.asString        := '';

            qryDetIDPADRLANCCONT.asInteger := LeUltRegistro(nil, 'PADRLANCCONTINV');
            qryDetIDPESSOA.asInteger       := Sistema.idEmpresa;
            qryDetIDEMPRESA.asInteger      := Sistema.idEmpresa;
            qryDetIDTIPOINVEST.asInteger   := qryIDTIPOINVEST.AsInteger;
            qryDetIDTIPOOPERACAO.asInteger := qryIDTIPOOPERACAO.AsInteger;
            qryDetFLGPAGRECNAO.asString    := qryRECPAG.asString;
         end;

         // grava o Tipo de Lançamento e o Tipo de Movimentação
         qryDet.FieldByName('TIPLANCINVEST').asString := 'N';
         if qryDet.FieldByName('IDTIPODESPINVEST').isNULL then begin
            qryDet.FieldByName('TIPMOVCARTINV').asString := 'OPE';
         end else begin
            qryDet.FieldByName('TIPMOVCARTINV').asString := 'DOP';
         end;

         // gravação dos parâmetros contábeis
         if dbChkGeraContab.Checked then begin
            // grava as contas contábeis
            qryDet.FieldByName('PLANO').asInteger        := IntegraBack.Plano;
            qryDet.FieldByName('CONTADOPERFIN').asString := mskContaDebito.Text;
            qryDet.FieldByName('CONTACOPERFIN').asString := mskContaCredito.Text;
         end else begin
            qryDet.FieldByName('PLANO').Value            := NULL;
            qryDet.FieldByName('CONTADOPERFIN').Value    := NULL;
            qryDet.FieldByName('CONTACOPERFIN').Value    := NULL;
            qryDet.FieldByName('CODSUBCONTAD').Value     := NULL;
            qryDet.FieldByName('CENCUSTDINVEST').Value   := NULL;
            qryDet.FieldByName('CODSUBCONTAC').Value     := NULL;
            qryDet.FieldByName('CENCUSTCINVEST').Value   := NULL;
         end;

         // processamento para gravação de NULL nos parâmetros de CAPCAR
         if not dbChkGeraCAPCAR.checked then begin
            qryDet.FieldByName('CODTIPRECDES').Value     := NULL;
            qryDet.FieldByName('CODCENTRORESPON').Value  := NULL;
         end;

         AplicaAlteracoes([qry,qryDet]);
         inherited;
      end;
   end else begin
      inherited;
   end;
end;

procedure TfrmCadOperacao.FormShow(Sender: TObject);
begin
   inherited;
   Sel(-1);
end;

procedure TfrmCadOperacao.btnBuscaContaDebitoClick(Sender: TObject);
begin
   inherited;
   MontaSelectConta.Executar;
   Repaint;
   if MontaSelectConta.RetornouValor then begin
      mskContaDebito.Text := MontaSelectConta.ValoresChave[0];
      if mskContaDebito.CanFocus then mskContaDebito.SetFocus;
   end;
end;

procedure TfrmCadOperacao.FiltraContabilidade(tConta: TTipoconta);
begin
   // verifica se a Conta admite SubContas; se admitir, abre a tabela SubConta e habilita as combos
   Case tConta of

      tcCredito:
      if bObrigaSubConta then begin
         qryLookSubConta.Open;
         DBcboSubContaC.Enabled   := True;
      end else begin
         qryLookSubConta.Close;
         DBcboSubContaC.Clear;
         DBcboSubContaC.Enabled   := False;
      end;

      tcDebito:
      if bObrigaSubConta then begin
         qryLookSubConta.Open;
         DBcboSubContaD.Enabled   := True;
      end else begin
         qryLookSubConta.Close;
         DBcboSubContaD.Clear;
         DBcboSubContaD.Enabled   := False;
      end;

   end;

   Case tConta of

      tcCredito:
      if bObrigaCentroCusto then begin
         with qryLookCentroCusto do begin
            Close;
            if not(Prepared) then Prepare;
            Params[1].asString   := trim(mskContaCredito.Text);
            Params[2].asInteger  := Sistema.idEmpresa;
            Open;
         end;
         qryLookCentroCusto.Open;
         DBcboCentroCustoC.Enabled   := True;
      end else begin
         qryLookCentroCusto.Close;
         DBcboCentroCustoC.Clear;
         DBcboCentroCustoC.Enabled   := False;
      end;

      tcDebito:
      if bObrigaCentroCusto then begin
         with qryLookCentroCusto do begin
            Close;
            if not(Prepared) then Prepare;
            Params[1].asString   := trim(mskContaDebito.Text);
            Params[2].asInteger  := Sistema.IdEmpresa;
            Open;
         end;
         qryLookCentroCusto.Open;
         DBcboCentroCustoD.Enabled   := True;
      end else begin
         qryLookCentroCusto.Close;
         DBcboCentroCustoD.Clear;
         DBcboCentroCustoD.Enabled   := False;
      end;
   end;
end;

function TfrmCadOperacao.VerificaContaContabil(tConta: TTipoconta): boolean;
var
   s:     string;
   mask: TMaskEdit;
begin
   Result := False;
   Screen.Cursor := crHourGlass;

   try

      try

         Case tConta of
            tcCredito: mask   := mskContaCredito;
            tcDebito: mask    := mskContaDebito;
            else mask := nil;
         end;

         s := trim(mask.Text);
         if length(s) > 0 then begin

            // verifica se existe a conta digitada (para ser + rápido', a query só dá COUNT)
            with qryVerificaConta do begin
               Close;
               if not(Prepared) then Prepare;
               Params[0].asInteger  := IntegraBack.Plano;
               Params[1].asString   := s;
               Open;

               // se não há registros, a Conta não existe
               if qryVerificaConta.isEmpty then begin
                  raise EValidacao.CreateVal('Essa Conta Contábil não é válida!', mask);
               end else begin

                  bObrigaSubConta := FieldByName('PLASUBCONTA').asString = 'S';
                  bObrigaCentroCusto := FieldByName('PLACCUST').asString = 'S';

                  Case tConta of
                     tcCredito:  lblContaCredito.Caption := FieldByName('PLANOME').asString;
                     tcDebito:   lblContaDebito.Caption  := FieldByName('PLANOME').asString;
                  end;
               end;

            end;

         end else begin

            Case tConta of
               tcCredito:  lblContaCredito.Caption := '';
               tcDebito:   lblContaDebito.Caption  := '';
            end;

         end;

      except

         on ev : EValidacao do begin
            Screen.Cursor := crDefault;
            if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
            Repaint;
            if ev.Control.CanFocus then ev.Control.SetFocus;
            Exit;
         end;

      end;

      Result := True;

   finally
      qryVerificaConta.Close;
      Screen.Cursor := crDefault;
   end;
end;


procedure TfrmCadOperacao.FormCreate(Sender: TObject);
begin
   inherited;
   qryLookTipOper.Open;   
   if Modulo.bIntegraContab then begin
      mskContaDebito.EditMask    := trim(IntegraBack.MascaraPlano) + ';0; ';
      mskContaCredito.EditMask   := trim(IntegraBack.MascaraPlano) + ';0; ';

      MontaSelectConta.Mascaras[0] := trim(IntegraBack.MascaraPlano) + ';0; ';
      MontaSelectConta.Filtro.Add('PLANOCONTA.PLANO = ' + IntToStr(IntegraBack.Plano));
   end;

   if qry.isEmpty then begin
      Operacao := opVazio
   end else begin
      Operacao := opIdle;
   end;
end;

procedure TfrmCadOperacao.mskContaDebitoExit(Sender: TObject);
begin
   inherited;
   if qry.State in [dsInsert, dsEdit] then begin
      if VerificaContaContabil(tcDebito) then begin
         FiltraContabilidade(tcDebito);
         if DBcboSubContaD.Enabled then begin
            DBcboSubContaD.SetFocus;
         end else begin
            if DBcboCentroCustoD.Enabled then DBcboCentroCustoD.SetFocus;
         end;
      end;
   end;
end;

procedure TfrmCadOperacao.btnBuscaContaCreditoClick(Sender: TObject);
begin
   inherited;
   MontaSelectConta.Executar;
   Repaint;
   if MontaSelectConta.RetornouValor then begin
      mskContaCredito.Text := MontaSelectConta.ValoresChave[0];
      mskContaCredito.SetFocus;
   end;
end;

procedure TfrmCadOperacao.mskContaCreditoExit(Sender: TObject);
begin
   inherited;
   if qry.State in [dsInsert, dsEdit] then begin
      if VerificaContaContabil(tcCredito) then begin
         FiltraContabilidade(tcCredito);
         if DBcboSubContaC.Enabled then begin
            DBcboSubContaC.SetFocus;
         end else begin
            if DBcboCentroCustoC.Enabled then DBcboCentroCustoC.SetFocus;
         end;
      end;
   end;
end;

procedure TfrmCadOperacao.FiltraRecPag;
var sRecPag, sDebcre : string;
begin
   if dbrdgCustoRec.ItemIndex < 0 then
      dbrdgCustoRec.ItemIndex := 1;
      
   case dbrdgCustoRec.ItemIndex of
      0 : sRecPag := 'P';
      1 : sRecPag := 'R';
   end;
   case sRecPag[1] of
      'P': sDebcre := 'C';
      'R': sDebcre := 'D';
   end;

   with qryLookTipoDoc do begin
      LimpaParametros(qryLookTipoDoc);
      Params[0].asString := sRecPag;
      Params[1].asString := sDebCre;
      Open;
   end;

   with qryLookTipoRecDes do begin
      LimpaParametros(qryLookTipoRecDes);
      Params[0].asInteger  := Sistema.idEmpresa;
      Params[1].asString   := sRecPag;
      Open;
   end;

   // mascara os Tipos de Recebimento / Desembolso
   Case dbrdgCustoRec.ItemIndex of
      0 : qryLookTipoRecDes.FieldByName('CODTIPRECDES').EditMask   := trim(Modulo.sMascaraDesemb) + ';0; ';
      1 : qryLookTipoRecDes.FieldByName('CODTIPRECDES').EditMask   := trim(Modulo.sMascaraReceb) + ';0; ';
   end;
end;


procedure TfrmCadOperacao.DBrdgCustoRecClick(Sender: TObject);
begin
   inherited;
   FiltraRecPag;
end;

function TfrmCadOperacao.VerificaPreenchimento: boolean;
begin
   Result := False;

// -- Painel Principal -----------------------------------------------------------------------------
   if qryDESCTIPOOPERACAO.IsNull then begin
      MsgDlg('Indique a Descrição da Operação', 'Erro', mtError, [mbOk], 0);
      dbedDescricao.SetFocus;
      Exit;
   end;

// -- página Geral -----------------------------------------------------------------------------
   if DBchkGeraContab.Checked then begin
      if qryDetHISTLANCINVEST.isNULL then begin
         MsgDlg('É necessário indicar o Histórico', 'Erro', mtError, [mbOk], 0);
         pgctrlDetalhe.ActivePage := tbsDet;
         dbedtHistorico.SetFocus;
         Exit;
      end;

      if qryDetUNIDNEGOC.isNULL then begin
         MsgDlg('É necessário indicar a Atividade / Projeto', 'Erro', mtError, [mbOk], 0);
         pgctrlDetalhe.ActivePage := tbsDet;
         dbcboUnidNegoc.SetFocus;
         Exit;
      end;
   end;

// -- página de Débito -----------------------------------------------------------------------------
   if DBchkGeraContab.Checked then begin
      if length(trim(mskContaDebito.Text)) = 0 then begin
         MsgDlg('É necessário indicar a Conta Contábil de débito', 'Erro', mtError, [mbOk], 0);
         pgctrlDetalhe.ActivePage := tbsDebito;
         mskContaDebito.SetFocus;
         Exit;
      end;

      if (DBcboCentroCustoD.Enabled) and (DBcboCentroCustoD.LookupValue = '') then begin
         MsgDlg('É necessário indicar o Centro de Custo', 'Erro', mtError, [mbOk], 0);
         pgctrlDetalhe.ActivePage := tbsDebito;
         dbcboCentroCustoD.SetFocus;
         Exit;
      end;

      if length(trim(DBcboTipOperD.Text)) = 0 then begin
         MsgDlg('É necessário indicar o Tipo de Operação (Contábil)', 'Erro', mtError, [mbOk], 0);
         pgctrlDetalhe.ActivePage := tbsDebito;
         dbcboTipOperD.SetFocus;
         Exit;
      end;
   end;

// -- página de Crédito ----------------------------------------------------------------------------
   if DBchkGeraContab.Checked then begin
      if length(trim(mskContaCredito.Text)) = 0 then begin
         MsgDlg('É necessário indicar a Conta Contábil de crédito', 'Erro', mtError, [mbOk], 0);
         pgctrlDetalhe.ActivePage := tbsCredito;
         mskContaCredito.SetFocus;
         Exit;
      end;

      if (DBcboCentroCustoC.Enabled) and (DBcboCentroCustoC.LookupValue = '') then begin
         MsgDlg('É necessário indicar o Centro de Custo', 'Erro', mtError, [mbOk], 0);
         pgctrlDetalhe.ActivePage := tbsCredito;
         dbcboCentroCustoC.SetFocus;
         Exit;
      end;

      if length(trim(DBcboTipOperC.Text)) = 0 then begin
         MsgDlg('É necessário indicar o Tipo de Operação (Contábil)', 'Erro', mtError, [mbOk], 0);
         pgctrlDetalhe.ActivePage := tbsCredito;
         dbcboTipOperC.SetFocus;
         Exit;
      end;
   end;

// -- página de CaP/CaR ----------------------------------------------------------------------------
   if DBchkGeraCAPCAR.Checked then begin
      if DBcboTipoRecDes.LookupValue = '' then begin
         MsgDlg('É necessário indicar o Tipo de Recebimento / Desembolso', 'Erro', mtError, [mbOk], 0);
         pgctrlDetalhe.ActivePage := tbsCAP;
         DBcboTipoRecDes.SetFocus;
         Exit;
      end;

      if DBcboCentroRespon.LookupValue = '' then begin
         MsgDlg('É necessário indicar o Centro de Responsabilidade', 'Erro', mtError, [mbOk], 0);
         pgctrlDetalhe.ActivePage := tbsCAP;
         dbcboCentroRespon.SetFocus;
         Exit;
      end;
   end;

// -------------------------------------------------------------------------------------------------
   Result := True;
end;


procedure TfrmCadOperacao.CmeCadastroDelete(Sender: TObject);
begin
   qryDet.Delete;
   AplicaAlteracoes([qryDet]);
   inherited;
end;

end.
