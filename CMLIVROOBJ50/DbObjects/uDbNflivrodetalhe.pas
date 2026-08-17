{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 23/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbNflivrodetalhe;

interface

Uses uCmCustomCDbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbNflivrodetalhe = class(TCmDbObject)

  private
    FAliquota: TCmDbField;
    FVlripi: TCmDbField;
    FVlrivaperc: TCmDbField;
    FVlrivacompl: TCmDbField;
    FValoroutros: TCmDbField;
    FIdimposto: TCmDbField;
    FVlrimpinterno: TCmDbField;
    FCodtipocustagreg: TCmDbField;
    FVlringbruto: TCmDbField;
    FCodfiscal: TCmDbField;
    FValorcontabil: TCmDbField;
    FIdnflivrodetalhe: TCmDbField;
    FBcsubst: TCmDbField;
    FValorisento: TCmDbField;
    FBasecalculo: TCmDbField;
    FVlricmssubst: TCmDbField;
    FIcmsantecipado: TCmDbField;
    FVlrretgan: TCmDbField;
    FVlrdificms: TCmDbField;
    FIdnflivro: TCmDbField;
    FValorimposto: TCmDbField;
    FVlrAveCarre: TcmDbField;
    FVlrCafeManha: TcmDbField;
    procedure SetAliquota(const Value: TCmDbField);
    procedure SetBasecalculo(const Value: TCmDbField);
    procedure SetBcsubst(const Value: TCmDbField);
    procedure SetCodfiscal(const Value: TCmDbField);
    procedure SetCodtipocustagreg(const Value: TCmDbField);
    procedure SetIcmsantecipado(const Value: TCmDbField);
    procedure SetIdimposto(const Value: TCmDbField);
    procedure SetIdnflivro(const Value: TCmDbField);
    procedure SetIdnflivrodetalhe(const Value: TCmDbField);
    procedure SetValorcontabil(const Value: TCmDbField);
    procedure SetValorimposto(const Value: TCmDbField);
    procedure SetValorisento(const Value: TCmDbField);
    procedure SetValoroutros(const Value: TCmDbField);
    procedure SetVlrdificms(const Value: TCmDbField);
    procedure SetVlricmssubst(const Value: TCmDbField);
    procedure SetVlrimpinterno(const Value: TCmDbField);
    procedure SetVlringbruto(const Value: TCmDbField);
    procedure SetVlripi(const Value: TCmDbField);
    procedure SetVlrivacompl(const Value: TCmDbField);
    procedure SetVlrivaperc(const Value: TCmDbField);
    procedure SetVlrretgan(const Value: TCmDbField);
    procedure SetVlrAveCarre(const Value: TcmDbField);
    procedure SetVlrCafeManha(const Value: TcmDbField);
  protected
    function GetSqlSelect: String; Override;
  public

     Property Vlrretgan: TCmDbField read FVlrretgan write SetVlrretgan;
     Property Vlrivaperc: TCmDbField read FVlrivaperc write SetVlrivaperc;
     Property Vlrivacompl: TCmDbField read FVlrivacompl write SetVlrivacompl;
     Property Vlripi: TCmDbField read FVlripi write SetVlripi;
     Property Vlringbruto: TCmDbField read FVlringbruto write SetVlringbruto;
     Property Vlrimpinterno: TCmDbField read FVlrimpinterno write SetVlrimpinterno;
     Property Vlricmssubst: TCmDbField read FVlricmssubst write SetVlricmssubst;
     Property Vlrdificms: TCmDbField read FVlrdificms write SetVlrdificms;
     Property Valoroutros: TCmDbField read FValoroutros write SetValoroutros;
     Property Valorisento: TCmDbField read FValorisento write SetValorisento;
     Property Valorimposto: TCmDbField read FValorimposto write SetValorimposto;
     Property Valorcontabil: TCmDbField read FValorcontabil write SetValorcontabil;
     Property Idnflivrodetalhe: TCmDbField read FIdnflivrodetalhe write SetIdnflivrodetalhe;
     Property Idnflivro: TCmDbField read FIdnflivro write SetIdnflivro;
     Property Idimposto: TCmDbField read FIdimposto write SetIdimposto;
     Property Icmsantecipado: TCmDbField read FIcmsantecipado write SetIcmsantecipado;
     Property Codtipocustagreg: TCmDbField read FCodtipocustagreg write SetCodtipocustagreg;
     Property Codfiscal: TCmDbField read FCodfiscal write SetCodfiscal;
     Property Bcsubst: TCmDbField read FBcsubst write SetBcsubst;
     Property Basecalculo: TCmDbField read FBasecalculo write SetBasecalculo;
     Property Aliquota: TCmDbField read FAliquota write SetAliquota;
     Property VlrAveCarre : TcmDbField read FVlrAveCarre write SetVlrAveCarre;
     Property VlrCafeManha : TcmDbField read FVlrCafeManha write SetVlrCafeManha;

     Constructor Create (Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbNflivrodetalhe }

constructor TDbNflivrodetalhe.Create (Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'NFLIVRODETALHE';

   fVlrretgan := CreateCmDbField('VLRRETGAN',ftfloat,False,False);
   fVlrivaperc := CreateCmDbField('VLRIVAPERC',ftfloat,False,False);
   fVlrivacompl := CreateCmDbField('VLRIVACOMPL',ftfloat,False,False);
   fVlripi := CreateCmDbField('VLRIPI',ftfloat,False,False);
   fVlringbruto := CreateCmDbField('VLRINGBRUTO',ftfloat,False,False);
   fVlrimpinterno := CreateCmDbField('VLRIMPINTERNO',ftfloat,False,False);
   fVlricmssubst := CreateCmDbField('VLRICMSSUBST',ftfloat,False,False);
   fVlrdificms := CreateCmDbField('VLRDIFICMS',ftfloat,False,False);
   fValoroutros := CreateCmDbField('VALOROUTROS',ftfloat,False,False);
   fValorisento := CreateCmDbField('VALORISENTO',ftfloat,False,False);
   fValorimposto := CreateCmDbField('VALORIMPOSTO',ftfloat,False,False);
   fValorcontabil := CreateCmDbField('VALORCONTABIL',ftfloat,False,False);
   fIdnflivrodetalhe := CreateCmDbField('IDNFLIVRODETALHE',ftfloat,True,True);
   fIdnflivro := CreateCmDbField('IDNFLIVRO',ftfloat,True,True);
   fIdimposto := CreateCmDbField('IDIMPOSTO',ftfloat,False,False);
   fIcmsantecipado := CreateCmDbField('ICMSANTECIPADO',ftfloat,False,False);
   fCodtipocustagreg := CreateCmDbField('CODTIPOCUSTAGREG',ftfloat,False,False);
   fCodfiscal := CreateCmDbField('CODFISCAL',ftString,False,False);
   fBcsubst := CreateCmDbField('BCSUBST',ftfloat,False,False);
   fBasecalculo := CreateCmDbField('BASECALCULO',ftfloat,False,False);
   fAliquota := CreateCmDbField('ALIQUOTA',ftfloat,False,False);
   FVlrAveCarre := CreateCmDbField('VLRAVECARRE',ftfloat,False,False);
   FVlrCafeManha := CreateCmDbField('VLRCAFEMANHA',ftfloat,False,False);
end;

function TDbNflivrodetalhe.GetSqlSelect: String;
begin
  If FIdnflivrodetalhe.Asfloat = -1 Then
    Result := 'SELECT NF.IDNFLIVRO, NF.IDNFLIVRODETALHE, NF.IDIMPOSTO, '+
              '       NF.CODTIPOCUSTAGREG, CODFISCAL, ALIQUOTA, BASECALCULO, '+
              '       VALORIMPOSTO, VALORCONTABIL, VALOROUTROS, VALORISENTO, DESCCUSTAGREG, '+
              '       ICMSANTECIPADO, BCSUBST, NOME AS NUMEN, NF.VLRICMSSUBST, NF.VLRIPI, '+
              '       NF.VLRDIFICMS '+
              '  FROM NFLIVRODETALHE NF, TIPOAGRE, IMPOSTOSHOTEL '+
              ' WHERE (IDNFLIVRO = '+ FIdnflivro.AsString +' ) '+
              '   AND (NF.IDIMPOSTO = IMPOSTOSHOTEL.IDIMPOSTO(+)) '+
              '   AND (NF.CODTIPOCUSTAGREG = TIPOAGRE.CODTIPOCUSTAGREG(+)) '
  Else
    Result := inherited GetSqlSelect;
end;

function TDbNflivrodetalhe.Insert: Boolean;
begin

   fIdnflivrodetalhe.AsFloat := GetSequence('NFLIVRODETALHE');
   Result := Inherited Insert;

end;

function TDbNflivrodetalhe.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbNflivrodetalhe.SetAliquota(const Value: TCmDbField);
begin
  FAliquota := Value;
end;

procedure TDbNflivrodetalhe.SetBasecalculo(const Value: TCmDbField);
begin
  FBasecalculo := Value;
end;

procedure TDbNflivrodetalhe.SetBcsubst(const Value: TCmDbField);
begin
  FBcsubst := Value;
end;

procedure TDbNflivrodetalhe.SetCodfiscal(const Value: TCmDbField);
begin
  FCodfiscal := Value;
end;

procedure TDbNflivrodetalhe.SetCodtipocustagreg(const Value: TCmDbField);
begin
  FCodtipocustagreg := Value;
end;

procedure TDbNflivrodetalhe.SetIcmsantecipado(const Value: TCmDbField);
begin
  FIcmsantecipado := Value;
end;

procedure TDbNflivrodetalhe.SetIdimposto(const Value: TCmDbField);
begin
  FIdimposto := Value;
end;

procedure TDbNflivrodetalhe.SetIdnflivro(const Value: TCmDbField);
begin
  FIdnflivro := Value;
end;

procedure TDbNflivrodetalhe.SetIdnflivrodetalhe(const Value: TCmDbField);
begin
  FIdnflivrodetalhe := Value;
end;

procedure TDbNflivrodetalhe.SetValorcontabil(const Value: TCmDbField);
begin
  FValorcontabil := Value;
end;

procedure TDbNflivrodetalhe.SetValorimposto(const Value: TCmDbField);
begin
  FValorimposto := Value;
end;

procedure TDbNflivrodetalhe.SetValorisento(const Value: TCmDbField);
begin
  FValorisento := Value;
end;

procedure TDbNflivrodetalhe.SetValoroutros(const Value: TCmDbField);
begin
  FValoroutros := Value;
end;

procedure TDbNflivrodetalhe.SetVlrAveCarre(const Value: TcmDbField);
begin
  FVlrAveCarre := Value;
end;

procedure TDbNflivrodetalhe.SetVlrCafeManha(const Value: TcmDbField);
begin
  FVlrCafeManha := Value;
end;

procedure TDbNflivrodetalhe.SetVlrdificms(const Value: TCmDbField);
begin
  FVlrdificms := Value;
end;

procedure TDbNflivrodetalhe.SetVlricmssubst(const Value: TCmDbField);
begin
  FVlricmssubst := Value;
end;

procedure TDbNflivrodetalhe.SetVlrimpinterno(const Value: TCmDbField);
begin
  FVlrimpinterno := Value;
end;

procedure TDbNflivrodetalhe.SetVlringbruto(const Value: TCmDbField);
begin
  FVlringbruto := Value;
end;

procedure TDbNflivrodetalhe.SetVlripi(const Value: TCmDbField);
begin
  FVlripi := Value;
end;

procedure TDbNflivrodetalhe.SetVlrivacompl(const Value: TCmDbField);
begin
  FVlrivacompl := Value;
end;

procedure TDbNflivrodetalhe.SetVlrivaperc(const Value: TCmDbField);
begin
  FVlrivaperc := Value;
end;

procedure TDbNflivrodetalhe.SetVlrretgan(const Value: TCmDbField);
begin
  FVlrretgan := Value;
end;

end.



