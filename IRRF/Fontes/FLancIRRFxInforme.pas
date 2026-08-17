unit FLancIRRFxInforme;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  CMProcuraMask, DBCtrls, wwdblook, CMProcuraSubTipo,
  TREdit, {$IFDEF VERSAO0505} uComum, wwdbdatetimepicker, CMDateTimePicker,
  CMDBLookupCombo, CmEventosCadastro, ImgList {$ELSE} uCMTypes {$ENDIF}, CMDBLookupCombo, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList;

type
  TfrmLancIRRFxInforme = class(TfrmCadMestreDetalheCS)
    PSubTipoBeneficiario1: TCMProcuraSubTipo;
    dbedDataLanc: TCMDateTimePicker;
    lblDataLancamento: TLabel;
    lblNatRendimento: TLabel;
    dblcNatRendimento: TwwDBLookupCombo;
    lblDocumento: TLabel;
    dblcDocumento: TwwDBLookupCombo;
    dbFolha: TDBCheckBox;
    cmccContaContabil: TCMProcuraMaskContabil;
    tbsValores: TTabSheet;
    tbsPrevidencia: TTabSheet;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryEmpresaProp: TwwQuery;
    qryTabIRRF: TwwQuery;
    qryPFisica: TwwQuery;
    qryDocumento: TwwQuery;
    qryNatRendimento: TwwQuery;
    qryPatro: TwwQuery;
    qryPrograma: TwwQuery;
    qryPlanoPrev: TwwQuery;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    lblBase: TLabel;
    dbrValorBase: TDBRealEdit;
    dbrIRRF: TDBRealEdit;
    dbrINSS: TDBRealEdit;
    lblINSS: TLabel;
    dbrPercIRRF: TDBRealEdit;
    lblPercent: TLabel;
    lblPerc: TLabel;
    dbrValorReferencia: TDBRealEdit;
    lblValorRef: TLabel;
    lblIRRF: TLabel;
    qryDetIDINFORME: TFloatField;
    qryDetIDLANCIRRF: TFloatField;
    qryDetPERCLANC: TFloatField;
    qryDetVLRLANC: TFloatField;
    qryDetNOMEINFORME: TStringField;
    dblcLinhaInforme: TCMDBLookupCombo;
    lblLinhaInforme: TLabel;
    dbreValor: TDBRealEdit;
    lblValor: TLabel;
    qryLinhaInforme: TwwQuery;
    qryAux: TwwQuery;
    qryDetVLRLANCSINAL: TFloatField;
    qryCentroCusto: TwwQuery;
    lblPIS: TLabel;
    dbrPIS: TDBRealEdit;
    qryMotivo: TwwQuery;
    qryVersaoFolha: TwwQuery;
    lblPrograma: TLabel;
    dblcPrograma: TwwDBLookupCombo;
    lblCentroCusto: TLabel;
    dblcCentroCusto: TwwDBLookupCombo;
    lblMotivo: TLabel;
    dblcMotivo: TwwDBLookupCombo;
    Label1: TLabel;
    dblcVersaoFolha: TwwDBLookupCombo;
    lblIOF: TLabel;
    dbrIOF: TDBRealEdit;
    procedure dbrValorBaseExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcDocumentoEnter(Sender: TObject);
    procedure PSubTipoBeneficiario1Exit(Sender: TObject);
    procedure dbrPercIRRFExit(Sender: TObject);
    procedure cmccContaContabilExit(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    procedure Deletar(bPrincipal: Boolean);
    procedure FazerQryPrincipal;
    procedure SelecionaFilhos;
  public
    { Public declarations }
  end;

var
  frmLancIRRFxInforme: TfrmLancIRRFxInforme;
  iIdIRRF : Double;

implementation

uses uMensErro,uDataBase, DBaseDados,UModulo,uSistema,uFuncaoGeral, uIntegraBack, uLancIRRF;

{$R *.DFM}

procedure TfrmLancIRRFxInforme.dbrValorBaseExit(Sender: TObject);
var sValtot:String;
begin
   inherited;
   if qryPFisica.FieldByName('TIPO').AsString = 'F' then begin
      sValTot:=Funcaogeral.OraNumero(dbrValorBase.value);
      //
      qryTabIRRF.Close;
      qryTabIRRF.SQL.Clear;
      qryTabIRRF.SQL.text := 'SELECT ALIQUOTA_IRRF,PARCDEDUZIRRF FROM IRRF WHERE FAIXA_IRRF >= '+sValTot+' AND ROWNUM = 1';
      qryTabIRRF.open;
      //
      if not qryTabIRRF.IsEmpty then begin
         qry.FieldByName('VLRIRRF').asfloat := ((dbrValorBase.value)*(qryTabIRRF.FieldByName('ALIQUOTA_IRRF').AsFloat/100))-(qryTabIRRF.FieldByName('PARCDEDUZIRRF').AsFloat);
         qry.fieldbyname('VLRREFERENCIA').asfloat := qry.FieldByName('VLRBASE').asfloat;
         qry.fieldbyname('PERCIRRF').asfloat := qryTabIRRF.FieldByName('ALIQUOTA_IRRF').AsFloat;
      end;
   end;
end;

procedure TfrmLancIRRFxInforme.FormActivate(Sender: TObject);
begin
  inherited;
  tbsValores.Enabled := False;
  //
  cmccContaContabil.Mascara := IntegraBack.MascaraPlano;
  cmccContaContabil.Plano   := IntegraBack.Plano;
  //
  MontaSelect.Filtro.Add('LANCIRRF.IDPESSOA = '+IntToStr(Sistema.idempresa));
  //
  qryNatRendimento.Close;
  qryNatRendimento.SQL.Clear;
  qryNatRendimento.SQL.text := 'SELECT * FROM NATURENDIMENTO ORDER BY DESCRICAO';
  qryNatRendimento.Open;
  //
  qryEmpresaProp.Close;
  qryEmpresaProp.ParamByName('PIDPESSOA').AsInteger :=Sistema.idEmpresa;
  qryEmpresaProp.Open;
  //
  qryLinhaInforme.Close;
  qryLinhaInforme.Open;
end;


procedure TfrmLancIRRFxInforme.CmeCadastroFind(Sender: TObject);
begin
   if MontaSelect.RetornouValor then begin
      tbsValores.Enabled := False;
      //
      iIdIRRF:=StrToFloat(MontaSelect.ValoresChave[0]);
      //
      FazerQryPrincipal;
      SelecionaFilhos;
      //
      qryDocumento.Close;
      qryDocumento.SQL.Clear;
      qryDocumento.SQL.text := 'SELECT IDFORCLI,CODDOCUMENTO,NODOCUMENTO,COMPLDOCUMENTO FROM '+Sistema.PrefixoServidor+'DOCUMENTO WHERE CODDOCUMENTO = '+IntToStr(qry.FieldByName('CODDOCUMENTO').AsInteger);
      qryDocumento.Open;
      //
   end;
end;

procedure TfrmLancIRRFxInforme.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  tbsValores.Enabled := True;
  iIdIRRF := -1;
  SelecionaFilhos;
  PSubTipoBeneficiario1.SetFocus;
  qry.FieldByName('IDPESSOA').AsInteger   :=Sistema.IdEmpresa;
  qry.FieldByName('FLGFOLHA').AsString    :='N';
  qry.FieldByName('NUMDOCUMENTO').AsString:=qryEmpresaProp.FieldByName('NUMDOCUMENTO').AsString;
end;

procedure TfrmLancIRRFxInforme.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  tbsValores.Enabled := True;
  PSubTipoBeneficiario1.SetFocus;
end;

procedure TfrmLancIRRFxInforme.FazerQryPrincipal;
begin
  qry.Close;
  qry.ParamByName('IDLANCIRRF').AsFloat := iIdIRRF;
  qry.Open;
end;

procedure TfrmLancIRRFxInforme.SelecionaFilhos;
begin
  qryDet.Close;
  qryDet.ParamByName('IDLANCIRRF').AsFloat := iIdIRRF;
  qryDet.Open;
end;

procedure TfrmLancIRRFxInforme.FormCreate(Sender: TObject);
begin
   inherited;
   iIdIRRF := -1;
   FazerQryPrincipal;
   SelecionaFilhos;
   //
   cmccContaContabil.Enabled := IntegraBack.Contabilidade = 'S';
   pnlPlanoPatroC.Enabled    := Sistema.UsaPlanoPatro;
   //
   qryPrograma.Close;
   qryPrograma.Open;
   //
   qryPatro.Close;
   qryPatro.Open;
   //
   qryPlanoPrev.Close;
   qryPlanoPrev.Open;
   //
   qryMotivo.Close;
   qryMotivo.Open;
   //
   qryVersaoFolha.Close;
   qryVersaoFolha.Open;
   //
   qryCentroCusto.Close;
   qryCentroCusto.ParamByName('IDEMPRESA').AsInteger := Sistema.idEmpresa;
   qryCentroCusto.Open;

end;

procedure TfrmLancIRRFxInforme.dblcDocumentoEnter(Sender: TObject);
begin
  inherited;
  qryDocumento.Close;
  qryDocumento.SQL.Clear;
  qryDocumento.SQL.text := 'SELECT IDFORCLI,CODDOCUMENTO,NODOCUMENTO,COMPLDOCUMENTO FROM '+Sistema.PrefixoServidor+'DOCUMENTO WHERE IDFORCLI = '+IntToStr(PSubTipoBeneficiario1.SubTipoReg.Id);
  qryDocumento.Open;
end;


procedure TfrmLancIRRFxInforme.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
var rFator:Double;
begin
   Accept := false;
   if trim(PSubTipoBeneficiario1.text) = '' then begin
      MsgDlg('Obrigatório preencher o Beneficiário','Erro',mtError,[mbOk],0);
      PSubTipoBeneficiario1.SetFocus;
      exit;
   end;
   if (ActiveControl.Tag <> 99)  and (PSubTipoBeneficiario1.Valida <> VcOK) then begin
      PSubTipoBeneficiario1.SetFocus;
      exit;
   end;
   if trim(dbedDataLanc.text) = '' then begin
      MsgDlg('Obrigatório preencher a Data de Lançamento','Erro',mtError,[mbOk],0);
      dbedDataLanc.SetFocus;
      exit;
   end;
   if trim(dblcNatRendimento.text) = '' then begin
      MsgDlg('Obrigatório preencher a Natureza do Rendimento','Erro',mtError,[mbOk],0);
      dblcNatRendimento.SetFocus;
      exit;
   end;
   if IntegraBack.Contabilidade = 'S' then begin
      if cmccContaContabil.Valida <> VcOK then begin
         cmccContaContabil.SetFocus;
         Exit;
      end;
   end;
   if Sistema.UsaPlanoPatro then begin
      if trim(dblcPlanoPrevC.Text) = '' then begin
         MsgDlg('Obrigatório preencher o Plano Previdenciário','Erro',mtError,[mbOk],0);
         if dblcPlanoPrevC.CanFocus then dblcPlanoPrevC.SetFocus;
         exit;
      end;
      if trim(dblcPatroC.Text) = '' then begin
         MsgDlg('Obrigatório preencher a Patrocinadora','Erro',mtError,[mbOk],0);
         if dblcPatroC.CanFocus then dblcPatroC.SetFocus;
         exit;
      end;
   end;
   Accept := true;
   if IntegraBack.Contabilidade = 'S' then
      qry.FieldByName('PLANO').AsInteger := IntegraBack.Plano;
   //
   if qry.FieldByName('IDLANCIRRF').AsInteger <= 0 then
      qry.FieldByName('IDLANCIRRF').AsInteger := LeUltRegistro(nil,'LANCIRRF');
   //
   qryDet.First;
   while not qryDet.EOF do begin
      qryAux.Close;
      qryAux.SQL.Text:='SELECT FLGNATUREZA,CODDIRF FROM INFORME WHERE IDINFORME = '+IntToStr(qryDetIDINFORME.AsInteger);
      qryAux.Open;
      if qryAux.FieldByName('FLGNATUREZA').isNull then begin
         if qryAux.FieldByName('CODDIRF').AsInteger in [1,2,5] then
            rFator := 1
         else
            rFator := -1;
      end else begin
         if qryAux.FieldByName('FLGNATUREZA').AsString = 'P' then
            rFator := 1
         else
            rFator := -1;
      end;
      qryDet.Edit;
      qryDetIDLANCIRRF.AsFloat   := qry.FieldByName('IDLANCIRRF').AsFloat;
      qryDetVLRLANCSINAL.AsFloat := qryDetVLRLANC.AsFloat*rFator;
      qryDet.Post;
      qryDet.Next;
   end;

end;

procedure TfrmLancIRRFxInforme.PSubTipoBeneficiario1Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl.Tag <> 99)  and (PSubTipoBeneficiario1.Valida <> VcOK) then begin
     PSubTipoBeneficiario1.SetFocus;
     exit;
  end;
  if trim(PSubTipoBeneficiario1.text) <> '' then begin
     qryPFisica.Close;
     qryPFisica.ParamByName('PIDPESSOA').AsInteger:=PSubTipoBeneficiario1.SubTipoReg.Id;
     qryPFisica.Open;
  end;

end;

procedure TfrmLancIRRFxInforme.dbrPercIRRFExit(Sender: TObject);
begin
  inherited;
  if (qryPFisica.FieldByName('TIPO').AsString = 'J') or (qryPFisica.FieldByName('TIPO').isNull) then begin
     qry.FieldByName('VLRIRRF').AsFloat:=(qry.FieldByName('VLRBASE').AsFloat*((qry.FieldByName('PERCIRRF').AsFloat)/100));
     dbrIRRF.Value :=qry.FieldByName('VLRIRRF').AsFloat;
  end;
end;

procedure TfrmLancIRRFxInforme.cmccContaContabilExit(Sender: TObject);
begin
  inherited;
  if ActiveControl.Tag <> 99 then begin
     if cmccContaContabil.Valida <> VcOK then begin
        cmccContaContabil.SetFocus;
        Exit;
     end;
  end;
end;


procedure TfrmLancIRRFxInforme.CmeCadastroConfirma(Sender: TObject);
var iIdVersaoFolha,iIdMotivo,iIdModulo, iIdPlanoPrev, iIdPatro, iIdPrograma,iCodDocumento, iBenef : LongInt;
    sCodNatureza, sDataLanc, sFlgFolha, sContaContabil, sCodCentroCusto : String;
    rValBase, rValIRRF, rValINSS, rValPIS,rValIOF, rValRef, rPerc, iCodLanc : Double;
    bPrim : Boolean;
begin
   Try
      StartTransacao;
      iCodDocumento  := qry.FieldByName('CODDOCUMENTO').AsInteger;
      iBenef         := qry.FieldByName('IDBENEFIRRF').AsInteger;
      sCodNatureza   := qry.FieldByName('CODNATUREZA').AsString;
      sDataLanc      := qry.FieldByName('DATALANCAMENTO').AsString;
      rValBase       := qry.FieldByName('VLRBASE').AsFloat;
      rValIRRF       := qry.FieldByName('VLRIRRF').AsFloat;
      rValINSS       := qry.FieldByName('VLRINSS').AsFloat;
      rValPIS        := qry.FieldByName('VLRPIS').AsFloat;
      rValIOF        := qry.FieldByName('VLRIOF').AsFloat;
      rValRef        := qry.FieldByName('VLRREFERENCIA').AsFloat;
      rPerc          := qry.FieldByName('PERCIRRF').AsFloat;
      sContaContabil := qry.FieldByName('PLACONTA').AsString;
      sFlgFolha      := qry.FieldByName('FLGFOLHA').AsString;
      iIdPlanoPrev   := qry.FieldByName('IDPLANOPREV').AsInteger;
      iIdPatro       := qry.FieldByName('IDPATRO').AsInteger;
      iIdPrograma    := qry.FieldByName('IDPROGRAMA').AsInteger;
      sCodCentroCusto:= qry.FieldByName('CODCENTROCUSTO').AsString;
      iIdModulo      := Sistema.idModulo;
      iCodLanc       := 0;
      bPrim          := true;
      if sbtnAlterar.Down then begin
         iCodLanc      := qry.FieldByName('IDLANCIRRF').AsFloat;
         iIdModulo     := qry.FieldByName('IDMODULO').AsInteger;
         Deletar(False);
      end;
      if qry.FieldByName('IDMOTIVO').isNull then
         iIdMotivo     := -1
      else
         iIdMotivo     := qry.FieldByName('IDMOTIVO').AsInteger;
      if qry.FieldByName('IDHSTFOLHABENEF').isNull then
         iIdVersaoFolha := -1
      else
         iIdVersaoFolha := qry.FieldByName('IDHSTFOLHABENEF').AsInteger;

      LancIRRF.GravaIRRF(iCodDocumento,Sistema.idEmpresa,iBenef,sCodNatureza,
                  sDataLanc,rValBase,rValIRRF,rValINSS,rValPIS,rValRef,rPerc,qryDet,iCodLanc,
                  sContaContabil, IntegraBack.Plano, sFlgFolha,iIdPlanoPrev,
                  iIdPatro, iIdPrograma, bPrim, iIdModulo,iIdMotivo,sCodCentroCusto,iIdVersaoFolha,rValIOF);
      CommitTransacao;
   Except
      RollBackTransacao;
      iIdIRRF  := qry.FieldByName('IDLANCIRRF').AsFloat;
      FazerQryPrincipal;
      SelecionaFilhos;
      raise;
   end;
   iIdIRRF  := qry.FieldByName('IDLANCIRRF').AsFloat;
   FazerQryPrincipal;
   SelecionaFilhos;

end;

procedure TfrmLancIRRFxInforme.Deletar(bPrincipal: Boolean);
begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('DELETE LANCXINFORME WHERE IDLANCIRRF = '+qry.FieldByName('IDLANCIRRF').AsString);
   qryAux.ExecSQL;
   if bPrincipal then begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('DELETE LANCIRRF WHERE IDLANCIRRF = '+qry.FieldByName('IDLANCIRRF').AsString);
      qryAux.ExecSQL;
   end;
end;

procedure TfrmLancIRRFxInforme.CmeCadastroDelete(Sender: TObject);
begin
   try
      StartTransacao;
      Deletar(True);
      CommitTransacao;
   except
      RollBackTransacao;
      MsgDlg('Erro ao tentar excluir Lançamentos ligados ao Documento do IRRF','Erro',mtError,[mbOk],0);
      iIdIRRF  := qry.FieldByName('IDLANCIRRF').AsFloat;
      FazerQryPrincipal;
      SelecionaFilhos;
      raise;
   end;
   iIdIRRF  := qry.FieldByName('IDLANCIRRF').AsFloat;
   FazerQryPrincipal;
   SelecionaFilhos;
end;

procedure TfrmLancIRRFxInforme.CmeDetalheConfirma(Sender: TObject);
begin
   if qryDet.State in [dsEdit,dsInsert] then
      qryDetNOMEINFORME.AsString := dblcLinhaInforme.Text;
   inherited;
end;
end.
