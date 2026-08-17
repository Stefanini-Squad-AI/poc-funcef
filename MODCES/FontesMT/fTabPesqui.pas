unit fTabPesqui;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook, Mask, Db,
  DBCtrls, DBTables, Wwdatsrc, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, DBClient,
  uCMClientDataSet, uCtrlPesquisaSal, uCtrlCargo, uCtrlTabPesqui, Spin;

type
  TfrmTabPesqui = class(TfrmSairAjuda)
    gbxMedia: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblMenor: TLabel;
    lblMenorR: TLabel;
    lbl1Q: TLabel;
    lbl1QR: TLabel;
    lblModa: TLabel;
    lblModaR: TLabel;
    lblMedia: TLabel;
    lblMediaR: TLabel;
    lblMediana: TLabel;
    lblMedianaR: TLabel;
    lbl3Q: TLabel;
    lbl3QR: TLabel;
    lblMaior: TLabel;
    lblMaiorR: TLabel;
    Label10: TLabel;
    lblFreq: TLabel;
    dsTendencia: TwwDataSource;
    bbtnGrafico: TBitBtn;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    gbxPesquisa: TGroupBox;
    Label11: TLabel;
    dblckPesq: TwwDBLookupCombo;
    dblckCargo: TwwDBLookupCombo;
    rgExcluir: TRadioGroup;
    dblckEntid: TwwDBLookupCombo;
    edData: TEdit;
    dbgPesq: TwwDBGrid;
    CdsPesqui: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    CdsEntid: TCMClientDataSet;
    CdsTendencia: TCMClientDataSet;
    CdsDadosTend: TCMClientDataSet;
    gbxCorte: TGroupBox;
    ednPercCorte: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure dblckPesqEnter(Sender: TObject);
    procedure rgExcluirClick(Sender: TObject);
    procedure bbtnGraficoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblckPesqChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlPesquisaSal: TCtrlPesquisaSal;
    CtrlCargo: TCtrlCargo;
    CtrlTabPesqui: TCtrlTabPesqui;
  end;

var
  frmTabPesqui: TfrmTabPesqui;

implementation

uses uSistema, uMensErro, fTelaAut, uCtrlFuncoesRH, uCtrlPadroes, fAguarde, fChartPesq;

{$R *.DFM}

procedure TfrmTabPesqui.FormCreate(Sender: TObject);
begin
  CtrlTabPesqui := TCtrlTabPesqui.Create;
  CtrlTabPesqui.InitializeAs(Padroes);
  CtrlTabPesqui.CdsTendencia := CdsTendencia;

  CtrlPesquisaSal := TCtrlPesquisaSal.Create;
  CtrlPesquisaSal.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CdsPesqui.Data := CtrlPesquisaSal.ListPesquisaSal;
  inherited;
end;

procedure TfrmTabPesqui.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPesquisaSal);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlTabPesqui);
  inherited;
end;

procedure TfrmTabPesqui.dblckPesqChange(Sender: TObject);
begin
  if (Trim(dblckPesq.Text) <> '') then
  begin
    CdsCargo.Data := CtrlCargo.ListCargoXTendPesquisaSal(
      CdsPesqui.FieldByName('IDPESQSALAR').asFloat);
    rgExcluirClick(Self);
    edData.Text := CdsPesqui.FieldByName('DATAREFPESQ').asString;
  end;
  dblckCargo.Enabled := (Trim(dblckPesq.Text) <> '');
end;

procedure TfrmTabPesqui.dblckPesqEnter(Sender: TObject);
begin
  dbgPesq.Visible := false;
  gbxMedia.Visible := false;
  bbtnGrafico.Enabled := false;
end;

procedure TfrmTabPesqui.rgExcluirClick(Sender: TObject);
begin
  dblckEntid.Visible := (rgExcluir.ItemIndex = 1);
  if (rgExcluir.ItemIndex = 1) then
    CdsEntid.Data := CtrlTabPesqui.ListPessoaComTendPesquisaSal(
      CdsPesqui.FieldByName('IDPESQSALAR').asFloat, CdsCargo.FieldByName('IDCARGO').asFloat);
  dblckPesqEnter(Sender);
end;

procedure TfrmTabPesqui.bbtnGraficoClick(Sender: TObject);
var
  bExisteNossaEmpresa: boolean;
begin
  CdsTendencia.First;
  bExisteNossaEmpresa := false;
  while not(CdsTendencia.EOF) do
  begin
    if (CdsTendencia.FieldByName('IDEMPRESAPARTIC').asFloat = Sistema.IdEmpresa) then
    begin
      bExisteNossaEmpresa := true;
      break;
    end;
    CdsTendencia.Next;
  end;
  ExibirGrafico(
    CdsTendencia.Data,
    bExisteNossaEmpresa,
    dblckCargo.Text,
    dblckPesq.Text,
    StrToDate(edData.Text),
    StrToInt(lblMenor.Caption),
    StrToInt(lblMenorR.Caption),
    StrToInt(lblMaior.Caption),
    StrToInt(lblMaiorR.Caption),
    StrToInt(lbl1Q.Caption),
    StrToInt(lbl1QR.Caption),
    StrToInt(lbl3Q.Caption),
    StrToInt(lbl3QR.Caption),
    StrToInt(lblMediana.Caption),
    StrToInt(lblMedianaR.Caption),
    StrToInt(lblMedia.Caption),
    StrToInt(lblMediaR.Caption),
    StrToInt(lblModa.Caption),
    StrToInt(lblModaR.Caption));

  CdsTendencia.First;  
end;

procedure TfrmTabPesqui.bbtnConfirmarClick(Sender: TObject);
var
  bOk: boolean;
  IdEmpresa: double;
begin
  frmAguarde.Mostra('Gerando Dados...');

  if (rgExcluir.ItemIndex = 1) then
    IdEmpresa := CdsEntid.FieldByName('IDPESSOA').asFloat
  else
    IdEmpresa := -1;

  if ednPercCorte.Value > 0 then
  begin
    bOk := CtrlTabPesqui.GerarTabulacao(
      rgExcluir.ItemIndex,
      Sistema.IdEmpresa,
      IdEmpresa,
      CdsPesqui.FieldByName('IDPESQSALAR').asFloat,
      CdsCargo.FieldByName('IDCARGO').asFloat,
      0);

    if (not bOk) or (CtrlTabPesqui.Frequencia = 0) then
    begin
      frmAguarde.Apaga;
      MsgDlg(Translate('Não há dados a serem exibidos com os parãmetros selecionados.'),
        Translate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
      exit;
    end;
  end;


  bOk := CtrlTabPesqui.GerarTabulacao(
    rgExcluir.ItemIndex,
    Sistema.IdEmpresa,
    IdEmpresa,
    CdsPesqui.FieldByName('IDPESQSALAR').asFloat,
    CdsCargo.FieldByName('IDCARGO').asFloat,
    ednPercCorte.Value);

  if (bOk) and (CtrlTabPesqui.Frequencia > 0) then
  begin
    lblFreq.Caption := IntToStr(CtrlTabPesqui.Frequencia);
    lblMENOR.Caption := IntToStr(CtrlTabPesqui.ValMenor);
    lblMENORR.Caption := IntToStr(CtrlTabPesqui.ValMenorReal);
    lblMaior.Caption := IntToStr(CtrlTabPesqui.ValMaior);
    lblMAIORR.Caption := IntToStr(CtrlTabPesqui.ValMaiorReal);
    lbl1Q.Caption := IntToStr(CtrlTabPesqui.Quartil1);
    lbl1QR.Caption := IntToStr(CtrlTabPesqui.Quartil1Real);
    lbl3Q.Caption := IntToStr(CtrlTabPesqui.Quartil3);
    lbl3QR.Caption := IntToStr(CtrlTabPesqui.Quartil3Real);
    lblMEDIANA.Caption := IntToStr(CtrlTabPesqui.Mediana);
    lblMEDIANAR.Caption := IntToStr(CtrlTabPesqui.MedianaReal);
    lblMEDIA.Caption := FloatToStrF(CtrlTabPesqui.Media, ffFixed,10,0);
    lblMEDIAR.Caption := FloatToStrF(CtrlTabPesqui.MediaReal, ffFixed,10,0);
    lblMODA.Caption := FloatToStrF(CtrlTabPesqui.Moda, ffFixed,10,0);
    lblMODAR.Caption := FloatToStrF(CtrlTabPesqui.ModaReal, ffFixed,10,0);

    dbgPesq.Visible := true;
    gbxMedia.Visible := true;
    bbtnGrafico.Enabled := true;
    frmAguarde.Apaga;
  end
  else
  begin
    frmAguarde.Apaga;
    MsgDlg(Translate('Não há dados a serem exibidos com os parãmetros selecionados.'),
      Translate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
  end;
end;

end.
