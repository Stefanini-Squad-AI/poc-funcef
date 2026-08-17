unit FCadIntegraOrcFDO;

// Alterações:
{----------------------------------------------------------------------------------------------------
Rotina..... : (dfm) cdsModulos, cdsModIntegra
Nº SIG......: 94320-95403
Data........: 17/02/2020
Responsável.: edilaine
Descrição...: ordenação dos modulos nao habilitados
-----------------------------------------------------------------------------------------------------
Nº SIG......: 94320
Data........: 11/12/2019
Responsável.: edilaine
Descrição...: Criação da Integração Orçamentária para sistema web
-----------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  Mask, Grids, Wwdbigrd, Wwdbgrid, uCtrlIntegraOrcFDO, uCmTypes,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;
type
  TFrmCadIntegraOrcFDO = class(TFrmCadastroMT)
    gbConsulta: TGroupBox;
    Label1: TLabel;
    edtURLConsulta: TDBEdit;
    Label2: TLabel;
    edtUserConsulta: TDBEdit;
    Label3: TLabel;
    edtPassConsulta: TDBEdit;
    gbEnvio: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtURLEnvio: TDBEdit;
    edtUserEnvio: TDBEdit;
    edtPassEnvio: TDBEdit;
    plnTransf: TPanel;
    BtnAdicionaTudo: TSpeedButton;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    grdModIntegra: TwwDBGrid;
    grdModulos: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    cdsModulos: TCMClientDataSet;
    cdsModIntegra: TCMClientDataSet;
    btnTesteCons: TBitBtn;
    btnTesteEnv: TBitBtn;
    dsModulos: TDataSource;
    dsModIntegra: TDataSource;
    chkHabIntegra: TCheckBox;
    procedure chkHabIntegraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnTesteConsClick(Sender: TObject);
    procedure btnTesteEnvClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlIntegraOrc : TCtrlIntegraOrcFDO;

    procedure CarregaDados;

  public
    { Public declarations }
  end;

var
  FrmCadIntegraOrcFDO: TFrmCadIntegraOrcFDO;

implementation

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

{$R *.DFM}

procedure TFrmCadIntegraOrcFDO.chkHabIntegraClick(Sender: TObject);
var
   Color : TColor;
begin
  inherited;
  if chkHabIntegra.checked then
     Color := clWhite
  else
     Color := clSilver;

  gbConsulta.enabled := chkHabIntegra.checked;
  gbEnvio.enabled    := chkHabIntegra.checked;
  plnTransf.enabled  := chkHabIntegra.checked;

  edtUrlConsulta.Color := color;
  edtUserConsulta.Color := color;
  edtPassConsulta.Color := color;

  edtUrlEnvio.Color := color;
  edtUserEnvio.Color := color;
  edtPassEnvio.Color := color;

end;

procedure TFrmCadIntegraOrcFDO.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlIntegraOrc := TCtrlIntegraOrcFDO.create;
  CtrlIntegraOrc.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  CtrlIntegraOrc.cdsIntegraOrc := cds;
end;

procedure TFrmCadIntegraOrcFDO.FormShow(Sender: TObject);
begin
  inherited;
  cds.data := CtrlIntegraOrc.ListaParametros;

  cdsModulos.data    := CtrlIntegraOrc.GetModulos('');
  cdsModIntegra.data := CtrlIntegraOrc.GetModulos('-1');

  CarregaDados(); 
end;

procedure TFrmCadIntegraOrcFDO.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  cdsModulos.First;

  While Not cdsModulos.Eof Do
    btnAdiciona.Click;
end;

procedure TFrmCadIntegraOrcFDO.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao in [ opInserir, opAlterar ] Then
  Begin
     If Not cdsModulos.IsEmpty Then
     Begin
        cdsModIntegra.Append;
        cdsModIntegra.FieldByName('IDMODULO').AsInteger  := cdsModulos.FieldByName('IDMODULO').asInteger;
        cdsModIntegra.FieldByName('NOMEMODULO').AsString := cdsModulos.FieldByName('NOMEMODULO').asString;
        cdsModIntegra.Post;

        cdsModulos.Delete;
     End;
  End;
end;

procedure TFrmCadIntegraOrcFDO.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao in [ opInserir, opAlterar ] Then
  Begin
     If Not cdsModIntegra.IsEmpty Then
     Begin
        cdsModulos.Append;
        cdsModulos.FieldByName('IDMODULO').AsInteger  := cdsModIntegra.FieldByName('IDMODULO').asInteger;
        cdsModulos.FieldByName('NOMEMODULO').AsString := cdsModIntegra.FieldByName('NOMEMODULO').asString;
        cdsModulos.Post;

        cdsModIntegra.Delete;
     End;
  End;
end;

procedure TFrmCadIntegraOrcFDO.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  cdsModIntegra.First;

  While Not cdsModIntegra.Eof Do
        btnRemove.Click;
end;

procedure TFrmCadIntegraOrcFDO.bbtnConfirmarClick(Sender: TObject);
var
  sModulos : string;
begin
  if chkHabIntegra.checked then
  begin
    if (edtUrlConsulta.text = '') or (edtUserConsulta.text = '') or (edtPassConsulta.text = '') or
       (edtUrlEnvio.text = '') or (edtUserEnvio.text = '') or (edtPassEnvio.text = '') then
    begin
       MsgDlg('É necessário preencher todos os campos. Verifique', 'Informação', mtInformation, [ mbOK ], 0 );
       exit;
    end;

    if cdsModIntegra.isEmpty then
    begin
       MsgDlg('É necessário habilitar a integração no mínimo para um módulo', 'Informação', mtInformation, [ mbOK ], 0 );
       exit;
    end;

    sModulos := '';
    cdsModIntegra.First;
    while not cdsModIntegra.eof do
    begin
      sModulos := sModulos + CtrlIntegraOrc.iff(sModulos = '', '', ', ')+ cdsModIntegra.FieldByName('IDMODULO').AsString;
      cdsModIntegra.Next;
    end;
    cds.FieldByName('MODULOS').AsString := sModulos;
  end;

  if chkHabIntegra.checked then
     cds.FieldByName('FLGINTEGRAORCWEB').AsInteger := 1
  else
     cds.FieldByName('FLGINTEGRAORCWEB').AsInteger := 0;

  inherited;
end;

procedure TFrmCadIntegraOrcFDO.btnTesteConsClick(Sender: TObject);
var
  Url : string;
begin
  inherited;

  //'http://webservice.planoparasuaempresa.com.br/api/dre?LOGIN=webservice.401@allstrategy.com.br&SENHA=rRXZkxz9&COMPETENCIA_INICIO=01/01/2019&COMPETENCIA_FIM=31/12/2019&ESTRUTURA_CONTA=421104010501&VALOR_ACUMULADO=S&COD_DIMENSAO=53&type=csv';

  // teste para validar serviço
  URL  := edtUrlConsulta.text+'params';
  if not CtrlIntegraOrc.TestaConexao(tcServico, URL) then
  begin
    MsgDlg(CtrlIntegraOrc.MessageInfo, 'Teste Serviço', mtInformation, [ mbOK ], 0 );
    exit;
  end;


  // teste para validar login e senha
  URL  := edtUrlConsulta.text+'LOGIN='+edtUserConsulta.text+'&SENHA='+edtPassConsulta.text;
  CtrlIntegraOrc.TestaConexao(tcConsulta, URL);

  if CtrlIntegraOrc.MessageInfo <> '' then
  begin
    MsgDlg(CtrlIntegraOrc.MessageInfo, 'Teste Login: Consulta ', mtInformation, [ mbOK ], 0 );
    exit;
  end;

end;


procedure TFrmCadIntegraOrcFDO.btnTesteEnvClick(Sender: TObject);
var
  Url, sMsg : string;
begin
  inherited;

  //http://auth.planoparasuaempresa.com.br/?LOGIN=integrador.401@allstrategy.com.br&PASSWORD=4ip1B#wh

  // teste para validar envio
  URL  := edtURLEnvio.text+'LOGIN='+edtUserEnvio.text+'&PASSWORD='+edtPassEnvio.text;
  CtrlIntegraOrc.TestaConexao(tcEnvio, URL);

  if CtrlIntegraOrc.MessageInfo <> '' then
  begin
    MsgDlg(CtrlIntegraOrc.MessageInfo, 'Teste Login: Envio', mtInformation, [ mbOK ], 0 );
    exit;
  end;
end;


procedure TFrmCadIntegraOrcFDO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlIntegraOrc.free;
end;

procedure TFrmCadIntegraOrcFDO.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlIntegraOrc.Alterar;
end;


procedure TFrmCadIntegraOrcFDO.CarregaDados;
begin
  cdsModIntegra.EmptyDataSet;
  CtrlIntegraOrc.GetModulosIntegracao(cdsModIntegra);

  chkHabIntegra.checked := CtrlIntegraOrc.IntegraOrcON;

  if not cds.isEmpty then
     cmeCadastro.Operacao := opIdle;

  CmeCadastro.AtualizaBotoes(Self);
  chkHabIntegraClick(chkHabIntegra);
end;


procedure TFrmCadIntegraOrcFDO.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  CarregaDados();
end;


end.
