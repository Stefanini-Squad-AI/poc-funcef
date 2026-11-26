{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/01/2005                             }
{                                                       }
{*******************************************************}

unit uDbSeqremessa;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSeqremessa = class(TCmDbObject)

  private
    FNumempresabanco: TCmDbField;
    FControleremessa: TCmDbField;
    FDescricao: TCmDbField;
    procedure SetControleremessa(const Value: TCmDbField);
    procedure SetNumempresabanco(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);

  public

     Property Numempresabanco: TCmDbField read FNumempresabanco write SetNumempresabanco;
     Property Controleremessa: TCmDbField read FControleremessa write SetControleremessa;
     Property Descricao      : TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

  End;

implementation

{ TDbSeqremessa }

constructor TDbSeqremessa.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;
  _updatekeyfields:= true;
  TableName := 'SEQREMESSA';

   fNumempresabanco := CreateCmDbField('NUMEMPRESABANCO',ftString,True,True,False,True,'');
   fControleremessa := CreateCmDbField('CONTROLEREMESSA',ftfloat,False,False,False,True,'');
   fDescricao       := CreateCmDbField('DESCRICAO',ftstring,False,False,False,True,'');
end;

procedure TDbSeqremessa.SetControleremessa(const Value: TCmDbField);
begin
  FControleremessa := Value;
end;

procedure TDbSeqremessa.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbSeqremessa.SetNumempresabanco(const Value: TCmDbField);
begin
  FNumempresabanco := Value;
end;

end.



