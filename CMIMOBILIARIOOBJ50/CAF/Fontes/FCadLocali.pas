unit FCadLocali;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97, CMProcuraMask,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, wwdblook, uCmSqlParams,
  ComCtrls, CMTree, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CmEventosCadastro, ImgList{$IFNDEF VERSAO0505},uCMTypes, CMProcuraSubTipo,
  DBCtrls, DBClient, uCMClientDataSet {$ENDIF};

type
  TfrmCadLocali = class(TfrmCadastroCS)
    dbeNome: TwwDBEdit;
    qryArea: TwwQuery;
    dblcTipoArea: TwwDBLookupCombo;
    lblNome: TLabel;
    lblArea: TLabel;
    qryParamGlobal: TwwQuery;
    Label2: TLabel;
    MSCentroCusto: TMontaSelect;
    qryResp: TwwQuery;
    qryRespIDRESPONSAVEL: TFloatField;
    qryRespDESCRESPONSAVEL: TStringField;
    dsResp: TwwDataSource;
    qryAreaDESCTIPOAREA: TStringField;
    qryAreaIDTIPOAREA: TFloatField;
    qryParamGlobalMASCARACC: TStringField;
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
    CMProcuraCCusto: TCMProcuraMask;
    CMProcuraResp: TCMProcuraSubTipo;
    dbeEndereco: TDBMemo;
    sqlCentroCusto: TCMSqlParams;
    cdsCentroCusto: TCMClientDataSet;
    procedure FazerQryPrincipal;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CMProcuraCCustoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    iLocalizacao   : Integer;
    sMascaraCCusto : String;
  public
    { Public declarations }
  end;

var
   frmCadLocali   : TfrmCadLocali;

implementation

uses uMensErro,uDataBase, dBaseDados,uSistema;

{$R *.DFM}


procedure TfrmCadLocali.FormCreate(Sender: TObject);
begin
   inherited;
   qry.Prepare;
   qryArea.Prepare;
   qryParamGlobal.Prepare;
   //
   MontaSelect.Filtro.Add('LOCALIZACAO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   MSCentroCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
   //
   sqlCentroCusto.Prepare;
   sqlCentroCusto.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
   //
   iLocalizacao := 0;
   FazerQryPrincipal;
   //
   qryArea.Open;
   //
   qryParamGlobal.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryParamGlobal.Open;
   sMascaraCCusto := qryParamGlobal.FieldByName('MASCARACC').AsString;
   CMProcuraCCusto.Mascara := sMascaraCCusto;
end;
//========================================================================================
procedure TfrmCadLocali.FazerQryPrincipal;
begin
  qry.Close;
  qry.ParamByName('PIDLOCALIZACAO').AsInteger := iLocalizacao;
  qry.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qry.Open;
end;
//========================================================================================
procedure TfrmCadLocali.CmeCadastroFind(Sender: TObject);
begin
   if MontaSelect.RetornouValor then
   begin
      iLocalizacao := StrToInt(MontaSelect.ValoresChave[0]);
      FazerQryPrincipal;
      //----------------------------------------------------------------------------------
      ckbSaidaTemp.Checked := (qry.FieldByName('FLGLOCSAITEMP').AsInteger <> 0);
   end;
end;
//========================================================================================
procedure TfrmCadLocali.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   qry.FieldByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
   qry.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
   ckbSaidaTemp.Checked := False;
   dbeNome.SetFocus;
end;
//========================================================================================
procedure TfrmCadLocali.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   dbeNome.SetFocus;
end;
//========================================================================================
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
   if qry.FieldByName('IDRESPONSAVEL').IsNull then
   begin
      MsgDlg('Obrigatório preencher o Centro de Custo desta Localização','Erro',mtError,[mbOk],0);
      CMProcuraCCusto.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if qry.FieldByName('IDLOCALIZACAO').AsInteger <= 0 then
      qry.FieldByName('IDLOCALIZACAO').AsInteger := LeUltRegistro(nil,'LOCALIZACAO');
   //-------------------------------------------------------------------------------------
   if ckbSaidaTemp.Checked then
      qry.FieldByName('FLGLOCSAITEMP').AsInteger := 1
   else
      qry.FieldByName('FLGLOCSAITEMP').AsInteger := 0;
   //-------------------------------------------------------------------------------------
   inherited;
end;
//========================================================================================
procedure TfrmCadLocali.CMProcuraCCustoExit(Sender: TObject);
begin
   inherited;
   if CMProcuraCCusto.Valida = vcOk then
      qry.FieldByName('CODCENTROCUSTO').AsString := cdsCentroCusto.FieldByName('CODCENTROCUSTO').asString;
end;
//========================================================================================
procedure TfrmCadLocali.sbtnApagarClick(Sender: TObject);
begin
   inherited;
   ckbSaidaTemp.Checked := False;
end;
//========================================================================================
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
