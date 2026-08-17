{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 12/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit CRelMapaTIR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, Mask, wwdbedit, Wwdbspin, Db, DBClient, uCMClientDataSet,
  uCtrlMapaTIR, DBCtrls, DBCGrids, TREdit, uCtrlMoeda, wwdblook, Wwdatsrc,
  ComCtrls, Grids, DBGrids, uComunsImobiliarioDB, Math, JCLSysUtils, fPreview,
  fcCombo, fcColorCombo, uComunsImobiliario;

type
  TcfgRelMapaTIR = class(TcfgRel)
    grpReferencia: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    grpPlano: TGroupBox;
    cdsPatrosPlanos: TCMClientDataSet;
    cdsPatrosPlanosIDPLANOPREV: TFloatField;
    cdsPatrosPlanosFLGUSA: TFloatField;
    dbctrlgrd: TDBCtrlGrid;
    dtsPatrosPlanos: TDataSource;
    bvlLine: TBevel;
    dbcbFlgUsa: TDBCheckBox;
    dbtxtNomePatro: TDBText;
    grpIndiceAtuarial: TGroupBox;
    Image2: TImage;
    dbedtPerAtuarialSoma: TDBEdit;
    Label1: TLabel;
    grpIndiceCorrecao: TGroupBox;
    cbExibirResumo: TCheckBox;
    cbExibirTIRAtuarial: TCheckBox;
    cbAlienacaoRenda: TCheckBox;
    edtDia: TEdit;
    cdsPatrosPlanosIDPATRO: TFloatField;
    cdsPatrosPlanosNOMEPLANO: TStringField;
    cdsPatrosPlanosNOMEPATRO: TStringField;
    LlblPatro: TLabel;
    lblPlano: TLabel;
    dbtxtNomePlano: TDBText;
    grpTipoSegmento: TGroupBox;
    rbGerencial: TRadioButton;
    rbSPC: TRadioButton;
    cdsPatrosPlanosINDICECORRECAO: TFloatField;
    cdsPatrosPlanosINDICEATUARIAL: TFloatField;
    cdsPatrosPlanosPERCATUARIAL: TFloatField;
    dtsIndice: TwwDataSource;
    cdsIndice: TCMClientDataSet;
    cdsIndiceMOESIGLA: TStringField;
    cdsIndiceMOECODIGO: TFloatField;
    cdsIndiceMOEDESC: TStringField;
    cdsIndiceMOEPERIODICIDADE: TStringField;
    cdsIndiceFLGPERCVALOR: TStringField;
    dblkpIndiceCorrecao: TwwDBLookupCombo;
    dblkpIndiceAtuarial: TwwDBLookupCombo;
    Panel1: TPanel;
    lblProgress: TLabel;
    ProgressBar: TProgressBar;
    Panel2: TPanel;
    Bevel1: TBevel;
    cdsReceitaLiquida: TCMClientDataSet;
    Label2: TLabel;
    cdsAlienacao: TCMClientDataSet;
    cdsUltReavaliacao: TCMClientDataSet;
    cdsUltReavaliacaoIDIMOVELMESTRE: TFloatField;
    cdsUltReavaliacaoIDPATRO: TFloatField;
    cdsUltReavaliacaoIDPLANOPREV: TFloatField;
    cdsUltReavaliacaoULTREAVALIA: TFloatField;
    cdsSaldoAlienPlanoPatro: TCMClientDataSet;
    cdsReceitaLiquidaAlienacao: TCMClientDataSet;
    cdsUltReavaliacaoIDSEGMENTO: TStringField;
    cdsUltReavaliacaoMesAnt: TCMClientDataSet;
    cdsUltReavaliacaoAnoAnt: TCMClientDataSet;
    cdsUltReavaliacaoAnoAntIDIMOVELMESTRE: TFloatField;
    cdsUltReavaliacaoAnoAntIDPATRO: TFloatField;
    cdsUltReavaliacaoAnoAntIDPLANOPREV: TFloatField;
    cdsUltReavaliacaoAnoAntIDSEGMENTO: TStringField;
    cdsUltReavaliacaoAnoAntULTREAVALIA: TFloatField;
    cdsUltReavaliacaoMesAntIDIMOVELMESTRE: TFloatField;
    cdsUltReavaliacaoMesAntIDPATRO: TFloatField;
    cdsUltReavaliacaoMesAntIDPLANOPREV: TFloatField;
    cdsUltReavaliacaoMesAntIDSEGMENTO: TStringField;
    cdsUltReavaliacaoMesAntULTREAVALIA: TFloatField;
    cdsUltReavaliacaoORIGEM: TFloatField;
    cdsUltReavaliacaoMesAntORIGEM: TFloatField;
    cdsUltReavaliacaoAnoAntORIGEM: TFloatField;
    cdsFundoImob: TCMClientDataSet;
    cdsReceitaFundoImob: TCMClientDataSet;
    cdsSaldoFundoImob: TCMClientDataSet;
    btnTodos: TSpeedButton;
    btnNenhum: TSpeedButton;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnNenhumClick(Sender: TObject);
    procedure edtDiaKeyPress(Sender: TObject; var Key: Char);
    procedure edtDiaExit(Sender: TObject);
    procedure cboMesChange(Sender: TObject);
    procedure DBspnAnoChange(Sender: TObject);
  private
    CtrlMapaTIR         : TCtrlMapaTIR;
    CtrlMoeda           : TCtrlMoeda;
    ComunsImobiliarioDB : TComunsImobiliarioDB;

    function VerificaPreenchimento: boolean;
    procedure ProcessaRelatorio;
  public
    procedure MsgErro( sMsg : string );
  end;

var
  cfgRelMapaTIR: TcfgRelMapaTIR;

implementation

{$R *.DFM}

uses uDiasInUteis, dBaseDados, uSistema, uVerificaPreenchimento, uMensErro,
     FEspera, dRelMapaTIR, uModuloImobiliario;

procedure TcfgRelMapaTIR.FormShow(Sender: TObject);
begin
  inherited;
   cboMes.ItemIndex := DiasInUteis.ExtraiMes( Date ) - 1;
   DBspnAno.Value   := DiasInUteis.ExtraiAno( Date );
end;

procedure TcfgRelMapaTIR.FormCreate(Sender: TObject);
begin
  inherited;

  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  ComunsImobiliarioDB.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  CtrlMapaTIR := TCtrlMapaTIR.Create;
  CtrlMapaTIR.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  CtrlMoeda := TCtrlMoeda.Create;
  CtrlMoeda.InitializeAs( CtrlMapaTIR );

  cdsIndice.Data := CtrlMoeda.ListaMoeda( 0, False, True, 'P' );
  cdsIndice.Insert;
  cdsIndiceMOECODIGO.AsInteger := 0;
  cdsIndiceMOESIGLA.AsString   := '';
  cdsIndice.Post;

  cdsPatrosPlanos.Data := CtrlMapaTIR.RecuperaPatrosPlanos;

  dtmRelMapaTIR := TdtmRelMapaTIR.Create( Self );
end;

procedure TcfgRelMapaTIR.MsgErro(sMsg: string);
begin
  ShowMessage( sMsg );
end;

procedure TcfgRelMapaTIR.FormDestroy(Sender: TObject);
begin
  CtrlMapaTIR.Free;
  CtrlMoeda.Free;
  ComunsImobiliarioDB.Free;

  dtmRelMapaTIR.Free;
  inherited;
end;

function TcfgRelMapaTIR.VerificaPreenchimento: boolean;
var
  bEncontrouPlano : boolean;
begin
  Result := False;

  try
    if cboMes.ItemIndex < 0 then
      raise EValidacao.CreateVal('É necessário indicar o mês.', cboMes);

    if ( DBspnAno.Value <= 0 ) or ( DBspnAno.Text = '' ) then
      raise EValidacao.CreateVal('É necessário indicar o ano.', DBspnAno);

    if edtDia.Text = '' then
      raise EValidacao.CreateVal('É necessário indicar o dia de apropriação das despesas.', edtDia);

    bEncontrouPlano := False;
    cdsPatrosPlanos.DisableControls;
    cdsPatrosPlanos.First;
    while not cdsPatrosPlanos.Eof do
    begin
      if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
      begin
        if cdsPatrosPlanosINDICECORRECAO.AsInteger = 0 then
        begin
          cdsPatrosPlanos.EnableControls;
          raise EValidacao.CreateVal( 'É necessário indicar o índice de correção para todos as patrocinadoras/planos selecionados.', dblkpIndiceCorrecao );
        end;
        if cdsPatrosPlanosINDICEATUARIAL.AsInteger = 0 then
        begin
          cdsPatrosPlanos.EnableControls;
          raise EValidacao.CreateVal( 'É necessário indicar o índice atuarial para todos as patrocinadoras/planos selecionados.', dblkpIndiceAtuarial );
        end;
        bEncontrouPlano := True;
      end;
      cdsPatrosPlanos.Next;
    end;
    cdsPatrosPlanos.First;
    cdsPatrosPlanos.EnableControls;

    if not bEncontrouPlano then
      raise EValidacao.CreateVal('É necessário selecionar pelo menos uma patrocinadora/plano.', dbctrlgrd );

  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;

procedure TcfgRelMapaTIR.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if VerificaPreenchimento then
  begin
    DesabilitaBotoes;
    try
      frmEspera.Config('Aguarde', 'Processando dados do relatório...', False);
      frmEspera.Show;
      Application.ProcessMessages;

      frmEspera.Hide;
      frmEspera.Config('', '', False);

      ProcessaRelatorio;

      dtmRelMapaTIR.pplblRentAtuMes.Visible             := cbExibirTIRAtuarial.Checked;
      dtmRelMapaTIR.pplblRentAtuAno.Visible             := cbExibirTIRAtuarial.Checked;
      dtmRelMapaTIR.ppdbtxtRentAtuMes.Visible           := cbExibirTIRAtuarial.Checked;
      dtmRelMapaTIR.ppdbtxtRentAtuAno.Visible           := cbExibirTIRAtuarial.Checked;
      dtmRelMapaTIR.ppdbtxtRentAtuMesTot.Visible        := cbExibirTIRAtuarial.Checked;
      dtmRelMapaTIR.ppdbtxtRentAtuAnoTot.Visible        := cbExibirTIRAtuarial.Checked;
      dtmRelMapaTIR.ppdbtxtRentAtuMesTotFinal.Visible   := cbExibirTIRAtuarial.Checked;
      dtmRelMapaTIR.ppdbtxtRentAtuAnoTotFinal.Visible   := cbExibirTIRAtuarial.Checked;

      dtmRelMapaTIR.pplblRentAtuMesTot1.Visible         := cbExibirTIRAtuarial.Checked;
      dtmRelMapaTIR.pplblRentAtuAnoTot1.Visible         := cbExibirTIRAtuarial.Checked;
      dtmRelMapaTIR.pplblRentAtuMesTot2.Visible         := cbExibirTIRAtuarial.Checked;
      dtmRelMapaTIR.pplblRentAtuAnoTot2.Visible         := cbExibirTIRAtuarial.Checked;
      dtmRelMapaTIR.ppdbtxtRentAtuMesTotal.Visible      := cbExibirTIRAtuarial.Checked;
      dtmRelMapaTIR.ppdbtxtRentAtuAnoTotal.Visible      := cbExibirTIRAtuarial.Checked;
      dtmRelMapaTIR.ppdbtxtRentAtuMesTotalFinal.Visible := cbExibirTIRAtuarial.Checked;
      dtmRelMapaTIR.ppdbtxtRentAtuAnoTotalFinal.Visible := cbExibirTIRAtuarial.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      dtmRelMapaTIR.bCorlinha  := chkCorLinha.Checked;
      dtmRelMapaTIR.CorLinha   := cboCorLinha.SelectedColor;

      if cbExibirResumo.Checked then
           TFrmPreview.CreateModalPreview(Application,
                                          dtmRelMapaTIR.pprptResumo,
                                          dtmRelMapaTIR.pprptResumo.PrinterSetup.DocumentName)
      else TFrmPreview.CreateModalPreview(Application,
                                          dtmRelMapaTIR.pprpt,
                                          dtmRelMapaTIR.pprpt.PrinterSetup.DocumentName);

      Repaint;

    finally
      HabilitaBotoes;
    end;
  end;
end;

procedure TcfgRelMapaTIR.ProcessaRelatorio;
var
  i,
  iAux,
  iMes,
  iMesRec,
  iAnoRec,
  iTipoSegmento : integer;
  iDiasAno: Integer;
  iDiasPer: Integer;
  fFatAtuarialDia: Extended;
  dDtCotacao,
  dIniAno,
  dDtIni,
  dDtFim : TDateTime;
  sIdSegAnt,
  sIdSegAlienacao,
  sSegAlienacao,
  sTitAlienacao,
  sAnoMes,
  sPatroPlano,
  sPatroPlanoAnt : string;
  fSeqVal : array of extended;
  fFatorCorrecao,
  fAux,
  fUltReavalNominal,
  fUltReavalReal,
  fUltReavalAtuarial,
  fUltReavalAnoAnt,
  fUltReavalMesAnt,
  fTotalUltReavalAnoAnt,
  fTotalUltReavalMesAnt,
  fRentNominalAno,
  fRentNominalMes,
  fRentRealAno,
  fRentRealMes,
  fRentAtuarialMes,
  fRentAtuarialAno,
  fTotalRENTAB_MES_NOMINAL,
  fTotalRENTAB_MES_REAL,
  fTotalRENTAB_MES_ATUARIAL,
  fTotalRENTAB_ANO_NOMINAL,
  fTotalRENTAB_ANO_REAL,
  fTotalRENTAB_ANO_ATUARIAL,
  fFinalRENTAB_MES_NOMINAL,
  fFinalRENTAB_MES_REAL,
  fFinalRENTAB_MES_ATUARIAL,
  fFinalRENTAB_ANO_NOMINAL,
  fFinalRENTAB_ANO_REAL,
  fFinalRENTAB_ANO_ATUARIAL : extended;

  cdsTemp : TCMClientDataSet;

  procedure AdicionaValor( fValor : extended );
  begin
    SetLength( fSeqVal, length( fSeqVal ) + 1 );
    fSeqVal[ High( fSeqVal ) ] := fValor;
  end;

begin
  iMesRec := ( cboMes.ItemIndex + 1 );
  iAnoRec := StrToInt( IntToStr( Inteiro( DBspnAno.Value ) ) );
  dDtIni  := EncodeDate( iAnoRec, iMesRec, 1 );
  dDtFim  := DiasInUteis.UltDiaMes( iAnoRec, iMesRec );
  dIniAno := EncodeDate( DiasInUteis.ExtraiAno( dDtIni ), 1, 1 );

  sPatroPlano   := '';
  sSegAlienacao   := '';
  sIdSegAlienacao := '';
  cdsPatrosPlanos.DisableControls;

  try

    cdsPatrosPlanos.First;
    while not cdsPatrosPlanos.Eof do
    begin
      if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
      begin
        if sPatroPlano <> '' then sPatroPlano := sPatroPlano + ', ';
        sPatroPlano := sPatroPlano + QuotedStr( cdsPatrosPlanosIDPATRO.AsString + '/' +
                                                cdsPatrosPlanosIDPLANOPREV.AsString );
      end;
      cdsPatrosPlanos.Next;
    end;
    cdsPatrosPlanos.First;

    if rbGerencial.Checked then
      iTipoSegmento := 1
    else
      iTipoSegmento := 2;


    with dtmRelMapaTir do
    begin
      frmEspera.Hide;
      frmEspera.Config('Aguarde', 'Recuperando dados de imóveis...', False);
      frmEspera.Show;
      Application.ProcessMessages;


      //Recupera os dados do imóveis e a estrutura do relatório (dataset principal);
      cds.Close;
      cds.Data := CtrlMapaTIR.DadosRelatorio( iTipoSegmento,
                                              Sistema.IdEmpresa,
                                              ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                              ModuloImobiliario.InvestImob.iIdPaisCAF,
                                              dDtIni, dDtFim, sPatroPlano );

      frmEspera.Hide;
      frmEspera.Config('Aguarde', 'Recuperando dados de alienações...', False);
      frmEspera.Show;
      Application.ProcessMessages;

      //Recupera os dados de alienações
      cdsAlienacao.Data := CtrlMapaTIR.DadosAlienacao( dDtIni, dDtFim, sPatroPlano );

      frmEspera.Hide;
      frmEspera.Config('', '', False);

      frmEspera.Hide;
      frmEspera.Config('Aguarde', 'Recuperando dados de fundos imobiliários...', False);
      frmEspera.Show;
      Application.ProcessMessages;

      //Recupera os dados de fundos imobiliários
      cdsFundoImob.Data := CtrlMapaTIR.DadosFundoImob( dDtIni, dDtFim, sPatroPlano );

      frmEspera.Hide;
      frmEspera.Config('', '', False);

      //Se a alienação for considerada como renda, verifica em qual segmento será inserida
      if ( cbAlienacaoRenda.Checked )then
      begin
        cds.First;
        while not cds.Eof do
        begin
          if cdsFLGTIPOINTERNO.AsString = 'R' then
          begin
            sSegAlienacao   := cdsSEGMENTO.AsString;
            sIdSegAlienacao := cdsIDSEGMENTO.AsString;
            sTitAlienacao   := cdsTITULO.AsString;
          end;
          cds.Next;
        end;
      end
      else
      begin
        sSegAlienacao   := 'Alienação';
        sIdSegAlienacao := '-1';
        sTitAlienacao   := 'Contrato';
      end;

      if sSegAlienacao = '' then
      begin
        sSegAlienacao   := 'Segmento não especificado.';
        sIdSegAlienacao := '-1';
        sTitAlienacao   := 'Contrato';
      end;


      //Inclusão dos registros de alienações no dataset principal
      if not cdsAlienacao.IsEmpty then
      begin
        ProgressBar.Max       := cdsAlienacao.RecordCount;
        lblProgress.Visible   := True;
        lblProgress.Caption   := 'Processando alienações...';
        ProgressBar.Visible   := True;
        ProgressBar.Position  := 0;
        Repaint;
        Application.ProcessMessages;

        while not cdsAlienacao.Eof do
        begin
          cds.Append;
          cdsSEGMENTO.AsString           := sSegAlienacao;
          cdsIDSEGMENTO.AsString         := sIdSegAlienacao;
          cdsTITULO.AsString             := sTitAlienacao;
          cdsIMOVEL_MESTRE.AsString      := cdsAlienacao.FieldByName('CONNOME').AsString;
          cdsIDIMOVEL.AsInteger          := cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger;
          cdsORDEM.AsInteger             := iff( cbAlienacaoRenda.Checked, 1, 2 );
          cdsORIGEM.AsInteger            := 2;
          cdsVALOR_CONTABIL.AsFloat      := ComunsImobiliario.Arredonda(CtrlMapaTIR.CalcSaldoDevedor( cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger, -1, dDtFim ) / 1000,0);
          cdsULTREAVALIA.AsFloat         := cdsVALOR_CONTABIL.AsFloat;
          cdsRECEITA_LIQUIDA_MES.AsFloat := cdsAlienacao.FieldByName('RECEITA_LIQUIDA_MES').AsFloat;
          cdsRECEITA_LIQUIDA_ANO.AsFloat := cdsAlienacao.FieldByName('RECEITA_LIQUIDA_ANO').AsFloat;
          cds.Post;

          cdsAlienacao.Next;

          ProgressBar.StepIt;
          Application.ProcessMessages;
        end;
      end;


      //Inclusão dos registros dos fundos imobiliários no dataset principal
      if not cdsFundoImob.IsEmpty then
      begin
        ProgressBar.Max       := cdsFundoImob.RecordCount;
        lblProgress.Visible   := True;
        lblProgress.Caption   := 'Processando fundos imobiliários...';
        ProgressBar.Visible   := True;
        ProgressBar.Position  := 0;
        Repaint;
        Application.ProcessMessages;

        while not cdsFundoImob.Eof do
        begin
          cds.Append;
          cdsSEGMENTO.AsString           := 'Fundos Imobiliários';
          cdsIDSEGMENTO.AsString         := '-2';
          cdsTITULO.AsString             := 'Fundo';
          cdsIMOVEL_MESTRE.AsString      := cdsFundoImob.FieldByName('DESCFUNDOINVEST').AsString;
          cdsIDIMOVEL.AsInteger          := cdsFundoImob.FieldByName('IDFUNDOINVEST').AsInteger;
          cdsORDEM.AsInteger             := 3;
          cdsORIGEM.AsInteger            := 3;
          cdsVALOR_CONTABIL.AsFloat      := cdsFundoImob.FieldByName('VALOR_CONTABIL').AsFloat;
          cdsULTREAVALIA.AsFloat         := cdsFundoImob.FieldByName('ULTREAVALIA').AsFloat;
          cdsRECEITA_LIQUIDA_MES.AsFloat := cdsFundoImob.FieldByName('RECEITA_LIQUIDA_MES').AsFloat;
          cdsRECEITA_LIQUIDA_ANO.AsFloat := cdsFundoImob.FieldByName('RECEITA_LIQUIDA_ANO').AsFloat;
          cds.Post;

          cdsFundoImob.Next;

          ProgressBar.StepIt;
          Application.ProcessMessages;
        end;
      end;


      //Se não houver nenhum dado de imóveis, alienações ou fundos imobiliários não executa nada.
      if cds.IsEmpty then
        ShowMessage( 'Nenhum dado foi retornado com esta parametrização.' )
      else
      begin

        frmEspera.Config('Aguarde', 'Recuperando receita líquida mensal...', False);
        frmEspera.Show;
        Application.ProcessMessages;

        //Recuperando receitas líquidas dos imóveis
        cdsReceitaLiquida.Close;
        cdsReceitaLiquida.Filter := '';
        cdsReceitaLiquida.Filtered := False;
        cdsReceitaLiquida.Data := CtrlMapaTIR.ReceitaLiquidaMesAMes( iTipoSegmento, dDtFim, True, True, sPatroPlano );

        frmEspera.Config('Aguarde', 'Recuperando receitas de alienações...', False);
        frmEspera.Show;
        Application.ProcessMessages;

        //Recuperando receitas líquidas das alienações
        cdsReceitaLiquidaAlienacao.Close;
        cdsReceitaLiquidaAlienacao.Filter := '';
        cdsReceitaLiquidaAlienacao.Filtered := False;
        cdsReceitaLiquidaAlienacao.Data := CtrlMapaTIR.ReceitaAlienacaoMesAMes( dDtFim, sPatroPlano );

        frmEspera.Hide;
        frmEspera.Config('', '', False);


        //Inclusão dos registros de receitas líquidas de alienações no dataset
        //de receitas líquidas de imóveis
        if not cdsReceitaLiquidaAlienacao.IsEmpty then
        begin
          ProgressBar.Max       := cdsReceitaLiquidaAlienacao.RecordCount;
          lblProgress.Visible   := True;
          lblProgress.Caption   := 'Processando receitas de alienações...';
          ProgressBar.Visible   := True;
          ProgressBar.Position  := 0;
          Repaint;
          Application.ProcessMessages;

          while not cdsReceitaLiquidaAlienacao.Eof do
          begin
            cdsReceitaLiquida.Append;
            cdsReceitaLiquida.FieldByName('IDSEGMENTO').AsString      := sIdSegAlienacao;
            cdsReceitaLiquida.FieldByName('IDIMOVELMESTRE').AsInteger := cdsReceitaLiquidaAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger;
            cdsReceitaLiquida.FieldByName('ANOMES').AsString          := cdsReceitaLiquidaAlienacao.FieldByName('ANOMES').AsString;
            cdsReceitaLiquida.FieldByName('IDPATRO').AsInteger        := cdsReceitaLiquidaAlienacao.FieldByName('IDPATRO').AsInteger;
            cdsReceitaLiquida.FieldByName('IDPLANOPREV').AsInteger    := cdsReceitaLiquidaAlienacao.FieldByName('IDPLANOPREV').AsInteger;
            cdsReceitaLiquida.FieldByName('ORIGEM').AsInteger         := 2;
            cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat   := cdsReceitaLiquidaAlienacao.FieldByName('RECEITALIQUIDA').AsFloat;
            cdsReceitaLiquida.Post;

            cdsReceitaLiquidaAlienacao.Next;

            ProgressBar.StepIt;
            Application.ProcessMessages;
          end;

        end;

        frmEspera.Config('Aguarde', 'Recuperando receitas de fundos imobiliários...', False);
        frmEspera.Show;
        Application.ProcessMessages;

        //Recuperando receitas líquidas dos fundos imobiliários
        cdsReceitaFundoImob.Close;
        cdsReceitaFundoImob.Filter := '';
        cdsReceitaFundoImob.Filtered := False;
        cdsReceitaFundoImob.Data := CtrlMapaTIR.ReceitaFundoImobMesAMes( dDtFim, sPatroPlano );

        frmEspera.Hide;
        frmEspera.Config('', '', False);

        //Inclusão dos registros de receitas líquidas de fundos imobiliários
        //no dataset de receitas líquidas de imóveis
        if not cdsReceitaFundoImob.IsEmpty then
        begin
          ProgressBar.Max       := cdsReceitaFundoImob.RecordCount;
          lblProgress.Visible   := True;
          lblProgress.Caption   := 'Processando receitas de fundos imobiliários...';
          ProgressBar.Visible   := True;
          ProgressBar.Position  := 0;
          Repaint;
          Application.ProcessMessages;

          while not cdsReceitaFundoImob.Eof do
          begin
            cdsReceitaLiquida.Append;
            cdsReceitaLiquida.FieldByName('IDSEGMENTO').AsString      := '-2';
            cdsReceitaLiquida.FieldByName('IDIMOVELMESTRE').AsInteger := cdsReceitaFundoImob.FieldByName('IDFUNDOINVEST').AsInteger;
            cdsReceitaLiquida.FieldByName('ANOMES').AsString          := cdsReceitaFundoImob.FieldByName('ANOMES').AsString;
            cdsReceitaLiquida.FieldByName('IDPATRO').AsInteger        := cdsReceitaFundoImob.FieldByName('IDPATRO').AsInteger;
            cdsReceitaLiquida.FieldByName('IDPLANOPREV').AsInteger    := cdsReceitaFundoImob.FieldByName('IDPLANOPREV').AsInteger;
            cdsReceitaLiquida.FieldByName('ORIGEM').AsInteger         := 3;
            cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat   := cdsReceitaFundoImob.FieldByName('RECEITALIQUIDA').AsFloat;
            cdsReceitaLiquida.Post;

            cdsReceitaFundoImob.Next;

            ProgressBar.StepIt;
            Application.ProcessMessages;
          end;

        end;

        frmEspera.Config('Aguarde', 'Recuperando últimas avaliações de imóveis...', False);
        frmEspera.Show;

        //Recuperando dados das últimas avaliações no final do mês atual, final do mês anterior e no final do ano anterior
        cdsUltReavaliacao.Data       := CtrlMapaTIR.RecuperaUltAvaliacaoData( iTipoSegmento, dDtFim, sPatroPlano );
        cdsUltReavaliacaoMesAnt.Data := CtrlMapaTIR.RecuperaUltAvaliacaoData( iTipoSegmento, dDtIni  - 1, sPatroPlano );
        cdsUltReavaliacaoAnoAnt.Data := CtrlMapaTIR.RecuperaUltAvaliacaoData( iTipoSegmento, dIniAno - 1, sPatroPlano );

        frmEspera.Hide;
        frmEspera.Config('', '', False);

        ProgressBar.Max       := cdsAlienacao.RecordCount;
        lblProgress.Visible   := True;
        lblProgress.Caption   := 'Processando saldos de alienações...';
        ProgressBar.Visible   := True;
        ProgressBar.Position  := 0;
        Repaint;
        Application.ProcessMessages;


        //Recuperando saldos devedores de alienações, considerando-os como reavaliações
        cdsAlienacao.First;
        while not cdsAlienacao.Eof do
        begin

          //Recupera saldo do ano anterior...
          fUltReavalAnoAnt := CtrlMapaTIR.CalcSaldoDevedor( cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger, -1, dIniAno - 1 );
          //...e o rateia pelos planos e patrocinadoras selecionados
          cdsSaldoAlienPlanoPatro.Close;
          cdsSaldoAlienPlanoPatro.Data := CtrlMapaTIR.RateiaSaldoAlienacao( cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger, fUltReavalAnoAnt );
          cdsSaldoAlienPlanoPatro.First;
          while not cdsSaldoAlienPlanoPatro.Eof do
          begin
            cdsPatrosPlanos.First;
            while not cdsPatrosPlanos.Eof do
            begin
              if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
              begin
                if   ( cdsSaldoAlienPlanoPatro.FieldByName('IDPATRO').AsInteger     = cdsPatrosPlanosIDPATRO.AsInteger     )
                 and ( cdsSaldoAlienPlanoPatro.FieldByName('IDPLANOPREV').AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger ) then
                begin
                  cdsUltReavaliacaoAnoAnt.Append;
                  cdsUltReavaliacaoAnoAnt.FieldByName('IDSEGMENTO').AsString      := sIdSegAlienacao;
                  cdsUltReavaliacaoAnoAnt.FieldByName('IDIMOVELMESTRE').AsInteger := cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger;
                  cdsUltReavaliacaoAnoAnt.FieldByName('IDPATRO').AsInteger        := cdsSaldoAlienPlanoPatro.FieldByName('IDPATRO').AsInteger;
                  cdsUltReavaliacaoAnoAnt.FieldByName('IDPLANOPREV').AsInteger    := cdsSaldoAlienPlanoPatro.FieldByName('IDPLANOPREV').AsInteger;
                  cdsUltReavaliacaoAnoAnt.FieldByName('ORIGEM').AsInteger         := 2;
                  cdsUltReavaliacaoAnoAnt.FieldByName('ULTREAVALIA').AsFloat      := cdsSaldoAlienPlanoPatro.FieldByName('SALDO').AsFloat;
                  cdsUltReavaliacaoAnoAnt.Post;
                end;
              end;
              cdsPatrosPlanos.Next;
            end;
            cdsSaldoAlienPlanoPatro.Next;
          end;


          //Recupera saldo do mês anterior...
          fUltReavalMesAnt := CtrlMapaTIR.CalcSaldoDevedor( cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger, -1, dDtIni  - 1 );
          //...e o rateia pelos planos e patrocinadoras selecionados
          cdsSaldoAlienPlanoPatro.Close;
          cdsSaldoAlienPlanoPatro.Data := CtrlMapaTIR.RateiaSaldoAlienacao( cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger, fUltReavalMesAnt );
          cdsSaldoAlienPlanoPatro.First;
          while not cdsSaldoAlienPlanoPatro.Eof do
          begin
            cdsPatrosPlanos.First;
            while not cdsPatrosPlanos.Eof do
            begin
              if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
              begin
                if   ( cdsSaldoAlienPlanoPatro.FieldByName('IDPATRO').AsInteger     = cdsPatrosPlanosIDPATRO.AsInteger     )
                 and ( cdsSaldoAlienPlanoPatro.FieldByName('IDPLANOPREV').AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger ) then
                begin
                  cdsUltReavaliacaoMesAnt.Append;
                  cdsUltReavaliacaoMesAnt.FieldByName('IDSEGMENTO').AsString      := sIdSegAlienacao;
                  cdsUltReavaliacaoMesAnt.FieldByName('IDIMOVELMESTRE').AsInteger := cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger;
                  cdsUltReavaliacaoMesAnt.FieldByName('IDPATRO').AsInteger        := cdsSaldoAlienPlanoPatro.FieldByName('IDPATRO').AsInteger;
                  cdsUltReavaliacaoMesAnt.FieldByName('IDPLANOPREV').AsInteger    := cdsSaldoAlienPlanoPatro.FieldByName('IDPLANOPREV').AsInteger;
                  cdsUltReavaliacaoMesAnt.FieldByName('ORIGEM').AsInteger         := 2;
                  cdsUltReavaliacaoMesAnt.FieldByName('ULTREAVALIA').AsFloat      := cdsSaldoAlienPlanoPatro.FieldByName('SALDO').AsFloat;
                  cdsUltReavaliacaoMesAnt.Post;
                end;
              end;
              cdsPatrosPlanos.Next;
            end;
            cdsSaldoAlienPlanoPatro.Next;
          end;


          //Recupera último saldo no mês...
          fUltReavalNominal := CtrlMapaTIR.CalcSaldoDevedor( cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger, -1, dDtFim );
          //...e o rateia pelos planos e patrocinadoras selecionados
          cdsSaldoAlienPlanoPatro.Close;
          cdsSaldoAlienPlanoPatro.Data := CtrlMapaTIR.RateiaSaldoAlienacao( cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger, fUltReavalNominal );
          cdsSaldoAlienPlanoPatro.First;
          while not cdsSaldoAlienPlanoPatro.Eof do
          begin
            cdsPatrosPlanos.First;
            while not cdsPatrosPlanos.Eof do
            begin
              if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
              begin
                if   ( cdsSaldoAlienPlanoPatro.FieldByName('IDPATRO').AsInteger     = cdsPatrosPlanosIDPATRO.AsInteger     )
                 and ( cdsSaldoAlienPlanoPatro.FieldByName('IDPLANOPREV').AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger ) then
                begin
                  cdsUltReavaliacao.Append;
                  cdsUltReavaliacao.FieldByName('IDSEGMENTO').AsString      := sIdSegAlienacao;
                  cdsUltReavaliacao.FieldByName('IDIMOVELMESTRE').AsInteger := cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger;
                  cdsUltReavaliacao.FieldByName('IDPATRO').AsInteger        := cdsSaldoAlienPlanoPatro.FieldByName('IDPATRO').AsInteger;
                  cdsUltReavaliacao.FieldByName('IDPLANOPREV').AsInteger    := cdsSaldoAlienPlanoPatro.FieldByName('IDPLANOPREV').AsInteger;
                  cdsUltReavaliacao.FieldByName('ORIGEM').AsInteger         := 2;
                  cdsUltReavaliacao.FieldByName('ULTREAVALIA').AsFloat      := cdsSaldoAlienPlanoPatro.FieldByName('SALDO').AsFloat;
                  cdsUltReavaliacao.Post;
                end;
              end;
              cdsPatrosPlanos.Next;
            end;
            cdsSaldoAlienPlanoPatro.Next;
          end;

          cdsAlienacao.Next;

          ProgressBar.StepIt;
          Application.ProcessMessages;
        end;



        //Recuperando saldos de fundos imobiliários no ano anterior
        cdsSaldoFundoImob.Data := CtrlMapaTIR.RecuperaUltAvalFundoImob( dIniAno - 1, sPatroPlano );
        ProgressBar.Max        := cdsSaldoFundoImob.RecordCount;
        lblProgress.Visible    := True;
        lblProgress.Caption    := 'Processando saldos dos fundos imobiliários no ano anterior...';
        ProgressBar.Visible    := True;
        ProgressBar.Position   := 0;
        Repaint;
        Application.ProcessMessages;
        cdsSaldoFundoImob.First;
        while not cdsSaldoFundoImob.Eof do
        begin
          cdsUltReavaliacaoAnoAnt.Append;
          cdsUltReavaliacaoAnoAnt.FieldByName('IDSEGMENTO').AsString      := '-2';
          cdsUltReavaliacaoAnoAnt.FieldByName('IDIMOVELMESTRE').AsInteger := cdsSaldoFundoImob.FieldByName('IDFUNDOINVEST').AsInteger;
          cdsUltReavaliacaoAnoAnt.FieldByName('IDPATRO').AsInteger        := cdsSaldoFundoImob.FieldByName('IDPATRO').AsInteger;
          cdsUltReavaliacaoAnoAnt.FieldByName('IDPLANOPREV').AsInteger    := cdsSaldoFundoImob.FieldByName('IDPLANOPREV').AsInteger;
          cdsUltReavaliacaoAnoAnt.FieldByName('ORIGEM').AsInteger         := 3;
          cdsUltReavaliacaoAnoAnt.FieldByName('ULTREAVALIA').AsFloat      := cdsSaldoFundoImob.FieldByName('ULTREAVALIA').AsFloat;
          cdsUltReavaliacaoAnoAnt.Post;
          cdsSaldoFundoImob.Next;
          ProgressBar.StepIt;
          Application.ProcessMessages;
        end;

        //Recuperando saldos de fundos imobiliários no mês anterior
        cdsSaldoFundoImob.Data := CtrlMapaTIR.RecuperaUltAvalFundoImob( dDtIni - 1, sPatroPlano );
        ProgressBar.Max        := cdsSaldoFundoImob.RecordCount;
        lblProgress.Visible    := True;
        lblProgress.Caption    := 'Processando saldos dos fundos imobiliários no mês anterior...';
        ProgressBar.Visible    := True;
        ProgressBar.Position   := 0;
        Repaint;
        Application.ProcessMessages;
        cdsSaldoFundoImob.First;
        while not cdsSaldoFundoImob.Eof do
        begin
          cdsUltReavaliacaoMesAnt.Append;
          cdsUltReavaliacaoMesAnt.FieldByName('IDSEGMENTO').AsString      := '-2';
          cdsUltReavaliacaoMesAnt.FieldByName('IDIMOVELMESTRE').AsInteger := cdsSaldoFundoImob.FieldByName('IDFUNDOINVEST').AsInteger;
          cdsUltReavaliacaoMesAnt.FieldByName('IDPATRO').AsInteger        := cdsSaldoFundoImob.FieldByName('IDPATRO').AsInteger;
          cdsUltReavaliacaoMesAnt.FieldByName('IDPLANOPREV').AsInteger    := cdsSaldoFundoImob.FieldByName('IDPLANOPREV').AsInteger;
          cdsUltReavaliacaoMesAnt.FieldByName('ORIGEM').AsInteger         := 3;
          cdsUltReavaliacaoMesAnt.FieldByName('ULTREAVALIA').AsFloat      := cdsSaldoFundoImob.FieldByName('ULTREAVALIA').AsFloat;
          cdsUltReavaliacaoMesAnt.Post;
          cdsSaldoFundoImob.Next;
          ProgressBar.StepIt;
          Application.ProcessMessages;
        end;

        //Recuperando saldos de fundos imobiliários no mês
        cdsSaldoFundoImob.Data := CtrlMapaTIR.RecuperaUltAvalFundoImob( dDtFim, sPatroPlano );
        ProgressBar.Max        := cdsSaldoFundoImob.RecordCount;
        lblProgress.Visible    := True;
        lblProgress.Caption    := 'Processando saldos dos fundos imobiliários no mês...';
        ProgressBar.Visible    := True;
        ProgressBar.Position   := 0;
        Repaint;
        Application.ProcessMessages;
        cdsSaldoFundoImob.First;
        while not cdsSaldoFundoImob.Eof do
        begin
          cdsUltReavaliacao.Append;
          cdsUltReavaliacao.FieldByName('IDSEGMENTO').AsString      := '-2';
          cdsUltReavaliacao.FieldByName('IDIMOVELMESTRE').AsInteger := cdsSaldoFundoImob.FieldByName('IDFUNDOINVEST').AsInteger;
          cdsUltReavaliacao.FieldByName('IDPATRO').AsInteger        := cdsSaldoFundoImob.FieldByName('IDPATRO').AsInteger;
          cdsUltReavaliacao.FieldByName('IDPLANOPREV').AsInteger    := cdsSaldoFundoImob.FieldByName('IDPLANOPREV').AsInteger;
          cdsUltReavaliacao.FieldByName('ORIGEM').AsInteger         := 3;
          cdsUltReavaliacao.FieldByName('ULTREAVALIA').AsFloat      := cdsSaldoFundoImob.FieldByName('ULTREAVALIA').AsFloat;
          cdsUltReavaliacao.Post;
          cdsSaldoFundoImob.Next;
          ProgressBar.StepIt;
          Application.ProcessMessages;
        end;


        //Cálculo efetivo da rentabilidade
        ProgressBar.Max       := cds.RecordCount;
        lblProgress.Visible   := True;
        lblProgress.Caption   := 'Calculando rentabilidade...';
        ProgressBar.Visible   := True;
        ProgressBar.Position  := 0;
        Repaint;
        Application.ProcessMessages;

        // Calcula Fator Atuarial ao dia
        iDiasAno := Inteiro(DiasUteis.UltDiaMes(Inteiro( DBspnAno.Value ),12) -
                            StrToDate('01/01/' + IntToStr(Inteiro(DBspnAno.Value))) + 1 );

        cds.First;
        while not cds.Eof do
        begin

          fRentNominalAno   := 0;
          fRentNominalMes   := 0;
          fRentRealAno      := 0;
          fRentRealMes      := 0;
          fRentAtuarialMes  := 0;
          fRentAtuarialAno  := 0;
          fUltReavalNominal := 0;
          fUltReavalAnoAnt  := 0;
          fUltReavalMesAnt  := 0;

          fUltReavalNominal := 0;
          cdsUltReavaliacao.First;
          while not cdsUltReavaliacao.Eof do
          begin
            if   ( cdsUltReavaliacaoIDIMOVELMESTRE.AsInteger = cdsIDIMOVEL.AsInteger  )
             and ( cdsUltReavaliacaoORIGEM.AsInteger         = cdsORIGEM.AsInteger    )
             and ( cdsUltReavaliacaoIDSEGMENTO.AsString      = cdsIDSEGMENTO.AsString ) then
            begin
              cdsPatrosPlanos.First;
              while not cdsPatrosPlanos.Eof do
              begin
                if   ( cdsUltReavaliacaoIDPATRO.AsInteger     = cdsPatrosPlanosIDPATRO.AsInteger     )
                 and ( cdsUltReavaliacaoIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger )
                 and ( cdsPatrosPlanosFLGUSA.AsInteger        = 1                                    ) then
                  fUltReavalNominal := fUltReavalNominal + cdsUltReavaliacaoULTREAVALIA.AsFloat;
                cdsPatrosPlanos.Next;
              end;
            end;
            cdsUltReavaliacao.Next;
          end;

          fUltReavalMesAnt := 0;
          cdsUltReavaliacaoMesAnt.First;
          while not cdsUltReavaliacaoMesAnt.Eof do
          begin
            if   ( cdsUltReavaliacaoMesAntIDIMOVELMESTRE.AsInteger = cdsIDIMOVEL.AsInteger  )
             and ( cdsUltReavaliacaoMesAntORIGEM.AsInteger         = cdsORIGEM.AsInteger    )
             and ( cdsUltReavaliacaoMesAntIDSEGMENTO.AsString      = cdsIDSEGMENTO.AsString ) then
            begin
              cdsPatrosPlanos.First;
              while not cdsPatrosPlanos.Eof do
              begin
                if   ( cdsUltReavaliacaoMesAntIDPATRO.AsInteger     = cdsPatrosPlanosIDPATRO.AsInteger     )
                 and ( cdsUltReavaliacaoMesAntIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger )
                 and ( cdsPatrosPlanosFLGUSA.AsInteger              = 1                                    ) then
                  fUltReavalMesAnt := fUltReavalMesAnt + cdsUltReavaliacaoMesAntULTREAVALIA.AsFloat;
                cdsPatrosPlanos.Next;
              end;
            end;
            cdsUltReavaliacaoMesAnt.Next;
          end;

          fUltReavalAnoAnt := 0;
          cdsUltReavaliacaoAnoAnt.First;
          while not cdsUltReavaliacaoAnoAnt.Eof do
          begin
            if   ( cdsUltReavaliacaoAnoAntIDIMOVELMESTRE.AsInteger = cdsIDIMOVEL.AsInteger  )
             and ( cdsUltReavaliacaoAnoAntORIGEM.AsInteger         = cdsORIGEM.AsInteger    )
             and ( cdsUltReavaliacaoAnoAntIDSEGMENTO.AsString      = cdsIDSEGMENTO.AsString ) then
            begin
              cdsPatrosPlanos.First;
              while not cdsPatrosPlanos.Eof do
              begin
                if   ( cdsUltReavaliacaoAnoAntIDPATRO.AsInteger     = cdsPatrosPlanosIDPATRO.AsInteger     )
                 and ( cdsUltReavaliacaoAnoAntIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger )
                 and ( cdsPatrosPlanosFLGUSA.AsInteger              = 1                                    ) then
                  fUltReavalAnoAnt := fUltReavalAnoAnt + cdsUltReavaliacaoAnoAntULTREAVALIA.AsFloat;
                cdsPatrosPlanos.Next;
              end;
            end;
            cdsUltReavaliacaoAnoAnt.Next;
          end;


          if fUltReavalNominal <> 0 then
          begin

            //----- Início do cálculo de rentabilidade nominal mensal

            cdsReceitaLiquida.Filtered := False;
            cdsReceitaLiquida.Filter := '( IDIMOVELMESTRE = ' + cdsIDIMOVEL.AsString + ' ) and ' +
                                        '( ORIGEM = ' + cdsORIGEM.AsString + ' ) and ' +
                                        '( IDSEGMENTO = ' + QuotedStr( cdsIDSEGMENTO.AsString ) + ' ) and ' +
                                        '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYYMM', dDtIni ) ) + ' )';
            cdsReceitaLiquida.Filtered := True;

            SetLength( fSeqVal, 0 );

            AdicionaValor( fUltReavalMesAnt * -1 );

            fAux := 0;
            cdsReceitaLiquida.First;
            while not cdsReceitaLiquida.Eof do
            begin
              fAux := fAux + cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat;
              cdsReceitaLiquida.Next;
            end;
            AdicionaValor( fAux );

            AdicionaValor( fUltReavalNominal );

            fRentNominalMes := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dDtIni, DiasInUteis.ExtraiDia( dDtFim ), StrToInt( edtDia.Text ) );




            //----- Início do cálculo de  rentabilidade nominal anual
            SetLength( fSeqVal, 0 );

            AdicionaValor( fUltReavalAnoAnt * -1 );

            for i := 1 to DiasInUteis.ExtraiMes( dDtIni ) do
            begin
              fAux := 0;
              cdsPatrosPlanos.First;
              while not cdsPatrosPlanos.Eof do
              begin
                if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
                begin
                  cdsReceitaLiquida.Filtered := False;
                  cdsReceitaLiquida.Filter := '( IDIMOVELMESTRE = ' + cdsIDIMOVEL.AsString + ' ) and ' +
                                              '( ORIGEM = ' + cdsORIGEM.AsString + ' ) and ' +
                                              '( IDSEGMENTO = ' + QuotedStr( cdsIDSEGMENTO.AsString ) + ' ) and ' +
                                              '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYY', dDtIni ) + FormatFloat( '00', i ) ) + ' ) and ' +
                                              '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                              '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
                  cdsReceitaLiquida.Filtered := True;
                  fAux := fAux + cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat;
                end;
                cdsPatrosPlanos.Next;
              end;
              AdicionaValor( fAux );
            end;

            AdicionaValor( fUltReavalNominal );

            fRentNominalAno := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dIniAno, Inteiro( dDtFim - ( dIniAno - 1 ) ), StrToInt( edtDia.Text ) );




            //----- Início do cálculo de rentabilidade real mensal
            SetLength( fSeqVal, 0 );

            fAux := 0;
            cdsUltReavaliacaoMesAnt.First;
            while not cdsUltReavaliacaoMesAnt.Eof do
            begin
              if   ( cdsUltReavaliacaoMesAntIDIMOVELMESTRE.AsInteger = cdsIDIMOVEL.AsInteger )
               and ( cdsUltReavaliacaoMesAntORIGEM.AsInteger         = cdsORIGEM.AsInteger   )
               and ( cdsUltReavaliacaoMesAntIDSEGMENTO.AsString      = cdsIDSEGMENTO.AsString ) then
              begin
                cdsPatrosPlanos.First;
                while not cdsPatrosPlanos.Eof do
                begin
                  if   ( cdsUltReavaliacaoMesAntIDPATRO.AsInteger     = cdsPatrosPlanosIDPATRO.AsInteger     )
                   and ( cdsUltReavaliacaoMesAntIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger )
                   and ( cdsPatrosPlanosFLGUSA.AsInteger              = 1                                    ) then
                  begin
                    dDtCotacao := dDtIni - 1;

                    fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICECORRECAO.AsInteger,
                                                                         dIniAno, dDtCotacao, True, 0, True );

                    fAux := fAux + ( cdsUltReavaliacaoMesAntULTREAVALIA.AsFloat / fFatorCorrecao );
                   end;
                  cdsPatrosPlanos.Next;
                end;
              end;
              cdsUltReavaliacaoMesAnt.Next;
            end;

            AdicionaValor( fAux * -1 );

            fAux := 0;
            cdsPatrosPlanos.First;
            while not cdsPatrosPlanos.Eof do
            begin
              if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
              begin
                cdsReceitaLiquida.Filtered := False;
                cdsReceitaLiquida.Filter := '( IDIMOVELMESTRE = ' + cdsIDIMOVEL.AsString + ' ) and ' +
                                            '( ORIGEM = ' + cdsORIGEM.AsString + ' ) and ' +
                                            '( IDSEGMENTO = ' + QuotedStr( cdsIDSEGMENTO.AsString ) + ' ) and ' +
                                            '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYYMM', dDtIni ) ) + ' ) and ' +
                                            '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                            '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
                cdsReceitaLiquida.Filtered := True;

                dDtCotacao := EncodeDate( DiasInUteis.ExtraiAno( dDtIni ), DiasInUteis.ExtraiMes( dDtIni ), StrToInt( edtDia.Text ) );

                fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICECORRECAO.AsInteger,
                                                                     dIniAno, dDtCotacao, True, 0, True );

                fAux := fAux + ( cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat / fFatorCorrecao );
              end;

              cdsPatrosPlanos.Next;
            end;

            AdicionaValor( fAux );

            fAux := 0;
            cdsUltReavaliacao.First;
            while not cdsUltReavaliacao.Eof do
            begin
              cdsPatrosPlanos.First;
              while not cdsPatrosPlanos.Eof do
              begin
                if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
                begin
                  if   ( cdsUltReavaliacaoIDIMOVELMESTRE.AsInteger = cdsIDIMOVEL.AsInteger )
                   and ( cdsUltReavaliacaoORIGEM.AsInteger         = cdsORIGEM.AsInteger )
                   and ( cdsUltReavaliacaoIDSEGMENTO.AsString      = cdsIDSEGMENTO.AsString )
                   and ( cdsUltReavaliacaoIDPATRO.AsInteger        = cdsPatrosPlanosIDPATRO.AsInteger )
                   and ( cdsUltReavaliacaoIDPLANOPREV.AsInteger    = cdsPatrosPlanosIDPLANOPREV.AsInteger ) then
                  begin
                    dDtCotacao := dDtFim;

                    fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICECORRECAO.AsInteger,
                                                                         dIniAno, dDtCotacao, True, 0, True );

                    fAux := fAux + ( cdsUltReavaliacaoULTREAVALIA.AsFloat / fFatorCorrecao );
                  end;
                end;
                cdsPatrosPlanos.Next;
              end;
              cdsUltReavaliacao.Next;
            end;

            AdicionaValor( fAux );

            fRentRealMes := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dDtIni, DiasInUteis.ExtraiDia( dDtFim ), StrToInt( edtDia.Text ) );




            //----- Início do cálculo de rentabilidade real anual
            SetLength( fSeqVal, 0 );

            AdicionaValor( fUltReavalAnoAnt * -1 );

            for i := 1 to DiasInUteis.ExtraiMes( dDtIni ) do
            begin
              fAux := 0;
              cdsPatrosPlanos.First;
              while not cdsPatrosPlanos.Eof do
              begin
                if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
                begin
                  cdsReceitaLiquida.Filtered := False;
                  cdsReceitaLiquida.Filter := '( IDIMOVELMESTRE = ' + cdsIDIMOVEL.AsString + ' ) and ' +
                                              '( ORIGEM = ' + cdsORIGEM.AsString + ' ) and ' +
                                              '( IDSEGMENTO = ' + QuotedStr( cdsIDSEGMENTO.AsString ) + ' ) and ' +
                                              '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYY', dDtIni ) + FormatFloat( '00', i ) ) + ' ) and ' +
                                              '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                              '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
                  cdsReceitaLiquida.Filtered := True;

                  dDtCotacao := EncodeDate( DiasInUteis.ExtraiAno( dDtIni ), i, StrToInt( edtDia.Text ) );

                  fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICECORRECAO.AsInteger,
                                                                       dIniAno, dDtCotacao, True, 0, True );

                  fAux := fAux + ( cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat / fFatorCorrecao );
                end;

                cdsPatrosPlanos.Next;
              end;
              AdicionaValor( fAux );
            end;

            fUltReavalReal := 0;
            cdsUltReavaliacao.First;
            while not cdsUltReavaliacao.Eof do
            begin
              cdsPatrosPlanos.First;
              while not cdsPatrosPlanos.Eof do
              begin
                if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
                begin
                  if   ( cdsUltReavaliacaoIDIMOVELMESTRE.AsInteger = cdsIDIMOVEL.AsInteger )
                   and ( cdsUltReavaliacaoORIGEM.AsInteger         = cdsORIGEM.AsInteger )
                   and ( cdsUltReavaliacaoIDSEGMENTO.AsString      = cdsIDSEGMENTO.AsString )
                   and ( cdsUltReavaliacaoIDPATRO.AsInteger        = cdsPatrosPlanosIDPATRO.AsInteger )
                   and ( cdsUltReavaliacaoIDPLANOPREV.AsInteger    = cdsPatrosPlanosIDPLANOPREV.AsInteger ) then
                  begin

                    // Corrige a reavaliação até o último dia do mês de competencia selecionado
                    dDtCotacao := DiasUteis.UltDiaMes( DiasUteis.ExtraiAno(dDtIni), DiasUteis.ExtraiMes(dDtIni));

                    fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICECORRECAO.AsInteger,
                                                                         dIniAno, dDtCotacao, True, 0, True );

                    fUltReavalReal := fUltReavalReal + ( cdsUltReavaliacaoULTREAVALIA.AsFloat / fFatorCorrecao );
                  end;
                end;
                cdsPatrosPlanos.Next;
              end;
              cdsUltReavaliacao.Next;
            end;

            AdicionaValor( fUltReavalReal );

            fRentRealAno := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dIniAno,  Inteiro( dDtFim - ( dIniAno - 1 ) ), StrToInt( edtDia.Text ) );


            if cbExibirTIRAtuarial.Checked then
            begin

              //----- Início do cálculo de  rentabilidade atuarial mensal
              SetLength( fSeqVal, 0 );

              fAux := 0;
              cdsUltReavaliacaoMesAnt.First;
              while not cdsUltReavaliacaoMesAnt.Eof do
              begin
                if   ( cdsUltReavaliacaoMesAntIDIMOVELMESTRE.AsInteger = cdsIDIMOVEL.AsInteger  )
                 and ( cdsUltReavaliacaoMesAntORIGEM.AsInteger         = cdsORIGEM.AsInteger    )
                 and ( cdsUltReavaliacaoMesAntIDSEGMENTO.AsString      = cdsIDSEGMENTO.AsString ) then
                begin
                  cdsPatrosPlanos.First;
                  while not cdsPatrosPlanos.Eof do
                  begin
                    if   ( cdsUltReavaliacaoMesAntIDPATRO.AsInteger     = cdsPatrosPlanosIDPATRO.AsInteger     )
                     and ( cdsUltReavaliacaoMesAntIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger )
                     and ( cdsPatrosPlanosFLGUSA.AsInteger              = 1                                    ) then
                    begin
                      dDtCotacao := dDtIni - 1;

                      fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICEATUARIAL.AsInteger,
                                                                           dIniAno, dDtCotacao, True, 0, True );

                      // Calcula o fator de correção adicionando o fator atuarial diário do período
                      if not cdsPatrosPlanosPERCATUARIAL.IsNull then begin

                        iDiasPer := Inteiro(dDtCotacao - dIniAno) + 1;
                        fFatAtuarialDia := Power( ( cdsPatrosPlanosPERCATUARIAL.AsFloat / 100 ) + 1, 1 / iDiasAno );
                        fFatAtuarialDia := Power( fFatAtuarialDia, iDiasPer);
                        fFatorCorrecao  := fFatorCorrecao * fFatAtuarialDia;
                      end;

                      fAux := fAux + ( cdsUltReavaliacaoMesAntULTREAVALIA.AsFloat / fFatorCorrecao );
                     end;
                    cdsPatrosPlanos.Next;
                  end;
                end;
                cdsUltReavaliacaoMesAnt.Next;
              end;

              AdicionaValor( fAux * -1 );

              fAux := 0;
              cdsPatrosPlanos.First;
              while not cdsPatrosPlanos.Eof do
              begin
                if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
                begin
                  cdsReceitaLiquida.Filtered := False;
                  cdsReceitaLiquida.Filter := '( IDIMOVELMESTRE = ' + cdsIDIMOVEL.AsString + ' ) and ' +
                                              '( ORIGEM = ' + cdsORIGEM.AsString + ' ) and ' +
                                              '( IDSEGMENTO = ' + QuotedStr( cdsIDSEGMENTO.AsString ) + ' ) and ' +
                                              '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYYMM', dDtIni ) ) + ' ) and ' +
                                              '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                              '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
                  cdsReceitaLiquida.Filtered := True;

                  dDtCotacao := EncodeDate( DiasInUteis.ExtraiAno( dDtIni ), DiasInUteis.ExtraiMes( dDtIni ), StrToInt( edtDia.Text ) );

                  fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICEATUARIAL.AsInteger,
                                                                       dIniAno, dDtCotacao, True, 0, True );


                  // Calcula o fator de correção adicionando o fator atuarial diário do período
                  if not cdsPatrosPlanosPERCATUARIAL.IsNull then begin

                    iDiasPer := Inteiro(dDtCotacao - dIniAno) + 1;
                    fFatAtuarialDia := Power( ( cdsPatrosPlanosPERCATUARIAL.AsFloat / 100 ) + 1, 1 / iDiasAno );
                    fFatAtuarialDia := Power( fFatAtuarialDia, iDiasPer);
                    fFatorCorrecao  := fFatorCorrecao * fFatAtuarialDia;
                  end;

                  fAux := fAux + ( cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat / fFatorCorrecao );
                end;

                cdsPatrosPlanos.Next;
              end;

              AdicionaValor( fAux );

              fAux := 0;
              cdsUltReavaliacao.First;
              while not cdsUltReavaliacao.Eof do
              begin
                cdsPatrosPlanos.First;
                while not cdsPatrosPlanos.Eof do
                begin
                  if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
                  begin
                    if   ( cdsUltReavaliacaoIDIMOVELMESTRE.AsInteger = cdsIDIMOVEL.AsInteger                )
                     and ( cdsUltReavaliacaoORIGEM.AsInteger         = cdsORIGEM.AsInteger                  )
                     and ( cdsUltReavaliacaoIDSEGMENTO.AsString      = cdsIDSEGMENTO.AsString               )
                     and ( cdsUltReavaliacaoIDPATRO.AsInteger        = cdsPatrosPlanosIDPATRO.AsInteger     )
                     and ( cdsUltReavaliacaoIDPLANOPREV.AsInteger    = cdsPatrosPlanosIDPLANOPREV.AsInteger ) then
                    begin
                      dDtCotacao := dDtFim;

                      fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICEATUARIAL.AsInteger,
                                                                           dIniAno, dDtCotacao, True, 0, True );

                      // Calcula o fator de correção adicionando o fator atuarial diário do período
                      if not cdsPatrosPlanosPERCATUARIAL.IsNull then begin

                        iDiasPer := Inteiro(dDtCotacao - dIniAno) + 1;
                        fFatAtuarialDia := Power( ( cdsPatrosPlanosPERCATUARIAL.AsFloat / 100 ) + 1, 1 / iDiasAno );
                        fFatAtuarialDia := Power( fFatAtuarialDia, iDiasPer);
                        fFatorCorrecao  := fFatorCorrecao * fFatAtuarialDia;
                      end;

                      fAux := fAux + ( cdsUltReavaliacaoULTREAVALIA.AsFloat / fFatorCorrecao );
                    end;
                  end;
                  cdsPatrosPlanos.Next;
                end;
                cdsUltReavaliacao.Next;
              end;

              AdicionaValor( fAux );

              fRentAtuarialMes := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dDtIni, DiasInUteis.ExtraiDia( dDtFim ), StrToInt( edtDia.Text ) );



              //----- Início do cálculo de  rentabilidade atuarial anual
              SetLength( fSeqVal, 0 );

              AdicionaValor( fUltReavalAnoAnt * -1 );

              for i := 1 to DiasInUteis.ExtraiMes( dDtIni ) do
              begin

                fAux := 0;
                cdsPatrosPlanos.First;
                while not cdsPatrosPlanos.Eof do
                begin
                  if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
                  begin
                    cdsReceitaLiquida.Filtered := False;
                    cdsReceitaLiquida.Filter := '( IDIMOVELMESTRE = ' + cdsIDIMOVEL.AsString + ' ) and ' +
                                                '( ORIGEM = ' + cdsORIGEM.AsString + ' ) and ' +
                                                '( IDSEGMENTO = ' + QuotedStr( cdsIDSEGMENTO.AsString ) + ' ) and ' +
                                                '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYY', dDtIni ) + FormatFloat( '00', i ) ) + ' ) and ' +
                                                '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                                '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
                    cdsReceitaLiquida.Filtered := True;

                    dDtCotacao := EncodeDate( DiasInUteis.ExtraiAno( dDtIni ), i, StrToInt( edtDia.Text ) );

                    fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICEATUARIAL.AsInteger,
                                                                         dIniAno, dDtCotacao, True, 0, True );

                    // Calcula o fator de correção adicionando o fator atuarial diário do período
                    if not cdsPatrosPlanosPERCATUARIAL.IsNull then begin

                      iDiasPer := Inteiro(dDtCotacao - dIniAno) + 1;
                      fFatAtuarialDia := Power( ( cdsPatrosPlanosPERCATUARIAL.AsFloat / 100 ) + 1, 1 / iDiasAno );
                      fFatAtuarialDia := Power( fFatAtuarialDia, iDiasPer);
                      fFatorCorrecao  := fFatorCorrecao * fFatAtuarialDia;
                    end;

                    fAux := fAux + ( cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat / fFatorCorrecao );
                  end;

                  cdsPatrosPlanos.Next;
                end;

                AdicionaValor( fAux );
              end;

              fUltReavalAtuarial := 0;
              cdsUltReavaliacao.First;
              while not cdsUltReavaliacao.Eof do
              begin
                cdsPatrosPlanos.First;
                while not cdsPatrosPlanos.Eof do
                begin
                  if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
                  begin
                    if   ( cdsUltReavaliacaoIDIMOVELMESTRE.AsInteger = cdsIDIMOVEL.AsInteger )
                     and ( cdsUltReavaliacaoORIGEM.AsInteger         = cdsORIGEM.AsInteger )
                     and ( cdsUltReavaliacaoIDSEGMENTO.AsString      = cdsIDSEGMENTO.AsString )
                     and ( cdsUltReavaliacaoIDPATRO.AsInteger        = cdsPatrosPlanosIDPATRO.AsInteger )
                     and ( cdsUltReavaliacaoIDPLANOPREV.AsInteger    = cdsPatrosPlanosIDPLANOPREV.AsInteger ) then
                    begin
                      // Corrige a reavaliação até o último dia do mês de competencia selecionado
                      dDtCotacao := DiasUteis.UltDiaMes( DiasUteis.ExtraiAno(dDtIni), DiasUteis.ExtraiMes(dDtIni));

                      fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICEATUARIAL.AsInteger,
                                                                           dIniAno, dDtCotacao, True, 0, True );

                      // Calcula o fator de correção adicionando o fator atuarial diário do período
                      if not cdsPatrosPlanosPERCATUARIAL.IsNull then begin
                        iDiasPer := Inteiro(dDtCotacao - dIniAno) + 1;
                        fFatAtuarialDia := Power( ( cdsPatrosPlanosPERCATUARIAL.AsFloat / 100 ) + 1, 1 / iDiasAno );
                        fFatAtuarialDia := Power( fFatAtuarialDia, iDiasPer);
                        fFatorCorrecao  := fFatorCorrecao * fFatAtuarialDia;
                      end;

                      fUltReavalAtuarial := fUltReavalAtuarial + ( cdsUltReavaliacaoULTREAVALIA.AsFloat / fFatorCorrecao );
                    end;
                  end;
                  cdsPatrosPlanos.Next;
                end;
                cdsUltReavaliacao.Next;
              end;

              AdicionaValor( fUltReavalAtuarial );

              fRentAtuarialAno := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dIniAno ,Inteiro( dDtFim - ( dIniAno - 1 ) ), StrToInt( edtDia.Text ) );

            end;

          end;
          cdsPatrosPlanos.First;


          cds.Edit;
          cdsRENTAB_MES_NOMINAL.AsFloat  := fRentNominalMes;
          cdsRENTAB_ANO_NOMINAL.AsFloat  := fRentNominalAno;
          cdsRENTAB_MES_REAL.AsFloat     := fRentRealMes;
          cdsRENTAB_ANO_REAL.AsFloat     := fRentRealAno;
          cdsRENTAB_MES_ATUARIAL.AsFloat := fRentAtuarialMes;
          cdsRENTAB_ANO_ATUARIAL.AsFloat := fRentAtuarialAno;
          cdsULTREAVALANOANT.AsFloat     := fUltReavalAnoAnt;
          cdsULTREAVALMESANT.AsFloat     := fUltReavalMesAnt;
          cdsULTREAVAL_NOMINAL.AsFloat   := fUltReavalNominal;
          cdsULTREAVAL_REAL.AsFloat      := fUltReavalReal;
          cdsULTREAVAL_ATUARIAL.AsFloat  := fUltReavalAtuarial;
          cds.Post;

          ProgressBar.StepIt;
          Application.ProcessMessages;

          cds.Next;
        end;


        frmEspera.Hide;
        frmEspera.Config('Aguarde', 'Totalizando rentabilidade por segmento...', False);
        frmEspera.Show;
        Application.ProcessMessages;


        //Calculando totais
        sIdSegAnt := '';
        cds.First;
        cdsTotais.Close;
        cdsTotais.CreateDataSet;
        while not cds.Eof do
        begin
          if ( sIdSegAnt <> cdsIDSEGMENTO.AsString ) then
          begin
            cdsTotais.Append;
            cdsTotaisIDSEGMENTO.AsString         := cdsIDSEGMENTO.AsString;
            cdsTotaisSEGMENTO.AsString           := cdsSEGMENTO.AsString;
            cdsTotais.Post;
          end;
          sIdSegAnt := cdsIDSEGMENTO.AsString;
          cds.Next;
        end;



        /////--------------------------------------------------> Cálculo de totais por segmento
        cdsTotais.First;
        while not cdsTotais.Eof do
        begin

          fTotalRENTAB_MES_NOMINAL  := 0;
          fTotalRENTAB_MES_REAL     := 0;
          fTotalRENTAB_MES_ATUARIAL := 0;
          fTotalRENTAB_ANO_NOMINAL  := 0;
          fTotalRENTAB_ANO_REAL     := 0;
          fTotalRENTAB_ANO_ATUARIAL := 0;


          //----- Início do cálculo de rentabilidade nominal mensal
          SetLength( fSeqVal, 0 );

          //Adiciona valor da soma das reavaliações do mês anterior
          cds.Filtered := False;
          cds.Filter := '( IDSEGMENTO = ' + QuotedStr( cdsTotaisIDSEGMENTO.AsString ) + ' )';
          cds.Filtered := True;
          fAux := 0;
          cds.First;
          while not cds.Eof do
          begin
            fAux := fAux + cdsULTREAVALMESANT.AsFloat;
            cds.Next;
          end;

          AdicionaValor( fAux * -1 );

          //Adiciona valor da soma das receitas líquidas
          fAux := 0;
          cdsPatrosPlanos.First;
          while not cdsPatrosPlanos.Eof do
          begin
            if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
            begin
              cdsReceitaLiquida.Filtered := False;
              cdsReceitaLiquida.Filter := '( IDSEGMENTO = ' + QuotedStr( cdsTotaisIDSEGMENTO.AsString ) + ' ) and ' +
                                          '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYYMM', dDtIni ) ) + ' ) and ' +
                                          '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                          '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
              cdsReceitaLiquida.Filtered := True;

              cdsReceitaLiquida.First;
              while not cdsReceitaLiquida.Eof do
              begin
                fAux := fAux + cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat;
                cdsReceitaLiquida.Next;
              end;

            end;
            cdsPatrosPlanos.Next;
          end;

          AdicionaValor( fAux );

          //Adiciona valor da soma das últimas reavaliações
          cdsUltReavaliacao.Filtered := False;
          cdsUltReavaliacao.Filter := '( IDSEGMENTO = ' + QuotedStr( cdsTotaisIDSEGMENTO.AsString ) + ' )';
          cdsUltReavaliacao.Filtered := True;
          fAux := 0;
          cdsUltReavaliacao.First;
          while not cdsUltReavaliacao.Eof do
          begin
            fAux := fAux + cdsUltReavaliacao.FieldByName('ULTREAVALIA').AsFloat;
            cdsUltReavaliacao.Next;
          end;
          AdicionaValor( fAux );

          fTotalRENTAB_MES_NOMINAL := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dDtIni, DiasInUteis.ExtraiDia( dDtFim ), StrToInt( edtDia.Text ) );




          //----- Início do cálculo de rentabilidade nominal anual
          SetLength( fSeqVal, 0 );

          //Adiciona valor da soma das reavaliações do ano anterior
          cds.Filtered := False;
          cds.Filter := '( IDSEGMENTO = ' + QuotedStr( cdsTotaisIDSEGMENTO.AsString ) + ' )';
          cds.Filtered := True;
          fAux := 0;
          cds.First;
          while not cds.Eof do
          begin
            fAux := fAux + cdsULTREAVALANOANT.AsFloat;
            cds.Next;
          end;
          fTotalUltReavalAnoAnt := fAux;
          AdicionaValor( fTotalUltReavalAnoAnt * -1 );

          //Adiciona valor da soma das receitas líquidas
          for i := 1 to DiasInUteis.ExtraiMes( dDtIni ) do
          begin
            fAux := 0;
            cdsPatrosPlanos.First;
            while not cdsPatrosPlanos.Eof do
            begin
              if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
              begin
                cdsReceitaLiquida.Filtered := False;
                cdsReceitaLiquida.Filter := '( IDSEGMENTO = ' + QuotedStr( cdsTotaisIDSEGMENTO.AsString ) + ' ) and ' +
                                            '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYY', dDtIni ) + FormatFloat( '00', i ) ) + ' ) and ' +
                                            '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                            '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
                cdsReceitaLiquida.Filtered := True;
                fAux := fAux + cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat;
              end;
              cdsPatrosPlanos.Next;
            end;
            AdicionaValor( fAux );
          end;

          //Adiciona valor da soma das últimas reavaliações
          cdsUltReavaliacao.Filtered := False;
          cdsUltReavaliacao.Filter := '( IDSEGMENTO = ' + QuotedStr( cdsTotaisIDSEGMENTO.AsString ) + ' )';
          cdsUltReavaliacao.Filtered := True;
          fAux := 0;
          cdsUltReavaliacao.First;
          while not cdsUltReavaliacao.Eof do
          begin
            fAux := fAux + cdsUltReavaliacao.FieldByName('ULTREAVALIA').AsFloat;
            cdsUltReavaliacao.Next;
          end;
          AdicionaValor( fAux );

          fTotalRENTAB_ANO_NOMINAL := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dIniAno, Inteiro( dDtFim - ( dIniAno - 1 ) ), StrToInt( edtDia.Text ) );




          //----- Início do cálculo de rentabilidade real mensal
          SetLength( fSeqVal, 0 );

          //Adiciona reavaliações do mês anterior
          fAux := 0;
          cdsUltReavaliacaoMesAnt.First;
          while not cdsUltReavaliacaoMesAnt.Eof do
          begin
            if cdsUltReavaliacaoMesAntIDSEGMENTO.AsString = cdsTotaisIDSEGMENTO.AsString then
            begin
              cdsPatrosPlanos.First;
              while not cdsPatrosPlanos.Eof do
              begin
                if   ( cdsUltReavaliacaoMesAntIDPATRO.AsInteger     = cdsPatrosPlanosIDPATRO.AsInteger     )
                 and ( cdsUltReavaliacaoMesAntIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger )
                 and ( cdsPatrosPlanosFLGUSA.AsInteger              = 1                                    ) then
                begin
                  dDtCotacao := dDtIni - 1;

                  fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICECORRECAO.AsInteger,
                                                                       dIniAno, dDtCotacao, True, 0, True );

                  fAux := fAux + ( cdsUltReavaliacaoMesAntULTREAVALIA.AsFloat / fFatorCorrecao );
                 end;
                cdsPatrosPlanos.Next;
              end;
            end;
            cdsUltReavaliacaoMesAnt.Next;
          end;

          AdicionaValor( fAux * -1 );

          fAux := 0;
          cdsPatrosPlanos.First;
          while not cdsPatrosPlanos.Eof do
          begin
            if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
            begin
              cdsReceitaLiquida.Filtered := False;
              cdsReceitaLiquida.Filter := '( IDSEGMENTO = ' + QuotedStr( cdsTotaisIDSEGMENTO.AsString ) + ' ) and ' +
                                          '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYYMM', dDtIni ) ) + ' ) and ' +
                                          '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                          '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
              cdsReceitaLiquida.Filtered := True;

              dDtCotacao := EncodeDate( DiasInUteis.ExtraiAno( dDtIni ), DiasInUteis.ExtraiMes( dDtIni ), StrToInt( edtDia.Text ) );

              fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICECORRECAO.AsInteger,
                                                                   dIniAno, dDtCotacao, True, 0, True );

              cdsReceitaLiquida.First;
              while not cdsReceitaLiquida.Eof do
              begin
                fAux := fAux + ( cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat / fFatorCorrecao );
                cdsReceitaLiquida.Next;
              end;

            end;
            cdsPatrosPlanos.Next;
          end;

          AdicionaValor( fAux );

          fAux := 0;
          cdsUltReavaliacao.First;
          while not cdsUltReavaliacao.Eof do
          begin
            cdsPatrosPlanos.First;
            while not cdsPatrosPlanos.Eof do
            begin
              if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
              begin
                if   ( cdsUltReavaliacaoIDSEGMENTO.AsString = cdsTotaisIDSEGMENTO.AsString )
                 and ( cdsUltReavaliacaoIDPATRO.AsInteger = cdsPatrosPlanosIDPATRO.AsInteger )
                 and ( cdsUltReavaliacaoIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger ) then
                begin
                  dDtCotacao := dDtFim;

                  fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICECORRECAO.AsInteger,
                                                                       dIniAno, dDtCotacao, True, 0, True );

                  fAux := fAux + ( cdsUltReavaliacaoULTREAVALIA.AsFloat / fFatorCorrecao );
                end;
              end;
              cdsPatrosPlanos.Next;
            end;
            cdsUltReavaliacao.Next;
          end;

          AdicionaValor( fAux );

          fTotalRENTAB_MES_REAL := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dDtIni, DiasInUteis.ExtraiDia( dDtFim ), StrToInt( edtDia.Text ) );



          //----- Início do cálculo de rentabilidade real anual
          SetLength( fSeqVal, 0 );

          //Adiciona valor da soma das reavaliações do ano anterior
          AdicionaValor( fTotalUltReavalAnoAnt * -1 );

          //Adiciona valor da soma das receitas líquidas
          for i := 1 to DiasInUteis.ExtraiMes( dDtIni ) do
          begin
            fAux := 0;
            cdsPatrosPlanos.First;
            while not cdsPatrosPlanos.Eof do
            begin
              if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
              begin
                cdsReceitaLiquida.Filtered := False;
                cdsReceitaLiquida.Filter := '( IDSEGMENTO = ' + QuotedStr( cdsTotaisIDSEGMENTO.AsString ) + ' ) and ' +
                                            '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYY', dDtIni ) + FormatFloat( '00', i ) ) + ' ) and ' +
                                            '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                            '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
                cdsReceitaLiquida.Filtered := True;
                dDtCotacao := EncodeDate( DiasInUteis.ExtraiAno( dDtIni ), i, StrToInt( edtDia.Text ) );
                fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICECORRECAO.AsInteger,
                                                                     dIniAno, dDtCotacao, True, 0, True );
                fAux := fAux + ( cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat / fFatorCorrecao );
              end;
              cdsPatrosPlanos.Next;
            end;
            AdicionaValor( fAux );
          end;

          //Adiciona valor da soma das últimas reavaliações
          cdsUltReavaliacao.Filtered := False;
          cdsUltReavaliacao.Filter := '( IDSEGMENTO = ' + QuotedStr( cdsTotaisIDSEGMENTO.AsString ) + ' )';
          cdsUltReavaliacao.Filtered := True;
          fAux := 0;
          cdsUltReavaliacao.First;
          while not cdsUltReavaliacao.Eof do
          begin
            cdsPatrosPlanos.First;
            while not cdsPatrosPlanos.Eof do
            begin
              if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
              begin
                if   ( cdsUltReavaliacaoIDSEGMENTO.AsString = cdsTotaisIDSEGMENTO.AsString )
                 and ( cdsUltReavaliacaoIDPATRO.AsInteger = cdsPatrosPlanosIDPATRO.AsInteger )
                 and ( cdsUltReavaliacaoIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger ) then
                begin
                  // Corrige a reavaliação até o último dia do mês de competencia selecionado
                  dDtCotacao := DiasUteis.UltDiaMes( DiasUteis.ExtraiAno(dDtIni), DiasUteis.ExtraiMes(dDtIni));

                  fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICECORRECAO.AsInteger,
                                                                       dIniAno, dDtCotacao, True, 0, True );
                  fAux := fAux + ( cdsUltReavaliacao.FieldByName('ULTREAVALIA').AsFloat / fFatorCorrecao );
                end;
              end;
              cdsPatrosPlanos.Next;
            end;
            cdsUltReavaliacao.Next;
          end;
          AdicionaValor( fAux );


          fTotalRENTAB_ANO_REAL := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dIniAno, Inteiro( dDtFim - ( dIniAno - 1 ) ), StrToInt( edtDia.Text ) );


          if cbExibirTIRAtuarial.Checked then
          begin

            //----- Início do cálculo de rentabilidade atuarial mensal
            SetLength( fSeqVal, 0 );

            //Adiciona reavaliações do mês anterior
            fAux := 0;
            cdsUltReavaliacaoMesAnt.First;
            while not cdsUltReavaliacaoMesAnt.Eof do
            begin
              if cdsUltReavaliacaoMesAntIDSEGMENTO.AsString = cdsTotaisIDSEGMENTO.AsString then
              begin
                cdsPatrosPlanos.First;
                while not cdsPatrosPlanos.Eof do
                begin
                  if   ( cdsUltReavaliacaoMesAntIDPATRO.AsInteger     = cdsPatrosPlanosIDPATRO.AsInteger     )
                   and ( cdsUltReavaliacaoMesAntIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger )
                   and ( cdsPatrosPlanosFLGUSA.AsInteger              = 1                                    ) then
                  begin
                    dDtCotacao := dDtIni - 1;

                    fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICEATUARIAL.AsInteger,
                                                                         dIniAno, dDtCotacao, True, 0, True );

                    // Calcula o fator de correção adicionando o fator atuarial diário do período
                    if not cdsPatrosPlanosPERCATUARIAL.IsNull then begin

                      iDiasPer := Inteiro(dDtCotacao - dIniAno) + 1;
                      fFatAtuarialDia := Power( ( cdsPatrosPlanosPERCATUARIAL.AsFloat / 100 ) + 1, 1 / iDiasAno );
                      fFatAtuarialDia := Power( fFatAtuarialDia, iDiasPer);
                      fFatorCorrecao  := fFatorCorrecao * fFatAtuarialDia;
                    end;

                    fAux := fAux + ( cdsUltReavaliacaoMesAntULTREAVALIA.AsFloat / fFatorCorrecao );
                   end;
                  cdsPatrosPlanos.Next;
                end;
              end;
              cdsUltReavaliacaoMesAnt.Next;
            end;

            AdicionaValor( fAux * -1 );

            fAux := 0;
            cdsPatrosPlanos.First;
            while not cdsPatrosPlanos.Eof do
            begin
              if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
              begin
                cdsReceitaLiquida.Filtered := False;
                cdsReceitaLiquida.Filter := '( IDSEGMENTO = ' + QuotedStr( cdsTotaisIDSEGMENTO.AsString ) + ' ) and ' +
                                            '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYYMM', dDtIni ) ) + ' ) and ' +
                                            '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                            '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
                cdsReceitaLiquida.Filtered := True;

                dDtCotacao := EncodeDate( DiasInUteis.ExtraiAno( dDtIni ), DiasInUteis.ExtraiMes( dDtIni ), StrToInt( edtDia.Text ) );

                fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICEATUARIAL.AsInteger,
                                                                     dIniAno, dDtCotacao, True, 0, True );

                // Calcula o fator de correção adicionando o fator atuarial diário do período
                if not cdsPatrosPlanosPERCATUARIAL.IsNull then begin

                  iDiasPer := Inteiro(dDtCotacao - dIniAno) + 1;
                  fFatAtuarialDia := Power( ( cdsPatrosPlanosPERCATUARIAL.AsFloat / 100 ) + 1, 1 / iDiasAno );
                  fFatAtuarialDia := Power( fFatAtuarialDia, iDiasPer);
                  fFatorCorrecao  := fFatorCorrecao * fFatAtuarialDia;
                end;

                cdsReceitaLiquida.First;
                while not cdsReceitaLiquida.Eof do
                begin
                  fAux := fAux + ( cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat / fFatorCorrecao );
                  cdsReceitaLiquida.Next;
                end;

              end;
              cdsPatrosPlanos.Next;
            end;

            AdicionaValor( fAux );

            fAux := 0;
            cdsUltReavaliacao.First;
            while not cdsUltReavaliacao.Eof do
            begin
              cdsPatrosPlanos.First;
              while not cdsPatrosPlanos.Eof do
              begin
                if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
                begin
                  if   ( cdsUltReavaliacaoIDSEGMENTO.AsString = cdsTotaisIDSEGMENTO.AsString )
                   and ( cdsUltReavaliacaoIDPATRO.AsInteger = cdsPatrosPlanosIDPATRO.AsInteger )
                   and ( cdsUltReavaliacaoIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger ) then
                  begin
                    dDtCotacao := dDtFim;

                    fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICEATUARIAL.AsInteger,
                                                                         dIniAno, dDtCotacao, True, 0, True );

                    // Calcula o fator de correção adicionando o fator atuarial diário do período
                    if not cdsPatrosPlanosPERCATUARIAL.IsNull then begin

                      iDiasPer := Inteiro(dDtCotacao - dIniAno) + 1;
                      fFatAtuarialDia := Power( ( cdsPatrosPlanosPERCATUARIAL.AsFloat / 100 ) + 1, 1 / iDiasAno );
                      fFatAtuarialDia := Power( fFatAtuarialDia, iDiasPer);
                      fFatorCorrecao  := fFatorCorrecao * fFatAtuarialDia;
                    end;

                    fAux := fAux + ( cdsUltReavaliacaoULTREAVALIA.AsFloat / fFatorCorrecao );
                  end;
                end;
                cdsPatrosPlanos.Next;
              end;
              cdsUltReavaliacao.Next;
            end;

            AdicionaValor( fAux );

            fTotalRENTAB_MES_ATUARIAL := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dDtIni, DiasInUteis.ExtraiDia( dDtFim ), StrToInt( edtDia.Text ) );




            //----- Início do cálculo de rentabilidade atuarial anual
            SetLength( fSeqVal, 0 );

            //Adiciona valor da soma das reavaliações do ano anterior
            AdicionaValor( fTotalUltReavalAnoAnt * -1 );

            //Adiciona valor da soma das receitas líquidas
            for i := 1 to DiasInUteis.ExtraiMes( dDtIni ) do
            begin
              fAux := 0;
              cdsPatrosPlanos.First;
              while not cdsPatrosPlanos.Eof do
              begin
                if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
                begin
                  cdsReceitaLiquida.Filtered := False;
                  cdsReceitaLiquida.Filter := '( IDSEGMENTO = ' + QuotedStr( cdsTotaisIDSEGMENTO.AsString ) + ' ) and ' +
                                              '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYY', dDtIni ) + FormatFloat( '00', i ) ) + ' ) and ' +
                                              '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                              '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
                  cdsReceitaLiquida.Filtered := True;
                  dDtCotacao := EncodeDate( DiasInUteis.ExtraiAno( dDtIni ), i, StrToInt( edtDia.Text ) );
                  fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICEATUARIAL.AsInteger,
                                                                       dIniAno, dDtCotacao, True, 0, True );

                  // Calcula o fator de correção adicionando o fator atuarial diário do período
                  if not cdsPatrosPlanosPERCATUARIAL.IsNull then begin

                    iDiasPer := Inteiro(dDtCotacao - dIniAno) + 1;
                    fFatAtuarialDia := Power( ( cdsPatrosPlanosPERCATUARIAL.AsFloat / 100 ) + 1, 1 / iDiasAno );
                    fFatAtuarialDia := Power( fFatAtuarialDia, iDiasPer);
                    fFatorCorrecao  := fFatorCorrecao * fFatAtuarialDia;
                  end;

                  fAux := fAux + ( cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat / fFatorCorrecao );
                end;
                cdsPatrosPlanos.Next;
              end;
              AdicionaValor( fAux );
            end;

            //Adiciona valor da soma das últimas reavaliações
            cdsUltReavaliacao.Filtered := False;
            cdsUltReavaliacao.Filter := '( IDSEGMENTO = ' + QuotedStr( cdsTotaisIDSEGMENTO.AsString ) + ' )';
            cdsUltReavaliacao.Filtered := True;
            fAux := 0;
            cdsUltReavaliacao.First;
            while not cdsUltReavaliacao.Eof do
            begin
              cdsPatrosPlanos.First;
              while not cdsPatrosPlanos.Eof do
              begin
                if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
                begin
                  if   ( cdsUltReavaliacaoIDSEGMENTO.AsString = cdsTotaisIDSEGMENTO.AsString )
                   and ( cdsUltReavaliacaoIDPATRO.AsInteger = cdsPatrosPlanosIDPATRO.AsInteger )
                   and ( cdsUltReavaliacaoIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger ) then
                  begin
                    // Corrige a reavaliação até o último dia do mês de competencia selecionado
                    dDtCotacao := DiasUteis.UltDiaMes( DiasUteis.ExtraiAno(dDtIni), DiasUteis.ExtraiMes(dDtIni));

                    fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICEATUARIAL.AsInteger,
                                                                         dIniAno, dDtCotacao, True, 0, True );

                    // Calcula o fator de correção adicionando o fator atuarial diário do período
                    if not cdsPatrosPlanosPERCATUARIAL.IsNull then begin
                      iDiasPer := Inteiro(dDtCotacao - dIniAno) + 1;
                      fFatAtuarialDia := Power( ( cdsPatrosPlanosPERCATUARIAL.AsFloat / 100 ) + 1, 1 / iDiasAno );
                      fFatAtuarialDia := Power( fFatAtuarialDia, iDiasPer);
                      fFatorCorrecao  := fFatorCorrecao * fFatAtuarialDia;
                    end;

                    fAux := fAux + ( cdsUltReavaliacao.FieldByName('ULTREAVALIA').AsFloat / fFatorCorrecao );
                  end;
                end;
                cdsPatrosPlanos.Next;
              end;
              cdsUltReavaliacao.Next;
            end;
            AdicionaValor( fAux );


            fTotalRENTAB_ANO_ATUARIAL := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dIniAno, Inteiro( dDtFim - ( dIniAno - 1 ) ), StrToInt( edtDia.Text ) );

          end;



          cdsTotais.Edit;
          cdsTotaisRENTAB_MES_NOMINAL.AsFloat  := fTotalRENTAB_MES_NOMINAL;
          cdsTotaisRENTAB_MES_REAL.AsFloat     := fTotalRENTAB_MES_REAL;
          cdsTotaisRENTAB_MES_ATUARIAL.AsFloat := fTotalRENTAB_MES_ATUARIAL;
          cdsTotaisRENTAB_ANO_NOMINAL.AsFloat  := fTotalRENTAB_ANO_NOMINAL;
          cdsTotaisRENTAB_ANO_REAL.AsFloat     := fTotalRENTAB_ANO_REAL;
          cdsTotaisRENTAB_ANO_ATUARIAL.AsFloat := fTotalRENTAB_ANO_ATUARIAL;
          cdsTotais.Post;

          cdsTotais.Next;
        end;


        frmEspera.Hide;
        frmEspera.Config('Aguarde', 'Totalizando rentabilidade geral...', False);
        frmEspera.Show;
        Application.ProcessMessages;


        /////--------------------------------------------------> Cálculo de totais gerais
        fFinalRENTAB_MES_NOMINAL  := 0;
        fFinalRENTAB_MES_REAL     := 0;
        fFinalRENTAB_MES_ATUARIAL := 0;
        fFinalRENTAB_ANO_NOMINAL  := 0;
        fFinalRENTAB_ANO_REAL     := 0;
        fFinalRENTAB_ANO_ATUARIAL := 0;
        cdsTotais.First;

        //----- Início do cálculo de rentabilidade nominal mensal
        SetLength( fSeqVal, 0 );

        //Adiciona valor da soma das reavaliações do mês anterior
        cds.Filtered := False;
        cds.Filter := '';
        fAux := 0;
        cds.First;
        while not cds.Eof do
        begin
          fAux := fAux + cdsULTREAVALMESANT.AsFloat;
          cds.Next;
        end;
        AdicionaValor( fAux * -1 );

        //Adiciona valor da soma das receitas líquidas
        fAux := 0;
        cdsPatrosPlanos.First;
        while not cdsPatrosPlanos.Eof do
        begin
          if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
          begin
            cdsReceitaLiquida.Filtered := False;
            cdsReceitaLiquida.Filter := '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYYMM', dDtIni ) ) + ' ) and ' +
                                        '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                        '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
            cdsReceitaLiquida.Filtered := True;

            cdsReceitaLiquida.First;
            while not cdsReceitaLiquida.Eof do
            begin
              fAux := fAux + cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat;
              cdsReceitaLiquida.Next;
            end;

          end;
          cdsPatrosPlanos.Next;
        end;

        AdicionaValor( fAux );

        //Adiciona valor da soma das últimas reavaliações
        cdsUltReavaliacao.Filtered := False;
        cdsUltReavaliacao.Filter := '';
        fAux := 0;
        cdsUltReavaliacao.First;
        while not cdsUltReavaliacao.Eof do
        begin
          fAux := fAux + cdsUltReavaliacao.FieldByName('ULTREAVALIA').AsFloat;
          cdsUltReavaliacao.Next;
        end;
        AdicionaValor( fAux );

        fFinalRENTAB_MES_NOMINAL := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dDtIni, DiasInUteis.ExtraiDia( dDtFim ), StrToInt( edtDia.Text ) );




        //----- Início do cálculo de rentabilidade nominal anual
        SetLength( fSeqVal, 0 );

        //Adiciona valor da soma das reavaliações do ano anterior
        cds.Filtered := False;
        cds.Filter := '';
        fAux := 0;
        cds.First;
        while not cds.Eof do
        begin
          fAux := fAux + cdsULTREAVALANOANT.AsFloat;
          cds.Next;
        end;
        fTotalUltReavalAnoAnt := fAux;
        AdicionaValor( fTotalUltReavalAnoAnt * -1 );

        //Adiciona valor da soma das receitas líquidas
        for i := 1 to DiasInUteis.ExtraiMes( dDtIni ) do
        begin
          fAux := 0;
          cdsPatrosPlanos.First;
          while not cdsPatrosPlanos.Eof do
          begin
            if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
            begin
              cdsReceitaLiquida.Filtered := False;
              cdsReceitaLiquida.Filter := '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYY', dDtIni ) + FormatFloat( '00', i ) ) + ' ) and ' +
                                          '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                          '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
              cdsReceitaLiquida.Filtered := True;
              fAux := fAux + cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat;
            end;
            cdsPatrosPlanos.Next;
          end;
          AdicionaValor( fAux );
        end;

        //Adiciona valor da soma das últimas reavaliações
        cdsUltReavaliacao.Filtered := False;
        cdsUltReavaliacao.Filter := '';
        fAux := 0;
        cdsUltReavaliacao.First;
        while not cdsUltReavaliacao.Eof do
        begin
          fAux := fAux + cdsUltReavaliacao.FieldByName('ULTREAVALIA').AsFloat;
          cdsUltReavaliacao.Next;
        end;
        AdicionaValor( fAux );


        fFinalRENTAB_ANO_NOMINAL := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dIniAno, Inteiro( dDtFim - ( dIniAno - 1 ) ), StrToInt( edtDia.Text ) );



        //----- Início do cálculo de rentabilidade real mensal
        SetLength( fSeqVal, 0 );

        //Adiciona reavaliações do mês anterior
        fAux := 0;
        cdsUltReavaliacaoMesAnt.First;
        while not cdsUltReavaliacaoMesAnt.Eof do
        begin
          cdsPatrosPlanos.First;
          while not cdsPatrosPlanos.Eof do
          begin
            if   ( cdsUltReavaliacaoMesAntIDPATRO.AsInteger     = cdsPatrosPlanosIDPATRO.AsInteger     )
             and ( cdsUltReavaliacaoMesAntIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger )
             and ( cdsPatrosPlanosFLGUSA.AsInteger              = 1                                    ) then
            begin
              dDtCotacao := dDtIni - 1;

              fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICECORRECAO.AsInteger,
                                                                   dIniAno, dDtCotacao, True, 0, True );

              fAux := fAux + ( cdsUltReavaliacaoMesAntULTREAVALIA.AsFloat / fFatorCorrecao );
             end;
            cdsPatrosPlanos.Next;
          end;
          cdsUltReavaliacaoMesAnt.Next;
        end;

        AdicionaValor( fAux * -1 );

        fAux := 0;
        cdsPatrosPlanos.First;
        while not cdsPatrosPlanos.Eof do
        begin
          if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
          begin
            cdsReceitaLiquida.Filtered := False;
            cdsReceitaLiquida.Filter := '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYYMM', dDtIni ) ) + ' ) and ' +
                                        '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                        '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
            cdsReceitaLiquida.Filtered := True;

            dDtCotacao := EncodeDate( DiasInUteis.ExtraiAno( dDtIni ), DiasInUteis.ExtraiMes( dDtIni ), StrToInt( edtDia.Text ) );

            fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICECORRECAO.AsInteger,
                                                                 dIniAno, dDtCotacao, True, 0, True );

            cdsReceitaLiquida.First;
            while not cdsReceitaLiquida.Eof do
            begin
              fAux := fAux + ( cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat / fFatorCorrecao );
              cdsReceitaLiquida.Next;
            end;

          end;
          cdsPatrosPlanos.Next;
        end;

        AdicionaValor( fAux );

        fAux := 0;
        cdsUltReavaliacao.First;
        while not cdsUltReavaliacao.Eof do
        begin
          cdsPatrosPlanos.First;
          while not cdsPatrosPlanos.Eof do
          begin
            if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
            begin
              if   ( cdsUltReavaliacaoIDPATRO.AsInteger = cdsPatrosPlanosIDPATRO.AsInteger )
               and ( cdsUltReavaliacaoIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger ) then
              begin
                dDtCotacao := dDtFim;

                fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICECORRECAO.AsInteger,
                                                                     dIniAno, dDtCotacao, True, 0, True );

                fAux := fAux + ( cdsUltReavaliacaoULTREAVALIA.AsFloat / fFatorCorrecao );
              end;
            end;
            cdsPatrosPlanos.Next;
          end;
          cdsUltReavaliacao.Next;
        end;

        AdicionaValor( fAux );

        fFinalRENTAB_MES_REAL := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dDtIni,  DiasInUteis.ExtraiDia( dDtFim ), StrToInt( edtDia.Text ) );




        //----- Início do cálculo de rentabilidade real anual
        SetLength( fSeqVal, 0 );

        //Adiciona valor da soma das reavaliações do ano anterior
        AdicionaValor( fTotalUltReavalAnoAnt * -1 );

        //Adiciona valor da soma das receitas líquidas
        for i := 1 to DiasInUteis.ExtraiMes( dDtIni ) do
        begin
          fAux := 0;
          cdsPatrosPlanos.First;
          while not cdsPatrosPlanos.Eof do
          begin
            if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
            begin
              cdsReceitaLiquida.Filtered := False;
              cdsReceitaLiquida.Filter := '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYY', dDtIni ) + FormatFloat( '00', i ) ) + ' ) and ' +
                                          '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                          '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
              cdsReceitaLiquida.Filtered := True;
              dDtCotacao := EncodeDate( DiasInUteis.ExtraiAno( dDtIni ), i, StrToInt( edtDia.Text ) );
              fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICECORRECAO.AsInteger,
                                                                   dIniAno, dDtCotacao, True, 0, True );
              fAux := fAux + ( cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat / fFatorCorrecao );
            end;
            cdsPatrosPlanos.Next;
          end;
          AdicionaValor( fAux );
        end;

        //Adiciona valor da soma das últimas reavaliações
        cdsUltReavaliacao.Filtered := False;
        cdsUltReavaliacao.Filter := '';
        fAux := 0;
        cdsUltReavaliacao.First;
        while not cdsUltReavaliacao.Eof do
        begin
          cdsPatrosPlanos.First;
          while not cdsPatrosPlanos.Eof do
          begin
            if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
            begin
              if   ( cdsUltReavaliacaoIDPATRO.AsInteger = cdsPatrosPlanosIDPATRO.AsInteger )
               and ( cdsUltReavaliacaoIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger ) then
              begin
                // Corrige a reavaliação até o último dia do mês de competencia selecionado
                dDtCotacao := DiasUteis.UltDiaMes( DiasUteis.ExtraiAno(dDtIni), DiasUteis.ExtraiMes(dDtIni));

                fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICECORRECAO.AsInteger,
                                                                     dIniAno, dDtCotacao, True, 0, True );
                fAux := fAux + ( cdsUltReavaliacao.FieldByName('ULTREAVALIA').AsFloat / fFatorCorrecao );
              end;
            end;
            cdsPatrosPlanos.Next;
          end;
          cdsUltReavaliacao.Next;
        end;
        AdicionaValor( fAux );


        fFinalRENTAB_ANO_REAL := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dIniAno, Inteiro( dDtFim - ( dIniAno - 1 ) ), StrToInt( edtDia.Text ) );


        if cbExibirTIRAtuarial.Checked then
        begin

          //----- Início do cálculo de rentabilidade real atuarial
          SetLength( fSeqVal, 0 );

          //Adiciona reavaliações do mês anterior
          fAux := 0;
          cdsUltReavaliacaoMesAnt.First;
          while not cdsUltReavaliacaoMesAnt.Eof do
          begin
            cdsPatrosPlanos.First;
            while not cdsPatrosPlanos.Eof do
            begin
              if   ( cdsUltReavaliacaoMesAntIDPATRO.AsInteger     = cdsPatrosPlanosIDPATRO.AsInteger     )
               and ( cdsUltReavaliacaoMesAntIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger )
               and ( cdsPatrosPlanosFLGUSA.AsInteger              = 1                                    ) then
              begin
                dDtCotacao := dDtIni - 1;

                fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICEATUARIAL.AsInteger,
                                                                     dIniAno, dDtCotacao, True, 0, True );

                // Calcula o fator de correção adicionando o fator atuarial diário do período
                if not cdsPatrosPlanosPERCATUARIAL.IsNull then begin

                  iDiasPer := Inteiro(dDtCotacao - dIniAno) + 1;
                  fFatAtuarialDia := Power( ( cdsPatrosPlanosPERCATUARIAL.AsFloat / 100 ) + 1, 1 / iDiasAno );
                  fFatAtuarialDia := Power( fFatAtuarialDia, iDiasPer);
                  fFatorCorrecao  := fFatorCorrecao * fFatAtuarialDia;
                end;

                fAux := fAux + ( cdsUltReavaliacaoMesAntULTREAVALIA.AsFloat / fFatorCorrecao );
               end;
              cdsPatrosPlanos.Next;
            end;
            cdsUltReavaliacaoMesAnt.Next;
          end;

          AdicionaValor( fAux * -1 );

          fAux := 0;
          cdsPatrosPlanos.First;
          while not cdsPatrosPlanos.Eof do
          begin
            if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
            begin
              cdsReceitaLiquida.Filtered := False;
              cdsReceitaLiquida.Filter := '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYYMM', dDtIni ) ) + ' ) and ' +
                                          '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                          '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
              cdsReceitaLiquida.Filtered := True;

              dDtCotacao := EncodeDate( DiasInUteis.ExtraiAno( dDtIni ), DiasInUteis.ExtraiMes( dDtIni ), StrToInt( edtDia.Text ) );

              fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICEATUARIAL.AsInteger,
                                                                   dIniAno, dDtCotacao, True, 0, True );

              // Calcula o fator de correção adicionando o fator atuarial diário do período
              if not cdsPatrosPlanosPERCATUARIAL.IsNull then begin

                iDiasPer := Inteiro(dDtCotacao - dIniAno) + 1;
                fFatAtuarialDia := Power( ( cdsPatrosPlanosPERCATUARIAL.AsFloat / 100 ) + 1, 1 / iDiasAno );
                fFatAtuarialDia := Power( fFatAtuarialDia, iDiasPer);
                fFatorCorrecao  := fFatorCorrecao * fFatAtuarialDia;
              end;

              cdsReceitaLiquida.First;
              while not cdsReceitaLiquida.Eof do
              begin
                fAux := fAux + ( cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat / fFatorCorrecao );
                cdsReceitaLiquida.Next;
              end;

            end;
            cdsPatrosPlanos.Next;
          end;

          AdicionaValor( fAux );

          fAux := 0;
          cdsUltReavaliacao.First;
          while not cdsUltReavaliacao.Eof do
          begin
            cdsPatrosPlanos.First;
            while not cdsPatrosPlanos.Eof do
            begin
              if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
              begin
                if   ( cdsUltReavaliacaoIDPATRO.AsInteger = cdsPatrosPlanosIDPATRO.AsInteger )
                 and ( cdsUltReavaliacaoIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger ) then
                begin
                  dDtCotacao := dDtFim;

                  fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICEATUARIAL.AsInteger,
                                                                       dIniAno, dDtCotacao, True, 0, True );

                  // Calcula o fator de correção adicionando o fator atuarial diário do período
                  if not cdsPatrosPlanosPERCATUARIAL.IsNull then begin

                    iDiasPer := Inteiro(dDtCotacao - dIniAno) + 1;
                    fFatAtuarialDia := Power( ( cdsPatrosPlanosPERCATUARIAL.AsFloat / 100 ) + 1, 1 / iDiasAno );
                    fFatAtuarialDia := Power( fFatAtuarialDia, iDiasPer);
                    fFatorCorrecao  := fFatorCorrecao * fFatAtuarialDia;
                  end;

                  fAux := fAux + ( cdsUltReavaliacaoULTREAVALIA.AsFloat / fFatorCorrecao );
                end;
              end;
              cdsPatrosPlanos.Next;
            end;
            cdsUltReavaliacao.Next;
          end;

          AdicionaValor( fAux );

          fFinalRENTAB_MES_ATUARIAL := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dDtIni, DiasInUteis.ExtraiDia( dDtFim ), StrToInt( edtDia.Text ) );




          //----- Início do cálculo de rentabilidade real anual
          SetLength( fSeqVal, 0 );

          //Adiciona valor da soma das reavaliações do ano anterior
          AdicionaValor( fTotalUltReavalAnoAnt * -1 );

          //Adiciona valor da soma das receitas líquidas
          for i := 1 to DiasInUteis.ExtraiMes( dDtIni ) do
          begin
            fAux := 0;
            cdsPatrosPlanos.First;
            while not cdsPatrosPlanos.Eof do
            begin
              if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
              begin
                cdsReceitaLiquida.Filtered := False;
                cdsReceitaLiquida.Filter := '( ANOMES = ' + QuotedStr( FormatDateTime( 'YYYY', dDtIni ) + FormatFloat( '00', i ) ) + ' ) and ' +
                                            '( IDPATRO = ' + cdsPatrosPlanosIDPATRO.AsString + ' ) and ' +
                                            '( IDPLANOPREV = ' + cdsPatrosPlanosIDPLANOPREV.AsString + ' )';
                cdsReceitaLiquida.Filtered := True;
                dDtCotacao := EncodeDate( DiasInUteis.ExtraiAno( dDtIni ), i, StrToInt( edtDia.Text ) );
                fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICEATUARIAL.AsInteger,
                                                                     dIniAno, dDtCotacao, True, 0, True );

                // Calcula o fator de correção adicionando o fator atuarial diário do período
                if not cdsPatrosPlanosPERCATUARIAL.IsNull then begin

                  iDiasPer := Inteiro(dDtCotacao - dIniAno) + 1;
                  fFatAtuarialDia := Power( ( cdsPatrosPlanosPERCATUARIAL.AsFloat / 100 ) + 1, 1 / iDiasAno );
                  fFatAtuarialDia := Power( fFatAtuarialDia, iDiasPer);
                  fFatorCorrecao  := fFatorCorrecao * fFatAtuarialDia;
                end;

                fAux := fAux + ( cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat / fFatorCorrecao );
              end;
              cdsPatrosPlanos.Next;
            end;
            AdicionaValor( fAux );
          end;

          //Adiciona valor da soma das últimas reavaliações
          cdsUltReavaliacao.Filtered := False;
          cdsUltReavaliacao.Filter := '';
          fAux := 0;
          cdsUltReavaliacao.First;
          while not cdsUltReavaliacao.Eof do
          begin
            cdsPatrosPlanos.First;
            while not cdsPatrosPlanos.Eof do
            begin
              if cdsPatrosPlanosFLGUSA.AsInteger = 1 then
              begin
                if   ( cdsUltReavaliacaoIDPATRO.AsInteger = cdsPatrosPlanosIDPATRO.AsInteger )
                 and ( cdsUltReavaliacaoIDPLANOPREV.AsInteger = cdsPatrosPlanosIDPLANOPREV.AsInteger ) then
                begin
                  // Corrige a reavaliação até o último dia do mês de competencia selecionado
                  dDtCotacao := DiasUteis.UltDiaMes( DiasUteis.ExtraiAno(dDtIni), DiasUteis.ExtraiMes(dDtIni));

                  fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( cdsPatrosPlanosINDICEATUARIAL.AsInteger,
                                                                       dIniAno, dDtCotacao, True, 0, True );

                  // Calcula o fator de correção adicionando o fator atuarial diário do período
                  if not cdsPatrosPlanosPERCATUARIAL.IsNull then begin
                    iDiasPer := Inteiro(dDtCotacao - dIniAno) + 1;
                    fFatAtuarialDia := Power( ( cdsPatrosPlanosPERCATUARIAL.AsFloat / 100 ) + 1, 1 / iDiasAno );
                    fFatAtuarialDia := Power( fFatAtuarialDia, iDiasPer);
                    fFatorCorrecao  := fFatorCorrecao * fFatAtuarialDia;
                  end;

                  fAux := fAux + ( cdsUltReavaliacao.FieldByName('ULTREAVALIA').AsFloat / fFatorCorrecao );
                end;
              end;
              cdsPatrosPlanos.Next;
            end;
            cdsUltReavaliacao.Next;
          end;
          AdicionaValor( fAux );


          fFinalRENTAB_ANO_ATUARIAL := CtrlMapaTIR.CalculaRentabilidade( fSeqVal, dIniAno, Inteiro( dDtFim - ( dIniAno - 1 ) ), StrToInt( edtDia.Text ) );
        end;


        cds.Filtered       := False;
        cds.Filter         := '';
        cdsTotais.Filtered := False;
        cdsTotais.Filter   := '';

        //Preenche os totais no dataset principal
        cds.First;
        while not cds.Eof do
        begin
          cdsTotais.Locate( 'IDSEGMENTO', cdsIDSEGMENTO.AsString, [] );
          cds.Edit;

          cdsTOTRENTAB_MES_NOMINAL.AsFloat  := cdsTotaisRENTAB_MES_NOMINAL.AsFloat;
          cdsTOTRENTAB_MES_REAL.AsFloat     := cdsTotaisRENTAB_MES_REAL.AsFloat;
          cdsTOTRENTAB_MES_ATUARIAL.AsFloat := cdsTotaisRENTAB_MES_ATUARIAL.AsFloat;
          cdsTOTRENTAB_ANO_NOMINAL.AsFloat  := cdsTotaisRENTAB_ANO_NOMINAL.AsFloat;
          cdsTOTRENTAB_ANO_REAL.AsFloat     := cdsTotaisRENTAB_ANO_REAL.AsFloat;
          cdsTOTRENTAB_ANO_ATUARIAL.AsFloat := cdsTotaisRENTAB_ANO_ATUARIAL.AsFloat;

          cdsFINRENTAB_MES_NOMINAL.AsFloat  := fFinalRENTAB_MES_NOMINAL;
          cdsFINRENTAB_MES_REAL.AsFloat     := fFinalRENTAB_MES_REAL;
          cdsFINRENTAB_MES_ATUARIAL.AsFloat := fFinalRENTAB_MES_ATUARIAL;
          cdsFINRENTAB_ANO_NOMINAL.AsFloat  := fFinalRENTAB_ANO_NOMINAL;
          cdsFINRENTAB_ANO_REAL.AsFloat     := fFinalRENTAB_ANO_REAL;
          cdsFINRENTAB_ANO_ATUARIAL.AsFloat := fFinalRENTAB_ANO_ATUARIAL;

          cds.Post;
          cds.Next;
        end;


        //Preenche os totais gerais no dataset de totais
        cdsTotais.First;
        while not cdsTotais.Eof do
        begin
          cdsTotais.Edit;
          cdsTotaisFINRENTAB_MES_NOMINAL.AsFloat  := fFinalRENTAB_MES_NOMINAL;
          cdsTotaisFINRENTAB_MES_REAL.AsFloat     := fFinalRENTAB_MES_REAL;
          cdsTotaisFINRENTAB_MES_ATUARIAL.AsFloat := fFinalRENTAB_MES_ATUARIAL;
          cdsTotaisFINRENTAB_ANO_NOMINAL.AsFloat  := fFinalRENTAB_ANO_NOMINAL;
          cdsTotaisFINRENTAB_ANO_REAL.AsFloat     := fFinalRENTAB_ANO_REAL;
          cdsTotaisFINRENTAB_ANO_ATUARIAL.AsFloat := fFinalRENTAB_ANO_ATUARIAL;
          cdsTotais.Post;
          cdsTotais.Next;
        end;


        frmEspera.Hide;
        frmEspera.Config('', '', False);


        lblProgress.Visible   := False;
        ProgressBar.Visible   := False;
        Repaint;
        Application.ProcessMessages;
      end;

      //Cabeçalho do relatório
      pplblCompetencia.Text := cboMes.Text + ' / ' + DBspnAno.Text;

      if rbGerencial.Checked then
      begin
        pplblTipoSegmento.Text := 'Gerencial';
      end
      else
      begin
        pplblTipoSegmento.Text := 'SPC';
      end;

      pplblDia.Text := edtDia.Text;

      sPatroPlano := '';
      sPatroPlanoAnt := '';
      cdsPatrosPlanos.Filtered := False;
      cdsPatrosPlanos.Filter := '';
      cdsPatrosPlanos.First;

      try
         cdsTemp := TCMClientDataSet.Create( nil );
         ppMemPatroPlano.Lines.Clear;
         while not cdsPatrosPlanos.Eof do begin
           if cdsPatrosPlanosFLGUSA.AsInteger = 1 then begin
              sPatroPlano := cdsPatrosPlanosNOMEPATRO.AsString + ' - ' + cdsPatrosPlanosNOMEPLANO.AsString;

              // Busca sigla da moeda Real
              cdsTemp.Data := CtrlMoeda.ListaMoeda(cdsPatrosPlanosINDICECORRECAO.AsInteger, True);
              sPatroPlano  := sPatroPlano + ' (Correção Real: ' + cdsTemp.FieldByName('MOESIGLA').AsString + '; ';
              // Busca sigla da moeda Atuarial
              cdsTemp.Data := CtrlMoeda.ListaMoeda(cdsPatrosPlanosINDICEATUARIAL.AsInteger, True);
              sPatroPlano  := sPatroPlano + ' Atuarial: ' + cdsTemp.FieldByName('MOESIGLA').AsString + ' + ' +
                                              FormatFloat('##0.0%', cdsPatrosPlanosPERCATUARIAL.AsFloat) + ' aa )';
              ppMemPatroPlano.Lines.Add( sPatroPlano );
           end;
           cdsPatrosPlanos.Next;
         end;
      finally
         cdsTemp.Free;
      end;

      if cbAlienacaoRenda.Checked then
      begin
        pplblAlienacaoRenda.Text := '* Considerando alienação como Renda.';
      end
      else
      begin
        pplblAlienacaoRenda.Text := '';
      end;

      pplblCompetenciaTot.Text    := pplblCompetencia.Text;
      pplblTipoSegmentoTot.Text   := pplblTipoSegmento.Text;
      pplblDiaTot.Text            := pplblDia.Text;
      ppMemPatroPlanoTot.Lines    := ppMemPatroPlano.Lines;
      pplblAlienacaoRendaTot.Text := pplblAlienacaoRenda.Text;

    end;

  finally
    dtmRelMapaTIR.cds.Filtered := False;
    dtmRelMapaTIR.cds.Filter := '';
    if dtmRelMapaTIR.cds.Active then
      dtmRelMapaTIR.cds.First;
    dtmRelMapaTIR.cdsTotais.Filtered := False;
    dtmRelMapaTIR.cdsTotais.Filter := '';
    if dtmRelMapaTIR.cdsTotais.Active then
      dtmRelMapaTIR.cdsTotais.First;
    for i := 0 to ( Self.ComponentCount - 1 ) do
      if ( Self.Components[i] is TCMClientDataset ) then
      begin
        ( Self.Components[i] as TCMClientDataset ).Filtered := False;
        ( Self.Components[i] as TCMClientDataset ).Filter := '';
      end;
    cdsPatrosPlanos.First;
    cdsPatrosPlanos.EnableControls;
  end;
end;

procedure TcfgRelMapaTIR.btnTodosClick(Sender: TObject);
begin
  inherited;
  cdsPatrosPlanos.DisableControls;
  cdsPatrosPlanos.First;
  while not cdsPatrosPlanos.Eof do
  begin
    cdsPatrosPlanos.Edit;
    cdsPatrosPlanosFLGUSA.AsInteger := 1;
    cdsPatrosPlanos.Post;
    cdsPatrosPlanos.Next;
  end;
  cdsPatrosPlanos.First;
  cdsPatrosPlanos.EnableControls;
end;

procedure TcfgRelMapaTIR.btnNenhumClick(Sender: TObject);
begin
  inherited;
  cdsPatrosPlanos.DisableControls;
  cdsPatrosPlanos.First;
  while not cdsPatrosPlanos.Eof do
  begin
    cdsPatrosPlanos.Edit;
    cdsPatrosPlanosFLGUSA.AsInteger := 0;
    cdsPatrosPlanos.Post;
    cdsPatrosPlanos.Next;
  end;
  cdsPatrosPlanos.First;
  cdsPatrosPlanos.EnableControls;
end;

procedure TcfgRelMapaTIR.edtDiaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( ( Pos( Key, '0123456789' ) <= 0 ) and ( Ord( Key ) <> VK_BACK ) ) then
    Key := #0; 
end;

procedure TcfgRelMapaTIR.edtDiaExit(Sender: TObject);
begin
  inherited;
  try
    EncodeDate( StrToInt( IntToStr( Inteiro( DBspnAno.Value ) ) ),
                cboMes.ItemIndex + 1,
                StrToInt( edtDia.Text ) );
  except
    MessageDlg('Dia inválido.', mtError, [mbOK], 0);
    edtDia.Text := '01';
    edtDia.SetFocus;
    exit
  end;
end;

procedure TcfgRelMapaTIR.cboMesChange(Sender: TObject);
begin
  inherited;
  try
    EncodeDate( StrToInt( IntToStr( Inteiro( DBspnAno.Value ) ) ),
                cboMes.ItemIndex + 1,
                StrToInt( edtDia.Text ) );
  except
    edtDia.Text := IntToStr( DiasInUteis.ExtraiDia( DiasInUteis.UltDiaMes(
      StrToInt( IntToStr( Inteiro( DBspnAno.Value ) ) ), cboMes.ItemIndex + 1 ) ) );
  end;
end;

procedure TcfgRelMapaTIR.DBspnAnoChange(Sender: TObject);
begin
  inherited;
  try
    EncodeDate( StrToInt( IntToStr( Inteiro( DBspnAno.Value ) ) ),
                cboMes.ItemIndex + 1,
                StrToInt( edtDia.Text ) );
  except
    edtDia.Text := IntToStr( DiasInUteis.ExtraiDia( DiasInUteis.UltDiaMes(
      StrToInt( IntToStr( Inteiro( DBspnAno.Value ) ) ), cboMes.ItemIndex + 1 ) ) );
  end;
end;

end.
