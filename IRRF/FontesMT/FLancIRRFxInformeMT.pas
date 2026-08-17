unit FLancIRRFxInformeMT;

// Alterações:
{-------------------------------------------------------------------------------
Analista.: William Moreira da Silva
Data.....: 29/09/2016
Sol......: 29011
Rotina...: dbrPercIRRFExit
Descrição: 5 casa de decimais no valor do percentual, e calulo automatico no onExit do campo
-------------------------------------------------------------------------------
Analista.: Fernando Xavier
Data.....: 08/09/2015
Sol......: 252109
PPM......: 1060594
Rotina...: CmeCadastroBeforeConfirma
Descrição: Solicito ajuste na funcionalidade de lançamento manual no módulo de impostos.
           Ao efetuar o lançamento a tela apresenta uma mensagem de que "O Valor
           do Imposto deve ser diferente de zero na aba de valores". Ocorre que existe
           valor e o modulo está ignorando.
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 226424 KINTANA 2060184
Data.....: 26/02/2014
Sol......: 226424
Kintana..: 2060184
Rotina...: ValidarModuloInforme
Descrição: Valor de parametro incorreto, tem que passar vazio
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 219250 KINTANA 2055037
Data.....: 10/09/2013
Sol......: 219250
Kintana..: 2055037
Rotina...: ValidarModuloInforme
Descrição: Função ValidarModuloInforme, para validar se o sistema pode fazer
lançamento sem patrocinadora e patro.
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 216223 KINTANA 2045657
Data.....: 10/09/2013
Sol......: 216223
Kintana..: 2045657
Rotina...: ValidarModuloInforme
Descrição: Função ValidarModuloInforme, para validar se o sistema pode fazer
lançamento sem patrocinadora e patro.
********************************************************************************
Analista.: Marcio Sanches Spinosa SOL 215621 KINTANA 2044679
Data.....: 03/09/2013
Sol......: 215621
Kintana..: 2044679
Rotina...: DELETALANCAMENTOS
Descrição: CHAMADA DA FUNÇÃO DELETALANCAMENTOS
********************************************************************************
Analista.: Edilaine Ferraresi
SOL......: 211939
Kintana..: 2044010
Data.....: 27/08/2013
Rotina...: CmeCadastroEdit, GerarIRRF, CmeCadastroDelete
Descrição: na alteração está sumindo com lancamentos da busca
{-------------------------------------------------------------------------------
Rotina......: PSubTipoBeneficiario1
Nº SOL......: 143206/4221
Nº KINTANA..: 1184695
Data........: 12/08/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Ajuste da propriedade FiltraSubtipo do PSubTipoBeneficiario1
              novamente para false de modo que se eliminasse o join entre as
              Pessoa e ClientePess
Alteração dfm: Foi alterado o componente PSubTipoBeneficiario1
--------------------------------------------------------------------------------
Rotina......: IntegraLancamentos
Nº SOL......: 156643
Nº KINTANA..: 1239806
Data........: 19/04/2011
Responsável.: Helen V. Bianchi
Descrição...: Add Verificação para não deixar Incluir Valor de Imposto = 0
--------------------------------------------------------------------------------
Rotina......: Várias
Nº SOL......: 135070
Nº KINTANA..: 813880
Data........: 26/05/2010
Responsável.: Thaise Amaral Martins
Descrição...: Alteração da propriedade FiltraSubtipo do PSubTipoBeneficiario1
              para true e mudança no select do component MontaSelect, trocando o
              left join de lugar (DOCUMENTO.CODDOCUMENTO=LANCIRRF.CODDOCUMENTO(+))
--------------------------------------------------------------------------------
Rotina    : Várias
Data      : 30/04/2008
Autor     : Bruno Bastos
Pendência : 27817
Descrição : Mudança na consulta das informações da lancxinforme.
--------------------------------------------------------------------------------
Rotina    : GerarIRRF
Data      : 11/07/2007
Autor     : Bruno Bastos
Pendência : 25833
Descrição : Não buscar o tipo de desembolso da natureza de rendimento.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 17/04/2007
Autor     : André Pontes
Pendência : -
Descrição : Passagem de vários cds de lookup para a dLookIRRF. Ajustes
            decorrentes no código.
--------------------------------------------------------------------------------
Rotina    : FormCreate, FormClose, GerarIRRF
Data      : 13/04/2007
Autor     : Bruno Bastos
Pendência : 18055
Descrição : Possibilitar alteração de campos como tipo de desembolso,
            centro de responsabilidade e código da GPS.
--------------------------------------------------------------------------------
Rotina    : dblcDocumentoEnter, PSubTipoBeneficiario1Exit
Data      : 12/01/2007
Autor     : Paulo Ramos
Pendência : 22790
Descrição : Busca os documentos de uma pessoa (idforcli) após a seleção do beneficiário. Passou a
            usar o novo método LancIRRF.ListDocumentoCliente.
----------------------------------------------------------------------------------------------------
Rotina    : GerarIRRF
Data      : 16/06/2006
Autor     : Bruno Bastos
Pendência : 22301
Descrição : Buscar na base o centro de responsabilidade e passar para a GravaIRRF.
----------------------------------------------------------------------------------------------------
Rotina    : CmeCadastroBeforeConfirma
Data      : 04/08/2004
Autor     : Marchetti
Pendência : 15738
Descrição : Colocada a verificação da restrição entre Plano x Patro
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, CMProcuraMask,
  wwdbdatetimepicker, CMDateTimePicker, CMProcuraSubTipo, DBCtrls, wwdblook,
  TREdit, CMDBLookupCombo, uCtrLancIRRF, uCtrlNatuRendimento, uCtrlInforme, uCtrlDARF,
  uMensErro, uDataBase, DBaseDados, uSistema, uctrlParamIntegra,
  DBTables, Wwquery, uCtrlObjIrrf, uCmSqlParams, Mask, uCtrlCentRespon, dLookIRRF, uCtrlParamIRRF;

type
  TfrmLancIRRFxInformeMT = class(TFrmCadastroMestreDetMT)
    dblcNatRendimento: TwwDBLookupCombo;
    lblNatRendimento: TLabel;
    dbFolha: TDBCheckBox;
    dblcDocumento: TwwDBLookupCombo;
    lblDocumento: TLabel;
    dblcCentroCusto: TwwDBLookupCombo;
    PSubTipoBeneficiario1: TCMProcuraSubTipo;
    dblcLinhaInforme: TCMDBLookupCombo;
    lblDataLancamento: TLabel;
    tbsValores: TTabSheet;
    dblcPrograma: TwwDBLookupCombo;
    dbedDataLanc: TCMDateTimePicker;
    dblcPatroC: TwwDBLookupCombo;
    cmccContaContabil: TCMProcuraMaskContabil;
    dblcPlanoPrevC: TwwDBLookupCombo;
    cdsDocumento: TCMClientDataSet;
    cdsInforme: TCMClientDataSet;
    dbrValorBase: TDBRealEdit;
    dbrIRRF: TDBRealEdit;
    dbrINSS: TDBRealEdit;
    cdsVerFolha: TCMClientDataSet;
    cdsPFisica: TCMClientDataSet;
    cdsTabIRRF: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    cdsDet: TCMClientDataSet;
    cdsEmpresaProp: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    dbrCOFINS: TDBRealEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dblModulo: TwwDBLookupCombo;
    Label6: TLabel;
    dbrCSLL: TDBRealEdit;
    rdgImposto: TRadioGroup;
    dbrIOF: TDBRealEdit;
    dbrISS: TDBRealEdit;
    dbrPIS: TDBRealEdit;
    dbrCSCOFPIS: TDBRealEdit;
    dbreValor: TDBEdit;
    cdsAuxAlt: TCMClientDataSet;

    procedure PSubTipoBeneficiario1Exit(Sender: TObject);
    procedure dbreValorExit(Sender: TObject);
    procedure dbrValorBaseExit(Sender: TObject);
    procedure dbrPercIRRFExit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeDetalheAfterConfirma(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgImpostoClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnSairExit(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);

  private // Private declarations

    LancIRRF        : TCtrLancIRRF;
    NatuRendimento  : TCtrlNatuRendimento;
    Informe         : TCtrlInforme;
    Darf            : TCtrlDARF;


    ObjIrrf         : TCtrlObjIrrf;
    ParamIRRF       : TCtrlParamIRRF;
    CRespon         : TCtrlCentRespon;

    iCodGPS,
    iidModulorespon,
    iIdVersaoFolha,
    iIdMotivo,
    iIdModulo,
    iIdPlanoPrev,
    iIdPatro,
    iIdPrograma,
    iCodDocumento,
    iBenef,
    iIdLanctoIRRF      : Integer;

    sCodCentRespon,
    sCodNatureza,
    sDataLanc,
    sFlgFolha,
    sContaContabil,
    sCodCentroCusto,
    sCodtiprecdes,
    sPlacontad      : String;

    function  GerarIRRF : Boolean;
    function  ValidarModuloInforme (pModulo, pNatureza : string): Boolean;


  public  // Public declarations
   bAlterar: Boolean;
  end;



var
  frmLancIRRFxInformeMT: TfrmLancIRRFxInformeMT;
 //bAlterar: Boolean;


implementation
{$R *.DFM}
uses
  {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF}, uCmControlObject;



procedure TfrmLancIRRFxInformeMT.PSubTipoBeneficiario1Exit(Sender: TObject);
begin
  inherited;


  if CmeCadastro.Operacao = opInserir then
  begin
    if trim(PSubTipoBeneficiario1.text) <> '' then
    begin
      cdsPFisica.Data   := LancIRRF.ListPF(PSubTipoBeneficiario1.SubTipoReg.Id);
      cdsDocumento.Data := LancIRRF.ListDocumentoCliente(PSubTipoBeneficiario1.SubTipoReg.Id);

      lblDocumento.Enabled  := True;
      dblcDocumento.Enabled := True;
    end
    else
    begin
      lblDocumento.Enabled  := False;
      dblcDocumento.Enabled := False;
    end;
  end;
end;

procedure TfrmLancIRRFxInformeMT.dbreValorExit(Sender: TObject);
var sValtot:String;
begin
  inherited;
  if cdsPFisica.FieldByName('TIPO').AsString = 'F' then
  begin
    sValTot := LancIRRF.OraNumero(dbrValorBase.value);

    cdsTabIRRF.Data := ObjIrrf.ListFaixaIR(sValTot, dbedDataLanc.Text);

    if not cdsTabIRRF.IsEmpty then
    begin
      cds.FieldByName('VLRIRRF').asfloat       := ((dbrValorBase.value)*(cdsTabIRRF.FieldByName('ALIQUOTA_IRRF').AsFloat/100))-(cdsTabIRRF.FieldByName('PARCDEDUZIRRF').AsFloat);
      cds.fieldbyname('VLRREFERENCIA').asfloat := cds.FieldByName('VLRBASE').asfloat;
      cds.fieldbyname('PERCIRRF').asfloat      := cdsTabIRRF.FieldByName('ALIQUOTA_IRRF').AsFloat;
    end;
  end;
end;

procedure TfrmLancIRRFxInformeMT.dbrValorBaseExit(Sender: TObject);
var sValtot:String;
begin
  inherited;
  if cdsPFisica.FieldByName('TIPO').AsString = 'F' then
  begin
    sValTot:= LancIRRF.OraNumero(dbrValorBase.value);

    cdsTabIRRF.Data := ObjIrrf.ListFaixaIR(sValTot, dbedDataLanc.Text);

    if not cdsTabIRRF.IsEmpty then
    begin
      cds.FieldByName('VLRIRRF').asfloat       := ((dbrValorBase.value)*(cdsTabIRRF.FieldByName('ALIQUOTA_IRRF').AsFloat/100))-(cdsTabIRRF.FieldByName('PARCDEDUZIRRF').AsFloat);
      cds.fieldbyname('VLRREFERENCIA').asfloat := cds.FieldByName('VLRBASE').asfloat;
      cds.fieldbyname('PERCIRRF').asfloat      := cdsTabIRRF.FieldByName('ALIQUOTA_IRRF').AsFloat;
    end;
  end;
end;

procedure TfrmLancIRRFxInformeMT.dbrPercIRRFExit(Sender: TObject);
begin
  inherited;
  //William Moreira da Silva - SIG 29011
  //if (cdsPFisica.FieldByName('TIPO').AsString = 'J') or
  //   (cdsPFisica.FieldByName('TIPO').isNull)         then
  //Begin
    cds.FieldByName('VLRIRRF').AsFloat := (cds.FieldByName('VLRBASE').AsFloat * ((cds.FieldByName('PERCIRRF').AsFloat)/100));
    //dbrIRRF.Value                      := cds.FieldByName('VLRIRRF').AsFloat;
      Case rdgImposto.ItemIndex Of
        0 : dbrIRRF.Value := cds.FieldByName('VLRIRRF').AsFloat;
        1 : dbrINSS.Value := cds.FieldByName('VLRIRRF').AsFloat;
        2 : dbrISS.Value := cds.FieldByName('VLRIRRF').AsFloat;
        3 : dbrCSLL.Value := cds.FieldByName('VLRIRRF').AsFloat;
        4 : dbrPIS.Value := cds.FieldByName('VLRIRRF').AsFloat;
        5 : dbrCOFINS.Value := cds.FieldByName('VLRIRRF').AsFloat;
        6 : dbrCSCOFPIS.Value := cds.FieldByName('VLRIRRF').AsFloat;
        7 : dbrIOF.Value := cds.FieldByName('VLRIRRF').AsFloat;
      End;
  //end;
  //William Moreira da Silva - SIG 29011
end;

procedure TfrmLancIRRFxInformeMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var rFator:Double;
begin
  Accept := False;

  if Trim(dblModulo.Text) = '' Then
  Begin
    MsgDlg('O preenchimento do módulo responsável é obrigatório.', 'Informação', mtInformation, [mbOk], 0);
    dblModulo.SetFocus;
    Exit;
  End;

  if trim(PSubTipoBeneficiario1.text) = '' then
  Begin
    MsgDlg('Obrigatório preencher o Beneficiário','Informação',mtInformation,[mbOk],0);
    PSubTipoBeneficiario1.SetFocus;
    exit;
  end;


  If Not bAlterar then
  begin
    if (ActiveControl.Tag <> 99)  and (PSubTipoBeneficiario1.Valida <> VcOK) then
    Begin
      PSubTipoBeneficiario1.SetFocus;
      exit;
    end;
  end;

  if trim(dbedDataLanc.text) = '' then
  Begin
    MsgDlg('Obrigatório preencher a Data de Lançamento','Informação',mtInformation,[mbOk],0);
    dbedDataLanc.SetFocus;
    exit;
  end;

  if trim(dblcNatRendimento.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a Natureza do Rendimento','Informação',mtInformation,[mbOk],0);
    dblcNatRendimento.SetFocus;
    exit;
  end;

  if ParamIntegra.IntegraContab then
  begin
    if cmccContaContabil.Valida <> VcOK then
    begin
      cmccContaContabil.SetFocus;
      Exit;
    end;
  end;

  if Sistema.UsaPlanoPatro then
  begin
    if (ValidarModuloInforme(dblModulo.LookupValue,
                             dblcNatRendimento.LookupValue)) then////Marcio Sanches Spinosa SOL 216223 KINTANA 2045657
    begin
      if trim(dblcPlanoPrevC.Text) = '' then
      begin
        MsgDlg('Obrigatório preencher o Plano Previdenciário','Informação',mtInformation,[mbOk],0);
        if dblcPlanoPrevC.CanFocus then dblcPlanoPrevC.SetFocus;
        exit;
      end;

      if trim(dblcPatroC.Text) = '' then
      begin
        MsgDlg('Obrigatório preencher a Patrocinadora','Informação',mtInformation,[mbOk],0);
        if dblcPatroC.CanFocus then dblcPatroC.SetFocus;
        exit;
      end;

      if not LancIRRF.VerificaPlanoPatro(StrToInt(dblcPlanoPrevC.LookupValue),
                                         StrToInt(dblcPatroC.LookupValue)) then
      begin
        MsgDlg('Não existe o relacionamento entre o Plano e a Patrocinadora selecionados','Informação',mtInformation,[mbOk],0);
        exit;
      end;

    end;////Marcio Sanches Spinosa SOL 216223 KINTANA 2045657

  end;

  // Helen - SOL: 156643 KTN: 1239806
  if cds.State in [dsinsert] then
  begin
     if (dbrIRRF.Text = '0') or (trim(dbrIRRF.Text) = '') then  // Sol 252109 PPM 1060594
     begin
        MsgDlg('O Valor do Imposto deve ser diferente de zero na Aba Valores.','Informação',mtInformation,[mbOk],0);
        if dbrIRRF.CanFocus then dbrIRRF.SetFocus;
        exit;
     end;
  end;
  // Helen - SOL: 156643 KTN: 1239806 - FIM
  Accept := True;
  if ParamIntegra.IntegraContab then
    cds.FieldByName('PLANO').AsFloat := ParamIntegra.Plano;

  if cds.FieldByName('IDLANCIRRF').AsInteger <= 0 then
    cds.FieldByName('IDLANCIRRF').AsInteger := darf.PegaId('LANCIRRF');

  cdsDet.First;
  while not cdsDet.EOF do
  begin
    cdsAux.Data := Informe.ProcurarInforme(cdsDet.fieldByname('IDINFORME').AsInteger);
    if cdsAux.FieldByName('FLGNATUREZA').isNull then
    begin
      if cdsAux.FieldByName('CODDIRF').AsInteger in [1,2,5]
      then rFator := 1
      else rFator := -1;
    end
    else
    begin
      if cdsAux.FieldByName('FLGNATUREZA').AsString = 'P'
      then rFator := 1
      else rFator := -1;
    end;
    cdsDet.Edit;
    cdsDet.fieldByname('IDLANCIRRF').AsFloat   := cds.FieldByName('IDLANCIRRF').AsFloat;
    cdsDet.fieldByname('VLRLANCSINAL').AsFloat := cdsDet.fieldByname('VLRLANC').AsFloat * rFator;
    cdsDet.Post;
    cdsDet.Next;
  end;
end;

procedure TfrmLancIRRFxInformeMT.CmeCadastroDelete(Sender: TObject);
begin
  // // Edilaine - SOL 211939 / KTN 2044010 - deve apagar apenas os lançamentos do IDLANCIRRF selecionado e seus lançamentos
  {if not LancIRRF.Deletar(cds.fieldByname('IDLANCIRRF').AsInteger,
                          cds.FieldByName('IDBENEFIRRF').AsInteger,
                          cds.FieldByName('DATAPAGAMENTO').AsDateTime,
                          True,
                          Cds.FieldByName('CODNATUREZA').asString) then
  } // Edilaine - SOL 211939 / KTN 2044010 - fim

  if not LancIRRF.Deletar(cds.fieldByname('IDLANCIRRF').AsInteger, true) then
  begin
    MsgDlg('Erro ao tentar excluir Lançamentos ligados ao Documento do IRRF','Erro',mtError,[mbOk],0);
    cds.Data    := LancIRRF.ProcurarLancIRRF(cds.FieldByName('IDLANCIRRF').AsInteger);
    cdsDet.Data := LancIRRF.ProcurarDetalhe(cds.FieldByName('IDLANCIRRF').AsInteger);    // Edilaine - SOL 211939 / KTN 2044010

    { // Edilaine - SOL 211939 / KTN 2044010 - comentado
    //CPrev - Pend. 27817 - cdsDet.Data := LancIRRF.ProcurarDetalhe(cds.FieldByName('IDLANCIRRF').AsInteger);
    //Marcio Sanches Spinosa SOL: 192653 KINTANA: 1831007 - Inicio
    cdsDet.Data := LancIRRF.ProcurarDetalhe(cds.FieldByName('IDBENEFIRRF').AsInteger,
                                            cds.FieldByName('DATAPAGAMENTO').AsString,
                                            Cds.FieldByName('CODNATUREZA').AsString); //CPrev - Pend. 27817
    //Marcio Sanches Spinosa SOL: 192653 KINTANA: 1831007 - Fim
    } // Edilaine - SOL 211939 / KTN 2044010 - comentado

  end;
  cds.Data    := LancIRRF.ProcurarLancIRRF(cds.FieldByName('IDLANCIRRF').AsInteger);
  cdsDet.Data := LancIRRF.ProcurarDetalhe(cds.FieldByName('IDLANCIRRF').AsInteger);   // Edilaine - SOL 211939 / KTN 2044010

  { // Edilaine - SOL 211939 / KTN 2044010 - comentado
  //CPrev - Pend. 27817 - cdsDet.Data := LancIRRF.ProcurarDetalhe(cds.FieldByName('IDLANCIRRF').AsInteger);
  //Marcio Sanches Spinosa SOL: 192653 KINTANA: 1831007 - Inicio
  cdsDet.Data := LancIRRF.ProcurarDetalhe(cds.FieldByName('IDBENEFIRRF').AsInteger,
                                          cds.FieldByName('DATAPAGAMENTO').AsString,
                                          Cds.FieldByName('CODNATUREZA').AsString); //CPrev - Pend. 27817
  //Marcio Sanches Spinosa SOL: 192653 KINTANA: 1831007 - Fim
  } // Edilaine - SOL 211939 / KTN 2044010 - fim

end;

procedure TfrmLancIRRFxInformeMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  tbsValores.Enabled := True;
  PSubTipoBeneficiario1.SetFocus;
end;

procedure TfrmLancIRRFxInformeMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  iIdLanctoIRRF := -1;
  if MontaSelect.RetornouValor then
  begin

    tbsValores.Enabled       := False;
    cds.Data                 := LancIRRF.ProcurarLancIRRF(StrToint(MontaSelect.ValoresChave[0]));

    iIdLanctoIRRF := StrToint(MontaSelect.ValoresChave[0]);

    cdsDet.Data              := LancIRRF.ProcurarDetalhe(StrToint(MontaSelect.ValoresChave[0]));  // Edilaine - SOL 211939 / KTN 2044010

    { // Edilaine - SOL 211939 / KTN 2044010 - comentado
    //CPrev - Pend. 27817 - cdsDet.Data              := LancIRRF.ProcurarDetalhe(StrToint(MontaSelect.ValoresChave[0]));
    //Marcio Sanches Spinosa SOL: 192653 KINTANA: 1831007 - Inicio
    cdsDet.Data := LancIRRF.ProcurarDetalhe(StrToint(MontaSelect.ValoresChave[2]),
                                            MontaSelect.ValoresChave[3],
                                            Cds.FieldByName('CODNATUREZA').AsString); //CPrev - Pend. 27817
    //Marcio Sanches Spinosa SOL: 192653 KINTANA: 1831007 - Fim
    } // Edilaine - SOL 211939 / KTN 2044010 - fim

    //P.RAMOS-12/01/2007-PEND.22790
    //cdsDocumento.Data := LancIRRF.ListDocumento(cds.FieldByName('CODDOCUMENTO').Asinteger);
    cdsDocumento.Data        := LancIRRF.ListDocumentoCliente(cds.fieldbyname('IDBENEFIRRF').asinteger);
    cdsPFisica.Data          := LancIRRF.ListPF(cds.fieldbyname('IDBENEFIRRF').asinteger);
    LancIRRF.CdsLancIRRF     := cds;
    LancIRRF.CdsLancxinforme := cdsdet;

    if (cds.FieldByName('VLRIRRF').AsFloat     > 0) then
      rdgImposto.ItemIndex := 0;

    If (cds.FieldByName('VLRINSS').AsFloat     > 0) Then
      rdgImposto.ItemIndex := 1;
                                                     
    If (cds.FieldByName('VLRISS').AsFloat      > 0) Then
      rdgImposto.ItemIndex := 2;

    If (cds.FieldByName('VLRCSLL').AsFloat     > 0) Then
      rdgImposto.ItemIndex := 3;

    If (cds.FieldByName('VLRPIS').AsFloat      > 0) Then
      rdgImposto.ItemIndex := 4;

    If (cds.FieldByName('VLRCOFINS').AsFloat   > 0) Then
      rdgImposto.ItemIndex := 5;

    If (cds.FieldByName('VLRCSCOFPIS').AsFloat > 0) Then
      rdgImposto.ItemIndex := 6;

    If (cds.FieldByName('VLRIOF').AsFloat > 0) Then
      rdgImposto.ItemIndex := 7;

    rdgImpostoClick(Self);

    if trim(PSubTipoBeneficiario1.text) <> '' then
    begin
      lblDocumento.Enabled  := True;
      dblcDocumento.Enabled := True;
    end
    else
    begin
      lblDocumento.Enabled  := False;
      dblcDocumento.Enabled := False;
    end;

  end;
end;

procedure TfrmLancIRRFxInformeMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  tbsValores.Enabled                       := True;
  PSubTipoBeneficiario1.SetFocus;
  //Marcio Sanches Spinosa SOL: 192653 KINTANA: 1831007 - Inicio
  cdsDet.Data                              := LancIRRF.ProcurarDetalhe(-1, '', EmptyStr);//Marcio Sanches Spinosa SOL 226424 KINTANA 2060184
  //Marcio Sanches Spinosa SOL: 192653 KINTANA: 1831007 - Fim  
  cds.FieldByName('IDPESSOA').AsInteger    := Sistema.IdEmpresa;
  cds.FieldByName('FLGFOLHA').AsString     := 'N';
  cds.FieldByName('NUMDOCUMENTO').AsString := cdsEmpresaProp.FieldByName('NUMDOCUMENTO').AsString;

  if ( dtmLookIRRF.cdsParamIRRF.FieldByName('FLGUSAMANUAL').AsInteger = 1 ) and
     ( iBenef > 0 )                                                         then
  begin
    cds.FieldByName('IDBENEFIRRF').AsInteger     := iBenef;
    cds.FieldByName('DATALANCAMENTO').AsString   := sDataLanc;
    cds.FieldByName('PLACONTA').AsString         := sContaContabil;
    cds.FieldByName('CODDOCUMENTO').AsInteger    := iCodDocumento;
    cds.FieldByName('FLGFOLHA').AsString         := sFlgFolha;
    cds.FieldByName('CODNATUREZA').AsString      := sCodNatureza;
    cds.FieldByName('IDMODULORESPON').AsInteger  := iIdModuloRespon;
    cds.FieldByName('IDPROGRAMA').AsInteger      := iIdPrograma;
    cds.FieldByName('IDMOTIVO').AsInteger        := iIdMotivo;
    cds.FieldByName('CODTIPRECDES').AsString     := sCodtiprecdes;
    cds.FieldByName('IDPATRO').AsInteger         := iIdPatro;
    cds.FieldByName('CODCENTROCUSTO').AsString   := sCodCentroCusto;
    cds.FieldByName('IDHSTFOLHABENEF').AsInteger := iIdVersaoFolha;
    cds.FieldByName('CODCENTRORESPON').AsString  := sCodCentRespon;
    cds.Fieldbyname('CODIGOGPS').AsInteger       := iCodGPS;
  end;

end;

procedure TfrmLancIRRFxInformeMT.CmeDetalheConfirma(Sender: TObject);
begin
  if cdsDet.State in [dsEdit,dsInsert] then
    cdsDet.fieldByname('NOMEINFORME').AsString := dblcLinhaInforme.Text;
  inherited;
end;

procedure TfrmLancIRRFxInformeMT.FormCreate(Sender: TObject);
begin
  inherited;
  // -----------------------------------------------------------------------------------------------

  LancIRRF        := TCtrLancIRRF.Create;
  ObjIrrf         := TCtrlObjIrrf.Create;
  NatuRendimento  := TCtrlNatuRendimento.Create;
  Informe         := TCtrlInforme.Create;
  Darf            := TCtrlDARF.Create;
  ParamIRRF       := TCtrlParamIrrf.Create;
  CRespon         := TCtrlCentRespon.Create;

  // -----------------------------------------------------------------------------------------------

  LancIRRF.Initialize(DtmBaseDados.dbBaseDados,
                      True,
                      Sistema.ConnectionType,
                      Sistema.ConnectionSide,
                      Sistema.AppRemoteServer,
                      True,
                      nil,
                      nil,
                      False
                     );

  ObjIrrf.InitializeAs(LancIRRF);

  ParamIRRF.InitializeAs(LancIRRF);
  CRespon.InitializeAs(LancIRRF);
  NatuRendimento.InitializeAs(LancIRRF);
  Informe.InitializeAs(LancIRRF);
  Darf.InitializeAs(LancIRRF);

  // -----------------------------------------------------------------------------------------------

  cds.Data                 := LancIRRF.ProcurarLancIRRF(-1);
  LancIRRF.CdsLancIRRF     := cds;
  //Marcio Sanches Spinosa SOL: 192653 KINTANA: 1831007 - Inicio
  cdsDet.Data              := LancIRRF.ProcurarDetalhe(-1, '', EmptyStr); //Marcio Sanches Spinosa SOL 226424 KINTANA 2060184
  //Marcio Sanches Spinosa SOL: 192653 KINTANA: 1831007 - Fim  
  LancIRRF.CdsLancxinforme := cdsdet;


  cmccContaContabil.Plano               := ParamIntegra.Plano;
  cmccContaContabil.Mascara             := ParamIntegra.MascaraPlano;
  dtmLookIRRF.cdsLookNatureza.Data      := NatuRendimento.ListNaturendimento;
  cdsInforme.Data                       := Informe.ListInforme;
  dtmLookIRRF.cdsLookPlanoPrev.Data     := Darf.ListPlanoPrev;
  dtmLookIRRF.cdsLookPatro.Data         := Darf.ListPatrocinadora;
  dtmLookIRRF.cdsLookPrograma.Data      := Darf.ListPrograma;
  dtmLookIRRF.cdsLookCentroCusto.Data   := LancIRRF.ListCentCust(Sistema.idEmpresa);
  dtmLookIRRF.cdsLookMotivo.Data        := LancIRRF.ListMotivo;
  cdsVerFolha.Data                      := LancIRRF.ListVersaoFolha;
  cdsEmpresaProp.Data                   := Darf.ListEmpresaProp(Sistema.idEmpresa);
  dtmLookIRRF.cdsLookModulo.Data        := LancIRRF.ListModulos;

  dtmLookIRRF.cdsLookTipoDesemb.Data    := ParamIRRF.ListTipoDesembolso(Sistema.IdEmpresa);
  dtmLookIRRF.cdsLookCentroRespon.Data  := CRespon.ListaCentRespon(Sistema.IdEmpresa);

  dtmLookIRRF.cdsParamIRRF.Data         := ParamIRRF.ProcurarParamIRRF(Sistema.IdEmpresa); 
end;



function TfrmLancIRRFxInformeMT.GerarIRRF : Boolean;
var
    rValBase, rValIRRF, rValINSS, rValPIS,rValIOF, rValRef, rPerc, iCodLanc : Double;
    bPrim : Boolean;
    rValISS,
    rValCofins, rValCSLL, rvalPISCOFINSCSLL : double ;
    rValorDepIrrf : Double;
begin
  Result := True;
  Try
    iCodDocumento     := cds.FieldByName('CODDOCUMENTO').AsInteger;
    iBenef            := cds.FieldByName('IDBENEFIRRF').AsInteger;
    sCodNatureza      := cds.FieldByName('CODNATUREZA').AsString;
    sDataLanc         := cds.FieldByName('DATALANCAMENTO').AsString;
    rValBase          := cds.FieldByName('VLRBASE').AsFloat;
    rValIRRF          := cds.FieldByName('VLRIRRF').AsFloat;
    rValINSS          := cds.FieldByName('VLRINSS').AsFloat;
    rValPIS           := cds.FieldByName('VLRPIS').AsFloat;
    rValIOF           := cds.FieldByName('VLRIOF').AsFloat;
    rValRef           := cds.FieldByName('VLRREFERENCIA').AsFloat;
    rPerc             := cds.FieldByName('PERCIRRF').AsFloat;
    sContaContabil    := cds.FieldByName('PLACONTA').AsString;
    sFlgFolha         := cds.FieldByName('FLGFOLHA').AsString;
    iIdPlanoPrev      := cds.FieldByName('IDPLANOPREV').AsInteger;
    iIdPatro          := cds.FieldByName('IDPATRO').AsInteger;
    iIdPrograma       := cds.FieldByName('IDPROGRAMA').AsInteger;
    sCodCentroCusto   := cds.FieldByName('CODCENTROCUSTO').AsString;
    sCodCentRespon    := cds.FieldByName('CODCENTRORESPON').AsString;
    sCodtiprecdes     := cds.FieldByName('CODTIPRECDES').AsString;

    rValCOFINS        := cds.Fieldbyname('VLRCOFINS').asFloat;
    rValCSLL          := cds.Fieldbyname('VLRCSLL').asFloat;
    rValPISCOFINSCSLL := cds.Fieldbyname('VLRCSCOFPIS').asFloat;
    iIdModulo         := Sistema.idModulo;
    iIdModuloRespon   := cds.FieldByName('IDMODULORESPON').AsInteger;

    rValISS           := cds.Fieldbyname('VLRISS').AsFloat;
    iCodGPS           := cds.Fieldbyname('CODIGOGPS').AsInteger;

    rValorDepIrrf     := cds.Fieldbyname('VLRDEPIRRF').asFloat;
    iCodLanc          := 0;
    bPrim             := True;
    if sbtnAlterar.Down then
    begin
      iCodLanc  := cds.FieldByName('IDLANCIRRF').AsFloat;
      iIdModulo := cds.FieldByName('IDMODULO').AsInteger;
      //LancIRRF.Deletar(cds.FieldByName('IDLANCIRRF').Asinteger);           // Edilaine - SOL 211939 / KTN 2044010
      LancIRRF.DeletaLancamentos(cds.FieldByName('IDLANCIRRF').Asinteger);   // Marcio Sanches Spinosa SOL 215621 KINTANA 2044679
      { // Edilaine - SOL 211939 / KTN 2044010
      LancIRRF.Deletar(cds.FieldByName('IDLANCIRRF').Asinteger,
                       cds.FieldByName('IDBENEFIRRF').AsInteger,
                       cds.FieldByName('DATAPAGAMENTO').AsDateTime,
                       False,
                       Cds.FieldByName('CODNATUREZA').asString);
      } // Edilaine - SOL 211939 / KTN 2044010 - fim
    end;

    if cds.FieldByName('IDMOTIVO').isNull
    then iIdMotivo := -1
    else iIdMotivo := cds.FieldByName('IDMOTIVO').AsInteger;

    if cds.FieldByName('IDHSTFOLHABENEF').isNull
    then iIdVersaoFolha := -1
    else iIdVersaoFolha := cds.FieldByName('IDHSTFOLHABENEF').AsInteger;

    if trim(sCodtiprecdes) = '' Then
    begin
      MsgDlg('É obrigatório selecionar o Tipo de Desembolso.','Informação',mtInformation,[mbOk],0);
      result := False;
      exit;
    end;

    if not LancIRRF.GravaIRRF(sistema.IdEmpresa,
                              sistema.UsaPlanoPatro,
                              iCodDocumento,
                              Sistema.idEmpresa,
                              iBenef,
                              sCodNatureza,
                              sDataLanc,
                              rValBase,
                              rValIRRF,
                              rValINSS,
                              rValPIS,
                              rValRef,
                              rPerc,
                              rvalCOFINS,
                              rValCSLL,
                              rValPISCOFINSCSLL,
                              cdsDet.Data,
                              iCodLanc,
                              sContaContabil,
                              ParamIntegra.Plano,
                              sFlgFolha,
                              iIdPlanoPrev,
                              iIdPatro,
                              iIdPrograma,
                              bPrim,
                              iIdModulo,
                              iIdModuloRespon,
                              iIdMotivo,
                              sCodCentroCusto,
                              iIdVersaoFolha,
                              sCodtiprecDes,
                              sContaContabil,
                              sCodCentRespon,
                              rValorDepIrrf,
                              rValIOF,
                              False,
                              rValISS,
                              True,
                              '',
                              iCodGPS) then
    begin
      Result := False;
      exit;
    end;

  Except
    cds.Data    := LancIRRF.ProcurarLancIRRF(cds.FieldByName('IDLANCIRRF').AsInteger);
    cdsDet.Data := LancIRRF.ProcurarDetalhe(cds.FieldByName('IDLANCIRRF').AsInteger);  // Edilaine - SOL 211939 / KTN 2044010

    //CPrev - Pend. 27817 - cdsDet.Data := LancIRRF.ProcurarDetalhe(cds.FieldByName('IDLANCIRRF').AsInteger);
   { // Edilaine - SOL 211939 / KTN 2044010 - comentado
   //Marcio Sanches Spinosa SOL: 192653 KINTANA: 1831007 - Inicio
    cdsDet.Data := LancIRRF.ProcurarDetalhe(cds.FieldByName('IDBENEFIRRF').AsInteger,
                                            cds.FieldByName('DATAPAGAMENTO').AsString,
                                            Cds.FieldByName('CODNATUREZA').AsString); //CPrev - Pend. 27817
    //Marcio Sanches Spinosa SOL: 192653 KINTANA: 1831007 - Fim
    } // Edilaine - SOL 211939 / KTN 2044010 - fim

    raise;
  end;
  cds.Data    := LancIRRF.ProcurarLancIRRF(cds.FieldByName('IDLANCIRRF').AsInteger);
  cdsDet.Data := LancIRRF.ProcurarDetalhe(cds.FieldByName('IDLANCIRRF').AsInteger);  // Edilaine - SOL 211939 / KTN 2044010

  { // Edilaine - SOL 211939 / KTN 2044010 - comentado
  //CPrev - Pend. 27817 - cdsDet.Data := LancIRRF.ProcurarDetalhe(cds.FieldByName('IDLANCIRRF').AsInteger);
  //Marcio Sanches Spinosa SOL: 192653 KINTANA: 1831007 - Inicio
  cdsDet.Data := LancIRRF.ProcurarDetalhe(cds.FieldByName('IDBENEFIRRF').AsInteger,
                                          cds.FieldByName('DATAPAGAMENTO').AsString,
                                          Cds.FieldByName('CODNATUREZA').AsString); //CPrev - Pend. 27817
  //Marcio Sanches Spinosa SOL: 192653 KINTANA: 1831007 - Fim
  } // Edilaine - SOL 211939 / KTN 2044010 - fim

end;

procedure TfrmLancIRRFxInformeMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := GerarIRRF;
end;

procedure TfrmLancIRRFxInformeMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept :=  GerarIRRF;
end;

procedure TfrmLancIRRFxInformeMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmLancIRRFxInformeMT.CmeDetalheAfterConfirma(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmLancIRRFxInformeMT.FormActivate(Sender: TObject);
begin
  inherited;
  if Sistema.UsaPlanoPatro then
  begin
    dblcPlanoPrevC.Enabled  := True;
    dblcPatroC.Enabled      := True;
    dblcPrograma.Enabled    := True;
    dblcCentroCusto.Enabled := True;
  end
  else
  begin
    dblcPlanoPrevC.Enabled  := False;
    dblcPatroC.Enabled      := False;
    dblcPrograma.Enabled    := False;
    dblcCentroCusto.Enabled := False;
  end;
  cdsPFisica.Data := LancIRRF.ListPF(-1);
  iIdLanctoIRRF := -1;
end;

procedure TfrmLancIRRFxInformeMT.bbtnConfirmarClick(Sender: TObject);
begin
  // Alterado Por Arnaldo V. Scarin em 12/09/2008
  If Not bAlterar then
  begin
    if (ActiveControl.Tag            <> 99)   and
       (PSubTipoBeneficiario1.Valida <> VcOK) then
    Begin
      PSubTipoBeneficiario1.SetFocus;
      exit;
    end;
  end;
  inherited;
end;

procedure TfrmLancIRRFxInformeMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  LancIRRF.free;
  NatuRendimento.free;
  Informe.free;
  Darf.free;
  ObjIrrf.Free;
  ParamIRRF.Free; 
  CRespon.Free;   
end;

procedure TfrmLancIRRFxInformeMT.rdgImpostoClick(Sender: TObject);
begin
  inherited;
  Case rdgImposto.ItemIndex Of
    0 : dbrIRRF.BringToFront;
    1 : dbrINSS.BringToFront;
    2 : dbrISS.BringToFront; 
    3 : dbrCSLL.BringToFront;
    4 : dbrPIS.BringToFront;
    5 : dbrCOFINS.BringToFront;
    6 : dbrCSCOFPIS.BringToFront;
    7 : dbrIOF.BringToFront;
  End;
end;



procedure TfrmLancIRRFxInformeMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  bAlterar:= True;

end;

procedure TfrmLancIRRFxInformeMT.bbtnCancelarClick(Sender: TObject);
begin

  bAlterar:= False;
  inherited;

end;

procedure TfrmLancIRRFxInformeMT.bbtnSairClick(Sender: TObject);
begin

  if bAlterar = True then
  begin
    bAlterar:= False;
    cdsDet.Close;
  end;

  inherited;

end;

procedure TfrmLancIRRFxInformeMT.bbtnSairExit(Sender: TObject);
begin

  bAlterar:= False;
  inherited;

end;

procedure TfrmLancIRRFxInformeMT.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  //Marcio Sanches Spinosa SOL: 192653 KINTANA: 1831007 - Inicio
  Cds.FieldByName('VLRBASE').Value := cdsDet.FieldByName('VLRLANC').AsCurrency;
  dbrValorBase.OnExit(Self);
 //Marcio Sanches Spinosa SOL: 192653 KINTANA: 1831007 - fim
end;

//Marcio Sanches Spinosa SOL 216223 KINTANA 2045657 - Inicio
function TfrmLancIRRFxInformeMT.ValidarModuloInforme(pModulo,
  pNatureza: string): Boolean;
begin
  if (StrToInt(pModulo) = 3) and ((pNatureza  = '5952') or (pNatureza = '1708')
     or (pNatureza = '8045')) then //Marcio Sanches Spinosa SOL 219250 KINTANA 2055037
     Result := False
  else
     Result := True;
end;
//Marcio Sanches Spinosa SOL 216223 KINTANA 2045657 - Fim

end.
