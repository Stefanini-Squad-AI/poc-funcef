unit FCadRegMerito;

{--------------------------------------------------------------------------------------------------
Roina............: cricação da funcionalidade
Nº SIG...........: 39701
Data da Alteração: 01/06/2014
Responsável......: Edilaine
Descrição........: Inclusão funcionalidade Transações > Registro de Mérito
--------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit,
  wwdbdatetimepicker, CMDateTimePicker, uCtrlPessoaFuncionario, uCtrlMerito;

type
  TFrmCadRegMerito = class(TFrmCadastroMestreDetMT)
    lblMatricula: TLabel;
    lblNome: TLabel;
    dbmMATRICULA: TwwDBEdit;
    dbmNOME: TwwDBEdit;
    lblDtOcorre: TLabel;
    dbedDataOcorre: TCMDateTimePicker;
    lblMotivo: TLabel;
    lblObs: TLabel;
    lblPontua: TLabel;
    dbedObserva: TwwDBEdit;
    dbedMotivo: TwwDBEdit;
    dbedPontuacao: TwwDBEdit;
    CdsDet: TCMClientDataSet;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedPontuacaoKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    { Private declarations }
    CtrlMerito : TCtrlMerito;
    CtrlPessoaFuncionario : TCtrlPessoaFuncionario;

    iIdPessoa : integer;

    procedure Seleciona;
    function  ValidarCampos : Boolean;
    function  GravarRegistro : boolean;

  public
    { Public declarations }
  end;

var
  FrmCadRegMerito: TFrmCadRegMerito;

implementation

uses uCMTypes, uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}


procedure TFrmCadRegMerito.Seleciona;
begin
  Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(iIdPessoa);

  CdsDet.IndexName := '';
  cdsDet.Data := CtrlMerito.ListaDados(iIdPessoa);
  CdsDet.IndexName := 'idxData';
end;


procedure TFrmCadRegMerito.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
     iIdPessoa := StrToIntDef(MontaSelect.ValoresChave[0], -1)
  else
     iIdPessoa := -1;

  Seleciona();
end;


procedure TFrmCadRegMerito.FormCreate(Sender: TObject);
begin
  inherited;

  CmeDetalhe.RepetirInsert := false;
  
  CtrlMerito := TCtrlMerito.Create;
  CtrlMerito.InitializeAs(Padroes);
  CtrlMerito.CdsDet := CdsDet;

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  sbtnProcurarClick(Sender);
end;

procedure TFrmCadRegMerito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlMerito);
  FreeAndNil(CtrlPessoaFuncionario);

  inherited;
end;

procedure TFrmCadRegMerito.dbedPontuacaoKeyPress(Sender: TObject;var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #8]) then
     key := #0;
end;

function TFrmCadRegMerito.ValidarCampos: Boolean;
begin
  result := false;

  if (dbedDataOcorre.Date = 0) then
  begin
    MsgDlg('É necessário informar a Data da Ocorrência', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDataOcorre.SetFocus;
    Exit;
  end;

  if (dbedMotivo.text = '') then
  begin
    MsgDlg('É necessário informar o Motivo', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedMotivo.SetFocus;
    Exit;
  end;

  Result := true;
end;

procedure TFrmCadRegMerito.bbtnOkDetClick(Sender: TObject);
begin
  if not(ValidarCampos) then
     abort;

  CdsDet.FieldByName('OBS_STR').AsString := Copy(CdsDet.FieldByName('OBS').AsString , 1, 200);

  inherited;
end;

function TFrmCadRegMerito.GravarRegistro: boolean;
begin
  Result := CtrlMerito.Gravar;
  if not(Result) then
    raise exception.Create(CtrlMerito.MessageInfo);
end;

procedure TFrmCadRegMerito.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;

  // carrega dados novamente
  if Accept then
     Seleciona();
end;

procedure TFrmCadRegMerito.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDPESSOA').AsInteger := iIdPessoa;
end;

procedure TFrmCadRegMerito.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Seleciona();
end;

end.
