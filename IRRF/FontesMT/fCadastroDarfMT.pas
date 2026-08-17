unit fCadastroDarfMT;
// Alterações:
{ --------------------------------------------------------------------------------------------------
 N. Chamado....: WO34233
 Dt Alteração..: 18/03/2026
 Responsável...: Paulo Nobre
 Descrição.....: PROJETO CNPJ ALFANUMÉRICO
                 .Ajustando o padrão da mascara atual do CNPJ para
                  a alfanumérica: 'AA.AAA.AAA/AAAA-99'.
----------------------------------------------------------------------------------------------------
Rotina    : GeraDarf
Data      : 11/07/2016
Autor     : William Santana
SIG       : 21242
Descrição : rotina está alterando informações além das que de fato foram alteradas em tela
----------------------------------------------------------------------------------------------------
Rotina    : várias
Data      : 17/01/2007
Autor     : André Pontes
Pendência : -
Descrição : Passagem dos DataSets de Lookup para DataModule específico (dtmLookIRRF), reorganização
            do código em geral, controles renomeados segundo documento de uniformização,
            introdução da VerificaPreenchimento, etc.
----------------------------------------------------------------------------------------------------
Analista  : Bruno Bastos
Pendencia : 22063
Data      : 11/04/2006
Rotina    : GeraDarf
Descrição : Buscar o alterador de multa, juros e desconto se esses já existirem
----------------------------------------------------------------------------------------------------
Analista  : Bruno Bastos
Pendencia : 21709
Data      : 10/04/2006
Rotina    : GeraDarf
Descrição : Passei na chamada da rotina GravaDarf o parâmtero que é opcional
----------------------------------------------------------------------------------------------------
Analista  : Bruno Bastos
Pendencia : 21709
Data      : 24/03/2006
Rotina    : GeraDarf
Descrição : Testar a variável bErro antes de atualizar qualquer tabela
----------------------------------------------------------------------------------------------------
Analista  : Marchetti
Pendencia : 17264
Data      : 28/07/2004
Rotina    : GeraDarf
Descrição : Estava dando erro ao alterar um DARF  Foi verificado que o programa tentava
            criar um novo documento com o mesmo número de um documento existente
---------------------------------------------------------------------------------------------------}

//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV 
//    20041    VALIA

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlDARF, FCadastroMT, StdCtrls, DBCtrls, TREdit, wwdblook, Mask,
  wwdbedit, wwdbdatetimepicker, CMDateTimePicker, CMProcuraSubTipo,
  ComCtrls, MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro,
  ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uCtrlNatuRendimento, DBTables,
  Wwquery, UctrlLancamento, {$IFNDEF VERSAO0505} uCMTypes {$ENDIF},
  uCtrlGeradarf;

type
  TfrmCadastroDarfMT = class(TFrmCadastroMT)
    pgcDados: TPageControl;
    tbsDados1: TTabSheet;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    PSubTipoBeneficiario1: TCMProcuraSubTipo;
    grpboxDatas: TGroupBox;
    Label14: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblEmissao: TLabel;
    edtDataIniApuracao: TCMDateTimePicker;
    edtDataFimApuracao: TCMDateTimePicker;
    edtVencimento: TCMDateTimePicker;
    edtPagtoDarf: TCMDateTimePicker;
    edtDataEmissao: TCMDateTimePicker;
    DBedtCGC: TwwDBEdit;
    DBedtProcesso: TwwDBEdit;
    DBedtReferencia: TwwDBEdit;
    DBcboNatureza: TwwDBLookupCombo;
    DBchkImpresso: TDBCheckBox;
    DBedtObservacao: TwwDBEdit;
    gbValores: TGroupBox;
    lblBase: TLabel;
    lblIRRF: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lblPerc: TLabel;
    Label12: TLabel;
    DBedtVlrBase: TDBRealEdit;
    DBedtVlrMulta: TDBRealEdit;
    DBedtPercDarf: TDBRealEdit;
    DBedtVlrDarf: TDBRealEdit;
    DBedtVlrJuros: TDBRealEdit;
    tbsDados2: TTabSheet;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    lblPrograma: TLabel;
    Label17: TLabel;
    LblFormaPag: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    rgDeclaracao: TLabel;
    Label18: TLabel;
    DBcboPlanoPrevC: TwwDBLookupCombo;
    DBcboPatroC: TwwDBLookupCombo;
    DBcboPrograma: TwwDBLookupCombo;
    wwDBEdit1: TwwDBEdit;
    DBcboMunicipio: TwwDBLookupCombo;
    cboTipoProcesso: TComboBox;
    cboMedidaJudicial: TComboBox;
    cdsCodRendGer: TCMClientDataSet;
    cdsNatureza1: TCMClientDataSet;
    cdsRateio: TCMClientDataSet;
    cdsBaixa: TCMClientDataSet;
    cdsLanctoDoc: TCMClientDataSet;
    cdsLancamentos: TCMClientDataSet;
    pnlPlanoPatroC: TPanel;
    //esse cds contém sempre os dados referentes ao doc do Darf
    cdsDadosDoc: TCMClientDataSet;
    edRef: TDBEdit;
    dsDados: TDataSource;
    meOBS: TDBMemo;
    cdsDocumento: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    cdsLancAux: TCMClientDataSet;
    cdsRateioAux: TCMClientDataSet;
    cdsLancDarf: TCMClientDataSet;
    DBedtVlrDesconto: TDBRealEdit;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    DBedtVlrTotal: TDBRealEdit;

    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DBedtVlrDarfExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private

    CtrlDARF            : TCtrlDARF;
    CtrlNatuRendimento  : TCtrlNatuRendimento;
    CtrlLancamento      : TCtrlLancamento;
    CodDocumento        : LongInt;
    IdDarf              : LongInt;
    CtrlGeraDarf        : TCtrlGeraDarf;

    bErro           : Boolean;
    bGerouDocumento : Boolean;

    procedure AtualizaCombos;
    procedure GeraDarf;
    procedure AlimentaCds(cdsLanc, cdsRat : TclientDataSet);

    function  VerificaPreenchimento: Boolean;


  public  // Public declarations


  end;



var
  frmCadastroDarfMT: TfrmCadastroDarfMT;



implementation
{$R *.DFM}
uses
  uMensErro, uDataBase, DBaseDados, USistema, uString, uCtrlParamIntegra, uVerificaPreenchimento,
  dLookIRRF;



procedure TfrmCadastroDarfMT.CmeCadastroDelete(Sender: TObject);
begin
  inherited;


  cboTipoProcesso.ItemIndex   := -1;
  cboMedidaJudicial.ItemIndex := -1;
end;



procedure TfrmCadastroDarfMT.CmeCadastroEdit(Sender: TObject);
var
  iTotalDarf : integer;
begin
  inherited;

  cboTipoProcesso.ItemIndex   := -1;
  cboMedidaJudicial.ItemIndex := -1;

  AtualizaCombos;

  pnlPlanoPatroC.Enabled      := False;
  pgcDados.ActivePageIndex    := 0;

  DBedtProcesso.SetFocus;

  if Trim(cds.FieldByName('FLGIMPRESSO').AsString) = '' then DBchkImpresso.Checked := False;

  iTotalDarf := CtrlDARF.PegaCountLancIRRF(cds.FieldByName('IDDARF').AsInteger);

  DBedtVlrBase.Enabled  := False;
  DBedtVlrDarf.Enabled  := False;
  DBedtPercDarf.Enabled := False;
end;



procedure TfrmCadastroDarfMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
  begin
    Repaint;

    cds.Data          := CtrlDARF.ProcurarDARF(StrToIntDef(MontaSelect.ValoresChave[0], -1), Sistema.IdEmpresa);
    CtrlDARF.CdsDARF  := cds;

    AtualizaCombos;

    CodDocumento := cds.FieldByName('CODDOCUMENTO').AsInteger;
    IdDarf       := cds.FieldByName('IDDARF').AsInteger;

    if dtmLookIRRF.cdsEmpresaProp.FieldByName('TIPO').asString = 'J' then
      cds.FieldByName('NUMDOCUMENTO').EditMask:= 'AA.AAA.AAA/AAAA-99;0;_'  // Paulo Nobre - WO34233
    else
      cds.FieldByName('NUMDOCUMENTO').EditMask:='999.999.999-99;0;_';
  end;
end;



procedure TfrmCadastroDarfMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;

  pnlPlanoPatroC.Enabled  := Sistema.UsaPlanoPatro;
  DBedtVlrBase.Enabled    := True;
  DBedtVlrDarf.Enabled    := True;
  DBedtPercDarf.Enabled   := True;

  cds.FieldByName('IDPESSOA').AsInteger     := Sistema.idEmpresa;
  cds.FieldByName('NUMDOCUMENTO').AsString  := dtmLookIRRF.cdsEmpresaProp.FieldByName('NUMDOCUMENTO').AsString;
  //
  pgcDados.ActivePageIndex := 0;
  DBedtProcesso.SetFocus;
  //
  edtDataIniApuracao.Date := Date;
  edtDataFimApuracao.Date := Date;
  edtDataEmissao.Date     := Date;
  edtVencimento.Date      := Date;
  //
  cds.FieldByName('DATAINIAPURACAO').AsDateTime   := Date;
  cds.FieldByName('DATAFINALAPURACAO').AsDateTime := Date;
  cds.FieldByName('DATAEMISDARF').AsDateTime      := Date;
  cds.FieldByName('DATAVENCDARF').AsDateTime      := Date;

  cboTipoProcesso.ItemIndex   := -1;
  cboMedidaJudicial.ItemIndex := -1;

  DBchkImpresso.Checked       := False;
  meOBS.Text                  := '';
end;



procedure TfrmCadastroDarfMT.bbtnConfirmarClick(Sender: TObject);
begin
  if not(VerificaPreenchimento) then Exit;

  GeraDarf;

  inherited;

  cdsLancAux.Data   := CtrlDARF.ProcurarLancamentos(-1);
  cdsRateioAux.Data := CtrlDARF.ProcurarRateio(-1);

  AtualizaCombos;
end;



procedure TfrmCadastroDarfMT.DBedtVlrDarfExit(Sender: TObject);
begin
  inherited;
  DBedtVlrTotal.Value                 := DBedtVlrDarf.Value + DBedtVlrMulta.Value + DBedtVlrJuros.Value - DBedtVlrDesconto.Value;
  cds.FieldByName('VLRTOTAL').AsFloat := DBedtVlrDarf.Value + DBedtVlrMulta.Value + DBedtVlrJuros.Value - DBedtVlrDesconto.Value;
end;



procedure TfrmCadastroDarfMT.FormCreate(Sender: TObject);
begin
  inherited;

  // -----------------------------------------------------------------------------------------------

  CtrlDARF := TCtrlDARF.Create;
  CtrlNatuRendimento  := TCtrlNatuRendimento.Create;
  CtrlLancamento      := TCtrlLancamento.Create;
  CtrlGeraDarf        := TCtrlGeraDarf.Create;

  CtrlDARF.Initialize(DtmBaseDados.dbBaseDados,
                      True,
                      Sistema.ConnectionType,
                      Sistema.ConnectionSide,
                      Sistema.AppRemoteServer,
                      True,
                      nil,
                      nil,
                      False
                      );

  CtrlNatuRendimento.InitializeAs(CtrlDARF);
  CtrlLancamento.InitializeAs(CtrlDARF);
  CtrlGeraDarf.InitializeAs(CtrlDARF);

  // -----------------------------------------------------------------------------------------------

  cds.Data          := CtrlDARF.ProcurarDARF(-1, Sistema.IdEmpresa);
  CtrlDARF.CdsDARF  := cds;

  // -----------------------------------------------------------------------------------------------

  dtmLookIRRF.cdsLookNatureza.Data    := CtrlNatuRendimento.ListNaturendimento;
  dtmLookIRRF.cdsLookPatro.Data       := CtrlDARF.ListPatrocinadora;
  dtmLookIRRF.cdsLookPrograma.Data    := CtrlDARF.ListPrograma;
  dtmLookIRRF.cdsLookCidades.Data     := CtrlDARF.ListCidades;
  dtmLookIRRF.cdsEmpresaProp.Data     := CtrlDARF.ListEmpresaProp(Sistema.IdEmpresa);
  dtmLookIRRF.cdsParamIRRF.Data       := CtrlDARF.ListParametrosIRRF(Sistema.idempresa);
  dtmLookIRRF.cdsLookPlanoPrev.Data   := CtrlDARF.ListPlanoPrev;

  cdsDadosDoc.Data                    := CtrlDARF.ListDadosDoc(-1);

  // -----------------------------------------------------------------------------------------------
end;



procedure TfrmCadastroDarfMT.FormActivate(Sender: TObject);
begin
   inherited;

  pnlPlanoPatroC.Visible   := Sistema.UsaPlanoPatro;
  pgcDados.ActivePageIndex := 0;

  MontaSelect.Filtro.Add('DARF.IDPESSOA = '+IntToStr(Sistema.idempresa));

  if dtmLookIRRF.cdsEmpresaProp.FieldByName('TIPO').asString = 'J' then
    cds.FieldByName('NUMDOCUMENTO').EditMask:= 'AA.AAA.AAA/AAAA-99;0;_'     // Paulo Nobre - WO34233
  else
    cds.FieldByName('NUMDOCUMENTO').EditMask:='999.999.999-99;0;_';
end;



procedure TfrmCadastroDarfMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;



procedure TfrmCadastroDarfMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;

  GeraDarf;
end;



procedure TfrmCadastroDarfMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;


  if DBchkImpresso.Checked then
    cds.FieldByName('FLGIMPRESSO').AsString := 'S'
  else
    cds.FieldByName('FLGIMPRESSO').AsString := 'N';

  if not(bErro) then 
    Accept := CtrlDARF.GravarDARF;
end;



procedure TfrmCadastroDarfMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;


  if DBchkImpresso.Checked then
     cds.FieldByName('FLGIMPRESSO').AsString := 'S'
  else
     cds.FieldByName('FLGIMPRESSO').AsString := 'N';

  if bGerouDocumento then
    Accept := CtrlDARF.GravarDARF
  else
    Accept := False;
end;



procedure TfrmCadastroDarfMT.AtualizaCombos;
begin
  if cds.FieldByName('TIPOPROCESSO').asString <> '' then
    cboTipoProcesso.ItemIndex   := cds.FieldByName('TIPOPROCESSO').AsInteger + 1;

  if cds.FieldByName('MEDIDAJUDICIAL').asString <> '' then
    cboMedidaJudicial.ItemIndex := cds.FieldByName('MEDIDAJUDICIAL').AsInteger + 1;

  cdsDadosDoc.Data := CtrlDARF.ListDadosDoc(cds.FieldByName('CODDOCUMENTO').AsInteger);
end;



procedure TfrmCadastroDarfMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;

  cds.Edit;
end;




procedure TfrmCadastroDarfMT.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;

  if OrigemAbortConfirma in [ OaApplyInsert, OaApplyDelete, OaApplyEdit ] then
  begin
    MsgDlg(CtrlDARF.MessageInfo, Sistema.NomeModulo, mtError, [mbOk], 0);
    Repaint;
  end;
end;



procedure TfrmCadastroDarfMT.GeraDarf;
var
  IdPatro, IdPrograma, IdPlanoPrev, iPlano, iCodForn, iSubContaCli  : LongInt;
  idDocumento,iNumLancto,PlnCodigo, iDocumento, iCodForma           : LongInt;

  sValLanc, sHistorico,sContaClifor,sCodNatureza,sCodTipRecDes,sCCustoCliFor : String;
  rValLanc, rTotalLanc, rTotalRat : Double;
  bExisteLancto : Boolean;
begin
  IdPatro         := -1;
  IdPrograma      := -1;
  IdPlanoPrev     := -1;
  PlnCodigo       := -1;
  iPlano          := 0;
  iCodForn        := 0;
  iSubContaCli    := 0;
  idDocumento     := 0;
  iNumLancto      := 0;
  iDocumento      := 0;
  iCodForma       := 0;
  sValLanc        := '';
  sHistorico      := '';
  sContaClifor    := '';
  sCodNatureza    := '';
  sCodTipRecDes   := '';
  sCCustoCliFor   := '';
  rValLanc        := 0;
  rTotalLanc      := 0;
  rTotalRat       := 0;
  bGerouDocumento := True;
  bExisteLancto   := False;
  bErro           := False; 


  if Sistema.UsaPlanoPatro then
  begin
    if DBcboPatroC.LookupValue <> ''      then IdPatro      := StrToInt(DBcboPatroC.LookupValue);
    if DBcboPrograma.LookupValue <> ''    then IdPrograma   := StrToInt(DBcboPrograma.LookupValue);
    if DBcboPlanoPrevC.LookupValue <> ''  then IdPlanoPrev  := StrToInt(DBcboPlanoPrevC.LookupValue);
  end;

  iCodForma := -1;

  try
    if (sbtnInserir.Down) or (sbtnAlterar.Down) then
    begin
      if cds.FieldByName('IDDARF').AsInteger <= 0 then
        cds.FieldByName('IDDARF').AsInteger := CtrlDARF.PegaId('IDDARF'); 

      sCodNatureza       := cds.FieldByName('CODNATUREZA').AsString;
      cdsCodRendGer.Data := CtrlDARF.ListDadosNaturendimento(Sistema.IdEmpresa, Espaco(sCodNatureza,4));

      if cdsCodRendGer.IsEmpty then
      begin
        iCodForn      := dtmLookIRRF.cdsParamIRRF.FieldByName('IDFORCLI').AsInteger;
        iSubContaCli  := dtmLookIRRF.cdsParamIRRF.FieldByName('CODSUBCONTA').AsInteger;
        sCCustoCliFor := dtmLookIRRF.cdsParamIRRF.FieldByName('CODCENTROCUSTO').asString;
        sCodTipRecDes := dtmLookIRRF.cdsParamIRRF.FieldByName('CODTIPRECDES').asString;
        sContaClifor  := dtmLookIRRF.cdsParamIRRF.FieldByName('CONTACFORN').asString;
        iPlano        := dtmLookIRRF.cdsParamIRRF.FieldByName('PLANO').AsInteger;
      end
      else
      begin
        iCodForn      := cdsCodRendGer.FieldByName('IDFORCLI').AsInteger;
        iSubContaCli  := cdsCodRendGer.FieldByName('CODSUBCONTA').AsInteger;
        sCCustoCliFor := cdsCodRendGer.FieldByName('CODCENTROCUSTO').asString;
        sCodTipRecDes := cdsCodRendGer.FieldByName('CODTIPRECDES').asString;

        if cdsCodRendGer.FieldByName('PLACONTACREDITO').IsNull then
        begin
          iPlano        := cdsCodRendGer.FieldByName('PLANOFORN').AsInteger;
          sContaClifor  := cdsCodRendGer.FieldByName('CONTACFORN').asString;
        end
        else
        begin
          iPlano        := cdsCodRendGer.FieldByName('PLANODESEMB').AsInteger;
          sContaClifor  := cdsCodRendGer.FieldByName('PLACONTACREDITO').asString;
        end;
      end;

      cdsNatureza1.Data := CtrlNatuRendimento.GetCodForma(Espaco(sCodNatureza,4));

      if not(cdsNatureza1.IsEmpty) then
        iCodForma := cdsNatureza1.FieldByName('CODFORMA').AsInteger;

      if not(cdsDadosDoc.FieldByName('PLACONTA').IsNull) then
      begin
        iPlano        := cdsDadosDoc.FieldByName('PLANO').AsInteger;
        sContaClifor  := cdsDadosDoc.FieldByName('PLACONTA').asString;
      end;

      // 1) Se o coddocumento is null entao inclui senao altera.
      if cds.FieldByName('CODDOCUMENTO').IsNull then
      begin
        //Documento.GetCodigo(qryAux);

        // -----------------------------------------------------------------------------------------
        // Inserir Documento
        // -----------------------------------------------------------------------------------------
        cdsDocumento.Data := CtrlDARF.ProcurarDocumento(-1);

        cdsDocumento.Insert;
        cdsDocumento.FieldByName('IDMODULO').AsInteger            := Sistema.IdModulo;
        cdsDocumento.FieldByName('PLANO').AsInteger               := iPlano;
        cdsDocumento.FieldByName('PLACONTA').AsString             := sContaClifor;
        cdsDocumento.FieldByName('CODCENTROCUSTO').AsString       := sCCustoCliFor;
        cdsDocumento.FieldByName('IDPESSOA').AsInteger            := Sistema.IdEmpresa;
        cdsDocumento.FieldByName('IDEMPRESA').AsInteger           := Sistema.IdEmpresa;
        cdsDocumento.FieldByName('IDFORCLI').AsInteger            := iCodForn;
        cdsDocumento.FieldByName('CODTIPDOC').AsInteger           := dtmLookIRRF.cdsParamIRRF.FieldByName('CODTIPDOC').AsInteger;
        cdsDocumento.FieldByName('RECPAG').AsString               := 'P';
        cdsDocumento.FieldByName('NODOCUMENTO').AsInteger         := cds.FieldByName('IDDARF').AsInteger;
        cdsDocumento.FieldByName('COMPLDOCUMENTO').AsString       := IntToStr(Sistema.IdModulo);
        cdsDocumento.FieldByName('DATAEMISSAO').AsString          := cds.FieldByName('DATAEMISDARF').AsString;
        cdsDocumento.FieldByName('DATAVENCTO').AsString           := cds.FieldByName('DATAVENCDARF').AsString;
        cdsDocumento.FieldByName('DATAPROGRAMADA').AsString       := cds.FieldByName('DATAVENCDARF').AsString;
        cdsDocumento.FieldByName('OBS').ASString                  := cdsDadosDoc.FieldByName('OBS').AsString;
        cdsDocumento.FieldByName('REFERENCIA').AsString           := cdsDadosDoc.FieldByName('REFCAP').AsString;

        cdsDocumento.FieldByName('OPERACAO').AsString             := '2';
        cdsDocumento.FieldByName('IDUSUARIOINCLUSAO').AsInteger   := Sistema.IdUsuario;
        cdsDocumento.FieldByName('CODSUBCONTA').AsInteger         := iSubContaCli;

        if iCodForma > 0 then
          cdsDocumento.FieldByName('CODFORMA').AsInteger          := iCodForma;

        cdsDocumento.FieldByName('EMISBLOQ').AsString             := 'N';
        cdsDocumento.Post;

        // -----------------------------------------------------------------------------------------
        // Inserir Lançamento
        // -----------------------------------------------------------------------------------------
        cdsLancamentos.Data := CtrlDARF.ProcurarLancamentos(-1);

        cdsLancamentos.Insert;
        cdsLancamentos.FieldByName('IDPESSOA').AsInteger          := Sistema.IdEmpresa;
        cdsLancamentos.FieldByName('PLNCODIGO').AsInteger         := PlnCodigo;
        cdsLancamentos.FieldByName('DATALANCTO').AsString         := cds.FieldByName('DATAVENCDARF').AsString;
        cdsLancamentos.FieldByName('VALOR').AsFloat               := cds.FieldByName('VLRIRRF').AsFloat;
        cdsLancamentos.FieldByName('DEBCRE').AsString             := 'C';
        cdsLancamentos.FieldByName('OPERACAO').AsString           := '2';
        cdsLancamentos.FieldByName('HISTORICOCOMPL').AsString     := 'Código: '+sCodNatureza;
        cdsLancamentos.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
        cdsLancamentos.FieldByName('IDMODULO').AsInteger          := Sistema.IdModulo;
        cdsLancamentos.FieldByName('IDPLANOCONTA').AsInteger      := ParamIntegra.Plano;

        cdsLancamentos.FieldByName('USAPLANOPATRO').AsString      := 'N';
        if Sistema.UsaPlanoPatro then
          cdsLancamentos.FieldByName('USAPLANOPATRO').AsString    := 'S';

        cdsLancamentos.Post;

        // -----------------------------------------------------------------------------------------
        // Inserir Rateio
        // -----------------------------------------------------------------------------------------
        cdsRateio.Data := CtrlDARF.ProcurarRateio(-1);

        cdsRateio.Insert;

        cdsRateio.FieldByName('CODTIPRECDES').AsString       := sCodTipRecDes;
        cdsRateio.FieldByName('RECPAG').AsString             := 'P';
        cdsRateio.FieldByName('CODCENTRORESPON').AsString    := dtmLookIRRF.cdsParamIRRF.FieldByName('CodCentroRespon').AsString;
        cdsRateio.FieldByName('IDPESSOA').AsInteger          := Sistema.IdEmpresa;
        cdsRateio.FieldByName('VALOR').AsFloat               := cds.FieldByName('VLRIRRF').AsFloat;
        cdsRateio.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
        cdsRateio.FieldByName('UNIDNEGOC').AsString          := dtmLookIRRF.cdsParamIRRF.FieldByName('UnidNegoc').AsString;

        if IdPatro > 0 then
          cdsRateio.FieldByName('IDPATRO').AsInteger              := IdPatro;

        if IdPrograma > 0 then
          cdsRateio.FieldByName('IDPROGRAMA').AsInteger           := IdPrograma;

        if IdPlanoPrev > 0 then
          cdsRateio.FieldByName('IDPLANOPREV').AsInteger          := IdPlanoPrev;

        cdsRateio.Post;

        // -----------------------------------------------------------------------------------------
        //
        // -----------------------------------------------------------------------------------------

        if not(CtrlDARF.GravarDocumento(cdsDocumento.Data,
                                        cdsLancamentos.Data,
                                        cdsRateio.Data,
                                        NULL,
                                        'I',
                                        Sistema.IdEspAcesso,
                                        Sistema.IdUsuario
                                       )) then
        begin
          bGerouDocumento := False;
          Exit;
        end;

        cds.FieldByName('CODDOCUMENTO').AsFloat := CtrlDARF.CodDocumento;
      end
      else
      begin
        //
        idDocumento   := cds.FieldByName('CODDOCUMENTO').AsInteger;
        cdsAux.Data   := CtrlDARF.ListLancamentos(idDocumento);

        iNumLancto    := cdsAux.FieldByName('NUMLANCTO').AsInteger;
        sHistorico    := cdsAux.FieldByName('HISTORICOCOMPL').AsString;
        //
        PlnCodigo     := -1;

        // Preenche o cds para que o mesmo seja passado para a alteraçào
        cdsDocumento.Data := CtrlDARF.ProcurarDocumento(idDocumento);

        if cdsDocumento.FieldByName('STATUS').AsString = '2'then
        begin
          MsgDlg('O documento referente a esse DARF já está baixado!', 'Aviso', MtWarning, [MbOk], 0);
          bErro := True; 
          Exit;
        end;

        // -----------------------------------------------------------------------------------------
        // Documento
        // -----------------------------------------------------------------------------------------

        cdsDocumento.Edit;
        //Início - William Santana - SIG 21242
        //cdsDocumento.FieldByName('IDMODULO').AsInteger           := Sistema.IdModulo;
        //cdsDocumento.FieldByName('PLANO').AsInteger              := iPlano;
        //cdsDocumento.FieldByName('PLACONTA').AsString            := sContaClifor;
        //cdsDocumento.FieldByName('CODCENTROCUSTO').AsString      := sCCustoCliFor;
        //cdsDocumento.FieldByName('IDPESSOA').AsInteger           := Sistema.IdEmpresa;
        //cdsDocumento.FieldByName('IDEMPRESA').AsInteger          := Sistema.IdEmpresa;
        //cdsDocumento.FieldByName('IDFORCLI').AsInteger           := iCodForn;
        //cdsDocumento.FieldByName('CODTIPDOC').AsInteger          := dtmLookIRRF.cdsParamIRRF.FieldByName('CODTIPDOC').AsInteger;
        //cdsDocumento.FieldByName('RECPAG').AsString              := 'P';
        //cdsDocumento.FieldByName('NODOCUMENTO').AsInteger        := cds.FieldByName('IDDARF').AsInteger;
        //cdsDocumento.FieldByName('COMPLDOCUMENTO').AsString      := IntToStr(Sistema.IdModulo);
        //Término - William Santana - SIG 21242
        cdsDocumento.FieldByName('DATAEMISSAO').AsString         := cds.FieldByName('DATAEMISDARF').AsString;
        cdsDocumento.FieldByName('DATAVENCTO').AsString          := cds.FieldByName('DATAVENCDARF').AsString;
        cdsDocumento.FieldByName('DATAPROGRAMADA').AsString      := cds.FieldByName('DATAVENCDARF').AsString;
        cdsDocumento.FieldByName('NUMFATURA').AsInteger          := cdsAux.FieldByName('NUMFATURA').AsInteger;
        cdsDocumento.FieldByName('OPERACAO').AsString            := cdsAux.FieldByName('OPERACAO').AsString;
        //cdsDocumento.FieldByName('IDUSUARIOINCLUSAO').AsInteger  := Sistema.IdUsuario;   //William Santana - SIG 21242
        //cdsDocumento.FieldByName('CODSUBCONTA').AsInteger        := iSubContaCli;        //William Santana - SIG 21242
        cdsDocumento.FieldByName('NUMSLIP').AsString             := cdsAux.FieldByName('NUMSLIP').AsString;
        cdsDocumento.FieldByName('NUMLEITCODBARRAS').AsString    := cdsAux.FieldByName('NUMLEITCODBARRAS').AsString;
        cdsDocumento.FieldByName('NUMDIGCODBARRAS').AsString     := cdsAux.FieldByName('NUMDIGCODBARRAS').AsString;
        cdsDocumento.FieldByName('OBS').ASString                 := meOBS.Text;
        cdsDocumento.FieldByName('REFERENCIA').AsString          := cdsDadosDoc.FieldByName('REFCAP').AsString;

        //if iCodForma > 0 then                                                  //William Santana - SIG 21242
        //  cdsDocumento.FieldByName('CODFORMA').AsInteger        := iCodForma;  //William Santana - SIG 21242

        cdsDocumento.FieldByName('EMISBLOQ').AsString            := cdsAux.FieldByName('EMISBLOQ').AsString;
        cdsDocumento.Post;

        // -----------------------------------------------------------------------------------------
        // Lançamentos
        // -----------------------------------------------------------------------------------------

        cdsLancamentos.Data := CtrlDARF.ProcurarLancamentos(idDocumento);
        cdsLancamentos.Edit;

        cdsLancamentos.FieldByName('CODDOCUMENTO').AsInteger      := cds.FieldByName('CODDOCUMENTO').AsInteger;
        cdsLancamentos.FieldByName('NUMLANCTO').AsInteger         := iNumLancto;
        cdsLancamentos.FieldByName('PLNCODIGO').AsInteger         := PlnCodigo;
        cdsLancamentos.FieldByName('IDPESSOA').AsInteger          := Sistema.IdEmpresa;
        cdsLancamentos.FieldByName('DATALANCTO').AsString         := cds.FieldByName('DATAVENCDARF').AsString;
        cdsLancamentos.FieldByName('VALOR').AsFloat               := cds.FieldByName('VLRIRRF').AsFloat;
        cdsLancamentos.FieldByName('DEBCRE').AsString             := 'C';
        cdsLancamentos.FieldByName('OPERACAO').AsString           := '2';
        cdsLancamentos.FieldByName('HISTORICOCOMPL').AsString     := 'Código: '+sCodNatureza; // sHistorico;
        cdsLancamentos.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
        cdsLancamentos.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
        cdsLancamentos.FieldByName('IDMODULO').AsInteger          := Sistema.IdModulo;
        cdsLancamentos.FieldByName('IDPLANOCONTA').AsInteger      := ParamIntegra.Plano;

        if Sistema.UsaPlanoPatro then
          cdsLancamentos.FieldByName('USAPLANOPATRO').AsString   := 'S';

        cdsLancamentos.Post;

        // -----------------------------------------------------------------------------------------
        // Rateio
        // -----------------------------------------------------------------------------------------

        cdsRateio.Data := CtrlDARF.ProcurarRateio(cds.FieldByName('CODDOCUMENTO').AsInteger);
        //
        if DBedtVlrDarf.Enabled then
        begin
          rTotalRat := 0;
          cdsRateio.First;
          while not(cdsRateio.EOF) do
          begin
            rTotalRat := rTotalRat + cdsRateio.FieldByName('VALOR').AsFloat;
            cdsRateio.Next;
          end;
          //
          rTotalLanc := 0;
          cdsRateio.First;
          while not(cdsRateio.EOF) do
          begin
            if rTotalRat <> 0 then
              rValLanc := cds.FieldByName('VLRIRRF').AsFloat * cdsRateio.FieldByName('VALOR').AsFloat / rTotalRat
            else
              rValLanc := cdsRateio.FieldByName('VALOR').AsFloat;

            sValLanc   := FloatToStrF(rValLanc, ffGeneral,15,2);
            rValLanc   := StrToFloat(sValLanc);
            rTotalLanc := rTotalLanc + rValLanc;

            cdsRateio.Next;
          end;
          cdsRateioAux.Data := CtrlDARF.ProcurarRateio(idDocumento);
          cdsLancAux.Data   := CtrlDARF.ProcurarLancamentos(idDocumento);
          bExisteLancto     := True;

          if rTotalLanc <> cds.FieldByName('VLRIRRF').AsFloat then
          begin
            cdsRateioAux.Insert;
            cdsRateioAux.FieldByName('IDRATEIODOCUM').AsInteger     := CtrlDARF.PegaId('RATEIODOCUM');
            cdsRateioAux.FieldByName('CODDOCUMENTO').AsInteger      := cds.FieldByName('CODDOCUMENTO').AsInteger;
            cdsRateioAux.FieldByName('CODTIPRECDES').AsString       := sCodTipRecDes;
            cdsRateioAux.FieldByName('RECPAG').AsString             := 'P';
            cdsRateioAux.FieldByName('CODCENTRORESPON').AsString    := dtmLookIRRF.cdsParamIRRF.FieldByName('CodCentroRespon').AsString;
            cdsRateioAux.FieldByName('IDPESSOA').AsInteger          := Sistema.IdEmpresa;
            cdsRateioAux.FieldByName('VALOR').AsFloat               := (cds.FieldByName('VLRIRRF').AsFloat-rTotalLanc);
            cdsRateioAux.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
            cdsRateioAux.FieldByName('UNIDNEGOC').AsString          := dtmLookIRRF.cdsParamIRRF.FieldByName('UnidNegoc').AsString;

            if IdPatro > 0 then
              cdsRateioAux.FieldByName('IDPATRO').AsInteger           := IdPatro;

            if IdPrograma > 0 then
              cdsRateioAux.FieldByName('IDPROGRAMA').AsInteger        := IdPrograma;

            if IdPlanoPrev > 0 then
              cdsRateioAux.FieldByName('IDPLANOPREV').AsInteger       := IdPlanoPrev;

            cdsRateioAux.Post;
          end;
        end;
        //
      end;
      //

      if cdsLancAux.IsEmpty then
      begin
        cdsLancAux.Data := CtrlDARF.ProcurarLancamentos(-1);
        bExisteLancto   := False;
      end;
      //2) Se o codlancjuros is NULL e vlrjuros <> 0 entao inclui alterador
      if (cds.FieldByName('NUMLANCJUROS').IsNull) and (cds.FieldByName('VLRJUROS').AsFloat <> 0) and
         not(dtmLookIRRF.cdsParamIRRF.FieldByName('CODALTJUROS').IsNull) then
      begin
        //
        PlnCodigo :=0;
        // inclui um novo lançamento

        cdsLancAux.Insert;
        cdsLancAux.FieldByName('CODDOCUMENTO').AsInteger      := cds.FieldByName('CODDOCUMENTO').AsInteger;
        cdsLancAux.FieldByName('NUMLANCTO').AsInteger         := CtrlDARF.PegaId('LANCTODOCUM');
        cdsLancAux.FieldByName('PLNCODIGO').AsInteger         := PlnCodigo;
        cdsLancAux.FieldByName('IDPESSOA').AsInteger          := Sistema.IdEmpresa;
        cdsLancAux.FieldByName('DATALANCTO').AsString         := cds.FieldByName('DATAVENCDARF').AsString;
        cdsLancAux.FieldByName('VALOR').AsFloat               := cds.FieldByName('VLRJUROS').AsFloat;
        cdsLancAux.FieldByName('CODALTERADOR').AsInteger      := dtmLookIRRF.cdsParamIRRF.FieldByName('CODALTJUROS').AsInteger;
        cdsLancAux.FieldByName('DEBCRE').AsString             := 'C';
        cdsLancAux.FieldByName('OPERACAO').AsString           := '4';
        cdsLancAux.FieldByName('HISTORICOCOMPL').AsString     := 'Codigo: '+sCodNatureza;
        cdsLancAux.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
        cdsLancAux.FieldByName('IDMODULO').AsInteger          := Sistema.IdModulo;
        cdsLancAux.FieldByName('IDPLANOCONTA').AsInteger      := ParamIntegra.Plano;

        if Sistema.UsaPlanoPatro then
          cdsLancAux.FieldByName('USAPLANOPATRO').AsString   := 'S';

        cdsLancAux.Post;

        cds.FieldByName('NUMLANCJUROS').AsInteger := cdsLancAux.FieldByName('NUMLANCTO').AsInteger;
      end
      else
      begin
         //4) Se o codlancjuros is not null e vlrjuros <> 0 entao alterar alterador
        if not(cds.FieldByName('NUMLANCJUROS').IsNull) and (cds.FieldByName('VLRJUROS').AsFloat <> 0) then
        begin
          //
          cdsAux.Data := CtrlDARF.ListLancJuros(idDocumento, cds.FieldByName('NUMLANCJUROS').AsInteger);

          PlnCodigo    := cdsAux.FieldByName('PLNCODIGO').AsInteger;
          sHistorico   := cdsAux.FieldByName('HISTORICOCOMPL').AsString;
          iNumLancto   := cds.FieldByName('NUMLANCJUROS').AsInteger;
          //
          //para a alterador é incluido o registro neste cds para ser
          //passado para a função que grava as alterações
          //esse lançamento está com bcontabiliza true

          if not(cdsAux.IsEmpty) then
          begin
            cdsLancamentos.Locate('CODDOCUMENTO;NUMLANCTO', VarArrayOf([IntToStr(idDocumento), cds.FieldByName('NUMLANCJUROS').AsString]), []);
            cdsLancamentos.Edit;
            cdsLancamentos.FieldByName('VALOR').AsFloat               := cds.FieldByName('VLRJUROS').AsFloat;
            cdsLancamentos.FieldByName('CODALTERADOR').AsInteger      := dtmLookIRRF.cdsParamIRRF.FieldByName('CODALTJUROS').AsInteger;
          End
          Else
          begin
            cdsLancamentos.Insert;
            cdsLancamentos.FieldByName('CODDOCUMENTO').AsInteger      := cds.FieldByName('CODDOCUMENTO').AsInteger;
            cdsLancamentos.FieldByName('NUMLANCTO').AsInteger         := iNumLancto;
            cdsLancamentos.FieldByName('IDPESSOA').AsInteger          := Sistema.IdEmpresa;
            cdsLancamentos.FieldByName('PLNCODIGO').AsInteger         := PlnCodigo;
            cdsLancamentos.FieldByName('DATALANCTO').AsString         := cds.FieldByName('DATAVENCDARF').AsString;
            cdsLancamentos.FieldByName('VALOR').AsFloat               := cds.FieldByName('VLRJUROS').AsFloat;
            cdsLancamentos.FieldByName('DEBCRE').AsString             := 'C';
            cdsLancamentos.FieldByName('CODALTERADOR').AsInteger      := dtmLookIRRF.cdsParamIRRF.FieldByName('CODALTJUROS').AsInteger;
            cdsLancamentos.FieldByName('OPERACAO').AsString           := '4';
            cdsLancamentos.FieldByName('HISTORICOCOMPL').AsString     := sHistorico;
            cdsLancamentos.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
            cdsLancamentos.FieldByName('IDMODULO').AsInteger          := Sistema.IdModulo;
            cdsLancamentos.FieldByName('IDPLANOCONTA').AsInteger      := ParamIntegra.Plano;

            if Sistema.UsaPlanoPatro then
              cdsLancamentos.FieldByName('USAPLANOPATRO').AsString   := 'S';
          End;

          cdsLancamentos.Post;

        end;
      end;
      //
      //3) Se o codlancmulta is null e vlrmulta <> 0 entao inclui alterador
      if (cds.FieldByName('NUMLANCMULTA').IsNull) and (cds.FieldByName('VLRMULTA').AsFloat <> 0) and
         not(dtmLookIRRF.cdsParamIRRF.FieldByName('CODALTMULTA').IsNull) then
      begin
        //
        //
        PlnCodigo := 0;
        //
        //este lançamento será contabilizado
        cdsLancAux.Insert;
        cdsLancAux.FieldByName('CODDOCUMENTO').AsInteger      := cds.FieldByName('CODDOCUMENTO').AsInteger;
        cdsLancAux.FieldByName('NUMLANCTO').AsInteger         := CtrlDARF.PegaId('LANCTODOCUM');
        cdsLancAux.FieldByName('IDPESSOA').AsInteger          := Sistema.IdEmpresa;
        cdsLancAux.FieldByName('PLNCODIGO').AsInteger         := PlnCodigo;
        cdsLancAux.FieldByName('DATALANCTO').AsString         := cds.FieldByName('DATAVENCDARF').AsString;
        cdsLancAux.FieldByName('VALOR').AsFloat               := cds.FieldByName('VLRMULTA').AsFloat;
        cdsLancAux.FieldByName('CODALTERADOR').AsInteger      := dtmLookIRRF.cdsParamIRRF.FieldByName('CODALTMULTA').AsInteger;
        cdsLancAux.FieldByName('DEBCRE').AsString             := 'C';
        cdsLancAux.FieldByName('OPERACAO').AsString           := '4';
        cdsLancAux.FieldByName('HISTORICOCOMPL').AsString     := 'Codigo: '+sCodNatureza;
        cdsLancAux.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
        cdsLancAux.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
        cdsLancAux.FieldByName('IDMODULO').AsInteger          := Sistema.IdModulo;
        cdsLancAux.FieldByName('IDPLANOCONTA').AsInteger      := ParamIntegra.Plano;

        if Sistema.UsaPlanoPatro then
          cdsLancAux.FieldByName('USAPLANOPATRO').AsString   := 'S';

        cdsLancAux.Post;

        //
        cds.FieldByName('NUMLANCMULTA').AsInteger := cdsLancAux.FieldByName('NUMLANCTO').AsInteger;
      end
      else
      begin
        //5) Se o codlancMulta is not null e vlrmulta <> 0 entao alterar alterador
        if not(cds.FieldByName('NUMLANCMULTA').IsNull) and (cds.FieldByName('VLRMULTA').AsFloat <> 0) then
        begin
          //
          cdsAux.Data := CtrlDARF.ListLancJuros(idDocumento, cds.FieldByName('NUMLANCMULTA').AsInteger);

          PlnCodigo    := cdsAux.FieldByName('PLNCODIGO').AsInteger;
          sHistorico   := cdsAux.FieldByName('HISTORICOCOMPL').AsString;
          iNumLancto   := cds.FieldByName('NUMLANCMULTA').AsInteger;
          //

          if not(cdsAux.IsEmpty) then
          begin
            cdsLancamentos.Locate('CODDOCUMENTO;NUMLANCTO', VarArrayOf([IntToStr(idDocumento), cds.FieldByName('NUMLANCMULTA').AsString]), []);
            cdsLancamentos.Edit;
            cdsLancamentos.FieldByName('VALOR').AsFloat               := cds.FieldByName('VLRMULTA').AsFloat;
            cdsLancamentos.FieldByName('CODALTERADOR').AsInteger      := dtmLookIRRF.cdsParamIRRF.FieldByName('CODALTMULTA').AsInteger;
          End
          Else
          begin
            cdsLancamentos.Insert;
            cdsLancamentos.FieldByName('CODDOCUMENTO').AsInteger      := cds.FieldByName('CODDOCUMENTO').AsInteger;
            cdsLancamentos.FieldByName('NUMLANCTO').AsInteger         := iNumLancto;
            cdsLancamentos.FieldByName('IDPESSOA').AsInteger          := Sistema.IdEmpresa;
            cdsLancamentos.FieldByName('PLNCODIGO').AsInteger         := PlnCodigo;
            cdsLancamentos.FieldByName('DATALANCTO').AsString         := cds.FieldByName('DATAVENCDARF').AsString;
            cdsLancamentos.FieldByName('VALOR').AsFloat               := cds.FieldByName('VLRMULTA').AsFloat;
            cdsLancamentos.FieldByName('DEBCRE').AsString             := 'C';
            cdsLancamentos.FieldByName('CODALTERADOR').AsInteger      := dtmLookIRRF.cdsParamIRRF.FieldByName('CODALTMULTA').AsInteger;
            cdsLancamentos.FieldByName('OPERACAO').AsString           := '4';
            cdsLancamentos.FieldByName('HISTORICOCOMPL').AsString     := sHistorico;
            cdsLancamentos.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
            cdsLancamentos.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
            cdsLancamentos.FieldByName('IDMODULO').AsInteger          := Sistema.IdModulo;
            cdsLancamentos.FieldByName('IDPLANOCONTA').AsInteger      := ParamIntegra.Plano;

            if Sistema.UsaPlanoPatro then
              cdsLancamentos.FieldByName('USAPLANOPATRO').AsString   := 'S';
          End;

          cdsLancamentos.Post;
        end;
      end;
      //
      //6) Se o codlancDesconto is null e vlrdesconto <> 0 entao inclui alterador
      if (cds.FieldByName('NUMLANCDESCONTO').IsNull) and (cds.FieldByName('VLRDESCONTO').AsFloat <> 0) and
         not(dtmLookIRRF.cdsParamIRRF.FieldByName('CODALTDESCONTO').IsNull) then
      begin
        //
        //
        PlnCodigo := 0;
        //
        //este lançamento será contabilizado
        cdsLancAux.Insert;
        cdsLancAux.FieldByName('CODDOCUMENTO').AsInteger      := cds.FieldByName('CODDOCUMENTO').AsInteger;
        cdsLancAux.FieldByName('NUMLANCTO').AsInteger         := CtrlDARF.PegaId('LANCTODOCUM');
        cdsLancAux.FieldByName('IDPESSOA').AsInteger          := Sistema.IdEmpresa;
        cdsLancAux.FieldByName('PLNCODIGO').AsInteger         := PlnCodigo;
        cdsLancAux.FieldByName('DATALANCTO').AsString         := cds.FieldByName('DATAVENCDARF').AsString;
        cdsLancAux.FieldByName('VALOR').AsFloat               := cds.FieldByName('VLRDESCONTO').AsFloat;
        cdsLancAux.FieldByName('CODALTERADOR').AsInteger      := dtmLookIRRF.cdsParamIRRF.FieldByName('CODALTDESCONTO').AsInteger;
        cdsLancAux.FieldByName('DEBCRE').AsString             := 'D';
        cdsLancAux.FieldByName('OPERACAO').AsString           := '4';
        cdsLancAux.FieldByName('HISTORICOCOMPL').AsString     := 'Codigo: ' + sCodNatureza;
        cdsLancAux.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
        cdsLancAux.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
        cdsLancAux.FieldByName('IDMODULO').AsInteger          := Sistema.IdModulo;
        cdsLancAux.FieldByName('IDPLANOCONTA').AsInteger      := ParamIntegra.Plano;

        if Sistema.UsaPlanoPatro then
          cdsLancAux.FieldByName('USAPLANOPATRO').AsString   := 'S';

        cdsLancAux.Post;

        //
        cds.FieldByName('NUMLANCDESCONTO').AsInteger := cdsLancAux.FieldByName('NUMLANCTO').AsInteger;
      end
      else
      begin
        //7) Se o codlancDesconto is not null e vlrdesconto <> 0 entao alterar alterador
        if not(cds.FieldByName('NUMLANCDESCONTO').IsNull) and (cds.FieldByName('VLRDESCONTO').AsFloat <> 0) then
        begin
          //
          cdsAux.Data := CtrlDARF.ListLancJuros(idDocumento, cds.FieldByName('NUMLANCDESCONTO').AsInteger);

          PlnCodigo    := cdsAux.FieldByName('PLNCODIGO').AsInteger;
          sHistorico   := cdsAux.FieldByName('HISTORICOCOMPL').AsString;
          iNumLancto   := cds.FieldByName('NUMLANCDESCONTO').AsInteger;
          //

          if not(cdsAux.IsEmpty) then
          begin
            cdsLancamentos.Locate('CODDOCUMENTO;NUMLANCTO', VarArrayOf([IntToStr(idDocumento), cds.FieldByName('NUMLANCDESCONTO').AsString]), []);
            cdsLancamentos.Edit;
            cdsLancamentos.FieldByName('VALOR').AsFloat               := cds.FieldByName('VLRDESCONTO').AsFloat;
            cdsLancamentos.FieldByName('CODALTERADOR').AsInteger      := dtmLookIRRF.cdsParamIRRF.FieldByName('CODALTDESCONTO').AsInteger;
          End
          Else
          begin
            cdsLancamentos.Insert;
            cdsLancamentos.FieldByName('CODDOCUMENTO').AsInteger      := cds.FieldByName('CODDOCUMENTO').AsInteger;
            cdsLancamentos.FieldByName('NUMLANCTO').AsInteger         := iNumLancto;
            cdsLancamentos.FieldByName('IDPESSOA').AsInteger          := Sistema.IdEmpresa;
            cdsLancamentos.FieldByName('PLNCODIGO').AsInteger         := PlnCodigo;
            cdsLancamentos.FieldByName('DATALANCTO').AsString         := cds.FieldByName('DATAVENCDARF').AsString;
            cdsLancamentos.FieldByName('VALOR').AsFloat               := cds.FieldByName('VLRDESCONTO').AsFloat;
            cdsLancamentos.FieldByName('DEBCRE').AsString             := 'D';
            cdsLancamentos.FieldByName('CODALTERADOR').AsInteger      := dtmLookIRRF.cdsParamIRRF.FieldByName('CODALTDESCONTO').AsInteger;
            cdsLancamentos.FieldByName('OPERACAO').AsString           := '4';
            cdsLancamentos.FieldByName('HISTORICOCOMPL').AsString     := sHistorico;
            cdsLancamentos.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
            cdsLancamentos.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
            cdsLancamentos.FieldByName('IDMODULO').AsInteger          := Sistema.IdModulo;
            cdsLancamentos.FieldByName('IDPLANOCONTA').AsInteger      := ParamIntegra.Plano;

            if Sistema.UsaPlanoPatro then
              cdsLancamentos.FieldByName('USAPLANOPATRO').AsString   := 'S';
          End;

          cdsLancamentos.Post;
        end;
      end;

      //8) Se o codlancjuros is not null e vlrjuros = 0 entao exclui alterador
      if not(cds.FieldByName('NUMLANCJUROS').IsNull) and (cds.FieldByName('VLRJUROS').AsFloat = 0) then
      begin
        //
        cdsAux.Data := CtrlDARF.ListLancJuros(cds.FieldByName('CODDOCUMENTO').AsInteger, cds.FieldByName('NUMLANCJUROS').AsInteger);
        PlnCodigo   := cdsAux.FieldByName('PLNCODIGO').AsInteger;
        sHistorico  := cdsAux.FieldByName('HISTORICOCOMPL').AsString;
        iNumLancto  := cds.FieldByName('NUMLANCJUROS').AsInteger;

        if not(CtrlDARF.ExcluirLancamento(cds.FieldByName('CODDOCUMENTO').AsInteger, iNumLancto)) then
        begin
          MsgDlg(CtrlDARF.MessageInfo, 'Erro', MtError, [MbOk], 0);
          Exit;
        end;
      end;
      //
      //9) Se o codlancmulta is not null e vlrmulta = 0 entao exclui alterador
      if not(cds.FieldByName('NUMLANCMULTA').IsNull) and (cds.FieldByName('VLRMULTA').AsFloat = 0) then
      begin
        //Exclui lanctodocum
        //
        cdsAux.Data := CtrlDARF.ListLancJuros(idDocumento, cds.FieldByName('NUMLANCMULTA').AsInteger);

        PlnCodigo   := cdsAux.FieldByName('PLNCODIGO').AsInteger;
        sHistorico  := cdsAux.FieldByName('HISTORICOCOMPL').AsString;
        iNumLancto  := cds.FieldByName('NUMLANCMULTA').AsInteger;
        //

        if not(CtrlDARF.ExcluirLancamento(cds.FieldByName('CODDOCUMENTO').AsInteger, iNumLancto)) then
        begin
          MsgDlg(CtrlDARF.MessageInfo, 'Erro', MtError, [MbOk], 0);
          Exit;
        end;

      end;

      //10) Se o codlancDesconto is not null e vlrDesconto = 0 entao exclui alterador
      if not(cds.FieldByName('NUMLANCDESCONTO').IsNull) and (cds.FieldByName('VLRDESCONTO').AsFloat = 0) then
      begin
        //Exclui lanctodocum
        //
        cdsAux.Data := CtrlDARF.ListLancJuros(idDocumento, cds.FieldByName('NUMLANCDESCONTO').AsInteger);

        PlnCodigo   := cdsAux.FieldByName('PLNCODIGO').AsInteger;
        sHistorico  := cdsAux.FieldByName('HISTORICOCOMPL').AsString;
        iNumLancto  := cds.FieldByName('NUMLANCDESCONTO').AsInteger;
        //

        if not(CtrlDARF.ExcluirLancamento(cds.FieldByName('CODDOCUMENTO').AsInteger, iNumLancto)) then
        begin
          MsgDlg(CtrlDARF.MessageInfo, 'Erro', MtError, [MbOk], 0);
          Exit;
        end;
      end;

      if cboTipoProcesso.ItemIndex > 0 then
        cds.FieldByName('TIPOPROCESSO').asString := intTostr(cboTipoProcesso.ItemIndex - 1)
      else
        cds.FieldByName('TIPOPROCESSO').asString :=  '';

      if cboMedidaJudicial.ItemIndex > 0 then
        cds.FieldByName('MEDIDAJUDICIAL').asString := intTostr(cboMedidaJudicial.ItemIndex - 1)
      else
        cds.FieldByName('MEDIDAJUDICIAL').asString := '';

      {**Gravar as alterações no documento**}

      //insere os lançamentos pendentes que estão no cdsLancAux

      if not(bExisteLancto) and not(cdsLancAux.IsEmpty) then
      begin
        if not(CtrlDARF.IncluirLancamento(cdsLancAux.Data)) then
        begin
          MsgDlg(CtrlDARF.MessageInfo, 'Erro', MtError, [MbOk], 0);
          Exit;
        end;
      End;

      if (sbtnAlterar.Down) then
      begin
        //inclui rateios pendentes que estão no cdsRateioAux
        if not(bExisteLancto) and not(cdsRateioAux.IsEmpty) then
        begin
          if not(CtrlDARF.IncluirRateio(cdsRateioAux.Data)) then
          begin
            MsgDlg(CtrlDARF.MessageInfo, 'Erro', MtError, [MbOk], 0);
            Exit;
          end;
        End;

        //pega os dados dos lançamentos e rateios incluidos a cima
        if not(bExisteLancto) then AlimentaCds(cdsLancAux, cdsRateioAux);

        //salva as alterações pendentes no documento, lançamento(s) e Rateio(s)
        if not(CtrlDARF.GravarDocumento(cdsDocumento.Data,
                                        cdsLancamentos.Data,
                                        cdsRateio.Data,
                                        NULL,
                                        'A',
                                        Sistema.IdEspAcesso,
                                        Sistema.IdUsuario
                                       )) then
        begin
          MsgDlg(CtrlDARF.MessageInfo, 'Erro', MtError, [MbOk], 0);
          Exit;
        end;
        AtualizaCombos;
      end;
    end
    else
    begin
      if not(dtmBaseDados.dbBaseDados.InTransaction) then dtmBaseDados.dbBaseDados.StartTransaction;

      if CodDocumento <> 0 then
      begin
        cdsBaixa.Data := CtrlDARF.ListBaixa(CodDocumento);   

        if not(cdsBaixa.IsEmpty) then
        begin
          MsgDlg('Documento já baixado no Contas a Pagar','Erro',mtError,[mbOk],0);
          Exit;
        end;

        if not(CtrlDARF.AtualizaDarf(IdDarf)) then
        begin
          MsgDlg(CtrlDARF.MessageInfo, 'Erro', MtError, [MbOk], 0);
          Exit;
        end;

        cdsDocumento.Data := CtrlDARF.ProcurarDocumento(CodDocumento);
        if not(CtrlDARF.GravarDocumento(cdsDocumento.Data,
                                        cdsLancamentos.Data,
                                        cdsRateio.Data,
                                        NULL,
                                        'E',
                                        Sistema.IdEspAcesso,
                                        Sistema.IdUsuario
                                       )) then
        begin
          MsgDlg(CtrlDARF.MessageInfo, 'Erro', MtError, [MbOk], 0);
          berro := true;
        end;

        if berro then
          CtrlDARF.AtualizaDarf(IdDarf, CodDocumento);

        if not(bErro) then  
        begin
          if not(CtrlDARF.AtualizaLanc(IdDarf)) then
          begin
            MsgDlg(CtrlDARF.MessageInfo, 'Erro', MtError, [MbOk], 0);
            Exit;
          end;
        End;

        if not(bErro) then 
          CtrlDARF.GravarDARF(False); //exclui o darf

        cdsLanctoDoc.Data := CtrlDARF.ListLanctoDoc(CodDocumento);
        cdsLanctoDoc.First;
        while not(cdsLanctoDoc.EOF) do
        begin
          CtrlLancamento.ExcluiLancaContab(Sistema.idUsuario, cdsLanctoDoc.FieldByName('PLNCODIGO').AsInteger, Sistema.idModulo,
                                           0, Sistema.UsaPlanoPatro, True);
          cdsLanctoDoc.Next;
        end;
      end
      else
      begin
        if not(CtrlDARF.AtualizaLanc(IdDarf)) then
        begin
          MsgDlg(CtrlDARF.MessageInfo, 'Erro', MtError, [MbOk], 0);

          if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;

          Exit;
        end;

        CtrlDARF.GravarDARF; //exclui o darf
      end;

      if not(bErro) then
      begin
        MsgDlg('Darf excluído com sucesso.', 'Information', MtInformation, [MbOk], 0);
        if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit;
      End
      Else
      begin
        MsgDlg('Não foi possível excluir o Darf.', 'Erro', MtError, [MbOk], 0);
        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Rollback;
      End;
    end;
  except
    if (sbtnInserir.Down) or (sbtnAlterar.Down) then
      MsgDlg('Inclusão/Alteração não Efetuada','Erro',mtError,[mbOk],0)
    else
      MsgDlg('Exclusão não Efetuada','Erro',mtError,[mbOk],0);
    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
    Raise;
  end;
end;



procedure TfrmCadastroDarfMT.AlimentaCds(cdsLanc, cdsRat : TclientDataSet);
begin
  //Alimenta o cds de lançamentos principal com os lançamentos que forão inseridos na alteração
  if not(cdsLanc.IsEmpty) then cdsLanc.first;

  while not(cdsLanc.EOF) do
  begin
    cdsLancamentos.Insert;

    cdsLancamentos.FieldByName('CODDOCUMENTO').AsInteger      := cdsLanc.FieldByName('CODDOCUMENTO').AsInteger;
    cdsLancamentos.FieldByName('NUMLANCTO').AsInteger         := cdsLanc.FieldByName('NUMLANCTO').AsInteger;
    cdsLancamentos.FieldByName('PLNCODIGO').AsInteger         := cdsLanc.FieldByName('PLNCODIGO').AsInteger;
    cdsLancamentos.FieldByName('IDPESSOA').AsInteger          := cdsLanc.FieldByName('IDPESSOA').AsInteger;
    cdsLancamentos.FieldByName('DATALANCTO').AsString         := cdsLanc.FieldByName('DATALANCTO').AsString;
    cdsLancamentos.FieldByName('VALOR').AsFloat               := cdsLanc.FieldByName('VALOR').AsFloat;
    cdsLancamentos.FieldByName('DEBCRE').AsString             := cdsLanc.FieldByName('DEBCRE').AsString;
    cdsLancamentos.FieldByName('CODALTERADOR').AsInteger      := cdsLanc.FieldByName('CODALTERADOR').AsInteger;
    cdsLancamentos.FieldByName('OPERACAO').AsString           := cdsLanc.FieldByName('OPERACAO').AsString;
    cdsLancamentos.FieldByName('HISTORICOCOMPL').AsString     := cdsLanc.FieldByName('HISTORICOCOMPL').AsString;
    cdsLancamentos.FieldByName('IDUSUARIOINCLUSAO').AsInteger := cdsLanc.FieldByName('IDUSUARIOINCLUSAO').AsInteger;
    cdsLancamentos.FieldByName('IDMODULO').AsInteger          := cdsLanc.FieldByName('IDMODULO').AsInteger;
    cdsLancamentos.FieldByName('IDPLANOCONTA').AsInteger      := cdsLanc.FieldByName('IDPLANOCONTA').AsInteger;
    cdsLancamentos.FieldByName('USAPLANOPATRO').AsString      := cdsLanc.FieldByName('USAPLANOPATRO').AsString;


    cdsLancamentos.Post;
    cdsLanc.Next;
  end;

  if not(cdsRat.IsEmpty) then cdsRat.First;

  while not(cdsRat.EOF) do
  begin
    cdsRateio.Insert;

    cdsRateio.FieldByName('IDRATEIODOCUM').AsInteger     := cdsRat.FieldByName('IDRATEIODOCUM').AsInteger;
    cdsRateio.FieldByName('CODDOCUMENTO').AsInteger      := cdsRat.FieldByName('CODDOCUMENTO').AsInteger;
    cdsRateio.FieldByName('CODTIPRECDES').AsString       := cdsRat.FieldByName('CODTIPRECDES').AsString;
    cdsRateio.FieldByName('RECPAG').AsString             := cdsRat.FieldByName('RECPAG').AsString;
    cdsRateio.FieldByName('CODCENTRORESPON').AsString    := cdsRat.FieldByName('CODCENTRORESPON').AsString;
    cdsRateio.FieldByName('IDPESSOA').AsInteger          := cdsRat.FieldByName('IDPESSOA').AsInteger;
    cdsRateio.FieldByName('VALOR').AsFloat               := cdsRat.FieldByName('VALOR').AsFloat;
    cdsRateio.FieldByName('IDUSUARIOINCLUSAO').AsInteger := cdsRat.FieldByName('IDUSUARIOINCLUSAO').AsInteger;
    cdsRateio.FieldByName('UNIDNEGOC').AsString          := cdsRat.FieldByName('UNIDNEGOC').AsString;
    cdsRateio.FieldByName('IDPATRO').AsInteger           := cdsRat.FieldByName('IDPATRO').AsInteger;
    cdsRateio.FieldByName('IDPROGRAMA').AsInteger        := cdsRat.FieldByName('IDPROGRAMA').AsInteger;
    cdsRateio.FieldByName('IDPLANOPREV').AsInteger       := cdsRat.FieldByName('IDPLANOPREV').AsInteger;

    cdsRateio.Post;

    cdsRat.Next;
  end;
end;



procedure TfrmCadastroDarfMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  cds.Data          := CtrlDARF.ProcurarDARF(-1, Sistema.IdEmpresa);
  cdsDadosDoc.Data  := CtrlDARF.ListDadosDoc(-1);
end;



procedure TfrmCadastroDarfMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CtrlDARF.Free;
  CtrlNatuRendimento.Free;
  CtrlLancamento.Free;
end;



function TfrmCadastroDarfMT.VerificaPreenchimento: Boolean;
begin
  Result := False;

  // -----------------------------------------------------------------------------------------------
  // -----------------------------------------------------------------------------------------------

  try

    if CtrlGeraDarf.NaturezaResidExterior(cds.FieldByName('CODNATUREZA').AsString) then
      if not(
            (edtDataIniApuracao.Text = edtDataFimApuracao.Text) and
            (edtDataFimApuracao.Text = edtDataEmissao.Text) and
            (edtDataEmissao.Text = edtVencimento.Text) and
            (edtVencimento.Text = edtPagtoDarf.Text)
            ) then
        raise EValidacao.CreateVal('Para DARFs de residentes no exterior todas as datas têm de ser iguais à Data de Pagamento!', edtDataEmissao);

    if DBcboNatureza.LookupValue = '' then
      raise EValidacao.CreateVal('É necessário indicar a Natureza do Rendimento!', DBcboNatureza);

    if DBedtVlrDarf.Value = 0 then
      raise EValidacao.CreateVal('É necessário indicar o Valor do DARF!', DBedtVlrDarf);

    if Length(Trim(edtDataIniApuracao.Text)) = 0  then
      raise EValidacao.CreateVal('É necessário indicar a Data de Início da Apuração!', edtDataIniApuracao);

    if Length(Trim(edtDataFimApuracao.Text)) = 0  then
      raise EValidacao.CreateVal('É necessário indicar a Data de Final da Apuração!', edtDataFimApuracao);

    if Length(Trim(edtDataEmissao.Text)) = 0  then
      raise EValidacao.CreateVal('É necessário indicar a Data de Emissão!', edtDataEmissao);

    if Length(Trim(edtVencimento.Text)) = 0  then
      raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtVencimento);

    // ---------------------------------------------------------------------------------------------

  except
    on ev : EValidacao do
    begin
      Screen.Cursor := crDefault;
      if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
      Repaint;
      pgcDados.ActivePageIndex := 0;
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  // -----------------------------------------------------------------------------------------------
  // -----------------------------------------------------------------------------------------------

  try

    if (Sistema.UsaPlanoPatro) and (cds.State = dsInsert) then
    begin

      if DBcboPlanoPrevC.LookupValue = '' then
        raise EValidacao.CreateVal('É necessário indicar o Plano Previdenciário!', DBcboPlanoPrevC);

      if DBcboPatroC.LookupValue = '' then
        raise EValidacao.CreateVal('É necessário indicar a Patrocinadora!', DBcboPatroC);

      if DBcboPrograma.LookupValue = '' then
        raise EValidacao.CreateVal('É necessário indicar o Programa!', DBcboPrograma);

    end;  // if (Sistema.UsaPlanoPatro) and (cds.State = dsInsert)

    // ---------------------------------------------------------------------------------------------

  except
    on ev : EValidacao do
    begin
      Screen.Cursor := crDefault;
      if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
      Repaint;
      pgcDados.ActivePageIndex := 1;
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  // -----------------------------------------------------------------------------------------------
  // -----------------------------------------------------------------------------------------------

  Result := True;
end;



end.
