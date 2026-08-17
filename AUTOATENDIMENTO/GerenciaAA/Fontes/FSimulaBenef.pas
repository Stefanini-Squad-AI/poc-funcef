unit FSimulaBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, ComCtrls,
  uCmTypes, dBaseDados, uSistema,
  uCtrlSimulaBenef, Db, DBClient, uCMClientDataSet, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, DBCtrls, wwrcdpnl, DBTables;

type
  TfrmSimulaBenef = class(TfrmOkCancelar)
    msParticipante: TMontaSelect;
    PageControl: TPageControl;
    tabParticipante: TTabSheet;
    grpParticipante: TGroupBox;
    lblMatricula: TLabel;
    lblNome: TLabel;
    edtMatricula: TEdit;
    edtNome: TEdit;
    btnConsulta: TBitBtn;
    tabBeneficio: TTabSheet;
    grpBeneficio: TGroupBox;
    Label2: TLabel;
    Toolbar971: TToolbar97;
    btnVoltar: TBitBtn;
    cds: TCMClientDataSet;
    cdsBeneficio: TCMClientDataSet;
    tabCampos: TTabSheet;
    dtsBeneficio: TDataSource;
    cdsBeneficiocdfIdSimulaBenef: TIntegerField;
    cdsBeneficiocdfNomeBenef: TStringField;
    cmbBeneficio: TDBLookupComboBox;
    scrollCampos: TScrollBox;
    procedure btnConsultaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    iIdPessoa,
    iIdSimulaBenef : integer;

    SimulaBenef        : TCtrlSimulaBenef;

    procedure IniciaProcesso;
    procedure SelecionaParticipante;
    procedure SelecionaBeneficio;
    procedure VoltaParaSelecaoParticipante;
    procedure VoltaParaSelecaoBeneficio;

    procedure HabilitaTab( iTab : integer );

    procedure MsgErro( sMsg : string );
  public
    { Public declarations }
  end;

var
  frmSimulaBenef: TfrmSimulaBenef;

implementation

{$R *.DFM}

procedure TfrmSimulaBenef.btnConsultaClick(Sender: TObject);
begin
  inherited;
  
  msParticipante.Executar;
  if msParticipante.RetornouValor then
  begin
    iIdPessoa := StrToInt( msParticipante.ValoresChave[0] );
    edtMatricula.Text := msParticipante.ValoresChave[1];
    edtNome.Text := msParticipante.ValoresChave[2];
  end;

end;

procedure TfrmSimulaBenef.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if PageControl.ActivePage = tabParticipante then
    SelecionaParticipante
  else
    if PageControl.ActivePage = tabBeneficio then
      SelecionaBeneficio;

  btnVoltar.Enabled := ( PageControl.ActivePage <> tabParticipante );      

end;

procedure TfrmSimulaBenef.SelecionaParticipante;
begin
  if iIdPessoa <= 0 then
  begin
    ShowMessage('É necessário selecionar um participante.');
    exit;
  end;


  cdsBeneficio.Close;
  iIdSimulaBenef := -1;

  cdsBeneficio.CreateDataSet;

  cds.Close;
  cds.Data := SimulaBenef.ListaBeneficios;
  cds.First;
  while not cds.Eof do
  begin
    cdsBeneficio.Insert;
    cdsBeneficio.FieldByName('cdfIdSimulaBenef').AsInteger := cds.FieldByName('IDSIMULABENEF').AsInteger;
    cdsBeneficio.FieldByName('cdfNomeBenef').AsString      := cds.FieldByName('NOME').AsString;
    cdsBeneficio.Post;

    cds.Next;
  end;
  cds.Close;

  cmbBeneficio.KeyValue := -1;

  HabilitaTab( 1 );
end;

procedure TfrmSimulaBenef.IniciaProcesso;
begin
  btnVoltar.Enabled := False;
  HabilitaTab( 0 );
end;

procedure TfrmSimulaBenef.HabilitaTab(iTab: integer);
var
  i : integer;
begin
  for i := 0 to PageControl.PageCount - 1 do
    PageControl.Pages[i].TabVisible := False;

  PageControl.Pages[iTab].TabVisible := True;
end;

procedure TfrmSimulaBenef.FormCreate(Sender: TObject);
begin
  inherited;

  SimulaBenef := TCtrlSimulaBenef.Create;
  SimulaBenef.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  iIdPessoa    := -1;
  iIdSimulaBenef := -1;
  btnVoltar.Enabled := False;
  IniciaProcesso;
end;

procedure TfrmSimulaBenef.VoltaParaSelecaoParticipante;
begin
  cdsBeneficio.Close;
  cmbBeneficio.KeyValue := -1;
  iIdSimulaBenef := -1;

  IniciaProcesso;
end;

procedure TfrmSimulaBenef.SelecionaBeneficio;
var
  lblTitulo : TLabel;
  pnlCampo  : TPanel;
  i : integer;
begin
  if cmbBeneficio.KeyValue <= 0 then
  begin
    ShowMessage('É necessário selecionar um benefício.');
    exit;
  end;

  iIdSimulaBenef := cmbBeneficio.KeyValue;


  //Recupera os dados dos campos com os conteúdos calculados
  cds.Close;
  cds.Data := SimulaBenef.CamposSimulaBenef( iIdPessoa, iIdSimulaBenef, 0, Sistema.IdEmpresa );

  i := 0;
  cds.First;
  while not cds.Eof do
  begin

    //Se o campo for visível, exibe-o.
    if cds.FieldByName('FLGVISIVEL').AsString = '1' then
    begin
      pnlCampo          := TPanel.Create( self );
      pnlCampo.Parent   := scrollCampos;
      pnlCampo.Top      := i;
      pnlCampo.Height   := 25;
      pnlCampo.Width    := scrollCampos.Width;
      i := i + pnlCampo.Height;


      //Desenha o título do campo
      lblTitulo         := TLabel.Create( self );
      lblTitulo.Parent  := pnlCampo;
      lblTitulo.Top     := 5;
      lblTitulo.Left    := 5;
      lblTitulo.Caption := cds.FieldByName('TITULO').AsString;


      
    end;


    cds.Next;
  end;
  cds.Close;

  HabilitaTab( 2 );
end;

procedure TfrmSimulaBenef.btnVoltarClick(Sender: TObject);
begin
  inherited;

  if PageControl.ActivePage = tabBeneficio then
    VoltaParaSelecaoParticipante
  else
    if PageControl.ActivePage = tabCampos then
      VoltaParaSelecaoBeneficio;

end;

procedure TfrmSimulaBenef.MsgErro(sMsg: string);
begin
  ShowMessage( sMsg );
end;

procedure TfrmSimulaBenef.FormDestroy(Sender: TObject);
begin
  inherited;
  SimulaBenef.Free;
end;

procedure TfrmSimulaBenef.VoltaParaSelecaoBeneficio;
begin
  HabilitaTab( 1 );
end;

end.
