{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 30/12/2003                             }
{                                                       }
{ Em 13/02/2004 - Marcio Motta - Pendência 16082        }
{                 Incluído o campo CODTIPIMOVEL         }
{*******************************************************}

unit uDbAlteraLancImovel;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbAlteraLancImovel = class(TCmDbObject)

  private
    FCodalterador: TCmDbField;
    FIddocumento: TCmDbField;
    FVlralterador: TCmDbField;
    FCodTipImovel: TCmDbField;
    FObservacao: TCmDbField;
    procedure SetCodalterador(const Value: TCmDbField);
    procedure SetIddocumento(const Value: TCmDbField);
    procedure SetVlralterador(const Value: TCmDbField);
    // Marcio Motta - 13/02/2004 - Pendência: 16082
    procedure SetCodTipImovel(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);

  public

     Property Vlralterador: TCmDbField read FVlralterador write SetVlralterador;
     Property Iddocumento: TCmDbField read FIddocumento write SetIddocumento;
     Property Codalterador: TCmDbField read FCodalterador write SetCodalterador;
     // Marcio Motta - 13/02/2004 - Pendência: 16082
     Property CodTipImovel: TCmDbField read FCodTipImovel write SetCodTipImovel;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAlteraLancImovel }

constructor TDbAlteraLancImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ALTERALANCIMOVEL';

   fVlralterador := CreateCmDbField('VLRALTERADOR',ftfloat,False,False,False,True,'');
   fIddocumento := CreateCmDbField('IDDOCUMENTO',ftfloat,True,True,False,True,'');
   fCodalterador := CreateCmDbField('CODALTERADOR',ftfloat,True,True,False,True,'');
   // Marcio Motta - 13/02/2003 - Pendência: 16082
   fCodTipImovel := CreateCmDbField('CODTIPIMOVEL',ftString,False,False,False,True,'');
   fObservacao   := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');   
end;

function TDbAlteraLancImovel.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbAlteraLancImovel.SetCodalterador(const Value: TCmDbField);
begin
  FCodalterador := Value;
end;

procedure TDbAlteraLancImovel.SetCodTipImovel(const Value: TCmDbField);
begin
  // Marcio Motta - 13/02/2004 - Pendência: 16082
  FCodTipImovel := Value;
end;

procedure TDbAlteraLancImovel.SetIddocumento(const Value: TCmDbField);
begin
  FIddocumento := Value;
end;

procedure TDbAlteraLancImovel.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbAlteraLancImovel.SetVlralterador(const Value: TCmDbField);
begin
  FVlralterador := Value;
end;

end.



