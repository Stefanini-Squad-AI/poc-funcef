 unit uDbCpRotApurado;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCpRotApurado = class(TCmDbObject)

  private
    FDtapuracao: TCmDbField;
    FIdcproteiro: TCmDbField;
    FFlgtipoapur: TCmDbField;
    FFlgstatus: TCmDbField;
    FIdcprotapurado: TCmDbField;
    FIdusuario: TCmDbField;
    FIdcpexecrot: TCmDbField;
    FObservacao: TCmDbField;
    FCoddocumento: TCmDbField;
    FFlgoperacao: TCmDbField;
    FNumlancto: TCmDbField;
    FCodlancfinanc: TCmDbField;
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetDtapuracao(const Value: TCmDbField);
    procedure SetFlgstatus(const Value: TCmDbField);
    procedure SetFlgtipoapur(const Value: TCmDbField);
    procedure SetIdcpexecrot(const Value: TCmDbField);
    procedure SetIdcprotapurado(const Value: TCmDbField);
    procedure SetIdcproteiro(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetFlgoperacao(const Value: TCmDbField);
    procedure SetNumlancto(const Value: TCmDbField);
    procedure SetCodlancfinanc(const Value: TCmDbField);

  public

     //Indica se o sequence será alimentado no insert
     bUsaSequence : boolean;

     Property Idcprotapurado: TCmDbField read FIdcprotapurado write SetIdcprotapurado;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idcproteiro: TCmDbField read FIdcproteiro write SetIdcproteiro;
     Property Idcpexecrot: TCmDbField read FIdcpexecrot write SetIdcpexecrot;
     Property Flgtipoapur: TCmDbField read FFlgtipoapur write SetFlgtipoapur;
     Property Flgstatus: TCmDbField read FFlgstatus write SetFlgstatus;
     Property Dtapuracao: TCmDbField read FDtapuracao write SetDtapuracao;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;
     Property Numlancto: TCmDbField read FNumlancto write SetNumlancto;
     Property Flgoperacao: TCmDbField read FFlgoperacao write SetFlgoperacao;
     Property Codlancfinanc: TCmDbField read FCodlancfinanc write SetCodlancfinanc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCpRotApurado }

constructor TDbCpRotApurado.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  bUsaSequence := True;

  ErrorIfNoRowsAffected := False;

  TableName := 'CPROTAPURADO';

   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'Observação');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,False,False,True,'Id. Usuário');
   fIdcproteiro := CreateCmDbField('IDCPROTEIRO',ftfloat,True,False,False,True,'Id. Roteiro');
   fIdcprotapurado := CreateCmDbField('IDCPROTAPURADO',ftfloat,True,True,False,True,'Id. Apuração');
   fIdcpexecrot := CreateCmDbField('IDCPEXECROT',ftfloat,False,False,False,True,'Id. Execução');
   fFlgtipoapur := CreateCmDbField('FLGTIPOAPUR',ftString,True,False,False,True,'Tipo de Apuração');
   fFlgstatus := CreateCmDbField('FLGSTATUS',ftString,False,False,False,True,'Status');
   fDtapuracao := CreateCmDbField('DTAPURACAO',ftDateTime,True,False,False,True,'Dt. Apuração' );
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'Cod. Documento');
   fNumlancto := CreateCmDbField('NUMLANCTO',ftfloat,False,False,False,True,'Num. lançamento');
   fFlgoperacao := CreateCmDbField('FLGOPERACAO',ftString,False,False,False,True,'Tipo de Operação');
   fCodlancfinanc := CreateCmDbField('CODLANCFINANC',ftString,False,False,False,True,'Cod. Lançamento Financeiro');
end;

function TDbCpRotApurado.Insert: Boolean;
begin
  if bUsaSequence then
    fIdcprotapurado.AsFloat := GetSequence('CPROTAPURADO');
  Result := Inherited Insert;
end;


procedure TDbCpRotApurado.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbCpRotApurado.SetCodlancfinanc(const Value: TCmDbField);
begin
  FCodlancfinanc := Value;
end;

procedure TDbCpRotApurado.SetDtapuracao(const Value: TCmDbField);
begin
  FDtapuracao := Value;
end;

procedure TDbCpRotApurado.SetFlgoperacao(const Value: TCmDbField);
begin
  FFlgoperacao := Value;
end;

procedure TDbCpRotApurado.SetFlgstatus(const Value: TCmDbField);
begin
  FFlgstatus := Value;
end;

procedure TDbCpRotApurado.SetFlgtipoapur(const Value: TCmDbField);
begin
  FFlgtipoapur := Value;
end;

procedure TDbCpRotApurado.SetIdcpexecrot(const Value: TCmDbField);
begin
  FIdcpexecrot := Value;
end;

procedure TDbCpRotApurado.SetIdcprotapurado(const Value: TCmDbField);
begin
  FIdcprotapurado := Value;
end;

procedure TDbCpRotApurado.SetIdcproteiro(const Value: TCmDbField);
begin
  FIdcproteiro := Value;
end;

procedure TDbCpRotApurado.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbCpRotApurado.SetNumlancto(const Value: TCmDbField);
begin
  FNumlancto := Value;
end;

procedure TDbCpRotApurado.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

end.



