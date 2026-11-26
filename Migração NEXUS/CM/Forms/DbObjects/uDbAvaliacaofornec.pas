{*******************************************************}
{                                                       }
{ Softtek do Brasil                                     }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Thaise Amaral Martins           }
{ Atualizado Em: 01/11/2011                             }
{                                                       }
{*******************************************************}

unit uDbAvaliacaofornec;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbAvaliacaofornec = class(TCmDbObject)

  private
    FQualidadetecnica: TCmDbField;
    FMotivoqualificacao: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdnatureza: TCmDbField;
    FIdavaliacao: TCmDbField;
    FDtexecucao: TCmDbField;
    FDtavaliacao: TCmDbField;
    FDescricaoservico: TCmDbField;

    procedure SetQualidadetecnica(const Value: TCmDbField);
    procedure SetMotivoqualificacao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdnatureza(const Value: TCmDbField);
    procedure SetIdavaliacao(const Value: TCmDbField);
    procedure SetDtexecucao(const Value: TCmDbField);
    procedure SetDtavaliacao(const Value: TCmDbField);
    procedure SetDescricaoservico(const Value: TCmDbField);
  public

     Property Qualidadetecnica: TCmDbField read FQualidadetecnica write SetQualidadetecnica;
     Property Motivoqualificacao: TCmDbField read FMotivoqualificacao write SetMotivoqualificacao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idnatureza: TCmDbField read FIdnatureza write SetIdnatureza;
     Property Idavaliacao: TCmDbField read FIdavaliacao write SetIdavaliacao;
     Property Dtexecucao: TCmDbField read FDtexecucao write SetDtexecucao;
     Property Dtavaliacao: TCmDbField read FDtavaliacao write SetDtavaliacao;
     Property Descricaoservico: TCmDbField read FDescricaoservico write SetDescricaoservico;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAvaliacaofornec }

constructor TDbAvaliacaofornec.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'AVALIACAOFORNEC';

   fQualidadetecnica := CreateCmDbField('QUALIDADETECNICA',ftString,False,False,False,True,'');
   fMotivoqualificacao := CreateCmDbField('MOTIVOQUALIFICACAO',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdnatureza := CreateCmDbField('IDNATUREZA',ftfloat,True,False,False,True,'');
   fIdavaliacao := CreateCmDbField('IDAVALIACAO',ftfloat,True,True,False,True,'');
   fDtexecucao := CreateCmDbField('DTEXECUCAO',ftDateTime,False,False,False,True,'');
   fDtavaliacao := CreateCmDbField('DTAVALIACAO',ftDateTime,False,False,False,True,'');
   fDescricaoservico := CreateCmDbField('DESCRICAOSERVICO',ftString,False,False,False,True,'');
end;

function TDbAvaliacaofornec.Insert: Boolean;
begin

   fIdavaliacao.AsFloat := GetSequence('AVALIACAOFORNEC');
   Result := Inherited Insert;

end;


procedure TDbAvaliacaofornec.SetDescricaoservico(const Value: TCmDbField);
begin
  FDescricaoservico:= Value;
end;

procedure TDbAvaliacaofornec.SetDtavaliacao(const Value: TCmDbField);
begin
  FDtavaliacao:= Value;
end;

procedure TDbAvaliacaofornec.SetDtexecucao(const Value: TCmDbField);
begin
  FDtexecucao:= Value;
end;

procedure TDbAvaliacaofornec.SetIdavaliacao(const Value: TCmDbField);
begin
  FIdavaliacao:= Value;
end;

procedure TDbAvaliacaofornec.SetIdnatureza(const Value: TCmDbField);
begin
  FIdnatureza:= Value;
end;

procedure TDbAvaliacaofornec.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa:= Value;
end;

procedure TDbAvaliacaofornec.SetMotivoqualificacao(
  const Value: TCmDbField);
begin
  FMotivoqualificacao:= Value;
end;

procedure TDbAvaliacaofornec.SetQualidadetecnica(const Value: TCmDbField);
begin
  FQualidadetecnica:= Value;
end;

end.



