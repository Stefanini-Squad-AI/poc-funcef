{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo                 }
{ Atualizado Em: 10/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbCompFluxo;

interface
uses uCmDbObject, DB, uDataBase, Sysutils, uCmCustomCdbObject;

type
  TDbCompFluxo = class(TCmDbObject)

  private
    FCodcomplinha: TCmDbField;
    FRecpag: TCmDbField;
    FCodlinhafluxo: TCmDbField;
    FIdsequencia: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodtipdoc: TCmDbField;
    FIdfluxocaixa: TCmDbField;
    FFlgDispBase: TCmDbField;
    procedure SetFlgDispBase(const Value: TCmDbField);

  public

     Property Idfluxocaixa: TCmDbField read FIdfluxocaixa write FIdfluxocaixa;
     property Recpag: TCmDbField read FRecpag write FRecpag;
     property Idsequencia: TCmDbField read FIdsequencia write FIdsequencia;
     property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     property Codtiprecdes: TCmDbField read FCodtiprecdes write FCodtiprecdes;
     property Codtipdoc: TCmDbField read FCodtipdoc write FCodtipdoc;
     property Codlinhafluxo: TCmDbField read FCodlinhafluxo write FCodlinhafluxo;
     property Codcomplinha: TCmDbField read FCodcomplinha write FCodcomplinha;
     // Rodolpho da Silva - P: 25449 - 05/07/2007
     property FlgDispBase: TCmDbField read FFlgDispBase write SetFlgDispBase;


     constructor Create(Aowner: TCmCustomCdbObject); override;

     function Insert :Boolean; override;
     function LoadFromDb :Boolean; override;

  protected
     function GetSqlSelect: String; override;
  end;

implementation

{ TDbCompFluxo }

constructor TDbCompFluxo.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'COMPFLUXO';         

   fRecpag        := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fIdsequencia   := CreateCmDbField('IDSEQUENCIA',ftfloat,True,True,False,True,'');
   fIdpessoa      := CreateCmDbField('IDPESSOA',ftfloat,False,True,False,True,'');
   fCodtiprecdes  := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
   fCodtipdoc     := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'');
   fCodlinhafluxo := CreateCmDbField('CODLINHAFLUXO',ftfloat,True,True,False,True,'');
   fCodcomplinha  := CreateCmDbField('CODCOMPLINHA',ftfloat,False,False,False,True,'');
   fIdfluxocaixa  := CreateCmDbField('IDFLUXOCAIXA',ftfloat,True,True,False,True,'');
   // Rodolpho da Silva - P: 25449 - 05/07/2007
   FFlgDispBase   := CreateCmDbField('FLGDISPBASE',ftString,false,false,False,True,'');
end;

function TDbCompFluxo.GetSqlSelect: String;
begin
   Result:= inherited GetSqlSelect;
end;

function TDbCompFluxo.Insert: Boolean;
begin
   fIdsequencia.AsFloat := GetSequence('COMPFLUXO');
   if fCodcomplinha.AsFloat=0 then FCodcomplinha.AsFloat:=FCodlinhafluxo.AsFloat;
   Result := Inherited Insert;
end;




function TDbCompFluxo.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;



procedure TDbCompFluxo.SetFlgDispBase(const Value: TCmDbField);
begin
  FFlgDispBase := Value;
end;

end.



