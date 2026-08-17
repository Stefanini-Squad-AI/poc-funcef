unit FCadGrpFormulaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Mask, wwdbedit, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlGrpFormula, uCtrlPadroes, uBiblioteca,
  {$IFDEF VERSAO0505} uComum, {$ELSE} uCMTypes, {$ENDIF}
  uMensErro;



type
  TFrmCadGrpFormulaMT = class(TFrmCadastroMT)
    Label1: TLabel;
    EdCodigo: TwwDBEdit;
    Label2: TLabel;
    EdDescricao: TwwDBEdit;
    CdsCODGRUPOFORMULA: TStringField;
    CdsDESCGRUPOFORMULA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlGrpFormula : TCtrlGrpFormula;

    procedure MessageCtrlGrpFormula( sMessageInfo : String);

  public
    { Public declarations }
    sGrpFormula : String;
  end;

var
  FrmCadGrpFormulaMT: TFrmCadGrpFormulaMT;

implementation

Uses uSistema, dBaseDados;

{$R *.DFM}

procedure TFrmCadGrpFormulaMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGrpFormula := TCtrlGrpFormula.Create;
  CtrlGrpFormula.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                            MessageCtrlGrpFormula );
  Cds.CreateDataSet;
end;

procedure TFrmCadGrpFormulaMT.MessageCtrlGrpFormula(sMessageInfo: String);
begin
  ShowMessage(sMessageInfo);
end;

procedure TFrmCadGrpFormulaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    Cds.Data := CtrlGrpFormula.SelecionaGrpFormula( MontaSelect.ValoresChave[0] );
end;

procedure TFrmCadGrpFormulaMT.CmeCadastroConfirma(Sender: TObject);
Var
  bGravouLog : Boolean;
  sTextoLog : String;
begin
  { Caso inserindo e codigo }
  If (Cds.State = DsInsert) And
     (CtrlGrpFormula.ExisteGrpFormula( UpperCase(EdCodigo.Text) ) = True)
  Then Begin
    MsgDlg('Código informado já existe!','Erro',mtError,[mbOk],0);
    Exit;
  End;

  {-----------------------}
  { Gravar log de operação}
  If cmecadastro.Operacao = OpInserir then
    sTextoLog := 'Inclusão de Grupo de Fórmula '+EdCodigo.Text
  Else If cmecadastro.Operacao = OpAlterar then
    sTextoLog := 'Manutenção do Grupo de Fórmula '+EdCodigo.Text
  Else If cmecadastro.Operacao = OpApagar then
    sTextoLog := 'Exclusão do Grupo de Fórmula '+sGrpFormula;

  If Not GravaLogOperacao(sTextoLog) Then Begin
    Raise Exception.Create( 'Erro ao gravar o log da Operação ' );
    Exit;
  End;
  {-----------------------}

  inherited;

  { Transfere dados do Forumlário para o Control e confirma }
  CtrlGrpFormula.CdsGrpFormula.Data := Cds.Data;
  CtrlGrpFormula.GravaGrpFormula;
  
  EdCodigo.Enabled := True;

  { Refaz pesquisa com novos Dados }
  if MontaSelect.RetornouValor then
    Cds.Data := CtrlGrpFormula.SelecionaGrpFormula( MontaSelect.ValoresChave[0] );

end;

procedure TFrmCadGrpFormulaMT.CmeCadastroEdit(Sender: TObject);
begin
  EdDescricao.SetFocus; 
  inherited;
  EdCodigo.Enabled := False;
end;

procedure TFrmCadGrpFormulaMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  EdCodigo.Enabled := True;

  { Limpa Dataset }
  Cds.Close;
  Cds.CreateDataSet;
end;

procedure TFrmCadGrpFormulaMT.sbtnApagarClick(Sender: TObject);
begin
  sGrpFormula := EdCodigo.Text;
  inherited;

end;

procedure TFrmCadGrpFormulaMT.CmeCadastroInsert(Sender: TObject);
begin
  EdCodigo.SetFocus;
  inherited;
end;

procedure TFrmCadGrpFormulaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlGrpFormula);
  inherited;

end;

end.