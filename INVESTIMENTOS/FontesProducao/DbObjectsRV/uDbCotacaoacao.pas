//******************************************************************************
// Data      : 03/09/2007
// Código    : AL_19
// Pendencia : 26219
// SOL       :
// Motivo    : Implementações da Importação Arquivos Bovespa
//******************************************************************************

unit uDbCotacaoacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCotacaoacao = class(TCmDbObject)

  private
    FDatacotaacao: TCmDbField;
    FQtdelote: TCmDbField;
    FIdacao: TCmDbField;
    FVlrminima: TCmDbField;
    FVlrabertura: TCmDbField;
    FIdemissor: TCmDbField;
    FVlrmedia: TCmDbField;
    FVlrfechamento: TCmDbField;
    FIdbolsavalores: TCmDbField;
    FVlrmaxima: TCmDbField;
    FVolnegociado: TCmDbField;
    procedure SetDatacotaacao(const Value: TCmDbField);
    procedure SetIdacao(const Value: TCmDbField);
    procedure SetIdbolsavalores(const Value: TCmDbField);
    procedure SetIdemissor(const Value: TCmDbField);
    procedure SetQtdelote(const Value: TCmDbField);
    procedure SetVlrabertura(const Value: TCmDbField);
    procedure SetVlrfechamento(const Value: TCmDbField);
    procedure SetVlrmaxima(const Value: TCmDbField);
    procedure SetVlrmedia(const Value: TCmDbField);
    procedure SetVlrminima(const Value: TCmDbField);
    procedure SetVolnegociado(const Value: TCmDbField);

  public

     Property Volnegociado: TCmDbField read FVolnegociado write SetVolnegociado;
     Property Vlrminima: TCmDbField read FVlrminima write SetVlrminima;
     Property Vlrmedia: TCmDbField read FVlrmedia write SetVlrmedia;
     Property Vlrmaxima: TCmDbField read FVlrmaxima write SetVlrmaxima;
     Property Vlrfechamento: TCmDbField read FVlrfechamento write SetVlrfechamento;
     Property Vlrabertura: TCmDbField read FVlrabertura write SetVlrabertura;
     Property Qtdelote: TCmDbField read FQtdelote write SetQtdelote;
     Property Idemissor: TCmDbField read FIdemissor write SetIdemissor;
     Property Idbolsavalores: TCmDbField read FIdbolsavalores write SetIdbolsavalores;
     Property Idacao: TCmDbField read FIdacao write SetIdacao;
     Property Datacotaacao: TCmDbField read FDatacotaacao write SetDatacotaacao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCotacaoacao }

constructor TDbCotacaoacao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'COTACAOACAO';

   fVolnegociado := CreateCmDbField('VOLNEGOCIADO',ftfloat,False,False,False,True,'');
   fVlrminima := CreateCmDbField('VLRMINIMA',ftfloat,False,False,False,True,'');
   fVlrmedia := CreateCmDbField('VLRMEDIA',ftfloat,True,False,False,True,'');
   fVlrmaxima := CreateCmDbField('VLRMAXIMA',ftfloat,False,False,False,True,'');
   fVlrfechamento := CreateCmDbField('VLRFECHAMENTO',ftfloat,False,False,False,True,'');
   fVlrabertura := CreateCmDbField('VLRABERTURA',ftfloat,False,False,False,True,'');
   fQtdelote := CreateCmDbField('QTDELOTE',ftfloat,False,False,False,True,'');
   fIdemissor := CreateCmDbField('IDEMISSOR',ftfloat,True,True,False,True,'');
   fIdbolsavalores := CreateCmDbField('IDBOLSAVALORES',ftfloat,True,True,False,True,'');
   fIdacao := CreateCmDbField('IDACAO',ftfloat,True,True,False,True,'');
   fDatacotaacao := CreateCmDbField('DATACOTAACAO',ftDateTime,True,True,False,True,'');
end;

function TDbCotacaoacao.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbCotacaoacao.SetDatacotaacao(const Value: TCmDbField);
begin
  FDatacotaacao := Value;
end;

procedure TDbCotacaoacao.SetIdacao(const Value: TCmDbField);
begin
  FIdacao := Value;
end;

procedure TDbCotacaoacao.SetIdbolsavalores(const Value: TCmDbField);
begin
  FIdbolsavalores := Value;
end;

procedure TDbCotacaoacao.SetIdemissor(const Value: TCmDbField);
begin
  FIdemissor := Value;
end;

procedure TDbCotacaoacao.SetQtdelote(const Value: TCmDbField);
begin
  FQtdelote := Value;
end;

procedure TDbCotacaoacao.SetVlrabertura(const Value: TCmDbField);
begin
  FVlrabertura := Value;
end;

procedure TDbCotacaoacao.SetVlrfechamento(const Value: TCmDbField);
begin
  FVlrfechamento := Value;
end;

procedure TDbCotacaoacao.SetVlrmaxima(const Value: TCmDbField);
begin
  FVlrmaxima := Value;
end;

procedure TDbCotacaoacao.SetVlrmedia(const Value: TCmDbField);
begin
  FVlrmedia := Value;
end;

procedure TDbCotacaoacao.SetVlrminima(const Value: TCmDbField);
begin
  FVlrminima := Value;
end;

procedure TDbCotacaoacao.SetVolnegociado(const Value: TCmDbField);
begin
  FVolnegociado := Value;
end;

end.



