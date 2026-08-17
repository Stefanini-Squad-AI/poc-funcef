{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alexandre Gonçalves             }
{ Atualizado Em: 06/06/2002                             }
{                                                       }
{*******************************************************}
Unit uDbParamorcamento;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbParamorcamento = class(TCmDbObject)

  private
     FMoecodigo: TCmDbField;
     FMascgrupoorc: TCmDbField;
     FIdplanoorcamen: TCmDbField;
     FIdpessoa: TCmDbField;
     FIdcontaorcresult: TCmDbField;
     FIdcontaorcpara: TCmDbField;
     FIdcontaorcde: TCmDbField;
     FFlgverificasaldo: TCmDbField;
     FFlgtiposaldo: TCmDbField;
     FFlgpermitetransf: TCmDbField;

     Procedure SetMoecodigo(const Value: TCmDbField);
     Procedure SetMascgrupoorc(const Value: TCmDbField);
     Procedure SetIdplanoorcamen(const Value: TCmDbField);
     Procedure SetIdpessoa(const Value: TCmDbField);
     Procedure SetIdcontaorcresult(const Value: TCmDbField);
     Procedure SetIdcontaorcpara(const Value: TCmDbField);
     Procedure SetIdcontaorcde(const Value: TCmDbField);
     Procedure SetFlgverificasaldo(const Value: TCmDbField);
     Procedure SetFlgtiposaldo(const Value: TCmDbField);
     Procedure SetFlgpermitetransf(const Value: TCmDbField);
  public

     Property Moecodigo        : TCmDbField read FMoecodigo        write SetMoecodigo;
     Property Mascgrupoorc     : TCmDbField read FMascgrupoorc     write SetMascgrupoorc;
     Property Idplanoorcamen   : TCmDbField read FIdplanoorcamen   write SetIdplanoorcamen;
     Property Idpessoa         : TCmDbField read FIdpessoa         write SetIdpessoa;
     Property Idcontaorcresult : TCmDbField read FIdcontaorcresult write SetIdcontaorcresult;
     Property Idcontaorcpara   : TCmDbField read FIdcontaorcpara   write SetIdcontaorcpara;
     Property Idcontaorcde     : TCmDbField read FIdcontaorcde     write SetIdcontaorcde;
     Property Flgverificasaldo : TCmDbField read FFlgverificasaldo write SetFlgverificasaldo;
     Property Flgtiposaldo     : TCmDbField read FFlgtiposaldo     write SetFlgtiposaldo;
     Property Flgpermitetransf : TCmDbField read FFlgpermitetransf write SetFlgpermitetransf;

     Constructor Create(AOwner: TcmCustomcdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbParamorcamento }

constructor TDbParamorcamento.Create(AOwner: TcmCustomcdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMORCAMENTO';

  fMoecodigo        := CreateCmDbField( 'MOECODIGO'       , ftfloat , False, False, False, True, '' );
  fMascgrupoorc     := CreateCmDbField( 'MASCGRUPOORC'    , ftString, False, False, False, True, '' );
  fIdplanoorcamen   := CreateCmDbField( 'IDPLANOORCAMEN'  , ftfloat , False, False, False, True, '' );
  fIdpessoa         := CreateCmDbField( 'IDPESSOA'        , ftfloat , True , True , False, True, '' );
  fIdcontaorcresult := CreateCmDbField( 'IDCONTAORCRESULT', ftString, False, False, False, True, '' );
  fIdcontaorcpara   := CreateCmDbField( 'IDCONTAORCPARA'  , ftString, False, False, False, True, '' );
  fIdcontaorcde     := CreateCmDbField( 'IDCONTAORCDE'    , ftString, False, False, False, True, '' );
  fFlgverificasaldo := CreateCmDbField( 'FLGVERIFICASALDO', ftString, False, False, False, True, '' );
  fFlgtiposaldo     := CreateCmDbField( 'FLGTIPOSALDO'    , ftString, False, False, False, True, '' );
  fFlgpermitetransf := CreateCmDbField( 'FLGPERMITETRANSF', ftString, False, False, False, True, '' );
end;

function TDbParamorcamento.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbParamorcamento.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbParamorcamento.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbParamorcamento.SetMascgrupoorc(const Value: TCmDbField);
begin
  FMascgrupoorc := Value;
end;

procedure TDbParamorcamento.SetIdplanoorcamen(const Value: TCmDbField);
begin
  FIdplanoorcamen := Value;
end;

procedure TDbParamorcamento.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbParamorcamento.SetIdcontaorcresult(const Value: TCmDbField);
begin
  FIdcontaorcresult := Value;
end;

procedure TDbParamorcamento.SetIdcontaorcpara(const Value: TCmDbField);
begin
  FIdcontaorcpara := Value;
end;

procedure TDbParamorcamento.SetIdcontaorcde(const Value: TCmDbField);
begin
  FIdcontaorcde := Value;
end;

procedure TDbParamorcamento.SetFlgverificasaldo(const Value: TCmDbField);
begin
  FFlgverificasaldo := Value;
end;

procedure TDbParamorcamento.SetFlgtiposaldo(const Value: TCmDbField);
begin
  FFlgtiposaldo := Value;
end;

procedure TDbParamorcamento.SetFlgpermitetransf(const Value: TCmDbField);
begin
  FFlgpermitetransf := Value;
end;

end.
