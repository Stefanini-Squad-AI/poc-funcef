{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O-,P+,Q+,R+,S-,T-,U-,V-,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: José Roberto Marque             }
{ Atualizado Em: 09/09/2011                             }
{                                                       }
{*******************************************************}

unit uDbTipoRecDesembxAlterador;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTiporecdesembxalterador = class(TCmDbObject)

  private
    FTrguserinclusao       : TCmDbField;
    FTrgdtinclusao         : TCmDbField;
    FTpimposto             : TCmDbField;
    FRecpag                : TCmDbField;
    FPercentual            : TCmDbField;
    FOrdem                 : TCmDbField;
    FIdpessoa              : TCmDbField;
    FIdassociacao          : TCmDbField;
    FCodtiprecdes          : TCmDbField;
    FCodalterador          : TCmDbField;
    Procedure  SetTrguserinclusao (const Value: TCmDbField);
    Procedure  SetTrgdtinclusao   (const Value: TCmDbField);
    Procedure  SetTpimposto       (const Value: TCmDbField);
    Procedure  SetRecpag          (const Value: TCmDbField);
    Procedure  SetPercentual      (const Value: TCmDbField);
    Procedure  SetOrdem           (const Value: TCmDbField);
    Procedure  SetIdpessoa        (const Value: TCmDbField);
    Procedure  SetIdassociacao    (const Value: TCmDbField);
    Procedure  SetCodtiprecdes    (const Value: TCmDbField);
    Procedure  SetCodalterador    (const Value: TCmDbField);

  public
     Property Trguserinclusao:  TCmDbField read  FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao:    TCmDbField read  FTrgdtinclusao   write SetTrgdtinclusao;
     Property Tpimposto:        TCmDbField read  FTpimposto       write SetTpimposto;
     Property Recpag:           TCmDbField read  FRecpag          write SetRecpag;
     Property Percentual:       TCmDbField read  FPercentual      write SetPercentual;
     Property Ordem:            TCmDbField read  FOrdem           write SetOrdem;
     Property Idpessoa:         TCmDbField read  FIdpessoa        write SetIdpessoa;
     Property Idassociacao:     TCmDbField read  FIdassociacao    write SetIdassociacao;
     Property Codtiprecdes:     TCmDbField read  FCodtiprecdes    write SetCodtiprecdes;
     Property Codalterador:     TCmDbField read  FCodalterador    write SetCodalterador;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function Update :Boolean; Override;
     function Append :Boolean;
  End;

implementation

{ TDbTiporecdesembxalterador }

function TDbTiporecdesembxalterador.Append: Boolean;
begin
  Result :=  Self.Insert;
end;

constructor TDbTiporecdesembxalterador.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPORECDESEMBXALTERADOR';

  fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,True,False,False,True,'');
  fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,True,False,False,True,'');
  fTpimposto := CreateCmDbField('TPIMPOSTO',ftString,True,False,False,True,'');
  fRecpag := CreateCmDbField('RECPAG',ftString,True,False,False,True,'');
  fPercentual := CreateCmDbField('PERCENTUAL',ftfloat,True,False,False,True,'');
  fOrdem := CreateCmDbField('ORDEM',ftfloat,True,False,False,True,'');
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
  fIdassociacao := CreateCmDbField('IDASSOCIACAO',ftfloat,True,True,False,True,'');
  fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,False,False,True,'');
  fCodalterador := CreateCmDbField('CODALTERADOR',ftfloat,True,False,False,True,'');
end;

function TDbTiporecdesembxalterador.Insert: Boolean;
begin

   fIdassociacao.AsFloat := GetSequence('SEQTIPORECDESEMBXALTERADOR');
   Result := Inherited Insert;

end;



procedure TDbTiporecdesembxalterador.SetCodalterador(
  const Value: TCmDbField);
begin
    FCodalterador     := Value;
end;

procedure TDbTiporecdesembxalterador.SetCodtiprecdes(
  const Value: TCmDbField);
begin
    FCodtiprecdes     := Value;
end;

procedure TDbTiporecdesembxalterador.SetIdassociacao(
  const Value: TCmDbField);
begin
    FIdassociacao     := Value;
end;

procedure TDbTiporecdesembxalterador.SetIdpessoa(const Value: TCmDbField);
begin
    FIdpessoa         := Value;
end;

procedure TDbTiporecdesembxalterador.SetOrdem(const Value: TCmDbField);
begin
    FOrdem            := Value;
end;

procedure TDbTiporecdesembxalterador.SetPercentual(
  const Value: TCmDbField);
begin
    FPercentual       := Value;
end;

procedure TDbTiporecdesembxalterador.SetRecpag(const Value: TCmDbField);
begin
    FRecpag           := Value;
end;

procedure TDbTiporecdesembxalterador.SetTpimposto(const Value: TCmDbField);
begin
    FTpimposto        := Value;
end;

procedure TDbTiporecdesembxalterador.SetTrgdtinclusao(
  const Value: TCmDbField);
begin
    FTrgdtinclusao    := Value;
end;

procedure TDbTiporecdesembxalterador.SetTrguserinclusao(
  const Value: TCmDbField);
begin
    FTrguserinclusao  := Value;
end;

function TDbTiporecdesembxalterador.Update: Boolean;
begin
  Result := Inherited Update;
end;

end.



