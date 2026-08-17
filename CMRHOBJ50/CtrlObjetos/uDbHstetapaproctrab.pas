{*******************************************************}
{                                                       }
{ Softtek do Brasil                                     }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Emerson S.                      }
{ Atualizado Em: 09/04/2009                             }
{ Descricao : Criado para atender o chamado  KT 522313  }
{ SOL 112597.                                           }
{*******************************************************}

unit uDbHstetapaproctrab;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHstetapaproctrab = class(TCmDbObject)
  private
    FTrguserinclusao: TCmDbField;
    FCodtiporecurso: TCmDbField;
    FDataatu: TCmDbField;
    FValoratu: TCmDbField;
    FNumseq: TCmDbField;
    FNumproctrab: TCmDbField;
    FIdhistetapaproc: TCmDbField;
    FAssunto: TCmDbField;
    FTrgdtinclusao: TCmDbField;

    procedure SetAssunto(const Value: TCmDbField);
    procedure SetCodtiporecurso(const Value: TCmDbField);
    procedure SetDataatu(const Value: TCmDbField);
    procedure SetIdhistetapaproc(const Value: TCmDbField);
    procedure SetNumproctrab(const Value: TCmDbField);
    procedure SetNumseq(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetValoratu(const Value: TCmDbField);

  //private

  public
     Property Idhistetapaproc  : TCmDbField read FIdhistetapaproc write SetIdhistetapaproc;
     Property Numseq           : TCmDbField read FNumseq          write SetNumseq;
     Property Numproctrab      : TCmDbField read FNumproctrab     write SetNumproctrab;
     Property Valoratu         : TCmDbField read FValoratu        write SetValoratu;
     Property Dataatu          : TCmDbField read FDataatu         write SetDataatu;
     Property Codtiporecurso   : TCmDbField read FCodtiporecurso  write SetCodtiporecurso;
     Property Assunto          : TCmDbField read FAssunto         write SetAssunto;
     Property Trguserinclusao  : TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao    : TCmDbField read FTrgdtinclusao   write SetTrgdtinclusao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHstetapaproctrab }

constructor TDbHstetapaproctrab.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HSTETAPAPROCTRAB';

   fValoratu        := CreateCmDbField('VALORATU',ftfloat,False,False,False,True,'');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao   := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fNumseq          := CreateCmDbField('NUMSEQ',ftfloat,False,False,False,True,'');
   fNumproctrab     := CreateCmDbField('NUMPROCTRAB',ftfloat,False,False,False,True,'');
   fIdhistetapaproc := CreateCmDbField('IDHISTETAPAPROC',ftfloat,True,True,False,True,'');
   fDataatu         := CreateCmDbField('DATAATU',ftDateTime,False,False,False,True,'');
   fCodtiporecurso  := CreateCmDbField('CODTIPORECURSO',ftfloat,False,False,False,True,'');
   fAssunto         := CreateCmDbField('ASSUNTO',ftString,False,False,False,True,'');
end;

function TDbHstetapaproctrab.Insert: Boolean;
begin

   fIdhistetapaproc.AsFloat := GetSequence('HSTETAPAPROCTRAB');
   Result := Inherited Insert;

end;


procedure TDbHstetapaproctrab.SetAssunto(const Value: TCmDbField);
begin
  FAssunto := Value;
end;

procedure TDbHstetapaproctrab.SetCodtiporecurso(const Value: TCmDbField);
begin
  FCodtiporecurso := Value;
end;

procedure TDbHstetapaproctrab.SetDataatu(const Value: TCmDbField);
begin
  FDataatu := Value;
end;

procedure TDbHstetapaproctrab.SetIdhistetapaproc(const Value: TCmDbField);
begin
  FIdhistetapaproc := Value;
end;

procedure TDbHstetapaproctrab.SetNumproctrab(const Value: TCmDbField);
begin
  FNumproctrab := Value;
end;

procedure TDbHstetapaproctrab.SetNumseq(const Value: TCmDbField);
begin
  FNumseq := Value;
end;

procedure TDbHstetapaproctrab.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbHstetapaproctrab.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbHstetapaproctrab.SetValoratu(const Value: TCmDbField);
begin
  FValoratu := Value;
end;

end.



