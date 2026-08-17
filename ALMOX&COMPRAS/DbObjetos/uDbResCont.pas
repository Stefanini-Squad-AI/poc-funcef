{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 18/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbResCont;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbResCont = class(TCmDbObject)

  private
    FLocalizacao: TCmDbField;
    FIdMov: TCmDbField;
    FCodArtigo: TCmDbField;
    FQtdeCorrecoes: TCmDbField;
    FQtdeRecontagem: TCmDbField;
    FQtdeMovPosterior: TCmDbField;
    FDiferencaAtual: TCmDbField;
    FSaldoInicial: TCmDbField;
    FQtdeContada: TCmDbField;
    FIdInventario: TCmDbField;
    procedure SetCodArtigo(const Value: TCmDbField);
    procedure SetDiferencaAtual(const Value: TCmDbField);
    procedure SetIdInventario(const Value: TCmDbField);
    procedure SetIdMov(const Value: TCmDbField);
    procedure SetLocalizacao(const Value: TCmDbField);
    procedure SetQtdeContada(const Value: TCmDbField);
    procedure SetQtdeCorrecoes(const Value: TCmDbField);
    procedure SetQtdeMovPosterior(const Value: TCmDbField);
    procedure SetQtdeRecontagem(const Value: TCmDbField);
    procedure SetSaldoInicial(const Value: TCmDbField);

  public
     Property SaldoInicial     : TCmDbField read FSaldoInicial write SetSaldoInicial;
     Property QtdeRecontagem   : TCmDbField read FQtdeRecontagem write SetQtdeRecontagem;
     Property QtdeMovPosterior : TCmDbField read FQtdeMovPosterior write SetQtdeMovPosterior;
     Property QtdeCorrecoes    : TCmDbField read FQtdeCorrecoes write SetQtdeCorrecoes;
     Property QtdeContada      : TCmDbField read FQtdeContada write SetQtdeContada;
     Property Localizacao      : TCmDbField read FLocalizacao write SetLocalizacao;
     Property IdMov            : TCmDbField read FIdMov write SetIdMov;
     Property IdInventario     : TCmDbField read FIdInventario write SetIdInventario;
     Property DiferencaAtual   : TCmDbField read FDiferencaAtual write SetDiferencaAtual;
     Property CodArtigo        : TCmDbField read FCodArtigo write SetCodArtigo;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbResCont }

constructor TDbResCont.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RESCONT';

   fSaldoinicial := CreateCmDbField('SALDOINICIAL',ftfloat,True,False,False,True,'');
   fQtderecontagem := CreateCmDbField('QTDERECONTAGEM',ftfloat,False,False,False,True,'');
   fQtdemovposterior := CreateCmDbField('QTDEMOVPOSTERIOR',ftfloat,False,False,False,True,'');
   fQtdecorrecoes := CreateCmDbField('QTDECORRECOES',ftfloat,False,False,False,True,'');
   fQtdecontada := CreateCmDbField('QTDECONTADA',ftfloat,False,False,False,True,'');
   fLocalizacao := CreateCmDbField('LOCALIZACAO',ftString,False,False,False,True,'');
   fIdmov := CreateCmDbField('IDMOV',ftfloat,False,False,False,True,'');
   fIdinventario := CreateCmDbField('IDINVENTARIO',ftfloat,True,True,False,True,'');
   fDiferencaatual := CreateCmDbField('DIFERENCAATUAL',ftfloat,False,False,False,True,'');
   fCodartigo := CreateCmDbField('CODARTIGO',ftString,True,True,False,True,'');
end;

function TDbResCont.Insert: Boolean;
begin

   fIdinventario.AsFloat := GetSequence('RESCONT');
   Result := Inherited Insert;

end;

function TDbResCont.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbResCont.SetCodArtigo(const Value: TCmDbField);
begin
  FCodArtigo := Value;
end;

procedure TDbResCont.SetDiferencaAtual(const Value: TCmDbField);
begin
  FDiferencaAtual := Value;
end;

procedure TDbResCont.SetIdInventario(const Value: TCmDbField);
begin
  FIdInventario := Value;
end;

procedure TDbResCont.SetIdMov(const Value: TCmDbField);
begin
  FIdMov := Value;
end;

procedure TDbResCont.SetLocalizacao(const Value: TCmDbField);
begin
  FLocalizacao := Value;
end;

procedure TDbResCont.SetQtdeContada(const Value: TCmDbField);
begin
  FQtdeContada := Value;
end;

procedure TDbResCont.SetQtdeCorrecoes(const Value: TCmDbField);
begin
  FQtdeCorrecoes := Value;
end;

procedure TDbResCont.SetQtdeMovPosterior(const Value: TCmDbField);
begin
  FQtdeMovPosterior := Value;
end;

procedure TDbResCont.SetQtdeRecontagem(const Value: TCmDbField);
begin
  FQtdeRecontagem := Value;
end;

procedure TDbResCont.SetSaldoInicial(const Value: TCmDbField);
begin
  FSaldoInicial := Value;
end;

end.



