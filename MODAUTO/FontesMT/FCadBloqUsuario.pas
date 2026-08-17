unit FCadBloqUsuario;

//******************************************************************************************
//N. Sol..........: 228736/17139
//N. Kintana......: 761996
//Data............: 27/04/2015
//Responsável.....: Felipe A. Santos
//Descrição.......: Criação da funcionalidade
//******************************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, fcButton,
  fcImgBtn, fcShapeBtn, uCtrlParamRH, Db, DBClient, uCMClientDataSet,
  wwdblook, Wwdatsrc, uCtrlUsuarioSistema;

type
  TfrmCadBloqUsuario = class(TForm)
    pnlCabecalho: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    pgctrlDetalhe: TPageControl;
    tsUsuario: TTabSheet;
    pnlUsuLib: TPanel;
    grdUsuarioLib: TwwDBGrid;
    edtDiasBloq: TEdit;
    edtPrevDesbloqueio: TEdit;
    btnLFUm: TfcShapeBtn;
    btnLFTodos: TfcShapeBtn;
    btnFLUm: TfcShapeBtn;
    btnFLTodos: TfcShapeBtn;
    cds: TCMClientDataSet;
    pnlFundo : TPanel;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    sep3: TToolbarSep97;
    btnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    cdsGrupoAcesso: TCMClientDataSet;
    dsUsuarioBloq: TwwDataSource;
    cdsUsuarioBloq: TCMClientDataSet;
    cdsUsuarioLib: TCMClientDataSet;
    dsUsuarioLib: TwwDataSource;
    pnlUsuBloq: TPanel;
    Panel1: TPanel;
    lbl3: TLabel;
    lblUsuariosBloq: TLabel;
    dblkpGrupoAcesso: TwwDBLookupCombo;
    grdUsuarioBloq: TwwDBGrid;
    Panel2: TPanel;
    lblUsuLib: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure dblkpGrupoAcessoChange(Sender: TObject);
    procedure btnLFUmClick(Sender: TObject);
    procedure btnFLUmClick(Sender: TObject);
    procedure btnLFTodosClick(Sender: TObject);
    procedure btnFLTodosClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
     CtrlParamRH : TCtrlParamRH;
     CtrlUsuarioSistema : TCtrlUsuarioSistema;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBloqUsuario: TfrmCadBloqUsuario;

implementation

uses
  uCtrlPadroes, uCtrlFuncoesRH, UMensErro;

{$R *.DFM}


procedure TfrmCadBloqUsuario.FormCreate(Sender: TObject);
begin
  CtrlParamRH := TCtrlParamRH.Create;
  CtrlParamRH.InitializeAs(Padroes);

  CtrlUsuarioSistema := TCtrlUsuarioSistema.Create;
  CtrlUsuarioSistema.InitializeAs(Padroes);

  cds.Data := CtrlParamRH.ListParamRH;
  cdsGrupoAcesso.Data := CtrlUsuarioSistema.ListaGrupoAcesso;
  cdsUsuarioBloq.Data := CtrlUsuarioSistema.ListaGrupoUsu(-1, True);
  cdsUsuarioLib.Data := CtrlUsuarioSistema.ListaGrupoUsu(-1, False);

  edtDiasBloq.Text := IntToStr(cds.FieldByName('DIASBLOQDESTAC').AsInteger);
  edtPrevDesbloqueio.Text := DateToStr(CtrlParamRH.GetDataDesbloqueio(cds.FieldByName('DIASBLOQDESTAC').AsInteger + 2));

  HelpContext := 4170038;
end;

procedure TfrmCadBloqUsuario.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadBloqUsuario.dblkpGrupoAcessoChange(Sender: TObject);
begin
  if (Trim(dblkpGrupoAcesso.LookupValue) <> '') then
  begin
     cdsUsuarioBloq.Data := CtrlUsuarioSistema.ListaGrupoUsu(StrToFloat(dblkpGrupoAcesso.LookupValue), True);
     cdsUsuarioLib.Data := CtrlUsuarioSistema.ListaGrupoUsu(StrToFloat(dblkpGrupoAcesso.LookupValue), False);
  end;
end;

procedure TfrmCadBloqUsuario.btnLFUmClick(Sender: TObject);
begin
  if not(cdsUsuarioBloq.IsEmpty) then
  begin
    cdsUsuarioLib.Insert;
    cdsUsuarioLib.FieldByName('NOMEUSUARIO').AsString := cdsUsuarioBloq.FieldByName('NOMEUSUARIO').AsString;
    cdsUsuarioLib.FieldByName('IDUSUARIO').AsInteger := cdsUsuarioBloq.FieldByName('IDUSUARIO').AsInteger;
    cdsUsuarioLib.Post;
    cdsUsuarioBloq.Delete;

    if not(btnConfirmar.Enabled) and not(btnCancelar.Enabled) then
    begin
      btnConfirmar.Enabled := True;
      btnCancelar.Enabled := True;
    end;
  end;
end;

procedure TfrmCadBloqUsuario.btnFLUmClick(Sender: TObject);
begin
  if not(cdsUsuarioLib.IsEmpty) then
  begin
    cdsUsuarioBloq.Insert;
    cdsUsuarioBloq.FieldByName('NOMEUSUARIO').AsString := cdsUsuarioLib.FieldByName('NOMEUSUARIO').AsString;
    cdsUsuarioBloq.FieldByName('IDUSUARIO').AsInteger := cdsUsuarioLib.FieldByName('IDUSUARIO').AsInteger;
    cdsUsuarioBloq.Post;
    cdsUsuarioLib.Delete;

    if not(btnConfirmar.Enabled) and not(btnCancelar.Enabled) then
    begin
      btnConfirmar.Enabled := True;
      btnCancelar.Enabled := True;
    end;
  end;
end;

procedure TfrmCadBloqUsuario.btnLFTodosClick(Sender: TObject);
begin
 cdsUsuarioBloq.DisableControls;
 cdsUsuarioBloq.First;
 while not(cdsUsuarioBloq.Eof) do
 begin
   cdsUsuarioLib.Insert;
   cdsUsuarioLib.FieldByName('NOMEUSUARIO').AsString := cdsUsuarioBloq.FieldByName('NOMEUSUARIO').AsString;
   cdsUsuarioLib.FieldByName('IDUSUARIO').AsInteger := cdsUsuarioBloq.FieldByName('IDUSUARIO').AsInteger;
   cdsUsuarioLib.Post;
   cdsUsuarioBloq.Delete;

   if not(btnConfirmar.Enabled) and not(btnCancelar.Enabled) then
    begin
      btnConfirmar.Enabled := True;
      btnCancelar.Enabled := True;
    end;
 end;
 cdsUsuarioBloq.EnableControls;
end;

procedure TfrmCadBloqUsuario.btnFLTodosClick(Sender: TObject);
begin
  cdsUsuarioLib.DisableControls;
  cdsUsuarioLib.First;
  while not(cdsUsuarioLib.Eof) do
  begin
    cdsUsuarioBloq.Insert;
    cdsUsuarioBloq.FieldByName('NOMEUSUARIO').AsString := cdsUsuarioLib.FieldByName('NOMEUSUARIO').AsString;
    cdsUsuarioBloq.FieldByName('IDUSUARIO').AsInteger := cdsUsuarioLib.FieldByName('IDUSUARIO').AsInteger;
    cdsUsuarioBloq.Post;
    cdsUsuarioLib.Delete;

    if not(btnConfirmar.Enabled) and not(btnCancelar.Enabled) then
    begin
      btnConfirmar.Enabled := True;
      btnCancelar.Enabled := True;
    end;
  end;
  cdsUsuarioLib.EnableControls;
end;

procedure TfrmCadBloqUsuario.btnConfirmarClick(Sender: TObject);
var
  sIdUsuario : String;
  bResult : Boolean;
begin
  // grava usuários bloqueados
  sIdUsuario := '';

  cdsUsuarioBloq.DisableControls;
  cdsUsuarioBloq.First;
  while not(cdsUsuarioBloq.Eof) do
  begin
       if sIdUsuario = '' then
          sIdUsuario := cdsUsuarioBloq.FieldByName('IDUSUARIO').AsString
       else
          sIdUsuario := sIdUsuario + ',' + cdsUsuarioBloq.FieldByName('IDUSUARIO').AsString;

       cdsUsuarioBloq.Next;
  end;
  cdsUsuarioBloq.First;
  cdsUsuarioBloq.EnableControls;

  if (sIdUsuario <> '') then
     bResult := CtrlUsuarioSistema.GravarFlgDispDestac(FU.QuebrarListaFiltro2(2, 'IDUSUARIO', sIdUsuario, 500), 'N');


  if not(bResult) then
  begin
    MsgDlg(CtrlUsuarioSistema.MessageInfo, 'Erro', mtError , [mbOk], 0);
    Exit;
  end;

  // grava usuários liberados
  sIdUsuario := '';

  cdsUsuarioLib.DisableControls;
  cdsUsuarioLib.First;
  while not(cdsUsuarioLib.Eof) do
  begin
       if sIdUsuario = '' then
          sIdUsuario := cdsUsuarioLib.FieldByName('IDUSUARIO').AsString
       else
          sIdUsuario := sIdUsuario + ',' + cdsUsuarioLib.FieldByName('IDUSUARIO').AsString;

       cdsUsuarioLib.Next;
  end;
  cdsUsuarioLib.First;
  cdsUsuarioLib.EnableControls;

  if (sIdUsuario <> '') then
     bResult := CtrlUsuarioSistema.GravarFlgDispDestac(FU.QuebrarListaFiltro2(2, 'IDUSUARIO', sIdUsuario, 500), 'S');

  if not(bResult) then
  begin
    MsgDlg(CtrlUsuarioSistema.MessageInfo, 'Erro', mtError , [mbOk], 0);
    Exit;
  end;

  // Refresh nos Cds
  if (Trim(dblkpGrupoAcesso.LookupValue) <> '') then
  begin
    cdsUsuarioBloq.Data := CtrlUsuarioSistema.ListaGrupoUsu(StrToFloat(dblkpGrupoAcesso.LookupValue), True);
    cdsUsuarioLib.Data := CtrlUsuarioSistema.ListaGrupoUsu(StrToFloat(dblkpGrupoAcesso.LookupValue), False);
  end;

  btnConfirmar.Enabled := False;
  btnCancelar.Enabled := False;
end;

procedure TfrmCadBloqUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlParamRH);
  FreeAndNil(CtrlUsuarioSistema);
end;

procedure TfrmCadBloqUsuario.btnCancelarClick(Sender: TObject);
begin
  cdsUsuarioBloq.CancelUpdates;
  cdsUsuarioLib.CancelUpdates;
  btnConfirmar.Enabled := False;
  btnCancelar.Enabled := False;
end;

procedure TfrmCadBloqUsuario.FormResize(Sender: TObject);
begin
  if tb97OkCancelar <> nil then
     tb97OkCancelar.DockPos := width-tb97Fundo.width-10;

  if tb97Fundo <> nil then
     tb97Fundo.DockPos := width;
end;

end.
