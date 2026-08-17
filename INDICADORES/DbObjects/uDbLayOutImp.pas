{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcio Motta                    }
{ Início: 19/03/2004                                    }
{ Término: 19/03/2004                                   }
{ Atualizado Em:                                        }
{                                                       }
{*******************************************************}

unit uDbLayOutImp;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbLayOutImp = class(TCmDbObject)

  private
    FDescricao: TCmDbField;
    FIdLayOutImp: TCmDbField;
    FPosIndicador: TCmDbField;
    FPosValor: TCmDbField;
    FFlgPosicao: TCmDbField;
    FFlgTipoIndicador: TCmDbField;
    FPosContrato: TCmDbField;

    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdLayOutImp(const Value: TCmDbField);
    procedure SetPosIndicador(const Value: TCmDbField);
    procedure SetPosValor(const Value: TCmDbField);
    procedure SetFlgPosicao(const Value: TCmDbField);
    procedure SetFlgTipoIndicador(const Value: TCmDbField);
    procedure SetPosContrato(const Value: TCmDbField);

  public

     Property IdLayOutImp  : TCmDbField read FIdLayOutImp  write SetIdLayOutImp;
     Property Descricao    : TCmDbField read FDescricao    write SetDescricao;
     Property PosIndicador : TCmDbField read FPosIndicador write SetPosIndicador;
     Property PosValor     : TCmDbField read FPosValor     write SetPosValor;
     Property PosContrato  : TCmDbField read FPosContrato  write SetPosContrato;
     Property FlgPosicao   : TCmDbField read FFlgPosicao   write SetFlgPosicao;
     Property FlgTipoIndicador : TCmDbField read FFlgTipoIndicador write SetFlgTipoIndicador;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

  End;

implementation

{ TDbGrpApuracao }

constructor TDbLayOutImp.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDLAYOUTIMP';

  FDescricao    := CreateCmDbField('DESCRICAO',ftString,False,False,False,False,'Descrição');
  FIdLayOutImp  := CreateCmDbField('IDLAYOUTIMP',ftFloat,True,True,False,True,'ID do LayOut Cadastrado');
  FPosIndicador := CreateCmDbField('POSINDICADOR',ftFloat,False,False,False,True,'Posição da Coluna da descrição do Indicador');
  FPosValor     := CreateCmDbField('POSVALOR',ftFloat,False,False,False,True,'Posição da Coluna do valor do indicador');
  FPosContrato  := CreateCmDbField('POSCONTRATO',ftFloat,False,False,False,True,'Posição do Contrato');  
  FFlgPosicao   := CreateCmDbField('FLGPOSICAO',ftString,False,False,False,False,'Flag de Posição');
  FFlgTipoIndicador := CreateCmDbField('FLGTIPOINDICADOR',ftString,False,False,False,False,'Flag Tipo Indicador');
end;

function TDbLayOutImp.Insert: Boolean;
begin
   fIdLayOutImp.AsFloat := GetSequence('INDLAYOUTIMP');
   Result := Inherited Insert;
end;

function TDbLayOutImp.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;


procedure TDbLayOutImp.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbLayOutImp.SetFlgPosicao(const Value: TCmDbField);
begin
  FFlgPosicao := Value;
end;

procedure TDbLayOutImp.SetFlgTipoIndicador(const Value: TCmDbField);
begin
  FFlgTipoIndicador := Value;
end;

procedure TDbLayOutImp.SetIdLayOutImp(const Value: TCmDbField);
begin
  FIdLayOutImp := Value;
end;

procedure TDbLayOutImp.SetPosContrato(const Value: TCmDbField);
begin
  FPosContrato := Value;
end;

procedure TDbLayOutImp.SetPosIndicador(const Value: TCmDbField);
begin
  FPosIndicador := Value;
end;

procedure TDbLayOutImp.SetPosValor(const Value: TCmDbField);
begin
  FPosValor := Value;
end;

end.



