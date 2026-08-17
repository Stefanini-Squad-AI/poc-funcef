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
unit CmErroDialiog;

{-------------------------------------------------------------------------------
Analista : Alex Pereira
Data     : 23/03/03
Pendência: 16328
Motivo   : Montar dinamicamente a lista de bpl da mensagem de erro do usuário
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, JclMapi;

type
  TBeforeSendMail = procedure (Var ARecipient, AName, ASubject, ABody: string; Var AAttachment: TFileName; Var ShowDialog: Boolean) of Object;

  TCmErroDialiog = class(TComponent)
  private
    FAddEmpresaInfo: Boolean;
    FBtnEmailVisible: Boolean;
    FAddVersionInfo: Boolean;
    FBeforeSendMail: TBeforeSendMail;
    FCaption: TCaption;
    FOnCloseDialog: TNotifyevent;
    FHeaderMesage: TStrings;
    FErrorMesage: TStrings;
    FAddWindowInfo: Boolean;
    procedure SetAddEmpresaInfo(const Value: Boolean);
    procedure SetAddVersionInfo(const Value: Boolean);
    procedure SetBeforeSendMail(const Value: TBeforeSendMail);
    procedure SetBtnEmailVisible(const Value: Boolean);
    procedure SetCaption(const Value: TCaption);
    procedure SetOnCloseDialog(const Value: TNotifyevent);
    procedure SetErrorMesage(const Value: TStrings);
    procedure SetHeaderMesage(const Value: TStrings);
    procedure SetAddWindowInfo(const Value: Boolean);
    procedure CloseDialog;
    procedure SendMail(Sender :TObject);
    procedure DoBeforeSendMail(Var ARecipient, AName, ASubject, ABody: string; Var AAttachment: TFileName; Var ShowDialog: Boolean);
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    Constructor Create(Aowner:TComponent); Override;
    Destructor Destroy; Override;
    procedure Execute;
  published
    { Published declarations }
    Property Caption :TCaption read FCaption write SetCaption;
    Property HeaderMesage :TStrings read FHeaderMesage write SetHeaderMesage;
    Property ErrorMesage :TStrings read FErrorMesage write SetErrorMesage;
    Property AddEmpresaInfo :Boolean read FAddEmpresaInfo write SetAddEmpresaInfo;
    Property AddVersionInfo :Boolean read FAddVersionInfo write SetAddVersionInfo;
    property AddWindowInfo :Boolean read FAddWindowInfo write SetAddWindowInfo;
    property BtnEmailVisible :Boolean read FBtnEmailVisible write SetBtnEmailVisible;
    Property OnCloseDialog :TNotifyevent read FOnCloseDialog write SetOnCloseDialog;
    property BeforeSendMail :TBeforeSendMail read FBeforeSendMail write SetBeforeSendMail;
  end;

implementation

Uses fCmErrorDlg, uSistema;

{ TCmErroDialiog }

procedure TCmErroDialiog.CloseDialog;
begin
  If Assigned(OnCloseDialog) Then OnCloseDialog(self);
end;

constructor TCmErroDialiog.Create(Aowner: TComponent);
begin
    inherited create(AOwner);
    FAddEmpresaInfo := True;
    FBtnEmailVisible := True;
    fAddWindowInfo := True;
    FAddVersionInfo := True;
    FCaption := 'Erro !';
    FHeaderMesage := TStringList.Create;
    FErrorMesage := TStringList.Create;
    FHeaderMesage.Add('Ocorreu um erro no sistema que pode deixá-lo operacionalmente instável. ');
    FHeaderMesage.Add('Caso o problema persista, favor entrar em contato com a GETIF.');
end;

destructor TCmErroDialiog.Destroy;
begin
  FHeaderMesage.Free;
  FErrorMesage.Free;
  inherited Destroy;
end;

procedure TCmErroDialiog.DoBeforeSendMail(Var ARecipient, AName, ASubject,
  ABody: string; Var AAttachment: TFileName; var ShowDialog: Boolean);
begin
  If Assigned(BeforeSendMail) Then BeforeSendMail(ARecipient, AName, ASubject,
  ABody, AAttachment, ShowDialog);
end;

procedure TCmErroDialiog.Execute;
Var
  x, iNumOcorr :Integer;
begin
   FrmCmErrorDlg := TFrmCmErrorDlg.Create(Self);
   Try
      FrmCmErrorDlg.BtbEmail.OnClick := SendMail;
      FrmCmErrorDlg.Caption := FCaption;
      FrmCmErrorDlg.BtbEmail.Visible := BtnEmailVisible;

      FrmCmErrorDlg.ReError.Lines.Clear;

      For x:= 0 To FHeaderMesage.Count - 1 Do
          FrmCmErrorDlg.ReError.Lines.Add(FHeaderMesage[x]);

      FrmCmErrorDlg.ReError.Lines.Add('');          

      For x:= 0 To FErrorMesage.Count - 1 Do
          FrmCmErrorDlg.ReError.Lines.Add(FErrorMesage[x]);

      If fAddWindowInfo Then
      Begin
         FrmCmErrorDlg.ReError.Lines.Add('');
         FrmCmErrorDlg.ReError.Lines.Add('Janelas abertas no momento do erro:');

         with Application.MainForm do
           for x := 0 to MDIChildCount do
           Begin
               If MDIChildren[x].Caption <> '' Then
               Begin
                  FrmCmErrorDlg.ReError.Lines.Add(MDIChildren[x].Caption);
               End;
           End;
      End;


      If FAddVersionInfo Then
      Begin
         FrmCmErrorDlg.ReError.Lines.Add('');

         FrmCmErrorDlg.ReError.Lines.Add('Data: ' + FormatDateTime('dd/mm/yyyy',Date) + ' - Hora: ' + FormatDateTime('hh:mm:ss',Time));
         FrmCmErrorDlg.ReError.Lines.Add('Módulo: ' + Sistema.NomeModulo + ' -  ' + Sistema.Versao);
         FrmCmErrorDlg.ReError.Lines.Add('');
         FrmCmErrorDlg.ReError.Lines.Add('Bibliotecas:');


         iNumOcorr := FrmCmErrorDlg.ResourceManager.RetornaBplsAssociadas;
         For x:=0 To iNumOcorr - 1 Do

           FrmCmErrorDlg.ReError.Lines.Add(FrmCmErrorDlg.ResourceManager.BplsAssociadas(x).BPL + ' - ' + FrmCmErrorDlg.ResourceManager.BplsAssociadas(x).Caminho + ' - ' + datetimetostr(FrmCmErrorDlg.ResourceManager.BplsAssociadas(x).Data) + ' - ' + FrmCmErrorDlg.ResourceManager.BplsAssociadas(x).Versao);
         

      End;

      If FAddEmpresaInfo Then
      Begin
         FrmCmErrorDlg.ReError.Lines.Add('');
         FrmCmErrorDlg.ReError.Lines.Add('FUNCEF');
         FrmCmErrorDlg.ReError.Lines.Add('SCN, Qd. 02, Bl. A, 12º e 13º andares.');
         FrmCmErrorDlg.ReError.Lines.Add('Ed. Corporate Financial Center');
         FrmCmErrorDlg.ReError.Lines.Add('CEP 70712-900, Brasília-DF');
         FrmCmErrorDlg.ReError.Lines.Add('Telefone: (61) 3329-1700');
         FrmCmErrorDlg.ReError.Lines.Add('www.funcef.com.br');
      End;

      FrmCmErrorDlg.ShowModal;

      CloseDialog;
   finally

   End;
end;

procedure TCmErroDialiog.SendMail(Sender: TObject);
Var
  ARecipient, AName, ASubject, ABody: string;
  AAttachment: TFileName;
  ShowDialog: Boolean;
begin
  ARecipient := Sistema.EmailOnError;
  AName := '';
  ASubject := Sistema.NomeEmpresa + ' - Erro ' + Sistema.NomeModulo;
  ABody := FrmCmErrorDlg.ReError.Lines.text;
  AAttachment := '';
  ShowDialog := True;

  DoBeforeSendMail(ARecipient, AName, ASubject, ABody, AAttachment, ShowDialog);

  JclSimpleSendMail(ARecipient, AName, ASubject, ABody, AAttachment, ShowDialog,0);
end;

procedure TCmErroDialiog.SetAddEmpresaInfo(const Value: Boolean);
begin
  FAddEmpresaInfo := Value;
end;

procedure TCmErroDialiog.SetAddVersionInfo(const Value: Boolean);
begin
  FAddVersionInfo := Value;
end;

procedure TCmErroDialiog.SetAddWindowInfo(const Value: Boolean);
begin
  FAddWindowInfo := Value;
end;

procedure TCmErroDialiog.SetBeforeSendMail(const Value: TBeforeSendMail);
begin
  FBeforeSendMail := Value;
end;

procedure TCmErroDialiog.SetBtnEmailVisible(const Value: Boolean);
begin
  FBtnEmailVisible := Value;
end;

procedure TCmErroDialiog.SetCaption(const Value: TCaption);
begin
  FCaption := Value;
end;


procedure TCmErroDialiog.SetErrorMesage(const Value: TStrings);
begin
  FErrorMesage.Assign(Value);
end;

procedure TCmErroDialiog.SetHeaderMesage(const Value: TStrings);
begin
  FHeaderMesage.Assign(Value);
end;

procedure TCmErroDialiog.SetOnCloseDialog(const Value: TNotifyevent);
begin
  FOnCloseDialog := Value;
end;

end.
