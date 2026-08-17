{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbParamIndicadores;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbParamIndicadores = class(TCmDbObject)

  private
    FMoecodigoupv: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdGrupoRegra: TCmDbField;
    FFlgLogoRelat: TCmDbField; // Marcio Motta - 25/06/2004
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetMoecodigoupv(const Value: TCmDbField);
    procedure SetIdGrupoRegra(const Value: TCmDbField);
    procedure SetFlgLogoRelat(const Value: TCmDbField); // Marcio Motta - 25/06/2004

  public

     Property Moecodigoupv: TCmDbField read FMoecodigoupv write SetMoecodigoupv;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property IdGrupoRegra: TCmDbField read FIdGrupoRegra write SetIdGrupoRegra;
     Property FlgLogoRelat: TCmDbField read FFlgLogoRelat write SetFlgLogoRelat;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamIndicadores }

constructor TDbParamIndicadores.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMINDICADORES';

  fMoecodigoupv := CreateCmDbField('MOECODIGOUPV',ftfloat,False,False,False,True,'');
  fIdpessoa     := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
  fIdgruporegra := CreateCmDbField('IDGRUPOREGRA',ftfloat,False,False,False,True,'');
  fFlgLogoRelat := CreateCmDbField('FLGLOGORELAT',ftString,False,False,False,True,'');
end;

function TDbParamIndicadores.Insert: Boolean;
begin

   fIdpessoa.AsFloat := GetSequence('PARAMINDICADORES');
   Result := Inherited Insert;

end;


procedure TDbParamIndicadores.SetFlgLogoRelat(const Value: TCmDbField);
begin
  FFlgLogoRelat := Value;
end;

procedure TDbParamIndicadores.SetIdGrupoRegra(const Value: TCmDbField);
begin
  FIdGrupoRegra := Value;
end;

procedure TDbParamIndicadores.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbParamIndicadores.SetMoecodigoupv(const Value: TCmDbField);
begin
  FMoecodigoupv := Value;
end;

end.



