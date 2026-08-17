unit FCadTipoRegraMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  wwdblook, wwdbedit, Mask, uCtrlTipoRegra, uCtrlGrpRegra, uCtrlPadroes,
  uCmTypes, uBiblioteca;

type
  TFrmCadTipoRegraMT = class(TFrmCadastroMT)
    IvExtendedTranslator1: TIvExtendedTranslator;
    IvExtendedTranslator2: TIvExtendedTranslator;
    Label1: TLabel;
    EdCodigo: TDBEdit;
    EdDescricao: TwwDBEdit;
    Label2: TLabel;
    Label4: TLabel;
    DbLkcGrupoRegra: TwwDBLookupCombo;
    Label3: TLabel;
    MemoSQL: TDBMemo;
    CdsIDTIPOREGRA: TFloatField;
    CdsDESCREGRA: TStringField;
    CdsIDGRUPOREGRA: TFloatField;
    CdsSQLREGRA: TMemoField;
    DsGrupoRegra: TwwDataSource;
    CdsGrpRegra: TCMClientDataSet;
    CdsGrpRegraIDGRUPOREGRA: TFloatField;
    CdsGrpRegraDESCRICAO: TStringField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
    CtrlTipoRegra  : TCtrlTipoRegra;
    CtrlGrpRegra   : TCtrlGrpRegra;
  public
    { Public declarations }
     sTipoRegra : String;
  end;

var
  FrmCadTipoRegraMT: TFrmCadTipoRegraMT;

implementation

Uses uSistema, dBaseDados;
{$R *.DFM}

procedure TFrmCadTipoRegraMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    Cds.Data := CtrlTipoRegra.SelecionaTipoRegra( StrToInt(MontaSelect.ValoresChave[0]) );
end;

procedure TFrmCadTipoRegraMT.FormCreate(Sender: TObject);
begin
  inherited;
  { Cria DataSet Local }
  CtrlTipoRegra:= TCtrlTipoRegra.Create;
  CtrlTipoRegra.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                           Nil );
  Cds.CreateDataSet;
  { Cria DataSet do grupo de Regras }
  CtrlGrpRegra := TCtrlGrpRegra.Create;
  CtrlGrpRegra.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                          Nil );
  CdsGrpRegra.Data := CtrlGrpRegra.ListaGrpRegra;
end;

procedure TFrmCadTipoRegraMT.CmeCadastroConfirma(Sender: TObject);
Var
  bGravouLog : Boolean;
  sTextoLog  : String;
begin
  {------------------------}
  { Gravar log de operação }
  If cmecadastro.Operacao = OpInserir then
    sTextoLog := 'Inclusão de Tipo de Regra '+EdCodigo.Text
  Else If cmecadastro.Operacao = OpAlterar then
    sTextoLog := 'Manutenção do Tipo de Regra '+EdCodigo.Text
  Else If cmecadastro.Operacao = OpApagar then
    sTextoLog := 'Exclusão do Tipo de Regra '+sTipoRegra;

  If Not GravaLogOperacao(sTextoLog) Then Begin
    Raise Exception.Create( 'Erro ao gravar o log da Operação ' );
    Exit;
  End;
  {-----------------------------------}

  inherited;

  { Transfere dados do Forumlário para o Control e confirma }
  CtrlTipoRegra.CdsTipoRegra.Data := Cds.Data;
  CtrlTipoRegra.GravaTipoRegra;

end;

procedure TFrmCadTipoRegraMT.sbtnApagarClick(Sender: TObject);
begin
  sTipoRegra := EdCodigo.Text;
  inherited;

end;

procedure TFrmCadTipoRegraMT.CmeCadastroInsert(Sender: TObject);
begin
  EdDescricao.SetFocus;
  inherited;

end;

procedure TFrmCadTipoRegraMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  EdDescricao.SetFocus;
end;

end.