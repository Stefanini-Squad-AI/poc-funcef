{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbCargo;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCargo = class(TCmDbObject)

  private

  public

     Property Titulo: TCmDbField;
     Property Idfaixasalarial: TCmDbField;
     Property Idcargo: TCmDbField;
     Property Descricao: TCmDbField;
     Property Codnivel: TCmDbField;
     Property Codgrptrein: TCmDbField;
     Property Codgrpfunc: TCmDbField;
     Property Cbo: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCargo }

constructor TDbCargo.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CARGO';

   fTitulo := CreateCmDbField('TITULO',ftString,True,False,False,True);
   fIdfaixasalarial := CreateCmDbField('IDFAIXASALARIAL',ftfloat,True,False,False,True);
   fIdcargo := CreateCmDbField('IDCARGO',ftfloat,False,True,False,True);
   fDescricao := CreateCmDbField('DESCRICAO',ftBlob,True,False,False,True);
   fCodnivel := CreateCmDbField('CODNIVEL',ftfloat,True,False,False,True);
   fCodgrptrein := CreateCmDbField('CODGRPTREIN',ftString,True,False,False,True);
   fCodgrpfunc := CreateCmDbField('CODGRPFUNC',ftString,True,False,False,True);
   fCbo := CreateCmDbField('CBO',ftfloat,True,False,False,True);
end;

function TDbCargo.Insert: Boolean;
begin

   
   Result := Inherited Insert;

end;

function TDbCargo.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



