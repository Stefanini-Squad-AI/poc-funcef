(*******************************************************************************
 26/03/1999
 Alteração na 'Orelha' geral verificando a obrigatoriedade do centro de custo
 para a conta do cliente.

 * É nescessário a criação da propriedade IntegraBack.Plano e inicialização da mesma
   com o plano de contas da empresa logada;

 * Ultilização do Método FuncaoGeral.TestaContaCC (uFuncaoGeral)
   Valida a conta contábil digitada e verifica a obrigatoriedade do centro de
   custo para a mesma;

 * É aconselhavél a ultilização Método FuncaoGeral.Verifica_Situacao_Empresa
   (uFuncaoGeral) Que incicializa, além da propriedade iPlano, outros parâmetros
   básicos para integrações com a Contabilidade, Financeiro e CAPCAR
   Descritos abaixo:

   IntegraBack.Financeiro    - Integração com o financeiro;
   IntegraBack.MascaraRecDes - máscara de recebimento/Desembolso;
   IntegraBack.Contabilidade - Integração com a contabilidade;
   IntegraBack.EstornaContab       - obrigação do Estorno da coantabilidade;
   IntegraBack.Plano         - Plano de Contas;
   IntegraBack.MascaraPlano  - Máscara do plano de contas;
   IntegraBack.ObrigaCResPon  - Obriga a Indicação do Centro de Responsabilidade;
   IntegraBack.ObrigaAbc      - Obriga a Indicação do Centro de Custo;
   IntegraBack.TipoOper      - Indica ipo de operação obrigatória para lançamentos
                           contábeis;
 19/05/1999 - 02.08.04
  A Orelha Geral Não estava sendo habilitada para inclusões contínuas;
  O Tipo de Cliente estava exibindo o nome;
 05/08/1999 - 02.12.02
  Inclusão do relacionamento entre cliente e tipo de recebimento;
 30/12/1999 - 2.14.18
  Implementação da associação da Classifiação fiscal ao cliente
 *******************************************************************************)

unit fCadCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Menus, MontaSelect, DBTables, Db, CMwwQuery, Wwdatsrc,
  Pessoa, TB97, MAHlpBtn, StdCtrls, Buttons, checklst, Grids, uCmTypes,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, wwdblook, DBCtrls, Mask,
  wwdbedit, ExtDlgs, TB97Ctls, TB97Tlbr, uIntegraBack,
  IvDictio, IvMulti, IvEMulti, CMProcuraMask, CMDatabase, fCadastroCS,
  TREdit, registry, CMDBLookupCombo, CMProcuraSubTipo, Wwdbspin,
  CmEventosCadastro, ImgList, wwdbdatetimepicker, CMDateTimePicker,
  ExtCtrls, Wwquery;

type
  TfrmCadCliente = class(TfrmPessoa)
    TabSheet1: TTabSheet;
    qryGeral: TwwQuery;
    updGeral: TUpdateSQL;
    dsGeral: TwwDataSource;
    qryGeralIDFORCLI: TFloatField;
    qryGeralIDPESSOA: TFloatField;
    qryGeralCODSUBCONTA: TFloatField;
    qryGeralPLANO: TFloatField;
    qryGeralCONTACADIANTAMENTO: TStringField;
    qryTipClie: TwwQuery;
    qryGeralCONTACRECEITA: TStringField;
    qryGeralCONTACCLIENTE: TStringField;
    qrySubConta: TwwQuery;
    qryGeralPERCCOMISCARTAO: TFloatField;
    qryGeralPRAZOCARTAO: TFloatField;
    qrySubTipoIDPESSOA: TFloatField;
    qrySubTipoCODCLIENTE: TStringField;
    qrySubTipoNUMEROCARTAO: TStringField;
    qrySubTipoBLOQUEIO: TStringField;
    qrySubTipoIDTIPOCLIENTE: TFloatField;
    qryccusto: TwwQuery;
    qryGeralCODCENTROCUSTO: TStringField;
    qryccustoCODCENTROCUSTO: TStringField;
    qryccustoNOME: TStringField;
    qryTipClieIDTIPOCLIENTE: TFloatField;
    qryTipClieDESCRICAO: TStringField;
    qrySubContaCODSUBCONTA: TFloatField;
    qrySubContaNOMESUBCONTA: TStringField;
    QryEmpresaVh: TwwQuery;
    UpEmpresaVh: TUpdateSQL;
    dbVH: TCMDatabase;
    QryEmpresaVhModelo: TwwQuery;
    UpdQryEmpresaVhModelo: TUpdateSQL;
    QryEmpresaVhModeloCOD_EMPRESA: TStringField;
    QryEmpresaVhModeloNOME_FANTASIA: TStringField;
    QryEmpresaVhModeloRAZAO_SOCIAL: TStringField;
    QryEmpresaVhModeloCGC: TStringField;
    QryEmpresaVhModeloCPF: TStringField;
    QryEmpresaVhModeloEMAIL: TStringField;
    QryEmpresaVhModeloENDERECO: TStringField;
    QryEmpresaVhModeloBAIRRO: TStringField;
    QryEmpresaVhModeloCIDADE: TStringField;
    QryEmpresaVhModeloCEP: TStringField;
    QryEmpresaVhModeloCOD_PAIS: TStringField;
    QryEmpresaVhModeloCOD_ESTADO: TStringField;
    QryEmpresaVhModeloDDI: TStringField;
    QryEmpresaVhModeloDDD: TStringField;
    QryEmpresaVhModeloTELEFONE1: TStringField;
    QryEmpresaVhModeloCONTATO1: TStringField;
    QryEmpresaVhModeloRAMAL1: TStringField;
    QryEmpresaVhModeloCLIENTE: TStringField;
    DsFront: TwwDataSource;
    qryDesembolso: TwwQuery;
    qryDesembolsoCODTIPRECDES: TStringField;
    qryDesembolsoANASINT: TStringField;
    qryDesembolsoDESCRICAO: TStringField;
    qryDesembolsoRECPAG: TStringField;
    qryDesembolsoIDPESSOA: TFloatField;
    dsDesembolso: TwwDataSource;
    updDesembolso: TUpdateSQL;
    qryClixReceb: TwwQuery;
    DsClixReceb: TwwDataSource;
    UpdClixReceb: TUpdateSQL;
    TabSheet2: TTabSheet;
    Panel8: TPanel;
    dbgrDesembForn: TwwDBGrid;
    Panel7: TPanel;
    dbDesembolso: TwwDBGrid;
    spdDesembxForn: TSpeedButton;
    spdDesembForn: TSpeedButton;
    qryClixRecebIDCLIXRECEB: TFloatField;
    qryClixRecebCODTIPRECDES: TStringField;
    qryClixRecebRECPAG: TStringField;
    qryClixRecebIDPESSOA: TFloatField;
    qryClixRecebIDEMPRESA: TFloatField;
    qryClixRecebDESCRICAO: TStringField;
    qryClixRecebANASINT: TStringField;
    DbAccess: TCMDatabase;
    QryAccess: TwwQuery;
    TbsImpostos: TTabSheet;
    qryClixTipoCli: TwwQuery;
    DsClixTipoCli: TwwDataSource;
    UpdClixTipoCli: TUpdateSQL;
    qryClixTipoCliIDPESSOA: TFloatField;
    qryClixTipoCliIDTIPOCLIENTE: TFloatField;
    qryClixTipoCliDESCRICAO: TStringField;
    QryTiposCli: TwwQuery;
    DsTiposCli: TwwDataSource;
    UpdTiposCli: TUpdateSQL;
    QryTiposCliIDTIPOCLIENTE: TFloatField;
    QryTiposCliDESCRICAO: TStringField;
    qryGeralIDPROMOTOR: TFloatField;
    qryGeralPERCCOMISPROMOTOR: TFloatField;
    QryClassiFiscal: TwwQuery;
    QryClassiFiscalCODREDUZIDO: TStringField;
    QryClassiFiscalIDCLASFISCLIFOR: TFloatField;
    qrySubTipoIDCLASFISCLIFOR: TFloatField;
    QryClassiFiscalDESCCLASFISCLIFOR: TStringField;
    TbsTiposCliente: TTabSheet;
    DsImpAgregxForn: TwwDataSource;
    UpdImpAgregxForn: TUpdateSQL;
    QryImpAgregxForn: TwwQuery;
    QryImpAgregxFornDESCCUSTAGREG: TStringField;
    QryImpAgregxFornCODTIPOCUSTAGREG: TFloatField;
    QryImpAgregxFornIDPESSOA: TFloatField;
    QryImpAgregxFornIDFORCLI: TFloatField;
    DsImpAgreg: TwwDataSource;
    UpdImpAgreg: TUpdateSQL;
    QryImpAgreg: TwwQuery;
    QryImpAgregDESCCUSTAGREG: TStringField;
    QryImpAgregCODTIPOCUSTAGREG: TFloatField;
    QryImpAgregxFornRECPAG: TStringField;
    SbtImpDelAgreg: TSpeedButton;
    SbtImpAddAgreg: TSpeedButton;
    Panel9: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel10: TPanel;
    wwDBGrid2: TwwDBGrid;
    spdFornxRamo: TSpeedButton;
    spdRamosForn: TSpeedButton;
    dbRamos: TwwDBGrid;
    dbFornxRamo: TwwDBGrid;
    PnlTitDesembAssoc: TPanel;
    Panel6: TPanel;
    qryGeralUNIDNEGOC: TFloatField;
    QryUnidNegoc: TwwQuery;
    QryUnidNegocUNIDNEGOC: TFloatField;
    QryUnidNegocNOME: TStringField;
    qryGeralFLGSITCREDITO: TStringField;
    qryGeralVLRLIMCREDITO: TFloatField;
    TbsGeral: TPageControl;
    TbsDados: TTabSheet;
    TbsContabil: TTabSheet;
    CContabil: TCMProcuraMaskContabil;
    CContabil2: TCMProcuraMaskContabil;
    CContabil1: TCMProcuraMaskContabil;
    Panel5: TPanel;
    Label23: TLabel;
    Label26: TLabel;
    Label4: TLabel;
    dblkSubconta: TwwDBLookupCombo;
    dblcCCusto: TwwDBLookupCombo;
    DbLcUnidNegoc: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    GroupBox8: TGroupBox;
    Label15: TLabel;
    Label18: TLabel;
    DBRealEdit1: TDBRealEdit;
    DbePrazoCartao: TDBRealEdit;
    dblkTipClie: TwwDBLookupCombo;
    dbedCodigoCli: TwwDBEdit;
    wwDBLookupCombo1: TwwDBLookupCombo;
    rgSitCredito: TDBRadioGroup;
    DBRealEdit3: TDBRealEdit;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label7: TLabel;
    DBMemo2: TDBMemo;
    qryGeralMOTIVOBLOQ: TMemoField;
    DBRadioGroup2: TDBRadioGroup;
    qryGeralFLGSTATUS: TStringField;
    TbsContaBancaria: TTabSheet;
    qryContaBancaria: TwwQuery;
    qryContaBancariaNOMEBANCO: TStringField;
    qryContaBancariaNUMBANCO: TStringField;
    qryContaBancariaNUMAGENCIA: TStringField;
    qryContaBancariaCONTACORRENTE: TStringField;
    qryContaBancariaTIPOCONTA: TStringField;
    qryContaBancariaFLGCONTAPREF: TFloatField;
    qryContaBancariaIDCBANCARIA: TFloatField;
    qryContaBancariaIDPESSOA: TFloatField;
    qryContaBancariaIDAGENCIA: TFloatField;
    qryContaBancariaIDBANCO: TFloatField;
    DsContaBancaria: TwwDataSource;
    updContaBancaria: TUpdateSQL;
    qryBanco: TwwQuery;
    qryBancoRAZAOSOCIAL: TStringField;
    qryBancoIDPESSOA: TFloatField;
    qryBancoNUMBANCO: TStringField;
    qryBancoMASCARACC: TStringField;
    qryBancoMASCARAAGENCIA: TStringField;
    qryBancoFLGVALIDACC: TStringField;
    Label14: TLabel;
    Label8: TLabel;
    BtnBuscaAgencia: TSpeedButton;
    Label9: TLabel;
    dblkBanco: TwwDBLookupCombo;
    DbeAgencia: TwwDBEdit;
    dbedConta: TwwDBEdit;
    RgTipoConta: TDBRadioGroup;
    ChbContaPref_Padrao: TDBCheckBox;
    GrdContaBancaria_Padrao: TwwDBGrid;
    QryBuscaAgencia: TwwQuery;
    QryBuscaAgenciaIDPESSOA: TFloatField;
    QryInserePessoa: TwwQuery;
    QryInsereAgencia: TwwQuery;
    MsBanco: TMontaSelect;
    Label10: TLabel;
    ppmCaixa: TPopupMenu;
    N001ContaCorrente1: TMenuItem;
    N002ContaCadernete1: TMenuItem;
    N003ContadePessoaJurdica1: TMenuItem;
    N004DepsitoJudicial1: TMenuItem;
    N635DepsitoJudicialIR1: TMenuItem;
    N013ContadePoupana1: TMenuItem;
    N022ContaCadernetedePoupanaPessoaJurdica1: TMenuItem;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    DBRealEdit2: TDBRealEdit;
    CmPromotor: TCMProcuraSubTipo;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FazerQryCCusto;
    procedure CContabilExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbDesembolsoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure spdDesembxFornClick(Sender: TObject);
    procedure spdDesembFornClick(Sender: TObject);
    procedure spdFornxRamoClick(Sender: TObject);
    procedure spdRamosFornClick(Sender: TObject);
    procedure SbtImpAddAgregClick(Sender: TObject);
    procedure SbtImpDelAgregClick(Sender: TObject);
    procedure dblkBancoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BtnBuscaAgenciaClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure PessoaSaveSubtipo(Sender: TObject);
    procedure PessoaChangeSubtipo(IdPessoa: Integer);
    procedure dbedContaEnter(Sender: TObject);
    procedure RgTipoContaClick(Sender: TObject);
    procedure N001ContaCorrente1Click(Sender: TObject);
  private
    sMascaraNumAgencia :String;
    bDeleteDetalhe :Boolean;      
    lDelete, lImpostos , lIdPessoa :Integer;
    function  VerificaCodCorrespondente :Boolean;
    procedure AbreQryTipoClixReceb(iPessoa:Integer);
    Function  LerStringReg (ChaveRaiz : HKey;
                       Chave,Valor : String;
                       Default : string) : String;
    function BusacaIdAgencia(idBanco :LongInt; sNumAgencia: String): LongInt;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.DFM}

Uses UAutorizacao,UMensErro, DBaseDados, USistema, uDataBase, uFuncaoGeral, DCmBack, uCalcDv;


procedure TfrmCadCliente.FormActivate(Sender: TObject);
begin
Inherited;
   {**
     Verificado!
     Não será implementado na tela nova.
   **}
   If qryTipClie.Active Then qryTipClie.Close;
   qryTipClie.Open;

   If qrySubconta.Active Then qrySubconta.Close;
   If (Not IsDB2_Padrao) And (Not qrySubconta.Prepared) Then qrySubconta.Prepare;
   qrySubconta.Params[0].AsFloat := Sistema.IdEmpresa;
   qrySubconta.Open;

   If QryUnidNegoc.Active Then QryUnidNegoc.Close;
   QryUnidNegoc.ParamByname('IDPESSOA').AsFloat := Sistema.idEmpresa;
   QryUnidNegoc.Open;
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
Var
  sDirEnvia:String;
begin
  inherited;
  {** Verificado! **}

  {Foi Implementado no form do PESSOA}
  If IsDb2_Padrao Then
  Begin
    QryBuscaAgencia.Close;
    QryBuscaAgencia.Sql.Text :=
    'SELECT A.IDPESSOA FROM AGENCIABANCARIA A WHERE ( A.IDBANCO =:IDBANCO ) AND ( A.NUMAGENCIA = :NUMAGENCIA )'
  End;

  bDeleteDetalhe := False;

  If QryBanco.Active Then QryBanco.Close;
  QryBanco.Open;

  {Foi implementado como TCmProcura}
  If QryClassiFiscal.Active Then QryClassiFiscal.Close;
  QryClassiFiscal.Open;

  {** Verificado! - Adicionado no form ancestral **}
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

  lDelete := 0;

  {** Verificado! - Impementado no CMParamIntegra **}
  If Sistema.IdModulo = 2 Then
  Begin
    IntegraBack.RecPag := 'R';

    If FazQuery(DtmBaseDados.Qry,'SELECT FLGINTEGRAVHL FROM PARAMFATHOTEL WHERE IDPESSOA =  ' + IntToStr(Sistema.IdEmpresa)) Then
       IntegraBack.IntegraFront     := DtmBaseDados.Qry.FieldByname('FLGINTEGRAVHL').AsString
    Else
       IntegraBack.IntegraFront     := '';

    If FazQuery(DtmBaseDados.Qry,'SELECT TIPOEMPRESA FROM EMPRESAPROP WHERE IDPESSOA = ' + inttostr(Sistema.idEmpresa)) Then
       IntegraBack.TipoEmpresa := DtmBaseDados.Qry.FieldByName('TIPOEMPRESA').AsString
    Else
       IntegraBack.TipoEmpresa := 'H';

    If FazQuery(DtmBaseDados.Qry,'SELECT INTEGRACONTAB FROM PARAMCAP ' +
                                 ' WHERE (IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ') AND ' +
                                 '       (RECPAG = ''R'')') Then
    Begin
       IntegraBack.Contabilidade := DtmBaseDados.Qry.Fields[0].AsString;

       If FazQuery(DtmBaseDados.Qry,'SELECT PLANO FROM PARAMCONTAB ' +
                                    ' WHERE (IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')') Then
       Begin
              IntegraBack.Plano         := DtmBaseDados.Qry.Fields[0].AsInteger;
              If FazQuery(DtmBaseDados.Qry,'SELECT MASCARA FROM PLANO ' +
                                           ' WHERE (PLANO = ' + IntToStr(IntegraBack.Plano) + ')') Then
                 IntegraBack.MascaraPlano  := DtmBaseDados.Qry.Fields[0].AsString
              Else
                 IntegraBack.MascaraPlano  := '';

              If FazQuery(DtmBaseDados.Qry,'SELECT MASCARACLIENTE FROM PARAMGLOBAL ' +
                                           ' WHERE (IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')') Then
                 IntegraBack.MascaraCliente := DtmBaseDados.Qry.Fields[0].AsString
              Else
                 IntegraBack.MascaraCliente := 'aaaaa-aa'
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

  {** Atenção! **}
  If Integraback.IntegraFront = 'S' Then
     DsFront.DataSet    := QryEmpresaVh
  Else
     If Integraback.IntegraFront = 'A' Then
     Begin
       sDirEnvia := LerStringReg(HKEY_CURRENT_USER,'\Software\CM\IntegraVHLBack','DirBaseEnvia','');
       DbAccess.Close;
       DbAccess.Params.Clear;
       DbAccess.Params.Add('DATABASE NAME='+sDirEnvia+'\Envia.mdb');
       DbAccess.Params.Add('OPEN MODE=READ/WRITE');
       DbAccess.Params.Add('USER NAME=ADMIN');
       DbAccess.Open;
       DsFront.DataSet    := QryAccess;
     End
     Else
        DsFront.DataSet    := QryEmpresaVhModelo;

  {** Verificado! **}
  If IntegraBack.Contabilidade = 'S' Then
  Begin

    TbsContabil.TabVisible := True;

    CContabil.Plano := IntegraBack.Plano;
    CContabil.Mascara := IntegraBack.MascaraPlano;

    CContabil1.Plano := IntegraBack.Plano;
    CContabil1.Mascara := IntegraBack.MascaraPlano;

    CContabil2.Plano := IntegraBack.Plano;
    CContabil2.Mascara := IntegraBack.MascaraPlano;

  End
  Else
    TbsContabil.TabVisible := False;

  {** Verificado! - Implementado no form ancestral **}
  If DtmCmBack.QryParGlobal.Active Then DtmCmBack.QryParamGlobal.Close;
  DtmCmBack.QryParGlobal.ParamByname('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  DtmCmBack.QryParGlobal.Open;

  If Not DtmCmBack.QryParGlobalMASCARANUMAGENCIA.IsNull Then
     sMascaraNumAgencia := DtmCmBack.QryParGlobalMASCARANUMAGENCIA.AsString + ';1; '
  Else
     sMascaraNumAgencia := '';

  DbeAgencia.Enabled := (DtmCmBack.QryParGlobalFLGCRIAAGENCIA.AsString = 'S');

  DtmCmBack.QryParGlobal.Close;

  {** Verificado! **}
  If Sistema.TipoEmpresa = 'P' Then
     qrySubTipoCODCLIENTE.EditMask := ''
  Else
     qrySubTipoCODCLIENTE.EditMask := IntegraBack.MascaraCliente + ';1;';

  {** Atenção! **}   
  AbreQryTipoClixReceb(0);
end;

procedure TfrmCadCliente.CmeCadastroInsert(Sender: TObject);
begin
  lDelete := 0;
  Inherited;
  {** Verificado! **}
  qryGeral.Insert;
  lIdPessoa        := qryIDPESSOA.AsInteger;
  qryGeralFLGSTATUS.AsString := 'A';

  {** Atenção! **}
  AbreQryTipoClixReceb(qryIDPESSOA.AsInteger);
  TbsGeral.Enabled := True;
end;

procedure TfrmCadCliente.CmeCadastroEdit(Sender: TObject);
begin
  lDelete := 0;
  Inherited;
  qryGeral.Edit;
  lIdPessoa        := qryIDPESSOA.AsInteger;
  If qryGeralFLGSTATUS.IsNull Then qryGeralFLGSTATUS.AsString := 'A';

  {** Atenção! **}
  CContabilExit(Self);
  TbsGeral.Enabled := True;
end;

procedure TfrmCadCliente.CmeCadastroDelete(Sender: TObject);
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
  {** Atenção! **}
  lDelete := 1;
  
  DeletaQry([qryGeral, qryClixReceb, qryClixTipoCli, QryImpAgregxForn, qryContaBancaria]);

  AplicaAlteracoes([qryGeral, qryClixTipoCli, qryClixReceb, QryImpAgregxForn, qryContaBancaria]);

  Inherited;

  lDelete := 0;
end;

function TfrmCadCliente.VerificaCodCorrespondente: Boolean;
Var QryAuxSubTipo: TwwQuery;
begin
  {** Verificado! **}
  Result := qrySubTipoCODCLIENTE.isnull;

  If Result Then Exit;

  QryAuxSubTipo := TwwQuery.Create(Application);

 Try
  If Sistema.ConectaRemoto Then
     QryAuxSubTipo.Databasename := 'BaseRemota'
  Else
     QryAuxSubTipo.Databasename := 'BaseDados';

  QryAuxSubTipo.Sql.Text := 'Select IDPESSOA From clientepess where RTRIM(codcliente) = RTRIM(''' + qrySubTipoCODCLIENTE.AsString + ''') AND IDPESSOA <> ' + FloatToStr(qryIDPESSOA.AsFloat);

  QryAuxSubTipo.Open;
  Result := QryAuxSubTipo.IsEmpty;

  If Not Result Then MsgDlg('Código Correspondente já cadastrado','Atenção',mtError,[mbOk],0);
  Finally
    QryAuxSubTipo.Close;
    QryAuxSubTipo.Free;
  End;
End;

procedure TfrmCadCliente.FazerQryCCusto;
begin
  {** Verificado! **}
  FazQuery(qryCCusto,'SELECT CENT.CODCENTROCUSTO,CENT.NOME FROM CENTCUST CENT '+
                     'WHERE CODCENTROCUSTO IN (SELECT CODCENTROCUSTO FROM CONTASxCC CONT '+
                     'WHERE CONT.IDEMPRESA = CENT.IDEMPRESA   AND ' +
                     '      CONT.CODCENTROCUSTO= CENT.CODCENTROCUSTO   AND ' +
                     '      CONT.IDEMPRESA = '+ IntToStr(Sistema.IdEmpresa) + ' AND ' +
                     '      CONT.PLANO = ' + InttoStr(IntegraBack.Plano) + ' AND ' +
                     '      CONT.PLACONTA = ''' + CContabil.Conta.Numero + ''')');
End;

procedure TfrmCadCliente.CContabilExit(Sender: TObject);
begin
  inherited;
  {** Verificado! **}
  dblcCCusto.Enabled   := CContabil.Conta.ObrigaCentrodeCusto;
  dblkSubconta.Enabled := CContabil.Conta.ObrigaSubConta;
  FazerQryCCusto;
end;

procedure TfrmCadCliente.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  {** Verificado! **}
  TbsGeral.Enabled := False;
end;

Procedure TfrmCadCliente.CmeCadastroConfirma(Sender: TObject);
Var
  sOp, sAcao, sCodCliente, sIdPessoa_Empresa: String;
  sRAMAL,sCONTATO,sDDI,sDDD,sNUMERO,sLOGRADOURO,sBAIRRO,sCIDADE,sCEP
  ,sCODINTERNACIONAL,sCODESTADO,sIDENDERECO,sNome,sRazaoSocial
  ,sEmail,sCgc,sCpf,sCliente,sErro, sCredito, SauxCreDito: String;
Begin
   {** Atenção! ** - Verificar a integração com o frontoffice}
   sIdPessoa_Empresa := Qry.FieldByName('IDPESSOA').AsString;

   If (Integraback.IntegraFront = 'S') Or
      (Integraback.IntegraFront = 'A') Or
      (Integraback.IntegraFront = 'V') Then
      Case CmeCadastro.Operacao Of
        opInserir: sOp := 'I';
        opAlterar: sOp := 'U';
        opApagar: sOp  := 'D';
      End;

   If sOp <> 'D' Then
   Begin
     sCredito := qryGeralFLGSITCREDITO.ASString;
     Inherited;
   End;


   If (Integraback.IntegraFront = 'S') Or
      (Integraback.IntegraFront = 'A') Or
      (Integraback.IntegraFront = 'V') Then
   Begin
      sRAMAL             := '';
      sCONTATO           := '';
      sDDI               := '';
      sDDD               := '';
      sNUMERO            := '';
      sLOGRADOURO        := '';
      sBAIRRO            := '';
      sCIDADE            := '';
      sCEP               := '';
      sCODINTERNACIONAL  := '';
      sCODESTADO         := '';
      sCEP               := '';
      sIDENDERECO        := '';
      sNome              := '';
      sRazaoSocial       := '';
      sEmail             := '';
      sCgc               := '';
      sCpf               := '';
      sCliente           := '';

      // >>>> Busca Consulta Para Atualizacao do Pessoa No
      Try
        DtmBaseDados.Qry.Close;
        DtmBaseDados.Qry.Sql.Text :=  'SELECT IDPESSOA,CODCLIENTE FROM CLIENTEPESS WHERE IDPESSOA = ' + sIdPessoa_Empresa + ' AND CODCLIENTE IS NOT NULL';
        DtmBaseDados.Qry.Open;

        sCodCliente := DtmBaseDados.Qry.FieldByName('CODCLIENTE').AsString;

        {
          Atualiza os Dados do Contrato no CONTRATOVHL e no CONTRCLIHOTEL

          UPDATE CONTRCLIHOTEL SET CREDITO = L > Liberado, H > Bloqueado Pelo Hotel, M > Bloqueado Pela matriz, G > Liberado Pelo Gerente
          WHERE IDFORCLI = sIdPessoa_Empresa

          UPDATE CONTRATOVHL SET CREDITO = l > Linerado, B > Bloqueado
          WHERE COD_EMPRESA = sCodCliente
        }


        Try
           DtmBaseDados.dbBaseDados.StartTransaction;

           if sCredito = 'M' Then
              SauxCreDito := 'B'
           Else
              SauxCreDito := sCredito;

           DtmBaseDados.dbBaseDados.Execute('UPDATE CONTRATOVHL SET CREDITO = ' + QuotedStr(SauxCreDito) +
                        ' WHERE COD_EMPRESA = ' + QuotedStr(sCodCliente) );
           DtmBaseDados.dbBaseDados.Commit;
        Except
           DtmBaseDados.dbBaseDados.Rollback
        End;

        Try
           if sCredito = 'B' Then
              SauxCreDito := 'H'
           Else
              SauxCreDito := sCredito;

           DtmBaseDados.dbBaseDados.StartTransaction;
           DtmBaseDados.dbBaseDados.Execute('UPDATE CONTRCLIHOTEL SET CREDITO = ' + QuotedStr(SauxCreDito) +
                        ' WHERE IDFORCLI = ' + sIdPessoa_Empresa );
           DtmBaseDados.dbBaseDados.Commit;
        Except
           DtmBaseDados.dbBaseDados.Rollback;
        End;

        If (sOp = 'I') OR (sOp = 'U')  Then
        Begin
         If Not DtmBaseDados.Qry.IsEmpty Then
         Begin
          DtmBaseDados.Qry.Close;
          DtmBaseDados.Qry.Sql.Text := 'SELECT NOME, RAZAOSOCIAL, NUMDOCUMENTO,TIPO, EMAIL FROM PESSOA WHERE IDPESSOA = ' + sIdPessoa_Empresa;
          DtmBaseDados.Qry.Open;

          If Not DtmBaseDados.Qry.IsEmpty Then
          Begin
               //Busca dados do Pessoa
               sNome        := DtmBaseDados.Qry.FieldByName('NOME').AsString;
               sRazaoSocial := DtmBaseDados.Qry.FieldByName('RAZAOSOCIAL').AsString;
               sEmail       := DtmBaseDados.Qry.FieldByName('EMAIL').AsString;
               sCliente     := 'True';


               If DtmBaseDados.Qry.FieldByName('TIPO').AsString = 'J' Then
                  sCgc := FormatMaskText('99.999.999/9999-99;0; ',DtmBaseDados.Qry.FieldByName('NUMDOCUMENTO').AsString)
               Else
                  sCpf := FormatMaskText('999.999.999-99;0; ',DtmBaseDados.Qry.FieldByName('NUMDOCUMENTO').AsString);

               //Busca dados do Endereço
               DtmBaseDados.Qry.Close;

               DtmBaseDados.Qry.Sql.Text :=
                   'SELECT ' +
                   ' E.NUMERO, E.IDENDERECO, E.LOGRADOURO, E.BAIRRO, C.NOME AS CIDADE, ' +
                   ' E.CEP, P.CODINTERNACIONAL, ES.CODESTADO, E.CEP ' +
                   'FROM ' +
                     ' ENDPESS E, CIDADES C, ESTADO ES, PAIS P, PESSOA PE ' +
                   'WHERE ' +
                   ' (E.IDPESSOA = ' + sIdPessoa_Empresa + ') AND ' +
                   ' (ES.IDPAIS = P.IDPAIS(+)) AND ' +
                   ' (E.IDCIDADES = C.IDCIDADES(+)) AND '+
                   ' (ES.IDESTADO(+) = C.IDESTADO)  AND ' +
                   ' (E.IDENDERECO(+) = PE.IDENDCOMERCIAL) AND ' +
                   ' (E.IDPESSOA = PE.IDPESSOA)';

               DtmBaseDados.Qry.Open;
               If Not DtmBaseDados.Qry.IsEmpty Then
               Begin
                    sLOGRADOURO           := DtmBaseDados.Qry.FieldByName('LOGRADOURO').AsString + ' ' + DtmBaseDados.Qry.FieldByName('NUMERO').AsString;
                    sBAIRRO               := DtmBaseDados.Qry.FieldByName('BAIRRO').AsString;
                    sCIDADE               := DtmBaseDados.Qry.FieldByName('CIDADE').AsString;
                    sCEP                  := DtmBaseDados.Qry.FieldByName('CEP').AsString;
                    sCODINTERNACIONAL     := DtmBaseDados.Qry.FieldByName('CODINTERNACIONAL').AsString;
                    sCODESTADO            := DtmBaseDados.Qry.FieldByName('CODESTADO').AsString;
                    sIDENDERECO           := DtmBaseDados.Qry.FieldByName('IDENDERECO').AsString;

                    //Busca dados do Telefone
                    DtmBaseDados.Qry.Close;
                    DtmBaseDados.Qry.Sql.Text := 'SELECT DDI, DDD, NUMERO FROM TELENDPESS WHERE IDENDERECO = ' + sIDENDERECO;
                    DtmBaseDados.Qry.Open;

                    If Not DtmBaseDados.Qry.IsEmpty Then
                    Begin
                         sDDI    := DtmBaseDados.Qry.FieldByName('DDI').AsString;
                         sDDD    := DtmBaseDados.Qry.FieldByName('DDD').AsString;
                         sNUMERO := DtmBaseDados.Qry.FieldByName('NUMERO').AsString;
                    End; // Sem Telefone

                    //Busca o Contato do Telefone
                    DtmBaseDados.Qry.Close;
                    DtmBaseDados.Qry.Sql.Text := ' SELECT TC.RAMAL, C.NOME FROM CONTATOPESS C, TELCONTATO TC, TELENDPESS T WHERE ' +
                    ' TC.IDTELEFONE = T.IDTELEFONE AND TC.IDCONTATO = C.IDCONTATO AND ' +
                    ' T.IDENDERECO = ' + sIDENDERECO;
                    DtmBaseDados.Qry.Open;

                    If Not DtmBaseDados.Qry.IsEmpty Then
                    Begin
                         sRAMAL    := DtmBaseDados.Qry.FieldByName('RAMAL').AsString;
                         sCONTATO  := DtmBaseDados.Qry.FieldByName('NOME').AsString;
                    End; //Sem Contato
               End; //Sem Endereço

               DsFront.DataSet.Close;
               If (Not IsDB2_Padrao) And (Not (DsFront.DataSet As TwwQuery).Prepared) Then (DsFront.DataSet As TwwQuery).Prepare;
               (DsFront.DataSet As TwwQuery).Params[0].AsString := UpperCase(Trim(sCodCliente));
               If Integraback.IntegraFront = 'A' Then
                  (DsFront.DataSet As TwwQuery).Params[1].AsFloat := Sistema.IdEmpresa;
               DsFront.DataSet.Open;

               If DsFront.DataSet.IsEmpty Then
                  DsFront.DataSet.Append
               Else
                   DsFront.DataSet.Edit;

               DsFront.DataSet.FieldByName('RAMAL1').AsString := sRAMAL;
               DsFront.DataSet.FieldByName('CONTATO1').AsString := sCONTATO;
               DsFront.DataSet.FieldByName('DDI').AsString := sDDI;
               DsFront.DataSet.FieldByName('DDD').AsString := sDDD;
               DsFront.DataSet.FieldByName('TELEFONE1').AsString := FormatMaskText('9999-9999;0; ',sNUMERO);
               DsFront.DataSet.FieldByName('ENDERECO').AsString := sLOGRADOURO;
               DsFront.DataSet.FieldByName('BAIRRO').AsString := sBAIRRO;
               DsFront.DataSet.FieldByName('CIDADE').AsString := sCIDADE;
               DsFront.DataSet.FieldByName('CEP').AsString := sCEP;
               If Integraback.IntegraFront = 'S' Then
               Begin
                  DsFront.DataSet.FieldByName('PAIS').AsString := sCODINTERNACIONAL;
                  DsFront.DataSet.FieldByName('ESTADO').AsString := sCODESTADO;
               End
               Else
                 If Integraback.IntegraFront = 'V' Then
                 Begin
                    DsFront.DataSet.FieldByName('COD_PAIS').AsString := sCODINTERNACIONAL;
                    DsFront.DataSet.FieldByName('COD_ESTADO').AsString := sCODESTADO;
                 End
                 Else
                   Begin
                     DsFront.DataSet.FieldByName('PAIS').AsString     := sCODINTERNACIONAL;
                     DsFront.DataSet.FieldByName('ESTADO').AsString   := sCODESTADO;
                     DsFront.DataSet.FieldByName('IDHOTEL').AsFloat := Sistema.IdEmpresa;
                   End;

               DsFront.DataSet.FieldByName('NOME_FANTASIA').AsString := sNome;
               DsFront.DataSet.FieldByName('RAZAO_SOCIAL').AsString := sRazaoSocial;
               DsFront.DataSet.FieldByName('EMAIL').AsString := sEmail;
               DsFront.DataSet.FieldByName('CGC').AsString := sCgc;
               DsFront.DataSet.FieldByName('CPF').AsString := sCpf;
               DsFront.DataSet.FieldByName('CLIENTE').AsString := '';
               DsFront.DataSet.FieldByName('COD_EMPRESA').AsString := sCodCliente;

               DsFront.DataSet.Post;
               If (DsFront.DataSet As TwwQuery).CachedUpdates Then
                  (DsFront.DataSet As TwwQuery).ApplyUpdates;
               DsFront.DataSet.Close;
          End; //Sem Pessoa;
         End;
        End //Fim da Operações para Insets e Updtes
        Else
        Begin
         If (sOp = 'D') And (Integraback.IntegraFront <> 'A') Then
         Begin
          If Not DtmBaseDados.Qry.IsEmpty Then
          Begin
            DsFront.DataSet.Close;
            If (Not IsDB2_Padrao) And (Not (DsFront.DataSet As TwwQuery).Prepared) Then (DsFront.DataSet As TwwQuery).Prepare;
            (DsFront.DataSet As TwwQuery).Params[0].AsString := UpperCase(Trim(sCodCliente));
            DsFront.DataSet.Open;

            If Not DsFront.DataSet.IsEmpty Then
                   DsFront.DataSet.Delete;
            (DsFront.DataSet As TwwQuery).ApplyUpdates;
            DsFront.DataSet.Close;
          End;
         End;
        End; //Fim Das Operações de Delete
      Except
        On E:Exception Do
        Begin
             If sOp = 'I' Then
                sAcao := 'Inserindo'
             Else
                 If sOp = 'U' Then
                    sAcao := 'Alterando'
                 Else
                    sAcao := 'Excluindo';

             sErro := 'ERRO ' + sAcao + ' Registo de Empreas No VH ( Front ) Para o Cliente Com ' + (#13+#10) +
                      ' IdPessoa = ' + sIdPessoa_Empresa + ' e Código Correspondente = ' + sCodCliente + (#13+#10) +
                       '/* ' + E.Message + ' */';
             MsgDlg(sErro,'Erro',mtError,[mbOk],0);
        End;
      End;
   End;
End;


procedure TfrmCadCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {** Atenção! ** - Verificar a integração com o front}
  If DsFront.DataSet.Active Then
  Begin
     If (DsFront.DataSet As TwwQuery).CachedUpdates And
        (DsFront.DataSet As TwwQuery).UpdatesPending Then (DsFront.DataSet As TwwQuery).CancelUpdates;
     DsFront.DataSet.Close
  End;
  If (Not IsDB2_Padrao) And ((DsFront.DataSet As TwwQuery).Prepared) Then (DsFront.DataSet As TwwQuery).UnPrepare;
  If dbVH.Connected Then dbVH.Connected := False;
  If DbAccess.Connected Then DbAccess.Connected := False;
  inherited;
end;

procedure TfrmCadCliente.dbDesembolsoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  {** Atenção! **}
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

procedure TfrmCadCliente.spdDesembxFornClick(Sender: TObject);
Var
  sCodDesemb: String;
begin
  inherited;
  {** Atenção! **}
  if Not qryDesembolso.IsEmpty Then
  Begin
    sCodDesemb := Trim(qryDesembolso.FieldByName('CODTIPRECDES').AsString);
    Repeat
      QryClixReceb.Append;
      QryClixReceb.FieldByName('IDPESSOA').AsFloat      := qry.FieldByName('IDPESSOA').AsFloat;
      QryClixReceb.FieldByName('ANASINT').AsString        := qryDesembolso.FieldByName('ANASINT').AsString;
      QryClixReceb.FieldByName('IDCLIXRECEB').AsFloat   := LeUltRegistro(nil, 'CLIXRECEB');
      QryClixReceb.FieldByName('CODTIPRECDES').AsString   := qryDesembolso.FieldByName('CODTIPRECDES').AsString;
      QryClixReceb.FieldByName('RECPAG').asString         := IntegraBack.Recpag;
      QryClixReceb.FieldByName('IDEMPRESA').AsFloat     :=  Sistema.IdEmpresa;
      QryClixReceb.FieldByName('DESCRICAO').AsString      := qryDesembolso.FieldByName('DESCRICAO').AsString;
      QryClixReceb.Post;
      qryDesembolso.Delete;
    Until Pos(sCodDesemb,Trim(qryDesembolso.FieldByName('CODTIPRECDES').AsString)) <> 1;
  End;
end;

procedure TfrmCadCliente.spdDesembFornClick(Sender: TObject);
Var
  sCodDesemb: String;
begin
  inherited;
  {** Atenção! **}
  if Not QryClixReceb.IsEmpty Then
  Begin
    sCodDesemb := Trim(QryClixReceb.FieldByName('CODTIPRECDES').AsString);
    Repeat
      qryDesembolso.Append;
      qryDesembolso.FieldByName('CODTIPRECDES').AsString := QryClixReceb.FieldByName('CODTIPRECDES').AsString;
      qryDesembolso.FieldByName('DESCRICAO').AsString    := QryClixReceb.FieldByName('DESCRICAO').AsString;
      qryDesembolso.FieldByName('ANASINT').AsString      := QryClixReceb.FieldByName('ANASINT').AsString;
      qryDesembolso.FieldByName('RECPAG').AsString       := IntegraBack.Recpag;
      qryDesembolso.FieldByName('IDPESSOA').AsFloat    := Sistema.IdEmpresa;
      qryDesembolso.Post;
      QryClixReceb.Delete;
    Until Pos(sCodDesemb,Trim(QryClixReceb.FieldByName('CODTIPRECDES').AsString)) <> 1;
  End;
end;

procedure TfrmCadCliente.AbreQryTipoClixReceb(iPessoa:Integer);
Begin
  {** Atenção! **}
  If qryDesembolso.Active         Then
  Begin
    If qryDesembolso.UpdatesPending Then qryDesembolso.CancelUpdates;
    qryDesembolso.Close;
  End;

  If (Not IsDB2_Padrao) And (Not qryDesembolso.Prepared) Then qryDesembolso.Prepare;
  qryDesembolso.ParamByName('PIDEMPRESA').AsFloat := FuncaoGeral.Decode(iPessoa,0,0,Sistema.IdEmpresa);
  qryDesembolso.ParamByName('PIDPESSOA').AsFloat  := iPessoa;
  qryDesembolso.Open;

  If qryClixReceb.Active       Then
  Begin
    If qryClixReceb.UpdatesPending Then qryClixReceb.CancelUpdates;
    qryClixReceb.Close;
  End;

  If (Not IsDB2_Padrao) And (Not qryClixReceb.Prepared) Then qryClixReceb.Prepare;
  qryClixReceb.ParamByName('PIDEMPRESA').AsFloat := FuncaoGeral.Decode(iPessoa,0,0,Sistema.IdEmpresa);
  qryClixReceb.ParamByName('PIDPESSOA').AsFloat  := iPessoa;
  qryClixReceb.Open;

  If qryDesembolso.Active         Then
  Begin
    If qryDesembolso.UpdatesPending Then qryDesembolso.CancelUpdates;
    qryDesembolso.Close;
  End;

  If (Not IsDB2_Padrao) And (Not qryDesembolso.Prepared)  Then qryDesembolso.Prepare;
  qryDesembolso.ParamByName('PIDEMPRESA').AsFloat := FuncaoGeral.Decode(iPessoa,0,0,Sistema.IdEmpresa);
  qryDesembolso.ParamByName('PIDPESSOA').AsFloat  := iPessoa;
  qryDesembolso.Open;

  If qryClixReceb.Active       Then
  Begin
    If qryClixReceb.UpdatesPending Then qryClixReceb.CancelUpdates;
    qryClixReceb.Close;
  End;

  If (Not IsDB2_Padrao) And (Not qryClixReceb.Prepared) Then qryClixReceb.Prepare;
  qryClixReceb.ParamByName('PIDEMPRESA').AsInteger := FuncaoGeral.Decode(iPessoa,0,0,Sistema.IdEmpresa);
  qryClixReceb.ParamByName('PIDPESSOA').AsInteger  := iPessoa;
  qryClixReceb.Open;

  If QryTiposCli.Active         Then
  Begin
    If QryTiposCli.UpdatesPending Then QryTiposCli.CancelUpdates;
    QryTiposCli.Close;
  End;

  If (Not IsDB2_Padrao) And (Not QryTiposCli.Prepared)  Then QryTiposCli.Prepare;
  QryTiposCli.ParamByName('IDPESSOA').AsFloat  := iPessoa;
  QryTiposCli.Open;

  If qryClixTipoCli.Active       Then
  Begin
    If qryClixTipoCli.UpdatesPending Then qryClixTipoCli.CancelUpdates;
    qryClixTipoCli.Close;
  End;

  If (Not IsDB2_Padrao) And (Not qryClixTipoCli.Prepared) Then qryClixTipoCli.Prepare;
  qryClixTipoCli.ParamByName('IDPESSOA').AsFloat  := iPessoa;
  qryClixTipoCli.Open;

  If QryImpAgreg.Active       Then QryImpAgreg.Close;
  If (Not IsDB2_Padrao) And (Not QryImpAgreg.Prepared) Then QryImpAgreg.Prepare;

  If iPessoa = 0 Then
     QryImpAgreg.ParamByName('PIDPESSOA').AsInteger  := 0
  Else
     QryImpAgreg.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;

  QryImpAgreg.ParamByName('PIDFORCLI').AsInteger  := iPessoa;
  QryImpAgreg.ParamByName('RECPAG').AsString      := IntegraBack.RecPag;
  QryImpAgreg.Open;

  If QryImpAgregxForn.Active       Then QryImpAgregxForn.Close;
  If (Not IsDB2_Padrao) And (Not QryImpAgregxForn.Prepared) Then QryImpAgregxForn.Prepare;

  If iPessoa = 0 Then
     QryImpAgregxForn.ParamByName('PIDPESSOA').AsInteger  := 0
  Else
     QryImpAgregxForn.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;

  QryImpAgregxForn.ParamByName('PIDFORCLI').AsInteger := iPessoa;
  QryImpAgregxForn.ParamByName('RECPAG').AsString     := IntegraBack.RecPag;
  QryImpAgregxForn.Open;
End;

Function TfrmCadCliente.LerStringReg (ChaveRaiz : HKey;
                       Chave,Valor : String;
                       Default : string) : String;
var
   Resultado : string;
   Reg           : TRegistry;

begin
   Result := Default;
   Reg         := TRegistry.Create;
   Reg.RootKey := ChaveRaiz;
   if not Reg.OpenKey(Chave,false) then begin
      ShowMessage('Erro ao ler a chave '  +  Chave);
      exit;
   end;

   try
     Resultado := Reg.ReadString(Valor);
   except
     { Erro ao tentar ler o valor - retorna vazaio }
     Resultado := Default;
   end;

   Result := Resultado;

   Reg.CloseKey;
   Reg.Free;
end;


procedure TfrmCadCliente.spdFornxRamoClick(Sender: TObject);
begin
  inherited;
  {** Atenção! **}
  If Not QryTiposCli.IsEmpty Then
  Begin
    qryClixTipoCli.Append;
    qryClixTipoCliIDPESSOA.AsFloat      := qryClixTipoCli.ParamByName('IDPESSOA').AsFloat;
    qryClixTipoCliDESCRICAO.AsString    := QryTiposCliDESCRICAO.AsString;
    qryClixTipoCliIDTIPOCLIENTE.AsFloat := QryTiposCliIDTIPOCLIENTE.AsFloat;
    qryClixTipoCli.Post;
    QryTiposCli.Delete;
  End;
end;

procedure TfrmCadCliente.spdRamosFornClick(Sender: TObject);
begin
  inherited;
  {** Atenção! **}
  If Not qryClixTipoCli.IsEmpty Then
  Begin
    QryTiposCli.Append;
    QryTiposCliDESCRICAO.AsString    := qryClixTipoCliDESCRICAO.AsString;
    QryTiposCliIDTIPOCLIENTE.AsFloat := qryClixTipoCliIDTIPOCLIENTE.AsFloat;
    QryTiposCli.Post;
    qryClixTipoCli.Delete;
  End;
end;

procedure TfrmCadCliente.SbtImpAddAgregClick(Sender: TObject);
begin
  inherited;
  {** Atenção! **}
  lImpostos := 1;
  If Not QryImpAgreg.IsEmpty Then
  Begin
    QryImpAgregxForn.Append;
    QryImpAgregxFornDESCCUSTAGREG.AsString     := QryImpAgregDESCCUSTAGREG.ASString;
    QryImpAgregxFornCODTIPOCUSTAGREG.AsFloat := QryImpAgregCODTIPOCUSTAGREG.AsFloat;
    QryImpAgregxFornIDPESSOA.AsFloat         := Sistema.IdEmpresa;
    QryImpAgregxFornRECPAG.AsString            := IntegraBack.RecPag;
    if lIdPessoa <> 0 Then
       QryImpAgregxFornIDFORCLI.AsFloat := lIdPessoa
    else
       QryImpAgregxFornIDFORCLI.AsFloat   := qry.FieldByName('IDPESSOA').AsFloat;
    QryImpAgregxForn.Post;
    QryImpAgreg.Delete;
  End;
end;

procedure TfrmCadCliente.SbtImpDelAgregClick(Sender: TObject);
begin
  inherited;
  {** Atenção! **}
  lImpostos := 1;
  If Not QryImpAgregxForn.IsEmpty Then
  Begin
    QryImpAgreg.Append;
    QryImpAgregDESCCUSTAGREG.ASString     := QryImpAgregxFornDESCCUSTAGREG.AsString;
    QryImpAgregCODTIPOCUSTAGREG.AsFloat := QryImpAgregxFornCODTIPOCUSTAGREG.AsFloat;
    QryImpAgreg.Post;
    QryImpAgregxForn.Delete;
  End;
end;

procedure TfrmCadCliente.dblkBancoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  {** Verificado! **}
  If (sMascaraNumAgencia = '') Then
  Begin
     If (Not qryBancoMASCARAAGENCIA.IsNull) Then
        qryContaBancariaNUMAGENCIA.EditMask := qryBancoMASCARAAGENCIA.AsString + ';1; '
     Else
        qryContaBancariaNUMAGENCIA.EditMask := '';
  End
  Else
     qryContaBancariaNUMAGENCIA.EditMask := sMascaraNumAgencia;

  If (Not qryBancoMASCARACC.IsNull) Then
     qryContaBancariaCONTACORRENTE.EditMask := qryBancoMASCARACC.AsString + ';1; '
  Else
     qryContaBancariaCONTACORRENTE.EditMask := '';

  qryContaBancariaNOMEBANCO.AsString := qryBancoRAZAOSOCIAL.AsString;
  qryContaBancariaNUMBANCO.AsString := qryBancoNUMBANCO.AsString;

  If Not (qryContaBancaria.State In [DsEdit, DsInsert]) Then qryContaBancaria.Edit;
end;

procedure TfrmCadCliente.BtnBuscaAgenciaClick(Sender: TObject);
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
    If MsBanco.RetornouValor Then
       qryContaBancariaNUMAGENCIA.AsString := MsBanco.ValoresChave[0]
  End;
end;

procedure TfrmCadCliente.CmeDetalheInsert(Sender: TObject);
Begin
  Inherited;
  {** Verificado! **}
  If tbcDetalhe.TabIndex = 5 Then
     With qryContaBancaria Do
     Begin
       FieldByName('IDCBANCARIA').AsFloat     := LeUltRegistro(nil, 'CONTABANCARIA');
       FieldByName('IDPESSOA').AsFloat      := lIdPessoa;
       FieldByName('FLGCONTAPREF').AsFloat  := 0;
       FieldByName('TIPOCONTA').AsString      := '1';
    End;
End;

procedure TfrmCadCliente.CmeDetalheEdit(Sender: TObject);
Begin
  Inherited;
  {** Verificado! **}
  If (tbcDetalhe.TabIndex = 5) And
     (qryContaBancariaTIPOCONTA.IsNull) Then
     qryContaBancariaTIPOCONTA.AsFloat := 1;
End;

procedure TfrmCadCliente.CmeDetalheConfirma(Sender: TObject);
Begin
  {** Verificado! **}
  If tbcDetalhe.TabIndex = 5 Then
  Begin
    If (Not bDeleteDetalhe) And (Not qryContaBancaria.IsEmpty) Then
    Begin
      If Not (qryContaBancaria.State In [DsEdit, DsInsert]) Then qryContaBancaria.Edit;

      If Not (((dblkBanco.Text  <> '') And (DbeAgencia.Text <> '')) Or
              ((dblkBanco.Text  =  '') And (DbeAgencia.Text =  ''))) Then
      Begin
        MsgDlg('Faltam dados para a informação da conta bancária','Atenção',mtError,[mbOk],0);
        Exit;
      End;

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

      qryContaBancariaIDAGENCIA.AsFloat := BusacaIdAgencia(qryContaBancariaIDBANCO.AsInteger,qryContaBancariaNUMAGENCIA.AsString);
    End;
  End;

  bDeleteDetalhe := False;
  Inherited;
End;

Procedure TfrmCadCliente.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Var
  iNumContaPref :Integer;
Begin
  Inherited;
  //Garante a indicação de só uma conta preferencial
  {** Verificado! **}
  iNumContaPref := 0;

  With qryContaBancaria Do
  Begin
    First;
    While Not Eof Do
    Begin
       If (qryContaBancariaFLGCONTAPREF.AsInteger = 1) Then
           Inc(iNumContaPref);
       Next;
    End; {While Not Eof Do}

    Accept := (IsEmpty Or (iNumContaPref = 1));

    If Not Accept Then
    Begin
       If iNumContaPref = 0 Then
          MsgDlg('Não foi indicada a Conta Bancária preferencial do Favorecido','Atenção',mtError,[mbOk],0)
       Else
          MsgDlg('Foi indicada mais de uma Conta Bancária preferencial do Favorecido. Favor corrigir o cadastro.','Atenção',mtError,[mbOk],0);
    End; {If Not Accept Then}
  End; {With qryContaBancaria Do}


  Accept := VerificaCodCorrespondente;

  If Accept Then
  Begin
     If (IntegraBack.TipoEmpresa = 'P') then
        Accept := (Not qryClixTipoCli.IsEmpty)
     Else
        Accept := (Trim(dblkTipClie.Text) <> '');

     If Not Accept Then
        MsgDlg('Tipo de Cliente não informado!','Atenção',mtError,[mbOk],0)
     Else
     Begin
        If IntegraBack.Contabilidade = 'S' Then
        Begin
           Accept := ((CContabil.Valida = VcOk) And
                      (CContabil1.Valida = VcOk) And
                      (CContabil2.Valida = VcOk));

           If Accept Then
           Begin
             If CContabil.Conta.ObrigaCentrodeCusto And (dblcCCusto.Text = '') Then
             Begin
                MsgDlg('A Conta do Cliente Obriga Centro de Custo','Atenção',mtError,[mbOk],0);
                If dblcCCusto.CanFocus Then dblcCCusto.SetFocus;
                Accept := False;
             End; {If CContabil.Conta.ObrigaCentrodeCusto And (dblcCCusto.Text = '') Then}
           End; {If Not Accept Then}
        End; {If IntegraBack.Contabilidade = 'S' Then}

        If Accept And
           (CmeCadastro.Operacao In [OpInserir,OpAlterar]) And
           (CmPromotor.Valida = VcOk) Then
        Begin
           If Trim(CmPromotor.Text) = '' Then
           Begin
             If Not (qryGeral.State In [DsEdit,DsInsert]) Then qryGeral.Edit;
             qryGeralIDPROMOTOR.Clear;
             qryGeral.Post;
           End; {If Trim(CmPromotor.Text) = '' Then}
           TbsGeral.Enabled := False;
        End {If (CmeCadastro.Operacao In [OpInserir,OpAlterar]) And}
        Else
          Accept := False;
     End; {If Not Accept Then}
  End;{If Accept Then}
End;

function TfrmCadCliente.BusacaIdAgencia(idBanco :LongInt; sNumAgencia: String): LongInt;
Begin
  {** Verificado! - Implementado no pessoa no padrão **}
  If QryBuscaAgencia.Active Then QryBuscaAgencia.Close;
  If (Not IsDB2_Padrao) And (Not QryBuscaAgencia.Prepared) Then QryBuscaAgencia.Prepare;
  QryBuscaAgencia.ParamByName('IDBANCO').AsFloat := idBanco;
  QryBuscaAgencia.ParamByName('NUMAGENCIA').AsString := Trim(sNumAgencia);
  QryBuscaAgencia.Open;

  If QryBuscaAgencia.IsEmpty Then
  Begin
    With QryInserePessoa Do
    Begin
      If Active Then Close;
      If (Not IsDB2_Padrao) And (Not Prepared) Then Prepare;
      ParamByName('IDPESSOA').AsFloat     := LeUltRegistro(nil,'PESSOA');
      ParamByName('NOME').AsString        := Copy('Agencia Nº ' + sNumAgencia + ' - ' + Trim(dblkBanco.Text),1,60);
      ParamByName('RAZAOSOCIAL').AsString := Copy('Agencia Nº ' + sNumAgencia + ' - ' + Trim(dblkBanco.Text),1,60);
      ParamByName('TIPO').AsString        := 'F';
      ExecSql;
    End;

    With QryInsereAgencia Do
    Begin
      If Active Then Close;
      If (Not IsDB2_Padrao) And (Not Prepared) Then Prepare;
      ParamByName('IDPESSOA').AsFloat     := QryInserePessoa.ParamByName('IDPESSOA').AsFloat;
      ParamByName('IDBANCO').AsFloat      := idBanco;
      ParamByName('NUMAGENCIA').AsString  := sNumAgencia;
      ExecSql;
    End;

    Result := QryInserePessoa.ParamByName('IDPESSOA').AsInteger;

  End
  Else
    Result := QryBuscaAgenciaIDPESSOA.AsInteger;
End;

procedure TfrmCadCliente.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  {** Verificado! **}
  bDeleteDetalhe := True;
end;

procedure TfrmCadCliente.PessoaSaveSubtipo(Sender: TObject);
begin
  inherited;
  {** Verificado! **}
  If Not (qryGeral.State In [DsInsert, DsEdit]) Then qryGeral.Edit;

  qryGeral.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;

  qryGeral.FieldByName('IDFORCLI').AsFloat := qry.FieldByName('IDPESSOA').AsFloat;

  if IntegraBack.Plano <> 0 Then
     qryGeral.FieldByName('PLANO').AsFloat := IntegraBack.Plano
  else
     qryGeral.FieldByName('PLANO').Clear;

  qryGeral.Post;

  If (qryContaBancaria.State In [DsEdit, DsInsert]) Then qryContaBancaria.Post;

  AplicaAlteracoes([qryGeral,qryClixReceb,qryClixTipoCli,qryContaBancaria]);

  if lImpostos = 1 Then
     AplicaAlteracoes([QryImpAgregxForn])
  else
     QryImpAgregxForn.CancelUpdates;

  If qryDesembolso.UpdatesPending  Then qryDesembolso.CancelUpdates;
  If QryTiposCli.UpdatesPending    Then QryTiposCli.CancelUpdates;
  If QryImpAgreg.UpdatesPending    Then QryImpAgreg.CancelUpdates;
end;

procedure TfrmCadCliente.PessoaChangeSubtipo(IdPessoa: Integer);
begin
  inherited;
  {** Verificado! **}
  if (qryGeral.Active) and (qryGeral.CachedUpdates) then qryGeral.CancelUpdates;
  qryGeral.ParamByName('IdPessoa').AsFloat  := Sistema.IdEmpresa;
  qryGeral.ParamByName('IdForncli').AsFloat := IdPessoa;
  qryGeral.Close;
  qryGeral.Open;

  With qryContaBancaria Do
  Begin
    if Active Then Close;
    if (Not IsDB2_Padrao) And (Not Prepared) Then Prepare;
    ParamByName('IDPESSOA').AsFloat := IdPessoa;
    Open;
  End;

  If IdPessoa <> 0 Then
     AbreQryTipoClixReceb(IdPessoa);
end;

procedure TfrmCadCliente.dbedContaEnter(Sender: TObject);
begin
  inherited;
  {** Verificado! **}
  If (qryBancoNUMBANCO.AsString = '104') Then
     dbedConta.PopupMenu :=  ppmCaixa
  Else
     dbedConta.PopupMenu :=  nil;
end;

procedure TfrmCadCliente.RgTipoContaClick(Sender: TObject);
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

procedure TfrmCadCliente.N001ContaCorrente1Click(Sender: TObject);
begin
  inherited;
  {** Verificado! **}
  qryContaBancariaCONTACORRENTE.AsString := Copy(IntToStr(TMenuItem(Sender).Tag),2,3);
  dbedConta.SelStart := 3;
  dbedConta.SelLength := 1;
end;

end.

