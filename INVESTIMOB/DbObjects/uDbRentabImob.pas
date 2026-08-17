{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/03/2007                             }
{                                                       }
{*******************************************************}

unit uDbRentabImob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRentabImob = class(TCmDbObject)

  private
    FRentrealano: TCmDbField;
    FVlrcota: TCmDbField;
    FVlrrecmes: TCmDbField;
    FVlrcontabil: TCmDbField;
    FRentatuano: TCmDbField;
    FIdrentabimob: TCmDbField;
    FIdplanoprev: TCmDbField;
    FRentrealmes: TCmDbField;
    FVlrrecano: TCmDbField;
    FRentnommes: TCmDbField;
    FRentatumes: TCmDbField;
    FIdmoedaatu: TCmDbField;
    FVlrreaval: TCmDbField;
    FIdmoeda: TCmDbField;
    FRentnomano: TCmDbField;
    FData: TCmDbField;
    FIdimovel: TCmDbField;
    FIdCarteiraSPC: TCmDbField;
    FCodTipIMovel: TCmDbField;
    procedure SetData(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdmoeda(const Value: TCmDbField);
    procedure SetIdmoedaatu(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdrentabimob(const Value: TCmDbField);
    procedure SetRentatuano(const Value: TCmDbField);
    procedure SetRentatumes(const Value: TCmDbField);
    procedure SetRentnomano(const Value: TCmDbField);
    procedure SetRentnommes(const Value: TCmDbField);
    procedure SetRentrealano(const Value: TCmDbField);
    procedure SetRentrealmes(const Value: TCmDbField);
    procedure SetVlrcontabil(const Value: TCmDbField);
    procedure SetVlrcota(const Value: TCmDbField);
    procedure SetVlrreaval(const Value: TCmDbField);
    procedure SetVlrrecano(const Value: TCmDbField);
    procedure SetVlrrecmes(const Value: TCmDbField);
    procedure SetCodTipIMovel(const Value: TCmDbField);
    procedure SetIdCarteiraSPC(const Value: TCmDbField);

  public

     Property Vlrrecmes: TCmDbField read FVlrrecmes write SetVlrrecmes;
     Property Vlrrecano: TCmDbField read FVlrrecano write SetVlrrecano;
     Property Vlrreaval: TCmDbField read FVlrreaval write SetVlrreaval;
     Property Vlrcota: TCmDbField read FVlrcota write SetVlrcota;
     Property Vlrcontabil: TCmDbField read FVlrcontabil write SetVlrcontabil;
     Property Rentrealmes: TCmDbField read FRentrealmes write SetRentrealmes;
     Property Rentrealano: TCmDbField read FRentrealano write SetRentrealano;
     Property Rentnommes: TCmDbField read FRentnommes write SetRentnommes;
     Property Rentnomano: TCmDbField read FRentnomano write SetRentnomano;
     Property Rentatumes: TCmDbField read FRentatumes write SetRentatumes;
     Property Rentatuano: TCmDbField read FRentatuano write SetRentatuano;
     Property Idrentabimob: TCmDbField read FIdrentabimob write SetIdrentabimob;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idmoedaatu: TCmDbField read FIdmoedaatu write SetIdmoedaatu;
     Property Idmoeda: TCmDbField read FIdmoeda write SetIdmoeda;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Data: TCmDbField read FData write SetData;
     Property CodTipIMovel: TCmDbField read FCodTipIMovel write SetCodTipIMovel;
     Property IdCarteiraSPC: TCmDbField read FIdCarteiraSPC write SetIdCarteiraSPC;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRentabImob }

constructor TDbRentabImob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RENTABIMOB';

   fVlrrecmes := CreateCmDbField('VLRRECMES',ftfloat,False,False,False,True,'');
   fVlrrecano := CreateCmDbField('VLRRECANO',ftfloat,False,False,False,True,'');
   fVlrreaval := CreateCmDbField('VLRREAVAL',ftfloat,False,False,False,True,'');
   fVlrcota := CreateCmDbField('VLRCOTA',ftfloat,False,False,False,True,'');
   fVlrcontabil := CreateCmDbField('VLRCONTABIL',ftfloat,False,False,False,True,'');
   fRentrealmes := CreateCmDbField('RENTREALMES',ftfloat,False,False,False,True,'');
   fRentrealano := CreateCmDbField('RENTREALANO',ftfloat,False,False,False,True,'');
   fRentnommes := CreateCmDbField('RENTNOMMES',ftfloat,False,False,False,True,'');
   fRentnomano := CreateCmDbField('RENTNOMANO',ftfloat,False,False,False,True,'');
   fRentatumes := CreateCmDbField('RENTATUMES',ftfloat,False,False,False,True,'');
   fRentatuano := CreateCmDbField('RENTATUANO',ftfloat,False,False,False,True,'');
   fIdrentabimob := CreateCmDbField('IDRENTABIMOB',ftfloat,True,True,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdmoedaatu := CreateCmDbField('IDMOEDAATU',ftfloat,False,False,False,True,'');
   fIdmoeda := CreateCmDbField('IDMOEDA',ftfloat,False,False,False,True,'');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,False,False,False,True,'');
   fData := CreateCmDbField('DATA',ftDateTime,False,False,False,True,'');
   fCodTipImovel  := CreateCmDbField('CODTIPIMOVEL',ftString,False,False,False,True,'');
   fIdCarteiraSPC := CreateCmDbField('IDCARTEIRASPC',ftfloat,False,False,False,True,'');
end;

function TDbRentabImob.Insert: Boolean;
begin

   fIdrentabimob.AsFloat := GetSequence('RENTABIMOB');
   Result := Inherited Insert;

end;


procedure TDbRentabImob.SetCodTipIMovel(const Value: TCmDbField);
begin
  FCodTipIMovel := Value;
end;

procedure TDbRentabImob.SetData(const Value: TCmDbField);
begin
  FData := Value;
end;

procedure TDbRentabImob.SetIdCarteiraSPC(const Value: TCmDbField);
begin
  FIdCarteiraSPC := Value;
end;

procedure TDbRentabImob.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbRentabImob.SetIdmoeda(const Value: TCmDbField);
begin
  FIdmoeda := Value;
end;

procedure TDbRentabImob.SetIdmoedaatu(const Value: TCmDbField);
begin
  FIdmoedaatu := Value;
end;

procedure TDbRentabImob.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbRentabImob.SetIdrentabimob(const Value: TCmDbField);
begin
  FIdrentabimob := Value;
end;

procedure TDbRentabImob.SetRentatuano(const Value: TCmDbField);
begin
  FRentatuano := Value;
end;

procedure TDbRentabImob.SetRentatumes(const Value: TCmDbField);
begin
  FRentatumes := Value;
end;

procedure TDbRentabImob.SetRentnomano(const Value: TCmDbField);
begin
  FRentnomano := Value;
end;

procedure TDbRentabImob.SetRentnommes(const Value: TCmDbField);
begin
  FRentnommes := Value;
end;

procedure TDbRentabImob.SetRentrealano(const Value: TCmDbField);
begin
  FRentrealano := Value;
end;

procedure TDbRentabImob.SetRentrealmes(const Value: TCmDbField);
begin
  FRentrealmes := Value;
end;

procedure TDbRentabImob.SetVlrcontabil(const Value: TCmDbField);
begin
  FVlrcontabil := Value;
end;

procedure TDbRentabImob.SetVlrcota(const Value: TCmDbField);
begin
  FVlrcota := Value;
end;

procedure TDbRentabImob.SetVlrreaval(const Value: TCmDbField);
begin
  FVlrreaval := Value;
end;

procedure TDbRentabImob.SetVlrrecano(const Value: TCmDbField);
begin
  FVlrrecano := Value;
end;

procedure TDbRentabImob.SetVlrrecmes(const Value: TCmDbField);
begin
  FVlrrecmes := Value;
end;

end.



