{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbAlgregra;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbAlgregra = class(TCmDbObject)

  private

  public

     Property Valor: TCmDbField;
     Property Tipocampo2: TCmDbField;
     Property Tipocampo1: TCmDbField;
     Property Tipoalgoritmo: TCmDbField;
     Property Idregra: TCmDbField;
     Property Idcampo2: TCmDbField;
     Property Idcampo: TCmDbField;
     Property Idalgoritmodareg: TCmDbField;
     Property Formula2: TCmDbField;
     Property Formula1: TCmDbField;
     Property Formatacao: TCmDbField;
     Property Descricaoalgorit: TCmDbField;
     Property Correlacao: TCmDbField;
     Property Algorsubseqtrue: TCmDbField;
     Property Algorsubseqfalse: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbAlgregra }

constructor TDbAlgregra.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ALGREGRA';

   fValor := CreateCmDbField('VALOR',ftString,True,False,False,True);
   fTipocampo2 := CreateCmDbField('TIPOCAMPO2',ftfloat,False,False,False,True);
   fTipocampo1 := CreateCmDbField('TIPOCAMPO1',ftfloat,False,False,False,True);
   fTipoalgoritmo := CreateCmDbField('TIPOALGORITMO',ftfloat,True,False,False,True);
   fIdregra := CreateCmDbField('IDREGRA',ftfloat,False,True,False,True);
   fIdcampo2 := CreateCmDbField('IDCAMPO2',ftString,True,False,False,True);
   fIdcampo := CreateCmDbField('IDCAMPO',ftString,True,False,False,True);
   fIdalgoritmodareg := CreateCmDbField('IDALGORITMODAREG',ftfloat,False,True,False,True);
   fFormula2 := CreateCmDbField('FORMULA2',ftfloat,True,False,False,True);
   fFormula1 := CreateCmDbField('FORMULA1',ftfloat,True,False,False,True);
   fFormatacao := CreateCmDbField('FORMATACAO',ftfloat,True,False,False,True);
   fDescricaoalgorit := CreateCmDbField('DESCRICAOALGORIT',ftString,True,False,False,True);
   fCorrelacao := CreateCmDbField('CORRELACAO',ftString,True,False,False,True);
   fAlgorsubseqtrue := CreateCmDbField('ALGORSUBSEQTRUE',ftfloat,True,False,False,True);
   fAlgorsubseqfalse := CreateCmDbField('ALGORSUBSEQFALSE',ftfloat,True,False,False,True);
end;

function TDbAlgregra.Insert: Boolean;
begin

   
   Result := Inherited Insert;

end;

function TDbAlgregra.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



