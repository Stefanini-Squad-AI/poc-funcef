{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbCargoext;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCargoext = class(TCmDbObject)

  private

  public

     Property Ultmesproc: TCmDbField;
     Property Titulo: TCmDbField;
     Property Tipo: TCmDbField;
     Property Nomeresumido: TCmDbField;
     Property Jornada: TCmDbField;
     Property Idtipofunc: TCmDbField;
     Property Idpessjur: TCmDbField;
     Property Idpcs: TCmDbField;
     Property Idfaixasalext: TCmDbField;
     Property Idcarreira: TCmDbField;
     Property Idcargoext: TCmDbField;
     Property Idcargocorresp: TCmDbField;
     Property Flgpcc: TCmDbField;
     Property Flgativo: TCmDbField;
     Property Descricao: TCmDbField;
     Property Datacriacao: TCmDbField;
     Property Codigo: TCmDbField;
     Property Cbo: TCmDbField;
     Property Anomesalt: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCargoext }

constructor TDbCargoext.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CARGOEXT';

   fUltmesproc := CreateCmDbField('ULTMESPROC',ftString,True,False,False,True);
   fTitulo := CreateCmDbField('TITULO',ftString,True,False,False,True);
   fTipo := CreateCmDbField('TIPO',ftString,True,False,False,True);
   fNomeresumido := CreateCmDbField('NOMERESUMIDO',ftString,True,False,False,True);
   fJornada := CreateCmDbField('JORNADA',ftfloat,True,False,False,True);
   fIdtipofunc := CreateCmDbField('IDTIPOFUNC',ftfloat,True,False,False,True);
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,True,False,True);
   fIdpcs := CreateCmDbField('IDPCS',ftfloat,True,False,False,True);
   fIdfaixasalext := CreateCmDbField('IDFAIXASALEXT',ftfloat,True,False,False,True);
   fIdcarreira := CreateCmDbField('IDCARREIRA',ftfloat,True,False,False,True);
   fIdcargoext := CreateCmDbField('IDCARGOEXT',ftfloat,False,True,False,True);
   fIdcargocorresp := CreateCmDbField('IDCARGOCORRESP',ftfloat,True,False,False,True);
   fFlgpcc := CreateCmDbField('FLGPCC',ftfloat,True,False,False,True);
   fFlgativo := CreateCmDbField('FLGATIVO',ftfloat,True,False,False,True);
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True);
   fDatacriacao := CreateCmDbField('DATACRIACAO',ftDateTime,True,False,False,True);
   fCodigo := CreateCmDbField('CODIGO',ftString,True,False,False,True);
   fCbo := CreateCmDbField('CBO',ftfloat,True,False,False,True);
   fAnomesalt := CreateCmDbField('ANOMESALT',ftString,True,False,False,True);
end;

function TDbCargoext.Insert: Boolean;
begin

   f'Idpessjur'.AsFloat := GetSequence(CARGOEXT);
   f'Idcargoext'.AsFloat := GetSequence(CARGOEXT);
   Result := Inherited Insert;

end;

function TDbCargoext.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



