{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 25/02/2002                             }
{                                                       }
{*******************************************************}
(*==============================================================================
Analista : Alex Pereira
Data     : 08/01/04
Pendência: 14451 Nova estrutura para segregação
Solução  : Criar a estrutura FLGSEGREGACRITER
           Determina qual das contas "debito" ou "crédito" será critério para
           segregação
==============================================================================*)

unit uDbPreplanilha;

interface

Uses uCmCustomCdbObject, uCmDbObject,  DB, uDataBase;

Type
  TDbPreplanilha = class(TCmDbObject)

  private
    FPancontaperc: TCmDbField;
    FPannumparc: TCmDbField;
    FPanok100: TCmDbField;
    FPancodigo: TCmDbField;
    FPandescricao: TCmDbField;
    FFlgperiodogera: TCmDbField;
    FPanperiodogera: TCmDbField;
    FPanidentificacao: TCmDbField;
    FPanparcatual: TCmDbField;
    FPaninativo: TCmDbField;
    FPanfase: TCmDbField;
    FIdpessoa: TCmDbField;
    FPanvalorfixo: TCmDbField;
    FPanprocessada: TCmDbField;
    FFlgsegregacriter: TCmDbField;
    procedure SetFlgperiodogera(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetPancodigo(const Value: TCmDbField);
    procedure SetPancontaperc(const Value: TCmDbField);
    procedure SetPandescricao(const Value: TCmDbField);
    procedure SetPanfase(const Value: TCmDbField);
    procedure SetPanidentificacao(const Value: TCmDbField);
    procedure SetPaninativo(const Value: TCmDbField);
    procedure SetPannumparc(const Value: TCmDbField);
    procedure SetPanok100(const Value: TCmDbField);
    procedure SetPanparcatual(const Value: TCmDbField);
    procedure SetPanperiodogera(const Value: TCmDbField);
    procedure SetPanprocessada(const Value: TCmDbField);
    procedure SetPanvalorfixo(const Value: TCmDbField);
    procedure SetFlgsegregacriter(const Value: TCmDbField);

  public

     Property Panvalorfixo: TCmDbField read FPanvalorfixo write SetPanvalorfixo;
     Property Panprocessada: TCmDbField read FPanprocessada write SetPanprocessada;
     Property Panperiodogera: TCmDbField read FPanperiodogera write SetPanperiodogera;
     Property Panparcatual: TCmDbField read FPanparcatual write SetPanparcatual;
     Property Panok100: TCmDbField read FPanok100 write SetPanok100;
     Property Pannumparc: TCmDbField read FPannumparc write SetPannumparc;
     Property Paninativo: TCmDbField read FPaninativo write SetPaninativo;
     Property Panidentificacao: TCmDbField read FPanidentificacao write SetPanidentificacao;
     Property Panfase: TCmDbField read FPanfase write SetPanfase;
     Property Pandescricao: TCmDbField read FPandescricao write SetPandescricao;
     Property Pancontaperc: TCmDbField read FPancontaperc write SetPancontaperc;
     Property Pancodigo: TCmDbField read FPancodigo write SetPancodigo;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Flgperiodogera: TCmDbField read FFlgperiodogera write SetFlgperiodogera;
     // Alex 08/01/04 14451
     Property Flgsegregacriter: TCmDbField read FFlgsegregacriter write SetFlgsegregacriter;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPreplanilha }

constructor TDbPreplanilha.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PREPLANILHA';

   fPanvalorfixo     := CreateCmDbField('PANVALORFIXO',ftfloat,False,False,False,True,'');
   fPanprocessada    := CreateCmDbField('PANPROCESSADA',ftString,False,False,False,True,'');
   fPanperiodogera   := CreateCmDbField('PANPERIODOGERA',ftfloat,False,False,False,True,'');
   fPanparcatual     := CreateCmDbField('PANPARCATUAL',ftfloat,False,False,False,True,'');
   fPanok100         := CreateCmDbField('PANOK100',ftString,False,False,False,True,'');
   fPannumparc       := CreateCmDbField('PANNUMPARC',ftfloat,False,False,False,True,'');
   fPaninativo       := CreateCmDbField('PANINATIVO',ftString,False,False,False,True,'');
   fPanidentificacao := CreateCmDbField('PANIDENTIFICACAO',ftString,True,False,False,True,'');
   fPanfase          := CreateCmDbField('PANFASE',ftfloat,False,False,False,True,'');
   fPandescricao     := CreateCmDbField('PANDESCRICAO',ftString,True,False,False,True,'');
   fPancontaperc     := CreateCmDbField('PANCONTAPERC',ftString,False,False,False,True,'');
   fPancodigo        := CreateCmDbField('PANCODIGO',ftfloat,True,True,False,True,'');
   fIdpessoa         := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fFlgperiodogera   := CreateCmDbField('FLGSEGREGACRITER',ftString,False,False,False,True,'');
   // Alex 08/01/04 14451
   FFlgsegregacriter := CreateCmDbField('FLGPERIODOGERA',ftString,False,False,False,True,'');

end;

function TDbPreplanilha.Insert: Boolean;
begin

   fPancodigo.AsFloat := GetSequence('PREPLANILHA');
   Result := Inherited Insert;

end;

function TDbPreplanilha.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbPreplanilha.SetFlgperiodogera(const Value: TCmDbField);
begin
  FFlgperiodogera := Value;
end;

procedure TDbPreplanilha.SetFlgsegregacriter(const Value: TCmDbField);
begin
  FFlgsegregacriter := Value;
end;

procedure TDbPreplanilha.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPreplanilha.SetPancodigo(const Value: TCmDbField);
begin
  FPancodigo := Value;
end;

procedure TDbPreplanilha.SetPancontaperc(const Value: TCmDbField);
begin
  FPancontaperc := Value;
end;

procedure TDbPreplanilha.SetPandescricao(const Value: TCmDbField);
begin
  FPandescricao := Value;
end;

procedure TDbPreplanilha.SetPanfase(const Value: TCmDbField);
begin
  FPanfase := Value;
end;

procedure TDbPreplanilha.SetPanidentificacao(const Value: TCmDbField);
begin
  FPanidentificacao := Value;
end;

procedure TDbPreplanilha.SetPaninativo(const Value: TCmDbField);
begin
  FPaninativo := Value;
end;

procedure TDbPreplanilha.SetPannumparc(const Value: TCmDbField);
begin
  FPannumparc := Value;
end;

procedure TDbPreplanilha.SetPanok100(const Value: TCmDbField);
begin
  FPanok100 := Value;
end;

procedure TDbPreplanilha.SetPanparcatual(const Value: TCmDbField);
begin
  FPanparcatual := Value;
end;

procedure TDbPreplanilha.SetPanperiodogera(const Value: TCmDbField);
begin
  FPanperiodogera := Value;
end;

procedure TDbPreplanilha.SetPanprocessada(const Value: TCmDbField);
begin
  FPanprocessada := Value;
end;

procedure TDbPreplanilha.SetPanvalorfixo(const Value: TCmDbField);
begin
  FPanvalorfixo := Value;
end;

end.



