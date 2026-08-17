unit FControleAcessoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, UCtrlGrpRegraUsuario, DBTables, Provider, wwdblook,
  Machklb, uCmTypes;

type
  TFrmControleAcessoMT = class(TFrmCadastroGridMT)
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
  private
    { Private declarations }
    CtrlGrpRegraUsuario : TCtrlGrpRegraUsuario;
    procedure MessageCtrlAcesso( sMessageInfo : String );
  public
    { Public declarations }
  end;

var
  FrmControleAcessoMT: TFrmControleAcessoMT;

implementation

Uses uSistema, dBaseDados, uMensErro;

{$R *.DFM}

procedure TFrmControleAcessoMT.FormCreate(Sender: TObject);
begin
  inherited;

  { Cria Objetos }
  CtrlGrpRegraUsuario := TCtrlGrpRegraUsuario.Create;
  CtrlGrpRegraUsuario.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                 Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                 MessageCtrlAcesso);

  { Preenche Datasets da Tela  }
  CdsUsuario.Data := CtrlGrpRegraUsuario.ListaUsuario;
  Cds.Data := CtrlGrpRegraUsuario.SelecionaGrpRegraUsuario( CdsUsuario.FieldByName('IDUSUARIO').AsInteger );
  DbLkcUsuario.Text := CdsUsuario.FieldByName('NOMEUSUARIO').AsString;
end;

procedure TFrmControleAcessoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    CdsUsuario.Locate( 'IDUSUARIO',MontaSelect.ValoresChave[0],[] );
    Cds.Data := CtrlGrpRegraUsuario.SelecionaGrpRegraUsuario( StrToInt(MontaSelect.ValoresChave[0]) );
    DbLkcUsuario.Text := CdsUsuario.FieldByName('NOMEUSUARIO').AsString;
  end;
end;

procedure TFrmControleAcessoMT.CmeCadastroConfirma(Sender: TObject);
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

  sbtnAlterar.Enabled := True;
  sbtnApagar.Enabled  := True;

end;

procedure TFrmControleAcessoMT.MessageCtrlAcesso(sMessageInfo: String);
begin
  ShowMessage(sMessageInfo); 
end;

procedure TFrmControleAcessoMT.FormShow(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := True;
  sbtnApagar.Enabled  := True;
  dbGrd.BringToFront;
end;

procedure TFrmControleAcessoMT.CmeCadastroEdit(Sender: TObject);
begin
  CdsGrpRegra.Data := CtrlGrpRegraUsuario.ListaGrpRegraNaoAssociado( CdsUsuario.FieldByName('IDUSUARIO').AsInteger );
  inherited;
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

end;

procedure TFrmControleAcessoMT.sbtnApagarClick(Sender: TObject);
begin
  CmeCadastro.Operacao := opIdle;
  inherited;
end;

procedure TFrmControleAcessoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlGrpRegraUsuario);
  inherited;
end;

procedure TFrmControleAcessoMT.CmeCadastroInsert(Sender: TObject);
begin
  CdsGrpRegra.Data := CtrlGrpRegraUsuario.ListaGrpRegraNaoAssociado( CdsUsuario.FieldByName('IDUSUARIO').AsInteger );
  inherited;
end;

procedure TFrmControleAcessoMT.DbLkcUsuarioCloseUp(Sender: TObject;
                                                   LookupTable, FillTable: TDataSet;
                                                   Modified: Boolean);
begin
  Cds.Data := CtrlGrpRegraUsuario.SelecionaGrpRegraUsuario( StrToInt(DbLkcUsuario.LookupValue) );
  inherited;
end;

end.