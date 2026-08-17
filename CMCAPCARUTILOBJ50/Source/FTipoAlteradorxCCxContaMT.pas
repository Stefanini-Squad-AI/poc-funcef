// Atualizado por: andre tavares - pendência 15382 - 21/10/2004
//- Mostrar o código externo de centro de custo e filtrar pelo campo idplancentcust

unit FTipoAlteradorxCCxContaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc,
  TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  CMProcuraMask, Grids, Wwdbigrd, Wwdbgrid, CMProcura, wwdblook,
  CMDBLookupCombo, CmEventosCadastro, ImgList, FCadastroMT, DBClient,
  uCMClientDataSet, uCtrlAltxccxprgxconta, uCtrlTipoalterador,
  uCmSqlParams, uCtrlPrograma, uCMTypes;

type
  TFrmTipoAlteradorxCCxContaMT = class(TFrmCadastroMT)
    CmpCContabil: TCMProcuraMaskContabil;
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
    GpbAlterador: TGroupBox;
    dblkAlterador: TwwDBLookupCombo;
    CdsValida: TCMClientDataSet;
    CdsAlt: TCMClientDataSet;
    CdsPrograma: TCMClientDataSet;
    CdsAll: TCMClientDataSet;
    CdsSel: TCMClientDataSet;
    CdsCentCusto: TCMClientDataSet;
    CdsCentCustoCODCENTROCUSTO: TStringField;
    CdsCentCustoNOME: TStringField;
    CdsCentCustoSTATUSGRUPOCDC: TStringField;
    CdsCentCustoCODEXTERNO: TStringField;
    SqlCentCusto: TCMSqlParams;
    MsCentCusto: TMontaSelect;
    CmpCentCusto: TCMProcuraMask;
    CMSqlParams1: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure CmpCContabilExit(Sender: TObject);
    procedure CmpCContabilApertouBotao(Sender: TObject);
    procedure GrdSelCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GrdAllCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure QrySelBeforePost(DataSet: TDataSet);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure BtnSelClick(Sender: TObject);
    procedure BtnSelAllClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnDelAllClick(Sender: TObject);
  private
    { Private declarations }
    CtrlAltxccxprgxconta : TCtrlAltxccxprgxconta;
    CtrlTipoAlterador    : TCtrlTipoAlterador;
    CtrlPrograma         : TCtrlPrograma;
    Function  VerificaDuplicado:Boolean;
    procedure InsereBaixoCima;
    procedure InsereCimaBaixo;
  public
    { Public declarations }
  end;

var
  FrmTipoAlteradorxCCxContaMT: TFrmTipoAlteradorxCCxContaMT;

implementation

{$R *.DFM}

Uses uCtrlParamIntegra, uSistema, uDatabase, uMensErro, DBaseDados,
     uString, uFormManager;

Procedure TFrmTipoAlteradorxCCxContaMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.fieldbyname('IDEMPRESA').AsFloat       := Sistema.IdEmpresa;
  Cds.fieldbyname('PLANO').AsFloat           := ParamIntegra.Plano;
  If dblkAlterador.CanFocus Then dblkAlterador.SetFocus;
End;

Procedure TFrmTipoAlteradorxCCxContaMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If dblkAlterador.CanFocus Then dblkAlterador.SetFocus;
End;

Procedure TFrmTipoAlteradorxCCxContaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
    cds.Data := CtrlAltxccxprgxconta.ListAltxccxprgxconta (StrToFloat(MontaSelect.ValoresChave[0]) );
End;

Procedure TFrmTipoAlteradorxCCxContaMT.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
  If (Not PnlCCusto.Visible) Then
     Accept := (dblkAlterador.Text <>  '') And
               (CmpCentCusto.Valida = VcOk) And
               (CmpCContabil.Valida = VcOk) And
               VerificaDuplicado
  Else
     Accept := True;
End;

Function TFrmTipoAlteradorxCCxContaMT.VerificaDuplicado:Boolean;
var vprog : integer;
begin
  If Trim(CmbPrgAssistencial.Text) = '' Then
     vprog := 0
  else vprog := strtoint(CmbPrgAssistencial.LookupValue);

  CdsValida.Data := CtrlAltxccxprgxconta.ListAltxccxprgxconta ( 0,
                                                      Sistema.IdEmpresa,
                                                      ParamIntegra.Plano,
                                                      Cds.fieldbyname('CODALTERADOR').asfloat,
                                                      vprog,
                                                      Trim(Cds.fieldbyname('PLACONTA').AsString),
                                                      Trim(Cds.fieldbyname('CODCENTROCUSTO').AsString));

  Result := (CdsValida.IsEmpty Or
            (CdsValida.fieldbyname('IDALTXCCXPRGXCONTA').AsFloat = Cds.fieldbyname('IDALTXCCXPRGXCONTA').AsFloat));

  If Not Result Then
  Begin
     MsgDlg('Este relacionamento já foi cadastrado.','Erro',mtError,[mbOk],0);
     If dblkAlterador.Canfocus Then dblkAlterador.SetFocus;
  End;
End;


procedure TFrmTipoAlteradorxCCxContaMT.FormCreate(Sender: TObject);
VAR sPlanoCentroCusto : string;
begin
  inherited;
  CtrlAltxccxprgxconta := TCtrlAltxccxprgxconta.create;
  CtrlTipoAlterador    := TCtrlTipoAlterador.create;
  CtrlAltxccxprgxconta.Initialize(DtmBaseDados.dbBaseDados,true,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  CtrlTipoAlterador.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlPrograma := TCtrlPrograma.create;
  CtrlPrograma.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsPrograma.data := CtrlPrograma.ListaPrograma;

  CtrlAltxccxprgxconta.cds := cds;
  cds.Data                := CtrlAltxccxprgxconta.ListAltxccxprgxconta ( -1 );
  CdsAlt.data             := CtrlTipoAlterador.ListTipoalterador( Sistema.IdEmpresa, ParamIntegra.RecPag, 0);

  SQLCentCusto.Prepare;
  SQLCentCusto.ParamByName('idempresa').asinteger := Sistema.IdEmpresa;
//  SQLCentCusto.Open;

  PnlCCusto.Align := AlClient;

  CmpCContabil.Plano   := ParamIntegra.Plano;
  CmpCContabil.Mascara := ParamIntegra.MascaraPlano;

  CmpCentCusto.Mascara := ParamIntegra.MascaraCC;

  MontaSelect.Filtro.Add('ALTXCCXPRGXCONTA.PLANO     = ' + IntToStr(ParamIntegra.Plano));
  MontaSelect.Filtro.Add('TIPOALTERADOR.RECPAG    = ''' + ParamIntegra.RecPag + '''');
  MontaSelect.Filtro.Add('ALTXCCXPRGXCONTA.IDEMPRESA  = ' + IntToStr(Sistema.IdEmpresa));

  MsCentCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

// inicio - andre tavares - pendência 15382 - 21/10/2004
  sPlanoCentroCusto := intToStr(paramintegra.PlanoCentroCusto);
  if trim(sPlanoCentroCusto) = '' then
    sPlanoCentroCusto := '-1';
  MsCentCusto.Filtro.Add('CENTCUST.IDPLANCENTCUST = '+ sPlanoCentroCusto);

  MontaSelect.Filtro.Add('CENTCUST.IDPLANCENTCUST = '+ sPlanoCentroCusto);

  CmpCentCusto.LookupSql.Text :=  ' SELECT CODCENTROCUSTO, NOME, STATUSGRUPOCDC, CODEXTERNO FROM CENTCUST WHERE IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) +
  ' AND IDPLANCENTCUST = '+ sPlanoCentroCusto;

// fim    - andre tavares - pendência 15382 - 21/10/2004


// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30059;
    bbtnAjuda.HelpContext := 30059;
  end
  else
  begin
    // OBS.: Não mexi no Help Context do Contas a Receber...
//    HelpContext           := 40034;
//    bbtnAjuda.HelpContext := 40034;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

end;

procedure TFrmTipoAlteradorxCCxContaMT.CmpCContabilExit(Sender: TObject);
begin
  inherited;
  CmpCContabil.AceitaTipoConta := SoAnalitica;
end;

procedure TFrmTipoAlteradorxCCxContaMT.CmpCContabilApertouBotao(Sender: TObject);
begin
  inherited;
  CmpCContabil.AceitaTipoConta := Indiferente;
end;

procedure TFrmTipoAlteradorxCCxContaMT.GrdSelCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If CdsSel.FieldByName('STATUSGRUPOCDC').AsString = 'S' Then
  Begin
     ABrush.Color := $00C4FFFF;
     AFont.Color := ClBlue;
  End;
end;

procedure TFrmTipoAlteradorxCCxContaMT.GrdAllCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If CdsAll.FieldByName('STATUSGRUPOCDC').AsString = 'S' Then
  Begin
     ABrush.Color := $00C4FFFF;
     AFont.Color := ClBlue;
  End;
end;

Procedure TFrmTipoAlteradorxCCxContaMT.CmeCadastroCancel(Sender: TObject);
begin
  If Not PnlCCusto.Visible Then
     inherited
  Else
     PnlCCusto.Visible := False;
End;

Procedure TFrmTipoAlteradorxCCxContaMT.CmeCadastroConfirma(Sender: TObject);
Var
   sOldPlaconta :String;
   iOldCodAlterador, iOldPlano, iOldIdEmpresa, iOldPrograma :LongInt;
   bRelacionaCC                                         :Boolean;
begin
  If Not PnlCCusto.Visible Then
  Begin
     If CmeCadastro.Operacao In [OpInserir, OpAlterar] Then
     Begin
        iOldCodAlterador := Cds.fieldbyname('CODALTERADOR').AsInteger;
        sOldPlaconta     := Cds.fieldbyname('PLACONTA').AsString;
        iOldPlano        := Cds.fieldbyname('PLANO').AsInteger;
        iOldIdEmpresa    := Cds.fieldbyname('IDEMPRESA').AsInteger;
        If (CmbPrgAssistencial.Text = '') Then
           iOldPrograma     := 0
        Else
           iOldPrograma     := StrToInt(CmbPrgAssistencial.LookupValue);
        bRelacionaCC     := True;
     End
     Else
     Begin
        sOldPlaconta     := '';
        iOldCodAlterador := 0;
        iOldPlano        := 0;
        iOldIdEmpresa    := 0;
        iOldPrograma     := 0;
        bRelacionaCC     := False;
     End;
     inherited;
     If bRelacionaCC And
        (MsgDlg('Deseja replicar o relacionamento para outros Centros de Custo ?','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mryes) Then
     Begin
        PnlCCusto.Visible := True;
        PnlCCusto.BringToFront;

        CdsSel.data := CtrlAltxccxprgxconta.ListAltxccxprgxcontaCCustoAsso(iOldCodAlterador,
                                             iOldPrograma,
                                             iOldPlano,
                                             Trim(sOldPlaconta), ParamIntegra.PlanoCentroCusto);
        CdsAll.data := CtrlAltxccxprgxconta.ListAltxccxprgxcontaCCustoNaoAsso(iOldCodAlterador,
                                               iOldPlano,
                                               iOldIdEmpresa,
                                               iOldPrograma,
                                               Trim(sOldPlaconta), ParamIntegra.PlanoCentroCusto);
         bbtnSair.Enabled := false;
         While PnlCCusto.Visible Do Application.ProcessMessages;
         PnlCCusto.Visible := False;
         bbtnSair.Enabled := true;
     End
  End
  Else
  Begin
     PnlCCusto.Visible := False;
     PnlCCusto.SendToBack;
     CtrlAltxccxprgxconta.AplicaAlteracoes(CdsSel.data);
  End;
End;

procedure TFrmTipoAlteradorxCCxContaMT.QrySelBeforePost(DataSet: TDataSet);
begin
  inherited;
  If CdsSel.FieldByName('IDPROGRAMA').AsInteger = 0 Then CdsSel.FieldByName('IDPROGRAMA').Clear;
end;

procedure TFrmTipoAlteradorxCCxContaMT.CmeCadastroApplyDelete(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
Accept := CtrlAltxccxprgxconta.GravarAltxccxprgxconta(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TFrmTipoAlteradorxCCxContaMT.CmeCadastroApplyEdit(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
if not PnlCCusto.Visible then
Accept := CtrlAltxccxprgxconta.GravarAltxccxprgxconta(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TFrmTipoAlteradorxCCxContaMT.CmeCadastroApplyInsert(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
if not PnlCCusto.Visible then  
Accept := CtrlAltxccxprgxconta.GravarAltxccxprgxconta(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TFrmTipoAlteradorxCCxContaMT.CmeCadastroAbortConfirma(
  sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlAltxccxprgxconta.MessageInfo <> '' Then
     MsgDlg(CtrlAltxccxprgxconta.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmTipoAlteradorxCCxContaMT.InsereBaixoCima;
begin
   CdsSel.Append;
   CdsSel.Fieldbyname('PLANO').asfloat           := Cds.Fieldbyname('PLANO').asfloat;
   CdsSel.Fieldbyname('PLACONTA').asString       := Cds.Fieldbyname('PLACONTA').asString;
   If Trim(CmbPrgAssistencial.Text) <> '' Then
      CdsSel.Fieldbyname('IDPROGRAMA').asfloat   := strtoint(CmbPrgAssistencial.LookupValue);
   CdsSel.Fieldbyname('IDEMPRESA').asfloat       := Sistema.IdEmpresa;
   CdsSel.Fieldbyname('CODALTERADOR').asString := CdsAll.Fieldbyname('CODALTERADOR').asString;
   CdsSel.Fieldbyname('CODCENTROCUSTO').asString := cdsAll.Fieldbyname('CODCENTROCUSTO').AsString;
   CdsSel.Fieldbyname('CODEXTERNO').asString     := cdsAll.Fieldbyname('CODEXTERNO').AsString;
   CdsSel.Fieldbyname('STATUSGRUPOCDC').asString := cdsAll.Fieldbyname('STATUSGRUPOCDC').AsString;
   CdsSel.Fieldbyname('NOME').asString := cdsAll.Fieldbyname('NOME').AsString;
   CdsSel.post;
   CdsAll.delete;
end;

procedure TFrmTipoAlteradorxCCxContaMT.InsereCimaBaixo;
begin
   CdsAll.Append;
   CdsAll.Fieldbyname('PLANO').asfloat     := CdsSel.Fieldbyname('PLANO').asfloat;
   CdsAll.Fieldbyname('PLACONTA').asString := CdsSel.Fieldbyname('PLACONTA').asString;
   If Trim(CmbPrgAssistencial.Text) <> '' Then
      CdsAll.Fieldbyname('IDPROGRAMA').asfloat   := strtoint(CmbPrgAssistencial.LookupValue);
   CdsAll.Fieldbyname('IDEMPRESA').asfloat := CdsSel.Fieldbyname('IDEMPRESA').asfloat;
   CdsAll.Fieldbyname('CODCENTROCUSTO').asString := CdsSel.Fieldbyname('CODCENTROCUSTO').asString;
   CdsAll.Fieldbyname('CODEXTERNO').asString := CdsSel.Fieldbyname('CODEXTERNO').asString;
   CdsAll.Fieldbyname('CODALTERADOR').asString := CdsSel.Fieldbyname('CODALTERADOR').asString;
   CdsAll.Fieldbyname('STATUSGRUPOCDC').asString := CdsSel.Fieldbyname('STATUSGRUPOCDC').asString;
   CdsAll.Fieldbyname('NOME').asString           := CdsSel.Fieldbyname('NOME').asString;
   CdsAll.post;
   CdsSel.delete;
end;

procedure TFrmTipoAlteradorxCCxContaMT.BtnSelClick(Sender: TObject);
Var
  sCodigoAnalitico: String;
begin
  inherited;
  If Not CdsALL.IsEmpty Then
  Begin
     If CdsAll.fieldbyname('STATUSGRUPOCDC').AsString = 'S' Then
     Begin
        sCodigoAnalitico := Trim(CdsAll.fieldbyname('CODCENTROCUSTO').AsString);
        While Pos(sCodigoAnalitico,Trim(CdsAll.fieldbyname('CODCENTROCUSTO').AsString)) = 1 Do
        begin
           InsereBaixoCima;
        end;
     End
     Else
       InsereBaixoCima;
  End;
end;

procedure TFrmTipoAlteradorxCCxContaMT.BtnSelAllClick(Sender: TObject);
begin
  inherited;
  If Not CdsAll.IsEmpty Then
  Begin
    CdsAll.First;
    While Not CdsAll.Eof Do
          BtnSel.Click;
  End;
end;

procedure TFrmTipoAlteradorxCCxContaMT.BtnDelClick(Sender: TObject);
var
  sCodigoAnalitico: String;
begin
  inherited;
  If Not CdsSel.IsEmpty Then
  Begin
     If CdsSel.fieldbyname('STATUSGRUPOCDC').AsString = 'S' Then
     Begin
        sCodigoAnalitico := Trim(CdsSel.fieldbyname('CODCENTROCUSTO').AsString);
        While Pos(sCodigoAnalitico,Trim(CdsSel.fieldbyname('CODCENTROCUSTO').AsString)) = 1 Do
        begin
           InsereCimaBaixo;
        end;
     End
     Else
       InsereCimaBaixo;
  End;
end;

procedure TFrmTipoAlteradorxCCxContaMT.BtnDelAllClick(Sender: TObject);
begin
  inherited;
  If Not CdsSel.IsEmpty Then
  Begin
    CdsSel.First;
    While Not CdsSel.Eof Do
          BtnDel.Click;
  End;
end;

end.

// 30071 - Número de Help Context anterior...
