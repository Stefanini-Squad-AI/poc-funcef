{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbRestricao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRestricao = class(TCmDbObject)

  private

  public

     Property Motivo: TCmDbField;
     Property Idrestricao: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Idforcli: TCmDbField;
     Property Flgflexivel: TCmDbField;
     Property Dataini: TCmDbField;
     Property Datafim: TCmDbField;
     Property Codartigo: TCmDbField;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRestricao }

constructor TDbRestricao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RESTRICAO';

   fMotivo := CreateCmDbField('MOTIVO',ftString,False,False,False,True,'');
   fIdrestricao := CreateCmDbField('IDRESTRICAO',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,True,False,False,True,'');
   fFlgflexivel := CreateCmDbField('FLGFLEXIVEL',ftString,False,False,False,True,'');
   fDataini := CreateCmDbField('DATAINI',ftDateTime,False,False,False,True,'');
   fDatafim := CreateCmDbField('DATAFIM',ftDateTime,False,False,False,True,'');
   fCodartigo := CreateCmDbField('CODARTIGO',ftString,False,False,False,True,'');
end;

function TDbRestricao.Insert: Boolean;
begin

   fIdrestricao.AsFloat := GetSequence('RESTRICAO');
   Result := Inherited Insert;

end;


end.



