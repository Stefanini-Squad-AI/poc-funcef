unit FPrincipal;

// Alterações:
{---------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 22.11.2005
Pendência : 20785
Alteração : criei item de menu Registrodeoperaes1Click que chama a tela de registro no logtotalprev
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 04.05.2005
Pendência :
Alteração : criei "if funcef" para chamada de tela de importação financeira via procedure
            ou no padrão novo
            criei "if" também para a importação cadastral que, não existe na tela de layout de recebimento nova,
            portanto a tela de importação não deve aparecer para não criar dúvidas
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 08.10.2003
Pendência : 14952
Alteração : Chamada da rotina LEPARAMINTERFACE
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl,  ExtCtrls,   Buttons,    ComCtrls,     TB97,
  Db, Wwdatsrc, DBTables, Wwquery, wwdblook,   StdCtrls,   DBCtrls,   Mask,
  wwdbedit, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio,   IvAMulti,   IvBinDic,
  IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts, CMApplicationEvents,
  StdActns, ActnList, ImgList, fcStatusBar, SConnect, MConnect, DBClient,
  uResource, CMNetUsers;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    ControledeInterface1: TMenuItem;
    Cobranas2: TMenuItem;
    InterfacecomPatrocinadora1: TMenuItem;
    N3: TMenuItem;
    mnuPatroEnvio: TMenuItem;
    RecebimentodaPatrocinadora1: TMenuItem;
    mnuPatroRecebFinanc: TMenuItem;
    LayOutPatrocinadora1: TMenuItem;
    mnuPatroLayOutRecebimento: TMenuItem;
    mnuPatroRecebDadosCad: TMenuItem;
    mnuPatroSeparaArquivo: TMenuItem;
    mnuPatroLayOutEnvio: TMenuItem;
    Rubricasquecompoemossalriosporplano1: TMenuItem;
    N7: TMenuItem;
    HistoricodeSalriosParticipao1: TMenuItem;
    SPC1: TMenuItem;
    mnuSPCGerarArquivo: TMenuItem;
    N5: TMenuItem;
    AssociaodeRubricaporEmpresa1: TMenuItem;
    mnuCadParamEnvioContrib: TMenuItem;
    mnuUtilVerificaMenu: TMenuItem;
    bbtnGeraArqSERPROS: TBitBtn;
    mnuCadRubricas: TMenuItem;
    N1: TMenuItem;
    VisualizadordeArquivosTexto1: TMenuItem;
    verificacaodoarquivo: TMenuItem;
    N2: TMenuItem;
    Registrodeoperaes1: TMenuItem;
    procedure mnuPatroLayOutEnvioClick(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure ControledeInterface1Click(Sender: TObject);
    procedure Arquivos1Click(Sender: TObject);
    procedure mnuPatroRecebDadosCadClick(Sender: TObject);
    procedure mnuEnviaBancoClick(Sender: TObject);
    procedure EnvioparaBanco1Click(Sender: TObject);
    procedure RecebimentodoBanco1Click(Sender: TObject);
    procedure RecebimentodoBanco2Click(Sender: TObject);
    procedure Cobranas2Click(Sender: TObject);
    procedure SeparaodoArquivo1Click(Sender: TObject);
    procedure mnuPatroRecebFinancClick(Sender: TObject);
    procedure mnuPatroLayOutRecebimentoClick(Sender: TObject);
    procedure mnuPatroSeparaArquivoClick(Sender: TObject);
    procedure mnuPatroEnvioClick(Sender: TObject);
    procedure Rubricasquecompoemossalriosporplano1Click(Sender: TObject);
    procedure HistoricodeSalriosParticipao1Click(Sender: TObject);
    procedure mnuSPCGerarArquivoClick(Sender: TObject);
    procedure AssociaodeRubricaporEmpresa1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuCadParamEnvioContribClick(Sender: TObject);
    procedure mnuUtilVerificaMenuClick(Sender: TObject);
    procedure bbtnGeraArqSERPROSClick(Sender: TObject);
    procedure mnuCadRubricasClick(Sender: TObject);
    procedure mnuInterfAtuParametroClick(Sender: TObject);
    procedure mnuInterfAtuGeracaoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RubricasFinanceiras1Click(Sender: TObject);
    procedure VisualizadordeArquivosTexto1Click(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure verificacaodoarquivoClick(Sender: TObject);
    procedure Registrodeoperaes1Click(Sender: TObject);
  private
    {-----}
    procedure Verifica_Situacao_Empresa;

  public
    {-----}
    procedure MudaCaptionFundacao(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  FTelaAut, FCadArquivoInterface, FParamCCP,     UCCP,
  DBaseDados, FCtrlInterface, USistema, UAutorizacao,
  UMensErro, FConsTmpdesc, {FPRelInterfaceCritica,}
  UModulo,     FSeparaArq,    FGravaTxt,
  FCadInterfacePatro,           FImportaDadosCadastrais,
  fCadEnvioPatro,     finterfaceenvio,     fCadRubricasCompoeSalarios,
  FHistSalPartic,  FGeraArqSPC, FAssocProvPatro, 
  dRelatorios, FPRelTmpContribAnalit,
  FPRelRubReceb, FCriticaArqFinanc,
  FVerificaMenuSAD, FGeraArqSERPROS,UIntegraBack,
  FGeraEstatisticas, FEstatisticaSPCNOVO, UAdmPrev, FEscolhaFundacao,
  FCadProvento, FProcCadInterfAtuarial, FCadInterfAtuarial,
  FCadOpEnvioContribPatro, FPRelRubricasNEncontradas, FPRelResumoRubricas,
  FSolicitaPlano, FCadLayOutRecebimentoPatro, FTrataArq, FGravaTxtMT , FConsLogTotalPREV ;

{$R *.DFM}


procedure TfrmPrincipal.MudaCaptionFundacao(Sender: TObject);
var i, iPos, iTam, iTamFrase : word;
    Temp    : TComponent;
begin
  if Screen.ActiveForm = nil then Exit;

  if prmFLGTIPOPREVIDENC = 'I' then
  begin
    iPos      := Pos   ('FUNDA', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('FUNDAÇÃO');
    iTamFrase := Length(Screen.ActiveForm.Caption);

    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Instituto'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

    iPos      := Pos   ('PATROCINADORAS', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('PATROCINADORAS');
    iTamFrase := Length(Screen.ActiveForm.Caption);

    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Entidades'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

    iPos      := Pos   ('PATROCINADORA', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('PATROCINADORA');
    iTamFrase := Length(Screen.ActiveForm.Caption);

    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Entidade'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

    iPos      := Pos   ('PLANOS', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('PLANOS');
    iTamFrase := Length(Screen.ActiveForm.Caption);

    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Regimes'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

    iPos      := Pos   ('PLANO', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('PLANO');
    iTamFrase := Length(Screen.ActiveForm.Caption);

    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Regime'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

    for i := 0 to Screen.ActiveForm.ComponentCount - 1 do
    begin
      Temp := Screen.ActiveForm.Components[i];

      if (Temp is TLabel) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TLabel(Temp).Caption);

        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TLabel(Temp).Caption);

        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TLabel(Temp).Caption);

        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANOS', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TLabel(Temp).Caption);

        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANO', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TLabel(Temp).Caption);

        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
      end;

      if (Temp is TMenuItem) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TMenuItem(Temp).Caption);

        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TMenuItem(Temp).Caption);

        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TMenuItem(Temp).Caption);

        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANOS', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TMenuItem(Temp).Caption);

        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANO', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TMenuItem(Temp).Caption);

        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
      end;

      if (Temp is TGroupBox) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TGroupBox(Temp).Caption);

        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TGroupBox(Temp).Caption);

        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TGroupBox(Temp).Caption);

        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANOS', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TGroupBox(Temp).Caption);

        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANO', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TGroupBox(Temp).Caption);

        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
      end;

      if (Temp is TCheckBox) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TCheckBox(Temp).Caption);

        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TCheckBox(Temp).Caption);

        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TCheckBox(Temp).Caption);

        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANOS', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TCheckBox(Temp).Caption);

        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANO', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TCheckBox(Temp).Caption);

        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
      end;

      if (Temp is TPanel) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TPanel(Temp).Caption);

        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TPanel(Temp).Caption);

        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TPanel(Temp).Caption);

        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANOS', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TPanel(Temp).Caption);

        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANO', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TPanel(Temp).Caption);

        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );
      end;
    end;
  end;
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
   inherited;
   If not sistema.FezLogin
    Then exit;

   Verifica_Situacao_Empresa;
   iIdFundacao      := Sistema.IdEmpresa; 
   iIdFundacaoAtual := Sistema.IdEmpresa; 

   LeParam('BaseDados', True);
   LeParamINTERFACE('BaseDados'); 

   MudaCaptionFundacao(Sender);
end;

procedure TfrmPrincipal.Verifica_Situacao_Empresa;
var
  qryUSistema : TQuery;
begin
  // Verificar se Previdenciario com Contabilidade
  qryUsistema              := TQuery.Create(Application);
  qryUSistema.DataBaseName := 'Basedados';

  qryUSistema.SQL.Clear;
  qryUsistema.SQL.Add(' SELECT PA.FLGINTCONTAB, PA.FLGINTCPAGARPREV, PA.FLGINTCRECEBERPR '+
                       ' FROM PARAMAPREV PA');
  qryUsistema.open;

  if not (qryUSistema.IsEmpty) then 
  begin
     if qryUsistema.FieldbyName('FLGINTCONTAB').AsInteger = 1 then
       IntegraBack.Contabilidade := 'S'
     else
       IntegraBack.Contabilidade := 'N';

     if qryUsistema.FieldbyName('FLGINTCPAGARPREV').AsInteger = 1 then
       Modulo.sIntegraRec := 'S'
     else
       Modulo.sIntegraRec := 'N';

     if qryUsistema.FieldbyName('FLGINTCRECEBERPR').AsInteger = 1 then
       Modulo.sIntegraPag := 'S'
     else
       Modulo.sIntegraPag := 'N';
  end
  else
  begin
    IntegraBack.Contabilidade := 'N';
    Modulo.sIntegraRec := 'N';
    Modulo.sIntegraPag := 'N';
  end;

  // Preencher parametros da contabilidade
  qryUSistema.Close;
  qryUSistema.SQL.Clear;
  qryUSistema.SQL.Add(' SELECT PL.MASCARA, PC.PLANO '                              +
                      ' FROM PLANO PL,   PARAMCONTAB PC'                           +
                      ' WHERE (PC.IDPESSOA = ' + IntToStr(Sistema.idEMpresa) + ')' +
                      '   AND (PL.PLANO    = PC.PLANO) ' );
  qryUsistema.Open;

  if not (qryUSistema.IsEmpty) then
  begin
    IntegraBack.Plano        := qryUsistema.FieldbyName('PLANO').AsInteger;
    IntegraBack.MascaraPlano := qryUsistema.FieldbyName('MASCARA').AsString;
  end
  else
  begin
    IntegraBack.Plano := 0;
    IntegraBack.MascaraPlano := '';
  end; // else - if not PARAMCONTAB.IsEmpty

  if (IntegraBack.Contabilidade = 'S') and
     ( (IntegraBack.Plano <= 0) or (IntegraBack.MascaraPlano = '')) then
  begin
    MsgDlg(' O Sistema de Administração Previdenciária está integrado com o Sistema de Contabilidade. '+
           ' Porém existem dados da contabilidade indispensáveis à integração que não estão cadastrados. '+
           ' Favor entrar em contato com o setor responsável. ','Informação',mtInformation,[mbOK],0);
  end;

  // Preencher parametros de integracao com CAP/CAR
  qryUSistema.Close;
  qryUSistema.SQL.Clear;
  qryUSistema.SQL.Add(' SELECT PREC.MASCARADESEMB AS MASCARAREC , '                  +
                      '        PPAG.MASCARADESEMB AS MASCARAPAG  '                   +
                      ' FROM PARAMCAP PREC, PARAMCAP PPAG'                           +
                      ' WHERE (PREC.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ')' +
                      '   AND (PPAG.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')' +
                      '   AND (PREC.RECPAG   = ''R'')'                               +
                      '   AND (PPAG.RECPAG   = ''P'')');

  qryUSistema.Open;

  if (not qryUSistema.IsEmpty) then
  begin
    Modulo.sMascaraDesembRec := qryUSistema.FieldbyName('MASCARAREC').AsString;
    Modulo.sMascaraDesembPag := qryUSistema.FieldbyName('MASCARAPAG').AsString;
  end
  else
  begin
    Modulo.sMascaraDesembRec := '';
    Modulo.sMascaraDesembPag := '';
  end;

  if (Modulo.sIntegraRec = 'S') and (Trim(Modulo.sMascaraDesembRec) = '') then
  begin
    MsgDlg(' O Sistema de Administração Previdenciária está integrado com o Sistema de Contas a Receber. '+
           ' Porém existem dados do Contas a Receber indispensáveis à integração que não estão cadastrados. '+
           ' Favor entrar em contato com o setor responsável. ','Informação',mtInformation,[mbOK],0);
  end;

  if (Modulo.sIntegraPag = 'S') and (Trim(Modulo.sMascaraDesembPag) = '') then
  begin
    MsgDlg(' O Sistema de Administração Previdenciária está integrado com o Sistema de Contas a Pagar. '+
           ' Porém existem dados do Contas a Pagar indispensáveis à integração que não estão cadastrados. '+
           ' Favor entrar em contato com o setor responsável. ','Informação',mtInformation,[mbOK],0);
  end;

  //Verifica se a empresa utiliza o sistema ABC( Custo Baseado na Atividade)
  qryUSistema.Close;
  qryUSistema.SQL.Clear;
  qryUSistema.SQL.Add(' SELECT PG.USAABC '+
                      ' FROM   PARAMGLOBAL PG'+
                      ' WHERE  (IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')');
  qryUSistema.open;

  if qryUSistema.IsEmpty then
    Modulo.bUsaABC := False
  else
    if qryUSistema.FieldByName('USAABC').AsString = 'N' then
      Modulo.bUsaABC := False
    else
      Modulo.bUsaABC := True;
end;//IntegraBack.Contabilidade;

procedure TfrmPrincipal.mnuPatroLayOutEnvioClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadEnvioPatro,TFrmCadEnvioPatro,False);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmParamCCP,TfrmParamCCP,False);
end;

procedure TfrmPrincipal.ControledeInterface1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCtrlInterface,TfrmCtrlInterface,False);
end;

procedure TfrmPrincipal.Arquivos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadArquivoInterface,TfrmCadArquivoInterface,False);
end;

procedure TfrmPrincipal.mnuPatroRecebDadosCadClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmImportaDadosCadastrais,TfrmImportaDadosCadastrais,False);
end;

procedure TfrmPrincipal.mnuEnviaBancoClick(Sender: TObject);
begin
  inherited;
  try
     cRecPag := 'R';
  except
  end;
end;

procedure TfrmPrincipal.EnvioparaBanco1Click(Sender: TObject);
begin
  inherited;
  try
     cRecPag := 'P';
  except
  end;
end;

procedure TfrmPrincipal.RecebimentodoBanco1Click(Sender: TObject);
begin
  inherited;
  try
    cRecPag := 'P';
  except
  end;
end;

procedure TfrmPrincipal.RecebimentodoBanco2Click(Sender: TObject);
begin
  inherited;
  try
    cRecPag := 'R';
  except
  end;
end;

procedure TfrmPrincipal.Cobranas2Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConsTmpdesc, TfrmConsTmpdesc,False);
end;

procedure TfrmPrincipal.SeparaodoArquivo1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmSeparaArq,TfrmSeparaArq,False);
end;

procedure TfrmPrincipal.mnuPatroRecebFinancClick(Sender: TObject);
begin
  inherited;

  if (Sistema.TipoCliente = 19991) then
  begin
    AbrirForm(frmGravaTxtMT, TfrmGravaTxtMT, False);
  end
  else
  begin
    AbrirForm(frmGravaTxt, TfrmGravaTxt, False);
  end;
end;

procedure TfrmPrincipal.mnuPatroLayOutRecebimentoClick(Sender: TObject);
begin
  inherited;
  if not prmLayOutMultiploRecebimento then
    AbrirForm(frmCadInterfacePatro,TfrmCadInterfacePatro,False)
  else
    AbrirForm(frmCadLayOutRecebimentoPatro,TfrmCadLayOutRecebimentoPatro,False);
end;

procedure TfrmPrincipal.mnuPatroSeparaArquivoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmSeparaArq,TfrmSeparaArq,False);
end;

procedure TfrmPrincipal.mnuPatroEnvioClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmInterfaceEnvio,TfrmInterfaceEnvio,False);
end;

procedure TfrmPrincipal.Rubricasquecompoemossalriosporplano1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmRubricasCompoeSalarios ,TFrmRubricasCompoeSalarios, False);
end;

procedure TfrmPrincipal.HistoricodeSalriosParticipao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmHistSalPartic,TFrmHistSalPartic,False);
end;

procedure TfrmPrincipal.mnuSPCGerarArquivoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmEstatisticaSPCNOVO, TfrmEstatisticaSPCNOVO, False);
end;

procedure TfrmPrincipal.AssociaodeRubricaporEmpresa1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAssocProvPatro,TfrmAssocProvPatro,False );
end;

procedure TfrmPrincipal.BitBtn2Click(Sender: TObject);
begin

  AbrirForm(frmCadInterfacePatro,TfrmCadInterfacePatro,False);
end;

procedure TfrmPrincipal.mnuCadParamEnvioContribClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadOpEnvioContribPatro,TfrmCadOpEnvioContribPatro,False);
end;

procedure TfrmPrincipal.mnuUtilVerificaMenuClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmVerificaMenuSAD, TfrmVerificaMenuSAD, False);
end;

procedure TfrmPrincipal.bbtnGeraArqSERPROSClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmGeraArqSERPROS, TfrmGeraArqSERPROS, False);
end;

procedure TfrmPrincipal.mnuCadRubricasClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadProvento, TfrmCadProvento, False);
end;

procedure TfrmPrincipal.mnuInterfAtuParametroClick(Sender: TObject);
begin
  inherited;

  Application.CreateForm(TfrmSolicitaPlano, frmSolicitaPlano);
  frmSolicitaPlano.ShowModal;
  frmSolicitaPlano.Free;

  if sIdPlano <> '' then
     AbrirForm(frmCadInterfAtuarial, TfrmCadInterfAtuarial, False);
end;

procedure TfrmPrincipal.mnuInterfAtuGeracaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmProcCadInterfAtuarial, TfrmProcCadInterfAtuarial, False);
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmGravaTxt,TfrmGravaTxt,False);
end;

procedure TfrmPrincipal.RubricasFinanceiras1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmGravaTxt, TfrmGravaTxt, False);
end;

procedure TfrmPrincipal.VisualizadordeArquivosTexto1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCriticaArqFinanc, TfrmCriticaArqFinanc, False);
end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TDtmRelatorios, DtmRelatorios);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  Screen.OnActiveFormChange := MudaCaptionFundacao;

  if (Sistema.TipoCliente = 19991) then
    mnuPatroRecebDadosCad.Visible := false;
end;

procedure TfrmPrincipal.verificacaodoarquivoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmTrataArq, TFrmTrataArq, False);
end;

procedure TfrmPrincipal.Registrodeoperaes1Click(Sender: TObject);
begin
  inherited;
  FrmConsLogTotalPREV.ConsultaLogTotalPrev(32);
end;

initialization

   Sistema.NomeModulo     := 'Interface com Instituições Previdenciárias';
   Sistema.IdModulo       := 32 ;
   Sistema.Versao := '3.05.04d';
   Sistema.NomeAplicativo := 'Interface com Instituições Previdenciárias';
   IntegraBack            := TIntegraBack.Create(True,True,True);
   Modulo                 := TModulo.Create ;

finalization
   Modulo.free;
   IntegraBack.free;
end.

