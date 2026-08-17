{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172601/14639 e 172601/14640  Admin e Alien
Nº KINTANA..: 2019067 e 2019131
Data........: 11/10/2013
Responsável.: Felipe A. Santos
Descrição...: criação da DB.
-------------------------------------------------------------------------------}

unit uDbETLImobAtualizacao;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
    TDbETLImobAtualizacao = class(TCmDbObject)

    private
      FIdModulo: TCmDbField;
      FIdImobAtualizacao: TCmDbField;
      FFlgStatusExec: TCmDbField;
      FData_Inicio: TCmDbField;
      FData_Fim: TCmDbField;
      procedure SetData_Fim(const Value: TCmDbField);
      procedure SetData_Inicio(const Value: TCmDbField);
      procedure SetFlgStatusExec(const Value: TCmDbField);
      procedure SetIdImobAtualizacao(const Value: TCmDbField);
      procedure SetIdModulo(const Value: TCmDbField);

    public
      property IdImobAtualizacao: TCmDbField read FIdImobAtualizacao write SetIdImobAtualizacao;
      property Data_Inicio : TCmDbField read FData_Inicio write SetData_Inicio;
      property Data_Fim : TCmDbField read FData_Fim write SetData_Fim;
      property IdModulo : TCmDbField read FIdModulo write SetIdModulo;
      property FlgStatusExec : TCmDbField read FFlgStatusExec write SetFlgStatusExec;


      constructor Create(Aowner: TCmCustomCdbObject); override;

      function Insert : boolean; override;
    end;

implementation

{ TDbETLImobAtualizacao }

constructor TDbETLImobAtualizacao.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'ETL_IMOB_ATUALIZACAO';

   FIdImobAtualizacao := CreateCmDbField('IDIMOBATUALIZACAO', ftInteger, True, True,False,False,'');
   FData_Inicio := CreateCmDbField('DATA_INICIO', ftDate, False,False,False,False,'');
   FData_Fim := CreateCmDbField('DATA_FIM', ftDate, False,False,False,False,'');
   FIdModulo := CreateCmDbField('IDMODULO', ftInteger, False,False,False,False,'');
   FFlgStatusExec := CreateCmDbField('FLGSTATUSEXEC', ftString, False,False,False,False,'');
end;

function TDbETLImobAtualizacao.Insert: boolean;
begin
  FIdImobAtualizacao.AsFloat := GetSequence('ETL_IMOB_ATUALIZACAO');
  inherited Insert;
end;

procedure TDbETLImobAtualizacao.SetData_Fim(const Value: TCmDbField);
begin
  FData_Fim := Value;
end;

procedure TDbETLImobAtualizacao.SetData_Inicio(const Value: TCmDbField);
begin
  FData_Inicio := Value;
end;

procedure TDbETLImobAtualizacao.SetFlgStatusExec(const Value: TCmDbField);
begin
  FFlgStatusExec := Value;
end;

procedure TDbETLImobAtualizacao.SetIdImobAtualizacao(const Value: TCmDbField);
begin
  FIdImobAtualizacao := Value;
end;

procedure TDbETLImobAtualizacao.SetIdModulo(const Value: TCmDbField);
begin
  FIdModulo := Value;
end;

end.
