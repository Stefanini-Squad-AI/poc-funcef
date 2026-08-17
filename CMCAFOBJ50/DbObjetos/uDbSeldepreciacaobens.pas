{*******************************************************}
{ Analista Responsável: Helen V Bianchi                 }
{ Atualizado Em: 13/12/2010                             }
{ Nº SOL...........: 142551 Nº KINTANA.......: 911676   }
{*******************************************************}

unit uDbSeldepreciacaobens;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSeldepreciacaobens = class(TCmDbObject)

  private
    FIdseldepreciacao: TCmDbField;
    FIdbem: TCmDbField;
    FIdPessoa: TCmDbField;
    Fflgexecutado: TCmDbField;

    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdseldepreciacao(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure Setflgexecutado(const Value: TCmDbField);
  public
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Idseldepreciacao: TCmDbField read  FIdseldepreciacao write SetIdseldepreciacao;
     Property Idpessoa: TCmDbField read  FIdpessoa write SetIdpessoa;
     Property flgexecutado: TCmDbField read  Fflgexecutado write Setflgexecutado;


     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbSeldepreciacaobens }

constructor TDbSeldepreciacaobens.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SELDEPRECIACAOBENS';

   fIdseldepreciacao := CreateCmDbField('IDSELDEPRECIACAO',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,True,False,True,'');
   Fflgexecutado := CreateCmDbField('flgexecutado',ftfloat,False,False,False,True,'');
end;

function TDbSeldepreciacaobens.Insert: Boolean;
begin
   Result := Inherited Insert; 
end;


procedure TDbSeldepreciacaobens.Setflgexecutado(const Value: TCmDbField);
begin
  Fflgexecutado := Value;
end;

procedure TDbSeldepreciacaobens.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDbSeldepreciacaobens.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbSeldepreciacaobens.SetIdseldepreciacao(const Value: TCmDbField);
begin
  FIdseldepreciacao := Value;
end;

end.



