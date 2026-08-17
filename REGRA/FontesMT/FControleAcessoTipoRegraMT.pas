unit FControleAcessoTipoRegraMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, UCtrlGrpRegraUsuario, DBTables, Provider, wwdblook,
  Machklb, uCmTypes, UCtrlTipoRegra;

type
  TFrmControleAcessoTipoRegraMT = class(TFrmCadastroGridMT)
    CdsIDGRUPOREGRA: TFloatField;
    CdsIDUSUARIO: TFloatField;
    CdsFLGINSERIR: TFloatField;
    CdsFLGALTERAR: TFloatField;
    CdsFLGEXCLUIR: TFloatField;
    CdsFLGPROCURAR: TFloatField;
    CdsDESCREGRA: TStringField;
    DsUsuario: TwwDataSource;
    CdsUsuario: TCMClientDataSet;
    Panel1: TPanel;
    DbLkcUsuario: TwwDBLookupCombo;
    Label4: TLabel;
    CdsUsuarioIDUSUARIO: TFloatField;
    CdsUsuarioNOMEUSUARIO: TStringField;
    CdsNOMEUSUARIO: TStringField;
    DsGrupoRegra: TwwDataSource;
    CdsTipoRegra: TCMClientDataSet;
    Label1: TLabel;
    DbLkcGrupoRegra: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    cklstPermissoes: TCMchklistbox;
    Query: TQuery;
    Provider: TDataSetProvider;
    CdsIDTIPOREGRA: TFloatField;
    CdsIDGRUPOREGRAUSU: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure DbLkcUsuarioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    { Private declarations }
    CtrlGrpRegraUsuario : TCtrlGrpRegraUsuario;
    CtrlTipoRegra       : TCtrlTipoRegra;
    procedure MessageCtrlAcesso( sMessageInfo : String );
  public
    { Public declarations }
  end;

var
  FrmControleAcessoTipoRegraMT: TFrmControleAcessoTipoRegraMT;

implementation

Uses uSistema, dBaseDados, uMensErro;

{$R *.DFM}

procedure TFrmControleAcessoTipoRegraMT.FormCreate(Sender: TObject);
begin
  inherited;
  { Cria Objetos }
  CtrlGrpRegraUsuario := TCtrlGrpRegraUsuario.Create;
  CtrlGrpRegraUsuario.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                 Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                 MessageCtrlAcesso);
                                 
  CtrlTipoRegra := TCtrlTipoRegra.Create;
  CtrlTipoRegra.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                           MessageCtrlAcesso);

  { Preenche Datasets da Tela  }
  CdsUsuario.Data := CtrlGrpRegraUsuario.ListaUsuario;
  Cds.Data := CtrlGrpRegraUsuario.SelecionaTipoRegraUsuario( CdsUsuario.FieldByName('IDUSUARIO').AsInteger );
  DbLkcUsuario.Text := CdsUsuario.FieldByName('NOMEUSUARIO').AsString;

  { Libera botões da tela }
  sbtnAlterar.Enabled := True;
  sbtnApagar.Enabled  := True;
end;

procedure TFrmControleAcessoTipoRegraMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    CdsUsuario.Locate( 'IDUSUARIO',MontaSelect.ValoresChave[0],[] );
    Cds.Data := CtrlGrpRegraUsuario.SelecionaTipoRegraUsuario( StrToInt(MontaSelect.ValoresChave[0]) );
    DbLkcUsuario.Text := CdsUsuario.FieldByName('NOMEUSUARIO').AsString;
  end;
end;

procedure TFrmControleAcessoTipoRegraMT.CmeCadastroConfirma(Sender: TObject);
begin
  { Altera Campos }
  if Cds.State in [dsEdit, dsInsert] then begin

     Cds.FieldByName('IDUSUARIO').AsInteger  := CdsUsuario.FieldByName('IDUSUARIO').AsInteger;
     { Zera Campos }
     Cds.FieldByName('FLGINSERIR').AsInteger  := 0;
     Cds.FieldByName('FLGALTERAR').AsInteger  := 0;
     Cds.FieldByName('FLGEXCLUIR').AsInteger  := 0;
     Cds.FieldByName('FLGPROCURAR').AsInteger := 0;

     { Atualiza Campos com dados da Tela }
     if cklstPermissoes.Selected[0] then Cds.FieldByName('FLGINSERIR').AsInteger  := 1;
     if cklstPermissoes.Selected[1] then Cds.FieldByName('FLGALTERAR').AsInteger  := 1;
     if cklstPermissoes.Selected[2] then Cds.FieldByName('FLGEXCLUIR').AsInteger  := 1;
     if cklstPermissoes.Selected[3] then Cds.FieldByName('FLGPROCURAR').AsInteger := 1;

  end;

  inherited;

  { Transfere dados do Forumlário para o Control e confirma }
  CtrlGrpRegraUsuario.CdsGrpRegraUsuario.Data := Cds.Data;
  CtrlGrpRegraUsuario.GravaGrpRegraUsuario;


  { Rele dados dos Datasets da Tela  }
  Cds.Data := CtrlGrpRegraUsuario.SelecionaTipoRegraUsuario( CdsUsuario.FieldByName('IDUSUARIO').AsInteger );

  { Libera botões da tela }
  sbtnAlterar.Enabled  := True;
  sbtnApagar.Enabled   := True;

  DbLkcUsuario.Enabled := True;

end;

procedure TFrmControleAcessoTipoRegraMT.MessageCtrlAcesso(sMessageInfo: String);
begin
  ShowMessage(sMessageInfo); 
end;

procedure TFrmControleAcessoTipoRegraMT.FormShow(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := True;
  sbtnApagar.Enabled  := True;
  dbGrd.BringToFront;
end;

procedure TFrmControleAcessoTipoRegraMT.CmeCadastroEdit(Sender: TObject);
begin
  DbLkcGrupoRegra.Enabled := False;
  DbLkcUsuario.Enabled    := False;

  CdsTipoRegra.Data := CtrlTipoRegra.ListaTipoRegra;

  if Cds.FieldByName('FLGINSERIR').AsInteger = 0
  then cklstPermissoes.Selected[0] := False
  else cklstPermissoes.Selected[0] := True;

  if Cds.FieldByName('FLGALTERAR').AsInteger = 0
  then cklstPermissoes.Selected[1] := False
  else cklstPermissoes.Selected[1] := True;

  if Cds.FieldByName('FLGEXCLUIR').AsInteger = 0
  then cklstPermissoes.Selected[2] := False
  else cklstPermissoes.Selected[2] := True;

  if Cds.FieldByName('FLGPROCURAR').AsInteger = 0
  then cklstPermissoes.Selected[3] := False
  else cklstPermissoes.Selected[3] := True;

  inherited;

end;

procedure TFrmControleAcessoTipoRegraMT.sbtnApagarClick(Sender: TObject);
begin
  CmeCadastro.Operacao := opIdle;
  inherited;
end;

procedure TFrmControleAcessoTipoRegraMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlGrpRegraUsuario);
  FreeAndNil(CtrlTipoRegra);
  inherited;
end;

procedure TFrmControleAcessoTipoRegraMT.CmeCadastroInsert(Sender: TObject);
begin
  CdsTipoRegra.Data := CtrlGrpRegraUsuario.ListaTipoRegraNaoAssociado( CdsUsuario.FieldByName('IDUSUARIO').AsInteger );

  DbLkcGrupoRegra.Enabled := True;
  DbLkcUsuario.Enabled    := False;

  inherited;
end;

procedure TFrmControleAcessoTipoRegraMT.DbLkcUsuarioCloseUp(Sender: TObject;
                                                   LookupTable, FillTable: TDataSet;
                                                   Modified: Boolean);
begin
  If DbLkcUsuario.LookupValue <> '' Then
    Cds.Data := CtrlGrpRegraUsuario.SelecionaTipoRegraUsuario( StrToInt(DbLkcUsuario.LookupValue) );
  inherited;
end;

procedure TFrmControleAcessoTipoRegraMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;

  DbLkcUsuario.Enabled := True;

end;

end.