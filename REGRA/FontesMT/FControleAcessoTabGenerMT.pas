unit FControleAcessoTabGenerMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, UCtrlTabgenerUsuario, DBTables, Provider, wwdblook,
  Machklb, uCmTypes, Wwquery;

type
  TFrmControleAcessoTabGenerMT = class(TFrmCadastroGridMT)
    DsUsuario: TwwDataSource;
    CdsUsuario: TCMClientDataSet;
    Panel1: TPanel;
    DbLkcUsuario: TwwDBLookupCombo;
    Label4: TLabel;
    CdsUsuarioIDUSUARIO: TFloatField;
    CdsUsuarioNOMEUSUARIO: TStringField;
    DsTabgener: TwwDataSource;
    CdsTabgener: TCMClientDataSet;
    Label1: TLabel;
    DbLkcTabgener: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    cklstPermissoes: TCMchklistbox;
    CdsTabgenerCODTABELA: TStringField;
    CdsTabgenerDESCRICAO: TStringField;
    CdsCODTABELA: TStringField;
    CdsIDUSUARIO: TFloatField;
    CdsFLGALTERAR: TFloatField;
    CdsFLGEXCLUIR: TFloatField;
    CdsFLGPROCURAR: TFloatField;
    CdsDESCRICAO: TStringField;
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
    CtrlTabgenerUsuario : TCtrlTabgenerUsuario;
    procedure MessageCtrlAcesso( sMessageInfo : String );
  public
    { Public declarations }
  end;

var
  FrmControleAcessoTabGenerMT: TFrmControleAcessoTabGenerMT;

implementation

Uses uSistema, dBaseDados, uMensErro;

{$R *.DFM}

procedure TFrmControleAcessoTabGenerMT.FormCreate(Sender: TObject);
begin
  inherited;

  { Cria Objetos }
  CtrlTabgenerUsuario := TCtrlTabgenerUsuario.Create;
  CtrlTabgenerUsuario.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                 Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                 MessageCtrlAcesso);

  { Preenche Datasets da Tela  }
  CdsUsuario.Data := CtrlTabgenerUsuario.ListaUsuario;
  Cds.Data := CtrlTabgenerUsuario.SelecionaTabgenerUsuario( CdsUsuario.FieldByName('IDUSUARIO').AsInteger );
  DbLkcUsuario.Text := CdsUsuario.FieldByName('NOMEUSUARIO').AsString;
end;

procedure TFrmControleAcessoTabGenerMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    CdsUsuario.Locate( 'IDUSUARIO',MontaSelect.ValoresChave[0],[] );
    Cds.Data := CtrlTabgenerUsuario.SelecionaTabgenerUsuario( StrToInt(MontaSelect.ValoresChave[0]) );
    DbLkcUsuario.Text := CdsUsuario.FieldByName('NOMEUSUARIO').AsString;
  end;
end;

procedure TFrmControleAcessoTabGenerMT.CmeCadastroConfirma(Sender: TObject);
begin
  { Altera Campos }
  if Cds.State in [dsEdit, dsInsert] then begin

     Cds.FieldByName('IDUSUARIO').AsInteger  := CdsUsuario.FieldByName('IDUSUARIO').AsInteger;
     { Zera Campos }
     Cds.FieldByName('FLGALTERAR').AsInteger  := 0;
     Cds.FieldByName('FLGEXCLUIR').AsInteger  := 0;
     Cds.FieldByName('FLGPROCURAR').AsInteger := 0;

     { Atualiza Campos com dados da Tela }
     if cklstPermissoes.Selected[0] then Cds.FieldByName('FLGALTERAR').AsInteger  := 1;
     if cklstPermissoes.Selected[1] then Cds.FieldByName('FLGEXCLUIR').AsInteger  := 1;
     if cklstPermissoes.Selected[2] then Cds.FieldByName('FLGPROCURAR').AsInteger := 1;

  end;

  inherited;

  { Transfere dados do Forumlário para o Control e confirma }
  CtrlTabgenerUsuario.CdsTabgenerUsuario.Data := Cds.Data;
  CtrlTabgenerUsuario.GravaTabgenerUsuario;


  { Rele dados dos Datasets da Tela  }
  Cds.Data := CtrlTabgenerUsuario.SelecionaTabgenerUsuario( CdsUsuario.FieldByName('IDUSUARIO').AsInteger );

  sbtnAlterar.Enabled := True;
  sbtnApagar.Enabled  := True;

  DbLkcUsuario.Enabled := True;
  
end;

procedure TFrmControleAcessoTabGenerMT.MessageCtrlAcesso(sMessageInfo: String);
begin
  ShowMessage(sMessageInfo); 
end;

procedure TFrmControleAcessoTabGenerMT.FormShow(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := True;
  sbtnApagar.Enabled  := True;
  dbGrd.BringToFront;
end;

procedure TFrmControleAcessoTabGenerMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  DbLkcTabgener.Enabled := False;
  DbLkcUsuario.Enabled  := False;

  if Cds.FieldByName('FLGALTERAR').AsInteger = 0
  then cklstPermissoes.Selected[0] := False
  else cklstPermissoes.Selected[0] := True;

  if Cds.FieldByName('FLGEXCLUIR').AsInteger = 0
  then cklstPermissoes.Selected[1] := False
  else cklstPermissoes.Selected[1] := True;

  if Cds.FieldByName('FLGPROCURAR').AsInteger = 0
  then cklstPermissoes.Selected[2] := False
  else cklstPermissoes.Selected[2] := True;

end;

procedure TFrmControleAcessoTabGenerMT.sbtnApagarClick(Sender: TObject);
begin
  CmeCadastro.Operacao := opIdle;
  inherited;
end;

procedure TFrmControleAcessoTabGenerMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlTabgenerUsuario);
  inherited;
end;

procedure TFrmControleAcessoTabGenerMT.CmeCadastroInsert(Sender: TObject);
begin
  CdsTabgener.Data := CtrlTabgenerUsuario.ListaTabgenerNaoAssociado( CdsUsuario.FieldByName('IDUSUARIO').AsInteger );

  DbLkcTabgener.Enabled := True;
  DbLkcUsuario.Enabled  := False;
  
  inherited;
end;

procedure TFrmControleAcessoTabGenerMT.DbLkcUsuarioCloseUp(Sender: TObject;
                                                   LookupTable, FillTable: TDataSet;
                                                   Modified: Boolean);
begin
  If DbLkcUsuario.LookupValue <> '' Then
    Cds.Data := CtrlTabgenerUsuario.SelecionaTabgenerUsuario( StrToInt(DbLkcUsuario.LookupValue) );

  inherited;
end;

procedure TFrmControleAcessoTabGenerMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;

  DbLkcUsuario.Enabled := True;

end;

end.