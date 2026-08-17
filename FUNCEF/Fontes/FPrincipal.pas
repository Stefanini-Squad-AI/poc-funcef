unit FPrincipal;

// Alterações:

//------------------------------------------------------------------------------
// Autor(a)    : Higor Nayde
// Data        : 09/07/2014
// Sol         : 213547/15854
// Kintana     : 2061373
// Descricao   : Passar de Menus para o Módulo de CadastroPrev 
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 05/09/2014
// Sol         : 213777/16134
// Kintana     : 404512
// Descricao   : Retirada de Menu alimentação
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 23/06/2010
// Sol         : 136951
// Kintana     : 822330
// Descricao   : retirado do form principal o menu Modulos -> Folha de benefícios
//               -> submenu Contra cheque e gera arquivo entidade e adicionado no projeto folha
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 05/09/2008
// Rotina      : AppPadraoAfterLogin
// SOL:        : 95032
// KINTANA     : 410109
// Descricao   : Quando no momento de efetuar o login do usuário na opção sair não esta mais travando.
//------------------------------------------------------------------------------
// Autor(a)    : Hugo Luna
// Data        : 28/05/2008
// Rotina      : Varias
// Pendência   : 27988 (ReAbertura)
// Descricao   : Inicializando a Classe IntegraBack, e criando a função Verifica_Situacao_Empresa
//               para buscar os dados da classe.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 29/08/2007
// Rotina      : Processa
// Pendência   : 22537 (ReAbertura)
// Descricao   : Disparar a geração automaticamente a geração do arquivo dos
//               demonstrativos no modulo FUNCEF (Contra-Cheque)
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 29/08/2007
// Rotina      : Processa
// Pendência   : 22537
// Descricao   : Disparar a geração automaticamente a geração do arquivo dos
//               demonstrativos no modulo FUNCEF (Contra-Cheque)
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls,  TB97Tlwn, TB97Tlbr,
  TB97Ctls, ImgList, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti,
  IvEMulti, fcLabel, AppEvnts, CMApplicationEvents, StdActns, ActnList,
  fcStatusBar, SConnect, MConnect, DBClient, uResource, CMNetUsers, FGeraArqDarfJud,
  registry, uMensErro, uIntegraBack, uObjFolha;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    Processar1: TMenuItem;
    mnuConversaodeLayOutdeMantenedora: TMenuItem;
    mnuSeparadordeArquivosdaFuncef: TMenuItem;
    ToolbarSep971: TToolbarSep97;
    sbtnSeparadorFuncef: TToolbarButton97;
    ConversodeLayOutdeArquivosFinanaceirosdaCAIXAparaInterfacePREV1: TMenuItem;
    BitBtn1: TBitBtn;
    Emprstimo1: TMenuItem;
    RecebimentodeArquivodeCrticadaCAIXA1: TMenuItem;
    IntegraoSIAFIxTotalPrev1: TMenuItem;
    mnuLerArquivoSIAFI: TMenuItem;
    mnuGerarArquivoSIAFI: TMenuItem;
    Importaes1: TMenuItem;
    ImportaodeCotaesdeMoedas1: TMenuItem;
    N1: TMenuItem;
    Batimentodereservas1: TMenuItem;
    Batimentodevaloresdecontribuies1: TMenuItem;
    N2: TMenuItem;
    IgualacontribuiesPatronaisCaixa1: TMenuItem;
    mnuModulos: TMenuItem;
    N7: TMenuItem;
    mnuValidaodoInforme1: TMenuItem;
    mnuIRRF: TMenuItem;
    mnuGeraArqDarfJud: TMenuItem;
    procedure mnuConversaodeLayOutdeMantenedoraClick(Sender: TObject);
    procedure mnuSeparadordeArquivosdaFuncefClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure ConversodeLayOutdeArquivosFinanaceirosdaCAIXAparaInterfacePREV1Click(
      Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RecebimentodeArquivodeCrticadaCAIXA1Click(Sender: TObject);
    procedure fcLabel2DblClick(Sender: TObject);
    procedure mnuLerArquivoSIAFIClick(Sender: TObject);
    procedure mnuGerarArquivoSIAFIClick(Sender: TObject);
    procedure ImportaodeCotaesdeMoedas1Click(Sender: TObject);
    procedure Batimentodereservas1Click(Sender: TObject);
    procedure Batimentodevaloresdecontribuies1Click(Sender: TObject);
    procedure IgualacontribuiesPatronaisCaixa1Click(Sender: TObject);
    procedure NovasinscrieseativosReplan1Click(Sender: TObject);
    procedure MnuSaldamentoDeAposentadosClick(Sender: TObject);
    procedure MnuSaldamentoDeAtivosClick(Sender: TObject);
    procedure MnuSaldamentoDePensionistasClick(Sender: TObject);
    procedure MnuDesfazerSaldamentoClick(Sender: TObject);
    procedure MnuItExecImportaReservaClick(Sender: TObject);
    procedure MnuItPreparoClick(Sender: TObject);
    procedure mnuValidaodoInforme1Click(Sender: TObject);
    procedure mnuGeraArqDarfJudClick(Sender: TObject);
    //procedure Timer1Timer(Sender: TObject);
  private
    procedure Verifica_Situacao_Empresa;
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses FConversaoLayOutMant, FSeparadorArqFuncef, FSeparadorArqFinanc,
  FExecCriticaCaixa, fLerArquivoSIAFI, fGerarArquivoSIAFI, FInsereFunc,
  FUpdateTmpdesc, fImportCotMoeda, fBatimentoReservas, fBatimentoVlrContrib,
  FAlimReservasReplan, FIgualaContribCaixa, Fpht, FInscricaoNovoPlano,
  FPreparoSaldamento, FSaldamento, FCancSaldamento,
  FExecImportaReserva, fValidaInforme,UAdmPrev;

{$R *.DFM}

procedure TfrmPrincipal.mnuConversaodeLayOutdeMantenedoraClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConversaoLayOutMant,TfrmConversaoLayOutMant,False );
end;

procedure TfrmPrincipal.mnuSeparadordeArquivosdaFuncefClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmSeparadorArqFuncef,TfrmSeparadorArqFuncef,False );
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
Var
 I :Integer;
begin
  inherited;

  // Daniel Begnami SOL:95032 KT:410109
  if not(Sistema.FezLogin) then
    Exit;
  // Fim

  Verifica_Situacao_Empresa;
  SistemaFolha := TObjSistemaFolha.Create;
  MnuConsPart_Padrao.Visible := False;
end;

procedure TfrmPrincipal.ConversodeLayOutdeArquivosFinanaceirosdaCAIXAparaInterfacePREV1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmSeparadorArqFinanc,TfrmSeparadorArqFinanc,False );
end;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmUpdateTmpdesc, TfrmUpdateTmpdesc, False)
end;

procedure TfrmPrincipal.RecebimentodeArquivodeCrticadaCAIXA1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmCriticaCaixa, TfrmCriticaCaixa,False );
end;

procedure TfrmPrincipal.fcLabel2DblClick(Sender: TObject);
var i :Integer;
begin
  inherited;

end;

procedure TfrmPrincipal.mnuLerArquivoSIAFIClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmLerArquivoSIAFI, TfrmLerArquivoSIAFI,False );
end;

procedure TfrmPrincipal.mnuGerarArquivoSIAFIClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmGerarArquivoSIAFI, TfrmGerarArquivoSIAFI,False );
end;

procedure TfrmPrincipal.ImportaodeCotaesdeMoedas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmImportCotMoeda, TfrmImportCotMoeda,False );
end;

procedure TfrmPrincipal.Batimentodereservas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmBatimentoReservas, TFrmBatimentoReservas,False );
end;

procedure TfrmPrincipal.Batimentodevaloresdecontribuies1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmBatimentoVlrContrib, TFrmBatimentoVlrContrib,False );
end;

procedure TfrmPrincipal.IgualacontribuiesPatronaisCaixa1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmIgualaContribCaixa, TfrmIgualaContribCaixa,False );
end;

procedure TfrmPrincipal.NovasinscrieseativosReplan1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmInscricaoNovoPlano, TfrmInscricaoNovoPlano, False );
end;

procedure TfrmPrincipal.MnuSaldamentoDeAposentadosClick(Sender: TObject);
begin
  inherited;

  Application.CreateForm( TFrmSaldamento, FrmSaldamento );
  FrmSaldamento.Tag := 0; { Saldamento de Assistido }
  FrmSaldamento.HelpContext:= 3360019; //CPrev - 29/01/2008
  FrmSaldamento.ShowModal;

end;

procedure TfrmPrincipal.MnuSaldamentoDeAtivosClick(Sender: TObject);
begin
  inherited;

  Application.CreateForm( TFrmSaldamento, FrmSaldamento );
  FrmSaldamento.Tag := 1; { Saldamento de ativo }
  FrmSaldamento.HelpContext:= 3360020; //CPrev - 29/01/2008
  FrmSaldamento.ShowModal;

end;

procedure TfrmPrincipal.MnuSaldamentoDePensionistasClick(Sender: TObject);
begin
  inherited;

  Application.CreateForm( TFrmSaldamento, FrmSaldamento );
  FrmSaldamento.Tag := 2; { Saldamento de Pensionistas }
  FrmSaldamento.HelpContext:= 3360021; //CPrev - 29/01/2008
  FrmSaldamento.ShowModal;

end;

procedure TfrmPrincipal.MnuDesfazerSaldamentoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCancSaldamento, TfrmCancSaldamento, False );
end;

procedure TfrmPrincipal.MnuItExecImportaReservaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmExecImportaReserva, TFrmExecImportaReserva, False );
end;

procedure TfrmPrincipal.MnuItPreparoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmPreparoSaldamento, TFrmPreparoSaldamento, False );
end;

procedure TfrmPrincipal.mnuValidaodoInforme1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmValidaInforme, TfrmValidaInforme, False );
end;

procedure TfrmPrincipal.mnuGeraArqDarfJudClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmGeraArqDarfJud, TFrmGeraArqDarfJud, False );
end;

procedure TfrmPrincipal.Verifica_Situacao_Empresa;
var
  qryIntegraBack : TQuery;
begin

  // Verificar se Previdenciario com Contabilidade
  qryIntegraBack := TQuery.Create(Application);
  qryIntegraBack.DataBaseName := 'Basedados';

  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT FLGINTCONTAB, FLGINTCPAGARPREV, FLGINTCRECEBERPR '+
                         ' FROM   PARAMAPREV ');
  qryIntegraBack.open;

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

end;

initialization
   Sistema.NomeModulo     := 'Funcef'; // Nome do Módulo
   Sistema.IdModulo       := 336;      // IdModulo cadastrado no SAD
   Sistema.Versao := '3.01.04i';
   Sistema.NomeAplicativo := 'Funcef';
   IntegraBack            := TIntegraBack.Create(True, True, True) ;

finalization

end.
