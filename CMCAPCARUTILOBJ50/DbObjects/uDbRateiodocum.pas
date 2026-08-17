{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbRateiodocum;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbRateiodocum = class(TCmDbObject)

  private
    FRecpag: TCmDbField;
    FIdpatro: TCmDbField;
    FNumimovel: TCmDbField;
    FIdrateiodocum: TCmDbField;
    FIdprocesso: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FValor: TCmDbField;
    FMoecodigo: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FIdempresa: TCmDbField;
    FCoddocumento: TCmDbField;
    FPlano: TCmDbField;
    FVlrresorcamen: TCmDbField;
    FIdplanoprev: TCmDbField;
    FValoroutramoeda: TCmDbField;
    FIdprograma: TCmDbField;
    FIdreservaorcamen: TCmDbField;
    FUnidnegoc: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FIdpessoa: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdprocesso(const Value: TCmDbField);
    procedure SetIdprograma(const Value: TCmDbField);
    procedure SetIdrateiodocum(const Value: TCmDbField);
    procedure SetIdreservaorcamen(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetNumimovel(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);
    procedure SetValoroutramoeda(const Value: TCmDbField);
    procedure SetVlrresorcamen(const Value: TCmDbField);

  public

     Property Vlrresorcamen: TCmDbField read FVlrresorcamen write SetVlrresorcamen;
     Property Valoroutramoeda: TCmDbField read FValoroutramoeda write SetValoroutramoeda;
     Property Valor: TCmDbField read FValor write SetValor;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Numimovel: TCmDbField read FNumimovel write SetNumimovel;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idreservaorcamen: TCmDbField read FIdreservaorcamen write SetIdreservaorcamen;
     Property Idrateiodocum: TCmDbField read FIdrateiodocum write SetIdrateiodocum;
     Property Idprograma: TCmDbField read FIdprograma write SetIdprograma;
     Property Idprocesso: TCmDbField read FIdprocesso write SetIdprocesso;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
     function Insert: Boolean; Override;
  End;

implementation

{ TDbRateiodocum }

constructor TDbRateiodocum.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RATEIODOCUM';

  fVlrresorcamen := CreateCmDbField('VLRRESORCAMEN',ftfloat,False,False,False,False,'',2);
  fValoroutramoeda := CreateCmDbField('VALOROUTRAMOEDA',ftfloat,False,False,False,False,'',2);
  fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,False,'',2);
  fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
  fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
  fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
  fNumimovel := CreateCmDbField('NUMIMOVEL',ftString,False,False,False,True,'');
  fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
  fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,True,False,False,True,'');
  fIdreservaorcamen := CreateCmDbField('IDRESERVAORCAMEN',ftfloat,False,False,False,True,'');
  fIdrateiodocum := CreateCmDbField('IDRATEIODOCUM',ftfloat,True,True,False,True,'');
  fIdprograma := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
  fIdprocesso := CreateCmDbField('IDPROCESSO',ftfloat,False,False,False,True,'');
  fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
  fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
  fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,False,False,True,'');
  fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,False,False,True,'');
  fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,True,False,False,True,'');
  fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,True,False,False,True,'');
  fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
end;

function TDbRateiodocum.Insert: Boolean;
begin
   fIdrateiodocum.AsFloat := GetSequence('RATEIODOCUM');
   Result := Inherited Insert;
end;

procedure TDbRateiodocum.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbRateiodocum.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbRateiodocum.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbRateiodocum.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbRateiodocum.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbRateiodocum.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbRateiodocum.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbRateiodocum.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbRateiodocum.SetIdprocesso(const Value: TCmDbField);
begin
  FIdprocesso := Value;
end;

procedure TDbRateiodocum.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

procedure TDbRateiodocum.SetIdrateiodocum(const Value: TCmDbField);
begin
  FIdrateiodocum := Value;
end;

procedure TDbRateiodocum.SetIdreservaorcamen(const Value: TCmDbField);
begin
  FIdreservaorcamen := Value;
end;

procedure TDbRateiodocum.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbRateiodocum.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbRateiodocum.SetNumimovel(const Value: TCmDbField);
begin
  FNumimovel := Value;
end;

procedure TDbRateiodocum.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbRateiodocum.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDbRateiodocum.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbRateiodocum.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

procedure TDbRateiodocum.SetValoroutramoeda(const Value: TCmDbField);
begin
  FValoroutramoeda := Value;
end;

procedure TDbRateiodocum.SetVlrresorcamen(const Value: TCmDbField);
begin
  FVlrresorcamen := Value;
end;

end.



