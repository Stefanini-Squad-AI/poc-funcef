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
unit CMProcura;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, mask, buttons, extctrls, db, dbctrls, uMensErro,
  MontaSelect, dsgnintf, uCMTypes, DbClient, uCmSqlParams;

type
  TMensagens = class(TPersistent)
  private
    FMsgEmBranco,
    FMsgNaoExiste : string;
    procedure SetMsgEmBranco(m:string);
    procedure SetMsgNaoExiste(m:string);
  published
    property EmBranco: string read FMsgEmBranco write SetMsgEmBranco ;
    property NaoExiste: string read FMsgNaoExiste write SetMsgNaoExiste ;
  end;

  TCMCustomProcura = class(TCustomPanel)
  private
    { Private declarations }
    FBevel : TBevel;
    FBtn : TBitBtn;
    FEdit : TMaskEdit;
    FDataLink : TDataLink;
    FDataField : TFieldDataLink;
    FOnChange,
    FOnApertouBotao,
    FonValidaDados,
    FOnExit : TNotifyEvent;
    _LookupCds: TClientDataSet;
    _LookupParams: TCMSqlParams;
    FMostraMensagens,
    FPermiteChaveInvalida,
    FPermiteChaveEmBranco : boolean;
    FValida : TValida;
    FMontaSelect : TMontaSelect;
    FMensagens : TMensagens;
    FProcura : boolean;
    FLookupChave,
    FLookupDescricao,
    FDataBaseName : string;
    FLookupTable: TFileName;
    FReadOnly: Boolean;
    FFiltroProcura: String;
    procedure Clicou(Sender: TObject);
    procedure Mudou(Sender: TObject);
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure MudouDado(Sender: TObject);
    function GetDataSource: TDataSource;
    procedure SetDataSource(Value:TDataSource);
    function GetDataField: string;
    procedure SetDataField(const Value: string);
    function GetText: string;
    procedure SetText(const Value: string);
    function GetFont: TFont;
    procedure SetFont(const Value: TFont);
    procedure Mens(m:string);
    function FazLookup(ParamChave, ParamDesc : string): boolean;
    procedure SetLookupTable(const Value: TFileName);
    procedure SetLookupChave(const Value: string);
    procedure SetLookupDescricao(const Value: string);
    procedure SetDataBaseName(const Value: string);
    procedure AtualizaLookup;
    procedure SetReadOnly(const Value: Boolean);
    procedure SetFiltroProcura(const Value: String);
  protected
    { Protected declarations }
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DataField: string read GetDataField write SetDataField;
    property LookupChave: string read FLookupChave write SetLookupChave;
    property LookupDescricao: string read FLookupDescricao write SetLookupDescricao;
    property DataBaseName: string read FDataBaseName write SetDataBaseName;
    property MontaSelect: TMontaSelect read FMontaSelect write FMontaSelect ;
    property LookupTabela: TFileName read FLookupTable write SetLookupTable;
    property OnApertouBotao: TNotifyEvent read FOnApertouBotao write FOnApertouBotao;
    Property OnValidaDados:TNotifyEvent read fonValidaDados write fonValidaDados;
    property OnExit: TNotifyEvent read FOnExit write FOnExit;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    property FiltroProcura: String read FFiltroProcura write SetFiltroProcura;

    procedure ApertouBotao; virtual;
    procedure Validadados; Virtual;
    procedure MudouEdit; virtual;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;

  public
    { Public declarations }
    property Text : string read GetText write SetText;
    constructor create(AOwner:TComponent); override;
    destructor Destroy; override;
    function Valida : TValida; virtual;
  published
    { Published declarations }
    property Font : TFont read GetFont write SetFont;
    property MostraMensagens: boolean read FMostraMensagens write FMostraMensagens ;
    property Mensagens : TMensagens read FMensagens write FMensagens;
    property PermiteChaveInvalida: boolean read FPermiteChaveInvalida write FPermiteChaveInvalida ;
    property PermiteChaveEmBranco: boolean read FPermiteChaveEmBranco write FPermiteChaveEmBranco ;
  end;

  TCMProcura = class(TCMCustomProcura)
  private
  public
    { Public declarations }
    constructor create(AOwner:TComponent); override;
    destructor Destroy; override;

  protected

  published
    { Public declarations }
    property OnApertouBotao;
    property OnValidaDados;
    property DataSource;
    property DataField;
    property LookupChave;
    property LookupDescricao;
    property MontaSelect;
    property LookupTabela;
    property DataBaseName;
    property ReadOnly;
    property FiltroProcura;
  end;

implementation

Uses jclStrings;

// TCMCustomProcura
constructor TCMCustomProcura.Create(AOwner : TComponent);
begin
     inherited;
     Height := 27;
     FDataLink := TDataLink.Create;
     FDataField := TFieldDataLink.Create;
     FDataField.OnDataChange := MudouDado;
     FValida := vcSemTeste;
     FPermiteChaveInvalida := false;
     FPermiteChaveEmBranco := false;
     FMostraMensagens := true;
     FMensagens := TMensagens.Create;
     FMensagens.EmBranco := '';
     FMensagens.NaoExiste := '';
     _LookupCds := TClientDataSet.Create(self);
     _LookupParams := TCMSqlParams.Create(self);
     _LookupParams.ClientDataSet := _LookupCds;
     BevelOuter := bvNone;

///*** Painel onde aparece o edit e os botoes

     FBevel := TBevel.Create(self);
     with FBevel do
     begin
          Parent := self;
          Shape := bsFrame;
          Top := 0;
          Left := 0;
          Height := 27;
     end;
     FEdit := TMaskEdit.Create(self);
     with FEdit do
     begin
          Parent := self;
          Top := FBevel.Top+3;
          Left := FBevel.Left+3;
          Font.Style := [];
          OnChange := Mudou;
          TabOrder := 0;
          AutoSelect := false;
          TabStop := true;

     end;
     //Cria o botão
     FBtn := TBitBtn.Create(self);
     with FBtn do
     begin
          Parent := self;
          Top    := FBevel.Top;
          Height := FBevel.Height;
          width := Height;
          Glyph.LoadFromResourceName(HINSTANCE,'Botao');
          TabOrder := 1;
     end;
     FBtn.OnClick := Clicou;
     FReadOnly := False;
     fFiltroProcura := '';
end;

destructor TCMCustomProcura.Destroy;
begin
     _LookupCds.free;
     _LookupParams.free;
     
     FDataField.free;
     FDataLink.free;
     FMensagens.Free;
     FBevel.free;
     FEdit.free;
     FBtn.free;
     inherited;
end;

procedure TMensagens.SetMsgEmBranco(m:string);
begin
     if trim(m) = '' then
        m := 'Chave não pode estar em branco';
     if m <> FMsgEmBranco then
     begin
          FMsgEmBranco := m;
     end;
end;

procedure TMensagens.SetMsgNaoExiste(m:string);
begin
     if trim(m) = '' then
        m := 'Chave não existe';
     if m <> FMsgNaoExiste then
     begin
          FMsgNaoExiste := m;
     end;
end;

procedure TCMCustomProcura.WMSize(var Message: TWMSize);
begin
     FBevel.width := width-30;
     FEdit.width  := width-36;
     FBtn.Left    := width-28;

     Height := FEdit.Height+6;
     FBevel.height := height-1;
     FBtn.height   := height;
     Invalidate;
end;

function TCMCustomProcura.GetDataSource: TDataSource;
begin
     Result := FDataLink.DataSource;
end;

procedure TCMCustomProcura.SetDataSource(Value: TDataSource);
begin
     if Value <> FDataLink.DataSource then
     begin
          FDataLink.DataSource := value;
          FDataField.DataSource := Value;
     end;
end;

procedure TCMCustomProcura.Clicou(Sender: TObject);
begin
     if Assigned(FOnApertouBotao) then FOnApertouBotao(self);
       ApertouBotao;
end;

Procedure TCMCustomProcura.ValidaDados;
Begin
  If assigned(fonValidaDados) Then fonValidaDados(Self)
End;

procedure TCMCustomProcura.ApertouBotao;
begin
     FMontaSelect.Executar;
     if FMontaSelect.RetornouValor then
     begin
          FazLookup(FMontaSelect.ValoresChave[0], '');
          FProcura := true;
          Valida;
          FProcura := true;
     end;
     if FEdit.CanFocus then
        FEdit.SetFocus;

     ValidaDados;
end;

function TCMCustomProcura.FazLookup(ParamChave, ParamDesc : string): boolean;
begin
     _LookupCds.close;

     _LookupParams.Prepare;
     
     if ParamChave = '' then
     Begin
       If _LookupParams.ParamExists('PChave') Then
          _LookupParams.ParamByName('PChave').clear
     End
     else
     Begin
       If StrIsDigit(Trim(ParamChave)) Then
         _LookupParams.ParamByName('PChave').AsInteger := StrToInt(ParamChave)
       Else
       Begin
        If UpperCase(Trim(FLookupTable)) = 'PESSOA' Then
            _LookupParams.ParamByName('PChave').AsString := ParamChave
        Else
            _LookupParams.ParamByName('PChave').AsString := AnsiLowerCase(ParamChave);
       End;
     End;

     if ParamDesc = '' then
     Begin
       If _LookupParams.ParamExists('PDescricao') Then
          _LookupParams.ParamByName('PDescricao').clear
     End
     else
     Begin
        If UpperCase(Trim(FLookupTable)) = 'PESSOA' Then
           _LookupParams.ParamByName('PDescricao').AsString := ParamDesc
        Else
           _LookupParams.ParamByName('PDescricao').AsString := AnsiLowerCase(ParamDesc);
     End;

     _LookupParams.Open;
     
     Result := not _LookupCds.IsEmpty;
end;

procedure TCMCustomProcura.MudouDado(Sender: TObject);
begin
     if FDataField.Field <> nil then
     begin
          FazLookup(FDataField.Field.AsString, '');
          FEdit.Text := (_LookupCds.FieldByName(FLookupDescricao).AsString)
     end;
end;

procedure TCMCustomProcura.Mudou(Sender: TObject);
begin
     if Assigned(FOnChange) then FOnChange(Self);
     MudouEdit;
end;

procedure TCMCustomProcura.WMSetFocus(var Message: TWMSetFocus);
begin
     if FEdit.CanFocus then
        FEdit.SetFocus;
end;

procedure TCMCustomProcura.MudouEdit;
begin
     FProcura := false;

     if Trim(FEdit.Text) = '' then
     Begin
        FMontaSelect.ItemsBusca.clear;
        If FDataField <> nil Then
        Begin
           If FDataField.DataSet.State in [ dsEdit, dsInsert ] Then
              FDataField.Field.Clear;
        End;
     End
     else
     begin
          if FMontaSelect.ItemsBusca.count = 0 then
             FMontaSelect.ItemsBusca.Add('');
          FMontaSelect.ItemsBusca[0] := AnsiLowerCase(FEdit.Text);
     end;
end;

function TCMCustomProcura.Valida : TValida;
begin
     FValida := vcSemTeste;
     if (_LookupCds <> nil) and not (csLoading in ComponentState) then
     begin
          if not FProcura then
          begin
               if FEdit.Text = '' then
               begin
                    if FPermiteChaveEmBranco then
                       FValida := vcOk
                    else
                        FValida := vcEmBranco;
               end
               else
               begin
                    if FazLookup('',FEdit.Text) then
                       FValida := vcOk;
               end;
          end
          else
          begin
               FValida := vcOk;
          end;
     end;

     if (FValida = vcEmBranco) then
     begin
          if (not FPermiteChaveEmBranco) then
          begin
               Mens(FMensagens.EmBranco);

               if FEdit.CanFocus then
                  FEdit.SetFocus;
          end;
     end
     else
         if (not FPermiteChaveInvalida) and (FValida <> vcOk) then
         begin
              Mens(FMensagens.NaoExiste);
              if FEdit.CanFocus then
                 FEdit.SetFocus;
         end;

     if FDataField.FieldName = '' then
        FEdit.Text := (_LookupCds.FieldByName(FLookupDescricao).AsString)
     else
     begin
          if FDataField.Editing then
             FDataField.Field.Value := _LookupCds.FieldByName(FLookupChave).Value
          else if (FDataField.Active) and (FDataField.Field.Value <> null) then
          begin
               FazLookup(FDataField.Field.Value,'');
               FEdit.Text := (_LookupCds.FieldByName(FLookupDescricao).AsString)
          end;
     end;
     Result := FValida;
end;

function TCMCustomProcura.GetDataField: string;
begin
  Result := FDataField.FieldName;
end;

procedure TCMCustomProcura.SetDataField(const Value: string);
begin
  FDataField.FieldName := Value;
end;

function TCMCustomProcura.GetText: string;
begin
     Result := FEdit.Text;
end;

procedure TCMCustomProcura.SetText(const Value: string);
begin
     FEdit.Text := Value;
end;

function TCMCustomProcura.GetFont: TFont;
begin
     Result := FEdit.Font;
end;

procedure TCMCustomProcura.SetFont(const Value: TFont);
begin
     FEdit.Font := Value;
     Height := FEdit.Height+6;
     FBevel.height := height-1;
     FBtn.height   := height;
end;

procedure TCMCustomProcura.Mens(m : string);
begin
     if (FMostraMensagens) and
        (not(csDesigning in ComponentState))
         then
        Msgdlg(m, FEdit.EditText, mtWarning,[mbOk],0);
end;

procedure TCMCustomProcura.SetLookupTable(const Value: TFileName);
begin
  FLookupTable := Value;
  AtualizaLookup;
end;

procedure TCMCustomProcura.SetLookupChave(const Value: string);
begin
  FLookupChave := Value;
  AtualizaLookup;
end;
procedure TCMCustomProcura.SetLookupDescricao(const Value: string);
begin
  FLookupDescricao := Value;
  AtualizaLookup;
end;

procedure TCMCustomProcura.SetDataBaseName(const Value: string);
begin
     FDataBaseName := Value;
     AtualizaLookup;
end;

procedure TCMCustomProcura.AtualizaLookup;
var
   cTipo, dTipo : TFieldType;
begin
     with _LookupCds do
         if (not(csDesigning in ComponentState)) and
            (FLookupChave <> '') and (FLookupDescricao <> '') and
            (FLookupTable <> '') and (FDataBaseName <> '')then
         begin
              If Active Then Close;

              _LookupParams.SQL.Clear;
              _LookupParams.SQL.Add('SELECT '+ FLookupChave+', '+FLookupDescricao+' ');
              _LookupParams.SQL.Add('FROM '+FLookupTable+' ');
              _LookupParams.SQL.Add('WHERE 1=2');
              _LookupParams.Prepare;
              _LookupParams.Open;

              cTipo := FieldByName(FLookupChave).DataType ;
              dTipo := FieldByName(FLookupDescricao).DataType ;

              Close;

              _LookupParams.SQL.Clear;
              _LookupParams.SQL.Add('SELECT '+ FLookupChave+', '+FLookupDescricao+' ');
              _LookupParams.SQL.Add('FROM '+FLookupTable+' ');

              if cTipo = ftString then
              Begin
                 If UpperCase(Trim(FLookupTable)) = 'PESSOA' Then
                    _LookupParams.SQL.Add('WHERE (' + FLookupChave + ' = :PChave) OR ')
                 Else
                    _LookupParams.SQL.Add('WHERE (LOWER(RTRIM('+FLookupChave+ '))= :PChave) OR ');
              End
              else
                 _LookupParams.SQL.Add('WHERE ('+FLookupChave+ '= :PChave) OR ');

              if dTipo = ftString then
              Begin
                 If UpperCase(Trim(FLookupTable)) = 'PESSOA' Then
                    _LookupParams.SQL.Add('('+ FLookupDescricao+ ' = :PDescricao)')
                 Else
                    _LookupParams.SQL.Add('(LOWER(RTRIM('+FLookupDescricao+ '))= :PDescricao)');
              End
              else
                  _LookupParams.SQL.Add('('+FLookupDescricao+ '= :PDescricao)');

              If Trim(fFiltroProcura) <> '' Then
                 _LookupParams.SQL.Add(' AND ' +  fFiltroProcura);

              _LookupParams.Prepare;
         end;
end;

procedure TCMCustomProcura.SetReadOnly(const Value: Boolean);
begin
  FReadOnly := Value;

  FEdit.ReadOnly := FReadOnly;
end;

procedure TCMCustomProcura.SetFiltroProcura(const Value: String);
begin
  FFiltroProcura := Value;
end;

// TCMProcura
constructor TCMProcura.Create(AOwner : TComponent);
begin
     inherited;
end;

destructor TCMProcura.Destroy;
begin
     inherited;
end;


end.


