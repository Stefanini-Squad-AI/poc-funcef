unit FCadObjetoItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, wwdblook, DBCtrls, TB97Ctls,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, Mask, wwdbedit, CMProcuraMask,
  CmEventosCadastro, ImgList
  {$IFDEF VERSAO0505} ,uComum {$ELSE} ,uCMTypes {$ENDIF};

type
  TfrmCadObjetoItem = class(TfrmCadastroCS)
    dblcObjeto: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    dblcItem: TwwDBLookupCombo;
    qryObjeto: TwwQuery;
    qryItem: TwwQuery;
    Label3: TLabel;
    rgpRegimePagamento: TDBRadioGroup;
    qrySubConta: TwwQuery;
    dblcTipoRecebimento: TwwDBLookupCombo;
    qryRecebimentoDesembolso: TwwQuery;
    qryVerificaConta: TwwQuery;
    qryIDOBJETO: TFloatField;
    qryIDITEM: TFloatField;
    qryCODTIPRECDES: TStringField;
    qryRECPAG: TStringField;
    qryIDPESSOA: TFloatField;
    qryCODSUBCONTA: TFloatField;
    qryPLANO2: TFloatField;
    qryPLACONTA: TStringField;
    qryParam: TwwQuery;
    qryAux: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField3: TStringField;
    pnlConta: TPanel;
    dbedtContaContabil: TCMProcuraMaskContabil;
    lblSubConta: TLabel;
    dblcSubConta: TwwDBLookupCombo;
    qryItemIDITEM: TFloatField;
    qryItemNOME_ITEM: TStringField;
    qryObjetoIDOBJETO: TFloatField;
    qryObjetoNOMEOBJETO: TStringField;
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbedtContaContabilExit(Sender: TObject);
    procedure dblcTipoRecebimentoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcItemEnter(Sender: TObject);
    procedure rgpRegimePagamentoClick(Sender: TObject);
    procedure dblcObjetoChange(Sender: TObject);
    procedure dblcItemChange(Sender: TObject);
  private
    { Private declarations }
    idObjeto      : integer;
    idItem          : integer;
  public
    { Public declarations }
  end;

var
  frmCadObjetoItem: TfrmCadObjetoItem;
  bObrigaSubConta,bObrigaCentroCusto: boolean;
implementation

uses uMensErro, uDataBase, DBaseDados, USistema,UIntegraback,umodulo;

{$R *.DFM}

procedure TfrmCadObjetoItem.FormCreate(Sender: TObject);
begin
   inherited;
   qry.Close;
   qry.ParamByName('IDPessoa').AsFloat:=Sistema.idEmpresa;
   qry.ParamByName('IDObjeto').AsFloat:=-1;
   qry.ParamByName('IDItem').AsFloat:=-1;
   qry.Open;

   qryObjeto.Close;
   qryObjeto.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryObjeto.Open;

   qrySubConta.Close;
   qrySubConta.ParamByName('IDPessoa').AsInteger:=Sistema.idEmpresa;
   qrySubConta.Open;

end;

procedure TfrmCadObjetoItem.FormActivate(Sender: TObject);
begin
   inherited;
   if not qryParam.Active then qryParam.Open;
   if qryParam.FieldByName('FLGTIPODESEMB').AsString = 'S' then
    begin
       pnlConta.Enabled := false;
       dbedtContaContabil.ParentColor := true;
       dblcSubConta.ParentColor := true;
    end
   else
    begin
       pnlConta.Enabled := true;
       dbedtContaContabil.ParentColor := false;
       dblcSubConta.ParentColor := false;
    end;

   idObjeto := 0;
   idItem   := 0;

   if IntegraBack.Contabilidade = 'S' then
    begin
       dbedtContaContabil.Enabled:=True;
       dbedtContaContabil.Mascara:=IntegraBack.MascaraPlano;
       dbedtContaContabil.Plano:=IntegraBack.Plano;
    end
   else
    dbedtContaContabil.Enabled :=False;

   qryParam.Close;
end;

procedure TfrmCadObjetoItem.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   rgpRegimePagamento.ItemIndex:=0;
   if dblcObjeto.CanFocus then dblcObjeto.SetFocus;
   qry.FieldByName('RECPAG').AsString    := 'P';
   qry.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
end;

procedure TfrmCadObjetoItem.CmeCadastroFind(Sender: TObject);
begin
   if (MontaSelect.RetornouValor) then
    begin
       qry.Close;
       qry.ParamByName('IDPessoa').AsFloat:=Sistema.idEmpresa;
       qry.ParamByName('IDObjeto').AsFloat:=StrToFloat(MontaSelect.ValoresChave[0]);
       qry.ParamByName('IDItem').AsFloat:=StrToFloat(MontaSelect.ValoresChave[1]);
       qry.Open;

       idObjeto := qry.FieldByName('IDOBJETO').AsInteger;
       idItem   := qry.FieldByName('IDITEM').AsInteger;

       if qry.FieldByName('CODSUBCONTA').isNull then
          dblcSubConta.enabled:=False
       else
          dblcSubConta.enabled:=True;

      qryRecebimentoDesembolso.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
      qryRecebimentoDesembolso.ParamByName('RecPag').AsString:=qry.FieldByName('RECPAG').AsString;
      qryRecebimentoDesembolso.Open;
   end;
end;

procedure TfrmCadObjetoItem.bbtnConfirmarClick(Sender: TObject);
begin
   if Trim(qry.FieldByName('IDOBJETO').AsString) = '' then
    begin
       MsgDlg('Obrigatório preencher o Serviço/Produto','Atenção',mtWarning,[mbOk],0);
       if dblcObjeto.CanFocus then dblcObjeto.SetFocus;
       exit;
    end;

   if Trim(qry.FieldByName('IDITEM').AsString) = '' then
    begin
       MsgDlg('Obrigatório preencher o Item Contratual','Atenção',mtWarning,[mbOk],0);
       if dblcItem.CanFocus then dblcItem.SetFocus;
       exit;
    end;

    if IntegraBack.Contabilidade = 'S' then
     begin
        if (dbedtContaContabil.Valida <> VcOK) then
         begin
            if dbedtContaContabil.CanFocus then dbedtContaContabil.SetFocus;
            exit;
         end;
        if (dbedtContaContabil.Conta.ObrigaSubConta) and
           (Trim(dblcSubConta.Text) = '') then
         begin
            MsgDlg('Obrigatório preencher a SubConta','Atenção',mtWarning,[mbOk],0);
            if dblcSubConta.CanFocus then dblcSubConta.SetFocus;
            exit;
         end;
     end;
   inherited;
end;

procedure TfrmCadObjetoItem.dblcObjetoChange(Sender: TObject);
begin
   qryItem.Close;
   qryItem.ParamByName('IDObjeto').AsFloat:=qryObjetoIDOBJETO.AsFloat;
   qryItem.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryItem.ParamByName('IDItem').AsFloat:=qryIDITEM.AsFloat;
   qryItem.Open;
end;

procedure TfrmCadObjetoItem.dblcItemChange(Sender: TObject);
begin
   if qry.State in [dsEdit] then
    begin
       qryAux.Close;
       qryAux.ParamByName('IDObjeto').AsFloat:=qry.FieldByName('IDOBJETO').AsFloat;
       qryAux.ParamByName('IDItem').AsFloat:=qry.FieldByName('IDITEM').AsFloat;
       qryAux.Open;

       if not(qryAux.IsEmpty) and (qryIDITEM.NewValue<>qryIDITEM.OldValue) then
        begin
           MsgDlg('Esse item já está relacionado com este serviço/produto','Atenção',mtWarning,[mbOk],0);
           if dblcItem.CanFocus then dblcItem.SetFocus;
        end;
    end;
end;

procedure TfrmCadObjetoItem.dblcItemEnter(Sender: TObject);
begin
   if dblcObjeto.Text='' then dblcObjeto.SetFocus;
end;

procedure TfrmCadObjetoItem.rgpRegimePagamentoClick(
  Sender: TObject);
begin
   qryRecebimentoDesembolso.Close;
   qryRecebimentoDesembolso.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   if rgpRegimePagamento.ItemIndex=0 then
      qryRecebimentoDesembolso.ParamByName('RecPag').AsString:='P'
   else
      qryRecebimentoDesembolso.ParamByName('RecPag').AsString:='R';
   qryRecebimentoDesembolso.Open;
end;

procedure TfrmCadObjetoItem.dbedtContaContabilExit(Sender: TObject);
begin
  inherited;
  if (ActiveControl.Tag <> 99) then   //Tag do Botão Cancelar
   begin
      if (dbedtContaContabil.Valida <> VcOK) then
       begin
          if dbedtContaContabil.CanFocus then dbedtContaContabil.SetFocus;
          exit;
       end;

      if dbedtContaContabil.Conta.ObrigaSubConta then
       begin
          dblcSubConta.Enabled := True;
          if dblcSubConta.CanFocus then dblcSubConta.SetFocus;
       end
      else
       dblcSubConta.Enabled := False;
   end;
end;

procedure TfrmCadObjetoItem.dblcTipoRecebimentoExit(Sender: TObject);
begin
  inherited;
  // colocar conta contabil
  qry.FieldbyName('PLACONTA').AsString := qryRecebimentoDesembolso.FieldByName('PLACONTA').AsString;
  dbedtContaContabil.Valida;
end;

end.
