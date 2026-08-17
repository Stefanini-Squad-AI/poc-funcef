//------------------------------------------------------------------------------
// Autor(a)    :  BRUNO AZEVEDO
// Data        :  30/04/2012
// Pendência   :  SOL 179181 KINTANA 1648279
// Descrição   :  Ajuste no controle dos botões.
//------------------------------------------------------------------------------
//  Autor     : Fanuel Junior
//  Rotina    : COMPARAVALBENEF
//  Pendencia : SOL 157238 Kintana 1250247
//  Descrição : Criação da fórmula COMPARAVALBENEF
//------------------------------------------------------------------------------
unit FCadVariavelMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, wwdbedit, uCtrlVariavel, uCtrlPadroes,
  uCmTypes, uBiblioteca;

type
  TFrmCadVariavelMT = class(TFrmCadastroGridMT)
    CdsIDCAMPO: TStringField;
    CdsDESCRICAODOCAMPO: TStringField;
    Label1: TLabel;
    EdCodigo: TwwDBEdit;
    Label3: TLabel;
    EdDescricao: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlVariavel : TCtrlVariavel;
    procedure MessageCtrlVariavel( sMessageInfo : String);
  public
    { Public declarations }
    sIdVariavel : String; 
  end;

var
  FrmCadVariavelMT: TFrmCadVariavelMT;

implementation

Uses uSistema, dBaseDados, uMensErro;

{$R *.DFM}

procedure TFrmCadVariavelMT.FormCreate(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := True;
  sbtnApagar.Enabled  := True;

  CtrlVariavel := TCtrlVariavel.Create;
  CtrlVariavel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                            Nil );
  Cds.Data := CtrlVariavel.ListaVariavel;

end;

procedure TFrmCadVariavelMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    Cds.Locate( 'IDCAMPO',MontaSelect.ValoresChave[0],[] );
end;

procedure TFrmCadVariavelMT.CmeCadastroConfirma(Sender: TObject);
Var
  bGravouLog : Boolean;
  sTextoLog  : String;
begin
  { Caso inserindo e codigo }
  If (Cds.State = DsInsert) And
     (Ctrlvariavel.ExisteVariavel( UpperCase(EdCodigo.Text) ) = True)
  Then Begin
    MsgDlg('Código informado já existe!','Erro',mtError,[mbOk],0);
    Exit;
  End;

  inherited;

  {------------------------}
  { Gravar log de operação }
  If cmecadastro.Operacao = OpInserir then
    sTextoLog := 'Inclusão de Variável '+EdCodigo.Text
  Else If cmecadastro.Operacao = OpAlterar then
    sTextoLog := 'Manutenção da Variável '+EdCodigo.Text
  Else If cmecadastro.Operacao = OpApagar then
    sTextoLog := 'Exclusão da Variável '+sIdVariavel;

  If Not GravaLogOperacao(sTextoLog) Then Begin
    Raise Exception.Create( 'Erro ao gravar o log da Operação ' );
    Exit;
  End;
  {-----------------------------------}

  { Transfere dados do Forumlário para o Control e confirma }
  CtrlVariavel.CdsVariavel.Data := Cds.Data;
  CtrlVariavel.GravaVariavel;

  Cds.Data := CtrlVariavel.ListaVariavel;
  sbtnAlterar.Enabled := True;
  sbtnApagar.Enabled  := True;

end;

procedure TFrmCadVariavelMT.FormShow(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := True;
  sbtnApagar.Enabled  := True;
  dbGrd.BringToFront;
end;

procedure TFrmCadVariavelMT.bbtnConfirmarClick(Sender: TObject);
begin
  { Verifica preenchimento da tela }
  If EdCodigo.Text = '' Then Begin
    MsgDlg('Código deve ser informado!','Erro',mtError,[mbOk],0);
    Exit;
  End;

  inherited;

end;

procedure TFrmCadVariavelMT.MessageCtrlVariavel(sMessageInfo: String);
begin
  ShowMessage(sMessageInfo);
end;

procedure TFrmCadVariavelMT.sbtnApagarClick(Sender: TObject);
begin
  sIdVariavel := EdCodigo.Text;
  inherited;

end;

procedure TFrmCadVariavelMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  EdCodigo.SetFocus;
end;

procedure TFrmCadVariavelMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  EdCodigo.SetFocus;
end;

procedure TFrmCadVariavelMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlVariavel);
  inherited;
end;

procedure TFrmCadVariavelMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  //BRUNO AZEVEDO SOL 179181 KINTANA 1648279
  sbtnAlterar.Enabled := True;
  sbtnApagar.Enabled  := True;
  Cds.Data := CtrlVariavel.ListaVariavel;
  dbGrd.BringToFront;
  //BRUNO AZEVEDO SOL 179181 KINTANA 1648279
end;

End.