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
unit CmEventosCadastro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, db, uCMTypes;

type
  TAcceptEvent = procedure (sender :TObject; Var Accept :Boolean) of object;
  TAbortConfirma = procedure (sender :TObject; OrigemAbortConfirma: TOrigemAbortConfirma) of object;

  TCmEventosCadastro = class(TComponent)
  private
    _DataLink: TDataLink;
    FOnInsert: TNotifyEvent;
    FOnFind: TNotifyEvent;
    FOnDelete: TNotifyEvent;
    FOnEdit: TNotifyEvent;
    FOnConfirma: TNotifyEvent;
    FOnCancel: TNotifyEvent;
    FBeforeConfirma: TAcceptEvent;
    FRepetirInsert: Boolean;
    FOperacao: TOperacao;
    FOnAtualizaBotoes: TNotifyEvent;
    FOnCloseDataSet: TNotifyEvent;
    FOnOpenDataSet: TNotifyEvent;
    FConfirmaCadastro: Boolean;
    FOpenDsAutomatico: Boolean;
    FApplyEdit: TAcceptEvent;
    FApplyInsert: TAcceptEvent;
    FApplyDelete: TAcceptEvent;
    FOnAbortConfirma: TAbortConfirma;
    FAfterConfirma: TNotifyEvent;
    procedure SetOnInsert(const Value: TNotifyEvent);
    procedure SetOnDelete(const Value: TNotifyEvent);
    procedure SetOnFind(const Value: TNotifyEvent);
    procedure SetOnEdit(const Value: TNotifyEvent);
    procedure SetOnCancel(const Value: TNotifyEvent);
    procedure SetOnConfirma(const Value: TNotifyEvent);
    procedure SetBeforeConfirma(const Value: TAcceptEvent);
    procedure SetOperacao(const Value: TOperacao);
    procedure SetRepetirInsert(const Value: Boolean);
    procedure SetOnAtualizaBotoes(const Value: TNotifyEvent);

    procedure DoBeforeConfirma(sender: TObject; Var Accept :Boolean);
    procedure DoAfterConfirma(sender: TObject);
    procedure AbortConfirma(sender :TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure DoApplyInsert(sender :TObject; Var Accept :Boolean);
    procedure DoApplyEdit(sender :TObject; Var Accept :Boolean);
    procedure DoApplyDelete(sender :TObject; Var Accept :Boolean);

    procedure SetOnCloseDataSet(const Value: TNotifyEvent);
    procedure SetOnOpenDataSet(const Value: TNotifyEvent);
    function GetDataSource: TDataSource;
    procedure SeTDataSource(const Value: TDataSource);
    procedure SetConfirmaCadastro(const Value: Boolean);
    procedure SetOpenDsAutomatico(const Value: Boolean);
    procedure SetApplyDelete(const Value: TAcceptEvent);
    procedure SetApplyEdit(const Value: TAcceptEvent);
    procedure SetApplyInsert(const Value: TAcceptEvent);
    procedure SetOnAbortConfirma(const Value: TAbortConfirma);
    procedure SetAfterConfirma(const Value: TNotifyEvent);

  protected

  public
    Constructor Create(Aowner :TComponent); Override;
    Destructor Destroy; Override;

    procedure Insert(Sender :TObject);
    procedure Delete(Sender :TObject);
    procedure Edit(Sender :TObject);
    procedure Find(Sender :TObject);
    procedure Cancel(Sender :TObject);
    procedure Confirma(Sender :TObject);
    procedure AtualizaBotoes(Sender :TObject);
    procedure OpenDataSet(Sender :TObject);
    procedure CloseDataSet(Sender :TObject);

    Property ConfirmaCadastro :Boolean read FConfirmaCadastro write SetConfirmaCadastro;

    procedure OpenDataSetByTag;
  published
    property Operacao :TOperacao read FOperacao write SetOperacao;
    property RepetirInsert :Boolean read FRepetirInsert write SetRepetirInsert;
    property OnInsert :TNotifyEvent read FOnInsert write SetOnInsert;
    property OnDelete :TNotifyEvent read FOnDelete write SetOnDelete;
    property OnEdit :TNotifyEvent read FOnEdit write SetOnEdit;
    property OnFind :TNotifyEvent read FOnFind write SetOnFind;
    property OnCancel :TNotifyEvent read FOnCancel write SetOnCancel;
    property OnConfirma :TNotifyEvent read FOnConfirma write SetOnConfirma;
    property OnAtualizaBotoes :TNotifyEvent read FOnAtualizaBotoes write SetOnAtualizaBotoes;
    property OnOpenDataSet :TNotifyEvent read FOnOpenDataSet write SetOnOpenDataSet;
    property OnCloseDataSet :TNotifyEvent read FOnCloseDataSet write SetOnCloseDataSet;
    property DataSource :TDataSource read GetDataSource write SeTDataSource;
    property OpenDsAutomatico :Boolean read FOpenDsAutomatico write SetOpenDsAutomatico;
    property BeforeConfirma :TAcceptEvent read FBeforeConfirma write SetBeforeConfirma;
    property ApplyInsert: TAcceptEvent read FApplyInsert write SetApplyInsert;
    property ApplyEdit: TAcceptEvent read FApplyEdit write SetApplyEdit;
    property ApplyDelete: TAcceptEvent read FApplyDelete write SetApplyDelete;
    property OnAbortConfirma: TAbortConfirma read FOnAbortConfirma write SetOnAbortConfirma;
    property AfterConfirma: TNotifyEvent read FAfterConfirma write SetAfterConfirma;
  end;


implementation

{ TCmEventosCadastro }

procedure TCmEventosCadastro.Cancel(Sender: TObject);
begin
  If Assigned(OnCancel) then OnCancel(Sender);
end;

procedure TCmEventosCadastro.confirma(Sender: TObject);
Var Accept :Boolean;
begin
   Accept := True;

   DoBeforeConfirma(Sender,Accept);

   If Accept Then
   Begin
     Case FOperacao Of
       opInserir: DoApplyInsert(Sender,Accept);
       opAlterar: DoApplyEdit(Sender,Accept);
       opApagar: DoApplyDelete(Sender,Accept);
     End;
   End
   Else
     AbortConfirma(sender, OaBeforeConfirma);

   FConfirmaCadastro := Accept;

   if Accept then
   begin
    if Assigned(OnConfirma) then OnConfirma(Sender);
    DoAfterConfirma(Sender);
   end;
end;

constructor TCmEventosCadastro.Create(Aowner :TComponent);
begin
  inherited;
  FConfirmaCadastro := True;
  _DataLink := TDataLink.Create;
  fRepetirInsert := True;
  fOperacao := opVazio;
  FOpenDsAutomatico := False;
end;

procedure TCmEventosCadastro.Delete(Sender: TObject);
begin
   If Assigned(OnDelete) then OnDelete(Sender);
end;

procedure TCmEventosCadastro.DoBeforeConfirma(sender: TObject;
  Var Accept: Boolean);
begin
  If fOperacao In [OpInserir, OpAlterar] Then
     If Assigned(BeforeConfirma) then BeforeConfirma(Sender,Accept);
end;

procedure TCmEventosCadastro.find(Sender: TObject);
begin
  If Assigned(Onfind) then Onfind(Sender);
end;

procedure TCmEventosCadastro.Insert(Sender: TObject);
begin
  If Assigned(OnInsert) then OnInsert(Sender);
end;

procedure TCmEventosCadastro.OpenDataSetByTag;
var i:integer;
begin
  i := 0;
  while (i < owner.ComponentCount) do begin
       if (owner.Components[i] Is TDataSet) and
          (owner.Components[i].Tag = 5) then
          TDataSet(owner.Components[i]).Open;
       Inc(i);
  end;
end;

procedure TCmEventosCadastro.SetBeforeConfirma(
  const Value: TAcceptEvent);
begin
  FBeforeConfirma := Value;
end;

procedure TCmEventosCadastro.SetOnAtualizaBotoes(
  const Value: TNotifyEvent);
begin
  FOnAtualizaBotoes := Value;
end;

procedure TCmEventosCadastro.SetOnCancel(const Value: TNotifyEvent);
begin
  FOnCancel := Value;
end;

procedure TCmEventosCadastro.SetOnConfirma(const Value: TNotifyEvent);
begin
  FOnConfirma := Value;
end;

procedure TCmEventosCadastro.SetOnDelete(const Value: TNotifyEvent);
begin
  FOnDelete := Value;
end;

procedure TCmEventosCadastro.SetOnFind(const Value: TNotifyEvent);
begin
  FOnFind := Value;
end;

procedure TCmEventosCadastro.SetOnInsert(const Value: TNotifyEvent);
begin
  FOnInsert := Value;
end;

procedure TCmEventosCadastro.SetOnEdit(const Value: TNotifyEvent);
begin
  FOnEdit := Value;
end;

procedure TCmEventosCadastro.SetOperacao(const Value: TOperacao);
begin
  FOperacao := Value;
end;

procedure TCmEventosCadastro.SetRepetirInsert(const Value: Boolean);
begin
  FRepetirInsert := Value;
end;

procedure TCmEventosCadastro.Edit(Sender: TObject);
begin
  If Assigned(OnEdit) then OnEdit(Sender);
end;

procedure TCmEventosCadastro.AtualizaBotoes(Sender :TObject);
begin
  If Assigned(OnAtualizaBotoes) then OnAtualizaBotoes(Sender);
end;

procedure TCmEventosCadastro.SetOnCloseDataSet(const Value: TNotifyEvent);
begin
  FOnCloseDataSet := Value;
end;

procedure TCmEventosCadastro.SetOnOpenDataSet(const Value: TNotifyEvent);
begin
  FOnOpenDataSet := Value;
end;

procedure TCmEventosCadastro.CloseDataSet(Sender: TObject);
begin
  If _DataLink.DataSet <> nil Then _DataLink.DataSet.Close;
  If Assigned(OnCloseDataSet) then OnCloseDataSet(Sender);
end;

procedure TCmEventosCadastro.OpenDataSet(Sender: TObject);
begin
  If _DataLink.DataSet <> nil Then _DataLink.DataSet.Open;
  If Assigned(OnOpenDataSet) then OnOpenDataSet(Sender);
end;

function TCmEventosCadastro.GetDataSource: TDataSource;
begin
  Result := _DataLink.DataSource;
end;

procedure TCmEventosCadastro.SeTDataSource(const Value: TDataSource);
begin
  _DataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

destructor TCmEventosCadastro.Destroy;
begin
  _DataLink.Free;
  inherited;
end;

procedure TCmEventosCadastro.SetConfirmaCadastro(const Value: Boolean);
begin
  FConfirmaCadastro := Value;
end;

procedure TCmEventosCadastro.SetOpenDsAutomatico(const Value: Boolean);
begin
  FOpenDsAutomatico := Value;
end;

procedure TCmEventosCadastro.SetApplyDelete(const Value: TAcceptEvent);
begin
  FApplyDelete := Value;
end;

procedure TCmEventosCadastro.SetApplyEdit(const Value: TAcceptEvent);
begin
  FApplyEdit := Value;
end;

procedure TCmEventosCadastro.SetApplyInsert(const Value: TAcceptEvent);
begin
  FApplyInsert := Value;
end;

procedure TCmEventosCadastro.DoApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  If Assigned(ApplyDelete) then ApplyDelete(Sender,Accept);

  If Not Accept Then
     AbortConfirma(sender, OaApplyDelete);
end;

procedure TCmEventosCadastro.DoApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  If Assigned(ApplyEdit) then ApplyEdit(Sender,Accept);

  If Not Accept Then
     AbortConfirma(sender, OaApplyEdit);
end;

procedure TCmEventosCadastro.DoApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  If Assigned(ApplyInsert) then ApplyInsert(Sender,Accept);

  If Not Accept Then
     AbortConfirma(sender, OaApplyInsert);
end;

procedure TCmEventosCadastro.AbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  If Assigned(OnAbortConfirma) then OnAbortConfirma(Sender,OrigemAbortConfirma);
end;

procedure TCmEventosCadastro.SetOnAbortConfirma(
  const Value: TAbortConfirma);
begin
  FOnAbortConfirma := Value;
end;

procedure TCmEventosCadastro.SetAfterConfirma(const Value: TNotifyEvent);
begin
  FAfterConfirma := Value;
end;

procedure TCmEventosCadastro.DoAfterConfirma(sender: TObject);
begin
  If (fOperacao In [OpInserir, OpAlterar]) And
     Assigned(FAfterConfirma) Then AfterConfirma(Self);
end;

end.
