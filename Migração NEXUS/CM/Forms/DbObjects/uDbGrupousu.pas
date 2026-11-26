{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrupousu;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbGrupousu = class(TCmDbObject)

  private
    FIdgrupo: TCmDbField;
    FIdusuario: TCmDbField;
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);

  public

     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbGrupousu }

constructor TDbGrupousu.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'GRUPOUSU';

   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,True,False,True,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,True,True,False,True,'');
end;

procedure TDbGrupousu.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDbGrupousu.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

end.



