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
//==============================================================================
//  Data      : 06/01/2006
//  Rotina    : TCmParamReport.Execute
//  Autor     : Rodolpho da Silva 
//  Pendência : 21193
//  Descrição : Ao visualizar a tela de parâmetros, focar o primeiro componente
//==============================================================================



unit CmParamReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ppReport,
  db, extctrls, stdctrls, TB97, TB97Tlbr, TB97Ctls, CMDateTimePicker, TREdit,
  CMDBLookupCombo, wwQuery, FCmParamReport, dbtables, uMensErro, JclStrings,
  Mask, wwdbedit, Wwdbspin, uCMTypes, uCtrlPadroes, DbClient, uCMMath, provider,
  CMProcuraSubTipo, CMProcuraMask, MontaSelect, buttons;

type
  TCmParamReport = class;

  TAfterExecute = procedure(ActionExecute :TActionExecute) of object;
  TBeforeExecute = procedure(Var CanExecute :Boolean) of object;


  TEditSettings = Class(TPersistent)
  private
    FReadonly: Boolean;
    FColor: TColor;
    FFont: TFont;
    procedure SetColor(const Value: TColor);
    procedure SetReadonly(const Value: Boolean);
    procedure SetFont(const Value: TFont);
  public
    Constructor Create;
    Destructor Destroy; Override;
  published
    property Color: TColor read FColor write SetColor;
    property Readonly: Boolean read FReadonly write SetReadonly;
    property Font: TFont read FFont write SetFont;
  End;

  TProcuraSTSettings = Class(TPersistent)
  private
    FFiltraSubTipo: Boolean;
    FCampoEdit: TCampoEdit;
    FSubtipo: TSubTipo;
    procedure SetCampoEdit(const Value: TCampoEdit);
    procedure SetFiltraSubTipo(const Value: Boolean);
    procedure SetSubtipo(const Value: TSubTipo);
  Public
    Constructor Create;
    Destructor Destroy; Override;
  Published
    property Subtipo: TSubTipo read FSubtipo write SetSubtipo;
    property CampoEdit: TCampoEdit read FCampoEdit write SetCampoEdit;
    property FiltraSubTipo: Boolean read FFiltraSubTipo write SetFiltraSubTipo;

  End;

  TProcuraFCSettings = Class(TPersistent)
  private
    FMostraEndereco: Boolean;
    FCampoEdit: TCampoEdit;
    FStatus: TStatusForCli;
    FForCli: TForCli;
    procedure SetCampoEdit(const Value: TCampoEdit);
    procedure SetMostraEndereco(const Value: Boolean);
    procedure SetStatus(const Value: TStatusForCli);
    procedure SetForCli(const Value: TForCli);
  Public
    Constructor Create;
    Destructor Destroy; Override;
  Published
    property Status: TStatusForCli read FStatus write SetStatus;
    property CampoEdit: TCampoEdit read FCampoEdit write SetCampoEdit;
    property MostraEndereco: Boolean read FMostraEndereco write SetMostraEndereco;
    property ForCli: TForCli read FForCli write SetForCli;
  End;

  TProcuraCCSettings = Class(Tpersistent)
  private
    FPlano: Integer;
    FMascara: String;
    FStatus: TStatusConta;
    FAceitaTipoConta: TTipoConta;
    procedure SetAceitaTipoConta(const Value: TTipoConta);
    procedure SetMascara(const Value: String);
    procedure SetPlano(const Value: Integer);
    procedure SetStatus(const Value: TStatusConta);

  public
    Constructor Create;
    Destructor Destroy; Override;
  published
    property Mascara: String read FMascara write SetMascara;
    property Plano: Integer read FPlano write SetPlano;
    property Status: TStatusConta read FStatus write SetStatus;
    property AceitaTipoConta: TTipoConta read FAceitaTipoConta write SetAceitaTipoConta;
  End;

  TMaskEditSettings = Class(TPersistent)
  Private
    FMaxLength: Integer;
    FEditMask: String;
    procedure SetEditMask(const Value: String);
    procedure SetMaxLength(const Value: Integer);

  Public
    Constructor Create;
    Destructor Destroy; Override;
  Published
    Property MaxLength: Integer read FMaxLength write SetMaxLength;
    Property EditMask: String read FEditMask write SetEditMask;
  End;

  TSpinEditSettings = Class(TPersistent)
  Private
    FIncrement: Integer;
    FValue: Integer;
    FMaxValue: Integer;
    FMinValue: Integer;
    procedure SetIncrement(const Value: Integer);
    procedure SetMaxValue(const Value: Integer);
    procedure SetMinValue(const Value: Integer);
    procedure SetValue(const Value: Integer);

  Public
    Constructor Create;
    Destructor Destroy; Override;
  Published
    Property MaxValue: Integer read FMaxValue write SetMaxValue;
    Property MinValue: Integer read FMinValue write SetMinValue;
    Property Increment: Integer read FIncrement write SetIncrement;
    Property Value: Integer read FValue write SetValue;
  End;

  TLookupSettings = Class(TPersistent)
  Private
    FDescricao: String;
    FChave: String;
    FDisplay: String;
    FSQL: TStrings;
    FTamanho: String;
    procedure SetChave(const Value: String);
    procedure SetDescricao(const Value: String);
    procedure SetDisplay(const Value: String);
    procedure SetSQL(const Value: TStrings);
    procedure SetTamanho(const Value: String);
  Public
    Constructor Create;
    Destructor Destroy; Override;
  Published
    Property SQL :TStrings read FSQL write SetSQL;
    Property Chave :String read FChave write SetChave;
    Property Display :String read FDisplay write SetDisplay;
    Property Descricao :String read FDescricao write SetDescricao;
    Property Tamanho :String read FTamanho write SetTamanho;
  End;

  TCheckBoxSetings = Class(TPersistent)
  Private
    FValueUnChecked: String;
    FValueChecked: String;
    FChecked: Boolean;
    procedure SetValueChecked(const Value: String);
    procedure SetValueUnChecked(const Value: String);
    procedure SetChecked(const Value: Boolean);
  Public
    Constructor Create;
    Destructor Destroy; Override;
  Published
    Property ValueChecked :String read FValueChecked write SetValueChecked;
    Property ValueUnChecked :String read FValueUnChecked write SetValueUnChecked;
    Property Checked :Boolean read FChecked write SetChecked;
  End;

  TRadioGroupSettings = Class(TPersistent)
  Private
    FColumns: Integer;
    FItemIndex: Integer;
    FItems: TStrings;
    FValues: TStrings;
    FHeight: Integer;
    procedure SetColumns(const Value: Integer);
    procedure SetItemIndex(const Value: Integer);
    procedure SetItems(const Value: TStrings);
    procedure SetValues(const Value: TStrings);
    procedure SetHeight(const Value: Integer);
  Public
    Constructor Create;
    Destructor Destroy; Override;
  Published
    Property Items :TStrings read FItems write SetItems;
    Property Values :TStrings read FValues write SetValues;
    Property Columns :Integer read FColumns write SetColumns;
    Property ItemIndex :Integer read FItemIndex write SetItemIndex;
    Property Height :Integer read FHeight write SetHeight;
  End;

  TComboBoxSettings = Class(TPersistent)
  Private
    FSorted: Boolean;
    FDropDownCount: Integer;
    FStyle: TComboBoxStyle;
    FItems: TStrings;
    FItemIndex: Integer;
    procedure SetDropDownCount(const Value: Integer);
    procedure SetItems(const Value: TStrings);
    procedure SetSorted(const Value: Boolean);
    procedure SetStyle(const Value: TComboBoxStyle);
    procedure SetItemIndex(const Value: Integer);
  Public
    Constructor Create;
    Destructor Destroy; Override;
  Published
     Property Sorted :Boolean read FSorted write SetSorted;
     Property Style: TComboBoxStyle read FStyle write SetStyle;
     Property Items: TStrings read FItems write SetItems;
     Property DropDownCount: Integer read FDropDownCount write SetDropDownCount;
     Property ItemIndex: Integer read FItemIndex write SetItemIndex;
  End;

  TListBoxSettings = Class(TPersistent)
  Private
    FExtendedSelect: Boolean;
    FSorted: Boolean;
    FMultiSelect: Boolean;
    FStyle: TListBoxStyle;
    FItems: TStrings;
    Fheight: Integer;
    procedure SetExtendedSelect(const Value: Boolean);
    procedure SetItems(const Value: TStrings);
    procedure SetMultiSelect(const Value: Boolean);
    procedure SetSorted(const Value: Boolean);
    procedure SetStyle(const Value: TListBoxStyle);
    procedure Setheight(const Value: Integer);
  Public
    Constructor Create;
    Destructor Destroy; Override;
  Published
     Property Items :TStrings read FItems write SetItems;
     Property MultiSelect :Boolean read FMultiSelect write SetMultiSelect;
     Property ExtendedSelect :Boolean read FExtendedSelect write SetExtendedSelect;
     Property Sorted :Boolean read FSorted write SetSorted;
     Property Style :TListBoxStyle read FStyle write SetStyle;
     Property height :Integer read Fheight write Setheight;
  End;

  TCMParamsItem = class(TCollectionItem)
  private
    FCaption: TCaption;
    FControle: TTipoControle;
    FCampoBanco: String;
    FTipodeDado: TTipoDado;
    FCheckBoxSetings: TCheckBoxSetings;
    FLookupSettings: TLookupSettings;
    FRadioGroupSettings: TRadioGroupSettings;
    FComboBoxSettings: TComboBoxSettings;
    FListBoxSettings: TListBoxSettings;
    FAsBoolean: Boolean;
    FAsFloat: Double;
    FAsInteger: LongInt;
    FAsString: String;
    FAsDateTime: TDateTime;
    FValue: Variant;
    FIsNull: Boolean;
    FComparador : String;
    FMostraComboCompara: Boolean;
    FRequired: Boolean;
    FTextDefault: String;
    FName: TComponentName;
    FMaskEditSettings: TMaskEditSettings;
    FSpinEditSettings: TSpinEditSettings;
    FWidth: Integer;
    FProcuraFCSettings: TProcuraFCSettings;
    FProcuraSTSettings: TProcuraSTSettings;
    FDisplayText: String;
    FProcuraCCSettings: TProcuraCCSettings;
    FEditSettings: TEditSettings;
    FMontaSelect: TMontaSelect;
    procedure SetCaption(const Value: TCaption);
    procedure SetControle(const Value: TTipoControle);
    procedure SetCampoBanco(const Value: String);
    procedure SetTipodeDado(const Value: TTipoDado);
    procedure SetCheckBoxSetings(const Value: TCheckBoxSetings);
    procedure SetLookupSettings(const Value: TLookupSettings);
    procedure SetRadioGroupSettings(const Value: TRadioGroupSettings);
    procedure SetComboBoxSettings(const Value: TComboBoxSettings);
    procedure SetListBoxSettings(const Value: TListBoxSettings);
    procedure SetAsBoolean(const Value: Boolean);
    procedure SetAsDateTime(const Value: TDateTime);
    procedure SetAsFloat(const Value: Double);
    procedure SetAsInteger(const Value: LongInt);
    procedure SetAsString(const Value: String);
    procedure SetValue(const Value: Variant);
    function GetAsBoolean: Boolean;
    function GetAsDateTime: TDateTime;
    function GetAsFloat: Double;
    function GetAsInteger: LongInt;
    function GetAsString: String;
    function GetValue: Variant;
    function GetIsNull: Boolean;
    procedure SetComparador(const Value: String);
    procedure SetMostraComboCompara(const Value: Boolean);
    procedure SetRequired(const Value: Boolean);
    procedure SetTextDefault(const Value: String);
    procedure SetName(const Value: TComponentName);
    procedure SetMaskEditSettings(const Value: TMaskEditSettings);
    procedure SetSpinEditSettings(const Value: TSpinEditSettings);
    procedure SetWidth(const Value: Integer);
    procedure SetProcuraFCSettings(const Value: TProcuraFCSettings);
    procedure SetProcuraSTSettings(const Value: TProcuraSTSettings);
    procedure SetProcuraCCSettings(const Value: TProcuraCCSettings);
    procedure SetEditSettings(const Value: TEditSettings);
    procedure SetMontaSelect(const Value: TMontaSelect);

  protected
    function GetDisplayName:String; Override;
  public
    constructor Create(Collection: TCollection); Override;
    Destructor Destroy; Override;
    Property Value :Variant read GetValue write SetValue;
    Property AsString :String read GetAsString write SetAsString;
    Property AsInteger :LongInt read GetAsInteger write SetAsInteger;
    Property AsFloat :Double read GetAsFloat write SetAsFloat;
    Property AsBoolean :Boolean read GetAsBoolean write SetAsBoolean;
    Property AsDateTime :TDateTime read GetAsDateTime write SetAsDateTime;
    Property IsNull :Boolean Read GetIsNull;
    Property Comparador :String read FComparador write SetComparador;
    Property DispalyText :String read FDisplayText;
  published
    Property Caption :TCaption read FCaption write SetCaption;
    Property Controle :TTipoControle read FControle write SetControle;
    Property CampoBanco :String read FCampoBanco write SetCampoBanco;
    Property TipodeDado :TTipoDado read FTipodeDado write SetTipodeDado;
    Property LookupSettings :TLookupSettings read FLookupSettings write SetLookupSettings;
    Property CheckBoxSetings :TCheckBoxSetings read FCheckBoxSetings write SetCheckBoxSetings;
    Property RadioGroupSettings :TRadioGroupSettings read FRadioGroupSettings write SetRadioGroupSettings;
    Property ComboBoxSettings :TComboBoxSettings read FComboBoxSettings write SetComboBoxSettings;
    Property ListBoxSettings :TListBoxSettings read FListBoxSettings write SetListBoxSettings;
    Property MostraComboCompara :Boolean read FMostraComboCompara write SetMostraComboCompara;
    Property Required :Boolean read FRequired write SetRequired;
    Property TextDefault :String read FTextDefault write SetTextDefault;
    Property EditSettings: TEditSettings read FEditSettings write SetEditSettings;
    Property Name :TComponentName read FName write SetName;
    Property SpinEditSettings: TSpinEditSettings read FSpinEditSettings write SetSpinEditSettings;
    Property MaskEditSettings: TMaskEditSettings read FMaskEditSettings write SetMaskEditSettings;
    Property ProcuraSTSettings: TProcuraSTSettings read FProcuraSTSettings write SetProcuraSTSettings;
    Property ProcuraFCSettings: TProcuraFCSettings read FProcuraFCSettings write SetProcuraFCSettings;
    Property ProcuraCCSettings: TProcuraCCSettings read FProcuraCCSettings write SetProcuraCCSettings;
    Property MontaSelect: TMontaSelect read FMontaSelect write SetMontaSelect;

    Property Width: Integer read FWidth write SetWidth;
  End;

  TCmParams = Class(TCollection)
  Private
    FOwner :TComponent;
  Protected
    function GetOwner: TPersistent; Override;
  Public
    Constructor Create(Aowner:TComponent);
  Published

  End;

  TPainelControles = class(TDock97)
  private
    _MsPainel: TMontaSelect;

    FIndice: Integer;
    FControle: TTipoControle;
    FTipodeDado: TTipoDado;
    fToolBar: TToolBar97;
    fCtrlCheckBox: TCheckBox;
    fCtrlDateTimePicker: TCMDateTimePicker;
    fCtrlLookup: TCMDBLookupCombo;
    fCtrlComboBox: TComboBox;
    fCtrlEditt: TEdit;
    fCtrlEditMs: TEdit;
    fCtrlListBox: TListBox;
    fCtrlRadioGroup: TRadioGroup;
    fCtrlRealEdit: TRealEdit;
    fComboCompara: TComboBox;
    FMaskEdit: TMaskEdit;
    FSpinEdit: TwwDBSpinEdit;
    FCdsDisplay: TClientDataSet;
    FProcuraForCli: TCMProcuraForCli;
    FProcuraSubTipo: TCMProcuraSubTipo;
    FProcuraMaskContabil: TCMProcuraMaskContabil;
    fCtrlMemo: TMemo;

    procedure SetControle(const Value: TTipoControle);
    procedure SetIndice(const Value: Integer);
    procedure SetTipodeDado(const Value: TTipoDado);
    procedure SetComboCompara(const Value: TComboBox);
    procedure SetMaskEdit(const Value: TMaskEdit);
    procedure SetSpinEdit(const Value: TwwDBSpinEdit);
    procedure SetCdsDisplay(const Value: TClientDataSet);
    procedure OnClickMS(Sender: TObject);
  protected

  public
      constructor Create(AOwner:TCmParamReport; FormParam :TFrmCmParamReport; sCaption, CampoBanco: String; pControle :TTipoControle;
      pTipodeDado :TTipoDado; LookupSettings :TLookupSettings; CheckBoxSetings :TCheckBoxSetings;
      RadioGroupSettings :TRadioGroupSettings; ComboBoxSettings :TComboBoxSettings;
      ListBoxSettings :TListBoxSettings; MaskEditSettings: TMaskEditSettings;
      SpinEditSettings: TSpinEditSettings; ProcuraSTSettings: TProcuraSTSettings;
      ProcuraFCSettings: TProcuraFCSettings; ProcuraCCSettings: TProcuraCCSettings;
      EditSettings: TEditSettings; MontaSelect: TMontaSelect;
      sDataBaseName:String; iIndice :Integer; ControlWidth: Integer); Reintroduce;
      destructor Destroy; Override;

      Property CdsDisplay: TClientDataSet read FCdsDisplay write SetCdsDisplay;
      Property Controle :TTipoControle read FControle write SetControle;
      Property TipodeDado :TTipoDado read FTipodeDado write SetTipodeDado;
      Property Indice :Integer read FIndice write SetIndice;
      Property ToolBar :TToolBar97 read fToolBar;
      Property CtrlCheckBox :TCheckBox read fCtrlCheckBox;
      Property CtrlComboBox :TComboBox read fCtrlComboBox;
      Property CtrlListBox :TListBox read fCtrlListBox;
      Property CtrlRadioGroup :TRadioGroup read fCtrlRadioGroup;
      Property CtrlLookup :TCMDBLookupCombo read fCtrlLookup;
      Property CtrlRealEdit :TRealEdit read fCtrlRealEdit;
      Property CtrlDateTimePicker :TCMDateTimePicker read fCtrlDateTimePicker;
      Property CtrlEdit :TEdit read fCtrlEditt;
      Property CtrlEditMs :TEdit read fCtrlEditMs;
      Property CtrlMemo: TMemo read fCtrlMemo;
      Property ComboCompara: TComboBox read FComboCompara write SetComboCompara;
      property SpinEdit: TwwDBSpinEdit read FSpinEdit write SetSpinEdit;
      Property MaskEdit: TMaskEdit read FMaskEdit write SetMaskEdit;
      Property ProcuraSubTipo: TCMProcuraSubTipo read FProcuraSubTipo;
      Property ProcuraForCli: TCMProcuraForCli read FProcuraForCli;
      Property ProcuraMaskContabil: TCMProcuraMaskContabil read FProcuraMaskContabil;

  end;

  TPramControlAction = Procedure (Sender :TPainelControles; Index: Integer) Of Object;

  TCmParamReport = class(TComponent)
  private
    CdsAux: TClientDataSet;
    FCaption: TCaption;
    FDataBaseName: String;
    FParams: TCmParams;
    FAfterExecute: TAfterExecute;
    FBeforeExecute: TBeforeExecute;
    FOnParamControlEnter: TPramControlAction;
    FOnParamControlExit: TPramControlAction;
    FStrParams: String;
    FFormheight: Integer;
    fMensagem: String;
    FExibeMensagem: Boolean;
    FExibeFormParams: Boolean;
    FHtmlFormParam: TStrings;
    FFormWidth: Integer;
    FFatorResize: Double;
    //27598 - Iferreira 18/03/08
    FHelpContext: Integer;
    procedure SetCaption(const Value: TCaption);
    procedure SetDataBaseName(const Value: String);
    procedure SetCmParams(const Value: TCmParams);
    procedure SetStrParams(const Value: String);
    function GetParamValues(X: Integer): TCMParamsItem;
    procedure SetFormheight(const Value: Integer);
    procedure SetExibeMensagem(const Value: Boolean);
    procedure SetExibeFormParams(const Value: Boolean);
    procedure SetHtmlFormParam(const Value: TStrings);
    procedure SetFormWidth(const Value: Integer);
    function GetaDataForComponentState(sSql: String): OleVariant;
   //27598 - Iferreira 18/03/08
    procedure SetHelpContext(const Value: Integer);
    function GetHelpContext: Integer;
  protected
    Procedure DoAfterExecute(ActionExecute :TActionExecute);
    Procedure DoBeforeExecute(Var CanExecute :Boolean);
    Procedure ParamControlExit(Sender :TObject);
    Procedure ParamControlEnter(Sender :TObject);
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    bUsaDataBaseName :Boolean;

    {#CM Carrega para o componente a configuração da tela de parâmetros grvada no banco de dados}
    function LoadFromDataBase(IdReport, OrigemCM :LongInt):Boolean;
    {#CM Salva configuração da tela de parâmetros para o banco de dados.
    Solicita em tempo de desenho a indicação do módulo e do relatório para associar ao parâmetro}
    function SaveToDataBase(IdReport, OrigemCM :LongInt):Boolean;

    Constructor Create(Aowner :TComponent); Override;
    Destructor Destroy; Override;
    function Execute:Boolean;
    function MontaHtmlFormParam(lstHtmlFormParam: TStrings): Boolean;
    function ParamByName(sNomeParam: String) :TCMParamsItem;
    function GetParams: String;

    Property StrParams :String read FStrParams write SetStrParams;
    Property Mensagem :String read fMensagem;
    Property ParamValues[X :Integer] :TCMParamsItem read GetParamValues;
    Property ExibeFormParams: Boolean read FExibeFormParams write SetExibeFormParams;
    Property HtmlFormParam: TStrings read FHtmlFormParam write SetHtmlFormParam;
    Property FatorResize: Double read fFatorResize;



  published
    { Published declarations }
    Property Caption: TCaption read FCaption write SetCaption;
    Property DataBaseName: String read FDataBaseName write SetDataBaseName;
    Property Params: TCmParams read FParams write SetCmParams;
    Property BeforeExecute: TBeforeExecute read FBeforeExecute write FBeforeExecute;
    Property AfterExecute: TAfterExecute read FAfterExecute write FAfterExecute;
    Property OnParamControlExit: TPramControlAction read FOnParamControlExit write FOnParamControlExit;
    Property OnParamControlEnter: TPramControlAction read FOnParamControlEnter write FOnParamControlEnter;
    Property ExibeMensagem: Boolean read FExibeMensagem write SetExibeMensagem;
    Property Formheight: Integer read FFormheight write SetFormheight;
    Property FormWidth: Integer read FFormWidth write SetFormWidth;
    //27598 - Iferreira 18/03/08
    Property HelpContext: Integer read GetHelpContext write SetHelpContext;
  end;

implementation

Const
    FORM_HEIGHT = 433;
    FORM_WIDTH = 525;
    COMPO_SMALL_WIDTH = 280;
    COMPO_COMBO_WIDTH = 130;
    COMPO_LABEL_WIDTH = 200;
    COMPO_BIG_WIDTH = 480;
    TamTextoCompara = 7;
    TamNumCompara = 5;
    ListaTextoCompara : array[0..TamTextoCompara] of string = (
                        'começa com',                         {ivlm}
                        'é igual a',                          {ivlm}
                        'possui o texto',                     {ivlm}
                        'é maior que',                       {ivlm}
                        'é maior ou igual que',              {ivlm}
                        'é menor que',                       {ivlm}
                        'é menor ou igual que',              {ivlm}
                        'é diferente de');                   {ivlm}
    ListaOperCharCompara : array[0..TamTextoCompara] of string = (
                           ' LIKE ',
                           ' = ',
                           ' LIKE ',
                           ' > ',
                           ' >= ',
                           ' < ',
                           ' <= ',
                           ' <> ');

    ListaNumCompara : array[0..TamNumCompara] of string = (
                      'é igual a',                        {ivlm}
                      'é maior que',                     {ivlm}
                      'é maior ou igual que',            {ivlm}
                      'é menor que',                     {ivlm}
                      'é menor ou igual que',            {ivlm}
                      'é diferente de');                 {ivlm}
    ListaOperNumCompara : array[0..TamNumCompara] of string = (
                          ' = ',
                          ' > ',
                          ' >= ',
                          ' < ',
                          ' <= ',
                          ' <> ');
{ TCmParamReport }

constructor TCmParamReport.Create(Aowner: TComponent);
begin
  inherited Create(Aowner);
  
  fParams := TCmParams.Create(Self);
  
  FStrParams := '';
  FormHeight := FORM_HEIGHT;
  FFormWidth := FORM_WIDTH;
  FExibeMensagem := True;
  FMensagem := '';
  bUsaDataBaseName := True;
  FExibeFormParams := True;
  FHtmlFormParam := TStringList.Create;
  CdsAux := TClientDataSet.Create(nil);
  fFatorResize := 1;
  FHelpContext := 0;
end;

destructor TCmParamReport.Destroy;
begin
  fParams.Free;
  FHtmlFormParam.Free;
  CdsAux.Free;
  inherited Destroy;
end;

procedure TCmParamReport.DoAfterExecute(ActionExecute :TActionExecute);
begin
  If Assigned(fAfterExecute) Then fAfterExecute(ActionExecute);
end;

procedure TCmParamReport.DoBeforeExecute(Var CanExecute :Boolean);
begin
  If Assigned(fBeforeExecute) Then fBeforeExecute(CanExecute);
end;

function TCmParamReport.Execute: Boolean;
   Procedure SetStrToParams;
   Var
     i: Integer;
     sValorParam, sComparador, sAuxParam: String;
   Begin
      sAuxParam := Trim(FStrParams);

      i:=0;

      While (Trim(sAuxParam) <> '') Do
      Begin
        sValorParam := Trim(Copy(sAuxParam,1,Pos('|',sAuxParam) - 1));
        sAuxParam := Trim(Copy(sAuxParam,Pos('|',sAuxParam) + 1,Length(sAuxParam)));

        If ((Pos('|',sAuxParam) - 1) <= 0) Then
        Begin
          sComparador := Trim(sAuxParam);
          sAuxParam := '';
        End
        Else
        Begin
          sComparador := Trim(Copy(sAuxParam,1,Pos('|',sAuxParam) - 1));
          sAuxParam := Trim(Copy(sAuxParam,Pos('|',sAuxParam) + 1,Length(sAuxParam)));
        End;

        TCMParamsItem(Params.Items[i]).AsString := sValorParam;
        TCMParamsItem(Params.Items[i]).Comparador := sComparador;

        inc(i);
      End;
   End;
Var
   CanExecute :Boolean;
   ActionExecute :TActionExecute;
   X, J :Integer;
   ListPaineis :TList;
   Form :TFrmCmParamReport;
   sResult:String;

   procedure MensagemAbort(sMensagemAbort: String);
   Begin
      fMensagem := sMensagemAbort;
      If FExibeMensagem Then MsgDlg(fMensagem,'Erro!',mtError,[MbOk],0);
      ActionExecute := aeAbort;
      Abort;
   End;

begin
   CanExecute := True;
   Result := False;
   ActionExecute := aeOk;

   DoBeforeExecute(CanExecute);

   If CanExecute Then
   Begin
     //Abrir Form Dos Parâmetros
     If FExibeFormParams And (Trim(FStrParams) = '') Then
     Begin
        Form := TFrmCmParamReport.Create(Application);

        ListPaineis := TList.Create;

        With Form Do
          Try
             fMensagem := '';

             //27598 - Iferreira 18/03/08
             if FHelpContext <> 0 then
             begin
               Form.HelpContext               := FHelpContext;
               Form.CMOkCancelar1.HelpContext := FHelpContext;
             end;

             Caption := FCaption;

             For X:=0 To Params.Count - 1 Do
             Begin
                J := ListPaineis.Add(TObject(TPainelControles.Create(Self, Form,
                                              TCMParamsItem(Params.Items[X]).Caption,
                                              TCMParamsItem(Params.Items[X]).CampoBanco,
                                              TCMParamsItem(Params.Items[X]).Controle,
                                              TCMParamsItem(Params.Items[X]).TipodeDado,
                                              TCMParamsItem(Params.Items[X]).LookupSettings,
                                              TCMParamsItem(Params.Items[X]).FCheckBoxSetings,
                                              TCMParamsItem(Params.Items[X]).RadioGroupSettings,
                                              TCMParamsItem(Params.Items[X]).ComboBoxSettings,
                                              TCMParamsItem(Params.Items[X]).ListBoxSettings,
                                              TCMParamsItem(Params.Items[X]).MaskEditSettings,
                                              TCMParamsItem(Params.Items[X]).SpinEditSettings,
                                              TCMParamsItem(Params.Items[X]).ProcuraSTSettings,
                                              TCMParamsItem(Params.Items[X]).ProcuraFCSettings,
                                              TCMParamsItem(Params.Items[X]).ProcuraCCSettings,
                                              TCMParamsItem(Params.Items[X]).EditSettings,
                                              TCMParamsItem(Params.Items[X]).FMontaSelect,
                                              Self.DataBaseName,
                                              X,
                                              TCMParamsItem(Params.Items[X]).Width)));
                if J > 0 then
                   TPainelControles(ListPaineis[j]).Top := TPainelControles(ListPaineis[j-1]).Top + TPainelControles(ListPaineis[j-1]).Height+3
                else
                
                begin
                   case TPainelControles(ListPaineis[j]).Controle of
                      tcMaskEdit    : ActiveControl := TPainelControles(ListPaineis[j]).FMaskEdit;
                      tcCheckBox    : ActiveControl := TPainelControles(ListPaineis[j]).fCtrlCheckBox;
                      tcComboBox    : ActiveControl := TPainelControles(ListPaineis[j]).fCtrlComboBox;
                      tcListBox     : ActiveControl := TPainelControles(ListPaineis[j]).fCtrlListBox;
                      tcRadioGroup  : ActiveControl := TPainelControles(ListPaineis[j]).fCtrlRadioGroup;
                      tcLookupCombo : ActiveControl := TPainelControles(ListPaineis[j]).fCtrlLookup;
                      tcSpinEdit    : ActiveControl := TPainelControles(ListPaineis[j]).FSpinEdit;
                      tcProcuraST   : ActiveControl := TPainelControles(ListPaineis[j]).FProcuraSubTipo;
                      tcProcuraFC   : ActiveControl := TPainelControles(ListPaineis[j]).FProcuraForCli;
                      tcProcuraCC   : ActiveControl := TPainelControles(ListPaineis[j]).fProcuraMaskContabil;
                      tcMontaSelect : ActiveControl := TPainelControles(ListPaineis[j]).fCtrlEditMs;
                      tcMemo        : ActiveControl := TPainelControles(ListPaineis[j]).fCtrlMemo;

                   else
                      case TCMParamsItem(Params.Items[j]).TipodeDado of
                         tdReal, tdInteger : ActiveControl := TPainelControles(ListPaineis[j]).fCtrlRealEdit;
                         tdDate            : ActiveControl := TPainelControles(ListPaineis[j]).fCtrlDateTimePicker;
                      else
                         ActiveControl := TPainelControles(ListPaineis[j]).fCtrlEditt;
                      end;
                   end;
                end;
                


             end;

             Height := FormHeight;
             width := FFormWidth;

             ShowModal;


             Case ModalResult of
                 MrOk:
                 Begin
                   For X:=0 To ListPaineis.Count - 1 Do
                   Begin
                      TCMParamsItem(Params.Items[X]).FDisplayText := '';

                      Case TPainelControles(ListPaineis[X]).Controle of
                         tcMaskEdit:
                             TCMParamsItem(Params.Items[X]).AsString :=  TPainelControles(ListPaineis[X]).MaskEdit.Text;
                         tcSpinEdit:
                             Begin
                                TCMParamsItem(Params.Items[X]).AsString := TPainelControles(ListPaineis[X]).SpinEdit.Text;
                                TCMParamsItem(Params.Items[X]).Comparador := ListaOperNumCompara[TPainelControles(ListPaineis[X]).ComboCompara.ItemIndex];
                             End;
                         tcEdit :
                             Begin
                               Case TPainelControles(ListPaineis[X]).TipodeDado of
                                 tdString:
                                 Begin
                                    If Trim(TPainelControles(ListPaineis[X]).CtrlEdit.Text) = '' Then
                                    Begin
                                      TCMParamsItem(Params.Items[X]).AsString := '';
                                      TCMParamsItem(Params.Items[X]).Comparador := '';
                                    End
                                    Else
                                      If TCMParamsItem(Params.Items[X]).MostraComboCompara Then
                                      Begin
                                         Case TPainelControles(ListPaineis[X]).ComboCompara.ItemIndex of
                                         0:
                                           Begin
                                             TCMParamsItem(Params.Items[X]).AsString := TPainelControles(ListPaineis[X]).CtrlEdit.Text + '%';
                                             TCMParamsItem(Params.Items[X]).Comparador := ListaOperCharCompara[TPainelControles(ListPaineis[X]).ComboCompara.ItemIndex];
                                           End;
                                         2:
                                           Begin
                                             TCMParamsItem(Params.Items[X]).AsString := '%' + TPainelControles(ListPaineis[X]).CtrlEdit.Text + '%';
                                             TCMParamsItem(Params.Items[X]).Comparador := ListaOperCharCompara[TPainelControles(ListPaineis[X]).ComboCompara.ItemIndex];
                                           End;
                                         Else
                                           Begin
                                             TCMParamsItem(Params.Items[X]).AsString := TPainelControles(ListPaineis[X]).CtrlEdit.Text;
                                             TCMParamsItem(Params.Items[X]).Comparador := ListaOperCharCompara[TPainelControles(ListPaineis[X]).ComboCompara.ItemIndex];
                                           End;
                                         End;
                                      End
                                      Else
                                      Begin
                                        TCMParamsItem(Params.Items[X]).AsString := TPainelControles(ListPaineis[X]).CtrlEdit.Text;
                                        TCMParamsItem(Params.Items[X]).Comparador := ' = ';
                                      End;
                                 End;
                                 tdReal, tdInteger:
                                 Begin
                                    TCMParamsItem(Params.Items[X]).AsString := TPainelControles(ListPaineis[X]).CtrlRealEdit.Text;
                                    TCMParamsItem(Params.Items[X]).Comparador := ListaOperNumCompara[TPainelControles(ListPaineis[X]).ComboCompara.ItemIndex];
                                 End;
                                 tdDate:
                                 Begin
                                    TCMParamsItem(Params.Items[X]).AsString := TPainelControles(ListPaineis[X]).CtrlDateTimePicker.Text;
                                    TCMParamsItem(Params.Items[X]).Comparador := ListaOperNumCompara[TPainelControles(ListPaineis[X]).ComboCompara.ItemIndex];
                                 End;
                               End;
                             End;
                         tcCheckBox :
                         Begin
                            If TPainelControles(ListPaineis[X]).TipodeDado = tdBoolean Then
                            Begin
                               If TPainelControles(ListPaineis[X]).CtrlCheckBox.Checked Then
                                  TCMParamsItem(Params.Items[X]).AsString := 'True'
                               Else
                                  TCMParamsItem(Params.Items[X]).AsString := 'False';
                            End
                            Else
                               If TPainelControles(ListPaineis[X]).CtrlCheckBox.Checked Then
                                  TCMParamsItem(Params.Items[X]).AsString := TCMParamsItem(Params.Items[X]).CheckBoxSetings.ValueChecked
                               Else
                                  TCMParamsItem(Params.Items[X]).AsString := TCMParamsItem(Params.Items[X]).CheckBoxSetings.ValueUnChecked;

                         End;
                         tcComboBox :
                             Begin
                                If TPainelControles(ListPaineis[X]).TipodeDado = tdString Then
                                   TCMParamsItem(Params.Items[X]).AsString :=  TPainelControles(ListPaineis[X]).CtrlComboBox.Text
                                Else
                                   TCMParamsItem(Params.Items[X]).AsString := IntTostr(TPainelControles(ListPaineis[X]).CtrlComboBox.ItemIndex);

                                TCMParamsItem(Params.Items[X]).FDisplayText := TPainelControles(ListPaineis[X]).CtrlComboBox.Text;
                             End;
                         tcListBox :
                             Begin
                                If TPainelControles(ListPaineis[X]).TipodeDado = tdString Then
                                Begin
                                   If TPainelControles(ListPaineis[X]).CtrlListBox.ItemIndex <> -1 Then
                                      TCMParamsItem(Params.Items[X]).AsString :=  TPainelControles(ListPaineis[X]).CtrlListBox.Items[TPainelControles(ListPaineis[X]).CtrlListBox.ItemIndex]
                                   Else
                                      TCMParamsItem(Params.Items[X]).AsString :=  '';
                                End
                                Else
                                   TCMParamsItem(Params.Items[X]).AsString :=  IntTostr(TPainelControles(ListPaineis[X]).CtrlListBox.ItemIndex)
                             End;
                         tcRadioGroup :
                             Begin
                                If TPainelControles(ListPaineis[X]).TipodeDado = tdString Then
                                Begin
                                   If TCMParamsItem(Params.Items[X]).RadioGroupSettings.Values.Count > 0 Then
                                      TCMParamsItem(Params.Items[X]).AsString := TCMParamsItem(Params.Items[X]).RadioGroupSettings.Values[TPainelControles(ListPaineis[X]).CtrlRadioGroup.ItemIndex]
                                   Else
                                   Begin
                                      If TPainelControles(ListPaineis[X]).CtrlRadioGroup.ItemIndex <> -1 Then
                                         TCMParamsItem(Params.Items[X]).AsString :=  TPainelControles(ListPaineis[X]).CtrlRadioGroup.Items[TPainelControles(ListPaineis[X]).CtrlRadioGroup.ItemIndex]
                                      Else
                                         TCMParamsItem(Params.Items[X]).AsString := '';
                                   End;
                                End
                                Else
                                   TCMParamsItem(Params.Items[X]).AsString :=  IntTostr(TPainelControles(ListPaineis[X]).CtrlRadioGroup.ItemIndex)
                             End;
                         tcLookupCombo :
                         Begin
                            TCMParamsItem(Params.Items[X]).AsString :=  TPainelControles(ListPaineis[X]).CtrlLookup.LookupValue;
                            TCMParamsItem(Params.Items[X]).FDisplayText := TPainelControles(ListPaineis[X]).CtrlLookup.Text;
                         End;
                         tcProcuraST:
                         Begin
                            If (TPainelControles(ListPaineis[X]).ProcuraSubTipo.Valida = VcOk) Then
                            Begin
                               TCMParamsItem(Params.Items[X]).AsString := IntToStr(TPainelControles(ListPaineis[X]).ProcuraSubTipo.SubTipoReg.Id);
                               TCMParamsItem(Params.Items[X]).Comparador := ' = ';

                               Case TPainelControles(ListPaineis[X]).ProcuraSubTipo.CampoEdit of
                                 ceRazaoSocial: TCMParamsItem(Params.Items[X]).FDisplayText := TPainelControles(ListPaineis[X]).ProcuraSubTipo.SubTipoReg.RazaoSocial;
                                 ceNome: TCMParamsItem(Params.Items[X]).FDisplayText := TPainelControles(ListPaineis[X]).ProcuraSubTipo.SubTipoReg.Nome;
                               End;
                            End
                            ELse
                               MensagemAbort(TCMParamsItem(Params.Items[X]).Caption + ' (' + TPainelControles(ListPaineis[X]).ProcuraSubTipo.Text + ') - Não Existe.');
                         End;
                         tcProcuraFC:
                         Begin
                            If (TPainelControles(ListPaineis[X]).ProcuraForCli.Valida = VcOk) Then
                            Begin
                               TCMParamsItem(Params.Items[X]).AsString := IntToStr(TPainelControles(ListPaineis[X]).ProcuraForCli.ForCliReg.Id);
                               TCMParamsItem(Params.Items[X]).Comparador := ' = ';

                               Case TPainelControles(ListPaineis[X]).ProcuraForCli.CampoEdit of
                                 ceRazaoSocial: TCMParamsItem(Params.Items[X]).FDisplayText := TPainelControles(ListPaineis[X]).ProcuraForCli.ForCliReg.RazaoSocial;
                                 ceNome: TCMParamsItem(Params.Items[X]).FDisplayText := TPainelControles(ListPaineis[X]).ProcuraForCli.ForCliReg.Nome;
                               End;
                            End
                            ELse
                               MensagemAbort(TCMParamsItem(Params.Items[X]).Caption + ' (' + TPainelControles(ListPaineis[X]).ProcuraForCli.Text + ') - Não Existe.');
                         End;
                         tcProcuraCC:
                         Begin
                            If (TPainelControles(ListPaineis[X]).ProcuraMaskContabil.Valida = VcOk) Then
                            Begin
                               TCMParamsItem(Params.Items[X]).AsString := TPainelControles(ListPaineis[X]).ProcuraMaskContabil.Conta.Numero;
                               TCMParamsItem(Params.Items[X]).Comparador := ' = ';
                               TCMParamsItem(Params.Items[X]).FDisplayText := TPainelControles(ListPaineis[X]).ProcuraMaskContabil.Conta.Nome;
                            End
                            ELse
                               MensagemAbort(TCMParamsItem(Params.Items[X]).Caption + ' não Existe.');
                         End;
                         tcMemo:
                         Begin
                            TCMParamsItem(Params.Items[X]).AsString := TPainelControles(ListPaineis[X]).CtrlMemo.Lines.GetText;
                            TCMParamsItem(Params.Items[X]).Comparador := ' = ';
                         End;
                         tcMontaSelect:
                         Begin
                            If Trim(TPainelControles(ListPaineis[X]).CtrlEditMs.Text) = '' Then
                            Begin
                               TCMParamsItem(Params.Items[X]).AsString := '';
                               TCMParamsItem(Params.Items[X]).FDisplayText := '';
                            End
                            Else
                            Begin
                               TCMParamsItem(Params.Items[X]).AsString := TCMParamsItem(Params.Items[X]).MontaSelect.ValoresChave[1];
                               TCMParamsItem(Params.Items[X]).FDisplayText := TCMParamsItem(Params.Items[X]).MontaSelect.ValoresChave[0];
                            End;
                         End;
                      End;

                      If Trim(TCMParamsItem(Params.Items[X]).FDisplayText) = '' Then
                         TCMParamsItem(Params.Items[X]).FDisplayText := TCMParamsItem(Params.Items[X]).AsString;


                      If TCMParamsItem(Params.Items[X]).Required And
                         (Trim(TCMParamsItem(Params.Items[X]).AsString) = '') Then
                         Begin
                            //Nilton 20/11/08 - Pendencia: 100730 
                            fMensagem := 'O campo "' + TCMParamsItem(Params.Items[X]).Caption + '" é de preenchimento obrigatório.';

                            If FExibeMensagem Then MsgDlg(fMensagem,'Erro!',mtError,[MbOk],0);
                            ActionExecute := aeAbort;
                            Abort;

                         End;
                   End;

                   If csDesigning In Self.ComponentState Then
                   Begin
                      sResult := '';
                      For X:=0 To  Params.Count - 1 Do
                          sResult := sResult + (#13+#10) + TCMParamsItem(Params.Items[X]).Caption + TCMParamsItem(Params.Items[X]).FComparador + TCMParamsItem(Params.Items[X]).AsString;
                      ShowMessage(sResult);
                   End;

                    ActionExecute := aeOk;
                 End;
                 MrCancel: ActionExecute := aeCancelar;
                 MrIgnore: ActionExecute := aeSair;
             Else
                 ActionExecute := aeAbort;
             End;


          finally
             For X:=(ListPaineis.Count - 1) DownTo 0 Do
                 TPainelControles(ListPaineis[X]).Free;

             ListPaineis.Free;
             Free;
          End;
     End
     Else
        SetStrToParams;

     DoAfterExecute(ActionExecute);
     Result := (ActionExecute = aeOk);
   End;
end;

function TCmParamReport.GetParams: String;
Var
  X: Integer;
  sAux: String;
begin
  sAux := '';
  For X:=0 To Params.Count - 1 Do
     sAux := sAux + TCMParamsItem(Params.Items[X]).AsString + '|=|';
  Result := sAux;
end;

function TCmParamReport.GetParamValues(X: Integer): TCMParamsItem;
begin
   Result := TCMParamsItem(Self.Params.Items[X]);
end;

function TCmParamReport.LoadFromDataBase(IdReport,
  OrigemCM: Integer): Boolean;
Var
   ParamLoad :TCMParamsItem;
begin
   With TwwQuery.Create(nil) do
     Try
        If Not bUsaDataBaseName Then
           DataBaseName := 'BaseParamReports'
        Else
           DataBaseName := FDataBaseName;

        Sql.Text := 'SELECT IDPARAMREPORTS, IDREPORTS, ORIGEMCM,  CAPTION, CONTROLE, ' +
                    '  CAMPOBANCO, TIPODEDADO, LOOKUPSQL, LOOKUPCHAVE, LOOKUPDISPLAY, ' +
                    '  LOOKUPDESCRICAO, LOOKUPTAMANHO, CHECKVALUECHECKED, CHECKVALUEUNCHECK, ' +
                    '  RADIOITEMS, RADIOVALUES, RADIOCOLUMNS, RADIOITEMINDEX, RADIOHEIGHT, ' +
                    '  COMBOSORTED, COMBOSTYLE, COMBOITEMS, COMBODROPCOUNT, LISTITEMS, ' +
                    '  LISTMULTISELECT, LISTEXTENDSELECT, LISTSORTED, LISTSTYLE, LISTHEIGHT, REQUIRED, TEXTDEFAULT, MOSTRACOMBOCOMPARA ' +
                    'FROM PARAMREPORTS ' +
                    'WHERE IDREPORTS = ' + IntToStr(IdReport) + ' AND ORIGEMCM = ' + IntToStr(OrigemCM) + ' ORDER BY IDPARAMREPORTS';
        Open;

        First;
        Self.FParams.Clear;
        While Not Eof Do
        Begin
            ParamLoad := TCMParamsItem(Self.FParams.Add);
            ParamLoad.Caption := FieldByName('CAPTION').AsString;
            ParamLoad.Controle := TTipoControle(StrTointDef(FieldByName('CONTROLE').AsString,0));
            ParamLoad.CampoBanco := FieldByName('CAMPOBANCO').AsString;
            ParamLoad.TipodeDado := TTipoDado(StrTointDef(FieldByName('TIPODEDADO').AsString,0));
            ParamLoad.LookupSettings.SQL.Text := FieldByName('LOOKUPSQL').AsString;
            ParamLoad.LookupSettings.Chave := FieldByName('LOOKUPCHAVE').AsString;
            ParamLoad.LookupSettings.Display := FieldByName('LOOKUPDISPLAY').AsString;
            ParamLoad.LookupSettings.Descricao := FieldByName('LOOKUPDESCRICAO').AsString;
            ParamLoad.LookupSettings.Tamanho := FieldByName('LOOKUPTAMANHO').AsString;
            ParamLoad.CheckBoxSetings.ValueChecked := FieldByName('CHECKVALUECHECKED').AsString;
            ParamLoad.CheckBoxSetings.ValueUnChecked := FieldByName('CHECKVALUEUNCHECK').AsString;
            ParamLoad.RadioGroupSettings.Items.Text := FieldByName('RADIOITEMS').AsString;
            ParamLoad.RadioGroupSettings.Values.Text := FieldByName('RADIOVALUES').AsString;
            ParamLoad.RadioGroupSettings.Columns := StrToIntDef(FieldByName('RADIOCOLUMNS').AsString,1);
            ParamLoad.RadioGroupSettings.ItemIndex := StrToIntDef(FieldByName('RADIOITEMINDEX').AsString,-1);
            ParamLoad.RadioGroupSettings.Height := StrToIntDef(FieldByName('RADIOHEIGHT').AsString,40);
            ParamLoad.ComboBoxSettings.Sorted := (FieldByName('COMBOSORTED').AsString = 'S');
            ParamLoad.ComboBoxSettings.Style := TComboBoxStyle(StrToIntDef(FieldByName('COMBOSTYLE').AsString,0));
            ParamLoad.ComboBoxSettings.Items.Text := FieldByName('COMBOITEMS').AsString;
            ParamLoad.ComboBoxSettings.DropDownCount := StrToIntDef(FieldByName('COMBODROPCOUNT').AsString,8);
            ParamLoad.ListBoxSettings.Items.Text := FieldByName('LISTITEMS').AsString;
            ParamLoad.ListBoxSettings.MultiSelect := (FieldByName('LISTMULTISELECT').AsString = 'S');
            ParamLoad.ListBoxSettings.ExtendedSelect := (FieldByName('LISTEXTENDSELECT').AsString = 'S');
            ParamLoad.ListBoxSettings.Sorted := (FieldByName('LISTSORTED').AsString = 'S');
            ParamLoad.ListBoxSettings.Style := TListBoxStyle(StrToIntDef(FieldByName('LISTSTYLE').AsString,0));
            ParamLoad.ListBoxSettings.height := StrToIntDef(FieldByName('LISTHEIGHT').AsString,70);
            ParamLoad.Required := (FieldByName('REQUIRED').AsString = 'S');
            ParamLoad.TextDefault := (FieldByName('TEXTDEFAULT').AsString);
            ParamLoad.MostraComboCompara := (FieldByName('MOSTRACOMBOCOMPARA').AsString = 'S');
            Next;
        End;

        Result := Not IsEmpty;
     Finally
        Close;
        Free;
     End;
end;

function TCmParamReport.MontaHtmlFormParam(lstHtmlFormParam: TStrings): Boolean;
Var
  CanExecute :Boolean;
  LstNavegaContent, LstItems, LstValues: TStrings;
  sTipoDadoRpt, sCampoDisplay, sCampoChave, sNomeDoControle, sAddFechaChave, sAux: String;
  X, y, iIndiceRequired, iCountChaves: Integer;
  bMostraCombo: Boolean;

  procedure MontaInicioLinhaFiltro(sCaption, sTipodeDado: String; IdColunas: Integer; bShowComboComPara: Boolean = True);
  Begin
     LstNavegaContent.Append('<tr>');

     If sCaption <> '' Then
        LstNavegaContent.Append('  <td width="33%"><b><font face="verdana,arial,helvetica" size="2" color="#5454a0">' + sCaption + '</font></b></td>');

     If bShowComboComPara Then
     Begin
        LstNavegaContent.Append('  <td width="24%">');

        LstNavegaContent.Append('    <select size="1" name="' + _CMBCOMPARA + IntToStr(IdColunas) + '">');

        If sTipodeDado = 'C' Then
        Begin
          LstNavegaContent.Append('      <option value="0" selected>Começa com</option>');
          LstNavegaContent.Append('      <option value="1">Possui o texto</option>');
          LstNavegaContent.Append('      <option value="2">Igual a</option>');
        End
        Else
           LstNavegaContent.Append('      <option value="2" selected>Igual a</option>');


        LstNavegaContent.Append('      <option value="3">Menor que</option>');
        LstNavegaContent.Append('      <option value="4">Maior que</option>');
        LstNavegaContent.Append('      <option value="5">Maior ou igual a</option>');
        LstNavegaContent.Append('      <option value="6">Menor ou igual a</option>');
        LstNavegaContent.Append('      <option value="7">Diferente de</option>');

        LstNavegaContent.Append('    </select>');

        LstNavegaContent.Append('    </td>');
     End;
  End;

  Procedure MontaFinLinhaFiltro(sTipoDado: String; IdRegistro:Integer; bExibeCheckCase: Boolean = True);
  Begin
     If (sTipoDado = 'C') And bExibeCheckCase Then
        LstNavegaContent.Append('  <td width="20%"><input type="checkbox" name="' + _CKBCASE + IntToStr(IdRegistro) + '" value="S" checked>A=a</td>');

     

     LstNavegaContent.Append('</tr>');
  End;
begin
  CanExecute := True;
  Result := False;

  DoBeforeExecute(CanExecute);

  If CanExecute Then
  Begin
     LstNavegaContent := TStringList.Create;

     LstNavegaContent.Append(' <script language="JavaScript"> ');
     LstNavegaContent.Append(' ');
     LstNavegaContent.Append(' function OkClick() { ');
     LstNavegaContent.Append('   if ( ValidaCamposObrigatorios() ) { ');
     LstNavegaContent.Append('      document.frmTelaConsulta.submit(); ');
     LstNavegaContent.Append('   } ');
     LstNavegaContent.Append(' } ');
     LstNavegaContent.Append(' ');
     LstNavegaContent.Append(' function ValidaCamposObrigatorios()  { ');
     LstNavegaContent.Append('#CMADDREQUIREDFIELDS');
     LstNavegaContent.Append('   return true; } ');
     LstNavegaContent.Append(' } ');
     LstNavegaContent.Append('#CMADDFECHACHAVE');
     LstNavegaContent.Append(' </script> ');

     iIndiceRequired := -1;
     iCountChaves := 0;

     Try
     {***}
        {**
          Os Controles estão num form e seguem o seguinte padrão de nomenclatura:
          CmbCompara + IDMSCOLUNAS - Combo com os Comparadores
          EdtFiltro + IDMSCOLUNAS - Edit para digitação do conteúdo do filtro
          CkbCase + IDMSCOLUNAS - Check box para indicação de case sensitive na compratação da pesquisa
        **}
        For X:=0 To Self.FParams.Count - 1 Do
        Begin
            If X > (lstHtmlFormParam.Count - 1) Then Break;

           {**
             Verifica o tipo de dado da coluna para pesquisa e inicializa as
             linhas do "registro" do filtro referente a coluna de acordo com
             o tipo de dado.
             O Tipo de dado é utilizado para diferenciar a montagem do Combo de
             compração que é exibido de acordo com a coluna MOSTRACOMBOCOMPARA da
             tabela de parâmetros
           **}

           If (TCMParamsItem(Self.FParams.Items[x]).TIPODEDADO In [tdReal, tdInteger, tdBoolean ]) Then
              sTipoDadoRpt := 'N'
           Else
             If TCMParamsItem(Self.FParams.Items[x]).TIPODEDADO = tdDate Then
                sTipoDadoRpt := 'D'
             Else
                sTipoDadoRpt := 'C';

           bMostraCombo := (TCMParamsItem(Self.FParams.Items[x]).MOSTRACOMBOCOMPARA) And
                           (Not (TCMParamsItem(Self.FParams.Items[x]).CONTROLE In [tcCheckBox, tcRadioGroup]));

           If TCMParamsItem(Self.FParams.Items[x]).CONTROLE =  tcCheckBox Then
             MontaInicioLinhaFiltro('',
                                    sTipoDadoRpt,
                                    StrToInt(lstHtmlFormParam[x]),
                                    bMostraCombo)
           Else
             MontaInicioLinhaFiltro(TCMParamsItem(Self.FParams.Items[x]).CAPTION,
                                    sTipoDadoRpt,
                                    StrToInt(lstHtmlFormParam[x]),
                                    bMostraCombo);

           

           If TCMParamsItem(Self.FParams.Items[x]).REQUIRED Then
           Begin
              Inc(iCountChaves);

              If iIndiceRequired = -1 Then
                 iIndiceRequired := LstNavegaContent.IndexOf('#CMADDREQUIREDFIELDS');

              Case TCMParamsItem(Self.FParams.Items[x]).CONTROLE of
                tcCheckBox: sNomeDoControle := _CKBFILTRO + lstHtmlFormParam[x];
                tcComboBox: sNomeDoControle := _CMBFILTRO + lstHtmlFormParam[x];
                tcListBox: sNomeDoControle := _LSTFILTRO + lstHtmlFormParam[x];
                tcRadioGroup: sNomeDoControle := _RBTN + lstHtmlFormParam[x];
                tcLookupCombo: sNomeDoControle := _CMBLKPFILTRO + lstHtmlFormParam[x];
                tcMaskEdit,
                tcSpinEdit,
                tcEdit: sNomeDoControle := _EDTFILTRO + lstHtmlFormParam[x];
              End;

              Inc(iIndiceRequired);
              LstNavegaContent.Insert(iIndiceRequired,'   if ( document.frmTelaConsulta.' + sNomeDoControle + '.value == "" ) { ');
              Inc(iIndiceRequired);
              LstNavegaContent.Insert(iIndiceRequired,'      alert( "O Campo < ' + Trim(TCMParamsItem(Self.FParams.Items[x]).CAPTION) + ' > não pode estar em branco" ); ');
              Inc(iIndiceRequired);
              LstNavegaContent.Insert(iIndiceRequired,'      document.frmTelaConsulta.' + sNomeDoControle + '.focus(); ');
              Inc(iIndiceRequired);
              LstNavegaContent.Insert(iIndiceRequired,' ');
              Inc(iIndiceRequired);
              LstNavegaContent.Insert(iIndiceRequired,'      return false; ');
              Inc(iIndiceRequired);
              LstNavegaContent.Insert(iIndiceRequired,'   } else { ');
           End;

           {**
             Monta a tela de filtro de acordo com o tipo de controle do parâmetro.
             Faltam implementar javascripts para formatação e validação dos dados
             de preenchimento
           **}

           Case TCMParamsItem(Self.FParams.Items[x]).CONTROLE of
               tcCheckBox:
               Begin

                  LstNavegaContent.Append('  <td width="100%" colspan="3"><b><font face="verdana,arial,helvetica" size="2" color="#5454a0"><input type="Checkbox" name="' + _CKBFILTRO + lstHtmlFormParam[x] + '" value="S">' + TCMParamsItem(Self.FParams.Items[x]).CAPTION +'</font></td>');
               End;
               tcComboBox:
               Begin

                 If bMostraCombo Then
                    LstNavegaContent.Append('  <td width="43%">')
                 Else
                    LstNavegaContent.Append('  <td width="67%" colspan="2">');

                 LstNavegaContent.Append('   <select size="1" name="' + _CMBFILTRO + lstHtmlFormParam[x] + '">');
                 {**
                   Acidionado para o combo vir com a linha em branco
                 **}
                 LstNavegaContent.Append('   <option value=""></option>');

                 LstItems := TStringList.Create;
                 Try
                   TStringList(LstItems).Sorted := TCMParamsItem(Self.FParams.Items[x]).ComboBoxSettings.Sorted;
                   LstItems.Text := Copy(TCMParamsItem(Self.FParams.Items[x]).ComboBoxSettings.Items.Text,1,50);
                   {**
                     Adiciona os COMBOITEMS a uma lista para montar os Items do Combo em HTML.
                     A validação do tipo de dado do parâmetro é feita para definir o retorno do
                     combo como sendo o Index ou o Conteúdo do Combo
                   **}

                   For Y:=0 To LstItems.Count - 1 Do
                     If (TCMParamsItem(Self.FParams.Items[x]).TIPODEDADO In [tdReal, tdInteger, tdBoolean ]) Then
                       LstNavegaContent.Append('   <option value="' + IntToStr(Y) + '">' + LstItems[Y] + '</option>')
                     Else
                       LstNavegaContent.Append('   <option value="' + LstItems[Y] + '">' + LstItems[Y] + '</option>');
                 finally
                   LstItems.Free;
                 End;

                 LstNavegaContent.Append('   </select>');
                 LstNavegaContent.Append('   </td>');
               End;
               tcListBox:
               Begin
                  
                 If bMostraCombo Then
                    LstNavegaContent.Append('  <td width="43%">')
                 Else
                    LstNavegaContent.Append('  <td width="67%" colspan="2">');

                 LstNavegaContent.Append('   <select size="5" name="' + _LSTFILTRO + lstHtmlFormParam[x] + '">');
                 {**
                   Acidionado para o combo vir com a linha em branco
                 **}
                 LstNavegaContent.Append('   <option value=""></option>');

                 LstItems := TStringList.Create;
                 Try

                   TStringList(LstItems).Sorted := TCMParamsItem(Self.FParams.Items[x]).ListBoxSettings.Sorted;
                   LstItems.Text := Copy(TCMParamsItem(Self.FParams.Items[x]).ListBoxSettings.Items.Text,1,50);
                   {**
                     Adiciona os LISTITEMS a uma lista para montar os Items do Combo em HTML.
                     A validação do tipo de dado do parâmetro é feita para definir o retorno do
                     combo como sendo o Index ou o Conteúdo do Combo
                   **}
                   For Y:=0 To LstItems.Count - 1 Do
                     If (TCMParamsItem(Self.FParams.Items[x]).TIPODEDADO In [tdReal, tdInteger, tdBoolean ]) Then
                       LstNavegaContent.Append('   <option value="' + IntToStr(Y) + '">' + LstItems[Y] + '</option>')
                     Else
                       LstNavegaContent.Append('   <option value="' + LstItems[Y] + '">' + LstItems[Y] + '</option>');
                 finally
                   LstItems.Free;
                 End;

                 LstNavegaContent.Append('   </select>');
                 LstNavegaContent.Append('   </td>');
               End;
               tcRadioGroup:
               Begin
                  
                  LstNavegaContent.Append('  <td width="67%" colspan="3">');

                  LstItems := TStringList.Create;
                  LstValues := TStringList.Create;
                  Try
                    sAux := TCMParamsItem(Self.FParams.Items[x]).RadioGroupSettings.Items.Text;

                    While (Pos('&',sAux) <> 0) Do
                       Delete(sAux,Pos('&',sAux),1);

                    LstItems.Text := sAux;
                    LstValues.Text := TCMParamsItem(Self.FParams.Items[x]).RadioGroupSettings.Values.Text;
                    {**
                      Adiciona os LISTITEMS a uma lista para montar os Items do Combo em HTML.
                      A validação do tipo de dado do parâmetro é feita para definir o retorno do
                      combo como sendo o Index ou o Conteúdo do Combo
                    **}
                    If LstValues.Count <> LstItems.Count Then
                    Begin
                       For Y:=0 To LstItems.Count - 1 Do
                          If TCMParamsItem(Self.FParams.Items[x]).RadioGroupSettings.ItemIndex = y Then
                            LstNavegaContent.Append('<input type="radio" value="'+ LstItems[y] +'" checked name="' + _RBTN + lstHtmlFormParam[x] + '">' + LstItems[y] + '<br>')
                          Else
                            LstNavegaContent.Append('<input type="radio" value="'+ LstItems[y] +'" name="' + _RBTN + lstHtmlFormParam[x] + '">' + LstItems[y]+ '<br>');
                    End
                    Else
                      For y:=0 To LstItems.Count - 1 Do
                          If TCMParamsItem(Self.FParams.Items[x]).RadioGroupSettings.ItemIndex = y Then
                            LstNavegaContent.Append('<input type="radio" value="'+ LstValues[y] +'" checked name="' + _RBTN + lstHtmlFormParam[x] + '">' + LstItems[y])
                          Else
                            LstNavegaContent.Append('<input type="radio" value="'+ LstValues[y] +'" name="' + _RBTN + lstHtmlFormParam[x] + '">' + LstItems[y]);

                  finally
                    LstItems.Free;
                    LstValues.Free;
                  End;

                  LstNavegaContent.Append('   </td>');
               End;
               tcLookupCombo:
               Begin
                     

                    If bMostraCombo Then
                       LstNavegaContent.Append('  <td width="43%">')
                    Else
                       LstNavegaContent.Append('  <td width="67%" colspan="2">');

                    LstNavegaContent.Append('   <select size="1" name="' + _CMBLKPFILTRO + lstHtmlFormParam[x] + '">');
                    LstNavegaContent.Append('   <option value=""></option>');

                    {**
                      Adiciona os COMBOITEMS de acordo com o select da propriedade LOOKUPSQL
                    **}

                    sCampoChave := TCMParamsItem(Self.FParams.Items[x]).LookupSettings.Chave;
                    sCampoDisplay := TCMParamsItem(Self.FParams.Items[x]).LookupSettings.Display;

                    If Pos('|',sCampoDisplay) > 0 Then
                       sCampoDisplay := Copy(sCampoDisplay,1,Pos('|',sCampoDisplay)-1);

                    CdsAux.Data := GetaDataForComponentState(TCMParamsItem(Self.FParams.Items[x]).LookupSettings.SQL.Text);

                    While Not CdsAux.Eof Do
                    Begin
                       LstNavegaContent.Append('   <option value="' + CdsAux.FieldByName(sCampoChave).AsString + '">' + Copy(CdsAux.FieldByName(sCampoDisplay).AsString,1,50) + '</option>');
                       CdsAux.Next;
                    End;

                    CdsAux.Close;

                    LstNavegaContent.Append('   </select>');
                    LstNavegaContent.Append('   </td>');
               End;
               tcMaskEdit, {Criado a princípio como um Edit Comum, implementar depois
                           os JavaScript para execução da mascara}
               tcSpinEdit, {Criado a princípio como um Edit Comum, implementar depois
                           os JavaScript manipulação do Spin}
               tcEdit:
               Begin
                 If bMostraCombo Then
                    LstNavegaContent.Append('  <td width="43%">')
                 Else
                    LstNavegaContent.Append('  <td width="67%" colspan="2">');

                 LstNavegaContent.Append('  <input type="text" name="' + _EDTFILTRO + lstHtmlFormParam[x] + '" size="20"></td>');
               End;
           End;
           {**}
           MontaFinLinhaFiltro(sTipoDadoRpt, StrToInt(lstHtmlFormParam[x]), False);

        End;
     {***}
     finally
        If iIndiceRequired = -1 Then
           LstNavegaContent[LstNavegaContent.IndexOf('#CMADDREQUIREDFIELDS')] := '{'
        Else
           LstNavegaContent.Delete(LstNavegaContent.IndexOf('#CMADDREQUIREDFIELDS'));

        If iCountChaves > 0 Then
        Begin
          sAddFechaChave := '';

          For X:=1 To iCountChaves - 1 Do
              sAddFechaChave := sAddFechaChave + '}';

          LstNavegaContent.Insert(LstNavegaContent.IndexOf('#CMADDFECHACHAVE'),sAddFechaChave);
        End;

        LstNavegaContent.Delete(LstNavegaContent.IndexOf('#CMADDFECHACHAVE'));

        Result := True;
        lstHtmlFormParam.Text := LstNavegaContent.Text;

        LstNavegaContent.Free;
     End;
  End;
end;

function TCmParamReport.ParamByName(sNomeParam: String): TCMParamsItem;
Var
  X: Integer;
  bAchou: Boolean;
begin
  Result := nil;
  bAchou := False;

  For X := 0 To Self.Params.Count - 1 Do
    If UpperCase(TCMParamsItem(Self.Params.Items[x]).Name) = UpperCase(sNomeParam) Then
    Begin
       Result := TCMParamsItem(Self.Params.Items[X]);
       bAchou := True;
    End;

  If Not bAchou Then
     Raise Exception.Create('Parâmetro não encontrado na lista');
end;

procedure TCmParamReport.ParamControlEnter(Sender: TObject);
begin
   If Assigned(FOnParamControlEnter) And
      (TControl(Sender).Parent Is TToolBar97) And
      (TToolBar97(TControl(Sender).Parent).Parent Is TPainelControles) Then
      FOnParamControlEnter(TPainelControles(TToolBar97(TControl(Sender).Parent).Parent),TPainelControles(TToolBar97(TControl(Sender).Parent).Parent).Indice);
end;

procedure TCmParamReport.ParamControlExit(Sender: TObject);
begin
   If Assigned(FOnParamControlExit) And
      (TControl(Sender).Parent Is TToolBar97) And
      (TToolBar97(TControl(Sender).Parent).Parent Is TPainelControles) Then
      FOnParamControlExit(TPainelControles(TToolBar97(TControl(Sender).Parent).Parent),TPainelControles(TToolBar97(TControl(Sender).Parent).Parent).Indice);
end;

function TCmParamReport.SaveToDataBase(IdReport,
  OrigemCM: Integer): Boolean;
Var
  X :Integer;
  Upd :TUpdateSQL;
  QrySeq :TwwQuery;
begin
   Result := False;
   QrySeq := TwwQuery.Create(nil);
   With TwwQuery.Create(nil) do
     Try
        If Not bUsaDataBaseName Then
           DataBaseName := 'BaseParamReports'
        Else
           DataBaseName := FDataBaseName;

        QrySeq.Sql.Text := 'SELECT SEQPARAMREPORTS.NEXTVAL FROM DUAL';

        If Not bUsaDataBaseName Then
           QrySeq.DataBaseName := 'BaseParamReports'
        Else
           QrySeq.DataBaseName := FDataBaseName;


        Upd := TUpdateSQL.Create(nil);
        Upd.ModifySql.Text := 'update paramreports  ' +
                              ' set ' +
                              '   IDREPORTS = :IDREPORTS, ' +
                              '   ORIGEMCM = :ORIGEMCM, ' +
                              '   CAPTION = :CAPTION, ' +
                              '   CONTROLE = :CONTROLE, ' +
                              '   CAMPOBANCO = :CAMPOBANCO, ' +
                              '   TIPODEDADO = :TIPODEDADO, ' +
                              '   LOOKUPSQL = :LOOKUPSQL, ' +
                              '   LOOKUPCHAVE = :LOOKUPCHAVE, ' +
                              '   LOOKUPDISPLAY = :LOOKUPDISPLAY, ' +
                              '   LOOKUPDESCRICAO = :LOOKUPDESCRICAO, ' +
                              '   LOOKUPTAMANHO = :LOOKUPTAMANHO, ' +
                              '   CHECKVALUECHECKED = :CHECKVALUECHECKED, ' +
                              '   CHECKVALUEUNCHECK = :CHECKVALUEUNCHECK, ' +
                              '   RADIOITEMS = :RADIOITEMS, ' +
                              '   RADIOVALUES = :RADIOVALUES, ' +
                              '   RADIOCOLUMNS = :RADIOCOLUMNS, ' +
                              '   RADIOITEMINDEX = :RADIOITEMINDEX, ' +
                              '   RADIOHEIGHT = :RADIOHEIGHT, ' +
                              '   COMBOSORTED = :COMBOSORTED, ' +
                              '   COMBOSTYLE = :COMBOSTYLE, ' +
                              '   COMBOITEMS = :COMBOITEMS, ' +
                              '   COMBODROPCOUNT = :COMBODROPCOUNT, ' +
                              '   LISTITEMS = :LISTITEMS, ' +
                              '   LISTMULTISELECT = :LISTMULTISELECT, ' +
                              '   LISTEXTENDSELECT = :LISTEXTENDSELECT, ' +
                              '   LISTSORTED = :LISTSORTED, ' +
                              '   LISTSTYLE = :LISTSTYLE, ' +
                              '   LISTHEIGHT = :LISTHEIGHT, ' +
                              '   REQUIRED = :REQUIRED, ' +
                              '   MOSTRACOMBOCOMPARA = :MOSTRACOMBOCOMPARA, ' +
                              '   TEXTDEFAULT = :TEXTDEFAULT ' +
                              ' where ' +
                              '  IDPARAMREPORTS = :OLD_IDPARAMREPORTS ';
        Upd.DeleteSql.Text := 'delete from paramreports ' +
                              ' where ' +
                              '   IDPARAMREPORTS = :OLD_IDPARAMREPORTS ';
        Upd.InsertSql.Text := 'insert into paramreports ' +
                              '  (IDPARAMREPORTS, IDREPORTS, ORIGEMCM, CAPTION, CONTROLE, CAMPOBANCO, ' +
                              '    TIPODEDADO, LOOKUPSQL, LOOKUPCHAVE, LOOKUPDISPLAY, LOOKUPDESCRICAO, ' +
                              '    LOOKUPTAMANHO, CHECKVALUECHECKED, CHECKVALUEUNCHECK, RADIOITEMS, RADIOVALUES, ' +
                              '    RADIOCOLUMNS, RADIOITEMINDEX, RADIOHEIGHT, COMBOSORTED, COMBOSTYLE, ' +
                              '    COMBOITEMS, COMBODROPCOUNT, LISTITEMS, LISTMULTISELECT, LISTEXTENDSELECT, ' +
                              '    LISTSORTED, LISTSTYLE, LISTHEIGHT, REQUIRED, MOSTRACOMBOCOMPARA,TEXTDEFAULT) ' +
                              ' values ' +
                              '   (:IDPARAMREPORTS, :IDREPORTS, :ORIGEMCM, :CAPTION, :CONTROLE, :CAMPOBANCO, ' +
                              '    :TIPODEDADO, :LOOKUPSQL, :LOOKUPCHAVE, :LOOKUPDISPLAY, :LOOKUPDESCRICAO, ' +
                              '    :LOOKUPTAMANHO, :CHECKVALUECHECKED, :CHECKVALUEUNCHECK, :RADIOITEMS, ' +
                              '    :RADIOVALUES, :RADIOCOLUMNS, :RADIOITEMINDEX, :RADIOHEIGHT, :COMBOSORTED, ' +
                              '    :COMBOSTYLE, :COMBOITEMS, :COMBODROPCOUNT, :LISTITEMS, :LISTMULTISELECT, ' +
                              '    :LISTEXTENDSELECT, :LISTSORTED, :LISTSTYLE, :LISTHEIGHT, :REQUIRED, :MOSTRACOMBOCOMPARA, :TEXTDEFAULT) ';

        If Not bUsaDataBaseName Then
           DataBaseName := 'BaseParamReports'
        Else
           DataBaseName := FDataBaseName;

        CachedUpdates := True;
        UpdateObject := Upd;

        Sql.Text := 'SELECT IDPARAMREPORTS, IDREPORTS, ORIGEMCM, CAPTION, CONTROLE, CAMPOBANCO, ' +
                    '    TIPODEDADO, LOOKUPSQL, LOOKUPCHAVE, LOOKUPDISPLAY, LOOKUPDESCRICAO, ' +
                    '    LOOKUPTAMANHO, CHECKVALUECHECKED, CHECKVALUEUNCHECK, RADIOITEMS, RADIOVALUES, ' +
                    '    RADIOCOLUMNS, RADIOITEMINDEX, RADIOHEIGHT, COMBOSORTED, COMBOSTYLE, ' +
                    '    COMBOITEMS, COMBODROPCOUNT, LISTITEMS, LISTMULTISELECT, LISTEXTENDSELECT, ' +
                    '    LISTSORTED, LISTSTYLE, LISTHEIGHT, REQUIRED, MOSTRACOMBOCOMPARA,TEXTDEFAULT FROM PARAMREPORTS ' +
                    'WHERE IDREPORTS = ' + IntToStr(IdReport) + ' AND ORIGEMCM = ' + IntToStr(OrigemCM);
        Open;

        If Not IsEmpty Then
           While Not Eof Do Delete;

        For X:=0 To Self.FParams.Count - 1 Do
        Begin
          Insert;

          QrySeq.Open;
          FieldByName('IDPARAMREPORTS').AsFloat := QrySeq.Fields[0].AsFloat;
          QrySeq.Close;

          FieldByName('IDREPORTS').AsFloat := IdReport;
          FieldByName('ORIGEMCM').AsFloat := OrigemCM;
          FieldByName('CAPTION').AsString := TCMParamsItem(Self.FParams.Items[x]).Caption;
          FieldByName('CONTROLE').AsInteger := Integer(TCMParamsItem(Self.FParams.Items[x]).Controle);
          FieldByName('CAMPOBANCO').AsString := TCMParamsItem(Self.FParams.Items[x]).CampoBanco;
          FieldByName('TIPODEDADO').AsInteger := Integer(TCMParamsItem(Self.FParams.Items[x]).TipodeDado);
          FieldByName('LOOKUPSQL').AsString := TCMParamsItem(Self.FParams.Items[x]).LookupSettings.SQL.Text;
          FieldByName('LOOKUPCHAVE').AsString := TCMParamsItem(Self.FParams.Items[x]).LookupSettings.Chave;
          FieldByName('LOOKUPDISPLAY').AsString := TCMParamsItem(Self.FParams.Items[x]).LookupSettings.Display;
          FieldByName('LOOKUPDESCRICAO').AsString := TCMParamsItem(Self.FParams.Items[x]).LookupSettings.Descricao;
          FieldByName('LOOKUPTAMANHO').AsString := TCMParamsItem(Self.FParams.Items[x]).LookupSettings.Tamanho;
          FieldByName('CHECKVALUECHECKED').AsString := TCMParamsItem(Self.FParams.Items[x]).CheckBoxSetings.ValueChecked;
          FieldByName('CHECKVALUEUNCHECK').AsString := TCMParamsItem(Self.FParams.Items[x]).CheckBoxSetings.ValueUnChecked;
          FieldByName('RADIOITEMS').AsString := TCMParamsItem(Self.FParams.Items[x]).RadioGroupSettings.Items.Text;
          FieldByName('RADIOVALUES').AsString := TCMParamsItem(Self.FParams.Items[x]).RadioGroupSettings.Values.Text;
          FieldByName('RADIOCOLUMNS').AsInteger := TCMParamsItem(Self.FParams.Items[x]).RadioGroupSettings.Columns;
          FieldByName('RADIOITEMINDEX').AsInteger := TCMParamsItem(Self.FParams.Items[x]).RadioGroupSettings.ItemIndex;
          FieldByName('RADIOHEIGHT').AsInteger := TCMParamsItem(Self.FParams.Items[x]).RadioGroupSettings.Height;

          If TCMParamsItem(Self.FParams.Items[x]).ComboBoxSettings.Sorted Then
             FieldByName('COMBOSORTED').AsString := 'S'
          Else
             FieldByName('COMBOSORTED').AsString := 'N';

          FieldByName('COMBOSTYLE').AsInteger := Integer(TCMParamsItem(Self.FParams.Items[x]).ComboBoxSettings.Style);
          FieldByName('COMBOITEMS').AsString := TCMParamsItem(Self.FParams.Items[x]).ComboBoxSettings.Items.Text;
          FieldByName('COMBODROPCOUNT').AsInteger := TCMParamsItem(Self.FParams.Items[x]).ComboBoxSettings.DropDownCount;
          FieldByName('LISTITEMS').AsString := TCMParamsItem(Self.FParams.Items[x]).ListBoxSettings.Items.Text;

          If TCMParamsItem(Self.FParams.Items[x]).ListBoxSettings.MultiSelect Then
             FieldByName('LISTMULTISELECT').AsString := 'S'
          Else
             FieldByName('LISTMULTISELECT').AsString := 'N';

          If TCMParamsItem(Self.FParams.Items[x]).ListBoxSettings.ExtendedSelect Then
             FieldByName('LISTEXTENDSELECT').AsString := 'S'
          Else
             FieldByName('LISTEXTENDSELECT').AsString := 'N';

         If TCMParamsItem(Self.FParams.Items[x]).ListBoxSettings.Sorted Then
            FieldByName('LISTSORTED').AsString := 'S'
         Else
            FieldByName('LISTSORTED').AsString := 'N';

          FieldByName('LISTSTYLE').AsInteger := Integer(TCMParamsItem(Self.FParams.Items[x]).ListBoxSettings.Style);
          FieldByName('LISTHEIGHT').AsInteger := TCMParamsItem(Self.FParams.Items[x]).ListBoxSettings.height;

          If TCMParamsItem(Self.FParams.Items[x]).Required Then
             FieldByName('REQUIRED').AsString := 'S'
          Else
             FieldByName('REQUIRED').AsString := 'N';

          If TCMParamsItem(Self.FParams.Items[x]).MostraComboCompara Then
             FieldByName('MOSTRACOMBOCOMPARA').AsString := 'S'
          Else
             FieldByName('MOSTRACOMBOCOMPARA').AsString := 'N';

          FieldByName('TEXTDEFAULT').AsString := TCMParamsItem(Self.FParams.Items[x]).TextDefault;

          Post;
          Next;
        End;

        If UpdatesPending Then
        Begin
          ApplyUpdates;
          CommitUpdates;
        End;
     finally
        Close;
        Free;
        QrySeq.Free;
     End;
end;

procedure TCmParamReport.SetCaption(const Value: TCaption);
begin
  FCaption := Value;
end;

procedure TCmParamReport.SetCmParams(const Value: TCmParams);
begin
  FParams := Value;
end;

procedure TCmParamReport.SetDataBaseName(const Value: String);
begin
  FDataBaseName := Value;
end;

procedure TCmParamReport.SetExibeFormParams(const Value: Boolean);
begin
  FExibeFormParams := Value;
end;

procedure TCmParamReport.SetExibeMensagem(const Value: Boolean);
begin
  FExibeMensagem := Value;
end;

procedure TCmParamReport.SetFormheight(const Value: Integer);
begin
  FFormheight := Value;
end;


procedure TCmParamReport.SetFormWidth(const Value: Integer);
begin
  FFormWidth := Value;

  fFatorResize := (Value / FORM_WIDTH)
end;

procedure TCmParamReport.SetHtmlFormParam(const Value: TStrings);
begin
  FHtmlFormParam := Value;
end;

procedure TCmParamReport.SetStrParams(const Value: String);
begin
  FStrParams := Value;
end;

procedure TCmParamReport.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  inherited Notification(AComponent, Operation);

  if (aComponent  Is TMontaSelect) and (Operation = opRemove) then
     ParamValues[TMontaSelect(aComponent).Tag].FMontaSelect := nil;
end;

procedure TCmParamReport.SetHelpContext(const Value: Integer);
begin
  FHelpContext := Value;
end;

function TCmParamReport.GetHelpContext: Integer;
begin
  result := FHelpContext;
end;

{ TCMParamsItem }

constructor TCMParamsItem.Create(Collection: TCollection);
begin
  inherited;
  FWidth := 0;
  FControle := tcEdit;
  FLookupSettings := TLookupSettings.Create;
  FCheckBoxSetings := TCheckBoxSetings.Create;
  FRadioGroupSettings := TRadioGroupSettings.Create;
  FComboBoxSettings := TComboBoxSettings.Create;
  FListBoxSettings := TListBoxSettings.Create;
  FSpinEditSettings := TSpinEditSettings.Create;
  FMaskEditSettings := TMaskEditSettings.Create;
  fProcuraSTSettings := TProcuraSTSettings.Create;
  fProcuraFCSettings := TProcuraFCSettings.Create;
  fProcuraCCSettings := TProcuraCCSettings.Create;
  fEditSettings := TEditSettings.Create;

  FComparador := ' = ';
  FMostraComboCompara := True;
  FRequired := False;
  fTextDefault := '';
  FName := '';
  FDisplayText := '';
end;

destructor TCMParamsItem.Destroy;
begin
  inherited;
  FLookupSettings.Free;
  FCheckBoxSetings.Free;
  FRadioGroupSettings.Free;
  FComboBoxSettings.Free;
  FListBoxSettings.Free;
  FSpinEditSettings.Free;
  FMaskEditSettings.Free;
  fProcuraSTSettings.Free;
  fProcuraFCSettings.Free;
  fProcuraCCSettings.Free;
end;

function TCmParamReport.GetaDataForComponentState(sSql: String): OleVariant;
Var
   lQry: TwwQuery;
   lPvd: TDataSetProvider;
   lCds: TClientDataSet;
begin
   If  csDesigning In Componentstate Then
   Begin
     lQry := TwwQuery.Create(nil);
     lQry.DataBaseName := 'BaseDados';
     lQry.Sql.Text := sSql;

     lPvd := TDataSetProvider.Create(nil);
     lPvd.DataSet := lQry;

     lCds := TClientDataSet.Create(nil);
     lCds.SetProvider(lPvd);

     Try
       lCds.Open;
       Result := lCds.Data;

       lQry.Free;
       lPvd.Free;
       lCds.Free;
     Except
       lQry.Free;
       lPvd.Free;
       lCds.Free;
       Raise;
     End;
   End
   Else
     Result := Padroes.GetDataPacket(sSql);
end;

function TCMParamsItem.GetAsBoolean: Boolean;
begin
  Result := FAsBoolean;
end;

function TCMParamsItem.GetAsDateTime: TDateTime;
begin
  Result := FAsDateTime;
end;

function TCMParamsItem.GetAsFloat: Double;
begin
  Result := fAsFloat;
end;

function TCMParamsItem.GetAsInteger: LongInt;
begin
  Result := fAsInteger;
end;

function TCMParamsItem.GetAsString: String;
begin
  Result := fAsString
end;

function TCMParamsItem.GetDisplayName: String;
begin
  Result := FCaption;
end;

function TCMParamsItem.GetIsNull: Boolean;
begin
  Result := (Trim(fAsString) = '');
  fIsNull := Result;
end;

function TCMParamsItem.GetValue: Variant;
begin
  Result := fAsString
end;

procedure TCMParamsItem.SetAsBoolean(const Value: Boolean);
begin
  FAsBoolean := Value;

  If FAsBoolean Then
     fAsString := 'True'
  Else
     fAsString := 'False';
end;

procedure TCMParamsItem.SetAsDateTime(const Value: TDateTime);
begin
  FAsDateTime := Value;

  fAsString := DateToStr(FAsDateTime);
end;

procedure TCMParamsItem.SetAsFloat(const Value: Double);
begin
  FAsFloat := Value;
  fAsString := FloatToStr(FAsFloat);
end;

procedure TCMParamsItem.SetAsInteger(const Value: LongInt);
begin
  FAsInteger := Value;
  fAsString := IntToStr(FAsInteger);
  fAsFloat := Value;
end;

procedure TCMParamsItem.SetAsString(const Value: String);
begin
  FAsString := Value;

  Case FTipodeDado Of
    tdReal:
    Begin
       if Trim(Value) = '' Then
          fAsFloat := 0
       Else
          fAsFloat := StrToFloatCM(Value);
    End;
    tdInteger:
    Begin
       if Trim(Value) = '' Then
          fAsInteger := 0
       Else
          fAsInteger := StrToInt(Value);
    End;
    tdDate:
    Begin
       if Trim(Value) = '' Then
          fAsDateTime := 0
       Else
          fAsDateTime := StrToDate(Value);
    End;
    tdBoolean:
    Begin
       If UpperCase(Value) = 'TRUE' Then
          fAsBoolean := True
       Else
          fAsBoolean := False;
    End;
  Else
    FValue := Value;
  End;
end;

procedure TCMParamsItem.SetCampoBanco(const Value: String);
begin
  FCampoBanco := Value;
end;

procedure TCMParamsItem.SetCaption(const Value: TCaption);
begin
  FCaption := Value;
end;

procedure TCMParamsItem.SetCheckBoxSetings(const Value: TCheckBoxSetings);
begin
  FCheckBoxSetings := Value;
end;

procedure TCMParamsItem.SetComboBoxSettings(
  const Value: TComboBoxSettings);
begin
  FComboBoxSettings := Value;
end;

procedure TCMParamsItem.SetComparador(const Value: String);
begin
  FComparador := Value;
end;

procedure TCMParamsItem.SetControle(const Value: TTipoControle);
begin
  FControle := Value;
end;

procedure TCMParamsItem.SetEditSettings(const Value: TEditSettings);
begin
  FEditSettings := Value;
end;

procedure TCMParamsItem.SetListBoxSettings(const Value: TListBoxSettings);
begin
  FListBoxSettings := Value;
end;

procedure TCMParamsItem.SetLookupSettings(const Value: TLookupSettings);
begin
  FLookupSettings := Value;
end;

procedure TCMParamsItem.SetMaskEditSettings(
  const Value: TMaskEditSettings);
begin
  FMaskEditSettings := Value;
end;

procedure TCMParamsItem.SetMontaSelect(const Value: TMontaSelect);
begin
  FMontaSelect := Value;

  If FMontaSelect <> nil Then FMontaSelect.Tag := Index;
end;

procedure TCMParamsItem.SetMostraComboCompara(const Value: Boolean);
begin
  FMostraComboCompara := Value;
end;

procedure TCMParamsItem.SetName(const Value: TComponentName);
begin
  FName := Value;
end;

procedure TCMParamsItem.SetProcuraCCSettings(
  const Value: TProcuraCCSettings);
begin
  FProcuraCCSettings := Value;
end;

procedure TCMParamsItem.SetProcuraFCSettings(
  const Value: TProcuraFCSettings);
begin
  FProcuraFCSettings := Value;
end;

procedure TCMParamsItem.SetProcuraSTSettings(
  const Value: TProcuraSTSettings);
begin
  FProcuraSTSettings := Value;
end;

procedure TCMParamsItem.SetRadioGroupSettings(
  const Value: TRadioGroupSettings);
begin
  FRadioGroupSettings := Value;
end;

procedure TCMParamsItem.SetRequired(const Value: Boolean);
begin
  FRequired := Value;
end;

procedure TCMParamsItem.SetSpinEditSettings(
  const Value: TSpinEditSettings);
begin
  FSpinEditSettings := Value;
end;

procedure TCMParamsItem.SetTextDefault(const Value: String);
begin
  FTextDefault := Value;
end;

procedure TCMParamsItem.SetTipodeDado(const Value: TTipoDado);
begin
  FTipodeDado := Value;
end;

procedure TCMParamsItem.SetValue(const Value: Variant);
begin
  FValue := Value;

  If Value = Null Then
     SetAsString('')
  Else
     SetAsString(Value);
end;

procedure TCMParamsItem.SetWidth(const Value: Integer);
begin
  FWidth := Value;
end;

{ TLookupSettings }

constructor TLookupSettings.Create;
begin
  inherited;
  FSQL := TstringList.Create;
  FTamanho := '0';
end;

destructor TLookupSettings.Destroy;
begin
  inherited;
  FSQL.Free;
end;

procedure TLookupSettings.SetChave(const Value: String);
begin
  FChave := Trim(Value);
end;

procedure TLookupSettings.SetDescricao(const Value: String);
begin
  FDescricao := Trim(Value);
end;

procedure TLookupSettings.SetDisplay(const Value: String);
begin
  FDisplay := Trim(Value);
end;

procedure TLookupSettings.SetSQL(const Value: TStrings);
begin
  SQL.Assign(Value);
end;

procedure TLookupSettings.SetTamanho(const Value: String);
begin
  If Value = '' Then
     FTamanho := '0'
  Else
     FTamanho := Value;
end;

{ TRadioGroupSettings }

constructor TRadioGroupSettings.Create;
begin
  inherited;
  FItems := TstringList.Create;
  FValues := TstringList.Create;
  FColumns := 1;
  FItemIndex := -1;
  FHeight := 40;
end;

destructor TRadioGroupSettings.Destroy;
begin
  inherited;
  FItems.Free;
  FValues.Free;
end;

procedure TRadioGroupSettings.SetColumns(const Value: Integer);
begin
  FColumns := Value;
end;

procedure TRadioGroupSettings.SetHeight(const Value: Integer);
begin
  FHeight := Value;
end;

procedure TRadioGroupSettings.SetItemIndex(const Value: Integer);
begin
  FItemIndex := Value;
end;

procedure TRadioGroupSettings.SetItems(const Value: TStrings);
begin
  Items.Assign(Value);
end;

procedure TRadioGroupSettings.SetValues(const Value: TStrings);
begin
  Values.Assign(Value);
end;

{ TCheckBoxSetings }

constructor TCheckBoxSetings.Create;
begin
  inherited;
  FValueUnChecked := 'False';
  FValueChecked := 'True';
  FChecked := True;
end;

destructor TCheckBoxSetings.Destroy;
begin
  inherited;

end;

procedure TCheckBoxSetings.SetChecked(const Value: Boolean);
begin
  FChecked := Value;
end;

procedure TCheckBoxSetings.SetValueChecked(const Value: String);
begin
  FValueChecked := Value;
end;

procedure TCheckBoxSetings.SetValueUnChecked(const Value: String);
begin
  FValueUnChecked := Value;
end;

{ TCmParams }

constructor TCmParams.Create(Aowner: TComponent);
begin
  FOwner := Aowner;
  
  Inherited Create(TCMParamsItem);
  
end;

function TCmParams.GetOwner: TPersistent;
begin
  Result := FOwner;
end;




{ TPainelControles }

constructor TPainelControles.Create(AOwner :TCmParamReport; FormParam :TFrmCmParamReport ;sCaption, CampoBanco: String;pcontrole :TTipoControle;
  pTipodeDado :TTipoDado; LookupSettings :TLookupSettings; CheckBoxSetings :TCheckBoxSetings;
  RadioGroupSettings :TRadioGroupSettings; ComboBoxSettings :TComboBoxSettings;
  ListBoxSettings :TListBoxSettings; MaskEditSettings: TMaskEditSettings;
  SpinEditSettings: TSpinEditSettings; ProcuraSTSettings: TProcuraSTSettings;
  ProcuraFCSettings: TProcuraFCSettings; ProcuraCCSettings: TProcuraCCSettings;
  EditSettings: TEditSettings; MontaSelect: TMontaSelect;
  sDataBaseName:String; iIndice :Integer; ControlWidth: Integer);

Procedure CriaLabel;
Begin
   with TLabel.Create(FormParam) do
   begin
        Parent := fToolBar;
        Font.Style := [fsBold];
        Width := Trunc(COMPO_LABEL_WIDTH * AOwner.FatorResize);
        AutoSize := false;
        Caption := sCaption;
   end;
End;

Var
    sDisplay, sTamanho, sDescricao :String;
    Y:Integer;
begin
     inherited Create(AOwner);
     FControle := pcontrole;
     FTipodeDado := pTipodeDado;
     FIndice := iIndice;

     AllowDrag := false;
     Parent := TFrmCmParamReport(FormParam).SbFundo;
     fToolBar := TToolBar97.Create(FormParam);
     fToolBar.DockedTo := Self;
     fToolBar.BorderStyle := BsNone;

     with TToolBarSep97.Create(FormParam) do
     begin
          Blank := true;
          Parent := fToolBar;
     end;

     Case pcontrole of
         tcCheckBox:
         Begin
             fCtrlCheckBox := TCheckBox.Create(FormParam);
             with fCtrlCheckBox do
             begin
                  Parent := fToolBar;
                  Font.Style := [fsBold];

                  If (Not AOwner.ParamValues[iIndice].MostraComboCompara) And
                     (ControlWidth > 0) Then
                     Width := ControlWidth
                  ELse
                     Width := Trunc(COMPO_BIG_WIDTH * AOwner.FatorResize);

                  Caption := sCaption;
                  Checked := False;
                  Height := 21;
                  OnEnter := AOwner.ParamControlEnter;
                  OnExit := AOwner.ParamControlExit;
                  Checked :=  CheckBoxSetings.FChecked;
             end;
         End;
         tcComboBox:
         Begin
             CriaLabel;

             fCtrlComboBox := TComboBox.Create(FormParam);

             with  fCtrlComboBox do
             begin
                  Parent := fToolBar;
                  Font.Style := [fsBold];

                  If (Not AOwner.ParamValues[iIndice].MostraComboCompara) And
                     (ControlWidth > 0) Then
                     Width := ControlWidth
                  ELse
                     Width := Trunc(COMPO_SMALL_WIDTH * AOwner.FatorResize);

                  Text := '';
                  Sorted := ComboBoxSettings.Sorted;
                  Style := ComboBoxSettings.Style;
                  Items.Assign(ComboBoxSettings.Items);
                  DropDownCount := ComboBoxSettings.DropDownCount;
                  OnEnter := AOwner.ParamControlEnter;
                  OnExit := AOwner.ParamControlExit;
                  ItemIndex := ComboBoxSettings.ItemIndex;
             end;
         End;
         tcListBox:
         Begin
             CriaLabel;
             fCtrlListBox :=  TListBox.Create(FormParam);
             with fCtrlListBox do
             begin
                  Parent := fToolBar;
                  Font.Style := [fsBold];

                  If (Not AOwner.ParamValues[iIndice].MostraComboCompara) And
                     (ControlWidth > 0) Then
                     Width := ControlWidth
                  ELse
                     Width := Trunc(COMPO_SMALL_WIDTH * AOwner.FatorResize);

                  Sorted := ListBoxSettings.Sorted;
                  height := ListBoxSettings.height;
                  Style := ListBoxSettings.Style;
                  Items.Assign(ListBoxSettings.Items);
                  MultiSelect := ListBoxSettings.MultiSelect;
                  ExtendedSelect := ListBoxSettings.ExtendedSelect;
                  OnEnter := AOwner.ParamControlEnter;
                  OnExit := AOwner.ParamControlExit;
             end;
         End;
         tcRadioGroup:
         Begin
             fCtrlRadioGroup := TRadioGroup.Create(FormParam);
             with fCtrlRadioGroup do
             begin
                  Parent := fToolBar;
                  Font.Style := [fsBold];

                  If (Not AOwner.ParamValues[iIndice].MostraComboCompara) And
                     (ControlWidth > 0) Then
                     Width := ControlWidth
                  ELse
                     Width := Trunc(COMPO_BIG_WIDTH * AOwner.FatorResize);

                  Items.Assign(RadioGroupSettings.Items);
                  Caption := sCaption;
                  Columns := RadioGroupSettings.Columns;
                  ItemIndex := RadioGroupSettings.ItemIndex;
                  Height := RadioGroupSettings.Height;
                  OnEnter := AOwner.ParamControlEnter;
                  OnExit := AOwner.ParamControlExit;
             end;
         End;
         tcLookupCombo:
         Begin
             CriaLabel;
             fCtrlLookup := TCMDBLookupCombo.Create(FormParam);
             with  fCtrlLookup do
             begin
                  FCdsDisplay := TClientDataSet.Create(FormParam);
                  LookupTable := FCdsDisplay;
                  LookupField := LookupSettings.Chave;

                  sDisplay := LookupSettings.FDisplay;
                  sTamanho := LookupSettings.FTamanho;
                  sDescricao := LookupSettings.Descricao;

                  Repeat
                      If Pos('|',sDisplay) > 0 Then
                      Begin
                         Selected.Add( Copy(sDisplay,1,Pos('|',sDisplay) - 1) + #9 +
                                       Copy(sTamanho,1,Pos('|',sTamanho) - 1) +  #9 +
                                       Copy(sDescricao,1,Pos('|',sDescricao) - 1) +  #9 + 'F');

                         sDisplay := Copy(sDisplay,Pos('|',sDisplay) + 1, Length(sDisplay));
                         sTamanho := Copy(sTamanho,Pos('|',sTamanho) + 1, Length(sTamanho));
                         sDescricao := Copy(sDescricao,Pos('|',sDescricao) + 1, Length(sDescricao));
                      End
                      Else
                      Begin
                         Selected.Add( sDisplay + #9 +
                                       sTamanho +  #9 +
                                       sDescricao +  #9 + 'F');
                         sDisplay := '';
                      End;

                   until sDisplay = '';


                  Parent := fToolBar;
                  Font.Style := [fsBold];

                  If (Not AOwner.ParamValues[iIndice].MostraComboCompara) And
                     (ControlWidth > 0) Then
                     Width := ControlWidth
                  ELse
                     Width := Trunc(COMPO_SMALL_WIDTH * AOwner.FatorResize);

                  FCdsDisplay.Data := AOwner.GetaDataForComponentState(LookupSettings.SQL.Text);

                  OnEnter := AOwner.ParamControlEnter;
                  OnExit := AOwner.ParamControlExit;
             end;
         End;

         tcMaskEdit:
         Begin
             CriaLabel;

             FMaskEdit := TMaskEdit.Create(FormParam);
             with FMaskEdit do
             begin
                Parent := fToolBar;
                Font.Style := [fsBold];

                If (Not AOwner.ParamValues[iIndice].MostraComboCompara) And
                   (ControlWidth > 0) Then
                   Width := ControlWidth
                ELse
                   Width := Trunc((COMPO_SMALL_WIDTH - COMPO_COMBO_WIDTH - 6) * AOwner.FatorResize);

                MaxLength := MaskEditSettings.MaxLength;
                EditMask := MaskEditSettings.EditMask;

                OnEnter := AOwner.ParamControlEnter;
                OnExit := AOwner.ParamControlExit;
             end;
         End;
         tcSpinEdit:
         Begin
             CriaLabel;

             FComboCompara := TComboBox.Create(FormParam);
             FComboCompara.Width := Trunc(COMPO_COMBO_WIDTH * AOwner.FatorResize);
             FComboCompara.Parent := fToolBar;
             FComboCompara.Font.Style := [fsBold];

             If AOwner.ParamValues[iIndice].FMostraComboCompara Then
                with TToolBarSep97.Create(FormParam) do
                begin
                     Blank := true;
                     Parent := fToolBar;
                end;

             For Y:=0 To TamNumCompara Do
                 FComboCompara.Items.Add(ListaNumCompara[Y]);

             FSpinEdit := TwwDBSpinEdit.Create(FormParam);
             with FSpinEdit do
             begin
                Parent := fToolBar;
                Font.Style := [fsBold];

                If (Not AOwner.ParamValues[iIndice].MostraComboCompara) And
                   (ControlWidth > 0) Then
                   Width := ControlWidth
                ELse
                   Width := Trunc((COMPO_SMALL_WIDTH - COMPO_COMBO_WIDTH - 6) * AOwner.FatorResize);

                MaxValue := SpinEditSettings.MaxValue;
                MinValue := SpinEditSettings.MinValue;
                Value := SpinEditSettings.Value;
                Increment := SpinEditSettings.Increment;

                OnEnter := AOwner.ParamControlEnter;
                OnExit := AOwner.ParamControlExit;
             end;

             FComboCompara.ItemIndex := 0;
             FComboCompara.Visible :=  AOwner.ParamValues[iIndice].FMostraComboCompara;
         End;
         tcProcuraST:
         Begin
             

             FProcuraSubTipo := TCMProcuraSubTipo.Create(FormParam);
             with FProcuraSubTipo do
             begin
                Caption := sCaption;
                MontaSelect.ExibePergunta := False;
                FiltraSubTipo := ProcuraSTSettings.FiltraSubTipo;
                CampoEdit := ProcuraSTSettings.CampoEdit;
                SubTipo := ProcuraSTSettings.Subtipo;
                PermiteChaveEmBranco := True;
                MostraMensagens := False;
                Mensagens.EmBranco := sCaption + ' não pode estar em branco';
                Mensagens.NaoExiste := sCaption + ' não existe';

                If (ControlWidth > 0) Then
                   Width := ControlWidth
                ELse
                  Width := Trunc(COMPO_BIG_WIDTH * AOwner.FatorResize);


                
                Parent := fToolBar;
                OnEnter:= AOwner.ParamControlEnter;
                OnExit := AOwner.ParamControlExit;
             end;
         End;
         tcProcuraFC:
         Begin
             

             FProcuraForCli := TCMProcuraForCli.Create(FormParam);
             with FProcuraForCli do
             begin
                Caption := sCaption;
                ForCli := ProcuraFCSettings.ForCli;
                MontaSelect.ExibePergunta := False;
                MostraEndereco := ProcuraFCSettings.MostraEndereco;
                PermiteChaveEmBranco := True;
                CampoEdit := ProcuraFCSettings.CampoEdit;
                StatusForCli := ProcuraFCSettings.Status;
                MostraMensagens := False;
                Mensagens.EmBranco := sCaption + ' não pode estar em branco';
                Mensagens.NaoExiste := sCaption + ' não existe';

                If (ControlWidth > 0) Then
                   Width := ControlWidth
                ELse
                  Width := Trunc(COMPO_BIG_WIDTH * AOwner.FatorResize);

                
                Parent := fToolBar;
                OnEnter:= AOwner.ParamControlEnter;
                OnExit := AOwner.ParamControlExit;
             end;
         End;
         tcProcuraCC:
         Begin
             fProcuraMaskContabil := TCMProcuraMaskContabil.Create(FormParam);
             with fProcuraMaskContabil do
             begin
                Caption := sCaption;
                Plano := ProcuraCCSettings.Plano;
                Mascara := ProcuraCCSettings.Mascara;
                Status := ProcuraCCSettings.Status;
                AceitaTipoConta := ProcuraCCSettings.AceitaTipoConta;
                PermiteChaveEmBranco := True;
                MostraMensagens := False;
                Mensagens.EmBranco := sCaption + ' não pode estar em branco';
                Mensagens.NaoExiste := sCaption + ' não existe';
                Height := 70;

                If (ControlWidth > 0) Then
                   Width := ControlWidth
                ELse
                  Width := Trunc(COMPO_BIG_WIDTH * AOwner.FatorResize);


                Parent := fToolBar;
                OnEnter:= AOwner.ParamControlEnter;
                OnExit := AOwner.ParamControlExit;
             end;
         End;
         tcMontaSelect:
         Begin
             CriaLabel;
             _MsPainel := MontaSelect;

             fCtrlEditMs := TEdit.Create(FormParam);
             with fCtrlEditMs do
             begin
                  Parent := fToolBar;
                  Color := EditSettings.Color;
                  Font := EditSettings.Font;
                  ReadOnly := True;

                  If (Not AOwner.ParamValues[iIndice].MostraComboCompara) And
                     (ControlWidth > 0) Then
                     Width := ControlWidth - 23
                  ELse
                     Width := Trunc(COMPO_SMALL_WIDTH * AOwner.FatorResize) - 23;

                  Text := '';
                  OnEnter := AOwner.ParamControlEnter;
                  OnExit := AOwner.ParamControlExit;

                  Text := TCMParamsItem(AOwner.Params.Items[iIndice]).FTextDefault;
             end;

             with  TButton.Create (FormParam) do
             begin
                  Width := 23;
                  height := 22;
                  Parent := fToolBar;
                  Font := EditSettings.Font;
                  Caption := '...';
                  OnClick := OnClickMS;
             End;
         End;
         tcMemo:
         Begin
            CriaLabel;

             fCtrlMemo := TMemo.Create(FormParam);
             with fCtrlMemo do
             begin
                ScrollBars := ssVertical;
                Height := 110;

                If (ControlWidth > 0) Then
                   Width := ControlWidth
                ELse
                   Width := Trunc(COMPO_SMALL_WIDTH * AOwner.FatorResize);

                Parent := fToolBar;
                OnEnter:= AOwner.ParamControlEnter;
                OnExit := AOwner.ParamControlExit;
             end;
         End
         Else
         Begin
             CriaLabel;

             FComboCompara := TComboBox.Create(FormParam);
             FComboCompara.Width := Trunc(COMPO_COMBO_WIDTH * AOwner.FatorResize);
             FComboCompara.Parent := fToolBar;
             FComboCompara.Font.Style := [fsBold];

             If AOwner.ParamValues[iIndice].FMostraComboCompara Then
                with TToolBarSep97.Create(FormParam) do
                begin
                     Blank := true;
                     Parent := fToolBar;
                end;

             Case pTipodeDado of
             tdReal, tdInteger:
             Begin
                 For Y:=0 To TamNumCompara Do
                     FComboCompara.Items.Add(ListaNumCompara[Y]);

                 fCtrlRealEdit := TRealEdit.Create(FormParam);
                 with fCtrlRealEdit do
                 begin

                    Parent := fToolBar;
                    Color := EditSettings.Color;
                    Font := EditSettings.Font;
                    ReadOnly := EditSettings.ReadOnly;
                    Signal := True;

                    If (Not AOwner.ParamValues[iIndice].MostraComboCompara) And
                      (ControlWidth > 0) Then
                      Width := ControlWidth
                    ELse
                      Width := Trunc((COMPO_SMALL_WIDTH - COMPO_COMBO_WIDTH - 6) * AOwner.FatorResize);

                    If pTipodeDado = tdReal Then
                    Begin
                       NumberFormat := fNumber;

                       If TCMParamsItem(AOwner.Params.Items[iIndice]).FTextDefault <> '' Then
                          Value := StrToFloatCM(TCMParamsItem(AOwner.Params.Items[iIndice]).FTextDefault);
                    End
                    Else
                    Begin
                       NumberFormat := iNumber;

                       If TCMParamsItem(AOwner.Params.Items[iIndice]).FTextDefault <> '' Then
                          Value := StrToInt(TCMParamsItem(AOwner.Params.Items[iIndice]).FTextDefault);
                    End;

                    OnEnter := AOwner.ParamControlEnter;
                    OnExit := AOwner.ParamControlExit;

                 end;
             End;
             tdDate:
             Begin
                 For Y:=0 To TamNumCompara Do
                     FComboCompara.Items.Add(ListaNumCompara[Y]);

                 fCtrlDateTimePicker := TCMDateTimePicker.Create(FormParam);
                 with fCtrlDateTimePicker do
                 begin
                      Parent := fToolBar;
                      Color := EditSettings.Color;
                      Font := EditSettings.Font;
                      ReadOnly := EditSettings.ReadOnly;

                      If (Not AOwner.ParamValues[iIndice].MostraComboCompara) And
                         (ControlWidth > 0) Then
                         Width := ControlWidth
                      ELse
                         Width := Trunc((COMPO_SMALL_WIDTH - COMPO_COMBO_WIDTH - 6) * AOwner.FatorResize);

                      OnEnter := AOwner.ParamControlEnter;
                      OnExit := AOwner.ParamControlExit;

                       If TCMParamsItem(AOwner.Params.Items[iIndice]).FTextDefault <> '' Then
                          Date := StrToDate(TCMParamsItem(AOwner.Params.Items[iIndice]).FTextDefault);
                 end;
             End
             Else
             Begin
                 For Y:=0 To TamTextoCompara Do
                     FComboCompara.Items.Add(ListaTextoCompara[Y]);

                 fCtrlEditt := TEdit.Create(FormParam);
                 with fCtrlEditt do
                 begin
                      Parent := fToolBar;
                      Color := EditSettings.Color;
                      Font := EditSettings.Font;                      
                      ReadOnly := EditSettings.ReadOnly;

                      If (Not AOwner.ParamValues[iIndice].MostraComboCompara) And
                         (ControlWidth > 0) Then
                         Width := ControlWidth
                      ELse
                         Width := Trunc((COMPO_SMALL_WIDTH - COMPO_COMBO_WIDTH - 6) * AOwner.FatorResize);
                         
                      Text := '';
                      OnEnter := AOwner.ParamControlEnter;
                      OnExit := AOwner.ParamControlExit;

                      Text := TCMParamsItem(AOwner.Params.Items[iIndice]).FTextDefault;
                 end;
             End;
             End;

             FComboCompara.ItemIndex := 0;
             FComboCompara.Visible :=  AOwner.ParamValues[iIndice].FMostraComboCompara;
         End;
     End;

     with TToolBarSep97.Create(FormParam) do
     begin
          Blank := true;
          Parent := fToolBar;
     end;
end;

destructor TPainelControles.Destroy;
Var
  X :Integer;
begin
  If FCdsDisplay <> nil Then
     FCdsDisplay.Free;

  for X := fToolBar.ComponentCount-1 Downto 0 do
     fToolBar.Components[X].free;

  for X := ComponentCount-1 DownTo 0 do
      Components[X].free;

  for X := fToolBar.ControlCount -1 Downto 0 do
      fToolBar.Controls[X].free;

  for X := ControlCount - 1 DownTo 0 do
      Controls[X].free;

  inherited Destroy;  
end;

procedure TPainelControles.OnClickMS(Sender: TObject);
begin
   If Not (csDesigning In Self.ComponentState) Then
   Begin
      If (_MsPainel.Executar = MrOk ) Then
         CtrlEditMs.Text := _MsPainel.ValoresChave[0]
      Else
         CtrlEditMs.Text := '';
   End;
end;

procedure TPainelControles.SetCdsDisplay(const Value: TClientDataSet);
begin
  FCdsDisplay := Value;
end;

procedure TPainelControles.SetComboCompara(const Value: TComboBox);
begin
  FComboCompara := Value;
end;

procedure TPainelControles.SetControle(const Value: TTipoControle);
begin
  FControle := Value;
end;

procedure TPainelControles.SetIndice(const Value: Integer);
begin
  FIndice := Value;
end;

procedure TPainelControles.SetMaskEdit(const Value: TMaskEdit);
begin
  FMaskEdit := Value;
end;

procedure TPainelControles.SetSpinEdit(const Value: TwwDBSpinEdit);
begin
  FSpinEdit := Value;
end;

procedure TPainelControles.SetTipodeDado(const Value: TTipoDado);
begin
  FTipodeDado := Value;
end;

{ TComboBoxSettings }

constructor TComboBoxSettings.Create;
begin
  FItems := TStringList.Create;
  FDropDownCount := 8;
  FSorted := False;
  FStyle := csDropDownList;
  FItemIndex := -1;
end;

destructor TComboBoxSettings.Destroy;
begin
  FItems.Free;
  inherited;
end;

procedure TComboBoxSettings.SetDropDownCount(const Value: Integer);
begin
  FDropDownCount := Value;
end;

procedure TComboBoxSettings.SetItemIndex(const Value: Integer);
begin
  FItemIndex := Value;
end;

procedure TComboBoxSettings.SetItems(const Value: TStrings);
begin
  Items.Assign(Value);
end;

procedure TComboBoxSettings.SetSorted(const Value: Boolean);
begin
  FSorted := Value;
end;

procedure TComboBoxSettings.SetStyle(const Value: TComboBoxStyle);
begin
  FStyle := Value;
end;

{ TListBoxSettings }

constructor TListBoxSettings.Create;
begin
  FItems := TStringList.Create;
  FExtendedSelect := False;
  FMultiSelect := False;
  FSorted := False;
  FStyle := lbStandard;
  Fheight := 70;
end;

destructor TListBoxSettings.Destroy;
begin
  inherited;
  FItems.Free;
end;

procedure TListBoxSettings.SetExtendedSelect(const Value: Boolean);
begin
  FExtendedSelect := Value;
end;

procedure TListBoxSettings.Setheight(const Value: Integer);
begin
  Fheight := Value;
end;

procedure TListBoxSettings.SetItems(const Value: TStrings);
begin
  Items.Assign(Value);
end;

procedure TListBoxSettings.SetMultiSelect(const Value: Boolean);
begin
  FMultiSelect := Value;
end;

procedure TListBoxSettings.SetSorted(const Value: Boolean);
begin
  FSorted := Value;
end;

procedure TListBoxSettings.SetStyle(const Value: TListBoxStyle);
begin
  FStyle := Value;
end;


{ TMaskEditSettings }

constructor TMaskEditSettings.Create;
begin
  FMaxLength := 0;
  FEditMask := '';
end;

destructor TMaskEditSettings.Destroy;
begin
  inherited;

end;

procedure TMaskEditSettings.SetEditMask(const Value: String);
begin
  FEditMask := Value;
end;

procedure TMaskEditSettings.SetMaxLength(const Value: Integer);
begin
  FMaxLength := Value;
end;

{ TSpinEditSettings }

constructor TSpinEditSettings.Create;
begin
  FIncrement := 0;
  FValue := 0;
  FMaxValue := 0;
  FMinValue := 0;
end;

destructor TSpinEditSettings.Destroy;
begin
  inherited;

end;

procedure TSpinEditSettings.SetIncrement(const Value: Integer);
begin
  FIncrement := Value;
end;

procedure TSpinEditSettings.SetMaxValue(const Value: Integer);
begin
  FMaxValue := Value;
end;

procedure TSpinEditSettings.SetMinValue(const Value: Integer);
begin
  FMinValue := Value;
end;

procedure TSpinEditSettings.SetValue(const Value: Integer);
begin
  FValue := Value;
end;

{ TProcuraFCSettings }

constructor TProcuraFCSettings.Create;
begin
   FMostraEndereco := False;
   FCampoEdit := ceRazaoSocial;
   FStatus := fcAll;
   fForCli := fcFornecedor;
end;

destructor TProcuraFCSettings.Destroy;
begin
  inherited;

end;

procedure TProcuraFCSettings.SetCampoEdit(const Value: TCampoEdit);
begin
  FCampoEdit := Value;
end;

procedure TProcuraFCSettings.SetForCli(const Value: TForCli);
begin
  FForCli := Value;
end;

procedure TProcuraFCSettings.SetMostraEndereco(const Value: Boolean);
begin
  FMostraEndereco := Value;
end;

procedure TProcuraFCSettings.SetStatus(const Value: TStatusForCli);
begin
  FStatus := Value;
end;

{ TProcuraSTSettings }

constructor TProcuraSTSettings.Create;
begin
    FFiltraSubTipo := True;
    FCampoEdit := ceRazaoSocial;
    FSubtipo := stFornecedor;
end;

destructor TProcuraSTSettings.Destroy;
begin
  inherited;

end;

procedure TProcuraSTSettings.SetCampoEdit(const Value: TCampoEdit);
begin
  FCampoEdit := Value;
end;

procedure TProcuraSTSettings.SetFiltraSubTipo(const Value: Boolean);
begin
  FFiltraSubTipo := Value;
end;

procedure TProcuraSTSettings.SetSubtipo(const Value: TSubTipo);
begin
  FSubtipo := Value;
end;

{ TProcuraCCSettings }

constructor TProcuraCCSettings.Create;
begin
    FPlano := 0;
    FMascara := '';
    FStatus := scSoAtiva;
    FAceitaTipoConta := Indiferente;
end;

destructor TProcuraCCSettings.Destroy;
begin
  inherited;

end;

procedure TProcuraCCSettings.SetAceitaTipoConta(const Value: TTipoConta);
begin
  FAceitaTipoConta := Value;
end;

procedure TProcuraCCSettings.SetMascara(const Value: String);
begin
  FMascara := Value;
end;

procedure TProcuraCCSettings.SetPlano(const Value: Integer);
begin
  FPlano := Value;
end;

procedure TProcuraCCSettings.SetStatus(const Value: TStatusConta);
begin
  FStatus := Value;
end;

{ TEditSettings }

constructor TEditSettings.Create;
begin
  FReadonly := False;
  FColor := clWindow;
  FFont := tfont.Create;
  Font.Style := [fsBold];  
end;

destructor TEditSettings.Destroy;
begin
  FFont.Free;
  inherited;
end;

procedure TEditSettings.SetColor(const Value: TColor);
begin
  FColor := Value;
end;

procedure TEditSettings.SetFont(const Value: TFont);
begin
  FFont := Value;
end;

procedure TEditSettings.SetReadonly(const Value: Boolean);
begin
  FReadonly := Value;
end;

end.
