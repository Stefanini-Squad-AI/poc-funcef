unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCMPrincipal,
  ExtCtrls, StdCtrls, Buttons, Db, Wwdatsrc, DBTables, Wwintl, Menus, wwdblook, Mask,
  wwdbedit, DBCtrls, TB97Tlwn, ComCtrls, TB97Tlbr, TB97Ctls, TB97, ImgList, IvDictio,
  IvAMulti, IvBinDic, IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts, ActnList, StdActns,
  fcStatusBar, CMApplicationEvents, SConnect, MConnect, DBClient,
  CMNetUsers, uResource;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    BitBtnAva: TBitBtn;
    BitBtnTrn: TBitBtn;
    BitBtnCes: TBitBtn;
    BitBtnBen: TBitBtn;
    BitBtnCon: TBitBtn;
    BitBtnBas: TBitBtn;
    BitBtnMed: TBitBtn;
    BitBtnRes: TBitBtn;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnAvaClick(Sender: TObject);
    procedure BitBtnTrnClick(Sender: TObject);
    procedure BitBtnCesClick(Sender: TObject);
    procedure BitBtnBenClick(Sender: TObject);
    procedure BitBtnConClick(Sender: TObject);
    procedure BitBtnBasClick(Sender: TObject);
    procedure BitBtnMedClick(Sender: TObject);
    procedure BitBtnResClick(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uSistema, uCtrlPadroes, dCds, uCtrlFuncoesRH, uCtrlGlobalRH;

{$R *.DFM}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  sSisUsados: string;
  CtrlGlobalRH: TCtrlGlobalRH;
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  FU := TCtrlFuncoesRH.Create;
  FU.InitializeAs(Padroes);

  dmCds := TdmCds.Create(Application);

  Sistema.PedeLogin := false;
  WindowState := wsNormal;
  Image1.Visible := true;
  FU.RegistrarCFX(true);

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('MATRDIS');
  sSisUsados := dmCds.Cds.FieldByName('MATRDIS').asString;
  bitbtnBas.Enabled := (Copy(sSisUsados,1,1) < '6');
  bitbtnAva.Enabled := (Copy(sSisUsados,2,1) < '6');
  bitbtnTrn.Enabled := (Copy(sSisUsados,3,1) < '6');
  bitbtnRes.Enabled := (Copy(sSisUsados,4,1) < '6');
  bitbtnCes.Enabled := (Copy(sSisUsados,5,1) < '6');
  bitbtnBen.Enabled := (Copy(sSisUsados,6,1) < '6');
  bitbtnMed.Enabled := (Copy(sSisUsados,7,1) < '6');
  bitbtnCon.Enabled := (Copy(sSisUsados,8,1) < '6');

  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(FU);
  FreeAndNil(dmCds);

  Self.Enabled := True;
end;

procedure TfrmPrincipal.BitBtnAvaClick(Sender: TObject);
begin
  WinExec('ModAva.exe', sw_maximize);
end;

procedure TfrmPrincipal.BitBtnTrnClick(Sender: TObject);
begin
  WinExec('ModTrn.exe', sw_maximize);
end;

procedure TfrmPrincipal.BitBtnCesClick(Sender: TObject);
begin
  WinExec('ModCes.exe', sw_maximize);
end;

procedure TfrmPrincipal.BitBtnBenClick(Sender: TObject);
begin
  WinExec('ModBen.exe', sw_maximize);
end;

procedure TfrmPrincipal.BitBtnConClick(Sender: TObject);
begin
  WinExec('ModCon.exe', sw_maximize);
end;

procedure TfrmPrincipal.BitBtnBasClick(Sender: TObject);
begin
  WinExec('ModBas.exe', sw_maximize);
end;

procedure TfrmPrincipal.BitBtnMedClick(Sender: TObject);
begin
  WinExec('ModAsm.exe', sw_maximize);
end;

procedure TfrmPrincipal.BitBtnResClick(Sender: TObject);
begin
  WinExec('ModRes.exe', sw_maximize);
end;

initialization
   Sistema.NomeModulo     := 'Recursos Humanos';
   Sistema.IdModulo       := 20;
   Sistema.Versao := '3.00.02';
   Sistema.NomeAplicativo := 'Recursos Humanos';
finalization
end.
