unit FCadProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TB97, TabControlDetalhe, ExtCtrls, wwdblook, Mask, wwdbedit,
  DBCtrls, TREdit, CMDBLookupCombo, IvDictio, IvMulti,
  IvEMulti, CMProcuraMask, CmEventosCadastro, ImgList;

type
  TfrmCadProduto = class(TfrmCadMestreDetalheCS)
    tbsContab: TTabSheet;
    dbgContab: TwwDBGrid;
    dsContab: TwwDataSource;
    pnlContab: TPanel;
    grpProduto: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    GbProduto: TGroupBox;
    dblkcmbGrupo: TwwDBLookupCombo;
    pnlBloquear: TPanel;
    SbBloqueado: TSpeedButton;
    SbLivre: TSpeedButton;
    Panel3: TPanel;
    grpMedidas: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label24: TLabel;
    dblkCmbUnCompra: TwwDBLookupCombo;
    edDescProd: TwwDBEdit;
    edCodProd: TwwDBEdit;
    rgrpFinalidade: TDBRadioGroup;
    chkLoteValidade: TDBCheckBox;
    RgBloq: TDBRadioGroup;
    tbsDescricao: TTabSheet;
    qryUnidadeMed: TwwQuery;
    dblkCmbMenorUnid: TwwDBLookupCombo;
    dblkCmbUnPrMed: TwwDBLookupCombo;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    updContab: TUpdateSQL;
    qryContab: TwwQuery;
    qryUnidNegoc: TwwQuery;
    dblcUnidade: TwwDBLookupCombo;
    lblUnidade: TLabel;
    dbrFator: TDBRealEdit;
    lblFator: TLabel;
    dbeMenorUn: TwwDBEdit;
    lblMenorUn: TLabel;
    lblCCusto: TLabel;
    dblcCCusto: TwwDBLookupCombo;
    lblAtividade: TLabel;
    dblcAtividade: TwwDBLookupCombo;
    qryCCusto: TwwQuery;
    qrySubConta: TwwQuery;
    qryAux: TwwQuery;
    chkEstocavel: TDBCheckBox;
    cbValeGrupo: TCheckBox;
    tbsImpostos: TTabSheet;
    dbrgIsentoOutros: TDBRadioGroup;
    gbCodigoFiscal: TGroupBox;
    Label3: TLabel;
    lblExplica: TLabel;
    tbsImposto: TTabSheet;
    qryImposto: TwwQuery;
    pnlImposto: TPanel;
    dbgrdImposto: TwwDBGrid;
    dsImposto: TwwDataSource;
    updImposto: TUpdateSQL;
    qryTipoAgre: TwwQuery;
    dblcTipoAgre: TwwDBLookupCombo;
    dsTipoAgre: TwwDataSource;
    lbTipoAgre: TLabel;
    qryEstado: TwwQuery;
    dsEstado: TwwDataSource;
    dblcEstado: TwwDBLookupCombo;
    lblEstado: TLabel;
    dbPercentual: TDBRealEdit;
    Label6: TLabel;
    lblPerc: TLabel;
    dbedBase: TDBRealEdit;
    Label7: TLabel;
    dblcClasFisc: TCMDBLookupCombo;
    qryCalsFisc: TwwQuery;
    qryDetCODPRODUTO: TStringField;
    qryDetCODMEDIDA: TStringField;
    qryDetCODMENORMED: TStringField;
    qryContabCODARTIGO: TStringField;
    qryContabIDARTXCONTAXCC: TFloatField;
    qryContabIDPESSOA: TFloatField;
    qryContabPLANO: TFloatField;
    qryContabUNIDNEGOC: TFloatField;
    qryContabIDEMPRESA: TFloatField;
    qryContabCODCENTROCUSTO: TStringField;
    qryContabCONTAENTRADA: TStringField;
    qryContabSUBCONTAENTRADA: TFloatField;
    qryContabCONTASAIDA: TStringField;
    qryContabSUBCONTASAIDA: TFloatField;
    qryCODPRODUTO: TStringField;
    qryCODGRUPOPROD: TStringField;
    qryCODMEDCUSTO: TStringField;
    qryDESCPROD: TStringField;
    qryCODMEDANALISE: TStringField;
    qryCLASSCONTABIL: TStringField;
    qryCONSUMOREVENDA: TStringField;
    qryCREDITOIMPOSTO: TStringField;
    qryLOTEVALIDADE: TStringField;
    qryTEMCORTAM: TStringField;
    qryITEMESTOCAVEL: TStringField;
    qryDESCRCOMPL: TMemoField;
    qryCODMENORMED: TStringField;
    qryISENTOOUTROS: TStringField;
    qryCODFISCALPADRAO: TStringField;
    qryCODARTIGO: TStringField;
    qryCODPRODUTO_1: TStringField;
    qryCODCOR: TStringField;
    qryCODTAMANHO: TStringField;
    qryCODTIPOARTIGO: TStringField;
    qryEXISTEFT: TStringField;
    qryFLGBLOQUEADO: TStringField;
    qryContabCODGRUPOPROD: TStringField;
    edContaEntrada: TCMProcuraMaskContabil;
    lblSubConta: TLabel;
    dblcSubContaEntrada: TwwDBLookupCombo;
    dblcSubContaSaida: TwwDBLookupCombo;
    Label2: TLabel;
    edContaSaida: TCMProcuraMaskContabil;
    chkVariavel: TDBCheckBox;
    qryFLGVARIAVEL: TStringField;
    Label1: TLabel;
    dblcAlmoxa: TwwDBLookupCombo;
    qryContabCODALMOXARIFADO: TFloatField;
    qryAlmoxa: TwwQuery;
    qryGrupoProd: TwwQuery;
    qryImpostoCODPRODUTO: TStringField;
    qryImpostoCODTIPOCUSTAGREG: TFloatField;
    qryImpostoCODESTADO: TStringField;
    qryImpostoIDPAIS: TFloatField;
    qryImpostoIDPESSOA: TFloatField;
    qryImpostoPERCIMPOSTO: TFloatField;
    qryImpostoPERCBASEIMP: TFloatField;
    qryImpostoDESCCUSTAGREG: TStringField;
    qrySITUACAOTRIB: TFloatField;
    qrySitTrib: TwwQuery;
    qrySitTribSITUACAOTRIB: TFloatField;
    qrySitTribDESCSITUACAOTRIB: TStringField;
    dblcSittrib: TCMDBLookupCombo;
    Label10: TLabel;
    qryDetFATOR: TFloatField;
    dbmDescricaoDet: TDBRichEdit;
    ChkAtivo: TDBCheckBox;
    qryFLGATIVO: TStringField;
    procedure FazerQryPrincipal;
    procedure SelecionaFilhos;
    procedure SbBloqueadoClick(Sender: TObject);
    procedure SbLivreClick(Sender: TObject);
    Function  TestaUnidade(sUnidade:String):Boolean;
    procedure dblkCmbUnPrMedExit(Sender: TObject);
    procedure dblkCmbMenorUnidExit(Sender: TObject);
    procedure dblkCmbUnCompraExit(Sender: TObject);
    procedure edCodProdExit(Sender: TObject);
    Function  TestaConver(sUnidade:String):Boolean;
    Procedure InsereMenorUnid(sCodigo,sMenorUnid:String);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);

    procedure tbcDetalheChange(Sender: TObject);
    procedure dblkcmbGrupoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkCmbUnPrMedEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
   { Public declarations }
    procedure GravarProdutoPadrao; virtual;
    procedure ExcluirProdutoPadrao; virtual;
    procedure TrocaCaption; virtual;
  end;

var
  frmCadProduto: TfrmCadProduto;
  sCodProduto,sGrupoProd:String;
implementation

uses uMensErro,uDataBase, DBaseDados,UModulo,uSistema,
    uIntegraBack,uProduto,uFuncaoGeral;
{$R *.DFM}

procedure TfrmCadProduto.FazerQryPrincipal;
Begin
  qry.Close;
  qry.Params[0].asString := sCodProduto;
  qry.Open;
end;

procedure TfrmCadProduto.SelecionaFilhos;
Begin
  //
  qryDet.Close;
  qryDet.Params[0].asString := sCodProduto;
  qryDet.Open;
  //
  cbValeGrupo.Checked := Modulo.sContabGrupo = 'S';
  //
  qryContab.Close;
  qryContab.SQL.text := 'SELECT '+
                        '     CODARTIGO,   '+
                        '     IDARTXCONTAXCC,  '+
                        '     IDPESSOA,        '+
                        '     PLANO,           '+
                        '     UNIDNEGOC,       '+
                        '     IDEMPRESA,       '+
                        '     CODCENTROCUSTO,  '+
                        '     CONTAENTRADA,    '+
                        '     SUBCONTAENTRADA, '+
                        '     CONTASAIDA,      '+
                        '     SUBCONTASAIDA,   '+
                        '     CODGRUPOPROD,    '+
                        '     CODALMOXARIFADO  '+
                        ' FROM ARTXCONTAXCC WHERE (RTRIM(CODARTIGO) = '''+sCodProduto+''')'+
                        '      AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')';
  qryContab.Open;
  if qryContab.IsEmpty then
  Begin
     qryContab.Close;
     qryContab.SQL.text := 'SELECT '+
                           '     CODARTIGO,   '+
                           '     IDARTXCONTAXCC,  '+
                           '     IDPESSOA,        '+
                           '     PLANO,           '+
                           '     UNIDNEGOC,       '+
                           '     IDEMPRESA,       '+
                           '     CODCENTROCUSTO,  '+
                           '     CONTAENTRADA,    '+
                           '     SUBCONTAENTRADA, '+
                           '     CONTASAIDA,      '+
                           '     SUBCONTASAIDA,   '+
                           '     CODGRUPOPROD,    '+
                           '     CODALMOXARIFADO  '+
                           'FROM ARTXCONTAXCC WHERE (RTRIM(CODGRUPOPROD) = '''+sGrupoProd+''')'+
                           '      AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')';
     qryContab.Open;
     if (not qryContab.IsEmpty) And (Modulo.sContabGrupo = 'S') then
     Begin
        cbValeGrupo.Checked:=True;
     end;
  end
  else
     cbValeGrupo.Checked:=False;

  //
  qryImposto.Close;
  qryImposto.Params[0].AsString  := qry.FieldByName('CodProduto').AsString;
  qryImposto.Params[1].asInteger := Sistema.IdEmpresa;
  qryImposto.Open;
  //
end;

procedure TfrmCadProduto.SbBloqueadoClick(Sender: TObject);
begin
  inherited;
  RgBloq.Enabled:=True;
  qry.FieldByName('FLGBLOQUEADO').AsString:='C';
end;

procedure TfrmCadProduto.SbLivreClick(Sender: TObject);
begin
  inherited;
  qry.FieldByName('FLGBLOQUEADO').AsString:='L';
  RgBloq.Enabled:=False;
end;

procedure TfrmCadProduto.CmeCadastroInsert(Sender: TObject);
Begin
  inherited;
  pnlBloquear.Enabled:=True;
  sCodProduto:='';
  sGrupoProd :='';
  SelecionaFilhos;
  qry.FieldByName('CONSUMOREVENDA').AsString := 'R';
  qry.FieldByName('LOTEVALIDADE').AsString   := 'F';
  qry.FieldByName('ITEMESTOCAVEL').AsString  := 'S';
  qry.FieldByName('FLGVARIAVEL').AsString    := 'N';
  qry.FieldByName('FLGBLOQUEADO').AsString   := 'L';
  qry.FieldByName('FLGATIVO').AsString       := 'S';
  RgBloq.Enabled    := False;
  edCodProd.Enabled := True;
  edCodProd.SetFocus;
end;

procedure TfrmCadProduto.CmeCadastroEdit(Sender: TObject);
Begin
  inherited;
  edCodProd.Enabled   := False;
  pnlBloquear.Enabled := True;
  edDescProd.SetFocus;
end;

procedure TfrmCadProduto.CmeCadastroFind(Sender: TObject);
Begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
     sCodProduto:= trim(MontaSelect.ValoresChave[0]);
     FazerQryPrincipal;
     sGrupoProd := Trim(qry.FieldByName('CODGRUPOPROD').AsString);
     dblkcmbGrupo.LookupValue := sGrupoProd;
     SelecionaFilhos;
     if (qry.FieldByName('FLGBLOQUEADO').AsString = 'L') or (qry.FieldByName('FLGBLOQUEADO').IsNull) Then
     Begin
        SbLivre.Down  :=True;
        RgBloq.Enabled:=False;
     end
     else
     Begin
        SbBloqueado.Down:=True;
        RgBloq.Enabled  :=True;
     end;
  end;
end;

Function TfrmCadProduto.TestaUnidade(sUnidade:String):Boolean;
Begin
  Result:=True;
  qryAux.Close;
  qryAux.SQL.text := 'SELECT CODMEDIDA FROM UNMEDIDA WHERE CODMEDIDA = '''+sUnidade+'''';
  qryAux.Open;
  if qryAux.IsEmpty then
  Begin
     MsgDlg('Unidade de Medida não cadastrada. Verifique','Erro',mtError,[mbOk],0);
     FuncaoGeral.TiraIcone;
     Result:=False;
     exit;
  end;
end;

procedure TfrmCadProduto.dblkCmbUnPrMedExit(Sender: TObject);
begin
  inherited;
  if not TestaUnidade(dblkCmbUnPrMed.Text) then
     dblkCmbUnPrMed.SetFocus;
end;

procedure TfrmCadProduto.dblkCmbMenorUnidExit(Sender: TObject);
begin
  inherited;
  if not TestaUnidade(dblkCmbMenorUnid.Text) then
  Begin
     dblkCmbMenorUnid.SetFocus;
     exit;
  end;
  InsereMenorUnid(sCodProduto,dblkCmbMenorUnid.Text);
end;

procedure TfrmCadProduto.dblkCmbUnCompraExit(Sender: TObject);
begin
  inherited;
  if not TestaUnidade(dblkCmbUnCompra.Text) then
     dblkCmbUnCompra.SetFocus;
end;

procedure TfrmCadProduto.edCodProdExit(Sender: TObject);
begin
  inherited;
  If (qry.state in [dsinsert]) then
  Begin
     if Produto.JaExisteProduto(edCodProd.Text) then
     Begin
        MsgDlg('Já existe um Produto cadastrado com este código. Verifique','Erro',mtError,[mbOk],0);
        FuncaoGeral.TiraIcone;
        edCodProd.SetFocus;
        exit;
     end;
     sCodProduto:= trim(edCodProd.Text);
  end;
end;

Function TfrmCadProduto.TestaConver(sUnidade:String):Boolean;
Begin
  Result:=False;
  qryDet.First;
  While not qryDet.Eof do
  Begin
     if trim(qryDet.FieldByName('CODMEDIDA').AsString) = trim(sUnidade) then
     Begin
        Result:=True;
        exit;
     end;
     qryDet.Next;
  end;
end;

Procedure TfrmCadProduto.InsereMenorUnid(sCodigo,sMenorUnid:String);
Begin
  if not TestaConver(sMenorUnid) then
  Begin
     qryDet.Insert;
     qryDet.FieldByName('CODMEDIDA').AsString   := sMenorUnid;
     qryDet.FieldByName('CODPRODUTO').AsString  := sCodigo;
     qryDet.FieldByName('FATOR').AsFloat        := 1;
     qryDet.FieldByName('CODMENORMED').AsString := dblkCmbMenorUnid.LookupValue;
     qryDet.Post;
  end;
end;

procedure TfrmCadProduto.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  If pgctrlDetalhe.ActivePage.PageIndex = 0 Then
  Begin
     dblcUnidade.SetFocus;
  end;
  if pgctrlDetalhe.ActivePage.PageIndex = 1 then
  Begin
     edContaEntrada.SetFocus;
  end;
  if pgctrlDetalhe.ActivePage.PageIndex = 4 then
  Begin
     dblcTipoAgre.SetFocus;
     dbedBase.Value := 100;
  end;
end;

procedure TfrmCadProduto.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if (qry.State in ([dsInsert,dsEdit])) then
  Begin
     if (pgctrlDetalhe.ActivePage.PageIndex = 0) and (qryDet.State in ([dsInsert,dsEdit])) then
     Begin
        dblcUnidade.SetFocus;
     end;
     if (pgctrlDetalhe.ActivePage.PageIndex = 1)  and (qryContab.State in ([dsInsert,dsEdit])) then
     Begin
       if Modulo.sContabGrupo = 'S' Then
           if qryContab.FieldByName('CODGRUPOPROD').isNull then
              cbValeGrupo.Checked:=False
           else
              cbValeGrupo.Checked:=True;
           edContaEntrada.SetFocus;
     end;
  end;
end;

procedure TfrmCadProduto.CmeDetalheConfirma(Sender: TObject);
begin
     if (pgctrlDetalhe.ActivePage.PageIndex = 0) and (qryDet.State in ([dsInsert,dsEdit])) then
     Begin
        qryDet.FieldByName('CODMENORMED').AsString := dbeMenorUn.Text;
     End
     Else
     if (pgctrlDetalhe.ActivePage.PageIndex = 1) and (qryContab.State in ([dsInsert,dsEdit])) then
     Begin
        if cbValeGrupo.Checked then
           qryContab.FieldByName('CODGRUPOPROD').AsString :=qry.FieldByName('CODGRUPOPROD').AsString
        else
           qryContab.FieldByName('CODGRUPOPROD').Clear;
     end
     Else
     if (pgctrlDetalhe.ActivePage.PageIndex = 4) and (qryImposto.State in ([dsInsert,dsEdit])) then
       Begin
          With qryImposto Do
            Begin
                qryEstado.Locate('CODESTADO',dblcEstado.LookUpValue,[LoPartialKey]);
                FieldByName('DESCCUSTAGREG').asString := Trim(dblcTipoAgre.Text);
                FieldByName('CODPRODUTO').asString    := Trim(edCodProd.Text);
                FieldByName('IDPESSOA').asInteger     := Sistema.IdEmpresa;
                FieldByName('IDPAIS').asInteger       :=  qryEstado.FieldByName('IdPais').asInteger
            End;
       end;
  inherited;
end;

procedure TfrmCadProduto.bbtnConfirmarClick(Sender: TObject);
begin
  if Trim(edCodProd.Text) = '' then
  Begin
     MsgDlg('Obrigatório preencher o código do produto','Erro',mtError,[mbOk],0);
     edCodProd.SetFocus;
     exit;
  end;
  if Trim(edDescProd.Text) = '' then
  Begin
     MsgDlg('Obrigatório preencher a descrição do produto','Erro',mtError,[mbOk],0);
     edDescProd.SetFocus;
     exit;
  end;
  if Trim(dblkcmbGrupo.Text) = '' then
  Begin
     MsgDlg('Obrigatório preencher o grupo do produto','Erro',mtError,[mbOk],0);
     dblkcmbGrupo.SetFocus;
     exit;
  end;
  if Trim(dblkCmbUnPrMed.Text) = '' then
  Begin
     MsgDlg('Obrigatório preencher a Unidade de Custo Médio','Erro',mtError,[mbOk],0);
     dblkCmbUnPrMed.SetFocus;
     exit;
  end;
  if Trim(dblkCmbMenorUnid.Text) = '' then
  Begin
     MsgDlg('Obrigatório preencher a Menor Unidade','Erro',mtError,[mbOk],0);
     dblkCmbMenorUnid.SetFocus;
     exit;
  end;
  if Trim(dblkCmbUnCompra.Text) = '' then
  Begin
     MsgDlg('Obrigatório preencher a Unidade de Compra','Erro',mtError,[mbOk],0);
     dblkCmbUnCompra.SetFocus;
     exit;
  end;
  if not TestaConver(dblkCmbUnPrMed.Text)then
  Begin
     MsgDlg('Obrigatório ter conversão para a Unidade de Custo Médio','Erro',mtError,[mbOk],0);
     dblkCmbUnPrMed.SetFocus;
     exit;
  end;
  if not TestaConver(dblkCmbMenorUnid.Text)then
  Begin
     MsgDlg('Obrigatório ter conversão para a Menor Unidade','Erro',mtError,[mbOk],0);
     dblkCmbMenorUnid.SetFocus;
     exit;
  end;
  if not TestaConver(dblkCmbUnCompra.Text)then
  Begin
     MsgDlg('Obrigatório ter conversão para a Unidade de Compra','Erro',mtError,[mbOk],0);
     dblkCmbUnCompra.SetFocus;
     exit;
  end;
  if (IntegraBack.Contabilidade= 'S') and (qryContab.IsEmpty) then
  Begin
     MsgDlg('Para ter a contabilidade integrada é obrigatório preencher as contas de entrada e saida','Erro',mtError,[mbOk],0);
     edDescProd.SetFocus;
     exit;
  end;
  pnlBloquear.Enabled:=False;
  inherited;
end;

procedure TfrmCadProduto.CmeCadastroConfirma(Sender: TObject);
Begin
  try
     StartTransacao;
     GravarProdutoPadrao;
     CommitTransacao;
     qryDet.CancelUpdates;
     qryContab.CancelUpdates;
     qry.CancelUpdates;
     qryImposto.ApplyUpdates;
     FazerqryPrincipal;
     SelecionaFilhos;
  Except
     RollBackTransacao;
     MsgDlg('Gravação não Efetuada','Erro',mtError,[mbOk],0);
     FuncaoGeral.TiraIcone;
     Raise;
  end;
  TrocaCaption;
end;

procedure TfrmCadProduto.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   if (sCodProduto <> '') and ((sbtnInserir.Down = False) and (sbtnAlterar.Down = False) and
      (sbtnApagar.Down = False) and (sbtnProcurar.Down = False))then
   Begin
      sbtnAlterar.Enabled := True;
      sbtnApagar.Enabled  := True;
   end;
end;

procedure TfrmCadProduto.GravarProdutoPadrao;
var sSqlCampos,sSqlValores:String;
    iArtxContaxCC:LongInt;
    bInclui:Boolean;
Begin
     //Insere Produto
     qryAux.Close;
     qryAux.SQL.Text:='SELECT CODPRODUTO FROM PRODUTO WHERE (CODPRODUTO = '''+sCodProduto+''')';
     qryAux.Open;
     if qryAux.IsEmpty then
     Begin
        sSqlCampos:= 'CODPRODUTO,CODGRUPOPROD,CODMEDANALISE,CODMEDCUSTO,CODMENORMED,'+
                     'DESCPROD,CONSUMOREVENDA,LOTEVALIDADE,ITEMESTOCAVEL,'+
                     'DESCRCOMPL,ISENTOOUTROS,CODFISCALPADRAO,FLGVARIAVEL,SITUACAOTRIB';
        sSqlValores:=''''+sCodProduto+''',';
        sSqlValores:=sSqlValores+''''+qry.FieldByName('CODGRUPOPROD').AsString+''',';
        sSqlValores:=sSqlValores+''''+qry.FieldByName('CODMEDANALISE').AsString+''',';
        sSqlValores:=sSqlValores+''''+qry.FieldByName('CODMEDCUSTO').AsString+''',';
        sSqlValores:=sSqlValores+''''+qry.FieldByName('CODMENORMED').AsString+''',';
        sSqlValores:=sSqlValores+''''+qry.FieldByName('DESCPROD').AsString+''',';
        sSqlValores:=sSqlValores+''''+qry.FieldByName('CONSUMOREVENDA').AsString+''',';
        sSqlValores:=sSqlValores+''''+qry.FieldByName('LOTEVALIDADE').AsString+''',';
        sSqlValores:=sSqlValores+''''+qry.FieldByName('ITEMESTOCAVEL').AsString+''',';
        sSqlValores:=sSqlValores+''''+StringReplace(qry.FieldByName('DESCRCOMPL').AsString, chr(13), '', [rfReplaceAll])+''',';
        sSqlValores:=sSqlValores+''''+qry.FieldByName('ISENTOOUTROS').AsString+''',';
        sSqlValores:=sSqlValores+''''+qry.FieldByName('CODFISCALPADRAO').AsString+''',';
        sSqlValores:=sSqlValores+''''+qry.FieldByName('FLGVARIAVEL').AsString+''',';
        If Not qry.FieldByName('SITUACAOTRIB').IsNull Then
           sSqlValores := sSqlValores+''+qry.FieldByName('SITUACAOTRIB').AsString+''
        Else
           sSqlValores := sSqlValores+' NULL ';
           
        Produto.Insere('PRODUTO',sSqlCampos,sSqlValores);
     end
     else
     Begin
        sSqlCampos:= 'CODPRODUTO = '''+sCodProduto+'''';
        sSqlValores:=' SET CODPRODUTO = '''+sCodProduto+''',';
        sSqlValores:=sSqlValores+' CODGRUPOPROD = '''+qry.FieldByName('CODGRUPOPROD').AsString+''',';
        sSqlValores:=sSqlValores+' CODMEDANALISE = '''+qry.FieldByName('CODMEDANALISE').AsString+''',';
        sSqlValores:=sSqlValores+' CODMEDCUSTO = '''+qry.FieldByName('CODMEDCUSTO').AsString+''',';
        sSqlValores:=sSqlValores+' CODMENORMED = '''+qry.FieldByName('CODMENORMED').AsString+''',';
        sSqlValores:=sSqlValores+' DESCPROD = '''+qry.FieldByName('DESCPROD').AsString+''',';
        sSqlValores:=sSqlValores+' CLASSCONTABIL = '''+qry.FieldByName('CLASSCONTABIL').AsString+''',';
        sSqlValores:=sSqlValores+' CREDITOIMPOSTO = '''+qry.FieldByName('CREDITOIMPOSTO').AsString+''',';
        sSqlValores:=sSqlValores+' TEMCORTAM = '''+qry.FieldByName('TEMCORTAM').AsString+''',';
        sSqlValores:=sSqlValores+' ITEMESTOCAVEL = '''+qry.FieldByName('ITEMESTOCAVEL').AsString+''',';
        sSqlValores:=sSqlValores+' CONSUMOREVENDA = '''+qry.FieldByName('CONSUMOREVENDA').AsString+''',';
        sSqlValores:=sSqlValores+' LOTEVALIDADE = '''+qry.FieldByName('LOTEVALIDADE').AsString+''',';
        sSqlValores:=sSqlValores+' DESCRCOMPL = '''+StringReplace(qry.FieldByName('DESCRCOMPL').AsString, chr(13), '', [rfReplaceAll])+''',';
        sSqlValores:=sSqlValores+' ISENTOOUTROS = '''+qry.FieldByName('ISENTOOUTROS').AsString+''',';
        sSqlValores:=sSqlValores+' CODFISCALPADRAO = '''+qry.FieldByName('CODFISCALPADRAO').AsString+''',';
        sSqlValores:=sSqlValores+' FLGVARIAVEL = '''+qry.FieldByName('FLGVARIAVEL').AsString+''',';
        If Not qry.FieldByName('SITUACAOTRIB').IsNull Then
           sSqlValores:=sSqlValores+' SITUACAOTRIB = '+qry.FieldByName('SITUACAOTRIB').AsString
        Else
           sSqlValores:=sSqlValores+' SITUACAOTRIB = NULL ';

        Produto.Altera('PRODUTO',sSqlValores,sSqlCampos);
     end;
     //Insere Artigo = Produto
     qryAux.Close;
     qryAux.SQL.Text:='SELECT CODARTIGO FROM ARTIGO WHERE (CODARTIGO = '''+sCodProduto+''')';
     qryAux.Open;
     if qryAux.IsEmpty then
     Begin
        sSqlCampos:= 'CODARTIGO,CODPRODUTO,CODTIPOARTIGO,FLGBLOQUEADO,FLGATIVO';
        sSqlValores:=''''+sCodProduto+''',';
        sSqlValores:=sSqlValores+''''+sCodProduto+''',';
        sSqlValores:=sSqlValores+''''+Modulo.sTipoArtigo+''',';
        sSqlValores:=sSqlValores+''''+qry.FieldByName('FLGBLOQUEADO').AsString+''',';
        sSqlValores:=sSqlValores+''''+qry.FieldByName('FLGATIVO').AsString+'''';
        Produto.Insere('ARTIGO',sSqlCampos,sSqlValores);
     end
     else
     Begin
        sSqlCampos:= 'CODARTIGO = '''+sCodProduto+'''';
        sSqlValores:='SET CODTIPOARTIGO = '''+Modulo.sTipoArtigo+''',';
        sSqlValores:=sSqlValores+' FLGBLOQUEADO = '''+qry.FieldByName('FLGBLOQUEADO').AsString+''',';
        sSqlValores:=sSqlValores+' FLGATIVO = '''+qry.FieldByName('FLGATIVO').AsString+'''';
        Produto.Altera('ARTIGO',sSqlValores,sSqlCampos);
     end;
     //Insere as conversoes das Unidades de Medida
     QryDet.First;
     While Not qryDet.EOF Do
       Begin
          qryDet.Edit;
          qryDet.FieldByName('CODPRODUTO').asString := qry.FieldByName('CODPRODUTO').asString;
          qryDet.Next;
       End;
     qryDet.ApplyUpdates;
     //Deleta Contabilização
     qryAux.Close;
     qryAux.SQL.Text:='DELETE  ARTXCONTAXCC WHERE '+
                      '(CODARTIGO = '''+sCodProduto+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')';
     qryAux.ExecSQL;
     if cbValeGrupo.Checked then begin
        qryAux.Close;
        qryAux.SQL.Text:='DELETE ARTXCONTAXCC WHERE '+
                         '(CODGRUPOPROD = '''+dblkcmbGrupo.LookupValue+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')';
        qryAux.ExecSQL;
     end;
     //Insere Contabilização
     qryContab.First;
     While not qryContab.EOF do
     Begin
        if Modulo.sContabGrupo = 'N' then
           begin
              qryContab.Edit;
              qryContab.FieldByName('CODGRUPOPROD').Clear;
              qryContab.Post;
           end;
        bInclui := True;
        qryAux.Close;
        if qryContab.FieldByName('CODALMOXARIFADO').IsNull then begin
           if qryContab.FieldByName('CODCENTROCUSTO').IsNull then
              qryAux.SQL.Text:='SELECT IDARTXCONTAXCC FROM ARTXCONTAXCC WHERE '+
                               '(CODARTIGO = '''+sCodProduto+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
                               ' AND (CODCENTROCUSTO IS NULL) '+
                               ' AND (CODALMOXARIFADO IS NULL) '
           else
              qryAux.SQL.Text:='SELECT IDARTXCONTAXCC FROM ARTXCONTAXCC WHERE '+
                               '(CODARTIGO = '''+sCodProduto+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
                               ' AND (CODCENTROCUSTO = '''+qryContab.FieldByName('CODCENTROCUSTO').AsString+''')'+
                               ' AND (CODALMOXARIFADO IS NULL) ';
        end else begin
           if qryContab.FieldByName('CODCENTROCUSTO').IsNull then
              qryAux.SQL.Text:='SELECT IDARTXCONTAXCC FROM ARTXCONTAXCC WHERE '+
                               '(CODARTIGO = '''+sCodProduto+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
                               ' AND (CODCENTROCUSTO IS NULL) '+
                               ' AND (CODALMOXARIFADO = '+qryContab.FieldByName('CODALMOXARIFADO').AsString+') '
           else
              qryAux.SQL.Text:='SELECT IDARTXCONTAXCC FROM ARTXCONTAXCC WHERE '+
                               '(CODARTIGO = '''+sCodProduto+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
                               ' AND (CODCENTROCUSTO = '''+qryContab.FieldByName('CODCENTROCUSTO').AsString+''')'+
                               ' AND (CODALMOXARIFADO = '+qryContab.FieldByName('CODALMOXARIFADO').AsString+') ';
        end;
        qryAux.Open;
        if qryAux.IsEmpty then
        Begin
           if not qryContab.FieldByName('CODGRUPOPROD').IsNull then
           Begin
              qryAux.Close;
              if qryContab.FieldByName('CODALMOXARIFADO').IsNull then begin
                 if qryContab.FieldByName('CODCENTROCUSTO').IsNull then
                    qryAux.SQL.Text:='SELECT IDARTXCONTAXCC FROM ARTXCONTAXCC WHERE '+
                                     '(CODGRUPOPROD = '''+qryContab.FieldByName('CODGRUPOPROD').AsString+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
                                     ' AND (CODCENTROCUSTO IS NULL)'+
                                     ' AND (CODALMOXARIFADO IS NULL) '
                 else
                    qryAux.SQL.Text:='SELECT IDARTXCONTAXCC FROM ARTXCONTAXCC WHERE '+
                                     '(CODGRUPOPROD = '''+qryContab.FieldByName('CODGRUPOPROD').AsString+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
                                     ' AND (CODCENTROCUSTO = '''+qryContab.FieldByName('CODCENTROCUSTO').AsString+''')'+
                                     ' AND (CODALMOXARIFADO IS NULL) ';
              end else begin
                 if qryContab.FieldByName('CODCENTROCUSTO').IsNull then
                    qryAux.SQL.Text:='SELECT IDARTXCONTAXCC FROM ARTXCONTAXCC WHERE '+
                                     '(CODGRUPOPROD = '''+qryContab.FieldByName('CODGRUPOPROD').AsString+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
                                     ' AND (CODCENTROCUSTO IS NULL)'+
                                     ' AND (CODALMOXARIFADO = '+qryContab.FieldByName('CODALMOXARIFADO').AsString+') '
                 else
                    qryAux.SQL.Text:='SELECT IDARTXCONTAXCC FROM ARTXCONTAXCC WHERE '+
                                     '(CODGRUPOPROD = '''+qryContab.FieldByName('CODGRUPOPROD').AsString+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
                                     ' AND (CODCENTROCUSTO = '''+qryContab.FieldByName('CODCENTROCUSTO').AsString+''')'+
                                     ' AND (CODALMOXARIFADO = '+qryContab.FieldByName('CODALMOXARIFADO').AsString+') ';
              end;
              qryAux.Open;
              if not qryAux.IsEmpty then
                 bInclui:=False;
           end;
        end
        else
           bInclui:=False;
        if bInclui then
        Begin
           iArtxContaxCC := LeUltRegistro(nil,'ARTXCONTAXCC');
           sSqlCampos:= 'IDARTXCONTAXCC,IDPESSOA,CODARTIGO,CODGRUPOPROD,IDEMPRESA,CODCENTROCUSTO,CODALMOXARIFADO,PLANO,'+
                        'UNIDNEGOC,CONTAENTRADA,SUBCONTAENTRADA,CONTASAIDA,SUBCONTASAIDA';
           sSqlValores:=IntToStr(iArtxContaxCC)+',';
           sSqlValores:=sSqlValores+IntToStr(Sistema.IdEmpresa)+',';
           if qryContab.FieldByName('CODGRUPOPROD').IsNull then
           Begin
              sSqlValores:=sSqlValores+''''+sCodProduto+''',';
              sSqlValores:=sSqlValores+'NULL,';
           end
           else
           Begin
              sSqlValores:=sSqlValores+'NULL,';
              sSqlValores:=sSqlValores+''''+qryContab.FieldByName('CODGRUPOPROD').AsString+''',';
           end;
           if qryContab.FieldByName('CODCENTROCUSTO').IsNull then
           Begin
              sSqlValores:=sSqlValores+'NULL,';
              sSqlValores:=sSqlValores+'NULL,';
           end
           else
           Begin
              sSqlValores:=sSqlValores+IntToStr(Sistema.IdEmpresa)+',';
              sSqlValores:=sSqlValores+''''+qryContab.FieldByName('CODCENTROCUSTO').AsString+''',';
           end;
           if qryContab.FieldByName('CODALMOXARIFADO').IsNull then
           Begin
              sSqlValores:=sSqlValores+'NULL,';
           end
           else
           Begin
              sSqlValores:=sSqlValores+qryContab.FieldByName('CODALMOXARIFADO').AsString+',';
           end;
           sSqlValores:=sSqlValores+IntToStr(IntegraBack.Plano)+',';
           sSqlValores:=sSqlValores+qryContab.FieldByName('UNIDNEGOC').AsString+',';
           sSqlValores:=sSqlValores+''''+qryContab.FieldByName('CONTAENTRADA').AsString+''',';
           if qryContab.FieldByName('SUBCONTAENTRADA').IsNull then
              sSqlValores:=sSqlValores+'NULL,'
           else
              sSqlValores:=sSqlValores+qryContab.FieldByName('SUBCONTAENTRADA').AsString+',';
           sSqlValores:=sSqlValores+''''+qryContab.FieldByName('CONTASAIDA').AsString+''',';
           if qryContab.FieldByName('SUBCONTASAIDA').IsNull then
              sSqlValores:=sSqlValores+'NULL'
           else
              sSqlValores:=sSqlValores+qryContab.FieldByName('SUBCONTASAIDA').AsString;
           Produto.Insere('ARTXCONTAXCC',sSqlCampos,sSqlValores);
        end
        else
        Begin
           iArtxContaxCC := qryAux.FieldByName('IDARTXCONTAXCC').AsInteger;
           sSqlCampos:=' IDARTXCONTAXCC = '+IntToStr(iArtxContaxCC);
           sSqlValores:=' SET IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+',';
           if qryContab.FieldByName('CODGRUPOPROD').IsNull then
           Begin
              sSqlValores:=sSqlValores+' CODARTIGO = '''+sCodProduto+''',';
              sSqlValores:=sSqlValores+' CODGRUPOPROD = NULL,';
           end
           else
           Begin
              sSqlValores:=sSqlValores+' CODARTIGO = NULL,';
              sSqlValores:=sSqlValores+' CODGRUPOPROD = '''+qryContab.FieldByName('CODGRUPOPROD').AsString+''',';
           end;
           if qryContab.FieldByName('CODCENTROCUSTO').IsNull then
           Begin
              sSqlValores:=sSqlValores+' IDEMPRESA = NULL,';
              sSqlValores:=sSqlValores+'CODCENTROCUSTO = NULL,';
           end
           else
           Begin
              sSqlValores:=sSqlValores+' IDEMPRESA = '+IntToStr(Sistema.IdEmpresa)+',';
              sSqlValores:=sSqlValores+' CODCENTROCUSTO = '''+qryContab.FieldByName('CODCENTROCUSTO').AsString+''',';
           end;
           sSqlValores:=sSqlValores+' PLANO = '+IntToStr(IntegraBack.Plano)+',';
           sSqlValores:=sSqlValores+' UNIDNEGOC = '+qryContab.FieldByName('UNIDNEGOC').AsString+',';
           sSqlValores:=sSqlValores+'CONTAENTRADA = '''+qryContab.FieldByName('CONTAENTRADA').AsString+''',';
           if qryContab.FieldByName('SUBCONTAENTRADA').IsNull then
              sSqlValores:=sSqlValores+' SUBCONTAENTRADA = NULL,'
           else
              sSqlValores:=sSqlValores+' SUBCONTAENTRADA = '+qryContab.FieldByName('SUBCONTAENTRADA').AsString+',';
           sSqlValores:=sSqlValores+' CONTASAIDA = '''+qryContab.FieldByName('CONTASAIDA').AsString+''',';
           if qryContab.FieldByName('SUBCONTASAIDA').IsNull then
              sSqlValores:=sSqlValores+'SUBCONTASAIDA = NULL'
           else
              sSqlValores:=sSqlValores+'SUBCONTASAIDA = '+qryContab.FieldByName('SUBCONTASAIDA').AsString;
           Produto.Altera('ARTXCONTAXCC',sSqlValores,sSqlCampos);
        end;
        qryContab.Next;
     end;
end;

procedure TfrmCadProduto.ExcluirProdutoPadrao;
var sSqlCampos:String;
Begin
  //Exclui Contabilização
   sSqlCampos:='(CODARTIGO = '''+sCodProduto+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')';
   Produto.Exclui('ARTXCONTAXCC',sSqlCampos);
  //Exclui conversoes deste produto

   sSqlCampos:= '(CODPRODUTO = '''+sCodProduto+''')';
   Produto.Exclui('CONVER',sSqlCampos);
  //Exclui todos os Artigos deste Produto
   sSqlCampos:= '(CODPRODUTO = '''+sCodProduto+''')';
   Produto.Exclui('ARTIGO',sSqlCampos);
  //Exclui Impostos
   sSqlCampos:= '(CODPRODUTO = '''+sCodProduto+''')';
   Produto.Exclui('IMPOSTOSXPRODUTOS',sSqlCampos);
  //Exclui Produto
   sSqlCampos:= '(CODPRODUTO = '''+sCodProduto+''')';
   Produto.Exclui('PRODUTO',sSqlCampos);
   FazerqryPrincipal;
   SelecionaFilhos;
end;

procedure TfrmCadProduto.bbtnCancelarClick(Sender: TObject);
begin
  pnlBloquear.Enabled:=False;
  inherited;
end;

procedure TfrmCadProduto.CmeCadastroDelete(Sender: TObject);
Begin
  try
     StartTransacao;
     ExcluirProdutoPadrao;
     CommitTransacao;
  Except
     RollBackTransacao;
     MsgDlg('Exclusão não Efetuada','Erro',mtError,[mbOk],0);
     FuncaoGeral.TiraIcone;
     Raise;
  end;
end;

procedure TfrmCadProduto.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  if (IntegraBack.Contabilidade<> 'S') then
  Begin
      if tbcDetalhe.TabIndex = 1 then
      Begin
         pgctrlDetalhe.ActivePage:=tbsDet;
         tbcDetalhe.TabIndex:=0;
      end;
  end;
end;

procedure TfrmCadProduto.dblkcmbGrupoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified and (trim(dblkcmbGrupo.text) <> '') then
  begin
     if cbValeGrupo.Checked then
     Begin
        qryContab.First;
        While not qryContab.EOF do
           qryContab.Delete;
     end;
     if qryContab.IsEmpty then
     Begin
        qryContab.Close;
        qryContab.SQL.text := 'SELECT * FROM ARTXCONTAXCC '+
                              'WHERE (CODGRUPOPROD = '''+dblkcmbGrupo.LookupValue+''') AND '+
                              '      (IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')';
        qryContab.Open;
     end;
  end;
end;

procedure TfrmCadProduto.bbtnOkDetClick(Sender: TObject);
begin
 if (qry.State in ([dsInsert,dsEdit])) then
  Begin
     if (pgctrlDetalhe.ActivePage.PageIndex = 0) and (qryDet.State in ([dsInsert,dsEdit])) then
     Begin
        if trim(dblcUnidade.Text) = '' then
        begin
           MsgDlg('Obrigatório preencher a Unidade','Erro',mtError,[mbOk],0);
           dblcUnidade.SetFocus;
           exit;
        end;
        if dbrFator.Value = 0 then
        begin
           MsgDlg('Obrigatório preencher o Fator de Conversão','Erro',mtError,[mbOk],0);
           dbrFator.SetFocus;
           exit;
        end;
        if (trim(dblcUnidade.Text) = trim(dblkCmbMenorUnid.Text)) and (dbrFator.Value <> 1) then
        Begin
           MsgDlg('Fator de Conversão da menor unidade deve ser obrigatoriamente igual a 1','Erro',mtError,[mbOk],0);
           dbrFator.SetFocus;
           exit;
        end;
     end;
     if (pgctrlDetalhe.ActivePage.PageIndex = 1) and (qryContab.State in ([dsInsert,dsEdit])) then
     Begin
        if trim(edContaEntrada.Conta.Numero) = '' then
        begin
           MsgDlg('Obrigatório preencher a Conta Contábil de Entrada','Erro',mtError,[mbOk],0);
           edContaEntrada.SetFocus;
           exit;
        end;
        if trim(edContaSaida.Conta.Numero) = '' then
        begin
           MsgDlg('Obrigatório preencher a Conta Contábil de Saida','Erro',mtError,[mbOk],0);
           edContaSaida.SetFocus;
           exit;
        end;
        if trim(dblcAtividade.Text) = '' then
        begin
           MsgDlg('Obrigatório preencher a Atividade','Erro',mtError,[mbOk],0);
           dblcAtividade.SetFocus;
           exit;
        end;
      end;
   if (pgctrlDetalhe.ActivePage.PageIndex = 4) and (qryImposto.State in ([dsInsert,dsEdit])) then
       Begin
          if trim(dblcTipoAgre.Text) = '' then
              begin
                 MsgDlg('Obrigatório preencher o Imposto','Erro',mtError,[mbOk],0);
                 dblcTipoAgre.SetFocus;
                 exit;
              end;
          if trim(dblcEstado.Text) = '' then
              begin
                 MsgDlg('Obrigatório preencher o Estado','Erro',mtError,[mbOk],0);
                 dblcEstado.SetFocus;
                 exit;
              end;
          if trim(edCodProd.Text) = '' then
              begin
                 MsgDlg('Obrigatório preencher o Codigo do produto','Erro',mtError,[mbOk],0);
                 edCodProd.SetFocus;
                 exit;
              end;
           if dbPercentual.Value = 0 then
              begin
                 MsgDlg('Obrigatório preencher o Percentual','Erro',mtError,[mbOk],0);
                 dbPercentual.SetFocus;
                 exit;
              end;
           if dbedBase.Value = 0 then
              begin
                 MsgDlg('Obrigatório preencher a Base de Cálculo','Erro',mtError,[mbOk],0);
                 dbedBase.SetFocus;
                 exit;
              end;
         end;
  End;
  inherited;
end;

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  //
  MontaSelect.Filtro.Add('ARTIGO.CODTIPOARTIGO = '''+Modulo.sTipoArtigo+'''');
  //
  pnlBloquear.Enabled:=False;
  //
  sCodProduto:='';
  sGrupoProd :='';
  FazerQryPrincipal;
  SelecionaFilhos;
  //
  if (IntegraBack.Contabilidade= 'S') then
  Begin
     tbsContab.Enabled := True;
     //
     edContaEntrada.Mascara := Trim(IntegraBack.MascaraPlano);
     edContaEntrada.Plano   := IntegraBack.Plano;
     edContaSaida.Mascara   := Trim(IntegraBack.MascaraPlano);
     edContaSaida.Plano     := IntegraBack.Plano;
     //
     qrySubConta.Close;
     qrySubConta.Params[0].Value := Sistema.idempresa;
     qrySubConta.Open;
     //
     qryUnidNegoc.Close;
     qryUnidNegoc.Params[0].Value := Sistema.idempresa;
     qryUnidNegoc.Open;
     //
     qryAlmoxa.Close;
     qryAlmoxa.Params[0].Value := Sistema.idempresa;
     qryAlmoxa.Open;
     //
     qryCCusto.Close;
     qryCCusto.Params[0].Value := Sistema.idempresa;
     qryCCusto.Open;
  end
  else
     tbsContab.Enabled := False;
 //
 qryImposto.Close;
 qryImposto.Params[0].AsString  := '';
 qryImposto.Params[1].asInteger :=
  0;
 qryImposto.Open;
 //
 qryTipoAgre.Open;
 qryEstado.Open;
end;

procedure TfrmCadProduto.dblkCmbUnPrMedEnter(Sender: TObject);
begin
  inherited;
  If Modulo.ExistMov(edCodProd.Text) Then
    Begin
       MsgDlg('Este produto já possui movimentação. Não poder ser alterado o custo médio','Atenção',mtWarning,[mbOk],0);
       dblkCmbMenorUnid.SetFocus;
    End;
end;

procedure TfrmCadProduto.TrocaCaption;
Begin
        If FazQuery(DtmBaseDados.qry,'  SELECT P.CODPRODUTO '+
                                     '  FROM '+
                                     '      ARTIGO A, '+
                                     '      PRODUTO P, '+
                                     '      ( SELECT MAX(TRGDTINCLUSAO) AS MAXDATA '+
                                     '        FROM ARTIGO '+
                                     '        WHERE (CODTIPOARTIGO = '+Modulo.sTipoArtigo+') '+
                                     '      ) MAX '+
                                     '  WHERE '+
                                     '      (A.TRGDTINCLUSAO = MAX.MAXDATA) '+
                                     '  AND (A.CODPRODUTO = P.CODPRODUTO) ')
        Then
            Caption := Format(Copy(Caption,1,Pos('-',Caption)-1)+'- Último [ %s ]',[DtmBaseDados.qry.fieldByName('CODPRODUTO').asString])
        Else
            Caption := Format(Copy(Caption,1,Pos('-',Caption)-1),['']);

End;
procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;
  TrocaCaption;
end;

procedure TfrmCadProduto.FormActivate(Sender: TObject);
begin
  inherited;
  if Modulo.sContabTransf = 'S' then
     dblcAlmoxa.Enabled := True 
  else
     dblcAlmoxa.Enabled := False;
end;

end.
