unit fConsultMovim;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcLabel, Mask, wwdbedit, Grids,
  Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwquery, MontaSelect,
  wwdbdatetimepicker, CMDateTimePicker, TB97Tlwn;

type
  TfrmConsultMovim = class(TfrmSairAjuda)
    pnlDados: TPanel;
    Label17: TLabel;
    Label24: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label26: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    ePlaca: TEdit;
    spdPesquisa: TBitBtn;
    pnlExecuta: TPanel;
    qryBem: TwwQuery;
    dsBem: TwwDataSource;
    qryPlaca: TwwQuery;
    qryPlacaIDBEM: TFloatField;
    qryPlacaIDPESSOA: TFloatField;
    qryPlacaPLACA: TFloatField;
    qryHistorico: TwwQuery;
    dsHistorico: TwwDataSource;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit20: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    qryBemIDPESSOA: TFloatField;
    qryBemIDBEM: TFloatField;
    qryBemDESBEM: TStringField;
    qryBemDTAINCLUSAO: TDateTimeField;
    qryBemPLACA: TFloatField;
    qryBemDATAINICIODEP: TDateTimeField;
    qryBemDESCGRUPO: TStringField;
    qryBemDESCCONJUNTO: TStringField;
    qryBemNOMESUBCONTA: TStringField;
    qryBemDESCLOCALIZACAO: TStringField;
    qryBemNOMERESPONSAVEL: TStringField;
    qryHistoricoDATAMOVIMENTACAO: TDateTimeField;
    qryHistoricoDESCTIPOMOVIMENTACAO: TStringField;
    qryHistoricoVALOFI: TFloatField;
    pnlValores: TPanel;
    dbgHistorico: TwwDBGrid;
    Dock973: TDock97;
    ToolWindow971: TToolWindow97;
    fcLabel1: TfcLabel;
    eDataMov: TCMDateTimePicker;
    bitbExecuta: TSpeedButton;
    procedure spdPesquisaClick(Sender: TObject);
    procedure ePlacaExit(Sender: TObject);
    procedure ePlacaEnter(Sender: TObject);
    procedure bitbExecutaClick(Sender: TObject);
    procedure ExibeHistorico(dDataMov : tDateTime);
    procedure LimpaTela;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultMovim: TfrmConsultMovim;

implementation

uses dAtivoFixo, uDiasUteis, uSistema;

{$R *.DFM}

procedure TfrmConsultMovim.FormCreate(Sender: TObject);
var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;
begin
   inherited;
   qryPlaca.Prepare;
   qryHistorico.Prepare;
   qryBem.Prepare;
   DecodeDate(Date, iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   eDataMov.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;

procedure TfrmConsultMovim.FormActivate(Sender: TObject);
begin
   inherited;
   eDataMov.SetFocus;
end;

procedure TfrmConsultMovim.LimpaTela;
begin
   qryHistorico.Close;
   qryBem.Close;
   dbgHistorico.Visible := False;
end;
//========================================================================================
procedure TfrmConsultMovim.spdPesquisaClick(Sender: TObject);
begin
   inherited;
   LimpaTela;
   dtmAtivoFixo.MSBem.Executar;
   Application.ProcessMessages;
   if (dtmAtivoFixo.MSBem.RetornouValor) then
   begin
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[0]);
      qryBem.ParamByName('PIDBEM').AsInteger    := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[1]);
      qryBem.Open;
      ePlaca.Text := floattostr(qryBem.FieldByName('PLACA').AsFloat);
      //----------------------------------------------------------------------------------
      ExibeHistorico(eDataMov.Date);
      //----------------------------------------------------------------------------------
      eDataMov.SetFocus;
   end else
   begin
      ePlaca.SetFocus;
   end;
end;

procedure TfrmConsultMovim.ExibeHistorico(dDataMov : tDateTime);
begin
   Screen.Cursor := crSQLWait;
   qryHistorico.Close;
   qryHistorico.ParamByName('PIDPESSOA').AsInteger := qryBemIDPESSOA.AsInteger;
   qryHistorico.ParamByName('PIDBEM').AsInteger    := qryBemIDBEM.AsInteger;
   qryHistorico.ParamByName('PDATAMOV').AsDateTime := dDataMov;
   dbgHistorico.Visible := True;
   qryHistorico.Open;
   Screen.Cursor := crDefault;
end;

procedure TfrmConsultMovim.ePlacaExit(Sender: TObject);
begin
   inherited;
   LimpaTela;
   //-------------------------------------------------------------------------------------
   if ePlaca.Text <> '' then
   begin
      qryPlaca.Close;
      qryPlaca.ParamByName('PPLACA').AsFloat := StrToFloat(ePlaca.Text);
      qryPlaca.Open;
      if not qryPlaca.isEmpty then
      begin
         qryBem.Close;
         qryBem.ParamByName('PIDPESSOA').AsInteger := qryPlacaIDPESSOA.AsInteger;
         qryBem.ParamByName('PIDBEM').AsInteger    := qryPlacaIDBEM.AsInteger;
         qryBem.Open;
         //-------------------------------------------------------------------------------
         ExibeHistorico(eDataMov.Date);
         //-------------------------------------------------------------------------------
         eDataMov.SetFocus;
      end else
         ePlaca.SetFocus;
   end;
end;

procedure TfrmConsultMovim.ePlacaEnter(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then Exit;
   if eDataMov.Focused then Exit;
   LimpaTela;
end;

procedure TfrmConsultMovim.bitbExecutaClick(Sender: TObject);
begin
   inherited;
   if ePlaca.Text <> '' then
      ExibeHistorico(eDataMov.Date);
end;

procedure TfrmConsultMovim.FormKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if key = #13 then
   begin
      key := #0;
      Perform(Wm_NextDlgCtl, 0, 0);
   end;
end;

end.
