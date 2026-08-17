{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: William M. Santos               }
{ Atualizado Em: 05/03/2010                             }
{                                                       }
{*******************************************************}

unit uDbEtpDesdobramento;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbEtpDesdobramento = class(TCmDbObject)
  private

    FVlrcalccontadoria: TCmDbField;
    FDatadeposito: TCmDbField;
    FCodtiporecurso: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FIdtpdesdobramento: TCmDbField;
    FNumproctrab: TCmDbField;
    FTpimpugcalculo: TCmDbField;
    FVlrcreditado: TCmDbField;
    FTpdesdobramento: TCmDbField;
    FCodportador: TCmDbField;
    FIdcbancaria: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FNumSeq: TCmDbField;
    FDataContadoria: TCmDbField;
    procedure SetCodportador(const Value: TCmDbField);
    procedure SetCodtiporecurso(const Value: TCmDbField);
    procedure SetDatadeposito(const Value: TCmDbField);
    procedure SetIdcbancaria(const Value: TCmDbField);
    procedure SetIdtpdesdobramento(const Value: TCmDbField);
    procedure SetNumproctrab(const Value: TCmDbField);
    procedure SetTpdesdobramento(const Value: TCmDbField);
    procedure SetTpimpugcalculo(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetVlrcalccontadoria(const Value: TCmDbField);
    procedure SetVlrcreditado(const Value: TCmDbField);
    procedure SetNumSeq(const Value: TCmDbField);
    procedure SetDataContadoria(const Value: TCmDbField);
  public
     Property Vlrcreditado: TCmDbField read FVlrcreditado write SetVlrcreditado;
     Property Vlrcalccontadoria: TCmDbField read FVlrcalccontadoria write SetVlrcalccontadoria;
     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Tpimpugcalculo: TCmDbField read FTpimpugcalculo write SetTpimpugcalculo;
     Property Tpdesdobramento: TCmDbField read FTpdesdobramento write SetTpdesdobramento;
     Property Numproctrab: TCmDbField read FNumproctrab write SetNumproctrab;
     Property Idtpdesdobramento: TCmDbField read FIdtpdesdobramento write SetIdtpdesdobramento;
     Property Idcbancaria: TCmDbField read FIdcbancaria write SetIdcbancaria;
     Property Datadeposito: TCmDbField read FDatadeposito write SetDatadeposito;
     Property Codtiporecurso: TCmDbField read FCodtiporecurso write SetCodtiporecurso;
     Property Codportador: TCmDbField read FCodportador write SetCodportador;
     Property NumSeq: TCmDbField read FNumSeq write SetNumSeq;
     Property Datacontadoria: TCmDbField read FDatacontadoria write SetDataContadoria;

  //public

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbEtpDesdobramento }

constructor TDbEtpDesdobramento.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'ETPDESDOBRAMENTO';

   fVlrcreditado := CreateCmDbField('VLRCREDITADO',ftfloat,False,False,False,True,'');
   fVlrcalccontadoria := CreateCmDbField('VLRCALCCONTADORIA',ftfloat,False,False,False,True,'');
   //fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   //fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fTpimpugcalculo := CreateCmDbField('TPIMPUGCALCULO',ftfloat,False,False,False,True,'');
   fTpdesdobramento := CreateCmDbField('TPDESDOBRAMENTO',ftfloat,False,False,False,True,'');
   fNumproctrab := CreateCmDbField('NUMPROCTRAB',ftfloat,True,False,False,True,'');
   fIdtpdesdobramento := CreateCmDbField('IDTPDESDOBRAMENTO',ftfloat,True,True,False,True,'');
   fIdcbancaria := CreateCmDbField('IDCBANCARIA',ftfloat,False,False,False,True,'');
   fDatadeposito := CreateCmDbField('DATADEPOSITO',ftDateTime,False,False,False,True,'');
   fCodtiporecurso := CreateCmDbField('CODTIPORECURSO',ftfloat,True,False,False,True,'');
   fCodportador := CreateCmDbField('CODPORTADOR',ftfloat,False,False,False,True,'');
   fNumSeq := CreateCmDbField('NUMSEQ',ftfloat,False,False,False,True,'');
   FDatacontadoria := CreateCmDbField('DATACONTADORIA',ftDateTime,False,False,False,True,'');
end;

function TDbEtpDesdobramento.Insert: Boolean;
begin

   fIdtpdesdobramento.AsFloat := GetSequence('ETPDESDOBRAMENTO');
   Result := Inherited Insert;

end;


procedure TDbEtpDesdobramento.SetCodportador(const Value: TCmDbField);
begin
  FCodportador := Value;
end;

procedure TDbEtpDesdobramento.SetCodtiporecurso(const Value: TCmDbField);
begin
  FCodtiporecurso := Value;
end;

procedure TDbEtpDesdobramento.SetDatadeposito(const Value: TCmDbField);
begin
  FDatadeposito := Value;
end;

procedure TDbEtpDesdobramento.SetIdcbancaria(const Value: TCmDbField);
begin
  FIdcbancaria := Value;
end;

procedure TDbEtpDesdobramento.SetIdtpdesdobramento(const Value: TCmDbField);
begin
  FIdtpdesdobramento := Value;
end;

procedure TDbEtpDesdobramento.SetNumproctrab(const Value: TCmDbField);
begin
  FNumproctrab := Value;
end;

procedure TDbEtpDesdobramento.SetNumSeq(const Value: TCmDbField);
begin
  FNumSeq := Value;
end;

procedure TDbEtpDesdobramento.SetTpdesdobramento(const Value: TCmDbField);
begin
  FTpdesdobramento := Value;
end;

procedure TDbEtpDesdobramento.SetTpimpugcalculo(const Value: TCmDbField);
begin
  FTpimpugcalculo := Value;
end;

procedure TDbEtpDesdobramento.SetTrgdtinclusao(const Value: TCmDbField);
begin
  //FTrgdtinclusao := Value;
end;

procedure TDbEtpDesdobramento.SetTrguserinclusao(const Value: TCmDbField);
begin
  //FTrguserinclusao := Value;
end;

procedure TDbEtpDesdobramento.SetVlrcalccontadoria( const Value: TCmDbField);
begin
  FVlrcalccontadoria := Value;
end;

procedure TDbEtpDesdobramento.SetVlrcreditado(const Value: TCmDbField);
begin
  FVlrcreditado := Value;
end;

procedure TDbEtpDesdobramento.SetDataContadoria(const Value: TCmDbField);
begin
  FDatacontadoria := Value;
end;

end.



