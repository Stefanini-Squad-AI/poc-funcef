{*******************************************************}
{ Analista Responsável: Helen V Bianchi                 }
{ Atualizado Em: 13/12/2010                             }
{ Nº SOL...........: 142551 Nº KINTANA.......: 911676   }
{*******************************************************}

unit uDBSelDepreciacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBSelDepreciacao = class(TCmDbObject)

  private
    FIdseldepreciacao: TCmDbField;
    FSddata: TCmDbField;
    FSdTaxa: TCmDbField;
    FSdVida: TCmDbField;
    FSdDataRet: TCmDbField;
    FIdPessoa: TCmDbField;
    FIdselbaixa: TCmDbField;
    Fsddtaexecutado: TCmDbField;
    Fsdflgexecutado: TCmDbField;

    procedure SetIdseldepreciacao(const Value: TCmDbField);
    procedure SetSddata(const Value: TCmDbField);
    procedure SetSdTaxa(const Value: TCmDbField);
    procedure SetSdVida(const Value: TCmDbField);
    procedure SetSdDataRet(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetSddtaexecutado(const Value: TCmDbField);
    procedure SetSdflgexecutado(const Value: TCmDbField);

  public
     Property SdDataRet: TCmDbField read FSdDataRet write SetSdDataRet;
     Property SdVida: TCmDbField read FSdVida write SetSdVida;
     Property SdTaxa: TCmDbField read FSdTaxa write SetSdTaxa;
     Property Sddata: TCmDbField read FSddata write SetSddata;
     Property Idseldepreciacao: TCmDbField read FIdseldepreciacao write SetIdseldepreciacao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Sddtaexecutado: TCmDbField read FSddtaexecutado write SetSddtaexecutado;
     Property Sdflgexecutado: TCmDbField read FSdflgexecutado write SetSdflgexecutado;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBSelDepreciacao }

constructor TDBSelDepreciacao.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'SELDEPRECIACAO';

   fSdTaxa           := CreateCmDbField('SDTAXA',ftfloat,False,False,False,True,'');
   fSdVida           := CreateCmDbField('SDVIDA',ftfloat,False,False,False,True,'');
   FSdDataRet        := CreateCmDbField('SDDATARET',ftDateTime,False,False,False,True,'');
   fIdseldepreciacao := CreateCmDbField('IDSELDEPRECIACAO',ftfloat,True,True,False,True,'');
   fIdpessoa         := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fSddata           := CreateCmDbField('SDDATA',ftDateTime,False,False,False,True,'');
   Fsdflgexecutado   := CreateCmDbField('SDFLGEXECUTADO',ftfloat,False,False,False,True,'');
   fSddtaexecutado   := CreateCmDbField('SDDTAEXECUTADO',ftDateTime,False,False,False,True,'');
end;

function TDBSelDepreciacao.Insert: Boolean;
begin
   fIdseldepreciacao.AsFloat := GetSequence('SELDEPRECIACAO');
   Result := Inherited Insert;
end;


procedure TDBSelDepreciacao.SetIdpessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDBSelDepreciacao.SetIdseldepreciacao(const Value: TCmDbField);
begin
  FIdseldepreciacao := Value;
end;

procedure TDBSelDepreciacao.SetSddata(const Value: TCmDbField);
begin
  FSddata := Value;
end;

procedure TDBSelDepreciacao.SetSdDataRet(const Value: TCmDbField);
begin
  FSdDataRet := Value;
end;

procedure TDBSelDepreciacao.SetSddtaexecutado(const Value: TCmDbField);
begin
  Fsddtaexecutado := Value;
end;

procedure TDBSelDepreciacao.SetSdflgexecutado(const Value: TCmDbField);
begin
 fSdflgexecutado := Value;
end;

procedure TDBSelDepreciacao.SetSdTaxa(const Value: TCmDbField);
begin
  FSdTaxa := Value;
end;

procedure TDBSelDepreciacao.SetSdVida(const Value: TCmDbField);
begin
  FSdVida := Value;
end;

end.



