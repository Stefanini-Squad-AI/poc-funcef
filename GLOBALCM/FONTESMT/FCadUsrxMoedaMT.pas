unit FCadUsrxMoedaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, Grids, Wwdbigrd, Wwdbgrid, Buttons, StdCtrls, MontaSelect,
  Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlMoeda, uCtrlUsrMoeda, uCmTypes, uCmSqlParams;

type
  TFrmCadUsrxMoeda = class(TFrmCadastroMT)
    EdUsu: TEdit;
    Label1: TLabel;
    plnTransf: TPanel;
    grdTranf: TwwDBGrid;
    grgMoeda: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    CdsMoeda: TCMClientDataSet;
    DsMoeda: TwwDataSource;
    BtnAdicionaTudo: TSpeedButton;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    edNome: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure grgMoedaTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure grdTranfTitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    { Private declarations }
    iOrdemA, iOrdemB : integer;
    Procedure Seleciona( IdUsuario: Double );
  public
    { Public declarations }
    iIdUsuario: Double;
    Moeda: TCtrlMoeda;
    UsrMoeda: TCtrlUsrMoeda;
  end;

var
  FrmCadUsrxMoeda: TFrmCadUsrxMoeda;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, dBaseDados, uMidasUtil;

Procedure TFrmCadUsrxMoeda.Seleciona( IdUsuario: Double );
Begin
  cds.Data := UsrMoeda.ListaUsrMoeda( IdUsuario );
  CdsMoeda.Data := UsrMoeda.ListaUsrMoedaUsr( IdUsuario );

  If IdUsuario = -1 Then
     CdsMoeda.EmptyDataSet;
end;

procedure TFrmCadUsrxMoeda.FormCreate(Sender: TObject);
begin
  inherited;
  iOrdemA := 0;
  iOrdemB := 0;
  Moeda := TCtrlMoeda.Create;
  Moeda.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                    Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  UsrMoeda := TCtrlUsrMoeda.Create;
  UsrMoeda.InitializeAs( Moeda );
  UsrMoeda.cds := cds;

  CmeCadastro.RepetirInsert := False;
  iIdUsuario := -1;
  Seleciona( iIdUsuario );
  EdUsu.Clear;
end;

procedure TFrmCadUsrxMoeda.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    iIdUsuario := StrToFloat( MontaSelect.ValoresChave[ 0 ] );
    edUsu.Text := MontaSelect.ValoresChave[ 1 ];
    edNome.Text := MontaSelect.ValoresChave[ 2 ];
    Seleciona( iIdUsuario );
  End;
end;

procedure TFrmCadUsrxMoeda.CmeCadastroInsert(Sender: TObject);
begin
  If Trim( edUsu.Text ) = '' Then Begin
     MsgDlg( 'Não há Nenhum Usuário selecionado', 'Atenção', mtWarning, [mbOk], 0 );
     bbtnCancelar.Click;
  End;
end;

procedure TFrmCadUsrxMoeda.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  If Trim( edUsu.Text ) <> '' Then Begin
     Seleciona( iIdUsuario );
  End Else Begin
     Seleciona( -1 );
     edUsu.Clear;
  End;
end;

procedure TFrmCadUsrxMoeda.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao in [ opInserir, opAlterar ] Then Begin
     If Not CdsMoeda.IsEmpty Then Begin
        With Cds Do Begin
             Append;
             FieldByName( 'IDUSUARIO'{ivlm} ).AsFloat  := iIdUsuario;
             FieldByName( 'MOECODIGO'{ivlm} ).AsString := CdsMoeda.FieldByName( 'MOECODIGO'{ivlm} ).AsString;
             FieldByName( 'MOEDESC'{ivlm} ).AsString   := CdsMoeda.FieldByName( 'MOEDESC'{ivlm} ).AsString;
             //  pendência 18778 - 13/09/2005
             FieldByName( 'MOESIGLA' ).AsString   := CdsMoeda.FieldByName( 'MOESIGLA' ).AsString;
             Post;
        End;

        CdsMoeda.Delete;
     End;
  End;
end;

procedure TFrmCadUsrxMoeda.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao in [ opInserir, opAlterar ] Then Begin
     If Not Cds.IsEmpty Then Begin
        With CdsMoeda Do Begin
             Append;
             FieldByName( 'MOECODIGO'{ivlm} ).asString := Cds.FieldByName( 'MOECODIGO'{ivlm} ).asString;
             FieldByName( 'MOEDESC'{ivlm} ).AsString   := Cds.FieldByName( 'MOEDESC'{ivlm} ).AsString;
             // pendência 18778 - 13/09/2005
             FieldByName( 'MOESIGLA' ).AsString   := Cds.FieldByName( 'MOESIGLA' ).AsString;
             Post;
        End;

        Cds.Delete;
     End;
  End;
end;

procedure TFrmCadUsrxMoeda.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

procedure TFrmCadUsrxMoeda.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( UsrMoeda.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
end;

procedure TFrmCadUsrxMoeda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Moeda.Free;
  UsrMoeda.Free;
end;

procedure TFrmCadUsrxMoeda.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  CdsMoeda.First;

  While Not CdsMoeda.Eof Do
        btnAdiciona.Click;
end;

procedure TFrmCadUsrxMoeda.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  cds.First;

  While Not cds.Eof Do
        btnRemove.Click;
end;

procedure TFrmCadUsrxMoeda.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  UsrMoeda.Gravar;
  Seleciona( iIdUsuario );
end;

procedure TFrmCadUsrxMoeda.grgMoedaTitleButtonClick(Sender: TObject; AFieldName: String);
var
  IndexDef : TIndexDef;
begin
  inherited;
  if ( iOrdemA = 0 ) or ( iOrdemA = 2 ) then
    iOrdemA := 1
  else
    iOrdemA := 2;

  CdsMoeda.IndexName := '';
  CdsMoeda.IndexDefs.Clear;
  IndexDef := CdsMoeda.IndexDefs.AddIndexDef;
  IndexDef.Name := 'i' + IntToStr( GetTickCount );

  if iOrdemA = 1 then
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := '';
    IndexDef.Options := [];
  end
  else
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := AFieldName;
    IndexDef.Options := [ixDescending];
  end;

  CdsMoeda.IndexName := IndexDef.Name;
  CdsMoeda.First;
end;

procedure TFrmCadUsrxMoeda.grdTranfTitleButtonClick(Sender: TObject; AFieldName: String);
var
  IndexDef : TIndexDef;
begin
  inherited;
  if ( iOrdemB = 0 ) or ( iOrdemB = 2 ) then
    iOrdemB := 1
  else
    iOrdemB := 2;

  Cds.IndexName := '';
  Cds.IndexDefs.Clear;
  IndexDef := Cds.IndexDefs.AddIndexDef;
  IndexDef.Name := 'i' + IntToStr( GetTickCount );

  if iOrdemB = 1 then
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := '';
    IndexDef.Options := [];
  end
  else
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := AFieldName;
    IndexDef.Options := [ixDescending];
  end;

  Cds.IndexName := IndexDef.Name;
  Cds.First;
end;

end.

