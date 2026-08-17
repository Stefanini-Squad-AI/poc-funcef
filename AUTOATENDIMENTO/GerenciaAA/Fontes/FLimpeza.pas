unit FLimpeza;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, uCtrlWebInterface, ucmClientDataSet,
  dBasedados, usistema, uCtrlWebsessao, FileCtrl;

type
  TfrmLimpeza = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    pnlChecks: TPanel;
    chkLimpaRegTemp: TCheckBox;
    chkLimpaArqTemp: TCheckBox;
    Panel1: TPanel;
    Animate: TAnimate;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    WebInterface : TCtrlWebInterface;
    WebSessao    : TCtrlWebSessao;
    cds          : TcmClientDataSet;

    sDirAtual : string;

    procedure MsgErro(sMsg: String);
    procedure DelTree( Dir : String );

  public
    { Public declarations }
  end;

var
  frmLimpeza: TfrmLimpeza;
implementation

{$R *.DFM}

{ TfrmLimpeza }

procedure TfrmLimpeza.FormCreate(Sender: TObject);
begin
  inherited;
  cds := TcmClientDataSet.Create(nil);
  WebInterface := TCtrlWebInterface.Create;
  WebInterface.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  WebSessao := TCtrlWebSessao.Create;
  WebSessao.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  sDirAtual := GetCurrentDir;

end;

procedure TfrmLimpeza.FormDestroy(Sender: TObject);
begin
  inherited;
  cds.Free;
  WebInterface.free;
  WebSessao.free;
end;


procedure TfrmLimpeza.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;



procedure TfrmLimpeza.bbtnConfirmarClick(Sender: TObject);
var bsucesso : boolean;
    sDirFisico : string;
begin
  inherited;
  bsucesso := false;
  bbtnConfirmar.Enabled := false;
  if Application.MessageBox('Confirma a exlusão de arquivos/registros temporários?','Limpeza',
     Mb_YesNo + Mb_IConQuestion) <> Id_Yes then
  begin
    bbtnConfirmar.Enabled := true;
    exit;
  end;

  pnlChecks.SendToBack;
  Animate.Active := true;
  cds.data := WebInterface.SelecionaTodos;
  cds.First;
  while not cds.Eof do
  begin
    if chkLimpaArqTemp.Checked then
    begin
      sDirFisico := trim( cds.fieldByName('DIRFISICO').asString );
      if sDirFisico[length (sDirFisico)] <> '\' then sDirFisico := sDirFisico + '\';
      if DirectoryExists( sDirFisico + 'TEMP' ) then
        DelTree( sDirFisico + 'TEMP' );
    end;
    cds.next;
  end;
  if chkLimpaRegTemp.Checked then
    bsucesso := WebSessao.ExcluiTodos;

  Animate.Active := false;
  pnlChecks.BringToFront;
  if bsucesso then
    showMessage('Limpeza efetuada com sucesso!');
  bbtnConfirmar.Enabled := true;

end;


procedure TfrmLimpeza.DelTree( Dir : String );
var
  i : integer;
  sItem : string;
  Arquivos : TFileListBox;
begin
  if Dir[length (Dir)] <> '\' then Dir := Dir + '\';

  Arquivos := TFileListBox.Create( nil );
  try
    Arquivos.Parent := nil;
    Arquivos.Width  := 0;
    Arquivos.Height := 0;
    Arquivos.Visible := False;
    Arquivos.Parent := Self;
    Arquivos.Directory := Dir;
    Arquivos.FileType := [ftReadOnly,ftHidden,ftSystem,ftVolumeID,ftDirectory,ftArchive,ftNormal];
    Arquivos.Update;
    for i := 0 to ( Arquivos.Items.Count - 1 ) do
    begin
      sItem := trim( Arquivos.Items[i] );
      if ( sItem <> '[.]'  ) and
         ( sItem <> '[..]' ) and
         ( sItem <> ''     ) then
      begin
        if FileExists( sItem ) then    //É arquivo
          DeleteFile( Dir + sItem )
        else
        begin                          //É diretório
          sItem := Copy( sItem, 2, length( sItem ) - 2 );
          DelTree( Dir + sItem );
        end;
      end;
    end;
  finally
    Arquivos.Free;
  end;
  SetCurrentDir( sDirAtual );
  RmDir( Dir );
end;

end.
