{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Daniel Simões Braga             }
{ Atualizado Em: 27/02/2007                             }
{                                                       }
{*******************************************************}

unit uDbContratoXMulta;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbContratoxmulta = class(TCmDbObject)

  private
    FDiasrepasse: TCmDbField;
    FPercmulta: TCmDbField;
    FPeriodojuros: TCmDbField;
    FDataini: TCmDbField;
    FFlgjurosproporc: TCmDbField;
    FMesrefcorrecao: TCmDbField;
    FIdcontratoimovel: TCmDbField;
    FFlgtipodiarepass: TCmDbField;
    FVlrmulta: TCmDbField;
    FVlrjuros: TCmDbField;
    FFlgtipodiatolera: TCmDbField;
    FPercjuros: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FDatafim: TCmDbField;
    FFlgindeterminado: TCmDbField;
    FIdindcorrecao: TCmDbField;
    FIdtipocustorecimo: TCmDbField;
    FIdcontratoxmulta: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FMoedamulta: TCmDbField;
    FMoedajuros: TCmDbField;
    FDiastolerancia: TCmDbField;
    procedure SetDatafim(const Value: TCmDbField);
    procedure SetDataini(const Value: TCmDbField);
    procedure SetDiasrepasse(const Value: TCmDbField);
    procedure SetDiastolerancia(const Value: TCmDbField);
    procedure SetFlgindeterminado(const Value: TCmDbField);
    procedure SetFlgjurosproporc(const Value: TCmDbField);
    procedure SetFlgtipodiarepass(const Value: TCmDbField);
    procedure SetFlgtipodiatolera(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);
    procedure SetIdcontratoxmulta(const Value: TCmDbField);
    procedure SetIdindcorrecao(const Value: TCmDbField);
    procedure SetIdtipocustorecimo(const Value: TCmDbField);
    procedure SetMesrefcorrecao(const Value: TCmDbField);
    procedure SetMoedajuros(const Value: TCmDbField);
    procedure SetMoedamulta(const Value: TCmDbField);
    procedure SetPercjuros(const Value: TCmDbField);
    procedure SetPercmulta(const Value: TCmDbField);
    procedure SetPeriodojuros(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetVlrjuros(const Value: TCmDbField);
    procedure SetVlrmulta(const Value: TCmDbField);

  public

     Property Vlrmulta          : TCmDbField read FVlrmulta          write SetVlrmulta;
     Property Vlrjuros          : TCmDbField read FVlrjuros          write SetVlrjuros;
     Property Trguserinclusao   : TCmDbField read FTrguserinclusao   write SetTrguserinclusao;
     Property Trgdtinclusao     : TCmDbField read FTrgdtinclusao     write SetTrgdtinclusao;
     Property Periodojuros      : TCmDbField read FPeriodojuros      write SetPeriodojuros;
     Property Percmulta         : TCmDbField read FPercmulta         write SetPercmulta;
     Property Percjuros         : TCmDbField read FPercjuros         write SetPercjuros;
     Property Moedamulta        : TCmDbField read FMoedamulta        write SetMoedamulta;
     Property Moedajuros        : TCmDbField read FMoedajuros        write SetMoedajuros;
     Property Mesrefcorrecao    : TCmDbField read FMesrefcorrecao    write SetMesrefcorrecao;
     Property Idtipocustorecimo : TCmDbField read FIdtipocustorecimo write SetIdtipocustorecimo;
     Property Idindcorrecao     : TCmDbField read FIdindcorrecao     write SetIdindcorrecao;
     Property Idcontratoxmulta  : TCmDbField read FIdcontratoxmulta  write SetIdcontratoxmulta;
     Property Idcontratoimovel  : TCmDbField read FIdcontratoimovel  write SetIdcontratoimovel;
     Property Flgtipodiatolera  : TCmDbField read FFlgtipodiatolera  write SetFlgtipodiatolera;
     Property Flgtipodiarepass  : TCmDbField read FFlgtipodiarepass  write SetFlgtipodiarepass;
     Property Flgjurosproporc   : TCmDbField read FFlgjurosproporc   write SetFlgjurosproporc;
     Property Flgindeterminado  : TCmDbField read FFlgindeterminado  write SetFlgindeterminado;
     Property Diastolerancia    : TCmDbField read FDiastolerancia    write SetDiastolerancia;
     Property Diasrepasse       : TCmDbField read FDiasrepasse       write SetDiasrepasse;
     Property Dataini           : TCmDbField read FDataini           write SetDataini;
     Property Datafim           : TCmDbField read FDatafim           write SetDatafim;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbContratoxmulta }

constructor TDbContratoxmulta.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTRATOXMULTA';

   fVlrmulta          := CreateCmDbField('VLRMULTA',ftfloat,False,False,False,True,'');
   fVlrjuros          := CreateCmDbField('VLRJUROS',ftfloat,False,False,False,True,'');
   fTrguserinclusao   := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao     := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fPeriodojuros      := CreateCmDbField('PERIODOJUROS',ftString,False,False,False,True,'');
   fPercmulta         := CreateCmDbField('PERCMULTA',ftfloat,False,False,False,True,'');
   fPercjuros         := CreateCmDbField('PERCJUROS',ftfloat,False,False,False,True,'');
   fMoedamulta        := CreateCmDbField('MOEDAMULTA',ftfloat,False,False,False,True,'');
   fMoedajuros        := CreateCmDbField('MOEDAJUROS',ftfloat,False,False,False,True,'');
   fMesrefcorrecao    := CreateCmDbField('MESREFCORRECAO',ftfloat,False,False,False,True,'');
   fIdtipocustorecimo := CreateCmDbField('IDTIPOCUSTORECIMO',ftfloat,False,False,False,True,'');
   fIdindcorrecao     := CreateCmDbField('IDINDCORRECAO',ftfloat,False,False,False,True,'');
   fIdcontratoxmulta  := CreateCmDbField('IDCONTRATOXMULTA',ftfloat,True,True,False,True,'');
   fIdcontratoimovel  := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,True,False,False,True,'');
   fFlgtipodiatolera  := CreateCmDbField('FLGTIPODIATOLERA',ftString,False,False,False,True,'');
   fFlgtipodiarepass  := CreateCmDbField('FLGTIPODIAREPASS',ftString,False,False,False,True,'');
   fFlgjurosproporc   := CreateCmDbField('FLGJUROSPROPORC',ftString,False,False,False,True,'');
   fFlgindeterminado  := CreateCmDbField('FLGINDETERMINADO',ftString,False,False,False,True,'');
   fDiastolerancia    := CreateCmDbField('DIASTOLERANCIA',ftfloat,False,False,False,True,'');
   fDiasrepasse       := CreateCmDbField('DIASREPASSE',ftfloat,False,False,False,True,'');
   fDataini           := CreateCmDbField('DATAINI',ftDateTime,False,False,False,True,'');
   fDatafim           := CreateCmDbField('DATAFIM',ftDateTime,False,False,False,True,'');
end;

function TDbContratoxmulta.Insert: Boolean;
begin
  fIdcontratoxmulta.AsFloat := GetSequence('CONTRATOXMULTA');
  Result                    := Inherited Insert;
end;


procedure TDbContratoxmulta.SetDatafim(const Value: TCmDbField);
begin
  FDatafim := Value;
end;

procedure TDbContratoxmulta.SetDataini(const Value: TCmDbField);
begin
  FDataini := Value;
end;

procedure TDbContratoxmulta.SetDiasrepasse(const Value: TCmDbField);
begin
  FDiasrepasse := Value;
end;

procedure TDbContratoxmulta.SetDiastolerancia(const Value: TCmDbField);
begin
  FDiastolerancia := Value;
end;

procedure TDbContratoxmulta.SetFlgindeterminado(const Value: TCmDbField);
begin
  FFlgindeterminado := Value;
end;

procedure TDbContratoxmulta.SetFlgjurosproporc(const Value: TCmDbField);
begin
  FFlgjurosproporc := Value;
end;

procedure TDbContratoxmulta.SetFlgtipodiarepass(const Value: TCmDbField);
begin
  FFlgtipodiarepass := Value;
end;

procedure TDbContratoxmulta.SetFlgtipodiatolera(const Value: TCmDbField);
begin
  FFlgtipodiatolera := Value;
end;

procedure TDbContratoxmulta.SetIdcontratoimovel(const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

procedure TDbContratoxmulta.SetIdcontratoxmulta(const Value: TCmDbField);
begin
  FIdcontratoxmulta := Value;
end;

procedure TDbContratoxmulta.SetIdindcorrecao(const Value: TCmDbField);
begin
  FIdindcorrecao := Value;
end;

procedure TDbContratoxmulta.SetIdtipocustorecimo(const Value: TCmDbField);
begin
  FIdtipocustorecimo := Value;
end;

procedure TDbContratoxmulta.SetMesrefcorrecao(const Value: TCmDbField);
begin
  FMesrefcorrecao := Value;
end;

procedure TDbContratoxmulta.SetMoedajuros(const Value: TCmDbField);
begin
  FMoedajuros := Value;
end;

procedure TDbContratoxmulta.SetMoedamulta(const Value: TCmDbField);
begin
  FMoedamulta := Value;
end;

procedure TDbContratoxmulta.SetPercjuros(const Value: TCmDbField);
begin
  FPercjuros := Value;
end;

procedure TDbContratoxmulta.SetPercmulta(const Value: TCmDbField);
begin
  FPercmulta := Value;
end;

procedure TDbContratoxmulta.SetPeriodojuros(const Value: TCmDbField);
begin
  FPeriodojuros := Value;
end;

procedure TDbContratoxmulta.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbContratoxmulta.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbContratoxmulta.SetVlrjuros(const Value: TCmDbField);
begin
  FVlrjuros := Value;
end;

procedure TDbContratoxmulta.SetVlrmulta(const Value: TCmDbField);
begin
  FVlrmulta := Value;
end;

end.



