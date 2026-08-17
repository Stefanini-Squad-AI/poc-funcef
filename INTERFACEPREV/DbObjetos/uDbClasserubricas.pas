{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbClasserubricas;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbClasserubricas = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FCodpatro: TCmDbField;
    FMescobranca: TCmDbField;
    FCodprovdesc: TCmDbField;
    FMesreferencia: TCmDbField;
    FFlg13: TCmDbField;
    FCodplano: TCmDbField;
    FSeqinterface: TCmDbField;
    FIdcontribuicao: TCmDbField;
    FIdrubrica: TCmDbField;
    FDatareferencia: TCmDbField;
    FOrdemcalculo: TCmDbField;
    FValorrecebido: TCmDbField;
    FChave: TCmDbField;
    FValorchave: TCmDbField;
    FFlgatrasodevol: TCmDbField;
    procedure SetChave(const Value: TCmDbField);
    procedure SetCodpatro(const Value: TCmDbField);
    procedure SetCodplano(const Value: TCmDbField);
    procedure SetCodprovdesc(const Value: TCmDbField);
    procedure SetDatareferencia(const Value: TCmDbField);
    procedure SetFlg13(const Value: TCmDbField);
    procedure SetFlgatrasodevol(const Value: TCmDbField);
    procedure SetIdcontribuicao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdrubrica(const Value: TCmDbField);
    procedure SetMescobranca(const Value: TCmDbField);
    procedure SetMesreferencia(const Value: TCmDbField);
    procedure SetOrdemcalculo(const Value: TCmDbField);
    procedure SetSeqinterface(const Value: TCmDbField);
    procedure SetValorchave(const Value: TCmDbField);
    procedure SetValorrecebido(const Value: TCmDbField);

  public

     Property Valorrecebido: TCmDbField read FValorrecebido write SetValorrecebido;
     Property Valorchave: TCmDbField read FValorchave write SetValorchave;
     Property Seqinterface: TCmDbField read FSeqinterface write SetSeqinterface;
     Property Ordemcalculo: TCmDbField read FOrdemcalculo write SetOrdemcalculo;
     Property Mesreferencia: TCmDbField read FMesreferencia write SetMesreferencia;
     Property Mescobranca: TCmDbField read FMescobranca write SetMescobranca;
     Property Idrubrica: TCmDbField read FIdrubrica write SetIdrubrica;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idcontribuicao: TCmDbField read FIdcontribuicao write SetIdcontribuicao;
     Property Flg13: TCmDbField read FFlg13 write SetFlg13;
     Property Flgatrasodevol: TCmDbField read FFlgatrasodevol write SetFlgatrasodevol;
     Property Datareferencia: TCmDbField read FDatareferencia write SetDatareferencia;
     Property Codprovdesc: TCmDbField read FCodprovdesc write SetCodprovdesc;
     Property Codplano: TCmDbField read FCodplano write SetCodplano;
     Property Codpatro: TCmDbField read FCodpatro write SetCodpatro;
     Property Chave: TCmDbField read FChave write SetChave;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;

     function DeletaTodos : Boolean;
  End;

implementation

{ TDbClasserubricas }

constructor TDbClasserubricas.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CLASSERUBRICAS';

   fValorrecebido := CreateCmDbField('VALORRECEBIDO',ftfloat,False,False,False,True,'');
   fValorchave := CreateCmDbField('VALORCHAVE',ftString,False,False,False,True,'');
   fSeqinterface := CreateCmDbField('SEQINTERFACE',ftfloat,True,True,False,True,'');
   fOrdemcalculo := CreateCmDbField('ORDEMCALCULO',ftfloat,False,False,False,True,'');
   fMesreferencia := CreateCmDbField('MESREFERENCIA',ftString,False,False,False,True,'');
   fMescobranca := CreateCmDbField('MESCOBRANCA',ftString,False,False,False,True,'');
   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdcontribuicao := CreateCmDbField('IDCONTRIBUICAO',ftfloat,False,False,False,True,'');
   fFlg13 := CreateCmDbField('FLG13',ftfloat,False,False,False,True,'');
   fFlgatrasodevol := CreateCmDbField('FLGATRASODEVOL',ftString,False,False,False,True,'');
   fDatareferencia := CreateCmDbField('DATAREFERENCIA',ftDateTime,False,False,False,True,'');
   fCodprovdesc := CreateCmDbField('CODPROVDESC',ftString,False,False,False,True,'');
   fCodplano := CreateCmDbField('CODPLANO',ftfloat,False,False,False,True,'');
   fCodpatro := CreateCmDbField('CODPATRO',ftfloat,True,True,False,True,'');
   fChave := CreateCmDbField('CHAVE',ftString,False,False,False,True,'');
end;

function TDbClasserubricas.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbClasserubricas.SetChave(const Value: TCmDbField);
begin
  FChave := Value;
end;

procedure TDbClasserubricas.SetCodpatro(const Value: TCmDbField);
begin
  FCodpatro := Value;
end;

procedure TDbClasserubricas.SetCodplano(const Value: TCmDbField);
begin
  FCodplano := Value;
end;

procedure TDbClasserubricas.SetCodprovdesc(const Value: TCmDbField);
begin
  FCodprovdesc := Value;
end;

procedure TDbClasserubricas.SetDatareferencia(const Value: TCmDbField);
begin
  FDatareferencia := Value;
end;

procedure TDbClasserubricas.SetFlg13(const Value: TCmDbField);
begin
  FFlg13 := Value;
end;

procedure TDbClasserubricas.SetFlgatrasodevol(const Value: TCmDbField);
begin
  FFlgatrasodevol := Value;
end;

procedure TDbClasserubricas.SetIdcontribuicao(const Value: TCmDbField);
begin
  FIdcontribuicao := Value;
end;

procedure TDbClasserubricas.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbClasserubricas.SetIdrubrica(const Value: TCmDbField);
begin
  FIdrubrica := Value;
end;

procedure TDbClasserubricas.SetMescobranca(const Value: TCmDbField);
begin
  FMescobranca := Value;
end;

procedure TDbClasserubricas.SetMesreferencia(const Value: TCmDbField);
begin
  FMesreferencia := Value;
end;

procedure TDbClasserubricas.SetOrdemcalculo(const Value: TCmDbField);
begin
  FOrdemcalculo := Value;
end;

procedure TDbClasserubricas.SetSeqinterface(const Value: TCmDbField);
begin
  FSeqinterface := Value;
end;

procedure TDbClasserubricas.SetValorchave(const Value: TCmDbField);
begin
  FValorchave := Value;
end;

procedure TDbClasserubricas.SetValorrecebido(const Value: TCmDbField);
begin
  FValorrecebido := Value;
end;


function TDbClasserubricas.DeletaTodos : Boolean;
begin
   SetDbSessionName;
   ExecuteSql('DELETE CLASSERUBRICAS','','',FALSE,'');
end;

end.



