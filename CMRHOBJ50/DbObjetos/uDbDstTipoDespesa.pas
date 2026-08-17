{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugênio Frioli                  }
{ Atualizado Em: 15/08/2007                             }
{                                                       }
{*******************************************************}

unit uDbDstTipoDespesa;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDstTipoDespesa = class(TCmDbObject)

  private
    FIdDstTipoDespesa: TCmDbField;
    FDescricao: TCmDbField;
    FIdDsttarifa: TCmDbField;
    FIndValorQuant: TCmDbField;
    FFlgDiaria: TCmDbField;

  public
     Property IdDstTipoDespesa: TCmDbField read FIdDstTipoDespesa write FIdDstTipoDespesa;
     Property Descricao       : TCmDbField read FDescricao        write FDescricao;
     Property IdDsttarifa     : TCmDbField read FIdDsttarifa      write FIdDsttarifa;
     Property IndValorQuant   : TCmDbField read FIndValorQuant    write FIndValorQuant;
     Property FlgDiaria       : TCmDbField read FFlgDiaria        write FFlgDiaria;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert : Boolean; Override;
  End;

implementation

{ TDbDstTarifa }

constructor TDbDstTipoDespesa.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DSTTIPODESPESA';

  FIdDstTipoDespesa := CreateCmDbField('IDDSTTIPODESPESA',ftfloat,True,True,False,True,'');
  FDescricao        := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
  FIdDstTarifa      := CreateCmDbField('IDDSTTARIFA',ftfloat,False,False,False,True,'');
  FIndValorQuant    := CreateCmDbField('INDVALORQUANT',ftfloat,False,False,False,False,'');
  FFlgDiaria        := CreateCmDbField('FLGDIARIA',ftfloat,False,False,False,False,'');
end;

function TDbDstTipoDespesa.Insert: Boolean;
begin
  FIdDstTipoDespesa.AsFloat := GetSequence('DSTTIPODESPESA');
  Result := Inherited Insert;
end;

end.

