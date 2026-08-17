{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 22/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbParamapuracao;

interface

Uses uCmCustomCDbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbParamapuracao = class(TCmDbObject)

  private
    FVlrtipoimposto: TCmDbField;
    FSeqcampo: TCmDbField;
    FDatasaldocredor: TCmDbField;
    FDatainicial: TCmDbField;
    FTipodebitoimposto: TCmDbField;
    FDescricao: TCmDbField;
    procedure SetDatainicial(const Value: TCmDbField);
    procedure SetDatasaldocredor(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetSeqcampo(const Value: TCmDbField);
    procedure SetTipodebitoimposto(const Value: TCmDbField);
    procedure SetVlrtipoimposto(const Value: TCmDbField);

  public

     Property Vlrtipoimposto: TCmDbField read FVlrtipoimposto write SetVlrtipoimposto;
     Property Tipodebitoimposto: TCmDbField read FTipodebitoimposto write SetTipodebitoimposto;
     Property Seqcampo: TCmDbField read FSeqcampo write SetSeqcampo;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Datasaldocredor: TCmDbField read FDatasaldocredor write SetDatasaldocredor;
     Property Datainicial: TCmDbField read FDatainicial write SetDatainicial;

     Constructor Create (Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbParamapuracao }

constructor TDbParamapuracao.Create (Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMAPURACAO';

   fVlrtipoimposto := CreateCmDbField('VLRTIPOIMPOSTO',ftfloat,False,False,False,True,'');
   fTipodebitoimposto := CreateCmDbField('TIPODEBITOIMPOSTO',ftfloat,True,True,False,True,'');
   fSeqcampo := CreateCmDbField('SEQCAMPO',ftfloat,True,True,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fDatasaldocredor := CreateCmDbField('DATASALDOCREDOR',ftDateTime,False,False,False,True,'');
   fDatainicial := CreateCmDbField('DATAINICIAL',ftDateTime,True,True,False,True,'');
end;

function TDbParamapuracao.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbParamapuracao.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbParamapuracao.SetDatainicial(const Value: TCmDbField);
begin
  FDatainicial := Value;
end;

procedure TDbParamapuracao.SetDatasaldocredor(const Value: TCmDbField);
begin
  FDatasaldocredor := Value;
end;

procedure TDbParamapuracao.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbParamapuracao.SetSeqcampo(const Value: TCmDbField);
begin
  FSeqcampo := Value;
end;

procedure TDbParamapuracao.SetTipodebitoimposto(const Value: TCmDbField);
begin
  FTipodebitoimposto := Value;
end;

procedure TDbParamapuracao.SetVlrtipoimposto(const Value: TCmDbField);
begin
  FVlrtipoimposto := Value;
end;

end.



