unit FCadContasMovGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, wwdblook, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, CMTree, Mask, wwdbedit,
  DBCtrls, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CmEventosCadastro, ImgList{$IFNDEF VERSAO0505},uCMTypes {$ENDIF};

type
  TfrmCadParamCAFxContab = class(TfrmCadMestreDetalheCS)
    lblGrupo: TLabel;
    lblTipoMov: TLabel;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryGrupo: TwwQuery;
    qryTipoMovimentacao: TwwQuery;
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
    lblDescricaoConta: TLabel;
    dbcGrupo: TwwDBLookupCombo;
    dbcTipoMovimentacao: TwwDBLookupCombo;
    Label1: TLabel;
    qryPlano: TwwQuery;
    edPlanoConta: TEdit;
    Label2: TLabel;
    qryTipoMovimentacaoIDTIPOMOVIMENTACAO: TFloatField;
    qryTipoMovimentacaoDESCTIPOMOVIMENTACAO: TStringField;
    qryTipoMovimentacaoLANCAMENTO: TStringField;
    qryTipoMovimentacaoIDCONTAB: TFloatField;
    lblTitCentroCusto: TLabel;
    dbeCentroCusto: TwwDBEdit;
    bbtnSelCentroCusto: TSpeedButton;
    grbCentroCusto: TGroupBox;
    lblCentroCusto: TLabel;
    MSCentroCusto: TMontaSelect;
    qryDetIDCONTASTIPOSMOV: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDGRUPO: TFloatField;
    qryDetIDTIPOMOVIMENTACAO: TFloatField;
    qryDetTIPOLANCAMENTO: TStringField;
    qryDetPLANO: TFloatField;
    qryDetPLACONTA: TStringField;
    qryDetPLANOME: TStringField;
    qryDetIDEMPRESA: TFloatField;
    qryDetCODCENTROCUSTO: TStringField;
    qryDetDESCCCUSTO: TStringField;
    qryCentroCusto: TwwQuery;
    procedure spdContaContabilClick(Sender: TObject);
    procedure treeContaContabilDblClick(Sender: TObject);
    procedure treeContaContabilExit(Sender: TObject);
    procedure dbeContaContabilExit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnSelCentroCustoClick(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure dbeCentroCustoExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    bInsert   : Boolean;
    procedure SelParamCAFxContab(iEmpresaProp : Integer; iGrupo, iTipoMov : Integer);
    function  TestaContaContabil(iPlano : Integer; sConta : String) : String;
  public
    { Public declarations }
  end;

var
  frmCadParamCAFxContab: TfrmCadParamCAFxContab;

implementation

{$R *.DFM}
uses uMensErro, uDataBase, dBaseDados, uAutorizacao, uSistema, dAtivoFixo;

procedure TfrmCadParamCAFxContab.FormCreate(Sender: TObject);
var
   iPlano                        : Integer;
   sMascaraPlano, sMascaraCCusto : String;

begin
   inherited;
   qryGrupo.Prepare;
   qryGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryGrupo.Open;
   //-------------------------------------------------------------------------------------
   qryTipoMovimentacao.Prepare;
   qryTipoMovimentacao.Open;
   //-------------------------------------------------------------------------------------
   qryContaContabil.Prepare;
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('TIPOSMOVIMENTOGRUPOS.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   MSCentroCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo do
   begin
      qryParamGlobal.Close;
      qryParamGlobal.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qryParamGlobal.Open;
      sMascaraCCusto := qryParamGlobal.FieldByName('MASCARACC').AsString;
      //----------------------------------------------------------------------------------
      qryParamCAF.Close;
      qryParamCAF.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qryParamCAF.Open;
      iPlano := qryParamCAF.FieldByName('PLANOVIGENTE').AsInteger;
      //----------------------------------------------------------------------------------
      if qryParamCAF.FieldByName('FLGCTADEPREC').AsInteger = 0 then
      begin
         lblTitCentroCusto.Visible  := False;
         dbeCentroCusto.Visible     := False;
         bbtnSelCentroCusto.Visible := False;
         grbCentroCusto.Visible     := False;
      end else
      begin
         lblTitCentroCusto.Visible  := True;
         dbeCentroCusto.Visible     := True;
         bbtnSelCentroCusto.Visible := True;
         grbCentroCusto.Visible     := True;
      end;
   end;
   qryPlano.ParamByName('PPLANO').AsInteger := iPlano;
   qryPlano.Open;
   sMascaraPlano     := trim(qryPlano.FieldByName('MASCARA').AsString);
   edPlanoConta.Text := trim(inttostr(iPlano)) + ' - ' + qryPlano.FieldByName('DESCPLANO').AsString;
   //-------------------------------------------------------------------------------------
   qryDet.FieldByName('CODCENTROCUSTO').EditMask := sMascaraCCusto + ';0;_';
   //-------------------------------------------------------------------------------------
   qryContaContabil.ParamByName('PLANO').AsInteger := iPlano;
   qryContaContabil.Open;
   treeContaContabil.Mascara := sMascaraPlano;
   qryDet.FieldByName('PLACONTA').EditMask := sMascaraPlano + ';0;_';
   treeContaContabil.MontaArvore;
   //-------------------------------------------------------------------------------------
   SelParamCAFxContab(Sistema.IdEmpresa, -1, -1);
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.SelParamCAFxContab(iEmpresaProp, iGrupo, iTipoMov : Integer);
begin
   qry.Close;
   qry.ParamByName('PIDPESSOA').AsInteger  := iEmpresaProp;
   qry.ParamByName('PIDGRUPO').AsInteger   := iGrupo;
   qry.ParamByName('PIDTIPOMOV').AsInteger := iTipoMov;
   qry.Open;
   //-------------------------------------------------------------------------------------
   qryDet.Close;
   qryDet.ParamByName('PIDPESSOA').AsInteger  := iEmpresaProp;
   qryDet.ParamByName('PIDGRUPO').AsInteger   := iGrupo;
   qryDet.ParamByName('PIDTIPOMOV').AsInteger := iTipoMov;
   qryDet.Open;
   //-------------------------------------------------------------------------------------
   bInsert := False;
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelParamCAFxContab(Sistema.IdEmpresa,
                         strtoint(MontaSelect.ValoresChave[0]),
                         strtoint(MontaSelect.ValoresChave[1]));
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.CmeCadastroInsert(Sender: TObject);
begin
   SelParamCafXContab(-1,-1,-1);
   inherited;
   bInsert := True;
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   bInsert := False;
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   qryDet.FieldByName('TIPOLANCAMENTO').AsString := 'D';
   lblDescricaoConta.Caption := '';
   lblCentroCusto.Caption    := '';
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   lblDescricaoConta.Caption := qryDet.FieldByName('PLANOME').AsString;
   lblCentroCusto.Caption    := qryDet.FieldByName('DESCCCUSTO').AsString;
end;
//========================================================================================
function TfrmCadParamCAFxContab.TestaContaContabil(iPlano : Integer; sConta : String) : String;
var
   qryTestaC : TwwQuery;

begin
   qryTestaC              := TwwQuery.Create(Application);
   qryTestaC.DatabaseName := 'BASEDADOS';
   try
      qryTestaC.Close;
      qryTestaC.SQL.Text := ' SELECT PLANOME ' + #13 +
                            ' FROM PLANOCONTA ' + #13 +
                            ' WHERE (PLANO = ' + IntToStr(iPlano) + ') ' + #13 +
                            '   AND (PLAINATIVA = ''A'') ' + #13 +
                            '   AND (PLACONTA = ''' + sConta + ''') ';
      qryTestaC.Open;
      //----------------------------------------------------------------------------------
      Result := '';
      if qryTestaC.IsEmpty then
      begin
         MsgDlg('Conta Contábil ' + sConta + ' Não Cadastrada. Verifique.',
                'Erro',mtError,[mbOk],0);
         Result := qryTestaC.FieldByName('PLANOME').AsString;
      end else
         Result := qryTestaC.FieldByName('PLANOME').AsString;
   finally
      qryTestaC.Free;
   end;
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.spdContaContabilClick(Sender: TObject);
begin
   inherited;
   treeContaContabil.Visible := not treeContaContabil.Visible;
   if treeContaContabil.Visible
   then treeContaContabil.SetFocus;
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.treeContaContabilDblClick(Sender: TObject);
begin
   inherited;
   if qryContaContabil.FieldByName('PLATIPO').asString = 'A' then
      TreeContaContabil.Visible := False;
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.treeContaContabilExit(Sender: TObject);
begin
   inherited;
   treeContaContabil.Visible := False;
   if qryContaContabil.FieldByName('PLATIPO').asString = 'A' then
   begin
      qryDet.FieldByName('PLACONTA').AsString := qryContaContabil.FieldByName('PLACONTA').asString;
      qryDet.FieldByName('PLANO').AsString    := qryContaContabil.FieldByName('PLANO').asString;
      lblDescricaoConta.Caption := TestaContaContabil(qryContaContabil.FieldByName('PLANO').asInteger,
                                                      qryContaContabil.FieldByName('PLACONTA').asString);
   end else
      qryDet.FieldByName('PLACONTA').AsString := '';
   //-------------------------------------------------------------------------------------
   dbeContaContabil.SetFocus;
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.dbeContaContabilExit(Sender: TObject);
var
   sDescConta : String;
begin
   inherited;
   sDescConta := '';
   if trim(dbeContaContabil.Text) <> '' then
   begin
      sDescConta := TestaContaContabil(qryPlano.FieldByName('PLANO').AsInteger, dbeContaContabil.Text);
      if sDescConta = '' then
      begin
         qryDet.FieldByName('PLACONTA').AsString := '';
         dbeContaContabil.SetFocus;
         exit;
      end;
   end;
   lblDescricaoConta.Caption := sDescConta;
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.bbtnSelCentroCustoClick(Sender: TObject);
begin
   inherited;
   MSCentroCusto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSCentroCusto.RetornouValor then
   begin
      qryDet.FieldByName('CODCENTROCUSTO').AsString := trim(MSCentroCusto.ValoresChave[0]);
      qryDet.FieldByName('IDEMPRESA').AsInteger     := strtoint(MSCentroCusto.ValoresChave[1]);
      qryDet.FieldByName('DESCCCUSTO').AsString     := trim(MSCentroCusto.ValoresChave[2]);
      lblCentroCusto.Caption                        := MSCentroCusto.ValoresChave[2];
   end;
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.dbeCentroCustoExit(Sender: TObject);
begin
   inherited;
   if trim(dbeCentroCusto.Text) <> '' then
   begin
      qryCentroCusto.Close;
      qryCentroCusto.ParamByName('CODCENTROCUSTO').AsString := dbeCentroCusto.Text;
      qryCentroCusto.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
      qryCentroCusto.Open;
      if (not qryCentroCusto.IsEmpty) and (qryCentroCusto.FieldByName('STATUSGRUPOCDC').AsString = 'A') then
      begin
         qryDet.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
         qryDet.FieldByName('DESCCCUSTO').AsString := qryCentroCusto.FieldByName('NOME').AsString;
         lblCentroCusto.Caption                    := qryDet.FieldByName('DESCCCUSTO').AsString;
      end else
      begin
         qryDet.FieldByName('CODCENTROCUSTO').Clear;
         qryDet.FieldByName('IDEMPRESA').Clear;
         qryDet.FieldByName('DESCCCUSTO').Clear;
         lblCentroCusto.Caption := ''
      end;
   end else
   begin
      qryDet.FieldByName('CODCENTROCUSTO').Clear;
      qryDet.FieldByName('IDEMPRESA').Clear;
      qryDet.FieldByName('DESCCCUSTO').Clear;
      lblCentroCusto.Caption := ''
   end;
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.CmeDetalheConfirma(Sender: TObject);
begin
   if qryDet.State in [dsInsert,dsEdit] then
   begin
      if trim(dbeContaContabil.Text) = '' then
      begin
         MsgDlg('Obrigatório Preencher a Conta Contábil','Erro',mtError,[mbOk],0);
         dbeContaContabil.SetFocus;
         exit;
      end else
      begin
         qryDet.FieldByName('IDPESSOA').AsInteger           := Sistema.IdEmpresa;
         qryDet.FieldByName('IDGRUPO').AsInteger            := qryGrupo.FieldByName('IDGRUPO').AsInteger;
         qryDet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger := qryTipoMovimentacao.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
         qryDet.FieldByName('PLANO').AsInteger              := qryPlano.FieldByName('PLANO').AsInteger;
         qryDet.FieldbyName('PLANOME').AsString             := lblDescricaoConta.Caption;
         inherited;
      end;
   end else
      inherited;
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.CmeCadastroBeforeConfirma(Sender: TObject; var Accept: Boolean);
var
   iDeb, iCre : Integer;

begin
   Accept := True;
   //-------------------------------------------------------------------------------------
   if trim(dbcGrupo.Text) = '' then
   begin
      MsgDlg('Obrigatório Preencher o Grupo','Erro',mtError,[mbOk],0);
      dbcGrupo.SetFocus;
      Accept := False;
   end;
   //-------------------------------------------------------------------------------------
   if trim(dbcTipoMovimentacao.Text) = '' then
   begin
      MsgDlg('Obrigatório Preencher o Tipo de Movimento','Erro',mtError,[mbOk],0);
      dbcTipoMovimentacao.SetFocus;
      Accept := False;
   end;
   //-------------------------------------------------------------------------------------
   if qryDet.RecordCount <= 1 then
   begin
      MsgDlg('Obrigatório preencher a partida dobrada!','Erro',mtError,[mbOk],0);
      Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if qryDet.RecordCount = 2 then
   begin
      qryDet.First;
      iDeb := 0;
      iCre := 0;
      while not qryDet.EOF do
      begin
         if qryDet.FieldByName('TIPOLANCAMENTO').AsString = 'D' then
            iDeb := iDeb + 1
         else
            iCre := iCre + 1;
         qryDet.Next;
      end;
      if (iDeb <> 1) or (iCre <> 1) then
      begin
         MsgDlg('Obrigatório preencher a partida dobrada!','Erro',mtError,[mbOk],0);
         Accept := False;
         exit;
      end;
   end else
   //-------------------------------------------------------------------------------------
   if qryDet.RecordCount > 2 then
   begin
      qryDet.First;
      iDeb := 0;
      iCre := 0;
      while not qryDet.EOF do
      begin
         if qryDet.FieldByName('TIPOLANCAMENTO').AsString = 'D' then
         begin
            if iDeb >= 1 then
            begin
               if qryDet.FieldByName('CODCENTROCUSTO').AsString = '' then
               begin
                  MsgDlg('É obrigatório informar o centro de custo para todas as contas contábeis ' +#13+
                         'qdo houver mais que uma conta a débito!', 'Erro', mtError, [mbOk], 0);
                  Accept := False;
                  exit;
               end;
            end else
            begin
               iDeb := iDeb + 1;
            end;
         end else
         if qryDet.FieldByName('TIPOLANCAMENTO').AsString = 'C' then
         begin
            if iCre >= 1 then
            begin
               if qryDet.FieldByName('CODCENTROCUSTO').AsString = '' then
               begin
                  MsgDlg('É obrigatório informar o centro de custo para todas as contas contábeis ' +#13+
                         'qdo houver mais que uma conta a crédito!', 'Erro', mtError, [mbOk], 0);
                  Accept := False;
                  exit;
               end;
            end else
            begin
               iCre := iCre + 1;
            end;
         end;
         qryDet.Next;
      end;
   end;
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.CmeCadastroConfirma(Sender: TObject);
begin
   if qry.State in [dsInsert,dsEdit] then
   begin
      try
         StartTransacao;
         //-------------------------------------------------------------------------------
         if qry.State = dsInsert then
         begin
            qry.FieldByName('IDPESSOA').AsInteger           := Sistema.IdEmpresa;
            qry.FieldByName('IDGRUPO').AsInteger            := qryGrupo.FieldByName('IDGRUPO').AsInteger;
            qry.FieldByName('IDTIPOMOVIMENTACAO').AsInteger := qryTipoMovimentacao.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
         end;
         //-------------------------------------------------------------------------------
         qryDet.First;
         while not qryDet.EOF do
         begin
            if qryDet.FieldByName('IDCONTASTIPOSMOV').IsNull then
            begin
               qryDet.Edit;
               qryDet.FieldByName('IDCONTASTIPOSMOV').AsInteger := LeUltRegistro(nil,'CONTASTIPOSMOVIMENTOGRUPOS');
               qryDet.Post;
            end;
            qryDet.Next;
         end;
         //-------------------------------------------------------------------------------
         qry.ApplyUpdates;
         qryDet.ApplyUpdates;
         //-------------------------------------------------------------------------------
         case CmeCadastro.Operacao of
            opInserir :
               if not Sistema.GravaLogOperacoes('Inclusao de Parametrização Contábil') then
                  raise Exception.Create('Erro ao gravar Log de Operação');
            opAlterar :
               if not Sistema.GravaLogOperacoes('Alteracao de Parametrização Contábil') then
                  raise Exception.Create('Erro ao gravar Log de Operação');
         end;
         //-------------------------------------------------------------------------------
         CommitTransacao;
      except
         RollBackTransacao;
         exit;
      end;
   end else
   begin
      qryDet.ApplyUpdates;
      qry.ApplyUpdates;
      //----------------------------------------------------------------------------------
      case CmeCadastro.Operacao of
         opApagar :
            if not Sistema.GravaLogOperacoes('Remocao de Parametrização Contábil') then
               raise Exception.Create('Erro ao gravar Log de Operação');
      end;
   end;
   inherited;
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if bInsert Then
      SelParamCafXContab(-1,-1,-1);
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   SelParamCafXContab(-1,-1,-1);
end;
//========================================================================================
procedure TfrmCadParamCAFxContab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   dtmAtivoFixo.qryParamCAF.Close;
   dtmAtivoFixo.qryParamCAF.UnPrepare;
   qryGrupo.Close;
   qryTipoMovimentacao.Close;
   qryPlano.Close;
   qryContaContabil.Close;
   qryGrupo.Unprepare;
   qryTipoMovimentacao.Unprepare;
   qryPlano.Unprepare;
   qryContaContabil.Unprepare;
end;

end.
