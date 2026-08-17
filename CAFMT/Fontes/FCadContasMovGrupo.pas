unit FCadContasMovGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, wwdblook, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, CMTree, Mask, wwdbedit,
  DBCtrls, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CmEventosCadastro, ImgList;

type
  TfrmCadContasMovGrupo = class(TfrmCadMestreDetalheCS)
    lblGrupo: TLabel;
    lblTipoMov: TLabel;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryGrupo: TwwQuery;
    qryMovimento: TwwQuery;
    dbeContaContabil: TwwDBEdit;
    spdContaContabil: TSpeedButton;
    treeContaContabil: TCMTreeView;
    dbTipoLanc: TDBRadioGroup;
    dsContaContabil: TwwDataSource;
    qryContaContabil: TwwQuery;
    qryContaContabilPLANO: TFloatField;
    qryContaContabilPLACONTA: TStringField;
    qryContaContabilPLATIPO: TStringField;
    qryContaContabilPLANOME: TStringField;
    gbDescrConta: TGroupBox;
    lbDescricaoConta: TLabel;
    qryDetTIPOCREDITO: TStringField;
    qryParamGlobal: TwwQuery;
    dblcGrupo: TwwDBLookupCombo;
    dblcTipoMovimento: TwwDBLookupCombo;
    qryUpdNome: TwwQuery;
    Label1: TLabel;
    qryPlano: TwwQuery;
    qryPlanoPLANO: TFloatField;
    qryPlanoDESCPLANO: TStringField;
    qryPlanoMASCARA: TStringField;
    edPlanoConta: TEdit;
    Label2: TLabel;
    qryMovimentoIDTIPOMOVIMENTACAO: TFloatField;
    qryMovimentoDESCTIPOMOVIMENTACAO: TStringField;
    qryMovimentoLANCAMENTO: TStringField;
    qryMovimentoIDCONTAB: TFloatField;
    qryDetIDCONTASTIPOSMOV: TFloatField;
    qryDetIDGRUPO: TFloatField;
    qryDetIDTIPOMOVIMENTACAO: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetPLANO: TFloatField;
    qryDetPLACONTA: TStringField;
    qryDetTIPOLANCAMENTO: TStringField;
    qryDetPLANOME: TStringField;
    qryIDPESSOA: TFloatField;
    qryIDGRUPO: TFloatField;
    qryIDTIPOMOVIMENTACAO: TFloatField;
    procedure spdContaContabilClick(Sender: TObject);
    procedure treeContaContabilDblClick(Sender: TObject);
    procedure treeContaContabilExit(Sender: TObject);
    procedure dbeContaContabilExit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryDetCalcFields(DataSet: TDataSet);
    procedure dblcTipoMovimentoExit(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iGrupo, iTipoMov, iPlano     : Integer;
    sMascaraPlano,sMascaraCCusto : String;
    //------------------------------------------------------------------------------------
    procedure FazerQryPrincipal;
    procedure SelecionaFilhos;
    function  TestaContaContabil(iPlanoC:LongInt;sConta:String) : String;
  end;

var
  frmCadContasMovGrupo: TfrmCadContasMovGrupo;

implementation

{$R *.DFM}
uses uMensErro, uDataBase, dBaseDados, uAutorizacao, uSistema, uFuncaoGeral,
      dAtivoFixo;

Function TfrmCadContasMovGrupo.TestaContaContabil(iPlanoC:LongInt;sConta:String) : String;
var
   qryTestaC : TwwQuery;

begin
   // Result := ''            => Conta nao existe
   // Result := Nome da Conta => Conta existe

   qryTestaC              := TwwQuery.Create(Application);
   qryTestaC.DatabaseName := 'BASEDADOS';

   Try
   //
      qryTestaC.Close;
      qryTestaC.SQL.Clear;
      qryTestaC.SQL.text :='SELECT PLANOME FROM ' + Sistema.PrefixoServidor + 'PLANOCONTA WHERE PLANO = '+IntToStr(iPlanoC) + ' AND PLAINATIVA = ''A'' AND PLACONTA = '''+sConta+'''';
      qryTestaC.Open;
  //
      Result:='';
      if qryTestaC.IsEmpty then
      Begin
         MsgDlg('Conta Contábil '+sConta+' Não Cadastrada. Verifique.','Erro',mtError,[mbOk],0);
         FuncaoGeral.TiraIcone;
         exit;
      end;
      Result:= qryTestaC.FieldByName('PLANOME').AsString;
   Finally
      qryTestaC.Free;
   End;

end;

procedure TfrmCadContasMovGrupo.FormCreate(Sender: TObject);
begin
   inherited;
   qryUpdNome.ExecSQL;
   //
   MontaSelect.Filtro.Add('TIPOSMOVIMENTOGRUPOS.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   lbDescricaoConta.Caption:='';
   iGrupo   := 0;
   iTipoMov := 0;
   FazerQryPrincipal;
   SelecionaFilhos;
   //
   iPlano := 0;
   with dtmAtivoFixo.qryParamCaf do
   begin
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
      iPlano := FieldByName('PLANOVIGENTE').AsInteger;
      Close;
   end;
   qryPlano.ParamByName('PPLANO').AsInteger := iPlano;
   qryPlano.Open;
   sMascaraPlano     := trim(qryPlanoMASCARA.AsString);
   edPlanoConta.Text := trim(inttostr(iPlano)) + ' - ' + qryPlanoDESCPLANO.AsString;
   qryPlano.Close;
   //
   qryGrupo.Close;
   qryGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryGrupo.Open;
   //
   qryMovimento.Open;
   //
   qryContaContabil.Close;
   qryContaContabil.SQL.Clear;
   qryContaContabil.SQL.text := 'SELECT PLANO,PLANOME,PLACONTA,PLATIPO,PLACCUST FROM '+Sistema.PrefixoServidor+'PLANOCONTA WHERE PLANO = '+IntToStr(iPlano)+' AND PLAINATIVA = ''A'' ORDER BY PLACONTA';
   qryContaContabil.Open;
   //
   treeContaContabil.Mascara := sMascaraPlano;
   qryDetPLACONTA.EditMask   := sMascaraPlano + ';0;_';
   treeContaContabil.MontaArvore;
end;

procedure TfrmCadContasMovGrupo.spdContaContabilClick(Sender: TObject);
begin
   inherited;
   treeContaContabil.Visible := not treeContaContabil.Visible;
   if treeContaContabil.Visible
   then treeContaContabil.SetFocus;
end;

procedure TfrmCadContasMovGrupo.treeContaContabilDblClick(Sender: TObject);
begin
   inherited;
   if (qryContaContabil.FieldByName('PLATIPO').asString = 'A') then
      TreeContaContabil.Visible := false;
end;

procedure TfrmCadContasMovGrupo.treeContaContabilExit(Sender: TObject);
begin
   inherited;
   treeContaContabil.Visible := false;
   if (qryContaContabil.FieldByName('PLATIPO').asString = 'A') then
   begin
      qryDet.FieldByName('PLACONTA').AsString:=qryContaContabil.FieldByName('PLACONTA').asString;
      qryDet.FieldByName('PLANO').AsString:=qryContaContabil.FieldByName('PLANO').asString;
      lbDescricaoConta.Caption := TestaContaContabil(qryContaContabil.FieldByName('PLANO').asInteger,
                                                     qryContaContabil.FieldByName('PLACONTA').asString);
   end
   else qryDet.FieldByName('PLACONTA').AsString := '';
   //------------------------------------------------------------------------------------
   dbeContaContabil.SetFocus;
end;

procedure TfrmCadContasMovGrupo.dbeContaContabilExit(Sender: TObject);
var
   sDescConta : String;
begin
   inherited;
   sDescConta:='';
   if trim(dbeContaContabil.text) <> '' then
   begin
      sDescConta := TestaContaContabil(iPlano,dbeContaContabil.Text);
      if sDescConta = '' then
      begin
         qryDet.FieldByName('PLACONTA').AsString:='';
         dbeContaContabil.SetFocus;
         exit;
      end;
   end;
   lbDescricaoConta.Caption := sDescConta;
end;

procedure TfrmCadContasMovGrupo.CmeCadastroInsert(Sender: TObject);
Begin
  inherited;
  iGrupo   := 0;
  iTipoMov := 0;
  dblcGrupo.SetFocus;
  SelecionaFilhos;
end;

procedure TfrmCadContasMovGrupo.CmeCadastroEdit(Sender: TObject);
Begin
  inherited;
  pnlMestre.Enabled:=False;
  tbcDetalhe.SetFocus;
end;

procedure TfrmCadContasMovGrupo.CmeCadastroConfirma(Sender: TObject);
Begin
   dtmBaseDados.dbBaseDados.ApplyUpdates([qry,qryDet]);
end;

procedure TfrmCadContasMovGrupo.CmeCadastroDelete(Sender: TObject);
Begin
  qryDet.First;
  While not qryDet.Eof do
     qryDet.Delete;
  qry.Delete;
  dtmBaseDados.dbBaseDados.ApplyUpdates([qryDet,qry]);
end;

procedure TfrmCadContasMovGrupo.CmeCadastroFind(Sender: TObject);
Begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
     iGrupo   :=StrToInt(MontaSelect.ValoresChave[0]);
     iTipoMov :=StrToInt(MontaSelect.ValoresChave[1]);
     FazerQryPrincipal;
     SelecionaFilhos;
  end;
end;

procedure TfrmCadContasMovGrupo.FazerQryPrincipal;
begin
   qry.Close;
   qry.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
   qry.ParamByName('PIDGRUPO').AsInteger   := iGrupo;
   qry.ParamByName('PIDTIPOMOV').AsInteger := iTipoMov;
   qry.Open;
end;

procedure TfrmCadContasMovGrupo.SelecionaFilhos;
begin
   qryDet.Close;
   qryDet.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
   qryDet.ParamByName('PIDGRUPO').AsInteger   := iGrupo;
   qryDet.ParamByName('PIDTIPOMOV').AsInteger := iTipoMov;
   qryDet.Open;
end;

procedure TfrmCadContasMovGrupo.bbtnConfirmarClick(Sender: TObject);
var
   iDeb,iCre : Integer;

begin
   if trim(dblcGrupo.Text) = '' then
   begin
      MsgDlg('Obrigatório Preencher o Grupo','Erro',mtError,[mbOk],0);
      dblcGrupo.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if trim(dblcTipoMovimento.Text) = '' then
   begin
      MsgDlg('Obrigatório Preencher o Tipo de Movimento','Erro',mtError,[mbOk],0);
      dblcTipoMovimento.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if qryDet.RecordCount < 1 then
   begin
      MsgDlg('Obrigatório Preencher pelo menos uma Conta Contábil','Erro',mtError,[mbOk],0);
      tbcDetalhe.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if qryDet.RecordCount > 2 then
   begin
      MsgDlg('Somente é possível ter uma Conta Contábil a Débito e uma a Crédito','Erro',mtError,[mbOk],0);
      tbcDetalhe.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   iCre := 0;
   iDeb := 0;
   //-------------------------------------------------------------------------------------
   iGrupo   := qryGrupo.FieldByName('IDGRUPO').AsInteger;
   iTipoMov := qryMovimento.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
   qry.FieldByName('IDPESSOA').AsInteger           := Sistema.IdEmpresa;
   qry.FieldByName('IDGRUPO').AsInteger            := iGrupo;
   qry.FieldByName('IDTIPOMOVIMENTACAO').AsInteger := iTipoMov;
   //-------------------------------------------------------------------------------------
   qryDet.First;
   while not qryDet.Eof do
   begin
      if qryDet.FieldByName('TIPOLANCAMENTO').AsString = 'D' then
         iDeb := iDeb + 1
      else
         iCre := iCre + 1;
      qryDet.Edit;
      //----------------------------------------------------------------------------------
      qryDet.FieldByName('IDCONTASTIPOSMOV').AsInteger   := LeUltRegistro(nil,'CONTASTIPOSMOVIMENTOGRUPOS');
      qryDet.FieldByName('IDPESSOA').AsInteger           := Sistema.IdEmpresa;
      qryDet.FieldByName('PLANO').AsInteger              := iPlano;
      qryDet.FieldByName('IDGRUPO').AsInteger            := qryGrupo.FieldByName('IDGRUPO').AsInteger;
      qryDet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger := qryMovimento.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
      qryDet.Post;
      qryDet.Next;
   end;
   //-------------------------------------------------------------------------------------
   if iDeb > 1 then
   begin
      MsgDlg('Somente é possível ter uma Conta Contábil a Débito','Erro',mtError,[mbOk],0);
      tbcDetalhe.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if iCre > 1 then
   begin
      MsgDlg('Somente é possível ter uma Conta Contábil a Crédito','Erro',mtError,[mbOk],0);
      tbcDetalhe.SetFocus;
      exit;
   end;
   pnlMestre.Enabled := True;
   //-------------------------------------------------------------------------------------
   try
      inherited;
      qryGrupo.Locate('IDGRUPO',iGrupo,[]);
      qryMovimento.Locate('IDTIPOMOVIMENTACAO',iTipoMov,[]);
   except
      MsgDlg('Conta já Cadastrada!','Erro',mtError,[mbOk],0);
      raise
   end;
end;

procedure TfrmCadContasMovGrupo.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   qryDet.FieldByName('TIPOLANCAMENTO').AsString := 'D';
   dbeContaContabil.SetFocus;
end;

procedure TfrmCadContasMovGrupo.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   dbeContaContabil.SetFocus;
end;

procedure TfrmCadContasMovGrupo.CmeDetalheConfirma(Sender: TObject);
begin
   if (qry.State in ([dsInsert,dsEdit])) and (qryDet.State in ([dsInsert,dsEdit])) then
   begin
      if trim(dbeContaContabil.Text) = '' then
      begin
         MsgDlg('Obrigatório Preencher a Conta Contábil','Erro',mtError,[mbOk],0);
         dbeContaContabil.SetFocus;
         exit;
      end;
      qryDetPLANOME.Text:=lbDescricaoConta.Caption;
   end;
   inherited;
end;

procedure TfrmCadContasMovGrupo.qryDetCalcFields(DataSet: TDataSet);
begin
   inherited;
   qryDetTIPOCREDITO.Text := qryDet.FieldByName('TIPOLANCAMENTO').AsString;
end;

procedure TfrmCadContasMovGrupo.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   iGrupo   := qry.FieldByName('IDGRUPO').AsInteger;
   iTipoMov := qry.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
   FazerQryPrincipal;
   SelecionaFilhos;
   pnlMestre.Enabled := True;
end;

procedure TfrmCadContasMovGrupo.dblcTipoMovimentoExit(Sender: TObject);
begin
   inherited;
   if dblcGrupo.text = '' then
   begin
      MsgDlg('Obrigatório Preencher o Grupo','Erro',mtError,[mbOk],0);
      dblcGrupo.SetFocus;
      exit;
   end;
   iGrupo    := qrygrupo.FieldByName('IDGRUPO').AsInteger;
   iTipoMov  := qrymovimento.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
end;

procedure TfrmCadContasMovGrupo.sbtnInsDetClick(Sender: TObject);
begin
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   inherited;
end;

procedure TfrmCadContasMovGrupo.sbtnAltDetClick(Sender: TObject);
begin
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   inherited;
end;

procedure TfrmCadContasMovGrupo.sbtnExcluiDetClick(Sender: TObject);
begin
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   inherited;
end;

procedure TfrmCadContasMovGrupo.bbtnVoltarDetClick(Sender: TObject);
begin
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   inherited;
end;

procedure TfrmCadContasMovGrupo.bbtnOkDetClick(Sender: TObject);
begin
   if qryDet.State in [dsEdit] then
   begin
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
   end;
   inherited;
end;


end.
