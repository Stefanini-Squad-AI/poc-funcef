//******************************************************************************
// Data      : 08/05/2007
// Codigo    : AL_5
// Pendência :
// Sol       :
// Motivo    : Implementação da Permissão do Uso da Carteira Gerencial em
//             virtude do parâmetro do sistema Utiliza carteira/Data
//******************************************************************************
// Data      : 03/01/2007
// Codigo    : AL_4
// Pendência : 24094
// Sol       :
// Motivo    : Alterado a chamada da Implementação do plano/patrocinador
//******************************************************************************
// Data      : 31/08/2006
// Codigo    : AL_3
// Pendência :
// Sol       :
// Motivo    : Implementação do plano/patrocinador
//******************************************************************************
// Data      : 08/06/2006
// Código    : AL_2
// Pendencia :
// SOL       :
// Motivo    : Ajuste na passagem do parametro da carteira
//******************************************************************************
// Data      : 08/02/2006
// Código    : AL_1
// Pendencia :
// SOL       : 35066
// Motivo    : Ajuste na movimentação das operações virtuais, essa passam a ser
//             consultada independentes da atualização da carteira gerencial
//******************************************************************************
// Data      : 18/01/2005
// Código    :
// Pendencia :
// SOL       :
// Motivo    :
//******************************************************************************

unit FConsMovOperVirtualMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, DBaseDados,
  uMensErro, uSistema, FPreview, Db, Grids, Wwdbigrd,
  Wwdbgrid, wwdblook, wwdbdatetimepicker, CMDateTimePicker, DBClient,
  uCtrlInvestimento, uCtrlPadroes, uCtrlRendaVariavel, uCmSqlParams,
  uCtrlCarteiraGerenc, uCMClientDataSet, RMovOperVirtual;

type
  TFrmConsMovOperVirtualMT = class(TfrmOkCancelarRelInv)
    cdsCarteira: TCMClientDataSet;
    cdsInvestimento: TCMClientDataSet;
    pnlFiltros: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    dblCarteira: TwwDBLookupCombo;
    dblInvestimento: TwwDBLookupCombo;
    pnlGrid: TPanel;
    grdConsulta: TwwDBGrid;
    cdsMovOperVirtual: TCMClientDataSet;
    dsMovOperVirtual: TDataSource;
    cdsEvCaixaCota: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    cdsMovOperVirtualDATAHISTCAIXA: TDateTimeField;
    cdsMovOperVirtualDESCCARTGERENC: TStringField;
    cdsMovOperVirtualDESCCAIXACOTA: TStringField;
    cdsMovOperVirtualDESCINVESTIMENTO: TStringField;
    cdsMovOperVirtualVLRHISTCAIXA: TFloatField;
    cdsMovOperVirtualQTDEOPERACAO: TFloatField;
    cdsMovOperVirtualPRECOUNITOPERACAO: TFloatField;
    cdsMovOperVirtualDESCTIPOOPERACAO: TStringField;
    cdsPlanoPrev: TCMClientDataSet;
    CMSqlParams2: TCMSqlParams;
    dblPlanoPrev: TwwDBLookupCombo;
    Label3: TLabel;
    cdsMovOperVirtualPLANPRVCONTABPATRO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    //AL_5
    procedure edDataFimExit(Sender: TObject);
  private
    { Private declarations }
    CtrlInvestimento   : TCtrlInvestimento;
    CtrlRendaVariavel  : TCtrlRendaVariavel;
    CtrlCarteiraGerenc : TCtrlCarteiraGerenc;
    RelMovOperVirtual  : TRelMovOperVirtual;
  public
    { Public declarations }
  end;

var
   FrmConsMovOperVirtualMT: TFrmConsMovOperVirtualMT;

implementation

//AL_5
uses URendaVariavel;

{$R *.DFM}

procedure TFrmConsMovOperVirtualMT.FormCreate(Sender: TObject);
begin
  inherited;
   relMovOperVirtual    := TRelMovOperVirtual.Create(Self);
   CtrlInvestimento     := TCtrlInvestimento.Create;
   CtrlRendaVariavel    := TCtrlRendaVariavel.Create;
   CtrlCarteiraGerenc   := TCtrlCarteiraGerenc.Create;

   CtrlInvestimento.InitializeAs(Padroes);
   CtrlRendaVariavel.InitializeAs(Padroes);
   CtrlCarteiraGerenc.InitializeAs(Padroes);

   //AL_2
   //AL_5
   cdsCarteira.Data     := CtrlInvestimento.ListCarteira(2, -1, -1,''); //Fim AL_5

   cdsInvestimento.Data := CtrlInvestimento.ListInvestimento(-1, 2);
   //Al_1
   cdsEvCaixaCota.Data  := CtrlCarteiraGerenc.ListEvCaixaCota;

   //AL_4
   cdsPlanoPrev.Data    := CtrlInvestimento.ListPlanoPatro;
end;

procedure TFrmConsMovOperVirtualMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(CtrlInvestimento);
   FreeAndNil(CtrlRendaVariavel);
   FreeAndNil(CtrlCarteiraGerenc);
  inherited;

end;

//Al_1
procedure TFrmConsMovOperVirtualMT.bbtnConfirmarClick(Sender: TObject);
var iCarteira, iInvestimento, iPlanoPrev, iEvCaixaCota, iTipoOper, iTipoDesp : Integer;
    sMens: String; //AL_5
begin
  inherited;
  //AL_5
  sMens := '';
  If (edDataFim.Text <> '') and
     (Not RendaVariavel.PermiteUtilizarCarteiraGerenc(edDataFim.date,sMens)) then
  begin
      MsgDlg(sMens,'Mensagem do Sistema', mtWarning, [mbOk],0);
      cdsMovOperVirtual.Data := relMovOperVirtual.CtrlCarteiraGerenc.ListMovOperVirtual( 0, 0);
      edDataFim.Clear;
      dblCarteira.Clear;
      dblPlanoPrev.Clear;
      dblInvestimento.clear;
      edDataFim.SetFocus;
      Exit;
  end
  else
  begin // Fim AL_5
     iCarteira     := -1;
     iInvestimento := -1;
     iPlanoPrev    := -1;
     iTipoOper     :=  0;
     iTipoDesp     :=  0;
     iEvCaixaCota  :=  0;
     if Trim(dblCarteira.Text) <> '' then
        iCarteira := cdsCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger;

     if Trim(dblInvestimento.Text) <> '' then
        iInvestimento := cdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;

     if Trim(dblPlanoPrev.Text) <> '' then
        iPlanoPrev := cdsPlanoPrev.FieldByName('IDPLANPREVCTBPATR').AsInteger;

     cdsMovOperVirtual.Data := relMovOperVirtual.CtrlCarteiraGerenc.ListMovOperVirtual(edDataIni.Date, edDataFim.Date,
                                                                                       iEvCaixaCota, 2, iTipoOper, iTipoDesp,
                                                                                       iCarteira, iInvestimento, iPlanoPrev);
     if cdsMovOperVirtual.IsEmpty then
        bt_Imprime.Enabled  := False
     else
        bt_Imprime.Enabled  := True;
  end;
end;
//Al_1 - Fim

procedure TFrmConsMovOperVirtualMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cdsMovOperVirtual.Data := relMovOperVirtual.CtrlCarteiraGerenc.ListMovOperVirtual( 0, 0);
  bt_Imprime.Enabled := False
end;

procedure TFrmConsMovOperVirtualMT.bt_ImprimeClick(Sender: TObject);
var iCarteira, iInvestimento, iPlanoPrev, iEvCaixaCota : Integer;
begin
   inherited;

   iCarteira := -1;
   if Trim(dblCarteira.Text) <> '' then
      iCarteira := cdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

   iInvestimento := -1;
   if Trim(dblInvestimento.Text) <> '' then
      iInvestimento := cdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;

   iPlanoPrev := -1;
   if Trim(dblPlanoPrev.Text) <> '' then
      iPlanoPrev := cdsPlanoPrev.FieldByName('IDPLANPREVCTBPATR').AsInteger;

   iEvCaixaCota := -1;

   relMovOperVirtual.cdsMovOperVirtual.Data := cdsMovOperVirtual.Data;
   relMovOperVirtual.lblPeriodo.Caption     := edDataIni.Text + ' a ' + edDataFim.Text;
   relMovOperVirtual.lblEmpresa.Caption     := Sistema.NomeEmpresa;

   if not cdsMovOperVirtual.IsEmpty then
      TFrmPreview.CreateModalPreview(Application,
                                     relMovOperVirtual.rptMovOperVirtual,
                                     relMovOperVirtual.rptMovOperVirtual.PrinterSetup.DocumentName);

   relMovOperVirtual.cdsMovOperVirtual.EmptyDataSet;

end;

procedure TFrmConsMovOperVirtualMT.FormShow(Sender: TObject);
begin
  inherited;
  cdsMovOperVirtual.Data := relMovOperVirtual.CtrlCarteiraGerenc.ListMovOperVirtual(0, 0);
end;
//AL_5
procedure TFrmConsMovOperVirtualMT.edDataFimExit(Sender: TObject);
Var
   sMens: String;
begin
  inherited;
  sMens := '';
  If (edDataFim.Text <> '') and
     (Not RendaVariavel.PermiteUtilizarCarteiraGerenc(edDataFim.date,sMens)) then
  begin
      MsgDlg(sMens,'Mensagem do Sistema', mtWarning, [mbOk],0);
      cdsMovOperVirtual.Data := relMovOperVirtual.CtrlCarteiraGerenc.ListMovOperVirtual( 0, 0);
      edDataFim.Clear;
      dblCarteira.Clear;
      dblPlanoPrev.Clear;
      dblInvestimento.clear;
      edDataFim.SetFocus;
      Exit;
  end
  else
     cdsCarteira.Data := CtrlInvestimento.ListCarteira(2, -1, -1,edDataFim.text);
end;

end.


