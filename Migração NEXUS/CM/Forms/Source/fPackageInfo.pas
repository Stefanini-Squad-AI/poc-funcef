unit fPackageInfo;
{-------------------------------------------------------------------------------
Analista: Alex Pereira
Pendência: 16190 - Novo Form
Descrição: Montar dinanmicamente a lista de bpls em Ajuda / Sobre
           Ao se clicar duas vezes no logo da CM aparecerão todas as bpls
           utilizadas pelo módulo
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, TeeProcs, TeEngine, Chart, Mask,
  DBCtrls, JclFileUtils;

type
  TfrmPackageInfo = class(TForm)
    TreeView1: TTreeView;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPackageInfo: TfrmPackageInfo;

implementation

{$R *.DFM}

var
  ContNode, ReqNode: TTreeNode;

// mostra as informações de containts e requires, não utilizadas
procedure ShowInfoProc (const Name: string;
  NameType: TNameType; Flags: Byte; Param: Pointer);
var
  FlagStr: string;
begin
  FlagStr := ' ';
  if Flags and ufMainUnit <> 0 then
    FlagStr := FlagStr + 'Main Unit ';
  if Flags and ufPackageUnit <> 0 then
    FlagStr := FlagStr + 'Package Unit ';
  if Flags and ufWeakUnit <> 0 then
    FlagStr := FlagStr + 'Weak Unit ';
  if FlagStr <> ' ' then
    FlagStr := ' (' + FlagStr + ')';
  with FrmPackageInfo.TreeView1.Items do
    case NameType of
      ntContainsUnit:
        AddChild (ContNode, Name + FlagStr);
      ntRequiresPackage:
        AddChild (ReqNode, Name);
    end;
end;

function ForEachModule (HInstance: Longint;
  Data: Pointer): Boolean;
var
  Flags: Integer;
  ModuleName, ModuleDesc: string;
  ModuleNode: TTreeNode;
  VersionInfo: TJclFileVersionInfo;
begin
  with frmPackageInfo.TreeView1.Items do
  begin
    SetLength (ModuleName, 200);
    GetModuleFileName (HInstance,
      PChar (ModuleName), Length (ModuleName));
    ModuleName := PChar (ModuleName); // fixup

    ModuleNode := Add (nil, ModuleName);

    // get description and add fixed nodes
    ModuleDesc := GetPackageDescription (PChar (ModuleName));

    if ModuleDesc <> '' then
    begin
      AddChild (ModuleNode, 'Descrição: ' + ModuleDesc);
      AddChild (ModuleNode, 'Data: ' + DateTimeToStr( FileDateToDateTime( FileAge(ModuleName))));
      VersionInfo := TJclFileVersionInfo.Create (ModuleName);
      try
        AddChild (ModuleNode, 'Versão do Produto: ' + VersionInfo.ProductVersion);
      finally
        VersionInfo.Free;
      end;
    end;
  end;
  Result := True;
end;

procedure TfrmPackageInfo.FormCreate(Sender: TObject);
begin
  EnumModules(ForEachModule, nil);
end;

end.


