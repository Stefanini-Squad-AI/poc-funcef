unit FCadLocali;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, wwdblook,
  ComCtrls, CMTree, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CmEventosCadastro, ImgList{$IFNDEF VERSAO0505},uCMTypes {$ENDIF};

type
  TfrmCadLocali = class(TfrmCadastroCS)
    dbeNome: TwwDBEdit;
    qryArea: TwwQuery;
    dblcTipoArea: TwwDBLookupCombo;
    lblNome: TLabel;
    lblArea: TLabel;
    gbDescrCCusto: TGroupBox;
    lbDescCentroCusto: TLabel;
    qryCentroCusto: TwwQuery;
    dsCentroCusto: TwwDataSource;
    qryCentroCustoCODCENTROCUSTO: TStringField;
    qryCentroCustoNOME: TStringField;
    qryCentroCustoSTATUSGRUPOCDC: TStringField;
    qryParamGlobal: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    dbeEndereco: TwwDBEdit;
    MSResponsavel: TMontaSelect;
    spdSelResponsavel: TBitBtn;
    qryResp: TwwQuery;
    dbeResponsavel: TwwDBEdit;
    qryRespIDRESPONSAVEL: TFloatField;
    qryRespDESCRESPONSAVEL: TStringField;
    dsResp: TwwDataSource;
    qryAreaDESCTIPOAREA: TStringField;
    qryAreaIDTIPOAREA: TFloatField;
    qryParamGlobalMASCARACC: TStringField;
    pnlTree: TPanel;
    treeCentroCusto: TCMTreeView;
    dbeCentroCusto: TwwDBEdit;
    spdCentroCusto: TBitBtn;
    gbxSaidaTemp: TGroupBox;
    ckbSaidaTemp: TCheckBox;
    qryIDLOCALIZACAO: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIDRESPONSAVEL: TFloatField;
    qryIDEMPRESA: TFloatField;
    qryCODCENTROCUSTO: TStringField;
    qryIDTIPOAREA: TFloatField;
    qryNOME: TStringField;
    qryENDERECO: TStringField;
    qryFLGLOCSAITEMP: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure FazerQryPrincipal;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure spdCentroCustoClick(Sender: TObject);
    procedure dbeCentroCustoExit(Sender: TObject);
    procedure treeCentroCustoDblClick(Sender: TObject);
    procedure treeCentroCustoExit(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure spdSelResponsavelClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
    Procedure HabilitaObjetos(Tipo : Boolean);
  public
    { Public declarations }
  end;

var
   frmCadLocali   : TfrmCadLocali;
   iLocalizacao   : Integer;
   sMascaraCCusto : String;

implementation

uses uMensErro,uDataBase, dBaseDados,uSistema,uFuncaoGeral;

{$R *.DFM}

procedure TfrmCadLocali.FormActivate(Sender: TObject);
begin
   inherited;
   HabilitaObjetos(false);
   lbDescCentroCusto.Caption:='';
   //
   MontaSelect.Filtro.Add('LOCALIZACAO.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   //
   qry.Prepare;
   qryArea.Prepare;
   qryParamGlobal.Prepare;
   qryCentroCusto.Prepare;
   //
   iLocalizacao := 0;
   FazerQryPrincipal;
   //
   qryArea.Open;
   //
   qryParamGlobal.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryParamGlobal.Open;
   sMascaraCCusto := qryParamGlobalMASCARACC.AsString;
   //
   qryCentroCusto.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryCentroCusto.Open;
   //
   treeCentroCusto.Mascara := sMascaraCCusto;
   qryCODCENTROCUSTO.EditMask := trim(sMascaraCCusto)+ ';0;_';
   treeCentroCusto.MontaArvore;
   //
end;
//----------------------------------------------------------------------------------------
procedure TfrmCadLocali.FazerQryPrincipal;
begin
  qry.Close;
  qry.ParamByName('PIDLOCALIZACAO').AsInteger := iLocalizacao;
  qry.Open;
end;
//----------------------------------------------------------------------------------------
procedure TfrmCadLocali.CmeCadastroFind(Sender: TObject);
Var
   sDescCCusto:String;
begin
   if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
   begin
      iLocalizacao := StrToInt(MontaSelect.ValoresChave[0]);
      FazerQryPrincipal;
      //----------------------------------------------------------------------------------
      sDescCCusto := FuncaoGeral.TestaCentroCusto(Sistema.IdEmpresa,qryCODCENTROCUSTO.AsString);
      lbDescCentroCusto.Caption := sDescCCusto;
      //----------------------------------------------------------------------------------
      if (qryFLGLOCSAITEMP.AsInteger = 0) then
         ckbSaidaTemp.Checked := False
      else
         ckbSaidaTemp.Checked := True;
      //----------------------------------------------------------------------------------
      qryResp.Close;
      qryResp.ParamByName('PIDRESP').AsInteger := qryIDRESPONSAVEL.AsInteger;
      qryResp.Open;
      if qryResp.IsEmpty then
         MsgDlg('Cadastre um Responsável válido','Atenção',mtWarning,[mbOk],0);
   end;
end;
//----------------------------------------------------------------------------------------
procedure TfrmCadLocali.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   qry.FieldByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
   qry.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
   lbDescCentroCusto.Caption := '';
   ckbSaidaTemp.Checked := False;
   qryResp.Close;
   dbeNome.SetFocus;
end;
//----------------------------------------------------------------------------------------
procedure TfrmCadLocali.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   dbeNome.SetFocus;
end;
//----------------------------------------------------------------------------------------
procedure TfrmCadLocali.bbtnConfirmarClick(Sender: TObject);
begin
   if trim(dbeNome.text) = '' then
   begin
      MsgDlg('Obrigatório preencher a Descrição da Localização','Erro',mtError,[mbOk],0);
      dbeNome.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if trim(dblcTipoArea.text) = '' then
   begin
      MsgDlg('Obrigatório preencher o Tipo de Area','Erro',mtError,[mbOk],0);
      dblcTipoArea.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if trim(dbeCentroCusto.text) = '' then
   begin
      MsgDlg('Obrigatório preencher o Centro de Custo desta Localização','Erro',mtError,[mbOk],0);
      dbeCentroCusto.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if qry.FieldByName('IDLOCALIZACAO').AsInteger <= 0 then
      qry.FieldByName('IDLOCALIZACAO').AsInteger := LeUltRegistro(nil,'LOCALIZACAO');
   //-------------------------------------------------------------------------------------
   if (ckbSaidaTemp.Checked) then
      qryFLGLOCSAITEMP.AsInteger := 1
   else
      qryFLGLOCSAITEMP.AsInteger := 0;
   //-------------------------------------------------------------------------------------
   if qryRespIDRESPONSAVEL.IsNull then
   begin
      qry.FieldByName('IDRESPONSAVEL').Clear;
   end else
   begin
      qry.FieldByName('IDRESPONSAVEL').AsInteger := qryRespIDRESPONSAVEL.AsInteger;
   end;
   //-------------------------------------------------------------------------------------
   inherited;
end;
//----------------------------------------------------------------------------------------
procedure TfrmCadLocali.spdCentroCustoClick(Sender: TObject);
begin
   inherited;
   treeCentroCusto.Visible := not treeCentroCusto.Visible;
   if treeCentroCusto.Visible then
      treeCentroCusto.SetFocus;
end;
//----------------------------------------------------------------------------------------
procedure TfrmCadLocali.dbeCentroCustoExit(Sender: TObject);
var
   sDescCCusto : String;
begin
   inherited;
   sDescCCusto:='';
   if trim(dbeCentroCusto.text) <> '' then
   begin
      sDescCCusto:=FuncaoGeral.TestaCentroCusto(Sistema.IdEmpresa,dbeCentroCusto.Text);
      if sDescCCusto = '' then
      begin
         qry.FieldByName('CODCENTROCUSTO').AsString:='';
         dbeCentroCusto.SetFocus;
         exit;
      end;
   end;
   lbDescCentroCusto.Caption := sDescCCusto;
end;
//----------------------------------------------------------------------------------------
procedure TfrmCadLocali.treeCentroCustoDblClick(Sender: TObject);
begin
   inherited;
   if (qryCentroCusto.FieldByName('STATUSGRUPOCDC').asString = 'A') then
   begin
      TreeCentroCusto.Visible := False;
      dbeCentroCusto.SetFocus;
   end;
end;
//----------------------------------------------------------------------------------------
procedure TfrmCadLocali.treeCentroCustoExit(Sender: TObject);
begin
   inherited;
   TreeCentroCusto.Visible := False;
   qryCODCENTROCUSTO.AsString := qryCentroCustoCODCENTROCUSTO.asString;
   dbeCentroCusto.SetFocus;
end;
//----------------------------------------------------------------------------------------
Procedure TfrmCadLocali.HabilitaObjetos(Tipo : Boolean);
begin
   dbeNome.Enabled           := Tipo;
   dbeResponsavel.Enabled    := Tipo;
   dbeEndereco.Enabled       := Tipo;
   spdSelResponsavel.Enabled := Tipo;
   dblcTipoArea.Enabled      := Tipo;
   dbeCentroCusto.Enabled    := Tipo;
   spdCentroCusto.Enabled    := Tipo;
   treeCentroCusto.Enabled   := Tipo;
   gbxSaidaTemp.Enabled      := Tipo;
end;
//----------------------------------------------------------------------------------------
procedure TfrmCadLocali.sbtnInserirClick(Sender: TObject);
begin
   HabilitaObjetos(True);
   inherited;
end;
//----------------------------------------------------------------------------------------
procedure TfrmCadLocali.sbtnAlterarClick(Sender: TObject);
begin
   HabilitaObjetos(True);
   inherited;
end;
//----------------------------------------------------------------------------------------
procedure TfrmCadLocali.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   HabilitaObjetos(false);
end;
//----------------------------------------------------------------------------------------
procedure TfrmCadLocali.spdSelResponsavelClick(Sender: TObject);
begin
   inherited;
   MSResponsavel.Executar;
   //-------------------------------------------------------------------------------------
   frmCadLocali.Invalidate;
   frmCadLocali.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qryResp.Close;
   if (MSResponsavel.ValoresChave.Count > 0) and (MSResponsavel.ValoresChave[0] <> '') then
   begin
      qryResp.ParamByName('PIDRESP').AsInteger := StrToInt(MSResponsavel.ValoresChave[0]);
      qryResp.Open;
   end;
end;

procedure TfrmCadLocali.sbtnApagarClick(Sender: TObject);
begin
   inherited;
   qryResp.Close;
   ckbSaidaTemp.Checked := False;
end;

procedure TfrmCadLocali.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   case CmeCadastro.Operacao of
      opInserir :
         if not Sistema.GravaLogOperacoes('Inclusão de Localizações de Bens do Ativo Fixo') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opAlterar :
         if not Sistema.GravaLogOperacoes('Alteração de Localizações de Bens do Ativo Fixo') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opApagar :
         if not Sistema.GravaLogOperacoes('Remoção de Localizações de Bens do Ativo Fixo') then
            raise Exception.Create('Erro ao gravar Log de Operação');
   end;
end;

end.
