{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugênio Frioli                  }
{ Atualizado Em: 15/08/2007                             }
{                                                       }
{*******************************************************}

unit uDbDstItemDespesa;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDstItemDespesa = class(TCmDbObject)

  private
    FIdDstItemDespesa: TCmDbField;
    FIdDestacamento  : TCmDbField;
    FIdDstTipoDespesa: TCmDbField;
    FValor           : TCmDbField;
    FObservacao      : TCmDbField;
    FDataRef         : TCmDbField;
  public
     property IdDstItemDespesa: TCmDbField read FIdDstItemDespesa write FIdDstItemDespesa;
     property IdDestacamento  : TCmDbField read FIdDestacamento   write FIdDestacamento;
     Property IdDstTipoDespesa: TCmDbField read FIdDstTipoDespesa write FIdDstTipoDespesa;
     Property Valor           : TCmDbField read FValor            write FValor;
     Property Observacao      : TCmDbField read FObservacao       write FObservacao;
     Property DataRef         : TCmDbField read FDataRef          write FDataRef;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert : Boolean; Override;

  End;

implementation

{ TDbDstTarifa }

constructor TDbDstItemDespesa.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DSTITEMDESPESA';

  FIdDstItemDespesa := CreateCmDbField('IDDSTITEMDESPESA',ftFloat   ,true ,true ,false,true ,'');
  FIdDestacamento   := CreateCmDbField('IDDESTACAMENTO'  ,ftFloat   ,false,false,false,true ,'');
  FIdDstTipoDespesa := CreateCmDbField('IDDSTTIPODESPESA',ftfloat   ,false,false,False,True ,'');
  FObservacao       := CreateCmDbField('OBSERVACAO'      ,ftString  ,false,false,false,true ,'');
  FValor            := CreateCmDbField('VALOR'           ,ftfloat   ,False,False,False,True ,'');
  FDataRef          := CreateCmDbField('DATAREF'         ,ftDateTime,false,false,false,true ,'',-1,true);
end;

function TDbDstItemDespesa.Insert: Boolean;
begin
  FIdDstItemDespesa.AsFloat := GetSequence('DSTITEMDESPESA');
  Result := Inherited Insert;
end;

end.



