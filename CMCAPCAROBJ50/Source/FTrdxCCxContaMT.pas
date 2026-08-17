// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

{
--------------------------------------------------------------------------------------------------
 Nº SOL......: 172384/9603
 Nº KINTANA..: 1661662
 Data........: 25/06/2012
 Responsável.: Vander Campos
 Descrição...: Inclusão do Grupo Da Contas [ Orçamento ]
--------------------------------------------------------------------------------------------------
}

{
Rotina............: FormCreate, InsereBaixoCima, InsereCimaBaixo, CmeCadastroConfirma, FormClose, VerificaPreenchimento
N. Sol.............: 122623
N. Kintana......: 603580
Data...............: 13/11/2009
Responsável...: Ricardo Alves
Descrição........: Criação e tratamento dos campos patrocinadora financeiro e
  plano previdenciário financeiro.
}

// Rotina    : Divs
// Data      : 06/06/2006
// Autor     : Alex Pereira
// Descrição : inserir os campos IDPATRO e PLACONTAPASS
// Pendência : 22515
// -----------------------------------------------------------------------------
(*
Atualização:
 André Tavares - pendência 15381 - 27/05/2004 - adaptação das queries para
 exibir o código externo do Centro de custo e filtrar pelo IDPLANCENTCUST
*)

// Rotina    : Query do componente SqlTipoDesemb
// Data      : 01/09/2003
// Autor     : David Ayrolla
// Descrição : Filtragem dos tipos de desembolso pelo campo ATIVO
// Pendência : 14458
// -----------------------------------------------------------------------------
// Rotinas   : FormClose, CmeCadastroConfirma
// Data      : 01/09/2003
// Autor     : André Tavares
// Descrição : Correção de erro ocorrido quando a janela era fechada.
// -----------------------------------------------------------------------------


unit FTrdxCCxContaMT;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, wwQuery,
   TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, CMProcuraMask,
   Grids, Wwdbigrd, Wwdbgrid, CMProcura, wwdblook, CMDBLookupCombo,
   CmEventosCadastro, ImgList, FCadastroMT, DBClient, uCMClientDataSet,
   uCtrlTipordxccxconta, uCtrlPrograma, uCmSqlParams, uCMTypes,
   CMDatabase, uVerificaPreenchimento, uCtrlPlanPrevContabil,
   fGrupoConta, DBGrids, DBCtrls;

type
   TFrmTrdxCCxContaMT = class(TFrmCadastroMT)
      CmpCContabil: TCMProcuraMaskContabil;
      CmpTrd: TCMProcuraMask;
      CmpCentCusto: TCMProcuraMask;
      MsTipoDesemb: TMontaSelect;
      MsCentCusto: TMontaSelect;
      DsSel: TwwDataSource;
      PnlCCusto: TPanel;
      PnlTitTipoAgreAssoc: TPanel;
      GrdSel: TwwDBGrid;
      Panel2: TPanel;
      BtnSel: TSpeedButton;
      BtnSelAll: TSpeedButton;
      BtnDel: TSpeedButton;
      BtnDelAll: TSpeedButton;
      GrdAll: TwwDBGrid;
      Panel3: TPanel;
      DsAll: TwwDataSource;
      GroupBox1: TGroupBox;
      CmbPrgAssistencial: TCMDBLookupCombo;
      CdsCentCusto: TCMClientDataSet;
      CdsPrograma: TCMClientDataSet;
      CdsAll: TCMClientDataSet;
      CdsValida: TCMClientDataSet;
      CdsTipoDesemb: TCMClientDataSet;
      CdsSel: TCMClientDataSet;
      SqlTipoDesemb: TCMSqlParams;
      SqlCentCusto: TCMSqlParams;
    CdsCentCustoCODCENTROCUSTO: TStringField;
    CdsCentCustoNOME: TStringField;
    CdsCentCustoSTATUSGRUPOCDC: TStringField;
    CdsCentCustoCODEXTERNO: TStringField;
    CmpCContabilPass: TCMProcuraMaskContabil;
    CdsPlanoPrev: TCMClientDataSet;
    GroupBox2: TGroupBox;
    cmbPlano: TCMDBLookupCombo;
    sqlParamCap: TCMSqlParams;
    cdsparamcap: TCMClientDataSet;
    bvPrograma: TBevel;
    Bevel1: TBevel;
    MsGrupo: TMontaSelect;
    gbGrupoConta: TGroupBox;
    cmpGrupoConta: TCMProcura;
    DBT: TDBText;

      procedure FormCreate(Sender: TObject);
      procedure CmpCContabilExit(Sender: TObject);
      procedure CmpCContabilApertouBotao(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure BtnSelClick(Sender: TObject);
      procedure BtnDelClick(Sender: TObject);
      procedure GrdSelCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure GrdAllCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure CmeCadastroCancel(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroFind(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CdsSelBeforePost(DataSet: TDataSet);
      procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
      procedure BtnSelAllClick(Sender: TObject);
      procedure BtnDelAllClick(Sender: TObject);
      procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmpCContabilPassApertouBotao(Sender: TObject);
    procedure CmpCContabilPassExit(Sender: TObject);
    procedure cmpGrupoContaValidaDados(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);

   private  // Private declarations

      CtrlTipordxccxconta: TCtrlTipordxccxconta;
      CtrlPrograma: TCtrlPrograma;

      // Ricardo A. SOL 122623 KTN 603580
      // Alex 22515 - inserir IDPATRO e PLACONTAPASS
//      CtrlPatro   : TCtrlPatro;
      CtrlPlanoPrev: TCtrlPlanPrevContabil;

      function  VerificaPreenchimento: Boolean;  // verifica programa e patro

      Function VerificaDuplicado: Boolean;
      procedure InsereBaixoCima;
      procedure InsereCimaBaixo;

   public   // Public declarations

   end;



var
  FrmTrdxCCxContaMT: TFrmTrdxCCxContaMT;



Implementation
{$R *.DFM}
uses
   uCtrlParamIntegra, uSistema, uDatabase, uMensErro, uFuncaoGeral, DBaseDados,
   fCadTipoDesembMT, uString, uFormManager;



procedure TFrmTrdxCCxContaMT.CmeCadastroInsert(Sender: TObject);
var
  FrmTDesemb: TForm;
begin
  inherited;
  cds.fieldbyname('RECPAG').AsString := ParamIntegra.RecPag;
  cds.fieldbyname('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  cds.fieldbyname('PLANO').AsFloat := ParamIntegra.Plano;
  cds.fieldbyname('IDEMPRESA').AsFloat := Sistema.IdEmpresa;
 
  FrmTDesemb := AcharInstanciaForm(TfrmCadTipoDesembMT);

  if (not (FrmTDesemb = Nil)) and
    (TfrmCadTipoDesembMT(FrmTDesemb).CodTipRecDes <> '') and
    (TfrmCadTipoDesembMT(FrmTDesemb).ObrigaTrdxCCxConta) then
  begin
    cds.fieldbyname('CODTIPRECDES').AsString := TfrmCadTipoDesembMT(FrmTDesemb).CodTipRecDes;
    if CmpTrd.CanFocus then CmpTrd.SetFocus;
    if CmpCentCusto.CanFocus then CmpCentCusto.SetFocus;
  end
  else
   if CmpTrd.CanFocus then CmpTrd.SetFocus;
end;



procedure TFrmTrdxCCxContaMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if CmpTrd.CanFocus then
    CmpTrd.SetFocus;
end;

procedure TFrmTrdxCCxContaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    cds.data := CtrlTipordxccxconta.ListTipordxccxconta(StrToFloat(MontaSelect.ValoresChave[0]), 0,
      StrTointDef(MontaSelect.ValoresChave[1], 0));
end;

procedure TFrmTrdxCCxContaMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  if (not PnlCCusto.Visible) then
    Accept := (CmpTrd.Valida = VcOk) and
      (CmpCentCusto.Valida = VcOk) and
      (CmpCContabil.Valida = VcOk) and
      // Alex 22515 - inserir IDPATRO e PLACONTAPASS
      (CmpCContabilPass.Valida = VcOk) and
      (VerificaPreenchimento) and
      VerificaDuplicado
  else
    Accept := True;
end;



Function TFrmTrdxCCxContaMT.VerificaDuplicado: Boolean;
var
  vprog, vPlano: integer;
begin
  if Trim(CmbPrgAssistencial.Text) = '' then
    vprog := 0
  else
    vprog := strtoint(CmbPrgAssistencial.LookupValue);
  //catia
  if Trim(cmbPlano.Text) = '' then
   vPlano := 0
  else
    vPlano:= strtoint(cmbPlano.LookupValue);
                                                   
  CdsValida.Data := CtrlTipordxccxconta.ListTipordxccxconta1(0,
                                                             ParamIntegra.plano,
                                                             vprog,
                                                             Sistema.IdEmpresa,
                                                             Sistema.IdEmpresa,
                                                             vPlano,
                                                             ParamIntegra.RecPag,
                                                             cds.fieldbyname( 'CODTIPRECDES'   ).AsString, //08//08/2006 - andre tavares - coloquei este parâmetro, pois estava dando como duplicado mesmo com o tiporecebdesemb diferente do anterior
                                                             cds.fieldbyname( 'CODCENTROCUSTO' ).AsString,
                                                             cds.fieldbyname( 'IDGRUPOORCAMEN' ).AsFloat//VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
                                                             );



                                         
  Result := (CdsValida.IsEmpty Or
            (CdsValida.fieldbyname('IDTIPORDXCCXCONTA').AsFloat = cds.fieldbyname('IDTIPORDXCCXCONTA').AsFloat));

   if not Result then
   begin
      MsgDlg('Este relacionamento já foi cadastrado.', 'Erro', mtError, [mbOk], 0);
      Repaint;
      if CmpTrd.Canfocus then CmpTrd.SetFocus;
   end;
end;



procedure TFrmTrdxCCxContaMT.FormCreate(Sender: TObject);
var
  smascara, sPlanoCentroCusto: String;

begin
   inherited;

   CtrlTipordxccxconta := TCtrlTipordxccxconta.create;
   CtrlTipordxccxconta.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
   CtrlTipordxccxconta.cds := cds;
   CtrlPrograma := TCtrlPrograma.Create;
   CtrlPrograma.Initialize(DtmBaseDados.dbBaseDados, false, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

   cds.Data := CtrlTipordxccxconta.ListTipordxccxconta1(-1);

   CdsPrograma.data := CtrlPrograma.ListaPrograma;

   // Ricardo A. SOL 122623 KTN 603580
   // Alex 22515 - inserir IDPATRO e PLACONTAPASS
//   CtrlPatro := TCtrlPatro.Create;
//   CtrlPatro.Initialize(DtmBaseDados.dbBaseDados, false, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
//   CdsPatro.Data := CtrlPatro.ListaPatroParaOrcamento;
   CtrlPlanoPrev := TCtrlPlanPrevContabil.Create;
   CtrlPlanoPrev.Initialize(DtmBaseDados.dbBaseDados, false, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
   CdsPlanoPrev.Data := CtrlPlanoPrev.ListaPlanPrevContabil( 0, 0, False );

   SqlParamCap.Prepare;
   sqlParamCap.ParamByName('RECPAG').Asstring := ParamIntegra.RECPAG;
   SqlParamCap.Open;
   CmpCentCusto.PermiteChaveEmBranco := not (CdsParamCap.FieldByName('FLGPCPCCUSTO').AsString = 'S');
   CmpCContabil.PermiteChaveEmBranco := not (CdsParamCap.FieldByName('FLGPCPCONTA').AsString = 'S');
   CmpCContabilPass.PermiteChaveEmBranco := not (CdsParamCap.FieldByName('FLGPCPCONTAPASS').AsString = 'S');
   // fim Alex 22515 - inserir IDPATRO e PLACONTAPASS

   SqlTipoDesemb.Prepare;
   SqlTipoDesemb.ParamByName('RECPAG').asstring := ParamIntegra.RECPAG;
   SqlTipoDesemb.ParamByName('IDPESSOA').asinteger := sistema.IdEmpresa;

   SqlCentCusto.Prepare;
   SqlCentCusto.ParamByName('IDEMPRESA').asinteger := sistema.IdEmpresa;

   CmpCContabil.Plano   := ParamIntegra.Plano;
   CmpCContabil.Mascara := ParamIntegra.MascaraPlano;
   // Alex 22515 - inserir IDPATRO e PLACONTAPASS
   CmpCContabilPass.Plano   := ParamIntegra.Plano;
   CmpCContabilPass.Mascara := ParamIntegra.MascaraPlano;
   // fim Alex 22515 - inserir IDPATRO e PLACONTAPASS
   CmpCentCusto.Mascara := ParamIntegra.MascaraCC;

   if ParamIntegra.RecPag = 'R' then
   begin
      // Alex 22515 - inserir IDPATRO e PLACONTAPASS
      CmpCContabil.Caption := 'Conta Contábil a Crédito';
      CmpCContabil.Mensagens.Analitica := 'Conta Contábil a Crédito não pode ser analítica';
      CmpCContabil.Mensagens.EmBranco  := 'Conta Contábil a Crédito não pode estar em branco';
      CmpCContabil.Mensagens.NaoExiste := 'Conta Contábil a Crédito não existe';
      CmpCContabil.Mensagens.Sintetica := 'Conta Contábil a Crédito não pode ser sintética';

      CmpCContabilPass.Caption := 'Conta Contábil a Débito';
      CmpCContabilPass.Mensagens.Analitica := 'Conta Contábil a Débito não pode ser analítica';
      CmpCContabilPass.Mensagens.EmBranco  := 'Conta Contábil a Débito não pode estar em branco';
      CmpCContabilPass.Mensagens.NaoExiste := 'Conta Contábil a Débito não existe';
      CmpCContabilPass.Mensagens.Sintetica := 'Conta Contábil a Débito não pode ser sintética';
      // fim Alex 22515 - inserir IDPATRO e PLACONTAPASS

      smascara                := ParamIntegra.MascaraReceb;
      HelpContext             := 40078;
      bbtnAjuda.HelpContext   := 40078;
   end
   else
   begin
      // Alex 22515 - inserir IDPATRO e PLACONTAPASS
      // Alex 22515 - inserir IDPATRO e PLACONTAPASS
      CmpCContabil.Caption := 'Conta Contábil a Débito';
      CmpCContabil.Mensagens.Analitica := 'Conta Contábil a Débito não pode ser analítica';
      CmpCContabil.Mensagens.EmBranco  := 'Conta Contábil a Débito não pode estar em branco';
      CmpCContabil.Mensagens.NaoExiste := 'Conta Contábil a Débito não existe';
      CmpCContabil.Mensagens.Sintetica := 'Conta Contábil a Débito não pode ser sintética';

      CmpCContabilPass.Caption := 'Conta Contábil a Crédito';
      CmpCContabilPass.Mensagens.Analitica := 'Conta Contábil a Crédito não pode ser analítica';
      CmpCContabilPass.Mensagens.EmBranco  := 'Conta Contábil a Crédito não pode estar em branco';
      CmpCContabilPass.Mensagens.NaoExiste := 'Conta Contábil a Crédito não existe';
      CmpCContabilPass.Mensagens.Sintetica := 'Conta Contábil a Crédito não pode ser sintética';
      // fim Alex 22515 - inserir IDPATRO e PLACONTAPASS

      smascara                := ParamIntegra.MascaraDesemb;
// Daniel Simões - 25/01/2006 - Início------------------------------------------
      HelpContext             := 30058;
      bbtnAjuda.HelpContext   := 30058;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------
   end;

  CmpTrd.Mascara := sMascara;
  MontaSelect.Filtro.Add('TIPORDXCCXCONTA.PLANO       = ' + IntToStr(ParamIntegra.Plano));
  MontaSelect.Filtro.Add('TIPORDXCCXCONTA.RECPAG      = ''' + ParamIntegra.RecPag + '''');
  MontaSelect.Filtro.Add('TIPORDXCCXCONTA.IDEMPRESA   = ' + IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add('TIPORDXCCXCONTA.IDPESSOA    = ' + IntToStr(Sistema.IdEmpresa));
  MsTipoDesemb.Filtro.Add('TIPORECEBDESEMB.RECPAG     = ''' + ParamIntegra.RecPag + '''');
  MsTipoDesemb.Filtro.Add('TIPORECEBDESEMB.IDPESSOA   = ' + IntToStr(Sistema.IdEmpresa));
  MsCentCusto.Filtro.Add('CENTCUST.IDEMPRESA          = ' + IntToStr(Sistema.IdEmpresa));
// inicio - andre tavares - pendência 15381 - 27/05/2004
  sPlanoCentroCusto := intToStr(paramintegra.PlanoCentroCusto);
  if trim(sPlanoCentroCusto) = '' then
    sPlanoCentroCusto := '-1';
  MsCentCusto.Filtro.Add('CENTCUST.IDPLANCENTCUST = (SELECT IDPLANCENTCUST FROM PARAMGLOBAL WHERE IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + ')');

  CmpCentCusto.LookupSql.Text :=  ' SELECT CODCENTROCUSTO, NOME, STATUSGRUPOCDC, CODEXTERNO FROM CENTCUST WHERE IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) +
  ' AND IDPLANCENTCUST = '+ sPlanoCentroCusto;

// fim    - andre tavares - pendência 15381 - 27/05/2004


   if (ParamIntegra.RecPag = 'P') then
      CmpTrd.Caption := 'Tipo De Desembolso'
   else
      CmpTrd.Caption := 'Tipo De Recebimento';

   MontaSelect.Descricao[0]   := CmpTrd.Caption;
   MontaSelect.Descricao[1]   := 'Desc. ' + CmpTrd.Caption;
   CmpTrd.Mensagens.EmBranco  := CmpTrd.Caption + ' não pode estar em branco';
   CmpTrd.Mensagens.Analitica := CmpTrd.Caption + ' não pode ser analítico';
   CmpTrd.Mensagens.NaoExiste := CmpTrd.Caption + ' não existe';
   CmpTrd.Mensagens.Sintetica := CmpTrd.Caption + ' não pode ser sintético ';
end;


procedure TFrmTrdxCCxContaMT.CmpCContabilExit(Sender: TObject);
begin
  inherited;
  CmpCContabil.AceitaTipoConta := SoAnalitica;
end;



procedure TFrmTrdxCCxContaMT.CmpCContabilApertouBotao(Sender: TObject);
begin
  inherited;
  CmpCContabil.AceitaTipoConta := Indiferente;
end;



procedure TFrmTrdxCCxContaMT.FormActivate(Sender: TObject);
var
  FrmTDesemb: TForm;
begin
  inherited;
  FrmTDesemb := AcharInstanciaForm(TfrmCadTipoDesembMT);
  if (not (FrmTDesemb = Nil)) and
    (TfrmCadTipoDesembMT(FrmTDesemb).CodTipRecDes <> '') and
    (TfrmCadTipoDesembMT(FrmTDesemb).ObrigaTrdxCCxConta) then
    sbtnInserir.Click;
end;



procedure TFrmTrdxCCxContaMT.BtnSelClick(Sender: TObject);
var
  sCodigoAnalitico: String;
begin
  inherited;
  if not CdsALL.IsEmpty then
  begin
    if CdsAll.fieldbyname('STATUSGRUPOCDC').AsString = 'S' then
    begin
      sCodigoAnalitico := Trim(CdsAll.fieldbyname('CODCENTROCUSTO').AsString);
      while Pos(sCodigoAnalitico, Trim(CdsAll.fieldbyname('CODCENTROCUSTO').AsString)) = 1 do
      begin
        InsereBaixoCima;
      end;
    end
    else
      InsereBaixoCima;
  end;
end;



procedure TFrmTrdxCCxContaMT.InsereBaixoCima;
begin
  CdsSel.Append;
  CdsSel.Fieldbyname('RECPAG').asString := ParamIntegra.RecPag;
  CdsSel.Fieldbyname('PLANO').asfloat := Cds.Fieldbyname('PLANO').asfloat;
  CdsSel.Fieldbyname('PLACONTA').asString := Cds.Fieldbyname('PLACONTA').asString;
  if Trim(CmbPrgAssistencial.Text) <> '' then
    CdsSel.Fieldbyname('IDPROGRAMA').asfloat := strtoint(CmbPrgAssistencial.LookupValue);
//catia
   // Ricardo A. SOL 122623 KTN 603580
   if Trim(cmbPlano.Text) <> '' then
  CdsSel.Fieldbyname('IDPLANOPREV').asfloat := strtoint(cmbPlano.LookupValue);


  CdsSel.Fieldbyname('IDPESSOA').asfloat := Sistema.IdEmpresa;
  CdsSel.Fieldbyname('IDEMPRESA').asfloat := Sistema.IdEmpresa;
  CdsSel.Fieldbyname('CODTIPRECDES').asString := cds.Fieldbyname('CODTIPRECDES').AsString;
  CdsSel.Fieldbyname('CODCENTROCUSTO').asString := cdsAll.Fieldbyname('CODCENTROCUSTO').AsString;
  // ANDRE TAVARES - pendência 15381 - 02/06/2004
  CdsSel.Fieldbyname('CODEXTERNO').asString := cdsAll.Fieldbyname('CODEXTERNO').AsString;
  CdsSel.Fieldbyname('STATUSGRUPOCDC').asString := cdsAll.Fieldbyname('STATUSGRUPOCDC').AsString;
  CdsSel.Fieldbyname('NOME').asString := cdsAll.Fieldbyname('NOME').AsString;

  // Alex 05/06/2006 22515
  CdsSel.Fieldbyname('PLACONTAPASS').asString := Cds.Fieldbyname('PLACONTAPASS').asString;
  // Ricardo A. SOL 122623 KTN 603580
  if Trim(cmbPlano.Text) <> '' then
    CdsSel.Fieldbyname('IDPLANOPREV').asfloat := strtoint(cmbPlano.LookupValue);
  // FIM Alex 05/06/2006 22515

  CdsSel.post;
  CdsAll.delete;
end;



procedure TFrmTrdxCCxContaMT.BtnDelClick(Sender: TObject);
var
  sCodigoAnalitico: String;
begin
  inherited;
  if not CdsSel.IsEmpty then
  begin
    if CdsSel.fieldbyname('STATUSGRUPOCDC').AsString = 'S' then
    begin
      sCodigoAnalitico := Trim(CdsSel.fieldbyname('CODCENTROCUSTO').AsString);
      while Pos(sCodigoAnalitico, Trim(CdsSel.fieldbyname('CODCENTROCUSTO').AsString)) = 1 do
      begin
        InsereCimaBaixo;
      end;
    end
    else
      InsereCimaBaixo;
  end;
end;



procedure TFrmTrdxCCxContaMT.InsereCimaBaixo;
begin
  CdsAll.Append;

  CdsAll.Fieldbyname('RECPAG').asString         := CdsSel.Fieldbyname('RECPAG').asString;
  CdsAll.Fieldbyname('PLANO').asfloat           := CdsSel.Fieldbyname('PLANO').asfloat;
  CdsAll.Fieldbyname('PLACONTA').asString       := CdsSel.Fieldbyname('PLACONTA').asString;

  if Trim(CmbPrgAssistencial.Text) <> '' then CdsAll.Fieldbyname('IDPROGRAMA').asfloat := strtoint(CmbPrgAssistencial.LookupValue);
  //catia
  // Ricardo A. SOL 122623 KTN 603580
  if Trim(cmbPlano.Text) <> '' then CdsAll.Fieldbyname('IDPLANOPREV').asfloat := strtoint(cmbPlano.LookupValue);

  CdsAll.Fieldbyname('IDPESSOA').asfloat        := CdsSel.Fieldbyname('IDPESSOA').asfloat;
  CdsAll.Fieldbyname('IDEMPRESA').asfloat       := CdsSel.Fieldbyname('IDEMPRESA').asfloat;
  CdsAll.Fieldbyname('CODTIPRECDES').asString   := CdsSel.Fieldbyname('CODTIPRECDES').asString;
  CdsAll.Fieldbyname('CODCENTROCUSTO').asString := CdsSel.Fieldbyname('CODCENTROCUSTO').asString;
  // ANDRE TAVARES - pendência 15381 - 02/06/2004
  cdsAll.Fieldbyname('CODEXTERNO').AsString     := CdsSel.Fieldbyname('CODEXTERNO').asString;

  CdsAll.Fieldbyname('STATUSGRUPOCDC').asString := CdsSel.Fieldbyname('STATUSGRUPOCDC').asString;
  CdsAll.Fieldbyname('NOME').asString           := CdsSel.Fieldbyname('NOME').asString;

  // Alex 05/06/2006 22515
  CdsAll.Fieldbyname('PLACONTAPASS').asString := CdsSel.Fieldbyname('PLACONTAPASS').asString;

  // Ricardo A. SOL 122623 KTN 603580
  if Trim(cmbPlano.Text) <> '' then
    CdsAll.Fieldbyname('IDPLANOPREV').asfloat := strtoint(cmbPlano.LookupValue);
  // FIM Alex 05/06/2006 22515


  CdsAll.post;
  CdsSel.delete;
end;



procedure TFrmTrdxCCxContaMT.GrdSelCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if CdsSel.FieldByName('STATUSGRUPOCDC').AsString = 'S' then
  begin
    ABrush.Color := $00C4FFFF;
    AFont.Color := ClBlue;
  end;
end;



procedure TFrmTrdxCCxContaMT.GrdAllCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if CdsAll.FieldByName('STATUSGRUPOCDC').AsString = 'S' then
  begin
    ABrush.Color := $00C4FFFF;
    AFont.Color := ClBlue;
  end;
end;



procedure TFrmTrdxCCxContaMT.CmeCadastroCancel(Sender: TObject);
begin
  if not PnlCCusto.Visible then
    inherited
  else
    PnlCCusto.Visible := False;
end;



procedure TFrmTrdxCCxContaMT.CmeCadastroConfirma(Sender: TObject);
var
  sOldCodTipRecDes, sOldPlaconta, sOldRecPag: String;
  // Alex 05/06/2006 22515
  sOldPlacontaPass: string;

  // Ricardo A. SOL 122623 KTN 603580
  iOldPlanoPrev: LongInt;
  // fim Alex 05/06/2006 22515

  iOdlIdPessoa, iOldPlano, iOldIdEmpresa, iOldPrograma: LongInt;
  bRelacionaCC: Boolean;
begin
 if not PnlCCusto.Visible then
  begin
    if CmeCadastro.Operacao In [OpInserir, OpAlterar] then
    begin
      sOldCodTipRecDes := cds.fieldbyname('CODTIPRECDES').AsString;
      sOldPlaconta := cds.fieldbyname('PLACONTA').AsString;
      sOldRecPag := cds.fieldbyname('RECPAG').AsString;
      iOdlIdPessoa := cds.fieldbyname('IDPESSOA').AsInteger;
      iOldPlano := cds.fieldbyname('PLANO').AsInteger;
      iOldIdEmpresa := cds.fieldbyname('IDEMPRESA').AsInteger;
      if (CmbPrgAssistencial.Text = '') then
        iOldPrograma := 0
      else
        iOldPrograma := StrToInt(CmbPrgAssistencial.LookupValue);
      // Alex 05/06/2006 22515
      sOldPlacontaPass := cds.fieldbyname('PLACONTAPASS').AsString;

    // Ricardo A. SOL 122623 KTN 603580
      if (cmbPlano.Text = '') then
        iOldPlanoPrev := cds.fieldbyname('IDPLANOPREV').AsInteger
      else
        iOldPlanoPrev := 0;
      // fim Alex 05/06/2006 22515

      bRelacionaCC := True;
    end
    else
    begin
      sOldCodTipRecDes := '';
      sOldPlaconta := '';
      sOldRecPag := '';
      iOdlIdPessoa := 0;
      iOldPlano := 0;
      iOldIdEmpresa := 0;
      iOldPrograma := 0;
      // Alex 05/06/2006 22515
      sOldPlacontaPass := '';

      // Ricardo A. SOL 122623 KTN 603580
      iOldPlanoPrev := 0;

      // fim Alex 05/06/2006 22515
      bRelacionaCC := False;
    end;

   inherited;

    if bRelacionaCC and
      (MsgDlg('Deseja replicar o relacionamento para outros Centros de Custos ?', 'Confirmar', mtConfirmation, [mbYes, mbNo], 0) = mryes)
        then
    begin
      FrmTrdxCCxContaMT.PnlCCusto.Visible := True;
      FrmTrdxCCxContaMT.PnlCCusto.bringtofront;



      CdsSel.Data := CtrlTipordxccxconta.ListTipordxccxcontaCCustoAsso(sOldRecPag, iOdlIdPessoa,
        sOldCodTipRecDes, iOldPlano, sOldPlaconta, iOldPrograma,
        // Alex 05/06/2006 22515
        // Ricardo A. SOL 122623 KTN 603580
        sOldPlacontaPass, iOldPlanoPrev);

      CdsAll.Data := CtrlTipordxccxconta.ListTipordxccxcontaCCustoNaoAsso(sOldRecPag, iOdlIdPessoa,
        sOldCodTipRecDes, iOldPlano, sOldPlaconta, iOldPrograma, iOldIdEmpresa,
        // Alex 05/06/2006 22515
        // Ricardo A. SOL 122623 KTN 603580
        sOldPlacontaPass, iOldPlanoPrev);

      { André Tavares - 01/09/2003
        Correção de erro ocorrido quando a janela era fechada. }
       while PnlCCusto.Visible do Application.ProcessMessages;

    end
  end
  else
  begin
    CtrlTipordxccxconta.AplicaAlteracoes(CdsSel.data);
    PnlCCusto.Visible := False;
  end;
end;



procedure TFrmTrdxCCxContaMT.CdsSelBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CdsSel.FieldByName('IDPROGRAMA').AsInteger = 0 then
    CdsSel.FieldByName('IDPROGRAMA').Clear;
end;



procedure TFrmTrdxCCxContaMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTipordxccxconta.GravarTipordxccxconta;
end;


                                                          
procedure TFrmTrdxCCxContaMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  if not PnlCCusto.Visible then Accept := CtrlTipordxccxconta.GravarTipordxccxconta;
end;



procedure TFrmTrdxCCxContaMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  if not PnlCCusto.Visible then Accept := CtrlTipordxccxconta.GravarTipordxccxconta;
end;



procedure TFrmTrdxCCxContaMT.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;

   if CtrlTipordxccxconta.MessageInfo <> '' then
   begin
      MsgDlg(CtrlTipordxccxconta.MessageInfo, 'Erro', mtError, [mbOK], 0);
      Repaint;
   end;
end;



procedure TFrmTrdxCCxContaMT.BtnSelAllClick(Sender: TObject);
begin
   inherited;

   if not CdsAll.IsEmpty then
   begin
     CdsAll.First;
     while not CdsAll.Eof do BtnSel.Click;
   end;
end;



procedure TFrmTrdxCCxContaMT.BtnDelAllClick(Sender: TObject);
begin
   inherited;

   if not CdsSel.IsEmpty then
   begin
     CdsSel.First;
     while not CdsSel.Eof do BtnDel.Click;
   end;
end;



procedure TFrmTrdxCCxContaMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  bbtnCancelarClick(self);
end;



procedure TFrmTrdxCCxContaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  { André Tavares - 01/09/2003
    Correção de erro ocorrido quando a janela era fechada. }

   // Ricardo A. SOL 122623 KTN 603580
   CtrlPlanoPrev.Free;

  CtrlTipordxccxconta.Free;
  CtrlPrograma.Free;

  inherited;
end;

procedure TFrmTrdxCCxContaMT.CmpCContabilPassApertouBotao(Sender: TObject);
begin
  inherited;
  // Alex 22515 - inserir IDPATRO e PLACONTAPASS
  CmpCContabilPass.AceitaTipoConta := Indiferente;
end;

procedure TFrmTrdxCCxContaMT.CmpCContabilPassExit(Sender: TObject);
begin
  inherited;
  // Alex 22515 - inserir IDPATRO e PLACONTAPASS
  CmpCContabilPass.AceitaTipoConta := SoAnalitica;
end;

function TFrmTrdxCCxContaMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
    if (CmbPrgAssistencial.Text = '') and (CdsParamCap.FieldByName('FLGPCPPRG').Asstring = 'S') then
      raise EValidacao.CreateVal('O campo Programa é obrigatório!', CmbPrgAssistencial);

    // Ricardo A. SOL 122623 KTN 603580 -- IMPORTANTE VERIFICAR A NECESSIDADE DA MESMA REGRA PARA O PLANO PREVIDENCIÁRIO
//    if (cmbPlano.Text = '') and (CdsParamCap.FieldByName('FLGPCPPATRO').Asstring = 'S') then
//      raise EValidacao.CreateVal('O Campo Patrocinadora é obrigatório!', CmbPatro);

    //VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
    if (cmpGrupoConta.Text = '') and (CdsTipoDesemb.FieldByName('FLGOBRIGARESERVA').Asstring = 'S') then
       raise EValidacao.CreateVal('Necessário definição de grupo de conta!', cmpGrupoConta);

  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;

end;

procedure TFrmTrdxCCxContaMT.cmpGrupoContaValidaDados(Sender: TObject);
begin
  inherited;

  //INICIO - VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
  cds.FieldByName('DESCGRUPOCONTA').Clear;
  if MsGrupo.RetornouValor then
     cds.FieldByName('DESCGRUPOCONTA').asString := MsGrupo.ValoresChave[2]+#13+MsGrupo.ValoresChave[3];
  //FIM    - VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662

end;

procedure TFrmTrdxCCxContaMT.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  //INICIO - VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
  if (Field <> NIL)                                   AND
     (CmeCadastro.Operacao In [OpInserir, OpAlterar]) AND
     (Field.FieldName = cmpGrupoConta.DataField)      AND
     (Trim(Field.AsString) = '')                      Then
     cds.FieldByName('DESCGRUPOCONTA').Clear;
  //FIM    - VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662     

end;

end.

