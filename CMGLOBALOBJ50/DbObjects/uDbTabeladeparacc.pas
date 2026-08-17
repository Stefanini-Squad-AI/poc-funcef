{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/11/2003                             }
{                                                       }
{*******************************************************}

unit uDbTabeladeparacc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTabeladeparacc = class(TCmDbObject)

  private
    FIdtabeladeparacc: TCmDbField;
    FNometabela: TCmDbField;
    FNomecampoempresa: TCmDbField;
    FNomecampodata: TCmDbField;
    procedure SetIdtabeladeparacc(const Value: TCmDbField);
    procedure SetNomecampodata(const Value: TCmDbField);
    procedure SetNomecampoempresa(const Value: TCmDbField);
    procedure SetNometabela(const Value: TCmDbField);

  public

     Property Nometabela: TCmDbField read FNometabela write SetNometabela;
     Property Nomecampoempresa: TCmDbField read FNomecampoempresa write SetNomecampoempresa;
     Property Nomecampodata: TCmDbField read FNomecampodata write SetNomecampodata;
     Property Idtabeladeparacc: TCmDbField read FIdtabeladeparacc write SetIdtabeladeparacc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTabeladeparacc }

constructor TDbTabeladeparacc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TABELADEPARACC';

   fNometabela := CreateCmDbField('NOMETABELA',ftString,False,False,False,True,'');
   fNomecampoempresa := CreateCmDbField('NOMECAMPOEMPRESA',ftString,False,False,False,True,'');
   fNomecampodata := CreateCmDbField('NOMECAMPODATA',ftString,False,False,False,True,'');
   fIdtabeladeparacc := CreateCmDbField('IDTABELADEPARACC',ftfloat,True,False,False,True,'');
end;

function TDbTabeladeparacc.Insert: Boolean;
begin
   fIdtabeladeparacc.AsFloat := GetSequence('TABELADEPARACC');
   Result := Inherited Insert;
end;


procedure TDbTabeladeparacc.SetIdtabeladeparacc(const Value: TCmDbField);
begin
  FIdtabeladeparacc := Value;
end;

procedure TDbTabeladeparacc.SetNomecampodata(const Value: TCmDbField);
begin
  FNomecampodata := Value;
end;

procedure TDbTabeladeparacc.SetNomecampoempresa(const Value: TCmDbField);
begin
  FNomecampoempresa := Value;
end;

procedure TDbTabeladeparacc.SetNometabela(const Value: TCmDbField);
begin
  FNometabela := Value;
end;

end.



