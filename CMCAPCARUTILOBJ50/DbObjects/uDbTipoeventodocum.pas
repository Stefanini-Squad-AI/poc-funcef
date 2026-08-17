{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/08/2006                             }
{                                                       }
{*******************************************************}

unit uDbTipoeventodocum;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTipoeventodocum = class(TCmDbObject)

  private
    FDescricao: TCmDbField;
    FIdmodulo: TCmDbField;
    FIdtipoeventodocum: TCmDbField;
    FFlgAtivo: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdtipoeventodocum(const Value: TCmDbField);
    procedure SetFlgAtivo(const Value: TCmDbField);

  public
    Property Idtipoeventodocum : TCmDbField read FIdtipoeventodocum write SetIdtipoeventodocum;
    Property Idmodulo          : TCmDbField read FIdmodulo          write SetIdmodulo;
    Property Descricao         : TCmDbField read FDescricao         write SetDescricao;
    Property FlgAtivo          : TCmDbField read FFlgAtivo          write SetFlgAtivo;

    constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
  End;

implementation

{ TDbTipoeventodocum }

constructor TDbTipoeventodocum.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOEVENTODOCUM';

  fIdtipoeventodocum := CreateCmDbField('IDTIPOEVENTODOCUM',ftfloat ,True ,True,False,True,'');
  fIdmodulo          := CreateCmDbField('IDMODULO'         ,ftfloat ,False,False,False,True,'');
  fDescricao         := CreateCmDbField('DESCRICAO'        ,ftString,False,False,False,True,'');
  FlgAtivo           := CreateCmDbField('FLGATIVO'         ,ftfloat ,False,False,False,False,'');
end;

function TDbTipoeventodocum.Insert: Boolean;
begin
   fIdtipoeventodocum.AsFloat := GetSequence('TIPOEVENTODOCUM');
   Result := Inherited Insert;
end;


procedure TDbTipoeventodocum.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbTipoeventodocum.SetFlgAtivo(const Value: TCmDbField);
begin
  FFlgAtivo := Value;
end;

procedure TDbTipoeventodocum.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbTipoeventodocum.SetIdtipoeventodocum(const Value: TCmDbField);
begin
  FIdtipoeventodocum := Value;
end;

end.



