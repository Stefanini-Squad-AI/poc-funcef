unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCMPrincipal,
  ExtCtrls, StdCtrls, Buttons, Db, Wwdatsrc, DBTables, Wwintl, Menus, wwdblook, Mask,
  wwdbedit, DBCtrls, TB97Tlwn, ComCtrls, TB97Tlbr, TB97Ctls, TB97, IvDictio, IvAMulti,
  IvBinDic, IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts, StdActns, ActnList, ImgList,
  fcStatusBar, CMApplicationEvents, SConnect, MConnect, DBClient,
  CMNetUsers, uResource;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    BitBtnJud: TBitBtn;
    BitBtnCon: TBitBtn;
    BitBtnPrev: TBitBtn;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnJudClick(Sender: TObject);
    procedure BitBtnConClick(Sender: TObject);
    procedure BitBtnPrevClick(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uSistema, uCtrlPadroes, uModulo, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  ExeDir: string;
begin
  inherited;
  FU := TCtrlFuncoesRH.Create;
  FU.InitializeAs(Padroes);

  Sistema.PedeLogin := false;
  WindowState := wsNormal;
  Image1.Visible := true;
  FU.RegistrarCFX(true);

  ExeDir := ExtractFileDir(Application.ExeName);
  BitBtnPrev.Enabled := FileExists(ExeDir+'\ProcPrev.exe');
  BitBtnJud.Enabled := FileExists(ExeDir+'\ProcJud.exe');
  BitBtnCon.Enabled := FileExists(ExeDir+'\ModCon.exe');

  FreeAndNil(FU);

  Self.Enabled := True;
end;

procedure TfrmPrincipal.BitBtnJudClick(Sender: TObject);
begin
  WinExec('ProcJud.exe', sw_maximize);
end;

procedure TfrmPrincipal.BitBtnConClick(Sender: TObject);
begin
  WinExec('ModCon.exe', sw_maximize);
end;

procedure TfrmPrincipal.BitBtnPrevClick(Sender: TObject);
begin
  WinExec('ProcPrev.exe', sw_maximize);
end;

initialization
   Sistema.NomeModulo     := 'Sistema Jurídico';
   Sistema.IdModulo       := 109;
   Sistema.Versao := '3.00.02';
   Sistema.NomeAplicativo := 'Sistema Jurídico';
   Modulo                 := TModulo.Create;
finalization
   Modulo.Free;
end.
