unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  TB97, Db, Wwdatsrc, DBTables, Wwquery, wwdblook, StdCtrls, Mask, wwdbedit,
  DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic,
  IvMulti, IvEMulti, CorreioCM, fcLabel, fcOutlookList, fcButton, fcImgBtn,
  fcShapeBtn, fcClearPanel, fcButtonGroup, fcOutlookBar, AppEvnts,
  CMApplicationEvents, StdActns, ActnList, ImgList, fcStatusBar,
  FEscolhaFundacao, MontaSelect, UConsPart;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuTransacoes: TMenuItem;
    mnuRubricasporFundacao: TMenuItem;
    mnuPreparo: TMenuItem;
    mnuFolhaNormal: TMenuItem;
    mnuFolhaPreviaEspecial: TMenuItem;
    mnuRubricasporPlano: TMenuItem;
    mnuFavorecido: TMenuItem;
    mnuRubricasSalariais: TMenuItem;
    Prvia1: TMenuItem;
    ImportaoArquivo1: TMenuItem;
    LayOutDescontos1: TMenuItem;
    qryParamGlobal: TwwQuery;
    qryParamGlobalUSACRESPON: TStringField;
    qryParamGlobalUSAABC: TStringField;
    qryParamGlobalCODCENTRORESPON: TStringField;
    qryParamGlobalUNIDNEGOC: TFloatField;
    DemenstrativodePagamento1: TMenuItem;
    Adiantamento1: TMenuItem;
    N6: TMenuItem;
    Prvia3: TMenuItem;
    AntecipaodeAbono2: TMenuItem;
    ContasBancrias1: TMenuItem;
    ArquivoTXT1: TMenuItem;
    Alimentados1: TMenuItem;
    mnuConsultaPrevia: TMenuItem;
    ExportaodeArquivo1: TMenuItem;
    Estorna1: TMenuItem;
    VerificaPessoa1: TMenuItem;
    Button1: TButton;
    mnuConsultaHistorico: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    mnuGeraArquivodeRemessa: TMenuItem;
    mnuVerificaContaBancaria: TMenuItem;
    mnuComparaArquivosdeBanco: TMenuItem;
    mnuFolhaExtra: TMenuItem;
    mnuPagamentosPendentes: TMenuItem;
    ContraChequeTrimestral1: TMenuItem;
    ConsPart1: TConsPart;
    MontaSelectPart: TMontaSelect;
    mnuVisaoGerencialFolha: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    RubricasIndividuais1: TMenuItem;
    RubricasIncidentesnaPensoAlimentciaporBeneficirio1: TMenuItem;
    mnuCadastroManualdeRubricas: TMenuItem;
    mnuCadastroManualdeBeneficios: TMenuItem;
    mnuAlteraFormadePagto: TMenuItem;
    mnuAlteraPagamentoBenefcio: TMenuItem;
    mnuAlteraPagamentoMensal: TMenuItem;
    N7: TMenuItem;
    BancoXPortadorForma1: TMenuItem;
    procedure mnuRubricasSalariaisClick(Sender: TObject);
    procedure mnuFolhaNormalClick(Sender: TObject);
    procedure mnuFolhaPreviaEspecialClick(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure mnuRubricasIndividuaisClick(Sender: TObject);
    procedure mnuRubricasporFundacaoClick(Sender: TObject);
    procedure mnuPreparoClick(Sender: TObject);
    procedure mnuRubricasporPlanoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuFavorecidoClick(Sender: TObject);
    procedure Prvia1Click(Sender: TObject);
    procedure RubricasIndividuais1Click(Sender: TObject);
    procedure BancoXPortadorForma1Click(Sender: TObject);
    procedure ImportaoArquivo1Click(Sender: TObject);
    procedure LayOutDescontos1Click(Sender: TObject);
    procedure DemenstrativodePagamento1Click(Sender: TObject);
    procedure Adiantamento1Click(Sender: TObject);
    procedure RubricasIncidentesnaPensoAlimentciaporBeneficirio1Click(
      Sender: TObject);
    procedure Estorna1Click(Sender: TObject);
    procedure ContasBancrias1Click(Sender: TObject);
    procedure FolhadeBenefcio2Click(Sender: TObject);
    procedure Alimentados1Click(Sender: TObject);
    procedure ExportaodeArquivo1Click(Sender: TObject);
    procedure Prva1Click(Sender: TObject);
    procedure mnuConsultaPreviaClick(Sender: TObject);
    procedure mnuGeraArquivodeRemessaClick(Sender: TObject);
    procedure mnuVerificaContaBancariaClick(Sender: TObject);
    procedure mnuComparaArquivosdeBancoClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure ExtraFolha1Click(Sender: TObject);
    procedure Restabelecimento1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure mnuConsultaHistoricoClick(Sender: TObject);
    procedure mnuCadastroManualdeBeneficiosClick(Sender: TObject);
    procedure mnuCadastroManualdeRubricasClick(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure ContraChequeTrimestral1Click(Sender: TObject);
    procedure mnuTransacoesClick(Sender: TObject);
    procedure PagamentodeBenefcio2Click(Sender: TObject);
    procedure PagamentodeMensal1Click(Sender: TObject);
    procedure MnuConsPart_PadraoClick(Sender: TObject);
    procedure mnuVisaoGerencialFolhaClick(Sender: TObject);

  private
    procedure Verifica_Situacao_Empresa;
    function EscolheFundacao : longint;
  public
    TipoFolha: Char; // Usada apenas para passar parâmetro.
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses FTelaAut, FConsHistBenef, FParamAPrev,
     FCadRubricaIndiv, UAdmPrev, FAssocProvPatro, FPreparo, FCtrlInterface,
     DBaseDados, FAssocRubricaPlano, FCadForne, UAutorizacao,
     UMensErro, USistema, UModulo, fCadRubXPensaoAlimenticia,
     fFolhaNormalEfet, FFolhaNormalPrevia, uIntegraBack,
     FCadProvento, fCadBancoPortador, fImportaTxt,
     FCadLayoutDesconto, Fadiantamento, fEstornaFolha,
     FCadContaBanco, FPRelDemPag, FAlimentados, FConsultaPrevia, FExportaTXT,
     FCadTmpDesc, fGeraArquivoRemessa, FCorrigeContaBancaria,
     fComparaBanco, dRelFolha, dRelGeral, dReports, dAPREV, dFolha, dGraficos,
     dPrevia, dIntegracao, dRelFolhaAtividade, fExtraFolha,
     FFolhaRestabelecimento, fContraChequeTrimestral, FConsultaHistorico,
     FCadHstBeneficio, dFolhaPrevia, drelbenef, FFolhaNormalPreviaResgate,
  fVisaoGerencial, fCadFormaPagtoBenef, fCadFormaPagtoMensal, FCadRubIndiv;

{$R *.DFM}


procedure TfrmPrincipal.Verifica_Situacao_Empresa;
var
  qryIntegraBack : TQuery;
begin
  // Verificar se Previdenciario com Contabilidade
  qryIntegraBack := TQuery.Create(Application);
  qryIntegraBack.DataBaseName := 'Basedados';

//*************  VERIFICAR QUAL O O TIPO DE CLIENTE CORRETO. VER COM FLAVIO DIAS.
//-------------------------------------------
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT FLGINTCONTAB, FLGINTCPAGARPREV, FLGINTCRECEBERPR '+
                         ' FROM   PARAMAPREV ');
  qryIntegraBack.open;

  if not (qryIntegraBack.IsEmpty)
  then begin
     if qryIntegraBack.FieldbyName('FLGINTCONTAB').AsInteger = 1
     then IntegraBack.Contabilidade := 'S'
     else IntegraBack.Contabilidade := 'N';

     if (qryIntegraBack.FieldbyName('FLGINTCPAGARPREV').AsInteger = 1) or
        (qryIntegraBack.FieldbyName('FLGINTCRECEBERPR').AsInteger = 1)
     then IntegraBack.Financeiro  := 'S'
     else IntegraBack.Financeiro := 'N';
  end
  else begin
     IntegraBack.Contabilidade := 'N';
     IntegraBack.Financeiro := 'N';
  end;

  if Sistema.IdEmpresa <= 0
  then begin
     qryIntegraBack.Free;
     Exit;
  end;

  // Preencher parametros da contabilidade
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT PL.MASCARA, PC.PLANO       '+
                         ' FROM   PLANO PL,   PARAMCONTAB PC '+
                         ' WHERE  (PC.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')'+
                         ' AND    (PL.PLANO = PC.PLANO) ');
  qryIntegraBack.Open;
  if not (qryIntegraBack.IsEmpty)
  then begin
      IntegraBack.Plano        := qryIntegraBack.FieldbyName('PLANO').AsInteger;
      IntegraBack.MascaraPlano := qryIntegraBack.FieldbyName('MASCARA').AsString;
  end
  else begin
     IntegraBack.Plano := 0;
     IntegraBack.MascaraPlano := '';
  end;
  
  if (IntegraBack.Contabilidade = 'S') and
     ( (IntegraBack.Plano <= 0) or (IntegraBack.MascaraPlano = ''))
  then begin
     MsgDlg(' O Sistema de Folha de Benefícios está integrado com o Sistema de Contabilidade. '+
            ' Porém existem dados da contabilidade indispensáveis à integração que não estão cadastrados. '+
            ' Favor entrar em contato com o setor responsável. ','Informação',mtInformation,[mbOK],0);
  end;

  // Preencher parametros de integracao com CAP/CAR
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT PREC.MASCARADESEMB AS MASCARAREC , PPAG.MASCARADESEMB AS MASCARAPAG  '+
			 ' FROM   PARAMCAP PREC, PARAMCAP PPAG'+
			 ' WHERE  (PREC.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')'+
			 ' AND    (PPAG.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
			 ' AND    (PREC.RECPAG = ''R'')'+
                         ' AND    (PPAG.RECPAG = ''P'')');

  qryIntegraBack.Open;

  if (not qryIntegraBack.IsEmpty)
  then begin
     IntegraBack.MascaraDesemb:= qryIntegraBack.FieldbyName('MASCARAREC').AsString;
     IntegraBack.MascaraDesemb := qryIntegraBack.FieldbyName('MASCARAPAG').AsString;
  end
  else begin
     IntegraBack.MascaraDesemb := '';
     IntegraBack.MascaraDesemb := '';
  end;

  if (IntegraBack.Financeiro = 'S') and (Trim(IntegraBack.MascaraDesemb) = '')
  then begin
     MsgDlg(' O Sistema de Folha de Benefícios está integrado com o Sistema de Contas a Receber. '+
            ' Porém existem dados do Contas a Receber indispensáveis à integração que não estão cadastrados. '+
            ' Favor entrar em contato com o setor responsável. ','Informação',mtInformation,[mbOK],0);
  end;
  //Verifica se a empresa utiliza o sistema ABC( Custo Baseado na Atividade)
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT USAABC, USACRESPON, UNIDNEGOC, CODCENTRORESPON '+
                         ' FROM   PARAMGLOBAL '+
                         ' WHERE  IDPESSOA = '+IntToStr(Sistema.idEmpresa));
  qryIntegraBack.open;
  if qryIntegraBack.IsEmpty
  then begin
     IntegraBack.ObrigaABC := 'S';
     IntegraBack.ObrigaCRespon := 'S';
     prmUnidNegoc := -1;
     prmCodCentroRespon := '';
  end
  else begin
     if qryIntegraBack.FieldByName('USAABC').AsString = 'N'
     then IntegraBack.ObrigaABC := 'N'
     else IntegraBack.ObrigaABC := 'S';

     if qryIntegraBack.FieldByName('USACRESPON').AsString = 'N'
     then IntegraBack.ObrigaCRespon := 'N'
     else IntegraBack.ObrigaCRespon := 'S';

     if Trim(qryIntegraBack.FieldByName('UnidNegoc').AsString) <> ''
     then prmUnidNegoc := qryIntegraBack.FieldByName('UnidNegoc').AsInteger
     else prmUnidNegoc := -1;

     if Trim(qryIntegraBack.FieldByName('CODCENTRORESPON').AsString) <> ''
     then prmCodCentroRespon := qryIntegraBack.FieldByName('CODCENTRORESPON').AsString
     else prmCodCentroRespon := '-1';
  end;
  qryIntegraBack.Free;
end;   //verifica_situacao_empresa;

procedure TfrmPrincipal.mnuRubricasSalariaisClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadProvento,TfrmCadProvento,False);
end;

procedure TfrmPrincipal.mnuFolhaNormalClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmFolhaNormalEfet,TfrmFolhaNormalEfet,False);
end;

procedure TfrmPrincipal.mnuFolhaPreviaEspecialClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmFolhaNormalPreviaResgate,TfrmFolhaNormalPreviaResgate,False);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmParamAPrev,TfrmParamAPrev,False);
end;

procedure TfrmPrincipal.mnuRubricasIndividuaisClick(Sender: TObject);
begin
  inherited;
// CGUEDES - 02/08/2001
  AbrirForm(frmCadRubricaIndiv,TfrmCadRubricaIndiv,False);
end;

procedure TfrmPrincipal.mnuRubricasporFundacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAssocProvPatro,TfrmAssocProvPatro,False);
end;

procedure TfrmPrincipal.mnuPreparoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPreparo,TfrmPreparo,False);
end;

procedure TfrmPrincipal.mnuRubricasporPlanoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAssocRubricaPlano,TfrmAssocRubricaPlano,False );
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  sistema.idmodulo := 18 ;
end;

procedure TfrmPrincipal.mnuFavorecidoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadForne,TfrmCadForne,False);
end;

procedure TfrmPrincipal.Prvia1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmFolhaNormalPrevia,TfrmFolhaNormalPrevia,False);
end;

procedure TfrmPrincipal.RubricasIndividuais1Click(Sender: TObject);
begin
  inherited;
// CGUEDES - 02/08/2001
  AbrirForm(frmCadRubIndiv,TfrmCadRubIndiv,False );
end;

procedure TfrmPrincipal.BancoXPortadorForma1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadBancoPortador,TfrmCadBancoPortador,False);
end;

procedure TfrmPrincipal.ImportaoArquivo1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmImportaTxt,TFrmImportaTxt,False);
end;

procedure TfrmPrincipal.LayOutDescontos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadLayoutDesconto,TFrmCadLayoutDesconto,False);
end;

procedure TfrmPrincipal.DemenstrativodePagamento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPRelDemPag,TfrmPRelDemPag,False);
end;

procedure TfrmPrincipal.Adiantamento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAdiantamento,TfrmAdiantamento,False);
end;

procedure TfrmPrincipal.RubricasIncidentesnaPensoAlimentciaporBeneficirio1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadRubXPensaoAlimenticia,TFrmCadRubXPensaoAlimenticia,False);
end;

procedure TfrmPrincipal.Estorna1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmEstornaFolha,TfrmEstornaFolha,False);
end;

procedure TfrmPrincipal.ContasBancrias1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadContaBanco,TfrmCadContaBanco,False);
end;

procedure TfrmPrincipal.FolhadeBenefcio2Click(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.Alimentados1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAlimentado,TFrmAlimentado,False);
end;

procedure TfrmPrincipal.ExportaodeArquivo1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmExportaTxt,TFrmExportaTxt,False);
end;

procedure TfrmPrincipal.Prva1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConsultaPrevia,TfrmConsultaPrevia,False);
end;

procedure TfrmPrincipal.mnuConsultaPreviaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConsultaPrevia,TfrmConsultaPrevia,False);
end;

procedure TfrmPrincipal.mnuConsultaHistoricoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConsultaHistorico,TfrmConsultaHistorico,False);
end;

procedure TfrmPrincipal.mnuCadastroManualdeRubricasClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTmpDesc,TfrmCadTmpDesc,False);
end;

procedure TfrmPrincipal.mnuCadastroManualdeBeneficiosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadHstBeneficio,TfrmCadHstBeneficio, False);
end;
                                                    
procedure TfrmPrincipal.mnuGeraArquivodeRemessaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmGeraArquivoRemessa,TfrmGeraArquivoRemessa,False);
end;

procedure TfrmPrincipal.mnuVerificaContaBancariaClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCorrigeContaBancaria, TfrmCorrigeContaBancaria, False);
end;

procedure TfrmPrincipal.mnuComparaArquivosdeBancoClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmComparaBanco, TfrmComparaBanco, False);
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
  inherited;
  verifica_situacao_empresa;
  LeParam(dtmBaseDados.dbBaseDados.DatabaseName, False);
  EscolheFundacao;
  with qryParamGlobal do
  begin
    Close;
    Params[0].asInteger := Sistema.idEmpresa;
    Open;
    if not(qryParamGlobal.isEmpty) then
    begin
      Modulo.bUsaCentRespon := FieldByName('USACRESPON').asString = 'S';
      Modulo.bUsaUnidNegoc  := FieldByName('USAABC').asString = 'S';
    end;
    if not(Modulo.bUsaCentRespon) then Modulo.sCODCENTRORESPON := FieldByName('CODCENTRORESPON').asString;
    if not(Modulo.bUsaUnidNegoc)  then  Modulo.iUnidNegoc := FieldByName('UNIDNEGOC').asInteger;

    Close;
  end;
  mnuConsultaHistorico.Enabled := True;
  mnuConsultaPrevia.Enabled := True;
  mnuCadastroManualdeRubricas.enabled:=true;
  mnuGeraArquivodeRemessa.enabled:=true;
  mnuVerificaContaBancaria.enabled:=true;
  mnuComparaArquivosdeBanco.enabled:=true;
  mnuCadastroManualdeBeneficios.enabled:=true;
  mnuFolhaExtra.enabled:=true;
  mnuPagamentosPendentes.enabled:=true;
  mnuVisaoGerencialFolha.enabled:=true;
  MnuConsPart_Padrao.visible:=true;
  MnuConsPart_Padrao.enabled:=true;
  mnuAlteraFormadePagto.Enabled := TRUE;
  mnuAlteraPagamentoBenefcio.Enabled := True;
  mnuAlteraPagamentoMensal.Enabled := True;
end;

function  TfrmPrincipal.EscolheFundacao : longint;
var mrEscolhe : TModalResult;
begin
  Result := -1;

  if not prmflgMultiFundacao then
    Result := iIdFundacao
  else
  begin
    frmEscolhaFundacao := TfrmEscolhaFundacao.Create(Application);
    try
      with frmEscolhaFundacao do
      begin
        mrEscolhe := ShowModal;
        if (mrEscolhe = mrOK) and (dblkpcmbFundacao.Text <> '') then
          iIdFundacao := qryFundacao.FieldByName('IDPESSOA').AsInteger;
      end;
    finally
      frmEscolhaFundacao.Free;
    end;
  end;
end;


procedure TfrmPrincipal.ExtraFolha1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExtraFolha,tfrmExtraFolha,False);
end;

procedure TfrmPrincipal.Restabelecimento1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmRestabelecimento, TfrmRestabelecimento,False);
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  inherited;

end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
  // FORM RELATÓRIOS.
  Application.CreateForm(TDtmRelFolha,DtmRelFolha);
  Application.CreateForm(TDtmRelFolhaAtividade,DtmRelFolhaAtividade);
  Application.CreateForm(TDtmRelGeral,DtmRelGeral);
  Application.CreateForm(TDtmGraficos,DtmGraficos);
  Application.CreateForm(TDtmPrevia,DtmPrevia);
  Application.CreateForm(TDtmRelBenef,DtmRelBenef);
end;

procedure TfrmPrincipal.ContraChequeTrimestral1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmcontrachequetrimestral, Tfrmcontrachequetrimestral, False);
end;

procedure TfrmPrincipal.mnuTransacoesClick(Sender: TObject);
begin
  inherited;
  ContraChequeTrimestral1.Enabled := true;
end;

procedure TfrmPrincipal.PagamentodeBenefcio2Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadFormaPagtoBenef,TfrmCadFormaPagtoBenef, False);

end;

procedure TfrmPrincipal.PagamentodeMensal1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadFormaPagtoMensal,TfrmCadFormaPagtoMensal, False);

end;

procedure TfrmPrincipal.MnuConsPart_PadraoClick(Sender: TObject);
begin
  inherited;
  if sTipoPrevidencia = 'F' then
    MontaSelectPart.Filtro[4] := 'PLANPREV.TPPLANOPREV =  ' + '''F'''
  else
    MontaSelectPart.Filtro[4] := 'PLANPREV.TPPLANOPREV <> ' + '''F''';

  MontaSelectPart.Executar;
  if (MontaSelectPart.ValoresChave.Count > 0) and
     (MontaSelectPart.ValoresChave[0] <> '') then
  begin
    // Consulta Participante
    ConsPart1.sIdPessoa    := MontaSelectPart.ValoresChave[0];
    ConsPart1.sIdPessjur   := MontaSelectPart.ValoresChave[1];
    ConsPart1.sIdPlanoprev := MontaSelectPart.ValoresChave[2];
    ConsPart1.sSeqProposta := MontaSelectPart.ValoresChave[6];
    ConsPart1.DataBaseName := 'BaseDados';
    ConsPart1.MostraConsulta;
  end;
end;

procedure TfrmPrincipal.mnuVisaoGerencialFolhaClick(Sender: TObject);
begin
  inherited;
  //P.RAMOS - 11.07.2001
  AbrirForm(FrmVisaoGerencial,TFrmVisaoGerencial,False);
end;

initialization
  Sistema.NomeModulo := 'Folha de Benefícios';
  Sistema.IdModulo := 18 ;
  Sistema.Versao := '3.02.05a';
  Sistema.NomeAplicativo := 'Folha de Benefícios';
  IntegraBack := TIntegraBack.Create(True,True,True);
  Modulo := TModulo.Create;

finalization
  Modulo.free;
  IntegraBack.Free;
end.


