unit FControleAcessoGrpRegraMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, UCtrlGrpRegraUsuario, DBTables, Provider, wwdblook,
  Machklb, uCmTypes, UCtrlGrpRegra;

type
  TFrmControleAcessoGrpRegraMT = class(TFrmCadastroGridMT)
    CdsIDGRUPOREGRA: TFloatField;
    CdsIDUSUARIO: TFloatField;
    CdsFLGINSERIR: TFloatField;
    CdsFLGALTERAR: TFloatField;
    CdsFLGEXCLUIR: TFloatField;
    CdsFLGPROCURAR: TFloatField;
    CdsDESCRICAO: TStringField;
    DsUsuario: TwwDataSource;
    CdsUsuario: TCMClientDataSet;
    Panel1: TPanel;
    DbLkcUsuario: TwwDBLookupCombo;
    Label4: TLabel;
    CdsUsuarioIDUSUARIO: TFloatField;
    CdsUsuarioNOMEUSUARIO: TStringField;
    CdsNOMEUSUARIO: TStringField;
    DsGrupoRegra: TwwDataSource;
    CdsGrpRegra: TCMClientDataSet;
    CdsGrpRegraDESCRICAO: TStringField;
    CdsGrpRegraIDGRUPOREGRA: TFloatField;
    Label1: TLabel;
    DbLkcGrupoRegra: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    cklstPermissoes: TCMchklistbox;
    Query: TQuery;
    Provider: TDataSetProvider;
    CdsIDGRUPOREGRAUSU: TFloatField;
    ToolbarButton971: TToolbarButton97;
    BtAtualizaAcesso: TSpeedButton;
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
    CtrlGrpRegra        : TCtrlGrpRegra;
    CtrlGrpRegraUsuario : TCtrlGrpRegraUsuario;
    procedure MessageCtrlAcesso( sMessageInfo : String );
  public
    { Public declarations }
  end;

var
  FrmControleAcessoGrpRegraMT: TFrmControleAcessoGrpRegraMT;

implementation

Uses uSistema, dBaseDados, uMensErro;

{$R *.DFM}

procedure TFrmControleAcessoGrpRegraMT.FormCreate(Sender: TObject);
begin
  inherited;
  { Cria Objetos }
  CtrlGrpRegra := TCtrlGrpRegra.Create;
  CtrlGrpRegra.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                          MessageCtrlAcesso);

  CtrlGrpRegraUsuario := TCtrlGrpRegraUsuario.Create;
  CtrlGrpRegraUsuario.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                 Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                 MessageCtrlAcesso);
  { Preenche Datasets da Tela  }
  CdsUsuario.Data := CtrlGrpRegraUsuario.ListaUsuario;
  Cds.Data := CtrlGrpRegraUsuario.SelecionaGrpRegraUsuario( CdsUsuario.FieldByName('IDUSUARIO').AsInteger );
  DbLkcUsuario.Text := CdsUsuario.FieldByName('NOMEUSUARIO').AsString;

  { Libera botões da tela }
  sbtnAlterar.Enabled := True;
  sbtnApagar.Enabled  := True;
end;

procedure TFrmControleAcessoGrpRegraMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    CdsUsuario.Locate( 'IDUSUARIO',MontaSelect.ValoresChave[0],[] );
    Cds.Data := CtrlGrpRegraUsuario.SelecionaGrpRegraUsuario( StrToInt(MontaSelect.ValoresChave[0]) );
    DbLkcUsuario.Text := CdsUsuario.FieldByName('NOMEUSUARIO').AsString;
  end;
end;

procedure TFrmControleAcessoGrpRegraMT.CmeCadastroConfirma(Sender: TObject);
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
  Cds.Data := CtrlGrpRegraUsuario.SelecionaGrpRegraUsuario( CdsUsuario.FieldByName('IDUSUARIO').AsInteger );

  { Libera botões da tela }
  sbtnAlterar.Enabled  := True;
  sbtnApagar.Enabled   := True;

  DbLkcUsuario.Enabled := True;

end;

procedure TFrmControleAcessoGrpRegraMT.MessageCtrlAcesso(sMessageInfo: String);
begin
  ShowMessage(sMessageInfo);
end;

procedure TFrmControleAcessoGrpRegraMT.FormShow(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := True;
  sbtnApagar.Enabled  := True;
  dbGrd.BringToFront;

end;

procedure TFrmControleAcessoGrpRegraMT.CmeCadastroEdit(Sender: TObject);
begin
  DbLkcUsuario.Enabled    := False;
  DbLkcGrupoRegra.Enabled := False;


  CdsGrpRegra.Data := CtrlGrpRegra.ListaGrpRegra;

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

procedure TFrmControleAcessoGrpRegraMT.sbtnApagarClick(Sender: TObject);
begin
  CmeCadastro.Operacao := opIdle;
  inherited;
end;

procedure TFrmControleAcessoGrpRegraMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlGrpRegraUsuario);
  inherited;
end;

procedure TFrmControleAcessoGrpRegraMT.CmeCadastroInsert(Sender: TObject);
begin
  DbLkcUsuario.Enabled    := False;
  DbLkcGrupoRegra.Enabled := True;

  CdsGrpRegra.Data := CtrlGrpRegraUsuario.ListaGrpRegraNaoAssociado( CdsUsuario.FieldByName('IDUSUARIO').AsInteger );
  inherited;
end;

procedure TFrmControleAcessoGrpRegraMT.DbLkcUsuarioCloseUp(Sender: TObject;
                                                           LookupTable, FillTable: TDataSet;
                                                           Modified: Boolean);
begin
  If DbLkcUsuario.LookupValue <> '' Then
    Cds.Data := CtrlGrpRegraUsuario.SelecionaGrpRegraUsuario( StrToInt(DbLkcUsuario.LookupValue) );
  inherited;
end;


procedure TFrmControleAcessoGrpRegraMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;

  DbLkcUsuario.Enabled := True;

end;

end.