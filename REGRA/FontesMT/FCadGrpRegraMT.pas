unit FCadGrpRegraMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdbedit, Mask, DBCtrls, uBiblioteca,
  {$IFDEF VERSAO0505} uComum, {$ELSE} uCMTypes, {$ENDIF}
  uCtrlGrpRegra;

type
  TFrmCadGrpRegraMT = class(TFrmCadastroMT)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    EdDescricao: TwwDBEdit;
    CdsIDGRUPOREGRA: TFloatField;
    CdsDESCRICAO: TStringField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
    CtrlGrpRegra : TCtrlGrpRegra;
    procedure MessageCtrlGrpRegra( sMessageInfo : String);
  public
    { Public declarations }
    sGrpRegra : String;
  end;

var
  FrmCadGrpRegraMT: TFrmCadGrpRegraMT;

implementation

Uses uSistema, dBaseDados;

{$R *.DFM}

procedure TFrmCadGrpRegraMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    Cds.Data := CtrlGrpRegra.SelecionaGrpRegra( StrToInt(MontaSelect.ValoresChave[0]) );
end;

procedure TFrmCadGrpRegraMT.CmeCadastroConfirma(Sender: TObject);
Var
  bGravouLog : Boolean;
  sTextoLog  : String;
begin
  inherited;
  {------------------------}
  { Gravar log de operação }
  If cmecadastro.Operacao = OpInserir then
    sTextoLog := 'Inclusão de Grupo de Regra '+DBEdit1.Text
  Else If cmecadastro.Operacao = OpAlterar then
    sTextoLog := 'Manutenção do Grupo de Regra '+DBEdit1.Text
  Else If cmecadastro.Operacao = OpApagar then
    sTextoLog := 'Exclusão do Grupo de Regra '+sGrpRegra;

  If Not GravaLogOperacao(sTextoLog) Then Begin
    Raise Exception.Create( 'Erro ao gravar o log da Operação ' );
    Exit;
  End;
  {------------------------}

  { Transfere dados do Forumlário para o Control e confirma }
  CtrlGrpRegra.CdsGrpRegra.Data := Cds.Data;
  CtrlGrpRegra.GravaGrpRegra;

  { Refaz pesquisa com novos Dados }
  if MontaSelect.RetornouValor then
    Cds.Data := CtrlGrpRegra.SelecionaGrpRegra( StrToInt(MontaSelect.ValoresChave[0]) );
end;

procedure TFrmCadGrpRegraMT.FormCreate(Sender: TObject);
begin
  inherited;
  { Cria e Inicializa Classes de Controles }
  CtrlGrpRegra := TCtrlGrpRegra.Create;
  CtrlGrpRegra.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                          MessageCtrlGrpRegra);
  Cds.CreateDataSet;
end;

procedure TFrmCadGrpRegraMT.MessageCtrlGrpRegra(sMessageInfo: String);
begin
  ShowMessage(sMessageInfo);
end;

procedure TFrmCadGrpRegraMT.sbtnApagarClick(Sender: TObject);
begin
  sGrpRegra := DBEdit1.Text;
  inherited;

end;

procedure TFrmCadGrpRegraMT.CmeCadastroInsert(Sender: TObject);
begin
  EdDescricao.SetFocus;
  inherited;
end;

procedure TFrmCadGrpRegraMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  EdDescricao.SetFocus;
end;

end.