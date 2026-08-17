unit fMTConsHistMovBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  DB, Wwdatsrc, DBClient, uCMClientDataSet, MontaSelect,
  uCtrlGrupoContab, uCtrlBem, uCtrlParamCAF, TREdit, Mask, wwdbedit,
  fcLabel, TB97Tlwn, uCmSqlParams, Grids, Wwdbigrd, Wwdbgrid, IvEMulti;

type
  TfrmMTConsHistMovBem = class(TfrmOkCancelar)
    Dock973: TDock97;
    ToolWindow971: TToolWindow97;
    fcLabel1: TfcLabel;
    eDataMov: TCMDateTimePicker;
    pnlDados: TPanel;
    Label17: TLabel;
    Label24: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label26: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    edPlaca: TEdit;
    spdPesquisa: TBitBtn;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit20: TwwDBEdit;
    cdsBem: TCMClientDataSet;
    dsBem: TwwDataSource;
    fcLabel13: TfcLabel;
    fcLabel14: TfcLabel;
    dbcmbPais: TwwDBLookupCombo;
    cdsPais: TCMClientDataSet;
    dsPais: TwwDataSource;
    dbcmbMoeda: TwwDBLookupCombo;
    dsMoeda: TwwDataSource;
    cdsMoeda: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    dsHistorico: TwwDataSource;
    pnlValores: TPanel;
    dbgHistorico: TwwDBGrid;
    cdsHistorico: TCMClientDataSet;
    MSBem: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure spdPesquisaClick(Sender: TObject);
    procedure edPlacaEnter(Sender: TObject);
  private
    { Private declarations }
    ParamCAF    : TCtrlParamCAF;
    Bem         : TCtrlBem;
    GrupoContab : TCtrlGrupoContab;
    //------------------------------------------------------------------------------------
    Procedure ListaHistMovBem;
  public
    { Public declarations }
  end;

var
  frmMTConsHistMovBem: TfrmMTConsHistMovBem;

implementation

{$R *.dfm}

uses uMensErro, uSistema, uCtrlPadroes ;

procedure TfrmMTConsHistMovBem.FormCreate(Sender: TObject);
var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;

begin
   inherited;
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   Bem := TCtrlBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   cdsMoeda.Data := ParamCAF.ListaCAFMoedas(Sistema.IdEmpresa);
   cdsPais.Data := ParamCAF.ListaCAFPaises(Sistema.IdEmpresa);
   cdsMoeda.Locate('IDTIPOMOEDA', 1, []);
   cdsPais.First;
   dbcmbMoeda.Text := cdsMoeda.FieldByName('MOEDESC').AsString;
   dbcmbPais.Text  := cdsPais.FieldByName('NOMEPAIS').AsString;
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   DecodeDate(Date, iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   eDataMov.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;
//========================================================================================
procedure TfrmMTConsHistMovBem.spdPesquisaClick(Sender: TObject);
begin
   inherited;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      cdsBem.Data := Bem.ListaBem(strtofloat(MSBem.ValoresChave[0]),strtofloat(MSBem.ValoresChave[1]));
      edPlaca.Text := MSBem.ValoresChave[2];
      //----------------------------------------------------------------------------------
      ListaHistMovBem;
      eDataMov.SetFocus;
   end else
   begin
      cdsBem.Data := Bem.ListaBem(0, 0);
      edPlaca.Text := '';
      //----------------------------------------------------------------------------------
      dbgHistorico.Visible := False;
   end;
end;
//========================================================================================
procedure TfrmMTConsHistMovBem.edPlacaEnter(Sender: TObject);
begin
   inherited;
   cdsBem.Data := Bem.ListaBem(0, 0);
   edPlaca.Text := '';
   dbgHistorico.Visible := False;
end;
//========================================================================================
procedure TfrmMTConsHistMovBem.edPlacaExit(Sender: TObject);
var
   iIdBem : Integer;

begin
   inherited;
   if bbtnSair.Focused then Exit;
   //-------------------------------------------------------------------------------------
   if edPlaca.Text <> '' then
   begin
      cdsMoeda.Locate('IDTIPOMOEDA', 1, []);
      cdsPais.First;
      dbcmbMoeda.Text := cdsMoeda.FieldByName('MOEDESC').AsString;
      dbcmbPais.Text := cdsPais.FieldByName('NOMEPAIS').AsString;
      //----------------------------------------------------------------------------------
      iIdBem := Bem.PlacaIdBem(Sistema.IdEmpresa, edPlaca.Text);
      if iIdBem <= 0 then
      begin
         MsgDlg('Placa não Localizada','Erro', mtError, [mbOk], 0)
      end else
      begin
         cdsBem.Data := Bem.ListaBem(Sistema.IdEmpresa, iIdBem);
         //-------------------------------------------------------------------------------
         ListaHistMovBem;
         eDataMov.SetFocus;
      end
   end else
   begin
      cdsBem.Data := Bem.ListaBem(0, 0);
      edPlaca.Text := '';
      dbgHistorico.Visible := False;
   end;
end;
//========================================================================================
procedure TfrmMTConsHistMovBem.ListaHistMovBem;
begin
   Screen.Cursor := crSQLWait;
   cdsHistorico.Data := Bem.ListaMovimentacao(cdsBem.FieldByName('IDPESSOA').AsInteger,
                                              cdsBem.FieldByName('IDBEM').AsInteger,
                                              eDataMov.Date,
                                              cdsMoeda.FieldByName('MOECODIGO').AsInteger,
                                              cdsPais.FieldByName('IDCAFPAISES').AsInteger);
   TFloatField(cdsHistorico.FieldByName('VALOR')).DisplayFormat := '#,##0.00;(#,##0.00); ';
   dbgHistorico.Visible := True;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmMTConsHistMovBem.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnSair.Enabled := False;
   //-------------------------------------------------------------------------------------
   ListaHistMovBem;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := True;
   bbtnSair.Enabled := True;
end;
//========================================================================================
procedure TfrmMTConsHistMovBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   ParamCAF.Free;
   GrupoContab.Free;
   Bem.Free;
end;

end.
