{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMBack50 - Cad Forne       }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Cadastro de Fornecedor / Favorecido                 }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 13/06/2001                             }
{                                                       }
{*******************************************************}

unit FCadForne;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Menus, MontaSelect, DBTables, Db, CMwwQuery, Wwdatsrc,
  Pessoa, TB97, MAHlpBtn, StdCtrls, Buttons, checklst, Grids, uCMTypes,  
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, wwdblook, DBCtrls, Mask,
  wwdbedit, ExtDlgs, TB97Ctls, TB97Tlbr, uIntegraBack,
  IvDictio, IvMulti, IvEMulti, CMProcuraMask, CMDBLookupCombo, Wwdbspin,
  CmEventosCadastro, ImgList, wwdbdatetimepicker, CMDateTimePicker,
  ExtCtrls, Wwquery, TREdit;

type
  TfrmCadForne = class(TfrmPessoa)
    TabSheet1: TTabSheet;
    PnlGeral: TPanel;
    qryBanco: TwwQuery;
    qrySubConta: TwwQuery;
    qryFornxRamo: TwwQuery;
    qryEmpresaForn: TwwQuery;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    updEmpresaForn: TUpdateSQL;
    qryContaBancaria: TwwQuery;
    updContaBancaria: TUpdateSQL;
    RamoFor: TTabSheet;
    updRamoFor: TUpdateSQL;
    qryRamoFornecedor: TwwQuery;
    dsFornxRamo: TwwDataSource;
    dsRamoFornecedor: TwwDataSource;
    updFornxRamo: TUpdateSQL;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    spdDesembxForn: TSpeedButton;
    spdDesembForn: TSpeedButton;
    dbDesembolso: TwwDBGrid;
    dbgrDesembForn: TwwDBGrid;
    qryDesembxForn: TwwQuery;
    dsDesembxForn: TwwDataSource;
    updDesembxForn: TUpdateSQL;
    qryDesembolso: TwwQuery;
    updDesembolso: TUpdateSQL;
    dsDesembolso: TwwDataSource;
    qryNaturezaRend: TwwQuery;
    qryccusto: TwwQuery;
    qryccustoCODCENTROCUSTO: TStringField;
    qryccustoNOME: TStringField;
    CMwwQuery1: TwwQuery;
    StringField5: TStringField;
    qryEmpresaFornCODCENTROCUSTO: TStringField;
    DsEmpresaForn: TwwDataSource;
    DsContaBancaria: TwwDataSource;
    pnlRamoFor: TPanel;
    spdFornxRamo: TSpeedButton;
    spdRamosForn: TSpeedButton;
    dbRamos: TwwDBGrid;
    dbFornxRamo: TwwDBGrid;
    PnlTitDesembAssoc: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    TabSheet3: TTabSheet;
    QryImpAgreg: TwwQuery;
    UpdImpAgreg: TUpdateSQL;
    DsImpAgreg: TwwDataSource;
    QryImpAgregxForn: TwwQuery;
    UpdImpAgregxForn: TUpdateSQL;
    DsImpAgregxForn: TwwDataSource;
    QryImpAgregDESCCUSTAGREG: TStringField;
    QryImpAgregxFornDESCCUSTAGREG: TStringField;
    QryImpAgregxFornIDPESSOA: TFloatField;
    QryImpAgregxFornIDFORCLI: TFloatField;
    QryImpAgregxFornCODTIPOCUSTAGREG: TFloatField;
    qryRamoFornecedorIDRAMOFORNECEDOR: TFloatField;
    qryRamoFornecedorDESCRAMOFORNECEDOR: TStringField;
    qryDesembolsoCODTIPRECDES: TStringField;
    qryDesembolsoRECPAG: TStringField;
    qryDesembolsoIDPESSOA: TFloatField;
    qryDesembolsoDESCRICAO: TStringField;
    qryDesembolsoANASINT: TStringField;
    qryFornxRamoIDPESSOA: TFloatField;
    qryFornxRamoIDRAMOFORNECEDOR: TFloatField;
    qryFornxRamoDESCRAMOFORNECEDOR: TStringField;
    qryDesembxFornIDFORNXDESEMB: TFloatField;
    qryDesembxFornCODTIPRECDES: TStringField;
    qryDesembxFornRECPAG: TStringField;
    qryDesembxFornIDPESSOA: TFloatField;
    qryDesembxFornIDEMPRESAPROP: TFloatField;
    qryDesembxFornDESCRICAO: TStringField;
    qryDesembxFornANASINT: TStringField;
    QryImpAgregCODTIPOCUSTAGREG: TFloatField;
    qrySubTipoIDPESSOA: TFloatField;
    qrySubTipoFLGASS: TFloatField;
    qrySubTipoCODNATUREZA: TStringField;
    qrySubTipoNUMDEPENDENTES: TFloatField;
    qryEmpresaFornIDFORCLI: TFloatField;
    qryEmpresaFornCONTACADIANTAMENTO: TStringField;
    qryEmpresaFornCONTACDESPESA: TStringField;
    qryEmpresaFornCONTACFORN: TStringField;
    QryClassiFiscal: TwwQuery;
    QryClassiFiscalIDCLASFISCLIFOR: TFloatField;
    QryClassiFiscalCODREDUZIDO: TStringField;
    qrySubTipoIDCLASFISCLIFOR: TFloatField;
    QryClassiFiscalDESCCLASFISCLIFOR: TStringField;
    QryImpAgregxFornRECPAG: TStringField;
    qryContaBancariaIDCBANCARIA: TFloatField;
    qryContaBancariaIDPESSOA: TFloatField;
    qryContaBancariaIDAGENCIA: TFloatField;
    qryContaBancariaCONTACORRENTE: TStringField;
    qryContaBancariaFLGCONTAPREF: TFloatField;
    qryContaBancariaTIPOCONTA: TStringField;
    qryContaBancariaNUMAGENCIA: TStringField;
    qryContaBancariaIDBANCO: TFloatField;
    qryBancoIDPESSOA: TFloatField;
    qryBancoNUMBANCO: TStringField;
    qryBancoRAZAOSOCIAL: TStringField;
    QryBuscaAgencia: TwwQuery;
    QryBuscaAgenciaIDPESSOA: TFloatField;
    QryInserePessoa: TwwQuery;
    QryInsereAgencia: TwwQuery;
    MsBanco: TMontaSelect;
    GpbContabil: TPanel;
    Panel5: TPanel;
    Label20: TLabel;
    Label26: TLabel;
    dblkSubconta: TwwDBLookupCombo;
    dblcCCusto: TwwDBLookupCombo;
    CContabil: TCMProcuraMaskContabil;
    CContabil1: TCMProcuraMaskContabil;
    CContabil2: TCMProcuraMaskContabil;
    QryUnidNegoc: TwwQuery;
    QryUnidNegocNOME: TStringField;
    QryUnidNegocUNIDNEGOC: TFloatField;
    DbLcUnidNegoc: TwwDBLookupCombo;
    Label4: TLabel;
    qryEmpresaFornUNIDNEGOC: TFloatField;
    qryBancoMASCARACC: TStringField;
    qryBancoMASCARAAGENCIA: TStringField;
    qryBancoFLGVALIDACC: TStringField;
    LblNatuRend_Padrao: TLabel;
    dblkNaturezaRend: TwwDBLookupCombo;
    Label2: TLabel;
    wwDBSpinEdit1: TwwDBSpinEdit;
    LblClasFis_Padrao: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    LblCodCorresp_Padrao: TLabel;
    wwDBEdit2: TwwDBEdit;
    qryEmpresaFornCODCORRESP: TStringField;
    TbsContaBancaria_Padrao: TTabSheet;
    PnlDadosBancarios_Padrao: TPanel;
    Label14: TLabel;
    Label18: TLabel;
    DbeAgencia: TwwDBEdit;
    SpeedButton2: TSpeedButton;
    Label15: TLabel;
    dbedConta: TwwDBEdit;
    RgTipoConta: TDBRadioGroup;
    ChbContaPref_Padrao: TDBCheckBox;
    qryContaBancariaNOMEBANCO: TStringField;
    qryContaBancariaNUMBANCO: TStringField;
    GrdContaBancaria_Padrao: TwwDBGrid;
    qrySubTipoCODCORRESP: TStringField;
    qryEmpresaFornFLGSTATUS: TStringField;
    DBRadioGroup2: TDBRadioGroup;
    dblkBanco: TwwDBLookupCombo;
    qryContaBancariaCONTAFORMAT: TStringField;
    qryContaBancariaAGENCIAFORMAT: TStringField;
    QryBuscaMask: TwwQuery;
    QryBuscaMaskMASCARACC: TStringField;
    QryBuscaMaskMASCARAAGENCIA: TStringField;
    ppmCaixa: TPopupMenu;
    N001ContaCorrente1: TMenuItem;
    N002ContaCadernete1: TMenuItem;
    N003ContadePessoaJurdica1: TMenuItem;
    N004DepsitoJudicial1: TMenuItem;
    N635DepsitoJudicialIR1: TMenuItem;
    N013ContadePoupana1: TMenuItem;
    N022ContaCadernetedePoupanaPessoaJurdica1: TMenuItem;
    pnlImpostos: TPanel;
    wwDBGrid2: TwwDBGrid;
    Panel10: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel9: TPanel;
    SbtImpAddAgreg: TSpeedButton;
    SbtImpDelAgreg: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure qrySubTipoAfterScroll(DataSet: TDataSet);
    procedure spdFornxRamoClick(Sender: TObject);
    procedure spdRamosFornClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure spdDesembxFornClick(Sender: TObject);
    procedure spdDesembFornClick(Sender: TObject);
    procedure CContabilExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SbtImpAddAgregClick(Sender: TObject);
    procedure SbtImpDelAgregClick(Sender: TObject);
    procedure dbDesembolsoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);

    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure PessoaSaveSubtipo(Sender: TObject);
    procedure PessoaChangeSubtipo(IdPessoa: Integer);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dblkBancoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure qryContaBancariaCalcFields(DataSet: TDataSet);
    procedure RgTipoContaClick(Sender: TObject);
    procedure dbedContaEnter(Sender: TObject);
    procedure N001ContaCorrente1Click(Sender: TObject);
  private
    lDelete, lIdPessoa, lFornRamo, lFornDesemb, lImpostos: Integer;
    sMascaraNumAgencia :String;
    bDeleteDetalhe :Boolean;
    procedure HabilitaGeral(lTrue:Boolean);
    procedure LimpaGeral;
    procedure FazerQryCCusto;
    procedure AbreQryRamoDesembImp(iPessoa:Integer);
    function BusacaIdAgencia(idBanco :LongInt; sNumAgencia: String): LongInt;
    procedure SetaMascaraAgencia;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadForne: TfrmCadForne;

implementation

{$R *.DFM}

Uses UAutorizacao,UMensErro, DBaseDados, UDataBase, USistema, uFuncaoGeral,
     uCalcDv, dCmBack, dDadosBancarios;

procedure TfrmCadForne.FormCreate(Sender: TObject);
begin
  inherited;
  If IsDb2_Padrao Then
  Begin
    QryBuscaAgencia.Close;
    QryBuscaAgencia.Sql.Text :=
    'SELECT A.IDPESSOA FROM AGENCIABANCARIA A WHERE ( A.IDBANCO =:IDBANCO ) AND ( A.NUMAGENCIA = :NUMAGENCIA )'
  End;

  bDeleteDetalhe := False;

  If Sistema.SoUpperPessoa Then
  Begin
     MontaSelect.SensivelACaixa[0] := 'S';
     MontaSelect.SensivelACaixa[1] := 'S';
  End
  Else
  Begin
     MontaSelect.SensivelACaixa[0] := 'N';
     MontaSelect.SensivelACaixa[1] := 'N';
  End;

  If QryBanco.Active Then QryBanco.Close;
  QryBanco.Open;

  If QryUnidNegoc.Active Then QryUnidNegoc.Close;
  QryUnidNegoc.ParamByname('IDPESSOA').AsFloat := Sistema.idEmpresa;
  QryUnidNegoc.Open;

  LimpaGeral;

  If QryClassiFiscal.Active Then QryClassiFiscal.Close;
  QryClassiFiscal.Open;

  If Sistema.IdModulo = 2 Then
  Begin
    IntegraBack.RecPag := 'P';

    If FazQuery(DtmBaseDados.Qry,'SELECT INTEGRACONTAB FROM PARAMCAP ' +
                                 ' WHERE (IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ') AND ' +
                                 '       (RECPAG = ''P'')') Then
    Begin
       IntegraBack.Contabilidade := DtmBaseDados.Qry.Fields[0].AsString;

       If FazQuery(DtmBaseDados.Qry,'SELECT TIPOEMPRESA FROM EMPRESAPROP WHERE IDPESSOA = ' + inttostr(Sistema.idEmpresa)) Then
          IntegraBack.TipoEmpresa := DtmBaseDados.Qry.FieldByName('TIPOEMPRESA').AsString
       Else
          IntegraBack.TipoEmpresa := 'H';

       If FazQuery(DtmBaseDados.Qry,'SELECT PLANO FROM PARAMCONTAB ' +
                                    ' WHERE (IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')') Then
       Begin
              IntegraBack.Plano         := DtmBaseDados.Qry.Fields[0].AsInteger;
              If FazQuery(DtmBaseDados.Qry,'SELECT MASCARA FROM PLANO ' +
                                           ' WHERE (PLANO = ' + IntToStr(IntegraBack.Plano) + ')') Then
                 IntegraBack.MascaraPlano  := DtmBaseDados.Qry.Fields[0].AsString
              Else
                 IntegraBack.MascaraPlano  := '';
       End
       Else
       Begin
          IntegraBack.Plano         := 0;
          IntegraBack.MascaraPlano  := '';
       End;
    End
    Else
    Begin
       IntegraBack.Contabilidade := '';
       IntegraBack.Plano         := 0;
       IntegraBack.MascaraPlano  := '';
    End;
  End;

  If IntegraBack.Contabilidade = 'S' Then
  Begin

    GpbContabil.Enabled := True;

    CContabil.Plano := IntegraBack.Plano;
    CContabil.Mascara := IntegraBack.MascaraPlano;

    CContabil1.Plano := IntegraBack.Plano;
    CContabil1.Mascara := IntegraBack.MascaraPlano;

    CContabil2.Plano := IntegraBack.Plano;
    CContabil2.Mascara := IntegraBack.MascaraPlano;

  End
  Else
    GpbContabil.Enabled := False;

  If DtmCmBack.QryParGlobal.Active Then DtmCmBack.QryParamGlobal.Close;
  DtmCmBack.QryParGlobal.ParamByname('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  DtmCmBack.QryParGlobal.Open;

  If Not DtmCmBack.QryParGlobalMASCARANUMAGENCIA.IsNull Then
     sMascaraNumAgencia := DtmCmBack.QryParGlobalMASCARANUMAGENCIA.AsString + ';1; '
  Else
     sMascaraNumAgencia := '';

  DbeAgencia.Enabled := (DtmCmBack.QryParGlobalFLGCRIAAGENCIA.AsString = 'S');

  DtmCmBack.QryParGlobal.Close;

  lDelete     := 0;
  lFornRamo   := 0;
  lFornDesemb := 0;
  lFornDesemb := 0;

  FazQuery(qrySubconta,'SELECT CODSUBCONTA,IDPESSOA,NOMESUBCONTA FROM SUBCONTA WHERE IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ' ORDER BY NOMESUBCONTA ');
  FazQuery(qryNaturezaRend,'SELECT  CODNATUREZA,DESCRICAO FROM NATURENDIMENTO');
  AbreQryRamoDesembImp(0);
  HabilitaGeral(False);
end;

procedure TfrmCadForne.CmeCadastroInsert(Sender: TObject);
begin
  Inherited;
  lDelete := 0;
  lFornRamo := 0;
  LimpaGeral;
  lIdPessoa := qryIDPESSOA.AsInteger;
  qryFornxRamo.Insert;
  qryEmpresaForn.Insert;

  qrySubTipoFLGASS.AsInteger := 0;
  qryEmpresaFornFLGSTATUS.AsString := 'A';

  AbreQryRamoDesembImp(qryIDPESSOA.AsInteger);

  HabilitaGeral(True);
end;

procedure TfrmCadForne.CmeCadastroEdit(Sender: TObject);
begin
  Inherited;
  lDelete := 0;
  lFornRamo := 0;
  lIdPessoa := qry.FieldByName('IDPESSOA').AsInteger;

  if qryEmpresaForn.IsEmpty Then
     qryEmpresaForn.Insert
  else
     qryEmpresaForn.Edit;

  qrySubTipo.FieldByName('FLGASS').AsInteger := 0;
  If qryEmpresaFornFLGSTATUS.IsNull Then qryEmpresaFornFLGSTATUS.AsString := 'A';

  HabilitaGeral(True);
  CContabilExit(Self);
end;

procedure TfrmCadForne.CmeCadastroDelete(Sender: TObject);
  Procedure DeletaQry(Q:Array of TwwQuery);
  Var
    X:Integer;
  Begin
     For X:=0 To High(Q) Do
     Begin
        If Q[x].Active Then
        Begin
           Q[x].First;
           While Not Q[x].Eof Do
             Q[x].Delete;
        End;
     End;
  End;
begin
  {** Verificado! **}
  lDelete := 1;

  DeletaQry([qryFornxRamo, qryDesembxForn, QryImpAgregxForn,
             qryEmpresaForn, qryContaBancaria]);

  AplicaAlteracoes([qryEmpresaForn,qryFornxRamo,qryContaBancaria,qryDesembxForn,QryImpAgregxForn]);

  Inherited;

  lDelete := 0;
end;

procedure TfrmCadForne.qrySubTipoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  {** Verificado! **}
  if lDelete = 0 Then Begin
    if (qryEmpresaForn.Active) and (qryEmpresaForn.CachedUpdates) then
       qryEmpresaForn.CancelUpdates;

    qryEmpresaForn.ParamByName('IdPessoa').value  := Sistema.IdEmpresa;
    if not qry.EOF  Then
       qryEmpresaForn.ParamByName('IdForncli').value := qry.FieldByName('idpessoa').AsInteger;
    qryEmpresaForn.Close;
    qryEmpresaForn.Open;
  end;
end;

procedure TfrmCadForne.spdFornxRamoClick(Sender: TObject);
begin
  inherited;
  {** Verificado! **}
  lFornRamo := 1;
  If Not qryRamoFornecedor.IsEmpty Then
  Begin
     qryFornxRamo.Append;
     qryFornxRamo.FieldByName('IDRAMOFORNECEDOR').AsInteger  := qryRamoFornecedor.FieldByName('IDRAMOFORNECEDOR').AsInteger;
     if lIdPessoa <> 0 Then
        qryFornxRamo.FieldByName('IDPESSOA').AsInteger          := lIdPessoa
     else
        qryFornxRamo.FieldByName('IDPESSOA').AsInteger          := qry.FieldByName('IDPESSOA').AsInteger;
     qryFornxRamo.FieldByName('DESCRAMOFORNECEDOR').AsString := qryRamoFornecedor.FieldByName('DESCRAMOFORNECEDOR').AsString;
     qryFornxRamo.Post;
     qryRamoFornecedor.Delete;
  End;
end;

procedure TfrmCadForne.spdRamosFornClick(Sender: TObject);
begin
  inherited;
  {** Verificado! **}
  lFornRamo := 1;
  if Not qryFornxRamo.IsEmpty Then
  Begin
    qryRamoFornecedor.Append;
    qryRamoFornecedor.FieldByName('IDRAMOFORNECEDOR').AsInteger  := qryFornxRamo.FieldByName('IDRAMOFORNECEDOR').AsInteger;
    qryRamoFornecedor.FieldByName('DESCRAMOFORNECEDOR').AsString := qryFornxRamo.FieldByName('DESCRAMOFORNECEDOR').AsString;
    qryRamoFornecedor.Post;
    qryFornxRamo.Delete;
  End;
end;


procedure TfrmCadForne.HabilitaGeral(lTrue : Boolean);
Begin
   {** Verificado! **}
   dblkNaturezaRend.Enabled:= lTrue;
   spdRamosForn.Enabled    := lTrue;
   spdFornxRamo.Enabled    := lTrue;
   spdDesembxForn.Enabled  := lTrue;
   spdDesembForn.Enabled   := lTrue;
   SbtImpDelAgreg.Enabled  := lTrue;
   SbtImpAddAgreg.Enabled  := lTrue;
   PnlGeral.Enabled        := lTrue;
End;


procedure TfrmCadForne.bbtnCancelarClick(Sender: TObject);
begin
  {** Verificado! **}
  inherited;
  HabilitaGeral(False);
end;

procedure TfrmCadForne.LimpaGeral;
Begin
   {** Verificado! **}
   With qryContaBancaria Do
   Begin
     if Active Then
     Begin
       If UpdatesPending Then CancelUpdates;
       Close;
     End;
     if Not Prepared Then Prepare;
     ParamByName('IDPESSOA').AsInteger := -1;
     Open;
   End;
End;


procedure TfrmCadForne.spdDesembxFornClick(Sender: TObject);
Var
  sCodDesemb: String;
begin
  inherited;
  {** Verificado! **}
  lFornDesemb := 1;
  if Not qryDesembolso.IsEmpty Then
  Begin
    sCodDesemb := Trim(qryDesembolso.FieldByName('CODTIPRECDES').AsString);
    Repeat
      qryDesembxForn.Append;
      if lIdPessoa <> 0 Then
         qryDesembxForn.FieldByName('IDPESSOA').AsInteger   := lIdPessoa
      else
         qryDesembxForn.FieldByName('IDPESSOA').AsInteger   := qry.FieldByName('IDPESSOA').AsInteger;
      qryDesembxForn.FieldByName('ANASINT').AsString        := qryDesembolso.FieldByName('ANASINT').AsString;
      qryDesembxForn.FieldByName('IDFORNXDESEMB').AsInteger := LeUltRegistro(nil, 'FORNXDESEMB');
      qryDesembxForn.FieldByName('CODTIPRECDES').AsString   := qryDesembolso.FieldByName('CODTIPRECDES').AsString;
      qryDesembxForn.FieldByName('RECPAG').asString         := IntegraBack.Recpag;
      qryDesembxForn.FieldByName('IDEMPRESAPROP').AsInteger :=  Sistema.IdEmpresa;
      qryDesembxForn.FieldByName('DESCRICAO').AsString      := qryDesembolso.FieldByName('DESCRICAO').AsString;
      qryDesembxForn.Post;
      qryDesembolso.Delete;
    Until Pos(sCodDesemb,Trim(qryDesembolso.FieldByName('CODTIPRECDES').AsString)) <> 1;
  End;
end;

procedure TfrmCadForne.spdDesembFornClick(Sender: TObject);
Var
  sCodDesemb: String;
begin
  inherited;
  {** Verificado! **}
  lFornDesemb := 1;
  if Not qryDesembxForn.IsEmpty Then
  Begin
    sCodDesemb := Trim(qryDesembxForn.FieldByName('CODTIPRECDES').AsString);
    Repeat
      qryDesembolso.Append;
      qryDesembolso.FieldByName('CODTIPRECDES').AsString := qryDesembxForn.FieldByName('CODTIPRECDES').AsString;
      qryDesembolso.FieldByName('DESCRICAO').AsString    := qryDesembxForn.FieldByName('DESCRICAO').AsString;
      qryDesembolso.FieldByName('ANASINT').AsString      := qryDesembxForn.FieldByName('ANASINT').AsString;
      qryDesembolso.FieldByName('RECPAG').AsString       := IntegraBack.Recpag;
      qryDesembolso.FieldByName('IDPESSOA').AsInteger    := Sistema.IdEmpresa;
      qryDesembolso.Post;
      qryDesembxForn.Delete;
    Until Pos(sCodDesemb,Trim(qryDesembxForn.FieldByName('CODTIPRECDES').AsString)) <> 1;
  End;
end;

procedure TfrmCadForne.FazerQryCCusto;
begin
  {** Verificado! **}
  qryCCusto.Close;
  qryCCusto.SQL.Clear;
  qryCCusto.SQL.text:= 'SELECT CENT.CODCENTROCUSTO,CENT.NOME FROM CENTCUST CENT '+
                       'WHERE CODCENTROCUSTO IN (SELECT CODCENTROCUSTO FROM CONTASxCC CONT '+
                       'WHERE CONT.IDEMPRESA = CENT.IDEMPRESA   AND '+
                       '      CONT.CODCENTROCUSTO= CENT.CODCENTROCUSTO   AND CONT.IDEMPRESA = '+ IntToStr(Sistema.IdEmpresa) + ' AND ' +
                       '      CONT.PLANO = ' + InttoStr(IntegraBack.Plano) + ' AND CONT.PLACONTA = ''' + CContabil.Conta.Numero + ''')';
  qryCCusto.Open;
end;

procedure TfrmCadForne.CContabilExit(Sender: TObject);
begin
  inherited;
  {** Verificado! **}
  dblcCCusto.Enabled   := CContabil.Conta.ObrigaCentrodeCusto;
  dblkSubconta.Enabled := CContabil.Conta.ObrigaSubConta;
  FazerQryCCusto;
end;

procedure TfrmCadForne.AbreQryRamoDesembImp(iPessoa:Integer);
Begin
  {** Verificado! **}
  If qryDesembolso.Active       Then qryDesembolso.Close;
  If Not qryDesembolso.Prepared Then qryDesembolso.Prepare;
  qryDesembolso.ParamByName('PIDEMPRESA').AsInteger := FuncaoGeral.Decode(iPessoa,0,0,Sistema.IdEmpresa);
  qryDesembolso.ParamByName('PIDPESSOA').AsInteger  := iPessoa;
  qryDesembolso.Open;

  If qryRamoFornecedor.Active       Then qryRamoFornecedor.Close;
  If Not qryRamoFornecedor.Prepared Then qryRamoFornecedor.Prepare;
  qryRamoFornecedor.ParamByName('PIDPESSOA').AsInteger  := iPessoa;
  qryRamoFornecedor.Open;

  If qryDesembxForn.Active       Then qryDesembxForn.Close;
  If Not qryDesembxForn.Prepared Then qryDesembxForn.Prepare;
  qryDesembxForn.ParamByName('PIDEMPRESA').AsInteger := FuncaoGeral.Decode(iPessoa,0,0,Sistema.IdEmpresa);
  qryDesembxForn.ParamByName('PIDPESSOA').AsInteger  := iPessoa;
  qryDesembxForn.Open;

  If qryFornxRamo.Active       Then qryFornxRamo.Close;
  If Not qryFornxRamo.Prepared Then qryFornxRamo.Prepare;
  qryFornxRamo.ParamByName('PIDPESSOA').AsInteger  := iPessoa;
  qryFornxRamo.Open;

  If QryImpAgreg.Active       Then QryImpAgreg.Close;
  If Not QryImpAgreg.Prepared Then QryImpAgreg.Prepare;
  QryImpAgreg.ParamByName('PIDPESSOA').AsInteger  := FuncaoGeral.Decode(iPessoa,0,0,Sistema.IdEmpresa);
  QryImpAgreg.ParamByName('PIDFORCLI').AsInteger  := iPessoa;
  QryImpAgreg.ParamByName('RECPAG').AsString      := IntegraBack.RecPag;
  QryImpAgreg.Open;

  If QryImpAgregxForn.Active       Then QryImpAgregxForn.Close;
  If Not QryImpAgregxForn.Prepared Then QryImpAgregxForn.Prepare;
  QryImpAgregxForn.ParamByName('PIDPESSOA').AsInteger := FuncaoGeral.Decode(iPessoa,0,0,Sistema.IdEmpresa);
  QryImpAgregxForn.ParamByName('PIDFORCLI').AsInteger := iPessoa;
  QryImpAgregxForn.ParamByName('RECPAG').AsString     := IntegraBack.RecPag;
  QryImpAgregxForn.Open;
End;

procedure TfrmCadForne.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {** Verificado! **}
  FuncaoGeral.FechaQry([qryDesembolso,qryRamoFornecedor,QryImpAgreg,qryDesembxForn,
                        qryFornxRamo,QryImpAgregxForn],False,True);
  inherited;
end;

procedure TfrmCadForne.SbtImpAddAgregClick(Sender: TObject);
begin
  inherited;
  {** Verificado! **}
  lImpostos := 1;
  If Not QryImpAgreg.IsEmpty Then
  Begin
    QryImpAgregxForn.Append;
    QryImpAgregxFornDESCCUSTAGREG.AsString     := QryImpAgregDESCCUSTAGREG.ASString;
    QryImpAgregxFornCODTIPOCUSTAGREG.AsInteger := QryImpAgregCODTIPOCUSTAGREG.AsInteger;
    QryImpAgregxFornIDPESSOA.AsInteger         := Sistema.IdEmpresa;
    QryImpAgregxFornRECPAG.AsString            := IntegraBack.RecPag;
    if lIdPessoa <> 0 Then
       QryImpAgregxFornIDFORCLI.AsInteger := lIdPessoa
    else
       QryImpAgregxFornIDFORCLI.AsInteger   := qry.FieldByName('IDPESSOA').AsInteger;
    QryImpAgregxForn.Post;
    QryImpAgreg.Delete;
  End;
end;

procedure TfrmCadForne.SbtImpDelAgregClick(Sender: TObject);
begin
  inherited;
  {** Verificado! **}
  lImpostos := 1;
  If Not QryImpAgregxForn.IsEmpty Then
  Begin
    QryImpAgreg.Append;
    QryImpAgregDESCCUSTAGREG.ASString     := QryImpAgregxFornDESCCUSTAGREG.AsString;
    QryImpAgregCODTIPOCUSTAGREG.AsInteger := QryImpAgregxFornCODTIPOCUSTAGREG.AsInteger;
    QryImpAgreg.Post;
    QryImpAgregxForn.Delete;
  End;
end;

procedure TfrmCadForne.dbDesembolsoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  {** Verificado! **}
  If (Not (Sender as TwwDbGrid).Datasource.DataSet.IsEmpty) And
     ((Sender as TwwDbGrid).Datasource.DataSet.FieldByName('ANASINT').AsString = 'S') Then
     Begin
        ABrush.Color := $0080FFFF;
        AFont.Color  := ClNavy;
     End
     Else
     Begin
        ABrush.Color := ClWhite;
        AFont.Color  := ClBlack;
     End
end;

function TfrmCadForne.BusacaIdAgencia(idBanco :LongInt; sNumAgencia: String): LongInt;
Begin
  {** Verificado! **}
  If QryBuscaAgencia.Active Then QryBuscaAgencia.Close;
  QryBuscaAgencia.ParamByName('IDBANCO').AsFloat := idBanco;
  QryBuscaAgencia.ParamByName('NUMAGENCIA').AsString := Trim(sNumAgencia);
  QryBuscaAgencia.Open;

  If QryBuscaAgencia.IsEmpty Then
  Begin
    With QryInserePessoa Do
    Begin
      If Active Then Close;
      If Not Prepared Then Prepare;
      ParamByName('IDPESSOA').AsFloat     := LeUltRegistro(nil,'PESSOA');
      ParamByName('NOME').AsString        := Copy('Agencia Nº ' + sNumAgencia + ' - ' + Trim(dblkBanco.Text),1,60);
      ParamByName('RAZAOSOCIAL').AsString := Copy('Agencia Nº ' + sNumAgencia + ' - ' + Trim(dblkBanco.Text),1,60);
      ParamByName('TIPO').AsString        := 'F';
      ExecSql;
    End;

    With QryInsereAgencia Do
    Begin
      If Active Then Close;
      If Not Prepared Then Prepare;
      ParamByName('IDPESSOA').AsFloat     := QryInserePessoa.ParamByName('IDPESSOA').AsFloat;
      ParamByName('IDBANCO').AsFloat      := idBanco;
      ParamByName('NUMAGENCIA').AsString  := Trim(sNumAgencia);
      ExecSql;
    End;

    Result := QryInserePessoa.ParamByName('IDPESSOA').AsInteger;

  End
  Else
    Result := QryBuscaAgenciaIDPESSOA.AsInteger;
End;

procedure TfrmCadForne.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  {** Verificado! **}
  If (Trim(dblkBanco.Text) <> '') Then
  Begin
    MsBanco.Filtro.Clear;
    MsBanco.Filtro.Add('AGENCIABANCARIA.IDPESSOA = PESSOA.IDPESSOA');
    MsBanco.Filtro.Add('AGENCIABANCARIA.IDBANCO = BANCO.IDPESSOA');
    MsBanco.Filtro.Add('BANCO.IDPESSOA = ' + dblkBanco.LookupValue);

    MsBanco.Executar;

    SetaMascaraAgencia;

    If MsBanco.RetornouValor Then
       qryContaBancariaNUMAGENCIA.AsString := MsBanco.ValoresChave[0]
  End;
end;

procedure TfrmCadForne.CmeDetalheInsert(Sender: TObject);
Begin
  Inherited;
  {** Verificado! **}
  If tbcDetalhe.TabIndex = 5 Then
     With qryContaBancaria Do
     Begin
       FieldByName('IDCBANCARIA').AsFloat     := LeUltRegistro(nil, 'CONTABANCARIA');
       FieldByName('IDPESSOA').AsInteger      := lIdPessoa;
       FieldByName('FLGCONTAPREF').AsInteger  := 0;
       FieldByName('TIPOCONTA').AsString      := '1';
    End;
End;

procedure TfrmCadForne.CmeDetalheEdit(Sender: TObject);
Begin
  Inherited;
  {** Verificado! **}
  If (tbcDetalhe.TabIndex = 5) And
     (qryContaBancariaTIPOCONTA.IsNull) Then
     qryContaBancariaTIPOCONTA.AsInteger := 1;
End;


procedure TfrmCadForne.sbtnExcluiDetClick(Sender: TObject);
begin
  {** Verificado! **}
  bDeleteDetalhe := True;
  Try
    inherited;
    bDeleteDetalhe := False;    
  except
    raise;
    bDeleteDetalhe := False;
  end;
end;

Procedure  TfrmCadForne.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Var
  iNumContaPref :Integer;
Begin
  Inherited;

  Accept := (Not qryFornxRamo.IsEmpty);

  If Not Accept Then
     MsgDlg('É Obrigatório a indicação do ramo do fornecedor','Atenção',mtError,[mbOk],0)
  Else
  Begin
    If IntegraBack.Contabilidade = 'S' Then
    Begin
       If (CContabil.Valida  <> VcOk) Or
          (CContabil1.Valida <> VcOk) Or
          (CContabil2.Valida <> VcOk) Then
       Accept := False;

       If Accept And CContabil.Conta.ObrigaCentrodeCusto And (dblcCCusto.Text = '') Then
       Begin
          MsgDlg('A Conta do Fornecedor Obriga Centro de Custo','Atenção',mtError,[mbOk],0);
          If dblcCCusto.CanFocus Then dblcCCusto.SetFocus;
          Accept := False;
       End;
    End;

    If Accept Then
    Begin
      //Garante a indicação de só uma conta preferencial
      iNumContaPref := 0;

      With qryContaBancaria Do
      Begin
        First;
        While Not Eof Do
        Begin
           If (qryContaBancariaFLGCONTAPREF.AsInteger = 1) Then
               Inc(iNumContaPref);
           Next;
        End;

        Accept := (IsEmpty Or (iNumContaPref = 1));

        If Not Accept Then
        Begin
           If iNumContaPref = 0 Then
              MsgDlg('Não foi indicada a Conta Bancária preferencial do Favorecido','Atenção',mtError,[mbOk],0)
           Else
              MsgDlg('Foi indicada mais de uma Conta Bancária preferencial do Favorecido. Favor corrigir o cadastro.','Atenção',mtError,[mbOk],0);
        End;
      End;
    End;
  End;
End;

procedure TfrmCadForne.PessoaSaveSubtipo(Sender: TObject);
begin
  If Not (qryEmpresaForn.State In [DsEdit, DsInsert]) Then qryEmpresaForn.Edit;

  if lIdPessoa <> 0 Then
    qryEmpresaForn.FieldByName('IDFORCLI').AsInteger := lIdPEssoa
  else
    qryEmpresaForn.FieldByName('IDFORCLI').AsInteger := qry.FieldByName('IDPESSOA').AsInteger;

  qryEmpresaForn.FieldByName('IDPESSOA').AsInteger             := Sistema.IdEmpresa;

  if IntegraBack.Plano <> 0 Then
     qryEmpresaForn.FieldByName('PLANO').AsInteger             := IntegraBack.Plano;

  If (qryEmpresaForn.State In [DsEdit, DsInsert]) Then qryEmpresaForn.Post;
  If (qryContaBancaria.State In [DsEdit, DsInsert]) Then qryContaBancaria.Post;
  If (qryFornxRamo.State In [DsEdit, DsInsert]) Then qryFornxRamo.Post;
  If (qryDesembxForn.State In [DsEdit, DsInsert]) Then qryDesembxForn.Post;
  If (QryImpAgregxForn.State In [DsEdit, DsInsert]) Then QryImpAgregxForn.Post;

  AplicaAlteracoes([qryEmpresaForn,qryContaBancaria]);

  if lFornRamo = 1 Then
     AplicaAlteracoes([qryFornxRamo])
  else
     qryFornxRamo.CancelUpdates;

  if lFornDesemb = 1 Then
     AplicaAlteracoes([qryDesembxForn])
  else
     qryDesembxForn.CancelUpdates;

  if lImpostos = 1 Then
     AplicaAlteracoes([QryImpAgregxForn])
  else
     QryImpAgregxForn.CancelUpdates;

  If qryDesembolso.UpdatesPending     Then qryDesembolso.CancelUpdates;
  If qryRamoFornecedor.UpdatesPending Then qryRamoFornecedor.CancelUpdates;
  If QryImpAgreg.UpdatesPending       Then QryImpAgreg.CancelUpdates;

  lFornRamo   := 0;
  lFornDesemb := 0;
  lImpostos   := 0;
  HabilitaGeral(False);

  Inherited;
end;

procedure TfrmCadForne.PessoaChangeSubtipo(IdPessoa: Integer);
begin
  inherited;
  if IdPessoa <> 0 Then
     Begin
       FazerQryCCusto;

       if qrySubConta.Locate('CODSUBCONTA', qryEmpresaForn.FieldByName('CODSUBCONTA').AsInteger, []) Then
          dblkSubconta.LookupValue := qrySubConta.FieldByName('CODSUBCONTA').AsString
       else
          dblkSubconta.LookupValue := '';

       With qryContaBancaria Do
       Begin
         if Active Then Close;
         if Not Prepared Then Prepare;
         ParamByName('IDPESSOA').AsInteger := IdPessoa;
         Open;
       End;

     end
  else
    LimpaGeral;

  If IdPessoa <> 0 Then
     AbreQryRamoDesembImp(IdPessoa);
end;

procedure TfrmCadForne.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then SetaMascaraAgencia;
end;

procedure TfrmCadForne.bbtnOkDetClick(Sender: TObject);
begin
  {** Verificado! **}
  If tbcDetalhe.TabIndex = 5 Then
  Begin
    If (Not bDeleteDetalhe) Then
    Begin
      If Not (((dblkBanco.Text  <> '') And (DbeAgencia.Text <> '')) Or
              ((dblkBanco.Text  =  '') And (DbeAgencia.Text =  ''))) Then
      Begin
        MsgDlg('Faltam dados para a informação da conta bancária','Atenção',mtError,[mbOk],0);
        Exit;
      End
      Else
      Begin
         If (qryBancoFLGVALIDACC.AsString <> 'N') Then
         Begin
           Try
             CalculaDv := TCalcDv.Create;
             CalculaDv.TipoConta := qryContaBancariaTIPOCONTA.AsInteger;
             If (Trim(dbedConta.Text) <> '')  And
                (Trim(dblkBanco.Text)  <> '') And
                (Trim(DbeAgencia.Text) <> '') And
                (Not CalculaDv.ValidaConta(qryBancoNUMBANCO.AsString,
                                       qryContaBancariaNUMAGENCIA.AsString,
                                       qryContaBancariaCONTACORRENTE.AsString,True)) Then Exit;
           Finally
             CalculaDv.Free;
          End;
         End;

         qryContaBancariaIDAGENCIA.AsFloat := BusacaIdAgencia(StrToIntDef(dblkBanco.LookupValue,0),qryContaBancariaNUMAGENCIA.AsString);
      End;
    End;
  End;

  bDeleteDetalhe := False;
  inherited;
end;

procedure TfrmCadForne.dblkBancoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  {** Verificado! **}
  SetaMascaraAgencia;
end;

procedure TfrmCadForne.SetaMascaraAgencia;
begin
  {** Verificado! **}
  If (Not qryBancoMASCARAAGENCIA.IsNull) Then
     qryContaBancariaNUMAGENCIA.EditMask := qryBancoMASCARAAGENCIA.AsString + ';0; '
  Else
     qryContaBancariaNUMAGENCIA.EditMask := sMascaraNumAgencia;

  If (Not qryBancoMASCARACC.IsNull) Then
     qryContaBancariaCONTACORRENTE.EditMask := qryBancoMASCARACC.AsString + ';0; '
  Else
     qryContaBancariaCONTACORRENTE.EditMask := '';

  If CmeCadastro.Operacao In [OpInserir, OpAlterar] Then
  Begin
     If Not (qryContaBancaria.State In [DsEdit, DsInsert]) Then qryContaBancaria.Edit;
     qryContaBancariaNOMEBANCO.AsString := qryBancoRAZAOSOCIAL.AsString;
     qryContaBancariaNUMBANCO.AsString := qryBancoNUMBANCO.AsString;
  End;
end;

procedure TfrmCadForne.qryContaBancariaCalcFields(DataSet: TDataSet);
begin
  inherited;
  {** Verificado! **}
  If Not qryContaBancariaIDBANCO.IsNull Then
  Begin
    With QryBuscaMask Do
    Begin
      If Active Then Close;
      If Not Prepared Then Prepare;
      Params[0].AsInteger := qryContaBancariaIDBANCO.AsInteger;
      Open;

      qryContaBancariaAGENCIAFORMAT.AsString := FormatMaskText(QryBuscaMaskMASCARAAGENCIA.AsString + ';' + MaskNoSave + '; ',qryContaBancariaNUMAGENCIA.AsString);
      qryContaBancariaCONTAFORMAT.AsString := FormatMaskText(QryBuscaMaskMASCARACC.AsString + ';' + MaskNoSave + '; ',qryContaBancariaCONTACORRENTE.AsString);
      Close;
    End;
  End
  Else
  Begin
    qryContaBancariaAGENCIAFORMAT.Clear;
    qryContaBancariaCONTAFORMAT.Clear;
  End;
end;



procedure TfrmCadForne.RgTipoContaClick(Sender: TObject);
begin
  inherited;
  {** Verificado! **}
  If (qryBancoNUMBANCO.AsString = '104') And
     (qryContaBancaria.State In [DsEdit, DsInsert]) Then
  Begin
     qryContaBancariaCONTACORRENTE.Clear;
     dbedContaEnter(Self);
  End;
end;

procedure TfrmCadForne.dbedContaEnter(Sender: TObject);
begin
  {** Verificado! **}
  inherited;

  If (qryBancoNUMBANCO.AsString = '104') Then
     dbedConta.PopupMenu :=  ppmCaixa
  Else
     dbedConta.PopupMenu :=  nil;

end;

procedure TfrmCadForne.N001ContaCorrente1Click(Sender: TObject);
begin
  inherited;
  {** Verificado! **}
  qryContaBancariaCONTACORRENTE.AsString := Copy(IntToStr(TMenuItem(Sender).Tag),2,3);
  dbedConta.SelStart := 3;
  dbedConta.SelLength := 1;
end;

end.
