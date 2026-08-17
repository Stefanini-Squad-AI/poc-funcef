{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/09/2005                             }
{                                                       }
{*******************************************************}

unit uDbLayoutimport;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbLayoutimport = class(TCmDbObject)

  private
    FDesclayout: TCmDbField;
    FIdmodulo: TCmDbField;
    FIdlayoutimport: TCmDbField;
    FLinhaini: TCmDbField;
    FTabelaDestino: TCmDbField;
    procedure SetDesclayout(const Value: TCmDbField);
    procedure SetIdlayoutimport(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetLinhaini(const Value: TCmDbField);
    procedure SetTabelaDestino(const Value: TCmDbField);

  public

     Property Linhaini: TCmDbField read FLinhaini write SetLinhaini;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idlayoutimport: TCmDbField read FIdlayoutimport write SetIdlayoutimport;
     Property Desclayout: TCmDbField read FDesclayout write SetDesclayout;
     Property TabelaDestino: TCmDbField read FTabelaDestino write SetTabelaDestino;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbLayoutimport }

constructor TDbLayoutimport.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LAYOUTIMPORT';

   fLinhaini := CreateCmDbField('LINHAINI',ftfloat,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIdlayoutimport := CreateCmDbField('IDLAYOUTIMPORT',ftfloat,True,True,False,True,'');
   fDesclayout := CreateCmDbField('DESCLAYOUT',ftString,False,False,False,True,'');
   fTabelaDEstino := CreateCmDbField('TABELADESTINO',ftString,False,False,False,True,'');
end;

function TDbLayoutimport.Insert: Boolean;
begin

   fIdlayoutimport.AsFloat := GetSequence('LAYOUTIMPORT');
   Result := Inherited Insert;

end;


procedure TDbLayoutimport.SetDesclayout(const Value: TCmDbField);
begin
  FDesclayout := Value;
end;

procedure TDbLayoutimport.SetIdlayoutimport(const Value: TCmDbField);
begin
  FIdlayoutimport := Value;
end;

procedure TDbLayoutimport.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbLayoutimport.SetLinhaini(const Value: TCmDbField);
begin
  FLinhaini := Value;
end;

procedure TDbLayoutimport.SetTabelaDestino(const Value: TCmDbField);
begin
  FTabelaDestino := Value;
end;

end.



