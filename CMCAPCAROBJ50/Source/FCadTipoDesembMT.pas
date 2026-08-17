 unit FCadTipoDesembMT;
//***************************************************************************************
// Nº WO.......: 35649
// Data........: 19/05/2026
// Responsável.: Leandro cPocebon
// Descrição...: - Troca de caption rgAtivoInativo
//***************************************************************************************
//Rotina             : FormCreate, CmeCadastroInsert
//N. SIG..........   : 115585
//Data da Alteração: : 18/05/2021
//Alteração Form:    : FCadTipoDesembMT
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Retirada do campo "Caracteriza uma despesa de serviço".
//***************************************************************************************
//Rotina             : FormCreate, CmeCadastroInsert
//N. SIG..........   : 23656.57631
//Data da Alteração: : 30/10/2017
//Alteração Form:    : FCadTipoDesembMT
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Inclusão do campo "Caracteriza uma despesa de serviço", e faz os
//									   devidos tratamentos para o campo aparecer apenas para o módulo
//										 Contas a Pagar.
//***************************************************************************************
{--------------------------------------------------------------------------------------------------
 Nº SOL......: 172384/9603
 Nº KINTANA..: 1661662
 Data........: 25/06/2012
 Responsável.: Vander Campos
 Descrição...: - Troca de Label ChkObrigaOrc
--------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 136242
Nº KINTANA..: 813941
Data........: 01/09/2011
Responsável.: José Roberto Marque
Descrição...: - Implementação da aba "Alteradores", de modo a permitir vincular
                tipos de desembolso x alteradores;
              - Passa a exibir a primeira aba como selecionada ao entrar no
                programa.                                     
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 141007
Nº KINTANA..: 888280
Data........: 09/08/2010
Responsável.: Thaise Amaral Martins
Descrição...: - Correção nos botões 'Analítico' e 'Sintético', que não estavam atualizando conforme
              a mudança de registros na pesquisa.
              - Correção no campo CODTIPRECDES, pois não estava sendo colocada mascara conforme
              se fazia a pesquisa nos registros.
              - A Alteração corrige o erro ocorrido no Contas a Pagar e Contas a Receber

{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 141005
Nº KINTANA..: 888124
Data........: 09/08/2010
Responsável.: Thaise Amaral Martins
Descrição...: - Correção nos botões 'Analítico' e 'Sintético', que não estavam atualizando conforme
              a mudança de registros na pesquisa.
              - Correção no campo CODTIPRECDES, pois não estava sendo colocada mascara conforme
              se fazia a pesquisa nos registros.
-------------------------------------------------------------------------------------------------- }

{--------------------------------------------------------------------------------

N. Sol.............: 68981
N. Kintana.........: 523389
Data...............: 15/01/2010
Responsável........: Ricardo Alves
Descrição..........: Adicionada visualização por ativo ou inativo dos tipos de desembolso.
--------------------------------------------------------------------------------

N. Sol.............: 123801, 123803
N. Kintana.........: 622472, 622269
Data...............: 14/09/2009
Responsável........: Ricardo Alves
Descrição..........: Adicionado campo FLGFINANCHABITACIONAL na tabela TIPORECEBDESEMB.
--------------------------------------------------------------------------------}

{
   Autor     : Rodolpho da Silva
   Pendência : 19624
   Data      : 18/07/2005
   Descrição : Incluído mais um parâmetro no método CtrlTiporecebdesemb.ListparamCap,
               param: sRecPag


   André Tavares 01/09/2003 - resoluçaõ da pendência 14842
   Andre Tavares - pendência 16974 - 28/06/2004 - Torna invisível o box
   de obrigatoriedade do compromisso orçamentário se o módulo for CAR

}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls,
  Buttons, ComCtrls, ToolWin, ExtCtrls, DBTables, Wwquery, uCMTypes,
  Mask, wwdblook, wwdbedit, TB97, Tb97Tlbr, TB97Ctls, FTelaAut, MontaSelect,
  IvDictio, IvMulti, IvEMulti, CMProcuraMask, CMTree, CMDBLookupCombo,
  CmEventosCadastro, ImgList, FCadastroMT, DBClient, uCMClientDataSet,
  uCtrlTiporecebdesemb, Grids, Wwdbigrd, Wwdbgrid, uCtrlTipordcorresp,
  uCtrlHistoContab, uCtrlTerceirosCapCar, uCtrlSubConta, uCMTreeViewMT,
  CMProcura, Wwdbspin, TREdit, uCtrlTipoRecDesembxAlterador , uCmDbObject,
  Provider, uCmSqlParams, DBGrids;

type
  TfrmCadTipoDesembMT = class(TFrmCadastroMT)
    Panel1: TPanel;
    LbLTipoDesemb: TLabel;
    pnlEdicao: TPanel;
    SpbImportar: TToolbarButton97;
    pgc1: TPageControl;
    TbsGeral: TTabSheet;
    TbContabilizacao: TTabSheet;
    qrpContaContabil: TGroupBox;
    Label1: TLabel;
    CContabilPass: TCMProcuraMaskContabil;
    CContabil: TCMProcuraMaskContabil;
    CMDBLookupCombo1: TCMDBLookupCombo;
    ChkObrigaOrc: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    CkbEfet: TDBCheckBox;
    LblTipoAvalia: TLabel;
    CmbTipoAvalia: TCMDBLookupCombo;
    Label2: TLabel;
    dbedCod: TwwDBEdit;
    Label3: TLabel;
    dbedDescricao: TDBEdit;
    pnAnaSint: TPanel;
    sbtnAnalitico: TSpeedButton;
    sbtnSintetico: TSpeedButton;
    CdsSubContaCre: TCMClientDataSet;
    CdsSubConta: TCMClientDataSet;
    CdsHistorico: TCMClientDataSet;
    CdsTipoAvalia: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    Bevel2: TBevel;
    Bevel3: TBevel;
    wwDBGrid1: TwwDBGrid;
    DsTipoRdCorresp: TwwDataSource;
    CdsTipoRdCorresp: TCMClientDataSet;
    treeDesemb: TCMTreeViewMT;
    CdsTodos: TCMClientDataSet;
    DsCdsTodos: TwwDataSource;
    MontaSubConta: TMontaSelect;
    GrpConta: TGroupBox;
    CMProcura1: TCMProcura;
    GrpContaPass: TGroupBox;
    CMProcura2: TCMProcura;
    MontaSubContaCredito: TMontaSelect;
    dbchkAtivo: TDBCheckBox;
    lbldias: TLabel;
    wwDBSpinEdit7: TwwDBSpinEdit;
    DBObrCotas: TDBCheckBox;
    dbchkFLGFINANCHABITACIONAL: TDBCheckBox;
    rgAtivoInativo: TRadioGroup;
    TbAlteradores: TTabSheet;
    MontaTipoAlteradores: TMontaSelect;
    cdsTipoCreDesembxAlterador: TCMClientDataSet;
    Label6: TLabel;
    wwDBGrid1IButton: TwwIButton;
    dsTipoCreDesembxAlterador: TDataSource;
    pnl1: TPanel;
    pnl2: TPanel;
    btn1: TBitBtn;
    wwdg1: TwwDBGrid;
    wwdg1IButton: TwwIButton;
    edtORDEM: TwwDBSpinEdit;
    edtPorcentagem: TDBRealEdit;
    Label5: TLabel;
    Label4: TLabel;
    grp_tpImposto: TGroupBox;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    grp1: TGroupBox;
    cmpAltCODALTERADOR: TCMProcura;
    Label7: TLabel;
    Label8: TLabel;
    dbedtPercentual: TDBEdit;

    procedure FormCreate(Sender: TObject);
    procedure dbedCodExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnAnaliticoClick(Sender: TObject);
    procedure sbtnSinteticoClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure SpbImportarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CdsTipoRdCorrespAfterInsert(DataSet: TDataSet);
    procedure CdsTipoRdCorrespBeforeDelete(DataSet: TDataSet);
    procedure treeDesembClick(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CdsTodosAfterScroll(DataSet: TDataSet);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure rgAtivoInativoClick(Sender: TObject);
    procedure treeDesembChange(Sender: TObject);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure AtualizaBtn;
    procedure VerificaAlteradores(sender: TObject);
    function  ShowMsgBlock( iTpMsg: Integer): Boolean;
    procedure btn1Click(Sender: TObject);
    procedure BuscaAlteradores;
    procedure TbAlteradoresEnter(Sender: TObject);
    procedure wwdg1RowChanged(Sender: TObject);
    procedure TbAlteradoresShow(Sender: TObject);
    procedure cmpAltCODALTERADORValidaDados(Sender: TObject);
    procedure cmpAltCODALTERADORApertouBotao(Sender: TObject);

  private
    { Private declarations }
    sMascPict: string;
    iSoma, ind: Integer;
    lNivel: array[0..20] of Integer;
    bMontandoArvore: Boolean;
    CtrlTiporecebdesemb: TCtrlTiporecebdesemb;
    CtrlTipordcorresp: TCtrlTipordcorresp;
    CtrlHistoContab: TCtrlHistoContab;
    CtrlTerceirosCapCar: TCtrlTerceirosCapCar;
    CtrlSubConta: TCtrlSubConta;

    CtrlTipoRecDesembxAlterador: TCtrlTipoRecDesembxAlterador;

    pRecPag: string;

// inicio - Andre Tavares - pendência 14828 - 01/09/2003
    bObrigaTrdxCcxConta, bObrigaTrdxImposto: Boolean;
// fim - Andre Tavares - pendência 14828 - 01/09/2003

    // SOL 68981 KTN 523389 Ricardo A.
    procedure LocalizaCds( bUsaCodTipDesemb: Boolean );
    // FIM SOL 68981 KTN 523389 Ricardo A.

    // Ricardo A. SOL 132631 KTN 765974
    procedure LocalizaCdsTodos( sRecPag, sCodRecPag, sAtivoInativo: string; iIdPessoa: Integer );
    // FIM Ricardo A. SOL 132631 KTN 765974

  public
    { Public declarations }
     varAlteradoresOk, varSemaforoAlteradores, varDelAlteradores, ObrigaTrdxCCxConta, ObrigaTrdxImposto: Boolean;
    varTpImposto, CodTipRecDes: string;
    vStrAltToDel : TStringList;
    constructor Create(AOwner: TComponent; lRecPag: string = ''); reintroduce;
    function VerificaMascara(sMascara: string; var sMascPict: string;
      var lNivel: array of Integer;
      var iSoma: Integer; var ind: Integer): Boolean;
    function CalcGrau(sNoAnterior: string; lNivel: array of Integer;
      ind: Integer; var sPai: string): Integer;
  end;

var
  frmCadTipoDesembMT: TfrmCadTipoDesembMT;

implementation

uses USistema, UMensErro, UAutorizacao, DBaseDados, uCtrlParamIntegra, uString,
  FImpTipoDesembMT, uDataBase, FTrdxCCxContaMT, fCadRecDesXAgregMT;

{$R *.DFM}

procedure TfrmCadTipoDesembMT.FormCreate(Sender: TObject);
var
  smascara: string;
begin
  inherited;
  CtrlHistoContab := TCtrlHistoContab.create;
  CtrlHistoContab.Initialize(DtmBaseDados.dbBaseDados, false, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  CdsHistorico.data := CtrlHistoContab.ListHistoContab(Sistema.IdEmpresa, tohDescricao, '');

  CtrlTiporecebdesemb := TCtrlTiporecebdesemb.create;
  CtrlTiporecebdesemb.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  CtrlTiporecebdesemb.cds := cds;

  CtrlTipordcorresp := TCtrlTipordcorresp.create;
  CtrlTipordcorresp.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  CtrlTipordcorresp.cds := cdsTipordcorresp;
  CtrlTerceirosCapCar := TCtrlTerceirosCapCar.create;
  CtrlTerceirosCapCar.Initialize(DtmBaseDados.dbBaseDados, false, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);

  CtrlSubConta := TCtrlSubConta.create;
  CtrlSubConta.Initialize(DtmBaseDados.dbBaseDados, false, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  if pRecPag = 'R' then
  begin
    Caption := 'Cadastro de Tipo de Recebimento';
    LblTipoDesemb.Caption := 'Tipo de Recebimento';
    // Alex 22515 05/06/2006 CContabil2.Caption := ' Conta Contábil ';
    CContabil.Caption := ' Conta Contábil a Crédito';
    GrpConta.Caption := ' Sub-Conta a Crédito ';
    // Alex 22515 05/06/2006 CContabil1.Caption := ' Conta Débito ';
    CContabilPass.Caption := ' Conta Contábil a Débito ';
    // Alex 22515 05/06/2006 GroupBox2.Caption := ' Sub-Conta Débito ';
    GrpContaPass.Caption := ' Sub-Conta a Débito ';
    CmbTipoAvalia.Visible := False;
    LblTipoAvalia.Visible := False;
    CkbEfet.Caption := 'Corresponde a Um Tipo de Recebimento Operacional';
    //Catia 22591 18/08/2006
    DBObrCotas.Caption := 'Obriga Quantidade de Cotas no Recebimento';
    //Cássio Rovaroto - SIG nº 23656.57631 - Início
    //dbChkDesembServico.Visible := False; // Cássio Rovaroto - SIG nº 115585
    Bevel2.Top := 222;
    LblTipoAvalia.Top := 226;
    CmbTipoAvalia.Top := 244;
    Bevel3.Top := 271;
    wwDBGrid1.Top := 279;
    //Cássio Rovaroto - SIG nº 23656.57631 - Fim
    rgAtivoInativo.Caption := 'Visualização do tipo de Recebimento'; //WO35649 Leandro
  end
  else
  begin
    Caption := 'Cadastro de Tipo de Desembolso';
    LblTipoDesemb.Caption := 'Tipo de Desembolso';
    // Alex 22515 05/06/2006 CContabil2.Caption := ' Conta Contábil ';
    CContabil.Caption := ' Conta Contábil a Débito';
    GrpConta.Caption := ' Sub-Conta a Débito ';
    // Alex 22515 05/06/2006 CContabil1.Caption := ' Conta a Crédito ';
    CContabilPass.Caption := ' Conta Contábil a Crédito ';
    GrpContaPass.Caption := ' Sub-Conta a Crédito ';
    CdsTipoAvalia.data := CtrlTerceirosCapCar.ListTipoAvaliacao;
  end;

  try
    ObrigaTrdxCCxConta := False;
    ObrigaTrdxImposto := False;
    CodTipRecDes := '';
//  início - Andre Tavares - pendência 16974 - 28/06/2004
    ChkObrigaOrc.visible := sistema.IdModulo <> 4;
//  fim - Andre Tavares - pendência 16974 - 28/06/2004
    ChkObrigaOrc.Enabled := ParamIntegra.IntegraOrcamento;
    CContabil.Plano := ParamIntegra.Plano;
    CContabil.Mascara := ParamIntegra.MascaraPlano;
    CContabil.Mensagens.Analitica := CContabil.Caption + CContabil.Mensagens.Analitica;
    CContabil.Mensagens.Sintetica := CContabil.Caption + CContabil.Mensagens.Sintetica;
    CContabil.Mensagens.NaoExiste := CContabil.Caption + CContabil.Mensagens.NaoExiste;
    CContabil.Mensagens.EmBranco := CContabil.Caption + CContabil.Mensagens.EmBranco;

    CContabilPass.Plano := ParamIntegra.Plano;
    CContabilPass.Mascara := ParamIntegra.MascaraPlano;
    CContabilPass.Mensagens.Analitica := CContabilPass.Caption + CContabilPass.Mensagens.Analitica;
    CContabilPass.Mensagens.Sintetica := CContabilPass.Caption + CContabilPass.Mensagens.Sintetica;
    CContabilPass.Mensagens.NaoExiste := CContabilPass.Caption + CContabilPass.Mensagens.NaoExiste;
    CContabilPass.Mensagens.EmBranco := CContabilPass.Caption + CContabilPass.Mensagens.EmBranco;

    qrpContaContabil.Enabled := ParamIntegra.IntegraContab;

    sMascPict := '';

    if pRecPag = 'R' then
      smascara := ParamIntegra.MascaraReceb
    else
      smascara := ParamIntegra.MascaraDesemb;
    if not VerificaMascara(smascara, sMascPict, lNivel, iSoma, ind) then
    begin
      MessageBeep(0);
      ShowMessage('Máscara Inválida');
      Close;
      Exit;
    end;

    // SOL 68981 KTN 523389 Ricardo A.
    CdsTodos.Data := CtrlTiporecebdesemb.ListTiporecebdesemb(
        pRecPag,
        Sistema.idEmpresa,
        '',
        '',
        '',
        'S'
        );
    // FIM SOL 68981 KTN 523389 Ricardo A.

    if pRecPag = 'R' then
      treeDesemb.mascara := ParamIntegra.MascaraReceb
    else
      treeDesemb.mascara := ParamIntegra.MascaraDesemb;
    bMontandoArvore := True;

    treeDesemb.MontaArvore;
    bMontandoArvore := False;

    if pRecPag = 'R' then
    begin
      Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraReceb + ';0; ';
      MontaSelect.Mascaras.Add(ParamIntegra.MascaraReceb + ';0; ');
    end
    else
    begin
      Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraDesemb + ';0; ';
      MontaSelect.Mascaras.Add(ParamIntegra.MascaraDesemb + ';0; ');
    end;
    MontaSelect.Filtro.Add('TIPORECEBDESEMB.RECPAG = ''' + pRecPag + '''');
    MontaSelect.Filtro.Add('TIPORECEBDESEMB.IDPESSOA = '+ IntToStr(Sistema.idEmpresa));
    MontaSubConta.Filtro.Add('SUBCONTA.IDPESSOA = '+ IntToStr(Sistema.idEmpresa));
    MontaSubContaCredito.Filtro.Add('SUBCONTA.IDPESSOA = '+ IntToStr(Sistema.idEmpresa));


    //  Rodolpho da Silva - P: 19624 - 18/07/2005
    CdsAux.data := CtrlTiporecebdesemb.ListparamCap(Sistema.IdEmpresa,ParamIntegra.RecPag);

    ObrigaTrdxCCxConta := (CdsAux.FieldByName('FLGTRDXCCXCONTA').AsString = 'S');
    ObrigaTrdxImposto := (CdsAux.FieldByName('FLGTRDXIMPOSTOS').AsString = 'S');
  except
    raise;
  end;

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30052;
    bbtnAjuda.HelpContext := 30052;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------


end;

procedure TfrmCadTipoDesembMT.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := not Cds.IsEmpty;
  if ParamIntegra.IntegraContab then
  begin
    CdsSubConta.data := CtrlSubConta.ListSubconta(Sistema.Idempresa, 0);
    CdsSubContaCre.data := CtrlSubConta.ListSubconta(Sistema.Idempresa, 0);
  end;
  // Início SOL: 136242 Kintana: 813941 - JRM6
  // - Configura o PageControl para entrar na primeira aba.
  //   Dessa forma pode estar posicinado em qualquer aba quando o form for salvo.
  //
  pgc1.activePageIndex := 0;
  // - Exibe ou esconde a aba de alteradores (Pelo contas a Pagar exibe, senão esconde)
  TbAlteradores.TabVisible := (pRecPag = 'P');
  // Desabilita os controles na aba de alteradores.
  // Isso é feito, desabilitando-se o container PNL1 que é client da terceira aba
  pnl1.enabled := False;
  pnl2.Enabled := False;
  // Término SOL: 136242 Kintana: 813941 - JRM6
end;

procedure TfrmCadTipoDesembMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedCod.Enabled := True;
  if dbedCod.CanFocus then
    dbedCod.SetFocus;
  pnAnaSint.Enabled := True;
  cds.fieldbyname('RecPag').AsString := pRecPag;
  cds.fieldbyname('idPessoa').AsInteger := Sistema.idEmpresa;
  cds.fieldbyname('FLGINDICARECDES').Asstring := 'S';
  cds.fieldbyname('ATIVO').Asstring := 'S';
  cds.fieldbyname('NUMDIASVENCTO').AsInteger := 0;
  cds.fieldbyname('FLGOBRIGARESERVA').Asstring := 'N';// VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
  //Cds.FieldByName('FLGMAODEOBRA').AsString := 'N'; //Cássio Rovaroto - SIG Nº 23656.57631 //Cássio Rovaroto - SIG nº 115585
end;

function TfrmCadTipoDesembMT.VerificaMascara(sMascara: string; var sMascPict: string;
  var lNivel: array of Integer;
  var iSoma: Integer; var ind: Integer): Boolean;
var
  i: Integer;
begin
  Result := true;
  lNivel[0] := 1;
  iSoma := 0;
  sMascPict := copy(sMascara, 1, 1);
  for i := 1 to Length(sMascara) do
  begin
    if i > 1 then
      sMascPict := sMascPict + copy(sMascara, i, 1);
    if copy(sMascara, i, 1) = '.' then
    begin
      ind := ind + 1;
      lnivel[ind] := i - ind - iSoma;
      iSoma := iSoma + lNivel[ind];
    end;
  end;
  if (ind = 0) and (length(sMascara) > 0) then
  begin
    lnivel[1] := length(sMascara);
    ind := 1;
  end;
  if ind = 0 then
    Result := false;
  lNivel[ind + 1] := Length(sMascara) - ind - iSoma;
end;

function TfrmCadTipoDesembMT.CalcGrau(sNoAnterior: string; lNivel: array of Integer;
  ind: Integer; var sPai: string): Integer;
var
  i: Integer;
  iAux: Integer;
  sAux: string;
  lAux: Boolean;
begin
  iAux := 0;
  Result := 0;
  sAux := '';
  lAux := false;
  for i := 1 to ind + 1 do
  begin
    inc(Result);
    iAux := iAux + lNivel[i];
    if length(sNoAnterior) = iAux then
    begin
      lAux := True;
      sPai := Copy(sNoAnterior, 1, iAux - lNivel[i]);
      break;
    end;
  end;
  if not lAux then
    Result := 0;
end;

procedure TfrmCadTipoDesembMT.dbedCodExit(Sender: TObject);
var
  iGrau: Integer;
  lSair: Boolean;
  lEnabled: Boolean;
  sPai: string;
begin
  if ActiveControl.tag <> 999999 then
    if CmeCadastro.Operacao in [OpInserir, OpAlterar] then
    try
      inherited;
      sPai := '';
      lEnabled := True;
      lSair := False;
      iGrau := 0;
      if Trim((dbedCod.Text)) <> '' then
      begin
        iGrau := CalcGrau(Trim(dbedCod.Text), lNivel, ind, sPai);
        if iGrau = 0 then
        begin
          MessageBeep(0);
          ShowMessage('Máscara Inválida');
          lSair := true;
        end;
      end;
      if not lSair then
      begin
        // Verifica se o tipo de Desemb já está cadastrado
        CdsAux.data := CtrlTiporecebdesemb.ListTiporecebdesemb(pRecPag, Sistema.idEmpresa, '', '', TRIM(dbEdCod.Text));
        if not CdsAux.IsEmpty then
        begin
          MsgDlg('Tipo Desembolso já Cadastrado', 'Aviso', mtError, [mbOk], 0);
          lSair := true;
        end;
      end;
      if (not lSair) and (iGrau > 1) then
      begin
        // Verifica se conta pai é sintética
        CdsAux.data := CtrlTiporecebdesemb.ListTiporecebdesemb(pRecPag, Sistema.idEmpresa, '', '', trim(sPai));
        if CdsAux.IsEmpty then
        begin // não tem pai
          MsgDlg('Não tem Pai', 'Aviso', mtError, [mbOk], 0);
          lSair := true;
        end
        else
        begin
          if CdsAux.FieldByName('ANASINT').AsString = 'A' then
          begin // pai é analítico
            MsgDlg('Pai é analítico', 'Aviso', mtError, [mbOk], 0);
            lSair := true;
          end;
        end;
      end;
      if lSair then
      begin
        dbEdCod.Text := '';
        dbEdCod.EditText := '';
        cds.FieldValues['CODTIPRECDES'] := '';
        if dbedCod.CanFocus then
          dbedCod.SetFocus;
        exit;
      end;
      if ((iGrau = 1) and (ind + 1 > 1)) then
      begin
        sbtnSintetico.Down := True;
        cds.FieldByName('ANASINT').AsString := 'S';
        lEnabled := false;
      end;
      if iGrau = ind + 1 then
      begin
        sbtnAnalitico.Down := True;
        cds.FieldByName('ANASINT').AsString := 'A';
        lEnabled := false;
      end;
      pnAnaSint.Enabled := lEnabled;
    except
      raise;
    end;
end;

procedure TfrmCadTipoDesembMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  treeDesemb.Enabled := False;
  dbedCod.Enabled := False;
  pnAnaSint.Enabled := False;
  if dbedDescricao.CanFocus then
    dbedDescricao.SetFocus;
end;

procedure TfrmCadTipoDesembMT.sbtnAnaliticoClick(Sender: TObject);
begin
  inherited;
  qrpContaContabil.Enabled := ParamIntegra.IntegraContab;
end;

procedure TfrmCadTipoDesembMT.sbtnSinteticoClick(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('PLACONTA').Clear;
  Cds.FieldByName('PLACONTACREDITO').Clear;
  qrpContaContabil.Enabled := False;
end;

procedure TfrmCadTipoDesembMT.sbtnApagarClick(Sender: TObject);
begin
  if treeDesemb.Selected.HasChildren then { Força a deleção das pastas analíticas uma a uma }
  begin
    MsgDlg('Pasta(s) Analítica(s) terão que ser apagada(s) primeiro!', 'Erro', mtError, [mbOK], 0);
    Exit;
  end;
  inherited;

  // SOL 68981 KTN 523389 Ricardo A.
  //  LocalizaCds( False );
  // FIM SOL 68981 KTN 523389 Ricardo A.

  if pRecPag = 'R' then
    Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraReceb + ';0; '
  else
    Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraDesemb + ';0; ';
  PnlFundo.Enabled := not Cds.IsEmpty;
end;

procedure TfrmCadTipoDesembMT.bbtnConfirmarClick(Sender: TObject);
var
  i: Integer;
begin
  if not sbtnInserir.Down then
  begin
    // Início SOL: 136242 Kintana: 813941 - JRM6
    // Verifica as regras de preenchimento
    if cdsTipoCreDesembxAlterador.State in [dsEdit,dsInsert] then
    begin
      varAlteradoresOk := False;
      VerificaAlteradores( Self );
      if not varAlteradoresOk then
        abort;
    end
    else
      VarAlteradoresOk := True;

  end;

  inherited;
  if not sbtnInserir.Down then
  begin
    treeDesemb.Enabled := True;
    PnlFundo.Enabled := not Cds.IsEmpty;
    // Início SOL: 136242 Kintana: 813941 - JRM6
    // Efetiva as alterações
    
    if  varAlteradoresOk then
    begin
      if cdsTipoCreDesembxAlterador.State in [dsEdit,dsInsert] then
      begin
        if CtrlTipoRecDesembxAlterador.GravarTipoRecDesembxAlterador( Sistema.IdEmpresa,
                                                                       pRecPag,
                                                                       cds.fieldbyname('CODTIPRECDES').AsString,
                                                                       strtoInt(cmpaltCODALTERADOR.MontaSelect.ValoresChave[0]),
                                                                       edtPorcentagem.Value,
                                                                       StrToInt( FloatToStr( edtORDEM.value ) ),
                                                                       Date(),
                                                                       Sistema.NomeUsuario,
                                                                       varTpImposto ) then
        begin
          cdsTipoCreDesembxAlterador.Post;

          // Faz o "Refresh" do dbgrid
          BuscaAlteradores;
        end
        else
        begin
          ShowMsgBlock(1);
        end;
      end;
      // Desabilita os controles e sinaliza o semáforo
      pnl1.enabled  := False;
      varSemaforoAlteradores := False;
    end;
    // Procura validar se é exclusão de alteradores
    // Se for exclusão, processa a exclusão efetiva
    if varDelAlteradores then
    begin
      try
        for i := 0 to ( vStrAltToDel.count - 1 ) do
        begin
          CtrlTipoRecDesembxAlterador.DelTipoRecDesembxAlterador( StrToInt(vStrAltToDel[I]) );
        end;
      finally
        // Libera o array e faz o refresh do dbgrid;
        FreeAndNil( vStrAltToDel );
        varDelAlteradores := False;
        BuscaAlteradores;
        wwdg1.unselectall;
      end;
    end;
  end;
  // Término SOL: 136242 Kintana: 813941 - JRM6
end;

procedure TfrmCadTipoDesembMT.sbtnInserirClick(Sender: TObject);
begin
  PnlFundo.Enabled := False;
  treeDesemb.Enabled := False;
  // Início SOL: 136242 Kintana: 813941 - JRM6
  pnl2.Enabled := True;
  // Término SOL: 136242 Kintana: 813941 - JRM6
  inherited;
end;

procedure TfrmCadTipoDesembMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := False;
  // Início SOL: 136242 Kintana: 813941 - JRM6
  pnl1.enabled := true;
  pnl2.enabled := True;
  varSemaforoAlteradores:= True;
  if pgc1.ActivePage.Name = TbAlteradores.Name then
  begin
    TbAlteradoresEnter(Self);
  end;
  // Término SOL: 136242 Kintana: 813941 - JRM6
end;

procedure TfrmCadTipoDesembMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  treeDesemb.Enabled := True;
  PnlFundo.Enabled := not Cds.IsEmpty;
  Cds.First;
  AtualizaBtn;
  // Início SOL: 136242 Kintana: 813941 - JRM6
  pnl1.enabled := False;
  pnl2.Enabled := False;
  varSemaforoAlteradores := False;

  cdsTipoCreDesembxAlterador.EnableControls;

  // Desfaz a exclusão de alteradores vinculados
  if varDelAlteradores then
  begin
    FreeAndNil( vStrAltToDel );
    varDelAlteradores := False;
    BuscaAlteradores;
    wwdg1.unselectall;
  end;
  // Término SOL: 136242 Kintana: 813941 - JRM6
end;

procedure TfrmCadTipoDesembMT.SpbImportarClick(Sender: TObject);
begin
  inherited;
  SpbImportar.Down := False;

  // Início SOL: 136242 Kintana: 813941 - JRM6
  pnl1.enabled := False;
  pnl2.Enabled := False;
  // Término SOL: 136242 Kintana: 813941 - JRM6

  // SOL 68981 KTN 523389 Ricardo A.
  LocalizaCds( False );
  // FIM SOL 68981 KTN 523389 Ricardo A.

  if Cds.IsEmpty then
  begin
    AbrirFormModal(FrmImpTipoDesembMT, TFrmImpTipoDesembMT);

    // SOL 68981 KTN 523389 Ricardo A.
    LocalizaCds( False );
    // FIM SOL 68981 KTN 523389 Ricardo A.

    if not Cds.IsEmpty then
    begin
      bMontandoArvore := True;
      treeDesemb.MontaArvore;
      bMontandoArvore := False;
    end;
    PnlFundo.Enabled := not Cds.IsEmpty;
  end
  else
  if pRecPag = 'P' then
    Msgdlg('Já existem Tipos de Desembolso cadastrados, impossível importar', 'Aviso', mterror, [mbOk], 0)
  else
     Msgdlg('Já existem Tipos de Recebimento cadastrados, impossível importar', 'Aviso', mterror, [mbOk], 0)
end;

procedure TfrmCadTipoDesembMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if (MontaSelect.RetornouValor) then
  begin
    LocalizaCdsTodos( pRecPag, Trim(MontaSelect.ValoresChave[0]), '', Sistema.idEmpresa );
    // SOL 68981 KTN 523389 Ricardo A.
//    rgAtivoInativo.ItemIndex := 2;
//    CdsTodos.Data := CtrlTiporecebdesemb.ListTiporecebdesemb( pRecPag, Sistema.idEmpresa );
//    CdsTodos.Locate('CODTIPRECDES', Trim(MontaSelect.ValoresChave[0]), []);
////    LocalizaCds( True );
//    // FIM SOL 68981 KTN 523389 Ricardo A.
//
//    treeDesemb.Enabled := True;
//    treeDesembClick(Sender);
  end;

  AtualizaBtn;
end;

procedure TfrmCadTipoDesembMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  pnAnaSint.Enabled := bbtnConfirmar.Enabled;
  pnlEdicao.Enabled := True;
  qrpContaContabil.Enabled := (pnAnaSint.Enabled and ParamIntegra.IntegraContab);
end;

procedure TfrmCadTipoDesembMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  //  inherited;
  if Trim(dbedDescricao.Text) = '' then
  begin
    MsgDlg('Descrição do tipo de desembolso: Preenchimento obrigatório.', 'Aviso', mtError, [mbOk], 0);
    if dbedDescricao.CanFocus then
      dbedDescricao.SetFocus;
    Accept := False
  end
  else if (ParamIntegra.IntegraContab) and
    ((CContabil.Valida <> VcOk) or
    (CContabilPass.Valida <> VcOk)) then
    Accept := False
  else
  begin
    Accept := True;
  end;

  bObrigaTrdxCcxConta := False;
  bObrigaTrdxImposto := False;
  if CmeCadastro.Operacao in [opInserir, opAlterar] then
  begin
    if sbtnAnalitico.Down then
      cds.FieldByName('ANASINT').AsString := 'A'
    else
      cds.FieldByName('ANASINT').AsString := 'S';
    if ParamIntegra.IntegraContab then
      cds.FieldByName('Plano').AsInteger := ParamIntegra.Plano;

    bObrigaTrdxCcxConta := (cds.fieldbyname('PLACONTA').IsNull) and
      (cds.fieldbyname('ANASINT').ASsTring = 'A') and
      (ObrigaTrdxCCxConta) and
      (CmeCadastro.Operacao = OpInserir);

    bObrigaTrdxImposto := (cds.fieldbyname('ANASINT').ASsTring = 'A') and
      (cds.fieldbyname('FLGCALCULAIMPOSTO').ASsTring = 'S') and
      (ObrigaTrdxImposto) and
      (CmeCadastro.Operacao = OpInserir);

    if bObrigaTrdxCcxConta or bObrigaTrdxImposto then
      CodTipRecDes := cds.fieldbyname('CODTIPRECDES').AsString
    else
      CodTipRecDes := '';
  end;

  inherited;
end;

procedure TfrmCadTipoDesembMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTiporecebdesemb.GravarTipoRecebDesemb(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
  if Accept then
    if not Cdstodos.isempty then
      Cdstodos.delete;

end;

procedure TfrmCadTipoDesembMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
var
  sCod: string;
begin
  sCod := cds.FieldByName( 'CODTIPRECDES' ).Value;
  inherited;
  Accept := CtrlTiporecebdesemb.GravarTipoRecebDesemb(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
  if Accept then
  begin
//    CdsTodos.edit;
//    CdsTodos.fieldbyname('DESCRICAO').asstring := Cds.fieldbyname('DESCRICAO').asstring;
//    CdsTodos.fieldbyname('ANASINT').asstring := Cds.fieldbyname('ANASINT').asstring;
//    CdsTodos.fieldbyname('FLGOBRQTDECOTAS').asstring := Cds.fieldbyname('FLGOBRQTDECOTAS').asstring;
//
//    treeDesemb.DataSource := nil;
//    CdsTodos.post;
//    treeDesemb.DataSource := DsCdsTodos;
    // Ricardo A. SOL 132631 KTN 765974
    LocalizaCdsTodos( pRecPag, sCod, '', Sistema.idEmpresa )
    // FIM Ricardo A. SOL 132631 KTN 765974
  end;
end;

procedure TfrmCadTipoDesembMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
var
  vcod, Vdsc, vana, vflg: string;
begin
  vcod := Cds.fieldbyname('CODTIPRECDES').asstring;
  Vdsc := Cds.fieldbyname('DESCRICAO').asstring;
  vana := Cds.fieldbyname('ANASINT').asstring;
  vflg := Cds.fieldbyname('FLGOBRQTDECOTAS').asstring;
  inherited;
  Accept := CtrlTiporecebdesemb.GravarTipoRecebDesemb(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
  if Accept then
  begin
//    CdsTodos.Append;
//    CdsTodos.fieldbyname('CODTIPRECDES').asstring := vcod;
//    CdsTodos.fieldbyname('DESCRICAO').asstring := vdsc;
//    CdsTodos.fieldbyname('ANASINT').asstring := vana;
//    CdsTodos.fieldbyname('FLGOBRQTDECOTAS').asstring := vflg;
//    CdsTodos.post;

    // Ricardo A. SOL 132631 KTN 765974
    LocalizaCdsTodos( pRecPag, vCod, '', Sistema.idEmpresa )
    // FIM Ricardo A. SOL 132631 KTN 765974
  end;
end;

procedure TfrmCadTipoDesembMT.CdsTipoRdCorrespAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  CdsTipoRdCorresp.fieldbyname('CODTIPRECDES').AsString := Cds.fieldbyname('CODTIPRECDES').AsString;
  CdsTipoRdCorresp.fieldbyname('RECPAG').AsString := pRecPag;
  CdsTipoRdCorresp.fieldbyname('IDPESSOA').AsFloat := Sistema.IdEmpresa;
end;

procedure TfrmCadTipoDesembMT.CdsTipoRdCorrespBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  if (not Cds.IsEmpty) and
    (CdsTipoRdCorresp.fieldbyname('CODCORRESP').AsString = cds.fieldbyname('CODCORRESP').AsString) then
    cds.fieldbyname('CODCORRESP').Clear;
end;

procedure TfrmCadTipoDesembMT.treeDesembClick(Sender: TObject);
begin
  inherited;

  // SOL 68981 KTN 523389 Ricardo A.
  LocalizaCds( True );
  // FIM SOL 68981 KTN 523389 Ricardo A.

  if pRecPag = 'R' then
    Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraReceb + ';0; '
  else
    Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraDesemb + ';0; ';

  if not Cds.IsEmpty then
  begin
      AtualizaBtn;
      CdsTipoRdCorresp.data := CtrlTipordcorresp.ListTipordcorresp(0,
      Cds.fieldbyname('CODTIPRECDES').AsString,
      Cds.fieldbyname('RECPAG').AsString,
      Cds.fieldbyname('IDPESSOA').AsFloat);
    if (CdsTipoRdCorresp.IsEmpty) and (not Cds.fieldbyname('CODCORRESP').IsNull) then
    begin
      CdsTipoRdCorresp.Append;
      CdsTipoRdCorresp.fieldbyname('CODCORRESP').AsString := Cds.fieldbyname('CODCORRESP').AsString;
      CdsTipoRdCorresp.Post;
      CtrlTipordcorresp.GravarTipordcorresp;
    end;
  end;
  // Início SOL: 136242 Kintana: 813941 - JRM6
  if pRecPag = 'P' then
  begin
    BuscaAlteradores;
  end;
  // Término SOL: 136242 Kintana: 813941 - JRM6

end;

procedure TfrmCadTipoDesembMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if CtrlTiporecebdesemb.MessageInfo <> '' then
    MsgDlg(CtrlTiporecebdesemb.MessageInfo, 'Erro', MtError, [MbOk], 0);
end;

procedure TfrmCadTipoDesembMT.CdsTodosAfterScroll(DataSet: TDataSet);
begin
  inherited;

  // SOL 68981 KTN 523389 Ricardo A.
  LocalizaCds( True );
  // FIM SOL 68981 KTN 523389 Ricardo A.

  if pRecPag = 'R' then
    Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraReceb + ';0; '
  else
    Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraDesemb + ';0; ';
end;

constructor TfrmCadTipoDesembMT.Create(AOwner: TComponent;
  lRecPag: string);
begin
  pRecPag := ParamIntegra.RecPag;
  if trim(lRecPag) <> '' then
    pRecPag := lRecPag;
  inherited Create(AOwner);
end;

procedure TfrmCadTipoDesembMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
// inicio - Andre Tavares - pendência 14828 - 01/09/2003
  try
    if CodTipRecDes <> '' then
    begin
      if ObrigaTrdxCCxConta and bObrigaTrdxCcxConta then
        AbrirFormModal(FrmTrdxCCxContaMT, TFrmTrdxCCxContaMT);
      if ObrigaTrdxImposto and bObrigaTrdxImposto then
        AbrirFormModal(FrmCadRecDesXAgregMT, TfrmCadRecDesXAgregMT);
    end;
    CodTipRecDes := '';
  except
    CodTipRecDes := '';
    raise;
  end;
// fim - Andre Tavares

end;

procedure TfrmCadTipoDesembMT.rgAtivoInativoClick(Sender: TObject);
var
  sTipo: string;
begin
  // SOL 68981 KTN 523389 Ricardo A.
  case rgAtivoInativo.ItemIndex of
    0: sTipo := 'S';
    1: sTipo := 'N';
    2: sTipo := '';
  end;

//  cdsTodos.DisableControls;
//  treeDesemb.Items.Clear;
//  CdsTodos.Data := CtrlTiporecebdesemb.ListTiporecebdesemb( pRecPag, Sistema.idEmpresa, '', '', '', sTipo );
//  cdsTodos.First;
//  cdsTodos.EnableControls;
//  LocalizaCds( True );
//  treeDesemb.MontaArvore;
  // FIM SOL 68981 KTN 523389 Ricardo A.

  // Ricardo A. SOL 132631 KTN 765974
  LocalizaCdsTodos( '', '', '', -1 );
  LocalizaCds( True );
  // FIM Ricardo A. SOL 132631 KTN 765974
end;

procedure TfrmCadTipoDesembMT.LocalizaCds( bUsaCodTipDesemb: Boolean );
var
  sTipo: string;
begin
  // SOL 68981 KTN 523389 Ricardo A.
  case rgAtivoInativo.ItemIndex of
    0: sTipo := 'S';
    1: sTipo := 'N';
    2: sTipo := '';
  end;
  cds.DisableControls;
  if bUsaCodTipDesemb then
    Cds.data := CtrlTiporecebdesemb.ListTiporecebdesemb( pRecPag, Sistema.idEmpresa, '', '',
      CdsTodos.Fieldbyname( 'CODTIPRECDES' ).AsString, sTipo )
  else
    Cds.data := CtrlTiporecebdesemb.ListTiporecebdesemb( pRecPag, Sistema.idEmpresa, '', '', '', sTipo );
  cds.EnableControls;
  // FIM SOL 68981 KTN 523389 Ricardo A.
end;

procedure TfrmCadTipoDesembMT.treeDesembChange(Sender: TObject);
begin
  inherited;
  cdsTodos.DisableControls;
  CdsTodos.Locate( 'CODTIPRECDES', treeDesemb.ValorChave, [] );
  LocalizaCds( True );
  // Início SOL: 136242 Kintana: 813941 - JRM6
  if pRecPag = 'P' then
  begin
    BuscaAlteradores;
  end;
  cdsTodos.EnableControls;
  // Término SOL: 136242 Kintana: 813941 - JRM6
end;

procedure TfrmCadTipoDesembMT.LocalizaCdsTodos( sRecPag, sCodRecPag, sAtivoInativo: string; iIdPessoa: Integer  );
begin
  // Ricardo A. SOL 132631 KTN 765974
  cdsTodos.DisableControls;
  treeDesemb.Items.Clear;
  CdsTodos.Data := CtrlTiporecebdesemb.ListTiporecebdesemb( sRecPag, iIdPessoa, '', '', '', sAtivoInativo );
  cdsTodos.EnableControls;
  treeDesemb.MontaArvore;

  if ( iIdPessoa > -1 ) or ( sCodRecPag <> '' ) or ( sRecPag <> '' ) then
    cdsTodos.Locate( 'IDPESSOA;RECPAG;CODTIPRECDES',
      VarArrayOf( [ iIdPessoa, sRecPag, sCodRecPag ]), [] )
  else
    cdsTodos.First;
  treeDesemb.Invalidate;
  // FIM Ricardo A. SOL 132631 KTN 765974
end;

procedure TfrmCadTipoDesembMT.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;

  AtualizaBtn;

  if pRecPag = 'R' then
    Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraReceb + ';0; '
  else
    Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraDesemb + ';0; ';
end;

procedure TfrmCadTipoDesembMT.AtualizaBtn;
begin
  if (Cds.FieldByName('ANASINT').AsString = 'A') then
    sbtnAnalitico.Down := True
  else
    sbtnSintetico.Down := True;
end;

procedure TfrmCadTipoDesembMT.VerificaAlteradores(sender: TObject);
var
  vTelaOk: Integer;
begin
  // Início SOL: 136242 Kintana: 813941 - JRM6
  // Propósito: Verificar que todos os campos da aba 'Alteradores' estejam prenchidos
  vTelaOk := 0;

  if (cmpAltCODALTERADOR.Text = '' ) then
    vTelaOk := 10
  else
    if (not rb1.Checked) then
      if (not rb2.Checked) then
        if (not rb3.Checked) then vTelaOk := 20;

  If vTelaOk = 0 then if edtORDEM.Text = '' then vTelaOk := 30;

  If vTelaOk = 0 then if edtPorcentagem.Value = 0 then vTelaOk := 40;

  // Criticou o preenchimento de todos os campos
  // Caso algum deles não esteja preenchido, vai exibir a msg e posicionar o
  // foco naquele campo;
  If vTelaOk <> 0 then
  begin
    varAlteradoresOk := False;
    //MsgDlg('Tipo Desembolso já Cadastrado', 'Aviso', mtError, [mbOk], 0);
    MsgDlg('Todos os campos do grupo Alteradores devem ser preenchidos', 'Associação', mtConfirmation, [mbYes], 0 );

    case vTelaOk of
      10: cmpAltCODALTERADOR.setFocus;
      20: rb1.setFocus;
      30: edtORDEM.setFocus;
      40: edtPorcentagem.setFocus;
    end;
  end
  else
  begin
    varAlteradoresOk := True;
    varTpImposto := '';
    {}
    if rb1.checked then
      varTpImposto := 'IR'
    else
      if rb2.checked then
        varTpImposto := 'CS'
      else
        varTpImposto := 'IN';

  end;
  // Término SOL: 136242 Kintana: 813941 - JRM6
end;

function TfrmCadTipoDesembMT.ShowMsgBlock(iTpMsg: Integer): Boolean;
begin
  // Inicio SOL: 136242 Kintana: 813941 - JRM6
  Result:=False;
  case iTpMsg of
//  0: Result:=(MessageBox(0, 'Confirma a exclusão dos alteradores selecionados?', 'Alteradores', MB_ICONQUESTION or MB_OKCANCEL)=mrOk);
    0: Result:=(MsgDlg('Confirma a exclusão dos alteradores selecionados?', 'Exclusão', mtConfirmation	, [mbYes,mbNo],0)=mrYes);
    1: begin
//       MessageBox(0, 'Esse alterador já encontra-se associado ao desembolso selecionado!', 'Alteradores', MB_ICONSTOP or MB_OK);
         MsgDlg('Esse alterador já encontra-se associado ao desembolso selecionado!', 'Atenção', mtConfirmation	, [mbYes],0);
         Result:= False;
       end;
  end;
  // Término SOL: 136242 Kintana: 813941 - JRM6
end;

procedure TfrmCadTipoDesembMT.btn1Click(Sender: TObject);
var i:Integer;

begin
  inherited;
  // Inicio SOL: 136242 Kintana: 813941 - JRM6
  // Propósito : Permitir a exclusão dos alteradores vinculados ao tipo de desembolso.

  // Pergunta se deve proceder com a exclusão
  if ShowMsgBlock(0) then
  begin
    // Varre o dataset (do fim para o começo) para armazenar os registros que estiverem marcados.
    wwdg1.DataSource.DataSet.Last;
    varDelAlteradores := False;
    while (not wwdg1.DataSource.DataSet.Bof ) do
    begin
      // Nesta passagem, vai apenas armazenar os ID´S a serem excluídos
      if wwdg1.IsSelected then
      begin
        // Passa a armazenar em vStrAltToDel os Id´s de associação a serem excluídos
        if vStrAltToDel = nil then
        begin
          vStrAltToDel := tstringlist.create;
        end;
        vStrAltToDel.append( cdsTipoCreDesembxAlterador.fieldbyname('IDASSOCIACAO').AsString);
        varDelAlteradores := True;
      end;
      // Registro anterior
      wwdg1.DataSource.DataSet.Prior;
    end;
    {Elimina os registros selecionados para exclusão do dataset}
    with wwdg1,wwdg1.datasource.dataset do
    begin
      for i:= 0 to SelectedList.Count-1 do begin
        GotoBookmark(SelectedList.items[i]);
        delete;
      end;
    end;
    {}
  end;
  // Término SOL: 136242 Kintana: 813941 - JRM6
end;

procedure TfrmCadTipoDesembMT.BuscaAlteradores;
begin
  // Início SOL: 136242 Kintana: 813941 - JRM6
  // Propósito : Filtrar os alteradores que possam estar associados ao tipo de
  //             desembolso corrente e exibi-los.
  // Verifica se deve inicializar o componente
  if CtrlTipoRecDesembxAlterador = nil then
  begin
      CtrlTipoRecDesembxAlterador := TCtrlTipoRecDesembxAlterador.create;
      CtrlTipoRecDesembxAlterador.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  end;
    cdsTipoCreDesembxAlterador.EnableControls;
  // Fecha e reabre o componente. Isso é feito para forçar um "Refresh"
  // e a consequente atualização dos dados exibidos no dbgrid.
  if (not (cdsTipoCreDesembxAlterador.state in [dsInsert,dsEdit])) then
  begin
    cdsTipoCreDesembxAlterador.EnableControls;    
    //wwdg1.enabled := True;
    cdsTipoCreDesembxAlterador.Close;
    cdsTipoCreDesembxAlterador.Data := CtrlTipoRecDesembxAlterador.ListTipoRecDesembxAlterador( 0,
                                                                                                Sistema.IdEmpresa,
                                                                                                pRecPag,
                                                                                                cds.fieldbyname('CODTIPRECDES').AsString, 0 );
    cdsTipoCreDesembxAlterador.Open;
    // Verifica se o dataset está vazio. Estando vazio, desabilita o botão de exclusão e limpa os campos da aba de alteradores
    if cdsTipoCreDesembxAlterador.isempty then
    begin
      btn1.enabled := false;
      // Vai limpar os campos da aba
      cmpaltCODALTERADOR.text := '';
      rb1.checked := False;
      rb2.checked := False;
      rb3.checked := False;
      edtORDEM.clear;
      edtPorcentagem.clear;
    end
    else
    begin
      btn1.enabled := true;
      // Atualiza o tipo de imposto
      wwdg1RowChanged(Self);
    end;
  end;
  // Seleciona a linha 0;
  wwdg1.SetActiveRow(0);

  // Término SOL: 136242 Kintana: 813941 - JRM6
end;

procedure TfrmCadTipoDesembMT.TbAlteradoresEnter(Sender: TObject);
begin
  // Início SOL: 136242 Kintana: 813941 - JRM6
  inherited;

  // Tenta recuperar alteradores que porventura ja estejam cadastrados para o tipo de desembolso corrente.
  BuscaAlteradores;

  // Antes de colocar o dataset em modo de edição, vamos verificar se o botão alterar está pressionado
  if sbtnAlterar.Down then
  begin
    //  Coloca o Datasource cdsTipoCreDesembAlterador em modo de edição ou de Insert,
    //  conforme a necessidade. Para tanto, só faz isso se ainda não tiver feito Semaforo = true
    if varSemaforoAlteradores then
    begin
      if cdsTipoCreDesembxAlterador.IsEmpty then
        cdsTipoCreDesembxAlterador.Append
      else
        cdsTipoCreDesembxAlterador.Edit;

      varSemaforoAlteradores := False;
    end;
    //
  end;
  // Término SOL: 136242 Kintana: 813941 - JRM6
end;

procedure TfrmCadTipoDesembMT.wwdg1RowChanged(Sender: TObject);
begin
  inherited;
  // Inicio SOL: 136242 Kintana: 813941 - JRM6
  if cdsTipoCreDesembxAlterador.FieldByName('TPIMPOSTO').asString =  'IR' then
     rb1.checked := True
  else
    if cdsTipoCreDesembxAlterador.FieldByName('TPIMPOSTO').asString =  'CS'  then
      rb2.checked := True
    else
      rb3.checked := True;
  // Término SOL: 136242 Kintana: 813941 - JRM6
end;

procedure TfrmCadTipoDesembMT.TbAlteradoresShow(Sender: TObject);
begin
  inherited;
  // Inicio SOL: 136242 Kintana: 813941 - JRM6
  BuscaAlteradores;
  // Término SOL: 136242 Kintana: 813941 - JRM6
end;

procedure TfrmCadTipoDesembMT.cmpAltCODALTERADORValidaDados(
  Sender: TObject);
begin
  inherited;
  // Início SOL: 136242 Kintana: 813941 - JRM6

  cdsTipoCreDesembxAlterador.DisableControls;

  rb1.checked := False;
  rb2.checked := False;
  rb3.checked := False;
  edtOrdem.clear;
  edtPorcentagem.clear;
  // Término SOL: 136242 Kintana: 813941 - JRM6
end;

procedure TfrmCadTipoDesembMT.cmpAltCODALTERADORApertouBotao(
  Sender: TObject);
begin
  inherited;
  cdsTipoCreDesembxAlterador.EnableControls;

end;

end.
