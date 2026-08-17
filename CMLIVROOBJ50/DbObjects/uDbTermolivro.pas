{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 09/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbTermolivro;

interface

Uses uCmCustomCDbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbTermolivro = class(TCmDbObject)

  private
    FTertexto: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FIdpessoa: TCmDbField;
    FAbertfecham: TCmDbField;
    FFLGENTRADASAIDA: TcmDbField;
    procedure SetTertexto(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetAbertfecham(const Value: TCmDbField);
    procedure SetFLGENTRADASAIDA(const Value: TcmDbField);

  protected
    function GetSqlSelect: String; Override;
  public

     Property Tertexto: TCmDbField          read FTertexto          write SetTertexto;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idpessoa: TCmDbField          read FIdpessoa          write SetIdpessoa;
     Property Abertfecham: TCmDbField       read FAbertfecham       write SetAbertfecham;
     property FLGENTRADASAIDA : TcmDbField  read FFLGENTRADASAIDA   write SetFLGENTRADASAIDA;

     Constructor Create (Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTermolivro }

constructor TDbTermolivro.Create (Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TERMOLIVRO';

  fTertexto := CreateCmDbField('TERTEXTO',ftString,True);
  fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,True);
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True);
  fAbertfecham := CreateCmDbField('ABERTFECHAM',ftString,True,True);
  FFLGENTRADASAIDA := CreateCmDbField('FLGENTRADASAIDA',ftString,True,True);
end;

function TDbTermolivro.GetSqlSelect: String;
begin
  If FIdpessoa.AsInteger = -1 Then
    Result := 'SELECT T.IDPESSOA, T.ABERTFECHAM, T.TERTEXTO, ' +
              '       T.IDUSUARIOINCLUSAO, T.FLGENTRADASAIDA '+
              '  FROM TERMOLIVRO T '+
              ' ORDER BY T.IDPESSOA, T.ABERTFECHAM, T.FLGENTRADASAIDA, T.TERTEXTO'
  Else
    Result := inherited GetSqlSelect;

end;


function TDbTermolivro.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbTermolivro.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTermolivro.SetAbertfecham(const Value: TCmDbField);
begin
  FAbertfecham := Value;
end;

procedure TDbTermolivro.SetFLGENTRADASAIDA(const Value: TcmDbField);
begin
  FFLGENTRADASAIDA := Value;
end;

procedure TDbTermolivro.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbTermolivro.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbTermolivro.SetTertexto(const Value: TCmDbField);
begin
  FTertexto := Value;
end;


end.



