// Alterações:
{
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 136120
Nº KINTANA..: 812527
Data........: 28/11/2011
Responsável.: Thaise Amaral Martins
Descrição...: Adicionar campo AVALIAFORNECEDOR
-----------------------------------------------------------------------------------------------------
}

{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 29/10/2003
Pendencia : 14802
Descrição : IDPLANCRESPON, CODEXTERNO, sequnce: alterações decorrentes do De/Para
---------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Atualizado Em: 31/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbCentRespon;

interface

uses
   uCmCustomCdbObject, uCmDbObject, DB, uDataBase, sysutils;

type
  TDbCentrespon = class(TCmDbObject)

  private
    FCodcentrocusto: TCmDbField;
    FNome: TCmDbField;
    FIdempresa: TCmDbField;
    FResponsavel: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FIdpessoa: TCmDbField;
    FAnaliticosintet: TCmDbField;
    FIdusuario: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FAtivo: TCmDbField;
    FIDPlanCRespon: TCmDbField;
    FCodExterno: TCmDbField;
    FAvaliacaoFornec: TCmDbField;

    procedure SetAnaliticosintet(const Value: TCmDbField);
    procedure SetAtivo(const Value: TCmDbField);
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetResponsavel(const Value: TCmDbField);
    procedure SetIDPlanCRespon(const Value: TCmDbField);
    procedure SetCodExterno(const Value: TCmDbField);
    procedure SetAvaliacaoFornec(const Value: TCmDbField);

  public

    property Responsavel: TCmDbField read FResponsavel write SetResponsavel;
    property Nome: TCmDbField read FNome write SetNome;
    property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
    property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
    property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;

   //  pendência 14802 - 29/10/2003
    property IDPlanCRespon: TCmDbField read FIDPlanCRespon write SetIDPlanCRespon;
    property CodExterno: TCmDbField read FCodExterno write SetCodExterno;
   // FIM pendência 14802 - 29/10/2003

    property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
    property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
    property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
    property Ativo: TCmDbField read FAtivo write SetAtivo;
    property Analiticosintet: TCmDbField read FAnaliticosintet write SetAnaliticosintet;
    property AvaliacaoFornec: TCmDbField read FAvaliacaoFornec write SetAvaliacaoFornec;

    Constructor Create(Aowner: TCmCustomCdbObject); override;

    Function Insert :Boolean; override;
    Function LoadFromDb :Boolean; override;
  End;

implementation

{ TDbCentrespon }

constructor TDbCentrespon.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CENTRESPON';

  fCodcentrorespon   := CreateCmDbField('CODCENTRORESPON',ftString,True,True,False,True,'Código');
  fIdpessoa          := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Pessoa');

   //  pendência 14802 - 29/10/2003
   FIDPlanCRespon    := CreateCmDbField('IDPLANCRESPON',ftfloat,False,False,False,True,'Plano');
   FCodExterno       := CreateCmDbField('CODEXTERNO',ftString,False,False,False,True,'Código');
   // FIM - pendência 14802 - 29/10/2003

  fNome              := CreateCmDbField('NOME',ftString,True,False,False,True,'Nome');
  fResponsavel       := CreateCmDbField('RESPONSAVEL',ftString,False,False,False,True,'Responsável');
  fIdusuario         := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'Usuário');
  fIdempresa         := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'Empresa');
  // p:22728 30/06/2006
  fCodcentrocusto    := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'Centro de Custo');
  //fim
  fAtivo             := CreateCmDbField('ATIVO',ftString,False,False,False,True,'Ativo');
  fAnaliticosintet   := CreateCmDbField('ANALITICOSINTET',ftString,False,False,False,True,'Analítico/Sintético');
  fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'Usuário Inclusão');
  FAvaliacaoFornec   := CreateCmDbField('AVALIAFORNECEDOR',ftString,False,False,False,True,'');

end;

function TDbCentrespon.Insert: Boolean;
begin
  fCodcentrorespon.AsString := FormatFloat('#0', GetSequence('CENTRESPON'));
  Result := Inherited Insert;
end;

function TDbCentrespon.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbCentrespon.SetAnaliticosintet(const Value: TCmDbField);
begin
  FAnaliticosintet := Value;
end;

procedure TDbCentrespon.SetAtivo(const Value: TCmDbField);
begin
  FAtivo := Value;
end;

procedure TDbCentrespon.SetAvaliacaoFornec(const Value: TCmDbField);
begin
  FAvaliacaoFornec:= Value;
end;

procedure TDbCentrespon.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbCentrespon.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbCentrespon.SetCodExterno(const Value: TCmDbField);
begin
  FCodExterno := Value;
end;

procedure TDbCentrespon.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbCentrespon.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbCentrespon.SetIDPlanCRespon(const Value: TCmDbField);
begin
  FIDPlanCRespon := Value;
end;

procedure TDbCentrespon.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbCentrespon.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbCentrespon.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbCentrespon.SetResponsavel(const Value: TCmDbField);
begin
  FResponsavel := Value;
end;

end.

