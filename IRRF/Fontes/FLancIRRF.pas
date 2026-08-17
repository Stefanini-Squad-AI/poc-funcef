unit FLancIRRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBCtrls, TREdit, 
  wwdblook, TB97Ctls, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, IvDictio,
  IvMulti, IvEMulti, CMProcuraSubTipo,{$IFDEF VERSAO0505} uComum,
  CMProcuraMask, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro,
  ImgList {$ELSE} uCMTypes {$ENDIF}, CMDBLookupCombo,
  CMProcuraMask, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro,
  ImgList;

type
  TfrmLancIRRF = class(TfrmCadastroCS)
    dblcNatRendimento: TwwDBLookupCombo;
    lblNatRendimento: TLabel;
    qryNatRendimento: TwwQuery;
    dbedDataLanc: TCMDateTimePicker;
    lblDataLancamento: TLabel;
    dblcDocumento: TwwDBLookupCombo;
    lblDocumento: TLabel;
    qryDocumento: TwwQuery;
    gbValores: TGroupBox;
    lblBase: TLabel;
    lblIRRF: TLabel;
    lblINSS: TLabel;
    dbrINSS: TDBRealEdit;
    dbrValorBase: TDBRealEdit;
    Label1: TLabel;
    dbrValorReferencia: TDBRealEdit;
    Label2: TLabel;
    lblPerc: TLabel;
    dbrPercIRRF: TDBRealEdit;
    dbrIRRF: TDBRealEdit;
    qryPFisica: TwwQuery;
    qryTabIRRF: TwwQuery;
    qryEmpresaProp: TwwQuery;
    PSubTipoBeneficiario1: TCMProcuraSubTipo;
    qryInforme: TwwQuery;
    updInforme: TUpdateSQL;
    cmccContaContabil: TCMProcuraMaskContabil;
    qryPrograma: TwwQuery;
    qryPatro: TwwQuery;
    qryPlanoPrev: TwwQuery;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    lblPrograma: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    dblcPrograma: TwwDBLookupCombo;
    dbFolha: TDBCheckBox;
    qryVazia: TwwQuery;
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure Deletar;
    Procedure CmeCadastroDelete(Sender: TObject);
    procedure FazerQryPrincipal;
    procedure dblcDocumentoEnter(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbrValorBaseExit(Sender: TObject);
    procedure PSubTipoBeneficiario1Exit(Sender: TObject);
    procedure dbrPercIRRFExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmccContaContabilExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancIRRF: TfrmLancIRRF;
  iIdIRRF : Integer;
implementation

uses uMensErro,uDataBase, DBaseDados,UModulo,uSistema,uFuncaoGeral, uIntegraBack, uLancIRRF;
{$R *.DFM}

procedure TfrmLancIRRF.FormActivate(Sender: TObject);
begin
  inherited;
  //
  cmccContaContabil.Mascara := IntegraBack.MascaraPlano;
  cmccContaContabil.Plano   := IntegraBack.Plano;
  //
  MontaSelect.Filtro.Add('LANCIRRF.IDPESSOA = '+IntToStr(Sistema.idempresa));
  //
  qryNatRendimento.Close;
  qryNatRendimento.SQL.Clear;
  qryNatRendimento.SQL.text := 'SELECT * FROM '+Sistema.PrefixoServidor+'NATURENDIMENTO ORDER BY CODNATUREZA';
  qryNatRendimento.Open;
  //
  qryEmpresaProp.Close;
  qryEmpresaProp.ParamByName('PIDPESSOA').AsInteger :=Sistema.idEmpresa;
  qryEmpresaProp.Open;
  //
end;

procedure TfrmLancIRRF.CmeCadastroFind(Sender: TObject);
begin
     if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
     begin
        iIdIRRF:=StrToInt(MontaSelect.ValoresChave[0]);
        //
        FazerQryPrincipal;
        //
        qryDocumento.Close;
        qryDocumento.SQL.Clear;
        qryDocumento.SQL.text := 'SELECT IDFORCLI,CODDOCUMENTO,NODOCUMENTO,COMPLDOCUMENTO FROM '+Sistema.PrefixoServidor+'DOCUMENTO WHERE CODDOCUMENTO = '+IntToStr(qry.FieldByName('CODDOCUMENTO').AsInteger);
        qryDocumento.Open;
        //

     end;
end;

procedure TfrmLancIRRF.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  PSubTipoBeneficiario1.SetFocus;
  qry.FieldByName('IDPESSOA').AsInteger   :=Sistema.IdEmpresa;
  qry.FieldByName('FLGFOLHA').AsString    :='N';
  qry.FieldByName('NUMDOCUMENTO').AsString:=qryEmpresaProp.FieldByName('NUMDOCUMENTO').AsString;
end;

procedure TfrmLancIRRF.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  PSubTipoBeneficiario1.SetFocus;
end;
procedure TfrmLancIRRF.FazerQryPrincipal;
begin
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.text := 'SELECT * FROM LANCIRRF WHERE (IDLANCIRRF = '+IntToStr(iIdIRRF)+')';
  qry.Open;
end;
procedure TfrmLancIRRF.dblcDocumentoEnter(Sender: TObject);
begin
  inherited;
  qryDocumento.Close;
  qryDocumento.SQL.Clear;
  qryDocumento.SQL.text := 'SELECT IDFORCLI,CODDOCUMENTO,NODOCUMENTO,COMPLDOCUMENTO FROM '+Sistema.PrefixoServidor+'DOCUMENTO WHERE IDFORCLI = '+IntToStr(PSubTipoBeneficiario1.SubTipoReg.Id);
  qryDocumento.Open;
end;

procedure TfrmLancIRRF.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(PSubTipoBeneficiario1.text) = '' then
  begin
    MsgDlg('Obrigatório preencher o Beneficiário','Erro',mtError,[mbOk],0);
    PSubTipoBeneficiario1.SetFocus;
    exit;
  end;
  if (ActiveControl.Tag <> 99)  and (PSubTipoBeneficiario1.Valida <> VcOK) then
  Begin
     PSubTipoBeneficiario1.SetFocus;
     exit;
  end;
  if trim(dbedDataLanc.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a Data de Lançamento','Erro',mtError,[mbOk],0);
    dbedDataLanc.SetFocus;
    exit;
  end;
  if trim(dblcNatRendimento.text) = '' then
  begin
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
        dblcPlanoPrevC.SetFocus;
        exit;
     end;
     if trim(dblcPatroC.Text) = '' then begin
        MsgDlg('Obrigatório preencher a Patrocinadora','Erro',mtError,[mbOk],0);
        dblcPatroC.SetFocus;
        exit;
     end;
  end;
  if dbrValorBase.Value = 0 then
  begin
    MsgDlg('Obrigatório preencher a Base de Cálculo do Imposto','Erro',mtError,[mbOk],0);
    dbrValorBase.SetFocus;
    exit;
  end;
  if IntegraBack.Contabilidade = 'S' then
     qry.FieldByName('PLANO').AsInteger := IntegraBack.Plano;
  //
  if qry.FieldByName('IDLANCIRRF').AsInteger <= 0 then
     qry.FieldByName('IDLANCIRRF').AsInteger := LeUltRegistro(nil,'LANCIRRF');
  inherited;


end;

procedure TfrmLancIRRF.dbrValorBaseExit(Sender: TObject);
var sValtot:String;
begin
  inherited;
      If qryPFisica.FieldByName('TIPO').AsString = 'F' then
       Begin
           sValTot:=Funcaogeral.OraNumero(dbrValorBase.value);
           //
           qryTabIRRF.Close;
           qryTabIRRF.SQL.Clear;
           qryTabIRRF.SQL.text := 'SELECT ALIQUOTA_IRRF,PARCDEDUZIRRF FROM IRRF WHERE FAIXA_IRRF >= '+sValTot+' AND ROWNUM = 1';
           qryTabIRRF.open;
           //
           If not qryTabIRRF.IsEmpty then
           Begin
              qry.FieldByName('VLRIRRF').asfloat := ((dbrValorBase.value)*(qryTabIRRF.FieldByName('ALIQUOTA_IRRF').AsFloat/100))-(qryTabIRRF.FieldByName('PARCDEDUZIRRF').AsFloat);
              qry.fieldbyname('VLRREFERENCIA').asfloat := qry.FieldByName('VLRBASE').asfloat;
              qry.fieldbyname('PERCIRRF').asfloat := qryTabIRRF.FieldByName('ALIQUOTA_IRRF').AsFloat;
           end;
      end;
end;

procedure TfrmLancIRRF.PSubTipoBeneficiario1Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl.Tag <> 99)  and (PSubTipoBeneficiario1.Valida <> VcOK) then
  Begin
     PSubTipoBeneficiario1.SetFocus;
     exit;
  end;
  if trim(PSubTipoBeneficiario1.text) <> '' then begin
     qryPFisica.Close;
     qryPFisica.ParamByName('PIDPESSOA').AsInteger:=PSubTipoBeneficiario1.SubTipoReg.Id;
     qryPFisica.Open;
  end;
end;

procedure TfrmLancIRRF.dbrPercIRRFExit(Sender: TObject);
begin
  inherited;
  if (qryPFisica.FieldByName('TIPO').AsString = 'J') or (qryPFisica.FieldByName('TIPO').isNull) then begin
     qry.FieldByName('VLRIRRF').AsFloat:=(qry.FieldByName('VLRBASE').AsFloat*((qry.FieldByName('PERCIRRF').AsFloat)/100));
     dbrIRRF.Value :=qry.FieldByName('VLRIRRF').AsFloat;
  end;
end;

procedure TfrmLancIRRF.FormCreate(Sender: TObject);
begin
  inherited;
  iIdIRRF:=0;
  FazerQryPrincipal;
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
end;

procedure TfrmLancIRRF.cmccContaContabilExit(Sender: TObject);
begin
  inherited;
  if ActiveControl.Tag <> 99 then begin
     if cmccContaContabil.Valida <> VcOK then begin
        cmccContaContabil.SetFocus;
        Exit;
     end;
  end;
end;

procedure TfrmLancIRRF.CmeCadastroConfirma(Sender: TObject);
var iIdModulo, iIdPlanoPrev, iIdPatro, iIdPrograma,iCodDocumento, iBenef : LongInt;
    sCodNatureza, sDataLanc, sFlgFolha, sContaContabil : String;
    rValBase, rValIRRF, rValINSS, rValRef, rPerc , iCodLanc: Double;
    bPrim : Boolean;
begin
   Try
      StartTransacao;
      iCodDocumento := qry.FieldByName('CODDOCUMENTO').AsInteger;
      iBenef        := qry.FieldByName('IDBENEFIRRF').AsInteger;
      sCodNatureza  := qry.FieldByName('CODNATUREZA').AsString;
      sDataLanc     := qry.FieldByName('DATALANCAMENTO').AsString;
      rValBase      := qry.FieldByName('VLRBASE').AsFloat;
      rValIRRF      := qry.FieldByName('VLRIRRF').AsFloat;
      rValINSS      := qry.FieldByName('VLRINSS').AsFloat;
      rValRef       := qry.FieldByName('VLRREFERENCIA').AsFloat;
      rPerc         := qry.FieldByName('PERCIRRF').AsFloat;
      sContaContabil:= qry.FieldByName('PLACONTA').AsString;
      sFlgFolha     := qry.FieldByName('FLGFOLHA').AsString;
      iIdPlanoPrev  := qry.FieldByName('IDPLANOPREV').AsInteger;
      iIdPatro      := qry.FieldByName('IDPATRO').AsInteger;
      iIdPrograma   := qry.FieldByName('IDPROGRAMA').AsInteger;
      iIdModulo     := Sistema.idModulo;
      if sbtnAlterar.Down then begin
         iIdModulo     := qry.FieldByName('IDMODULO').AsInteger;
         Deletar;
      end;
      iCodLanc := 0;
      bPrim := true;
      LancIRRF.GravaIRRF(iCodDocumento,Sistema.idEmpresa,iBenef,sCodNatureza,
                  sDataLanc,rValBase,rValIRRF,rValINSS,0,rValRef,rPerc,qryVazia,iCodLanc,
                  sContaContabil, IntegraBack.Plano, sFlgFolha,iIdPlanoPrev,
                  iIdPatro, iIdPrograma, bPrim, iIdModulo,-1, '',-1);
      CommitTransacao;
   Except
      RollBackTransacao;
      raise;
   end;
end;

procedure TfrmLancIRRF.Deletar;
begin
   qryInforme.close;
   qryInforme.parambyname('idlancirrf').asfloat := qry.fieldbyname('idlancirrf').AsFloat;
   qryInforme.open;
   while not qryInforme.EOF do qryInforme.Delete;
   qryInforme.ApplyUpdates;
   qry.Delete;
   qry.ApplyUpdates;
end;
procedure TfrmLancIRRF.CmeCadastroDelete(Sender: TObject);
begin
   try
      StartTransacao;
      Deletar;
      CommitTransacao;
   except
      RollBackTransacao;
      MsgDlg('Erro ao tentar excluir Lançamentos ligados ao Documento do IRRF','Erro',mtError,[mbOk],0);
      raise;
   end;
end;

end.
