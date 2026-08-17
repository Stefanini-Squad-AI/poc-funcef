{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/12/2006                             }
{                                                       }
{*******************************************************}

unit uDbParamcotapatrim;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParamcotapatrim = class(TCmDbObject)

  private
    FIdgruporegra: TCmDbField;
    FIdempresa: TCmDbField;
    FIdcproteiro: TCmDbField;
    FFlgcotadiautil: TCmDbField;
    FNrsldaplicado: TCmDbField;
    FNrentrrent: TCmDbField;
    FNrsaidarent: TCmDbField;
    FNrsaldoantcta: TCmDbField;
    FNrsaidainvest: TCmDbField;
    FNrsaldoatucta: TCmDbField;
    FNrsldativoant: TCmDbField;
    FNrentrinvest: TCmDbField;
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdgruporegra(const Value: TCmDbField);
    procedure SetIdcproteiro(const Value: TCmDbField);
    procedure SetFlgcotadiautil(const Value: TCmDbField);
    procedure SetNrentrinvest(const Value: TCmDbField);
    procedure SetNrentrrent(const Value: TCmDbField);
    procedure SetNrsaidainvest(const Value: TCmDbField);
    procedure SetNrsaidarent(const Value: TCmDbField);
    procedure SetNrsaldoantcta(const Value: TCmDbField);
    procedure SetNrsaldoatucta(const Value: TCmDbField);
    procedure SetNrsldaplicado(const Value: TCmDbField);
    procedure SetNrsldativoant(const Value: TCmDbField);

  public

     Property Idgruporegra   : TCmDbField read FIdgruporegra write SetIdgruporegra;
     Property Idempresa      : TCmDbField read FIdempresa write SetIdempresa;
     Property Idcproteiro    : TCmDbField read FIdcproteiro write SetIdcproteiro;
     Property Flgcotadiautil : TCmDbField read FFlgcotadiautil write SetFlgcotadiautil;
     Property Nrsldaplicado  : TCmDbField read FNrsldaplicado write SetNrsldaplicado;
     Property Nrsldativoant  : TCmDbField read FNrsldativoant write SetNrsldativoant;
     Property Nrsaidainvest  : TCmDbField read FNrsaidainvest write SetNrsaidainvest;
     Property Nrentrinvest   : TCmDbField read FNrentrinvest write SetNrentrinvest;
     Property Nrsaldoantcta  : TCmDbField read FNrsaldoantcta write SetNrsaldoantcta;
     Property Nrsaldoatucta  : TCmDbField read FNrsaldoatucta write SetNrsaldoatucta;
     Property Nrentrrent     : TCmDbField read FNrentrrent write SetNrentrrent;
     Property Nrsaidarent    : TCmDbField read FNrsaidarent write SetNrsaidarent;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

  End;

implementation

{ TDbParamcotapatrim }

constructor TDbParamcotapatrim.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMCOTAPATRIM';

   fIdempresa      := CreateCmDbField( 'IDEMPRESA'      , ftfloat  , True  , True  , False , True , '' );
   fIdgruporegra   := CreateCmDbField( 'IDGRUPOREGRA'   , ftfloat  , False , False , False , True , '' );
   FIdcproteiro    := CreateCmDbField( 'IDCPROTEIRO'    , ftfloat  , False , False , False , True , '' );
   fFlgcotadiautil := CreateCmDbField( 'FLGCOTADIAUTIL' , ftstring , True  , False , False , True , '' );
   fNrsldaplicado  := CreateCmDbField( 'NRSLDAPLICADO'  , ftstring , False , False , False , True , '' );
   fNrsldativoant  := CreateCmDbField( 'NRSLDATIVOANT'  , ftstring , False , False , False , True , '' );
   fNrsaidainvest  := CreateCmDbField( 'NRSAIDAINVEST'  , ftstring , False , False , False , True , '' );
   fNrentrinvest   := CreateCmDbField( 'NRENTRINVEST'   , ftstring , False , False , False , True , '' );
   fNrsaldoantcta  := CreateCmDbField( 'NRSALDOANTCTA'  , ftstring , False , False , False , True , '' );
   fNrsaldoatucta  := CreateCmDbField( 'NRSALDOATUCTA'  , ftstring , False , False , False , True , '' );
   fNrentrrent     := CreateCmDbField( 'NRENTRRENT'     , ftstring , False , False , False , True , '' );
   fNrsaidarent    := CreateCmDbField( 'NRSAIDARENT'    , ftstring , False , False , False , True , '' );
end;

procedure TDbParamcotapatrim.SetFlgcotadiautil(const Value: TCmDbField);
begin
  FFlgcotadiautil := Value;
end;

procedure TDbParamcotapatrim.SetIdcproteiro(const Value: TCmDbField);
begin
  FIdcproteiro := Value;
end;

procedure TDbParamcotapatrim.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbParamcotapatrim.SetIdgruporegra(const Value: TCmDbField);
begin
  FIdgruporegra := Value;
end;

procedure TDbParamcotapatrim.SetNrentrinvest(const Value: TCmDbField);
begin
  FNrentrinvest := Value;
end;

procedure TDbParamcotapatrim.SetNrentrrent(const Value: TCmDbField);
begin
  FNrentrrent := Value;
end;

procedure TDbParamcotapatrim.SetNrsaidainvest(const Value: TCmDbField);
begin
  FNrsaidainvest := Value;
end;

procedure TDbParamcotapatrim.SetNrsaidarent(const Value: TCmDbField);
begin
  FNrsaidarent := Value;
end;

procedure TDbParamcotapatrim.SetNrsaldoantcta(const Value: TCmDbField);
begin
  FNrsaldoantcta := Value;
end;

procedure TDbParamcotapatrim.SetNrsaldoatucta(const Value: TCmDbField);
begin
  FNrsaldoatucta := Value;
end;

procedure TDbParamcotapatrim.SetNrsldaplicado(const Value: TCmDbField);
begin
  FNrsldaplicado := Value;
end;

procedure TDbParamcotapatrim.SetNrsldativoant(const Value: TCmDbField);
begin
  FNrsldativoant := Value;
end;

end.



