//andre tavares - pendencia 19362 - 08/06/2005

unit fMTAtuObjRAD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, Menus, DBClient, uCtrlRad,
  uCMClientDataSet, uCmSqlParams;

type
  TfrmMTAtuObjRAD = class(TfrmOkCancelar)
    SqlObjRad: TCMSqlParams;
    CdsObjRad: TCMClientDataSet;
    MemoItems: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    CdsPodeDeletar: TCMClientDataSet;
    SqlPodeDeletar: TCMSqlParams;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    rad: TCtrlRad;
    procedure InsereItem( ItemMenu: TMenuItem);
    function ItemLimpo( s: String ): string;
  public
    { Public declarations }
  end;

var
  frmMTAtuObjRAD: TfrmMTAtuObjRAD;

implementation

uses uSistema, dBaseDados, uDatabase;

{$R *.DFM}

procedure TfrmMTAtuObjRAD.FormCreate(Sender: TObject);
begin
  inherited;
  Rad := TCtrlRad.Create;
  Rad.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                  Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  Rad.CdsObjRad := CdsObjRad;

  MemoItems.ReadOnly := true;
end;

procedure TfrmMTAtuObjRAD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Rad.Free;
end;

function TfrmMTAtuObjRAD.ItemLimpo( s: String ): string;
var
  p: Integer;
begin
  p := Pos( '&', s );

  If p > 0 then
     Result := Copy( s, 1, p - 1 ) + Copy( s, p + 1, 100 )
  Else
     Result := s;
end;

procedure TfrmMTAtuObjRAD.bbtnConfirmarClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  Label1.Caption := 'Atualizando objetos...';

  CdsObjRad.Close;
  SqlObjRad.Prepare;
  SqlObjRad.ParamByName( 'IDMODULO' ).AsFloat := Sistema.IdModulo;
  SqlObjRad.open;

  // INÍCIO ANDRE TAVARES - pendencia 19362
{
  cdsPodeDeletar.Close;
  SqlPodeDeletar.Prepare;
  SqlPodeDeletar.ParamByName( 'IDMODULO' ).AsFloat := Sistema.IdModulo;
  SqlPodeDeletar.open;
  }
  // fim ANDRE TAVARES - pendencia 19362

  // INÍCIO ANDRE TAVARES - pendencia 19362
  bbtnConfirmar.Enabled := false;
  bbtnCancelar.Enabled := false;
  bbtnSair.Enabled := false;
  MemoItems.ReadOnly := false;
  MemoItems.Clear;
  // fim ANDRE TAVARES - pendencia 19362
  For i := 0 To Application.MainForm.Menu.Items.Count - 1 Do
      InsereItem( Application.MainForm.Menu.Items[ i ]);

  Rad.GravaObjRad();
  Label1.Caption := 'Atualização concluída.';

  // INÍCIO ANDRE TAVARES - pendencia 19362
  bbtnConfirmar.Enabled := true;
  bbtnCancelar.Enabled := true;
  bbtnSair.Enabled := true;
  MemoItems.ReadOnly := true;
  // fim ANDRE TAVARES - pendencia 19362

end;

procedure TfrmMTAtuObjRAD.InsereItem(ItemMenu: TMenuItem);
  // inicio andre tavares - pendencia 19362
  function PathMenu(const ItemMenu: TMenuItem): String;
    var LocalItemMenu: TMenuItem;
  begin
     LocalItemMenu := ItemMenu;

     while LocalItemMenu.Parent.caption <> '' do begin
       result := ' \'+ LocalItemMenu.Parent.Caption + result;
       result := ItemLimpo(result);
       LocalItemMenu := LocalItemMenu.Parent;
     end; //while
  end;
  // fim andre tavares - pendencia 19362

var
  i : integer;
begin
  If (ItemMenu.Count > 0)  Then
    For i := 0 To ItemMenu.Count - 1 Do
       InsereItem( ItemMenu.Items[ i ]);

  With CdsObjRAD Do Begin
     if ItemMenu.Count = 0 then begin
       If (ItemMenu.Caption <> '-') and (ItemMenu.Tag = 5) Then Begin  // andre tavares - coloquei o filtro de tag
          If Locate( 'NOMEOBJETO', ItemMenu.Name, [] ) Then
             Edit
          Else Begin
             Append;
             FieldByName( 'IDMODULO' ).AsInteger  := Sistema.IdModulo;
          End;

          FieldByName( 'DESCOBJETO' ).AsString := trim(ItemLimpo(  PathMenu( ItemMenu ) )  + ' \' + ItemLimpo( ItemMenu.Caption ));
          FieldByName( 'NOMEOBJETO' ).AsString := ItemMenu.Name;
          MemoItems.lines.add( FieldByName( 'DESCOBJETO' ).AsString );
       //início andre tavares - pendencia 19362
       End else if (ItemMenu.Tag <> 5) and (not isEmpty) then
//             if (cdsPodeDeletar.Locate('NOMEOBJETO', ItemMenu.Name, [loPartialKey, loCaseInsensitive]) ) then
               if CdsObjRAD.Locate('NOMEOBJETO', ItemMenu.Name, [loPartialKey, loCaseInsensitive] ) then
                  Delete;
       //fim andre tavares - pendencia 19362

     end;
  End;

  Application.ProcessMessages;
end;

end.

