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
unit uCMListDialog;

interface

Uses Classes, Controls, SysUtils, graphics, Dialogs;

Type
   TValidateItem = Procedure (Sender: TObject; Item: String; Var Accept: Boolean) of Object;

   TListDialogType = (ldtPathList, ldtFileList, ldtCustomList);
   TCMListDialog = Class(TComponent)

   private
    FListDialogType: TListDialogType;
    FCaption: TCaption;
    FText: String;
    FItemSeparator: Char;
    FContent: String;
    FFont: TFont;
    FValidateItem: TValidateItem;
    FAllowEmptyList: Boolean;
    FMessageForEmptyList: String;
    FFileFilter: String;
    procedure SetListDialogType(const Value: TListDialogType);
    procedure SetCaption(const Value: TCaption);
    procedure SetText(const Value: String);
    procedure SetItemSeparator(const Value: Char);
    procedure SetContent(const Value: String);
    procedure SetFont(const Value: TFont);
    procedure SetValidateItem(const Value: TValidateItem);
    procedure SetAllowEmptyList(const Value: Boolean);
    procedure SetMessageForEmptyList(const Value: String);
    procedure SetFileFilter(const Value: String);

   protected

   public
      Constructor Create(Aowner: TComponent); Override;
      Destructor Destroy; Override;
      function Execute: Boolean;
      procedure ValidateItem(Sender: TObject; Item: String; Var Accept: Boolean);

   published
      property ListDialogType: TListDialogType read FListDialogType write SetListDialogType;
      property Caption: TCaption read FCaption write SetCaption;
      Property Text: String read FText write SetText;
      Property Content: String read FContent write SetContent;
      property ItemSeparator: Char read FItemSeparator write SetItemSeparator;
      property Font: TFont read FFont write SetFont;
      property AllowEmptyList: Boolean read FAllowEmptyList write SetAllowEmptyList;
      property OnValidateItem: TValidateItem read FValidateItem write SetValidateItem;
      property MessageForEmptyList: String read FMessageForEmptyList write SetMessageForEmptyList;
      property FileFilter: String read FFileFilter write SetFileFilter;

   End;

implementation

Uses fCMListDialog;

{ TCMListDialog }

constructor TCMListDialog.Create(Aowner: TComponent);
begin
  inherited;
  FFileFilter := 'Todos os Arquivos|*.*'; 
  FListDialogType := ldtCustomList;
  FCaption := '';
  FText := '';
  FContent := '';
  ItemSeparator := ';';
  Font := TFont.Create;
  FAllowEmptyList := True;
  FMessageForEmptyList := 'Não foi indicado nenhum item';
end;

destructor TCMListDialog.Destroy;
begin
  Font.Free;
  inherited;
end;

function TCMListDialog.Execute: Boolean;
Var
  Frm: TFrmCMListDialog;
  OldContent: String;
begin
   Frm := TFrmCMListDialog.Create(nil);

   Try
     Frm.aCmListDialog := Self;

     OldContent := Content;

     Result :=  (Frm.ShowModal = MrOk);

     If Result Then
     Begin
       If csDesigning In Self.ComponentState Then
       Begin
          ShowMessage(Content);
          Content := OldContent;
       End
       Else
         FContent := Content;
     End;
   finally
     Frm.Free;
   end;
end;

procedure TCMListDialog.SetCaption(const Value: TCaption);
begin
  FCaption := Value;
end;

procedure TCMListDialog.SetContent(const Value: String);
begin
  FContent := Value;
end;

procedure TCMListDialog.SetFont(const Value: TFont);
begin
  FFont := Value;
end;

procedure TCMListDialog.SetItemSeparator(const Value: Char);
begin
  FItemSeparator := Value;
end;

procedure TCMListDialog.SetText(const Value: String);
begin
  FText := Value;
end;

procedure TCMListDialog.SetListDialogType(const Value: TListDialogType);
begin
  FListDialogType := Value;
end;

procedure TCMListDialog.SetValidateItem(const Value: TValidateItem);
begin
  FValidateItem := Value;
end;

procedure TCMListDialog.ValidateItem(Sender: TObject; Item: String;
  var Accept: Boolean);
begin
  If Assigned(OnValidateItem) Then OnValidateItem(Sender, Item, Accept); 
end;

procedure TCMListDialog.SetAllowEmptyList(const Value: Boolean);
begin
  FAllowEmptyList := Value;
end;

procedure TCMListDialog.SetMessageForEmptyList(const Value: String);
begin
  FMessageForEmptyList := Value;
end;

procedure TCMListDialog.SetFileFilter(const Value: String);
begin
  FFileFilter := Value;
end;

end.
