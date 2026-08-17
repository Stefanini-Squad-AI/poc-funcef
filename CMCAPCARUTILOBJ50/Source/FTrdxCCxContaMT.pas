// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
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
   uCtrlTipordxccxconta, uCtrlPrograma, uCmSqlParams, uCMTypes;

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

   private  // Private declarations

      CtrlTipordxccxconta: TCtrlTipordxccxconta;
      CtrlPrograma: TCtrlPrograma;

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
      VerificaDuplicado
  else
    Accept := True;
end;



Function TFrmTrdxCCxContaMT.VerificaDuplicado: Boolean;
var
  vprog: integer;
begin
  if Trim(CmbPrgAssistencial.Text) = '' then
    vprog := 0
  else
    vprog := strtoint(CmbPrgAssistencial.LookupValue);

  CdsValida.Data := CtrlTipordxccxconta.ListTipordxccxconta(0,
                                                            0,
                                                            vprog,
                                                            Sistema.IdEmpresa,
                                                            Sistema.IdEmpresa,
                                                            ParamIntegra.RecPag,
                                                            '',
                                                            cds.fieldbyname('CODTIPRECDES').AsString,
                                                            cds.fieldbyname('CODCENTROCUSTO').AsString);

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

   cds.Data := CtrlTipordxccxconta.ListTipordxccxconta(-1);

   CdsPrograma.data := CtrlPrograma.ListaPrograma;

   SqlTipoDesemb.Prepare;
   SqlTipoDesemb.ParamByName('RECPAG').asstring := ParamIntegra.RECPAG;
   SqlTipoDesemb.ParamByName('IDPESSOA').asinteger := sistema.IdEmpresa;
   //  SqlTipoDesemb.open;

   SqlCentCusto.Prepare;
   SqlCentCusto.ParamByName('IDEMPRESA').asinteger := sistema.IdEmpresa;
   //  SqlCentCusto.open;

   CmpCContabil.Plano   := ParamIntegra.Plano;
   CmpCContabil.Mascara := ParamIntegra.MascaraPlano;
   CmpCentCusto.Mascara := ParamIntegra.MascaraCC;

   if ParamIntegra.RecPag = 'R' then
   begin
      smascara                := ParamIntegra.MascaraReceb;
      // OBS.: Não mexi no Help Context do Contas a Receber...
      HelpContext             := 40078;
      bbtnAjuda.HelpContext   := 40078;
   end
   else
   begin
      smascara                := ParamIntegra.MascaraDesemb;
// Daniel Simões - 25/01/2006 - Início------------------------------------------
      HelpContext             := 30058; //30070;
      bbtnAjuda.HelpContext   := 30058; //30070;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------
   end;

  CmpTrd.Mascara := sMascara;
  //
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
   Caption                    := CmpTrd.Caption + ' X Centro de Custo X Conta Contábil';
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
  CdsSel.Fieldbyname('IDPESSOA').asfloat := Sistema.IdEmpresa;
  CdsSel.Fieldbyname('IDEMPRESA').asfloat := Sistema.IdEmpresa;
  CdsSel.Fieldbyname('CODTIPRECDES').asString := cds.Fieldbyname('CODTIPRECDES').AsString;
  CdsSel.Fieldbyname('CODCENTROCUSTO').asString := cdsAll.Fieldbyname('CODCENTROCUSTO').AsString;
  // ANDRE TAVARES - pendência 15381 - 02/06/2004
  CdsSel.Fieldbyname('CODEXTERNO').asString := cdsAll.Fieldbyname('CODEXTERNO').AsString;
  CdsSel.Fieldbyname('STATUSGRUPOCDC').asString := cdsAll.Fieldbyname('STATUSGRUPOCDC').AsString;
  CdsSel.Fieldbyname('NOME').asString := cdsAll.Fieldbyname('NOME').AsString;
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

  CdsAll.Fieldbyname('IDPESSOA').asfloat        := CdsSel.Fieldbyname('IDPESSOA').asfloat;
  CdsAll.Fieldbyname('IDEMPRESA').asfloat       := CdsSel.Fieldbyname('IDEMPRESA').asfloat;
  CdsAll.Fieldbyname('CODTIPRECDES').asString   := CdsSel.Fieldbyname('CODTIPRECDES').asString;
  CdsAll.Fieldbyname('CODCENTROCUSTO').asString := CdsSel.Fieldbyname('CODCENTROCUSTO').asString;
  // ANDRE TAVARES - pendência 15381 - 02/06/2004
  cdsAll.Fieldbyname('CODEXTERNO').AsString     := CdsSel.Fieldbyname('CODEXTERNO').asString;
  
  CdsAll.Fieldbyname('STATUSGRUPOCDC').asString := CdsSel.Fieldbyname('STATUSGRUPOCDC').asString;
  CdsAll.Fieldbyname('NOME').asString           := CdsSel.Fieldbyname('NOME').asString;

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
      bRelacionaCC := False;
    end;

   inherited;

    if bRelacionaCC and
      (MsgDlg('Deseja replicar o relacionamento para outros Centros de Custo ?', 'Confirmar', mtConfirmation, [mbYes, mbNo], 0) = mryes)
        then
    begin
      FrmTrdxCCxContaMT.PnlCCusto.Visible := True;
      FrmTrdxCCxContaMT.PnlCCusto.bringtofront;



      CdsSel.Data := CtrlTipordxccxconta.ListTipordxccxcontaCCustoAsso(sOldRecPag, iOdlIdPessoa,
        sOldCodTipRecDes, iOldPlano, sOldPlaconta, iOldPrograma);

      CdsAll.Data := CtrlTipordxccxconta.ListTipordxccxcontaCCustoNaoAsso(sOldRecPag, iOdlIdPessoa,
        sOldCodTipRecDes, iOldPlano, sOldPlaconta, iOldPrograma, iOldIdEmpresa);

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
  CtrlTipordxccxconta.Free;
  CtrlPrograma.Free;
  inherited;
end;

end.

