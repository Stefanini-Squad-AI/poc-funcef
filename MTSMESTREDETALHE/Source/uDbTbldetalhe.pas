{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 28/11/2002                             }
{                                                       }
{*******************************************************}

unit uDbTbldetalhe;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTbldetalhe = class(TCmDbObject)

  private
    FVlrdetalhe: TCmDbField;
    FIdtbldetalhe: TCmDbField;
    FIdtblmestre: TCmDbField;
    FDesctbldetalhe: TCmDbField;
    procedure SetDesctbldetalhe(const Value: TCmDbField);
    procedure SetIdtbldetalhe(const Value: TCmDbField);
    procedure SetIdtblmestre(const Value: TCmDbField);
    procedure SetVlrdetalhe(const Value: TCmDbField);

  public

     Property Vlrdetalhe: TCmDbField read FVlrdetalhe write SetVlrdetalhe;
     Property Idtblmestre: TCmDbField read FIdtblmestre write SetIdtblmestre;
     Property Idtbldetalhe: TCmDbField read FIdtbldetalhe write SetIdtbldetalhe;
     Property Desctbldetalhe: TCmDbField read FDesctbldetalhe write SetDesctbldetalhe;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTbldetalhe }

constructor TDbTbldetalhe.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TBLDETALHE';

  fVlrdetalhe := CreateCmDbField('VLRDETALHE',ftfloat,False,False,False,True,'');
  fIdtblmestre := CreateCmDbField('IDTBLMESTRE',ftfloat,False,False,False,True,'');
  fIdtbldetalhe := CreateCmDbField('IDTBLDETALHE',ftfloat,True,True,False,True,'');
  fDesctbldetalhe := CreateCmDbField('DESCTBLDETALHE',ftString,False,False,False,True,'');
end;

function TDbTbldetalhe.Insert: Boolean;
begin
  fIdtbldetalhe.AsFloat := GetSequence(TableName);
  Result := Inherited Insert;
end;

procedure TDbTbldetalhe.SetDesctbldetalhe(const Value: TCmDbField);
begin
  FDesctbldetalhe := Value;
end;

procedure TDbTbldetalhe.SetIdtbldetalhe(const Value: TCmDbField);
begin
  FIdtbldetalhe := Value;
end;

procedure TDbTbldetalhe.SetIdtblmestre(const Value: TCmDbField);
begin
  FIdtblmestre := Value;
end;

procedure TDbTbldetalhe.SetVlrdetalhe(const Value: TCmDbField);
begin
  FVlrdetalhe := Value;
end;

end.



