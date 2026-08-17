{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/08/2006                             }
{                                                       }
{*******************************************************}

unit uDbCproteiro;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCproteiro = class(TCmDbObject)

  private
    FIdcproteiro: TCmDbField;
    FRecpag: TCmDbField;
    FDtfim: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FFlgoperacao: TCmDbField;
    FNome: TCmDbField;
    FDescricao: TCmDbField;
    FIdpessoa: TCmDbField;
    FDtinicio: TCmDbField;
    FFlgativo: TCmDbField;
    FFlgorigem: TCmDbField;
    FIdcpativo: TCmDbField;
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetDtfim(const Value: TCmDbField);
    procedure SetDtinicio(const Value: TCmDbField);
    procedure SetFlgoperacao(const Value: TCmDbField);
    procedure SetIdcproteiro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetFlgativo(const Value: TCmDbField);
    procedure SetFlgorigem(const Value: TCmDbField);
    procedure SetIdcpativo(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idcproteiro: TCmDbField read FIdcproteiro write SetIdcproteiro;
     Property Flgoperacao: TCmDbField read FFlgoperacao write SetFlgoperacao;
     Property Dtinicio: TCmDbField read FDtinicio write SetDtinicio;
     Property Dtfim: TCmDbField read FDtfim write SetDtfim;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;
     Property Flgativo: TCmDbField read FFlgativo write SetFlgativo;
     Property Flgorigem: TCmDbField read FFlgorigem write SetFlgorigem;
     Property Idcpativo: TCmDbField read FIdcpativo write SetIdcpativo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCproteiro }

constructor TDbCproteiro.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CPROTEIRO';

   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'Rec/Pag');
   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'Nome');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'Id. Empresa');
   fIdcproteiro := CreateCmDbField('IDCPROTEIRO',ftfloat,True,True,False,True,'Roteiro');
   fFlgoperacao := CreateCmDbField('FLGOPERACAO',ftString,False,False,False,True,'Operação');
   fDtinicio := CreateCmDbField('DTINICIO',ftDateTime,True,False,False,True,'Data inicial');
   fDtfim := CreateCmDbField('DTFIM',ftDateTime,False,False,False,True,'Data final');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'Descrição');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'Desembolso');
   FFlgativo := CreateCmDbField('FLGATIVO',ftString,True,False,False,True,'Ativo');
   FFlgorigem := CreateCmDbField('FLGORIGEM',ftString,True,False,False,True,'Sistema de origem');
   FIdcpativo := CreateCmDbField('IDCPATIVO',ftFloat,True,False,False,True,'Ativo');
end;

function TDbCproteiro.Insert: Boolean;
begin
  fIdcproteiro.AsFloat := GetSequence('CPROTEIRO');
  Result := Inherited Insert;
end;


procedure TDbCproteiro.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbCproteiro.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbCproteiro.SetDtfim(const Value: TCmDbField);
begin
  FDtfim := Value;
end;

procedure TDbCproteiro.SetDtinicio(const Value: TCmDbField);
begin
  FDtinicio := Value;
end;

procedure TDbCproteiro.SetFlgativo(const Value: TCmDbField);
begin
  FFlgativo := Value;
end;

procedure TDbCproteiro.SetFlgoperacao(const Value: TCmDbField);
begin
  FFlgoperacao := Value;
end;

procedure TDbCproteiro.SetFlgorigem(const Value: TCmDbField);
begin
  FFlgorigem := Value;
end;

procedure TDbCproteiro.SetIdcpativo(const Value: TCmDbField);
begin
  FIdcpativo := Value;
end;

procedure TDbCproteiro.SetIdcproteiro(const Value: TCmDbField);
begin
  FIdcproteiro := Value;
end;

procedure TDbCproteiro.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbCproteiro.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbCproteiro.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



