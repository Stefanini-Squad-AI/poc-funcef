{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: IGOR                            }
{ Atualizado Em: 26/11/2001                             }
{                                                       }
{*******************************************************}

unit uDbRadAutorizacao;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbRadAutorizacao = class(TCmDbObject)

  private
    FObsAutoriza: TCmDbField;
    FDataAutorizacao: TCmDbField;
    FIdEtapa: TCmDbField;
    FFlgStatus: TCmDbField;
    FIdAutorizacao: TCmDbField;
    FIdProcesso: TCmDbField;
    FIdUsuario: TCmDbField;
    procedure SetDataAutorizacao(const Value: TCmDbField);
    procedure SetFlgStatus(const Value: TCmDbField);
    procedure SetIdAutorizacao(const Value: TCmDbField);
    procedure SetIdEtapa(const Value: TCmDbField);
    procedure SetIdProcesso(const Value: TCmDbField);
    procedure SetIdUsuario(const Value: TCmDbField);
    procedure SetObsAutoriza(const Value: TCmDbField);

  public

     Property ObsAutoriza     : TCmDbField read FObsAutoriza write SetObsAutoriza;
     Property IdUsuario       : TCmDbField read FIdUsuario write SetIdUsuario;
     Property IdProcesso      : TCmDbField read FIdProcesso write SetIdProcesso;
     Property IdEtapa         : TCmDbField read FIdEtapa write SetIdEtapa;
     Property IdAutorizacao   : TCmDbField read FIdAutorizacao write SetIdAutorizacao;
     Property FlgStatus       : TCmDbField read FFlgStatus write SetFlgStatus;
     Property DataAutorizacao : TCmDbField read FDataAutorizacao write SetDataAutorizacao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbRadautorizacao }

constructor TDbRadautorizacao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADAUTORIZACAO';

   fObsautoriza     := CreateCmDbField('OBSAUTORIZA'    ,ftString  ,False,False,False,True);
   fIdusuario       := CreateCmDbField('IDUSUARIO'      ,ftfloat   ,False,False,False,True);
   fIdprocesso      := CreateCmDbField('IDPROCESSO'     ,ftfloat   ,False,False,False,True);
   fIdetapa         := CreateCmDbField('IDETAPA'        ,ftfloat   ,False,False,False,True);
   fIdautorizacao   := CreateCmDbField('IDAUTORIZACAO'  ,ftfloat   ,True,True,False,True);
   fFlgstatus       := CreateCmDbField('FLGSTATUS'      ,ftString  ,False,False,False,True);
   fDataautorizacao := CreateCmDbField('DATAAUTORIZACAO',ftDateTime,False,False,False,True);
end;

function TDbRadautorizacao.Insert: Boolean;
begin

   fIdAutorizacao.AsFloat := GetSequence('RADAUTORIZACAO');
   Result := Inherited Insert;

end;

function TDbRadautorizacao.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbRadautorizacao.SetDataAutorizacao(const Value: TCmDbField);
begin
  FDataAutorizacao := Value;
end;

procedure TDbRadautorizacao.SetFlgStatus(const Value: TCmDbField);
begin
  FFlgStatus := Value;
end;

procedure TDbRadautorizacao.SetIdAutorizacao(const Value: TCmDbField);
begin
  FIdAutorizacao := Value;
end;

procedure TDbRadautorizacao.SetIdEtapa(const Value: TCmDbField);
begin
  FIdEtapa := Value;
end;

procedure TDbRadautorizacao.SetIdProcesso(const Value: TCmDbField);
begin
  FIdProcesso := Value;
end;

procedure TDbRadautorizacao.SetIdUsuario(const Value: TCmDbField);
begin
  FIdUsuario := Value;
end;

procedure TDbRadautorizacao.SetObsAutoriza(const Value: TCmDbField);
begin
  FObsAutoriza := Value;
end;

end.



