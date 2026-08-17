{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 01/09/2006                             }
{                                                       }
{*******************************************************}

unit uDbCpativo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCpativo = class(TCmDbObject)

  private
    FNome: TCmDbField;
    FDescricao: TCmDbField;
    FIdcpativo: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdpatro: TCmDbField;
    FIdregra: TCmDbField;
    FDtabert: TCmDbField;
    FVlabert: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdcpativo(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdregra(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetDtabert(const Value: TCmDbField);
    procedure SetVlabert(const Value: TCmDbField);

  public

     Property Nome: TCmDbField read FNome write SetNome;
     Property Idregra: TCmDbField read FIdregra write SetIdregra;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idcpativo: TCmDbField read FIdcpativo write SetIdcpativo;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Dtabert: TCmDbField read FDtabert write SetDtabert;
     Property Vlabert: TCmDbField read FVlabert write SetVlabert;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCpativo }

constructor TDbCpativo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CPATIVO';

   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   fIdregra := CreateCmDbField('IDREGRA',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdcpativo := CreateCmDbField('IDCPATIVO',ftfloat,True,True,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fDtabert := CreateCmDbField('DTABERT',ftDateTime,False,False,False,True,'');
   fVlabert := CreateCmDbField('VLABERT',ftfloat,False,False,False,False,'');
end;

function TDbCpativo.Insert: Boolean;
begin
   fIdcpativo.AsFloat:= GetSequence('CPATIVO');
   Result := Inherited Insert;

end;


procedure TDbCpativo.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbCpativo.SetDtabert(const Value: TCmDbField);
begin
  FDtabert := Value;
end;

procedure TDbCpativo.SetIdcpativo(const Value: TCmDbField);
begin
  FIdcpativo := Value;
end;

procedure TDbCpativo.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbCpativo.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbCpativo.SetIdregra(const Value: TCmDbField);
begin
  FIdregra := Value;
end;

procedure TDbCpativo.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbCpativo.SetVlabert(const Value: TCmDbField);
begin
  FVlabert := Value;
end;

end.



