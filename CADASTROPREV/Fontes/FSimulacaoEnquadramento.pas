unit FSimulacaoEnquadramento;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 23/10/2006
Autor     : André Pontes
Pendência : 23563
Descrição : Retirada do updReservaPart (TUpdateSQL), que não estava ligado a objeto algum
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls, StdCtrls,
  wwdblook, Mask, MskEdDlg, wwdbdatetimepicker, CMDateTimePicker, TreeWzd,
  MontaSelect, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Menus, DBCtrls, wwdbedit,
  CMDBLookupCombo, uCtrlLancamento, uIntegraBack, uCtrlParamIntegra,
  TB97Ctls, DBCtrls2, TabControlDetalhe, ImgList, uCtrlPCS, DBClient,
  uCtrlEvolFuncPrev, uCmSqlParams, uCMClientDataSet, uRegraMT;

type
  TFrmSimulacaoEnquadramento = class(TfrmSairAjuda)
    PgCtrlEtapa: TPageControl;

    TbsSelecao          : TTabSheet;
    TbsResultadoProcesso: TTabSheet;
    TbsInfomacoesCalculo: TTabSheet;

    BtnAnterior: TBitBtn;
    BtnProximo : TBitBtn;
    BtnEncerra : TBitBtn;
    BtnCancela : TBitBtn;

    pnlEtapas    : TPanel;
    pnlFundoRetro: TPanel;
    pnlTitulo    : TPanel;
    MemoResultado: TRichEdit;

    OpenDlg: TOpenDialog;

    ToolbarSep971: TToolbarSep97;
    MontaSelect: TMontaSelect;

    Label4 : TLabel;
    Label8 : TLabel;
    Label9 : TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label3 : TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label29     : TLabel;

    bbtnProcurar: TBitBtn;

    lblParticipante : TStaticText;
    lblPatro        : TStaticText;
    lblPlano        : TStaticText;
    lblNUmProc      : TStaticText;
    lblDIB          : TStaticText;
    lblBeneficio    : TStaticText;
    lblNomeRegraSimulacao: TStaticText;
    lblMatricula    : TStaticText;
    lblSituacaoAtual: TStaticText;

    TwCons: TTreeWzd;
    GroupBox3: TGroupBox;

    edAnoMesIni: TMaskEdit;
    edAnoMesFim: TMaskEdit;

    Bevel1: TBevel;
    PnlFundoCadastros: TPanel;
    ImlPadrao: TImageList;
    PgCtrlDetalhe: TPageControl;
    TbsCargo: TTabSheet;
    DbGrdCargo: TwwDBGrid;
    pnlControlesDet: TPanel;
    Label1: TLabel;
    lblTituloTipo: TLabel;
    Label5: TLabel;
    Label33: TLabel;
    dbDataInicio: TCMDateTimePicker;
    dblkpcmbModoCargo: TwwDBLookupCombo;
    dblkpcmbSitCargo: TwwDBLookupCombo;
    dblkpcmbCargoxNivel: TwwDBLookupCombo;
    TbsFuncao: TTabSheet;
    pnlControlesFuncao: TPanel;
    Label2: TLabel;
    Label6: TLabel;
    Label18: TLabel;
    Label7: TLabel;
    Label13: TLabel;
    Label34: TLabel;
    dblkpcmbFuncao: TwwDBLookupCombo;
    dbDataInicioFuncao: TCMDateTimePicker;
    dbDataFinalFuncao: TCMDateTimePicker;
    dblkpcmbModoFuncao: TwwDBLookupCombo;
    dbEdPercFuncao: TwwDBEdit;
    DbGrdFuncao: TwwDBGrid;
    TbsAdicCompens: TTabSheet;
    DbGrdAdicCompens: TwwDBGrid;
    pnlAdicCompensatorio: TPanel;
    Label15: TLabel;
    Label17: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label35: TLabel;
    Label40: TLabel;
    dblkpcmbFuncaoAdicCompens: TwwDBLookupCombo;
    dtInicioAdicCompens: TCMDateTimePicker;
    dtFimAdicCompens: TCMDateTimePicker;
    dbEdPercAdicComp1: TwwDBEdit;
    dblkpcmbSitPartAdicCompens: TwwDBLookupCombo;
    dbEdPercAdicComp2: TwwDBEdit;
    TbsATS: TTabSheet;
    pnlATS: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    spbtnCalcPercATS: TSpeedButton;
    Label36: TLabel;
    dbDataInicioATS: TCMDateTimePicker;
    dbDataFinalATS: TCMDateTimePicker;
    dbEdPercATS: TDBEdit2;
    DbGrdATS: TwwDBGrid;
    TbsAdicInsalub: TTabSheet;
    Panel1: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    SpeedButton1: TSpeedButton;
    Label37: TLabel;
    dtInicioAdicInsalub: TCMDateTimePicker;
    dtFimAdicInsalub: TCMDateTimePicker;
    dbEdPercAdicInsalub: TDBEdit2;
    DbGrdAdicInsalub: TwwDBGrid;
    TbsAdicNoturno: TTabSheet;
    pnlAdicNoturno: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    dtInicioAdicNoturno: TCMDateTimePicker;
    dtFimAdicNoturno: TCMDateTimePicker;
    dbEdPercAdicNot: TDBEdit2;
    dbedQtdeMinutos: TDBEdit2;
    wwDBLookupCombo3: TwwDBLookupCombo;
    DbGrdAdicNoturno: TwwDBGrid;
    TbsAdicPericul: TTabSheet;
    Panel2: TPanel;
    DbGrdAdicPericul: TwwDBGrid;
    TbsRubSal: TTabSheet;
    pnlControlesRubSalarial: TPanel;
    GroupBox2: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    dbedValor: TwwDBEdit;
    dblkpcmbRubrica: TwwDBLookupCombo;
    grpMesAnoRef: TGroupBox;
    dbedAnoMesRefRubSal: TwwDBEdit;
    GroupBox1: TGroupBox;
    dbedAnoMesCobRubSal: TwwDBEdit;
    DbGrdRubSal: TwwDBGrid;
    Dock973: TDock97;
    Shape5: TShape;
    Label47: TLabel;
    Shape1: TShape;
    Label48: TLabel;
    tb97BotoesDetalhe: TToolbar97;
    SbtnInsCargo: TToolbarButton97;
    SbtnAltCargo: TToolbarButton97;
    SbtnExcCargo: TToolbarButton97;
    CdsCargo: TClientDataSet;
    CdsModoCargo: TClientDataSet;
    CdsSituacao: TClientDataSet;
    CMSqlParams1: TCMSqlParams;
    DsEvolFuncPrev: TDataSource;
    CdsEvolFuncPrev: TCMClientDataSet;
    CdsFuncao: TClientDataSet;
    Dock972: TDock97;
    Shape2: TShape;
    Label49: TLabel;
    Shape3: TShape;
    Label50: TLabel;
    Toolbar971: TToolbar97;
    SbtnInsFuncao: TToolbarButton97;
    SbtnAltFuncao: TToolbarButton97;
    SbtnExcFuncao: TToolbarButton97;
    CdsModoFuncao: TClientDataSet;
    Dock975: TDock97;
    Shape4: TShape;
    Label51: TLabel;
    Shape6: TShape;
    Label52: TLabel;
    Toolbar972: TToolbar97;
    SbtnInsAdicComp: TToolbarButton97;
    SbtnAltAdicComp: TToolbarButton97;
    SbtnExcAdicComp: TToolbarButton97;
    Dock976: TDock97;
    Shape7: TShape;
    Label53: TLabel;
    Shape8: TShape;
    Label54: TLabel;
    Toolbar973: TToolbar97;
    SbtnInsATS: TToolbarButton97;
    SbtnAltATS: TToolbarButton97;
    SbtnExcATS: TToolbarButton97;
    Dock977: TDock97;
    Shape9: TShape;
    Label55: TLabel;
    Shape10: TShape;
    Label56: TLabel;
    Toolbar974: TToolbar97;
    SbtnInsAdicIns: TToolbarButton97;
    SbtnAltAdicIns: TToolbarButton97;
    SbtnExcAdicIns: TToolbarButton97;
    Dock978: TDock97;
    Shape11: TShape;
    Label57: TLabel;
    Shape12: TShape;
    Label58: TLabel;
    Toolbar975: TToolbar97;
    SbtnInsAdicNot: TToolbarButton97;
    SbtnAltAdicNot: TToolbarButton97;
    SbtnExcAdicNot: TToolbarButton97;
    Dock979: TDock97;
    Shape13: TShape;
    Label59: TLabel;
    Shape14: TShape;
    Label60: TLabel;
    Toolbar976: TToolbar97;
    SbtnInsAdicPer: TToolbarButton97;
    SbtnAltAdicPer: TToolbarButton97;
    SbtnExcAdicPer: TToolbarButton97;
    Dock9710: TDock97;
    Shape15: TShape;
    Label61: TLabel;
    Shape16: TShape;
    Label62: TLabel;
    Toolbar977: TToolbar97;
    SbtnInsOutras: TToolbarButton97;
    SbtnAltOutras: TToolbarButton97;
    SbtnExcOutras: TToolbarButton97;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    wwDBLookupCombo5: TwwDBLookupCombo;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label41: TLabel;
    CMDateTimePicker2: TCMDateTimePicker;
    dbEdPercAdicPeric: TDBEdit2;
    SpeedButton2: TSpeedButton;
    Label42: TLabel;
    wwDBLookupCombo4: TwwDBLookupCombo;
    Label43: TLabel;
    CMDateTimePicker3: TCMDateTimePicker;
    Label44: TLabel;
    CdsHistRubSal: TCMClientDataSet;
    DsHistRubSal: TDataSource;
    CdsRubrica: TClientDataSet;
    RegraMT: TRegraMT;
    Dock9711: TDock97;
    Toolbar978: TToolbar97;
    BtnRelatorio: TBitBtn;
    BtnSalvar: TBitBtn;
    SaveDialog: TSaveDialog;
    CdsAux: TClientDataSet;

    procedure FormShow(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure PgCtrlEtapaChange(Sender: TObject);
    procedure SbtnAltCargoClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure SbtnInsCargoClick(Sender: TObject);
    procedure SbtnExcCargoClick(Sender: TObject);
    procedure PgCtrlDetalheChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure DbGrdCargoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
    sSQL,
    sSQLRegra : String;
    CtrlPCS : TCtrlPCS;
    CtrlEvolFuncPrev : TCtrlEvolFuncPrev;

    RecDadosTitular : Record
                        IdPessJur,
                        IdPlanoPrev,
                        IdPlanoOrigem,
                        Idbeneficio,
                        SeqProposta,
                        IdTitular,
                        IdPessoa,
                        IdRegraEnquadra : Integer;

                        DIB : TDate;

                        Matricula,
                        NumeroProcesso,
                        NomePatro,
                        NomePlano,
                        NomeBeneficio,
                        SitPartAtual,
                        NomeTitular,
                        NomeRegraEnquadra : String;
                      End;

    Procedure EscondeGrid;
    Procedure MostraGrid;
    Procedure MontaSQLRegra(psAnoMesReferencia :String);

    Procedure SelecionaRegistros;

    Procedure PreparaInsercao;
    Procedure PreparaEdicao;
    Procedure CancelaEdicao;
    Procedure ExcluiRegistro;

    Procedure AtualizaOutrosDados(cTipoOperacao: Char);

    Procedure BuscaDadosCombo(piIdPessjur : Integer);

    Procedure ExecutaCalculos;

    Function ValidaTela: Boolean;
    Function ExecutaRegra(piNumRegra : Integer;
                          Var bErro : Boolean;
                          Var piIdCalculo : Integer ) : String;


  public
    { Public declarations }
  end;

var
  FrmSimulacaoEnquadramento: TFrmSimulacaoEnquadramento;

implementation

uses UMensErro,  uFuncoesUteis, fAguarde, uAdmPrev, DBaseDados, UParticipante,
     uDataBase,  uFuncaoGeral,  uModulo,  uSistema, uCtrlPadroes;


{$R *.DFM}


procedure TFrmSimulacaoEnquadramento.FormShow(Sender: TObject);
begin
  inherited;
  TwCons.Etapa.Pos           := 1;
  BtnAnterior.Visible := False;
  PgCtrlEtapa.ActivePage     := TbsSelecao;

  RecDadosTitular.IdTitular := -1;

  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 23.06.2003

  PgCtrlDetalhe.ActivePage := TbsCargo;
  DbGrdCargo.BringToFront;

end;

procedure TFrmSimulacaoEnquadramento.BtnProximoClick(Sender: TObject);
begin
  inherited;
  If RecDadosTitular.IdTitular <= 0 Then Exit;

  If Trim(lblNomeRegraSimulacao.Caption) = '' Then Begin
    MsgDlg('Regra de simulação não inforamda para esse plano.','Informação',
           mtInformation, [mbOk], 0);
    Exit;
  End;

  TwCons.Etapa.Avancar;

  If PgCtrlEtapa.ActivePage = TbsInfomacoesCalculo Then Begin

    If ( edAnoMesIni.Text = '    /  ' ) Or ( edAnoMesFim.Text = '    /  ' ) Then Begin
      MsgDlg('Período de cálculo é obrigatório.','Erro', mtError, [mbOk], 0);
      edAnoMesIni.SetFocus;
      Exit;
    End;
    
  End;

  PgCtrlEtapa.SelectNextPage( True );


end;

procedure TFrmSimulacaoEnquadramento.BtnAnteriorClick(Sender: TObject);
begin
  inherited;
  TwCons.Etapa.Retornar;
  PgCtrlEtapa.SelectNextPage( False );

end;

procedure TFrmSimulacaoEnquadramento.BtnCancelaClick(Sender: TObject);
begin
  inherited;
  CtrlEvolFuncPrev.Rollback;
  TwCons.Etapa.Pos := 0;
  PgCtrlEtapa.ActivePage := TbsSelecao;
  BtnAnterior.Visible := False;
end;

procedure TFrmSimulacaoEnquadramento.bbtnProcurarClick(Sender: TObject);
begin
  inherited;

  MontaSelect.Executar;

  if MontaSelect.RetornouValor then begin

    RecDadosTitular.IdPessJur       := StrToInt(MontaSelect.ValoresChave[3]);
    RecDadosTitular.IdPlanoPrev     := StrToInt(MontaSelect.ValoresChave[4]);
    RecDadosTitular.IdPlanoOrigem   := StrToInt(MontaSelect.ValoresChave[25]);
    RecDadosTitular.Idbeneficio     := StrToInt(ClienteNumero(MontaSelect.ValoresChave[19]));
    RecDadosTitular.SeqProposta     := StrToInt(MontaSelect.ValoresChave[2]);
    RecDadosTitular.IdTitular       := StrToInt(MontaSelect.ValoresChave[0]);
    If MontaSelect.ValoresChave[27] <> '' Then
      RecDadosTitular.IdRegraEnquadra := StrToInt(MontaSelect.ValoresChave[27]);

    if Trim(MontaSelect.ValoresChave[21]) = '' then
      RecDadosTitular.IdPessoa       := StrToInt(MontaSelect.ValoresChave[0])
    else
      RecDadosTitular.IdPessoa       := StrToInt(MontaSelect.ValoresChave[21]);

    RecDadosTitular.Matricula      := MontaSelect.ValoresChave[15];
    RecDadosTitular.NumeroProcesso := MontaSelect.ValoresChave[23];
    RecDadosTitular.DIB            := StrToDate( MontaSelect.ValoresChave[11] );
    RecDadosTitular.NomePatro      := MontaSelect.ValoresChave[12];
    RecDadosTitular.NomePlano      := MontaSelect.ValoresChave[13];
    RecDadosTitular.NomeBeneficio  := MontaSelect.ValoresChave[6];
    RecDadosTitular.SitPartAtual   := MontaSelect.ValoresChave[7];
    RecDadosTitular.NomeTitular    := MontaSelect.ValoresChave[5];

    lblNumProc.Caption            := MontaSelect.ValoresChave[23];
    lblParticipante.Caption       := MontaSelect.ValoresChave[5];
    lblDIB.Caption                := MontaSelect.ValoresChave[11];
    lblPatro.Caption              := MontaSelect.ValoresChave[12];
    lblBeneficio.Caption          := MontaSelect.ValoresChave[6];
    lblPlano.Caption              := MontaSelect.ValoresChave[13];
    lblMatricula.Caption          := MontaSelect.ValoresChave[15];
    lblNomeRegraSimulacao.Caption := MontaSelect.ValoresChave[26];

    

         if MontaSelect.ValoresChave[24] = 'AT' then lblSituacaoAtual.Caption := 'Ativo'
    else if MontaSelect.ValoresChave[24] = 'MA' then lblSituacaoAtual.Caption := 'Mantido'
    else if MontaSelect.ValoresChave[24] = 'MP' then lblSituacaoAtual.Caption := 'Mantido Parcial'
    else if MontaSelect.ValoresChave[24] = 'AS' then lblSituacaoAtual.Caption := 'Assistido'
    else if MontaSelect.ValoresChave[24] = 'MS' then lblSituacaoAtual.Caption := 'Manutenção de Saldo de Conta'
    else if MontaSelect.ValoresChave[24] = 'CA' then lblSituacaoAtual.Caption := 'Cancelado'
    else if MontaSelect.ValoresChave[24] = 'AE' then lblSituacaoAtual.Caption := 'Ativo Especial'
    else if MontaSelect.ValoresChave[24] = 'PN' then lblSituacaoAtual.Caption := 'Pendente';

    pnlTitulo.Caption := 'Simulação de enquadramento - Matrícula : '+MontaSelect.ValoresChave[15]+' - Data : '+DateToStr(date);

    BuscaDadosCombo( RecDadosTitular.IdPessJur );

    RecDadosTitular.NomeRegraEnquadra := lblNomeRegraSimulacao.Caption;

  end else begin
    RecDadosTitular.IdTitular := -1;
    lblParticipante.Caption := '';
  end;

end;

procedure TFrmSimulacaoEnquadramento.PgCtrlEtapaChange(Sender: TObject);
  begin
  inherited;

  BtnAnterior.Visible := True;
  BtnProximo.Visible  := True;

  If PgCtrlEtapa.ActivePage = TbsSelecao Then Begin
    BtnAnterior.Visible := False;
    If CtrlEvolFuncPrev.DataBase.InTransaction Then
      CtrlEvolFuncPrev.DataBase.Rollback;

  End Else If PgCtrlEtapa.ActivePage = TbsInfomacoesCalculo Then Begin
    edAnoMesIni.SetFocus;
    PgCtrlDetalhe.ActivePage := TbsCargo;
    PgCtrlDetalheChange( Self );

    If Not CtrlEvolFuncPrev.DataBase.InTransaction Then
      CtrlEvolFuncPrev.DataBase.StartTransaction;

  End Else If PgCtrlEtapa.ActivePage = TbsResultadoProcesso Then Begin
    BtnProximo.Visible  := False;

    ExecutaCalculos;

  End Else Begin
    BtnProximo.Visible  := False;

  End;

end;


{------------------------------------------------------------------------------}
procedure TFrmSimulacaoEnquadramento.EscondeGrid;
begin
  If PgCtrlDetalhe.ActivePage = TbsCargo                Then Begin
    DbGrdCargo.SendToBack;

  End Else If PgCtrlDetalhe.ActivePage = TbsFuncao      Then Begin
    DbGrdFuncao.SendToBack;

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicCompens Then Begin
    DbGrdAdicCompens.SendToBack;

  End Else If PgCtrlDetalhe.ActivePage = TbsATS         Then Begin
    DbGrdATS.SendToBack;

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicInsalub Then Begin
    DbGrdAdicInsalub.SendToBack;

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicNoturno Then Begin
    DbGrdAdicNoturno.SendToBack;

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicPericul Then Begin
    DbGrdAdicPericul.SendToBack;

  End Else If PgCtrlDetalhe.ActivePage = TbsRubSal      Then Begin
    DbGrdRubSal.SendToBack;

  End;
end;

{------------------------------------------------------------------------------}
procedure TFrmSimulacaoEnquadramento.MostraGrid;
begin
  If PgCtrlDetalhe.ActivePage = TbsCargo                Then Begin
    DbGrdCargo.BringToFront;

  End Else If PgCtrlDetalhe.ActivePage = TbsFuncao      Then Begin
    DbGrdFuncao.BringToFront;

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicCompens Then Begin
    DbGrdAdicCompens.BringToFront;

  End Else If PgCtrlDetalhe.ActivePage = TbsATS         Then Begin
    DbGrdATS.BringToFront;

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicInsalub Then Begin
    DbGrdAdicInsalub.BringToFront;

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicNoturno Then Begin
    DbGrdAdicNoturno.BringToFront;

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicPericul Then Begin
    DbGrdAdicPericul.BringToFront;

  End Else If PgCtrlDetalhe.ActivePage = TbsRubSal      Then Begin
    DbGrdRubSal.BringToFront;

  End;
end;



{------------------------------------------------------------------------------}
procedure TFrmSimulacaoEnquadramento.MontaSQLRegra(psAnoMesReferencia: String);
begin
  sSQLRegra :=

    'SELECT '+
    '  PP.SEQPROPOSTA,     PP.INSCRICAODATA,   PP.DTINICIOINSC,      PP.IDPESSOA AS IDTITULAR, '+
    '  BF.IDPESSJUR,       BF.IDPLANOPREV,     BF.IDPESSOA,          BF.IDTITULAR,             '+
    '  BF.IDPLANOORIGEM,                                                                       '+
    '                                                                                          '+
    '  PF.DATANASC,        PF.DATAMORTE,                                                       '+
    '  EL.SALTOTAL,        EL.DATAADMISSAO,    EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,     '+
    '  EL.TEMPOSERVTOTAL,  EL.DATADEMISSAO,    EL.FLGDIRETOR,        EL.TEMPOSERVTOTMES,       '+
    '  EL.TEMPOSERVTOTDIA,                                                                     '+
    '  SP.FLGINTERNO,                                                                          '+
    '  ''01/'+ Copy(psAnoMesReferencia,6,2)+'/' + Copy(psAnoMesReferencia,1,4)+ ''' AS DATAREF, '+

    QuotedStr( psAnoMesReferencia ) + ' AS ANOMESREF '+



    'FROM                                                                                      '+
    '  BENEFBFCIARIO BF,  ELEGPATRO EL,   PARTPREVPLAN PP,    PESSOAFISICA PF,                 '+
    '  SITPART SP,        SITFUNC SF,     BENEFPLANOPART BPL                                   '+
    'WHERE '+
    '      BF.IDPESSJUR    = '+ IntToStr( RecDadosTitular.IdPessJur   ) +
    '  AND BF.IDPLANOPREV  = '+ IntToStr( RecDadosTitular.IdPlanoPrev ) +
    '  AND BF.IDTITULAR    = '+ IntToStr( RecDadosTitular.IdTitular   ) +
    '  AND BF.IDPESSOA     = '+ IntToStr( RecDadosTitular.IdPessoa    );

  If RecDadosTitular.IdBeneficio <> 0 Then
  sSQLRegra := sSQLRegra +
    '  AND BF.IDBENEFICIO  = '+ IntToStr( RecDadosTitular.IdBeneficio );

  sSQLRegra := sSQLRegra +
    '  AND PP.IDPESSJUR    = BF.IDPESSJUR(+)     '+
    '  AND PP.IDPLANOPREV  = BF.IDPLANOORIGEM(+) '+
    '  AND PP.IDPESSOA     = BF.IDTITULAR(+)     '+
    '  AND PP.SEQPROPOSTA  = BF.SEQPROPOSTA(+)   '+
    '                                            '+
    '  AND EL.IDPESSJUR    = PP.IDPESSJUR        '+
    '  AND EL.IDPESSOA     = PP.IDPESSOA         '+
    '  AND PF.IDPESSOA     = EL.IDPESSOA         '+

    '  AND EL.IDSITFUNC    = SF.IDSITFUNC(+)     '+

    '  AND PP.IDSITPART    = SP.IDSITPART(+)     '+

    '  AND BF.IDPESSJUR    = BPL.IDPESSJUR(+)    '+
    '  AND BF.IDPLANOPREV  = BPL.IDPLANOPREV(+)  '+
    '  AND BF.IDPESSOA     = BPL.IDPESSOA(+)     '+
    '  AND BF.IDBENEFICIO  = BPL.IDBENEFICIO(+)  ';

end;


{------------------------------------------------------------------------------}
procedure TFrmSimulacaoEnquadramento.SelecionaRegistros;
begin

  If PgCtrlDetalhe.ActivePage = TbsCargo Then Begin
    CdsEvolFuncPrev.Data := CtrlEvolFuncPrev.BuscaCargos( RecDadosTitular.IdPessJur, RecDadosTitular.IdPessoa );

  End Else If PgCtrlDetalhe.ActivePage = TbsFuncao      Then Begin
    CdsEvolFuncPrev.Data := CtrlEvolFuncPrev.BuscaFuncoes( RecDadosTitular.IdPessJur,
                                                           RecDadosTitular.IdPessoa,
                                                           RecDadosTitular.IdPlanoPrev );

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicCompens Then Begin
    CdsEvolFuncPrev.Data := CtrlEvolFuncPrev.BuscaAdicCompens( RecDadosTitular.IdPessJur,
                                                               RecDadosTitular.IdPessoa );
  End Else If PgCtrlDetalhe.ActivePage = TbsATS         Then Begin
    CdsEvolFuncPrev.Data := CtrlEvolFuncPrev.BuscaATS( RecDadosTitular.IdPessJur,
                                                       RecDadosTitular.IdPessoa );
  End Else If PgCtrlDetalhe.ActivePage = TbsAdicInsalub Then Begin
    CdsEvolFuncPrev.Data := CtrlEvolFuncPrev.BuscaAdicInsalub( RecDadosTitular.IdPessJur,
                                                               RecDadosTitular.IdPessoa );
  End Else If PgCtrlDetalhe.ActivePage = TbsAdicNoturno Then Begin
    CdsEvolFuncPrev.Data := CtrlEvolFuncPrev.BuscaAdicNot( RecDadosTitular.IdPessJur,
                                                           RecDadosTitular.IdPessoa );

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicPericul Then Begin
    CdsEvolFuncPrev.Data := CtrlEvolFuncPrev.BuscaAdicNot( RecDadosTitular.IdPessJur,
                                                           RecDadosTitular.IdPessoa );
  End Else If PgCtrlDetalhe.ActivePage = TbsRubSal      Then Begin
    CdsHistRubSal.Data := CtrlEvolFuncPrev.BuscaRubSal( RecDadosTitular.IdPessJur,
                                                        RecDadosTitular.IdPessoa );
  End;


end;

{------------------------------------------------------------------------------}
Function TFrmSimulacaoEnquadramento.ValidaTela: Boolean;
Var
  bErroPercentual : Boolean;

begin
  Result := False;

  If PgCtrlDetalhe.ActivePage = TbsCargo Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsFuncao      Then Begin

    If Trim(dbEdPercFuncao.Text) = '' Then bErroPercentual := True;

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicCompens Then Begin

    If Trim(dbEdPercAdicComp1.Text) = '' Then bErroPercentual := True;

  End Else If PgCtrlDetalhe.ActivePage = TbsATS         Then Begin

    If Trim(dbEdPercATS.Text) = '' Then bErroPercentual := True;

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicInsalub Then Begin

    If Trim(dbEdPercAdicPeric.Text) = '' Then bErroPercentual := True;

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicNoturno Then Begin

    If Trim(dbEdPercAdicNot.Text) = '' Then bErroPercentual := True;

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicPericul Then Begin

    If Trim(dbEdPercAdicPeric.Text) = '' Then bErroPercentual := True;

  End Else If PgCtrlDetalhe.ActivePage = TbsRubSal      Then Begin

  End;

  If bErroPercentual = True Then Begin
    MsgDlg('Percentual é obrigatório.', 'Erro', mtError, [mbOk], 0);
    Exit;
  End;

  Result := True;
end;


{------------------------------------------------------------------------------}
procedure TFrmSimulacaoEnquadramento.PreparaInsercao;
begin

  Dock974.Visible := True;

  EscondeGrid;

  If PgCtrlDetalhe.ActivePage = TbsRubSal Then Begin
    CdsHistRubSal.Append;

    CdsHistRubSal.FieldByName('IDPATRO').AsInteger           := RecDadosTitular.IdPessJur;
    CdsHistRubSal.FieldByName('IDPESSJUR').AsInteger         := RecDadosTitular.IdPessJur;
    CdsHistRubSal.FieldByName('IDPESSOA').AsInteger          := RecDadosTitular.IdPessoa;
    CdsHistRubSal.FieldByName('SEQRUBRICA').AsInteger        := (CdsHistRubSal.RecordCount + 1);
    CdsHistRubSal.FieldByName('CODPROVDESC').AsString        := CdsRubrica.FieldByName('CodProvDesc').AsString;
    CdsHistRubSal.FieldByName('FLGCOMPOEREMTOTAL').AsInteger := CdsRubrica.FieldByName('FLGCOMPOEREMTOTAL').AsInteger;
    CdsHistRubSal.FieldByName('FLGCOMPOESALBENEF').AsInteger := CdsRubrica.FieldByName('FLGCOMPOESALBENEF').AsInteger;
    CdsHistRubSal.FieldByName('FLGCOMPOESALPART').AsInteger  := CdsRubrica.FieldByName('FLGCOMPOESALPART').AsInteger;
    CdsHistRubSal.FieldByName('FLGCONCESSAO').AsInteger      := 0;
    CdsHistRubSal.FieldByName('FLGIRRF').AsInteger           := CdsRubrica.FieldByName('FLGIRRF').AsInteger;
    CdsHistRubSal.FieldByName('FLGPREVIA').AsInteger         := 1;
    CdsHistRubSal.FieldByName('FLGSALBENEFRETRO').AsInteger  := CdsRubrica.FieldByName('FLGSALBENEFRETRO').AsInteger;
    CdsHistRubSal.FieldByName('FLGSALPARTATUARIA').AsInteger := CdsRubrica.FieldByName('FLGSALPARTATUARIA').AsInteger;
    CdsHistRubSal.FieldByName('FLGSALPARTRETRO').AsInteger   := CdsRubrica.FieldByName('FLGSALPARTRETRO').AsInteger;
    CdsHistRubSal.FieldByName('FLGSRB').AsInteger            := 0;
    CdsHistRubSal.FieldByName('IDMODULO').AsInteger          := Sistema.IdModulo;
    CdsHistRubSal.FieldByName('IDMOTIVO').AsInteger          := prmIdMotivoContrib;
    CdsHistRubSal.FieldByName('REFERENCIA').AsString         := '***';
    CdsHistRubSal.FieldByName('SEQRUBRICA').AsInteger        := 1;
    CdsHistRubSal.FieldByName('FLGEQUIPARACAO').AsInteger    := 1;
    CdsHistRubSal.FieldByName('TIPOITEMPCS').AsInteger       := 1;
    CdsHistRubSal.FieldByName('MODULO').AsString             := 'AdmPREV';
    CdsHistRubSal.FieldByName('DESCRPROVDESC').AsString      := CdsRubrica.FieldByName('DESCRPROVDESC').AsString;

  End Else Begin
    CdsEvolFuncPrev.Append;

    CdsEvolFuncPrev.FieldByName('ORIGEM').AsString       := 'C';
    CdsEvolFuncPrev.FieldByName('DESCORIGEM').AsString   := 'Cadastrado';
    CdsEvolFuncPrev.FieldByName('IDPESSJUR').AsInteger   := RecDadosTitular.IdPessJur;
    CdsEvolFuncPrev.FieldByName('IDPESSJURFG').AsInteger := RecDadosTitular.IdPessJur;
    CdsEvolFuncPrev.FieldByName('IDPESSOA').AsInteger    := RecDadosTitular.IdPessoa;
  End;

  If PgCtrlDetalhe.ActivePage = TbsCargo Then Begin

    

  End Else If PgCtrlDetalhe.ActivePage = TbsFuncao      Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicCompens Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsATS         Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicInsalub Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicNoturno Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicPericul Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsRubSal      Then Begin

  End;

end;

{------------------------------------------------------------------------------}
procedure TFrmSimulacaoEnquadramento.PreparaEdicao;
begin

  Dock974.Visible := True;

  EscondeGrid;

  If PgCtrlDetalhe.ActivePage = TbsCargo Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsFuncao      Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicCompens Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsATS         Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicInsalub Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicNoturno Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicPericul Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsRubSal      Then Begin

  End;

  If PgCtrlDetalhe.ActivePage = TbsRubSal Then Begin
    CdsHistRubSal.Edit;
  End Else Begin
    CdsEvolFuncPrev.Edit;
  End;

end;

{------------------------------------------------------------------------------}
procedure TFrmSimulacaoEnquadramento.CancelaEdicao;
begin

  Dock974.Visible := False;

  If PgCtrlDetalhe.ActivePage = TbsCargo Then Begin

    SbtnInsCargo.Down := False;
    SbtnAltCargo.Down := False;
    SbtnExcCargo.Down := False;

  End Else If PgCtrlDetalhe.ActivePage = TbsFuncao      Then Begin

    SbtnInsFuncao.Down := False;
    SbtnAltFuncao.Down := False;
    SbtnExcFuncao.Down := False;

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicCompens Then Begin

    SbtnInsAdicComp.Down := False;
    SbtnAltAdicComp.Down := False;
    SbtnExcAdicComp.Down := False;

  End Else If PgCtrlDetalhe.ActivePage = TbsATS         Then Begin

    SbtnInsATS.Down := False;
    SbtnAltATS.Down := False;
    SbtnExcATS.Down := False;

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicInsalub Then Begin

    SbtnInsAdicIns.Down := False;
    SbtnAltAdicIns.Down := False;
    SbtnExcAdicIns.Down := False;

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicNoturno Then Begin

    SbtnInsAdicNot.Down := False;
    SbtnAltAdicNot.Down := False;
    SbtnExcAdicNot.Down := False;

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicPericul Then Begin

    SbtnInsAdicPer.Down := False;
    SbtnAltAdicPer.Down := False;
    SbtnExcAdicPer.Down := False;

  End Else If PgCtrlDetalhe.ActivePage = TbsRubSal      Then Begin

    SbtnInsOutras.Down := False;
    SbtnAltOutras.Down := False;
    SbtnExcOutras.Down := False;

  End;

  If PgCtrlDetalhe.ActivePage = TbsRubSal Then Begin
    If CdsHistRubSal.State in [dsInsert, dsEdit] Then Begin
      CdsHistRubSal.Cancel;
      CdsHistRubSal.CancelUpdates;
    End;
  End Else Begin
    If CdsEvolFuncPrev.State in [dsInsert, dsEdit] Then Begin
      CdsEvolFuncPrev.Cancel;
      CdsEvolFuncPrev.CancelUpdates;
    End;
  End;

  MostraGrid;

end;

{------------------------------------------------------------------------------}
procedure TFrmSimulacaoEnquadramento.ExcluiRegistro;
Var
  mResult : TModalResult;
begin

  mResult := MsgDlg('Confirmar a exclusão ?', 'Informação',
                    mtConfirmation, [mbYes, mbNo, mbCancel],0);
  If mResult = mrYes Then Begin
    If PgCtrlDetalhe.ActivePage = TbsRubSal      Then Begin
      CdsHistRubSal.Delete;
      CtrlEvolFuncPrev.GravaHistRubSal;
    End Else Begin
      CdsEvolFuncPrev.Delete;
      CtrlEvolFuncPrev.GravaEvolFuncPrev;
    End;
  End;

end;

{------------------------------------------------------------------------------}
procedure TFrmSimulacaoEnquadramento.AtualizaOutrosDados(cTipoOperacao: Char);
begin

  If PgCtrlDetalhe.ActivePage = TbsCargo Then Begin
    CtrlEvolFuncPrev.AtualizaDataFinalCargo(CdsEvolFuncPrev.FieldByName('DATAINICIO').AsDateTime,
                                            cTipoOperacao,
                                            RecDadosTitular.IdPessJur, RecDadosTitular.IdPessoa);
  End Else If PgCtrlDetalhe.ActivePage = TbsFuncao      Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicCompens Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsATS         Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicInsalub Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicNoturno Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsAdicPericul Then Begin

  End Else If PgCtrlDetalhe.ActivePage = TbsRubSal      Then Begin

  End;


end;


procedure TFrmSimulacaoEnquadramento.SbtnInsCargoClick(Sender: TObject);
begin
  inherited;

  PreparaInsercao;

end;

procedure TFrmSimulacaoEnquadramento.SbtnAltCargoClick(Sender: TObject);
begin
  inherited;

  PreparaEdicao;

end;

procedure TFrmSimulacaoEnquadramento.SbtnExcCargoClick(Sender: TObject);
begin
  inherited;

  ExcluiRegistro;

end;

procedure TFrmSimulacaoEnquadramento.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;

  CancelaEdicao;

end;




procedure TFrmSimulacaoEnquadramento.PgCtrlDetalheChange(Sender: TObject);
begin
  inherited;

  CancelaEdicao;

  SelecionaRegistros;

end;

procedure TFrmSimulacaoEnquadramento.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlPCS := TCtrlPCS.Create;
  CtrlPCS.InitializeAs( Padroes );

  CtrlEvolFuncPrev := TCtrlEvolFuncPrev.Create;
  CtrlEvolFuncPrev.InitializeAs( Padroes );
  CtrlEvolFuncPrev.OpenTransaction := False;

  CtrlEvolFuncPrev.CdsEvolFuncPrev := CdsEvolFuncPrev;
  CtrlEvolFuncPrev.CdsHistRubSal   := CdsHistRubSal;


end;

procedure TFrmSimulacaoEnquadramento.FormClose(Sender: TObject;
                                               var Action: TCloseAction);
begin

  CdsEvolFuncPrev.Close;
  CdsHistRubSal.Close;
  CdsCargo.Close;
  CdsFuncao.Close;
  CdsModoCargo.Close;
  CdsModoFuncao.Close;
  CdsSituacao.Close;

  CtrlPCS.Free;
  CtrlEvolFuncPrev.Free;

  inherited;
end;

procedure TFrmSimulacaoEnquadramento.BuscaDadosCombo(piIdPessjur: Integer);
begin

  CdsCargo.Data      := CtrlPCS.ListaCargo  ( piIdPessjur );
  CdsFuncao.Data     := CtrlPCS.ListaFuncao ( piIdPessjur );
  CdsRubrica.Data    := CtrlPCS.ListaRubrica( piIdPessjur );
  CdsModoCargo.Data  := CtrlPCS.ListaModoCargo;
  CdsModoFuncao.Data := CtrlPCS.ListaModoFuncao;
  CdsSituacao.Data   := CtrlPCS.ListaSituacao;

end;


procedure TFrmSimulacaoEnquadramento.ExecutaCalculos;
Var
  sAnoMesAtual, sAnoMesFinal,
  sValorSimulaMes, sSQL : String;
  iIdCalculo : Integer;
  bErro : Boolean;

begin

  sAnoMesAtual := edAnoMesIni.Text;
  sAnoMesFinal := edAnoMesFim.Text;

  MemoResultado.Lines.Clear;

  MemoResultado.Lines.Add( StringOfChar('=', 69) );

  MemoResultado.Lines.Add( ' SIMULAÇÃO DE ENQUADRAMENTO ');
  MemoResultado.Lines.Add( ' DATA : '+ DateTimeToStr( Date )  );

  MemoResultado.Lines.Add( StringOfChar('-', 69) );

  MemoResultado.Lines.Add( ' NOME DO TITULAR  : '+ RecDadosTitular.NomeTitular );

  MemoResultado.Lines.Add( ' PATROCINADORA    : '+ RecDadosTitular.NomePatro );
  MemoResultado.Lines.Add( ' PLANO PREVIDENC. : '+ RecDadosTitular.NomePlano );
  MemoResultado.Lines.Add( ' REGRA DE CÁLCULO : '+ RecDadosTitular.NomeRegraEnquadra );


  MemoResultado.Lines.Add( StringOfChar('-', 69) );

  MemoResultado.Lines.Add( ' MÊS                         VALOR' );
  MemoResultado.Lines.Add( ' ' + StringOfChar('-', 07) +
                                 StringOfChar(' ', 11) +
                                 StringOfChar('-', 15) );

  {----------------------------------------------------------------------------}
  While sAnoMesAtual <= sAnoMesFinal Do Begin

    MontaSQLRegra( sAnoMesAtual );

    sValorSimulaMes := ExecutaRegra( RecDadosTitular.IdRegraEnquadra, bErro, iIdCalculo );

    MemoResultado.Lines.Add( ' '+ sAnoMesAtual + '                  '+ FloatToStrF( StrToFloat(sValorSimulaMes),  ffNumber, 12,2 ) );


    { Imprime memória de calculo }
    CdsAux.Data := CtrlEvolFuncPrev.BuscaDetCalculo( RecDadosTitular.IdTitular, sAnoMesAtual );
    If Not CdsAux.IsEmpty Then Begin

      MemoResultado.Lines.Add( StringOfChar(' ', 10) + StringOfChar('-', 24) );
      
      While Not CdsAux.Eof Do Begin
        MemoResultado.Lines.Add( StringOfChar(' ', 10) +
                                 CdsAux.FieldByName('DESCRICAO').AsString+
                                 StringOfChar(' ', 06) +
                                 CdsAux.FieldByName('VALOR').AsString
                               );


        CdsAux.Next;
      End; 

    End; 

    MemoResultado.Lines.Add( StringOfChar(' ', 69) );
    sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)),
                                  StrToInt(Copy(sAnoMesAtual, 1,4)))

  End;
  {----------------------------------------------------------------------------}


end;


procedure TFrmSimulacaoEnquadramento.bbtnSairClick(Sender: TObject);
begin
  CtrlEvolFuncPrev.Rollback;
  inherited;

end;

procedure TFrmSimulacaoEnquadramento.bbtnOkDetClick(Sender: TObject);
Var
  cOperacao : Char;
begin
  inherited;

  If Not ValidaTela Then Exit;

  If PgCtrlDetalhe.ActivePage = TbsRubSal      Then Begin

    If CdsHistRubSal.State in [dsInsert] Then Begin
      cOperacao := 'I';
    End Else If CdsHistRubSal.State in [dsEdit] Then Begin
      cOperacao := 'E';
    End;

    CdsHistRubSal.Post;
    CtrlEvolFuncPrev.GravaHistRubSal;
  End Else Begin

    If CdsEvolFuncPrev.State in [dsInsert] Then Begin
      cOperacao := 'I';
    End Else If CdsEvolFuncPrev.State in [dsEdit] Then Begin
      cOperacao := 'E';
    End;

    CdsEvolFuncPrev.Post;
    CtrlEvolFuncPrev.GravaEvolFuncPrev;
  End;

  AtualizaOutrosDados( cOperacao );

  SelecionaRegistros;

  If cOperacao = 'I' Then Begin             { Inserindo }

    PreparaInsercao;

  End Else If cOperacao = 'E' Then Begin    { Editando  }

    CancelaEdicao;

  End;




end;


procedure TFrmSimulacaoEnquadramento.DbGrdCargoCalcCellColors(Sender: TObject;
                                                              Field: TField;
                                                              State: TGridDrawState;
                                                              Highlight: Boolean;
                                                              AFont: TFont; ABrush: TBrush);
begin
  inherited;

  If PgCtrlDetalhe.ActivePage <> TbsRubSal Then Begin
    If (CdsEvolFuncPrev.FieldByName('FLGSITPART').AsString = 'AT' ) Or
       (CdsEvolFuncPrev.FieldByName('FLGSITPART').AsString = '')
    Then Begin
       ABrush.Color := clWhite;
       AFont.Color  := clWindowText;
    End Else If (CdsEvolFuncPrev.FieldByName('FLGSITPART').AsString = 'AS' ) Then Begin
      ABrush.Color := $00CAFFFF;
      AFont.Color  := clWindowText;
    End;
  End;

end;


function TFrmSimulacaoEnquadramento.ExecutaRegra(piNumRegra : Integer;
                                                 var bErro: Boolean;
                                                 var piIdCalculo: Integer): String;
var
  cAux : char;
begin
  Result := '0';
  bErro := False;

  If piIdCalculo < 0 Then piIdCalculo := 0;

  If piNumRegra = 0 Then Exit;

  RegraMT.RuleNumber   := IntToStr( piNumRegra );
  RegraMT.IdCalculo    := piIdCalculo;
  RegraMT.GravaCalculo := True;

  RegraMT.GeraDataSet( sSQLRegra );

  

  RegraMT.Execute;

  if not RegraMT.Error then begin
    piIdCalculo := RegraMT.IdCalculo;

    Try
      StrToFloat(ClienteNumero(RegraMT.Result))
    Except
      bErro := True;
    End;

    Result := OraNumero(RegraMT.Result);
  end else begin
     bErro := True;
     piIdCalculo := -1;
  end;

end;

procedure TFrmSimulacaoEnquadramento.BtnSalvarClick(Sender: TObject);
begin
  inherited;
  SaveDialog.FileName := 'Resultado simulação da matricula '+RecDadosTitular.Matricula+'.txt';

  if SaveDialog.Execute then begin

    if FileExists( SaveDialog.FileName ) Then Begin
      If MessageDlg( 'Arquivo já existe, deseja gravar assim mesmo? ',
                  mtConfirmation, [mbYes, mbNo], 0  ) = mrNo
      Then Begin
        Exit;
      End;
    end;

    MemoResultado.Lines.SaveToFile( SaveDialog.Filename );
  end;

end;

procedure TFrmSimulacaoEnquadramento.BtnRelatorioClick(Sender: TObject);
begin
  inherited;
  MemoResultado.Print('Resultado simulação da matricula '+RecDadosTitular.Matricula+'.txt');
end;

end.
