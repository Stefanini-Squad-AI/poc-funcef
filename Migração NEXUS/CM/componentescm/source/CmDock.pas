{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit CmDock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97, TB97Tlbr, Buttons, MAHlpBtn, ActnList;

type
  TCMButtonType = (btOK, btCancel, btExit, btHelp);

  TCMOkCancelar = class;

  TButtons = class;

  TCmDockButton = class(TPersistent)
  private
    
    FOwner: TButtons;
    FButtonType: TCMButtonType;
    FButton: TBitBtn;
    procedure SetCaption(const Value: TCaption);
    procedure SetEnabled(const Value: Boolean);
    procedure SetTag(const Value: Integer);
    procedure SetVisible(const Value: Boolean);
    procedure SetButton(const Value: TBitBtn);
    procedure SetHint(const Value: string);
    procedure SetShowHint(const Value: Boolean);
    procedure SetCancel(const Value: Boolean);
    procedure SetDefault(const Value: Boolean);
    procedure SetAction(const Value: TBasicAction);
    function GetAction: TBasicAction;
    function GetEnabled: Boolean;
    function GetCancel: Boolean;
    function GetCaption: TCaption;
    function GetDefault: Boolean;
    function GetHint: string;
    function GetShowHint: Boolean;
    function GetTag: Integer;
    function GetVisible: Boolean;
  protected
  public
    constructor Create(AOwner: TButtons; AButtonType: TCMButtonType);
    property Button: TBitBtn read FButton write SetButton;
  published
    property Action: TBasicAction read GetAction write SetAction;
    property Visible: Boolean read GetVisible write SetVisible;
    property Caption: TCaption read GetCaption write SetCaption;
    property Enabled: Boolean read GetEnabled write SetEnabled;
    property Tag: Integer read GetTag write SetTag;
    property Hint: string read GetHint write SetHint;
    property ShowHint: Boolean read GetShowHint write SetShowHint;
    property Default: Boolean read GetDefault write SetDefault;
    property Cancel: Boolean read GetCancel write SetCancel;
  end;

  TButtons = class(TPersistent)
  private
    FBtnCancelar: TCmDockButton;
    FBtnSair: TCmDockButton;
    FBtnOk: TCmDockButton;
    FOwner: TCMOkCancelar;
    FBtnAjuda: TCmDockButton;
    procedure SetBtnCancelar(const Value: TCmDockButton);
    procedure SetBtnOk(const Value: TCmDockButton);
    procedure SetBtnSair(const Value: TCmDockButton);
    procedure SetOwner(const Value: TCMOkCancelar);
    procedure SetBtnAjuda(const Value: TCmDockButton);
  public
    constructor Create(AOwner: TCMOkCancelar);
    destructor Destroy; override;
    property Owner: TCMOkCancelar read FOwner write SetOwner;
  published
    property BtnOk: TCmDockButton read FBtnOk write SetBtnOk;
    property BtnCancelar: TCmDockButton read FBtnCancelar write SetBtnCancelar;
    property BtnSair: TCmDockButton read FBtnSair write SetBtnSair;
    property BtnAjuda: TCmDockButton read FBtnAjuda write SetBtnAjuda;
  end;

  TCustomCMDock = class(TDock97)
  private
    function CriaBitBtn(BtnCaption, NomeBmp: string; EventoClick: TNotifyEvent; iNumGlyphs:Integer): TBitBtn;
    function CriaBitBtnHelp: TmaHelpBitBtn;
    //27598 - Iferreira 18/03/08
    procedure SetHelpContext(const Value: Integer);
    function GetHelpContext: Integer;
  protected
    procedure AlignControls(AControl: TControl; var Rect: TRect); override;
  public
    ToolBar: TToolbar97;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    //27598 - Iferreira 18/03/08
    property HelpContext: Integer read GetHelpContext write SetHelpContext;
  end;

  TCMOkCancelar = class(TCustomCMDock)
  private
    FOnSairClick: TNotifyEvent;
    FOnCancelarClick: TNotifyEvent;
    FOnOkClick: TNotifyEvent;
    FButtons: TButtons;
    FParentFont: Boolean;
    FFont: tFont;
    procedure SetOnCancelarClick(const Value: TNotifyEvent);
    procedure SetOnOkClick(const Value: TNotifyEvent);
    procedure SetButtons(const Value: TButtons);
    procedure SetParentFont(const Value: Boolean);
    procedure SetFont(const Value: tFont);
  protected
    { Protected declarations }
    _BtnAjuda: TmaHelpBitBtn;
    _BtnSair, _BtnOk, _BtnCancelar: TBitBtn;
    procedure AlignControls(AControl: TControl; var Rect: TRect); override;
    procedure ReposiocionaControles;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SairClick(Sender: TObject);
    procedure OkClick(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
  published
    { Published declarations }
    property OnSairClick: TNotifyEvent read FOnSairClick write FOnSairClick;
    property OnOkClick: TNotifyEvent read FOnOkClick write SetOnOkClick;
    property OnCancelarClick: TNotifyEvent read FOnCancelarClick write SetOnCancelarClick;
    property Buttons: TButtons read FButtons write SetButtons;
    property Font: tFont read FFont write SetFont;
    property ParentFont: Boolean read FParentFont write SetParentFont;
  end;

implementation

{$R *.Res}


{ TCustomCMDock }

procedure TCustomCMDock.AlignControls(AControl: TControl; var Rect: TRect);
begin
  inherited;
  ToolBar.Left := Width - ToolBar.Width;
end;

constructor TCustomCMDock.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ToolBar := TToolbar97.Create(Self);
  ToolBar.Parent := Self;
  ToolBar.ParentFont := True;
  ToolBar.ControlStyle := ControlStyle - [csAcceptsControls];
  ToolBar.DragHandleStyle := dhNone;
  //27598 - Iferreira 18/03/08
  ToolBar.HelpContext := 0;


  Align := alBottom;
  AllowDrag := False;
  Realign;
  
  Background.LoadFromResourceName(HInstance, 'BMPFUNDO_PADRAO');
end;


function TCustomCMDock.CriaBitBtn(BtnCaption, NomeBmp: string;
    EventoClick: TNotifyEvent; iNumGlyphs:Integer): TBitBtn;
var
  Btn: TBitBtn;
begin
  Btn := TBitBtn.Create(ToolBar);
  Btn.Parent := ToolBar;
  Btn.Caption := BtnCaption;
  Btn.NumGlyphs := iNumGlyphs;
  Btn.OnClick := EventoClick;
  Btn.Glyph.LoadFromResourceName(HInstance, NomeBmp);
  Btn.Height := 33;
  Btn.Width := 80;
  Result := Btn;
end;

function TCustomCMDock.CriaBitBtnHelp: TmaHelpBitBtn;
var
  B: TmaHelpBitBtn;
begin
  B := TmaHelpBitBtn.Create(ToolBar);
  B.Parent := ToolBar;
  B.Height := 33;
  B.Width := 80;
  Result := B;
  B.NumGlyphs := 2;  
  B.Glyph.LoadFromResourceName(HInstance, 'BTNHELP_PADRAO');
end;

destructor TCustomCMDock.Destroy;
begin
  ToolBar.Free;
  
  inherited Destroy;
end;

function TCustomCMDock.GetHelpContext: Integer;
begin
  result := ToolBar.HelpContext;
end;

procedure TCustomCMDock.SetHelpContext(const Value: Integer);
begin
  ToolBar.HelpContext := Value;
end;

{ TCMOkCancelar }


constructor TCMOkCancelar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  
  _BtnOk := CriaBitBtn('&Ok', 'BTNOK_PADRAO', OkClick,2);
  _BtnCancelar := CriaBitBtn('&Cancelar', 'BTNCANCELAR_PADRAO', CancelarClick,2);
  _BtnSair := CriaBitBtn('&Sair', 'BTNSAIR_PADRAO', SairClick,3);
  _BtnAjuda := CriaBitBtnHelp;
  
  FButtons := TButtons.Create(Self);
  
  FFont := tFont.Create;
end;

procedure TCMOkCancelar.SairClick(Sender: TObject);
var
  F: TCustomForm;
begin
  if Assigned(FOnSairClick) then FOnSairClick(Sender);
  
  F := GetParentForm(Self);
  F.Close;
end;

procedure TCMOkCancelar.OkClick(Sender: TObject);
begin
  if Assigned(FOnOkClick) then FOnOkClick(Sender);
end;

procedure TCMOkCancelar.CancelarClick(Sender: TObject);
begin
  if Assigned(FOnCancelarClick) then FOnCancelarClick(Sender);
end;

destructor TCMOkCancelar.Destroy;
begin
  FFont.Free;
  
  if _BtnOk <> nil then _BtnOk.Free;
  if _BtnCancelar <> nil then _BtnCancelar.Free;
  if _BtnSair <> nil then _BtnSair.Free;
  if _BtnAjuda <> nil then _BtnAjuda.Free;
  
  FButtons.Free;
  
  inherited Destroy;
end;

procedure TCMOkCancelar.SetOnCancelarClick(const Value: TNotifyEvent);
begin
  FOnCancelarClick := Value;
end;

procedure TCMOkCancelar.SetOnOkClick(const Value: TNotifyEvent);
begin
  FOnOkClick := Value;
end;

procedure TCMOkCancelar.AlignControls(AControl: TControl; var Rect: TRect);
begin
  inherited;
  ReposiocionaControles;
end;

procedure TCMOkCancelar.ReposiocionaControles;
var
  iLeft, iWidth: Integer;
begin
  iLeft := 0;
  iWidth := 0;
  
  if _BtnOk.Visible or (csDesigning in ComponentState) then
  begin
    _BtnOk.Left := 0;
    iLeft := _BtnOk.Width;
    iWidth := _BtnOk.Width;
  end;
  
  if _BtnCancelar.Visible or (csDesigning in ComponentState) then
  begin
    _BtnCancelar.Left := iLeft;
    iLeft := iLeft + _BtnCancelar.Width;
    iWidth := iWidth + _BtnCancelar.Width;
  end;
  
  if _BtnSair.Visible or (csDesigning in ComponentState) then
  begin
    _BtnSair.Left := iLeft;
    iLeft := iLeft + _BtnSair.Width;
    iWidth := iWidth + _BtnSair.Width;
  end;
  
  if _BtnAjuda.Visible or (csDesigning in ComponentState) then
  begin
    _BtnAjuda.Left := iLeft;
    iWidth := iWidth + _BtnAjuda.Width;
  end;
  
  ToolBar.Width := iWidth + 4;
  Invalidate;
end;

procedure TCMOkCancelar.SetButtons(const Value: TButtons);
begin
  FButtons := Value;
end;

procedure TCMOkCancelar.SetParentFont(const Value: Boolean);
begin
  FParentFont := Value;
  _BtnAjuda.ParentFont := Value;
  _BtnSair.ParentFont := Value;
  _BtnOk.ParentFont := Value;
  _BtnCancelar.ParentFont := Value;
end;

procedure TCMOkCancelar.SetFont(const Value: tFont);
begin
  if Value <> nil then
  begin
    FFont.Assign(Value);
    _BtnAjuda.Font.Assign(FFont);
    _BtnSair.Font.Assign(FFont);
    _BtnOk.Font.Assign(FFont);
    _BtnCancelar.Font.Assign(FFont);
    
    SetParentFont(False);
  end;
end;

{ TCmDockButton }

constructor TCmDockButton.Create(AOwner: TButtons; AButtonType: TCMButtonType);
begin
  inherited Create;
  FOwner := AOwner;
  FButtonType := AButtonType;
end;

function TCmDockButton.GetAction: TBasicAction;
begin
  if FButton <> nil then
    Result := FButton.Action
  else
    Result := nil;
end;

function TCmDockButton.GetCancel: Boolean;
begin
  if FButton <> nil then
    Result := FButton.Cancel
  else
    Result := False;
end;

function TCmDockButton.GetCaption: TCaption;
begin
  if FButton <> nil then
    Result := FButton.Caption
  else
    Result := '';
end;

function TCmDockButton.GetDefault: Boolean;
begin
  if FButton <> nil then
    Result := FButton.Default
  else
    Result := False;
end;

function TCmDockButton.GetEnabled: Boolean;
begin
  if FButton <> nil then
    Result := FButton.Enabled
  else
    Result := False;
end;

function TCmDockButton.GetHint: string;
begin
  if FButton <> nil then
    Result := FButton.Hint
  else
    Result := '';
end;

function TCmDockButton.GetShowHint: Boolean;
begin
  if FButton <> nil then
    Result := FButton.ShowHint
  else
    Result := False;
end;

function TCmDockButton.GetTag: Integer;
begin
  if FButton <> nil then
    Result := FButton.Tag
  else
    Result := 0;
end;

function TCmDockButton.GetVisible: Boolean;
begin
  if FButton <> nil then
    Result := FButton.Visible
  else
    Result := False;
end;

procedure TCmDockButton.SetAction(const Value: TBasicAction);
begin
  if FButton <> nil then
  begin
    FButton.Action := Value;
    if Value <> nil then
      case FButtonType of
        btOK: FOwner.FOwner.OnOkClick := Action.OnExecute;
        btCancel: FOwner.FOwner.OnCancelarClick := Action.OnExecute;
        btExit: FOwner.FOwner.OnSairClick := Action.OnExecute;
      end;
  end;
end;

procedure TCmDockButton.SetButton(const Value: TBitBtn);
begin
  FButton := Value;
end;

procedure TCmDockButton.SetCancel(const Value: Boolean);
begin
  if FButton <> nil then
    FButton.Cancel := Value;
end;

procedure TCmDockButton.SetCaption(const Value: TCaption);
begin
  if FButton <> nil then
    FButton.Caption := Value;
end;

procedure TCmDockButton.SetDefault(const Value: Boolean);
begin
  if FButton <> nil then
    FButton.default := Value;
end;

procedure TCmDockButton.SetEnabled(const Value: Boolean);
begin
  if FButton <> nil then
    FButton.Enabled := Value;
end;

procedure TCmDockButton.SetHint(const Value: string);
begin
  if FButton <> nil then
    FButton.Hint := Value;
end;

procedure TCmDockButton.SetShowHint(const Value: Boolean);
begin
  if FButton <> nil then
    FButton.ShowHint := Value;
end;

procedure TCmDockButton.SetTag(const Value: Integer);
begin
  if FButton <> nil then
    FButton.Tag := Value;
end;

procedure TCmDockButton.SetVisible(const Value: Boolean);
begin
  if FButton <> nil then
    FButton.Visible := Value;
end;

{ TButtons }
constructor TButtons.Create(AOwner: TCMOkCancelar);
begin
  FOwner := AOwner;

  FBtnCancelar := TCmDockButton.Create(Self, btCancel);
  FBtnCancelar.Button := FOwner._BtnCancelar;

  FBtnOk := TCmDockButton.Create(Self, btOK);
  FBtnOk.Button := FOwner._BtnOk;

  FBtnSair := TCmDockButton.Create(Self, btExit);
  FBtnSair.Button := FOwner._BtnSair;

  FBtnAjuda := TCmDockButton.Create(Self, btHelp);
  FBtnAjuda.Button := FOwner._BtnAjuda;
end;

destructor TButtons.Destroy;
begin
  FBtnCancelar.Free;
  FBtnOk.Free;
  FBtnSair.Free;
  FBtnAjuda.Free;
  inherited;
end;

procedure TButtons.SetBtnAjuda(const Value: TCmDockButton);
begin
  FBtnAjuda := Value;
end;

procedure TButtons.SetBtnCancelar(const Value: TCmDockButton);
begin
  FBtnCancelar := Value;
end;

procedure TButtons.SetBtnOk(const Value: TCmDockButton);
begin
  FBtnOk := Value;
end;

procedure TButtons.SetBtnSair(const Value: TCmDockButton);
begin
  FBtnSair := Value;
end;

procedure TButtons.SetOwner(const Value: TCMOkCancelar);
begin
  FOwner := Value;
end;

end.


