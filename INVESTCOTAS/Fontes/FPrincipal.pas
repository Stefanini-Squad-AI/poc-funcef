unit Fprincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  StdCtrls, TB97, Db, DBTables, Wwquery, Wwdatsrc, wwdblook, Mask, wwdbedit,
  DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, Wwtable,
  Grids, DBGrids, IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti,
  CMProcuraMask, CorreioCM, fcLabel, TREdit, OleCtrls, vcf1, fcOutlookList,
  fcButton, fcImgBtn, fcShapeBtn, fcClearPanel, fcButtonGroup, fcOutlookBar,
  ToolWin, AppEvnts, StdActns, ActnList, ImgList, fcStatusBar,
  CMApplicationEvents, SConnect, MConnect, DBClient, CMNetUsers, uResource,
  uCtrlPadroes, uCtrlEventoCaixaCota;

type
  TFrmPrincipal = class(TfrmCMPrincipal)
    N26: TMenuItem;
    IndiceAtuarial1: TMenuItem;
    N27: TMenuItem;
    CadastraCotaespPerodo1: TMenuItem;
    CadastraCotaespPerodo2: TMenuItem;
    BtCalculadoraWindows: TToolbarButton97;
    Timer: TTimer;
    N30: TMenuItem;
    Utilitrio21: TMenuItem;
    CadastraFeriadoInvestimento1: TMenuItem;
    mnuProcessos: TMenuItem;
    QryParamImport: TwwQuery;
    N1: TMenuItem;
    MnuEventoCaixaCota: TMenuItem;
    MnuCarteiraXEvento: TMenuItem;
    MnuOperacao: TMenuItem;
    MnuLancamentoCaixa: TMenuItem;
    MnuLancamentoCota: TMenuItem;
    MnuApuracaoCaixa: TMenuItem;
    MnuApuracaoCota: TMenuItem;
    N2: TMenuItem;
    MnuLanctoDep: TMenuItem;
    MnuLanctoRet: TMenuItem;
    N3: TMenuItem;
    MnuCarteira: TMenuItem;
    MnuConsCadastros: TMenuItem;
    MnuConsOperacoes: TMenuItem;
    N4: TMenuItem;
    MnuConsCartParam: TMenuItem;
    MnuConsEvCaixaCota: TMenuItem;
    MnuConsCartXEvento: TMenuItem;
    MnuConsLancCaixa: TMenuItem;
    MnuConsLancCota: TMenuItem;
    MnuApuracao: TMenuItem;
    MnuConsApuraCota: TMenuItem;
    MnuConsEvolucaoPatr: TMenuItem;
    MnuConsLancDepRet: TMenuItem;
    MnuConsApuraCaixa: TMenuItem;
    procedure HabilitaMenus;
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure BtCalculadoraWindowsClick(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure MnuEventoCaixaCotaClick(Sender: TObject);
    procedure MnuCarteiraXEventoClick(Sender: TObject);
    procedure MnuLancamentoCaixaClick(Sender: TObject);
    procedure MnuLancamentoCotaClick(Sender: TObject);
    procedure MnuCarteiraClick(Sender: TObject);
    procedure MnuLanctoDepClick(Sender: TObject);
    procedure MnuLanctoRetClick(Sender: TObject);
    procedure MnuApuracaoCaixaClick(Sender: TObject);
    procedure MnuApuracaoCotaClick(Sender: TObject);
    procedure MnuConsCartParamClick(Sender: TObject);
    procedure MnuConsEvCaixaCotaClick(Sender: TObject);
    procedure MnuConsCartXEventoClick(Sender: TObject);
    procedure MnuConsLancCaixaClick(Sender: TObject);
    procedure MnuConsLancCotaClick(Sender: TObject);
    procedure MnuConsApuraCotaClick(Sender: TObject);
    procedure MnuConsEvolucaoPatrClick(Sender: TObject);
    procedure MnuConsLancDepRetClick(Sender: TObject);
    procedure MnuConsApuraCaixaClick(Sender: TObject);

  private
    { Private declarations }

    CtrlEventoCaixaCota : TCtrlEventoCaixaCota;

    procedure EventosFixos;

  public
    { Public declarations }

  end;


var
  FrmPrincipal: TFrmPrincipal;
  wUltImport:TTime;

implementation

uses    
  FTelaAut, USistema, UMensErro, UModulo, FParamCotaInvest,
  FCadEveCaixaCota, FCadCarteiraXEvento, FCadLanctoCaixa, FCadLanctoCota,
  FCadCarteiraInvest, FCadDeposito, FCadRetirada, FSelApuraCaixa,
  FProcCalcCaixa, FSelApuraCota, FProcCalcCota, FConsCartInvParam,
  FDMRelCarteiraParam, FConsEventoCaixaCota, FDMRelEventoCaixaCota,
  FConsCartXEvento, FDMRelCartXEvento, FConsLanctoCaixa, FDMRelLanctoCaixa,
  FConsLanctoCota, FDMRelLanctoCota, FConsEvolucaoPatr, FDMRelEvolucaoPatr,
  FConsLancDepRetr, FDMRelLancDepRetr, FConsApuraCota, FDMRelApuraCota,
  FDMRelApuraCaixa, FConsApuraCaixa;

{$R *.DFM}


//---------------------------------------------------
// Variacao dos Investimentos
procedure TFrmPrincipal.HabilitaMenus;
var
  i: integer;
begin
   // Para habilitar menus
   if (Pos('.CM',Sistema.NomeUsuario) > 0) or (Pos('CM',Sistema.NomeUsuario) = 1) then // Somente para usuário .CM ou CM
   begin
      for i := 0 to ComponentCount -1 do
      begin
        if Components[i] is TMenuItem then
          (Components[i] as TMenuItem).Enabled := True;
      end;
   end;

   Mnu_UsoPessoal_Padrao.Visible := False;
   mnuVariacaoIndices.Visible := False;

   MnuConsultasGerais_Padrao.Visible := False;
   MnuConsPart_Padrao.Visible := False;

   mnuRAD.Visible := False;
   btnExecEtapa.Visible := False;
end;

procedure TFrmPrincipal.EventosFixos;
begin
   try
      CtrlEventoCaixaCota := TCtrlEventoCaixaCota.Create;
      CtrlEventoCaixaCota.InitializeAs(Padroes);

      CtrlEventoCaixaCota.IncluirEventosFixos;

   finally
      FreeAndNil(CtrlEventoCaixaCota);
   end;
end;

procedure TFrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
  inherited;
   HabilitaMenus;
   EventosFixos;
end;

procedure TFrmPrincipal.BtCalculadoraWindowsClick(Sender: TObject);
begin
  inherited;
  WinExec('Calc.Exe',SW_SHOWNORMAL);
end;

procedure TFrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TRelCarteiraParam, RelCarteiraParam);
   Application.CreateForm(TRelEventoCaixaCota, RelEventoCaixaCota);
   Application.CreateForm(TRelCartXEvento, RelCartXEvento);
   Application.CreateForm(TRelLanctoCaixa, RelLanctoCaixa);
   Application.CreateForm(TRelLanctoCota, RelLanctoCota);
   Application.CreateForm(TRelEvolucaoPatr, RelEvolucaoPatr);
   Application.CreateForm(TRelLancDepRetr, RelLancDepRetr);
   Application.CreateForm(TRelApuraCota, RelApuraCota);
   Application.CreateForm(TRelApuraCaixa, RelApuraCaixa);
end;

procedure TFrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmParamCotaInvest, TFrmParamCotaInvest, false);
end;

procedure TFrmPrincipal.MnuEventoCaixaCotaClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmCadEveCaixaCota, TFrmCadEveCaixaCota, false);
end;

procedure TFrmPrincipal.MnuCarteiraXEventoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmCadCarteiraXEvento, TFrmCadCarteiraXEvento, false);
end;

procedure TFrmPrincipal.MnuLancamentoCaixaClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmCadLanctoCaixa, TFrmCadLanctoCaixa, false);
end;

procedure TFrmPrincipal.MnuLancamentoCotaClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmCadLanctoCota, TFrmCadLanctoCota, false);
end;

procedure TFrmPrincipal.MnuCarteiraClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmCadCarteiraInvest, TFrmCadCarteiraInvest, false);
end;

procedure TFrmPrincipal.MnuLanctoDepClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmCadDeposito, TFrmCadDeposito, false);
end;

procedure TFrmPrincipal.MnuLanctoRetClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmCadRetirada, TFrmCadRetirada, false);
end;

procedure TFrmPrincipal.MnuApuracaoCaixaClick(Sender: TObject);
var dData : TDateTime;
    iCarteira : Integer;
begin
  inherited;

   Application.CreateForm(TFrmSelApuraCaixa, FrmSelApuraCaixa);
   AbrirFormModal(FrmSelApuraCaixa, TFrmSelApuraCaixa);

   dData := FrmSelApuraCaixa.DataCalc;
   iCarteira := FrmSelApuraCaixa.CarteiraInvest;

   if iCarteira > 0  then
   begin
      AbrirForm(FrmProcCalcCaixa, TFrmProcCalcCaixa, False);

      FrmProcCalcCaixa.DataCalc := dData;
      FrmProcCalcCaixa.CarteiraInvest := iCarteira;
      FrmProcCalcCaixa.Sel;
   end;
end;

procedure TFrmPrincipal.MnuApuracaoCotaClick(Sender: TObject);
var dData : TDateTime;
    iCarteira : Integer;
begin
  inherited;

   Application.CreateForm(TFrmSelApuraCota, FrmSelApuraCota);
   AbrirFormModal(FrmSelApuraCota, TFrmSelApuraCota);

   dData := FrmSelApuraCota.DataCalc;
   iCarteira := FrmSelApuraCota.CarteiraInvest;

   if iCarteira > 0  then
   begin
      AbrirForm(FrmProcCalcCota, TFrmProcCalcCota, False);

      FrmProcCalcCota.DataCalc := dData;
      FrmProcCalcCota.CarteiraInvest := iCarteira;
      FrmProcCalcCota.Sel;
   end;
end;

procedure TFrmPrincipal.MnuConsCartParamClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmConsCartInvParam, TFrmConsCartInvParam, false);
end;

procedure TFrmPrincipal.MnuConsEvCaixaCotaClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmConsEventoCaixaCota, TFrmConsEventoCaixaCota, false);
end;

procedure TFrmPrincipal.MnuConsCartXEventoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmConsCartXEvento, TFrmConsCartXEvento, false);
end;

procedure TFrmPrincipal.MnuConsLancCaixaClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmConsLanctoCaixa, TFrmConsLanctoCaixa, false);
end;

procedure TFrmPrincipal.MnuConsLancCotaClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmConsLanctoCota, TFrmConsLanctoCota, false);
end;

procedure TFrmPrincipal.MnuConsApuraCotaClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmConsApuraCota, TFrmConsApuraCota, false);
end;

procedure TFrmPrincipal.MnuConsEvolucaoPatrClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmConsEvolucaoPatr, TFrmConsEvolucaoPatr, false);
end;

procedure TFrmPrincipal.MnuConsLancDepRetClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmConsLancDepRetr, TFrmConsLancDepRetr, false);
end;

procedure TFrmPrincipal.MnuConsApuraCaixaClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmConsApuraCaixa, TFrmConsApuraCaixa, false);
end;

Initialization
// Instancia a Classes do Sistema
   Sistema.NomeModulo	  := 'Controle de Cotas de Investimentos';  // Nome do Módulo
   Sistema.IdModulo	  := 737;                                   // IdModulo cadastrado no SAD
   Sistema.Versao := '4.00.00a';
   Sistema.NomeAplicativo := 'Controle de Cotas de Investimentos';  //Nome do Sistema
   Modulo                 := TModulo.Create;

Finalization
// Libera a Classes do Sistema
   Modulo.Free;
end.
