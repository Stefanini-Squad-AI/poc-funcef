unit uDbCotacotacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
   TDbCotacotacao = class(TCmDbObject)

   private

      FIdpatro          : TCmDbField;
      FQtdcota          : TCmDbField;
      FIdativocota      : TCmDbField;
      FIdplano          : TCmDbField;
      FData             : TCmDbField;
      FVlrpatrimonio    : TCmDbField;
      FIdcotacotacao    : TCmDbField;
      FVlrcota          : TCmDbField;
      FPernumero        : TCmDbField;
      FPerexercicio     : TCmDbField;
      FVlrcotizado      : TCmDbField;
      FVlrrentabilizado : TCmDbField;
      FOrigem           : TCmDbField;
      FDataIni: TCmDbField;

      procedure SetData(const Value: TCmDbField);
      procedure SetIdativocota(const Value: TCmDbField);
      procedure SetIdcotacotacao(const Value: TCmDbField);
      procedure SetIdpatro(const Value: TCmDbField);
      procedure SetIdplano(const Value: TCmDbField);
      procedure SetPerexercicio(const Value: TCmDbField);
      procedure SetPernumero(const Value: TCmDbField);
      procedure SetQtdcota(const Value: TCmDbField);
      procedure SetVlrcota(const Value: TCmDbField);
      procedure SetVlrpatrimonio(const Value: TCmDbField);
      procedure SetVlrcotizado(const Value: TCmDbField);
      procedure SetOrigem(const Value: TCmDbField);
      procedure SetVlrrentabilizado(const Value: TCmDbField);
      procedure SetDataIni(const Value: TCmDbField);

   public

      property Vlrpatrimonio     : TCmDbField   read FVlrpatrimonio     write SetVlrpatrimonio;
      property Vlrcotizado       : TCmDbField   read FVlrcotizado       write SetVlrcotizado;
      property Vlrrentabilizado  : TCmDbField   read FVlrrentabilizado  write SetVlrrentabilizado;
      property Vlrcota           : TCmDbField   read FVlrcota           write SetVlrcota;
      property Qtdcota           : TCmDbField   read FQtdcota           write SetQtdcota;
      property Pernumero         : TCmDbField   read FPernumero         write SetPernumero;
      property Perexercicio      : TCmDbField   read FPerexercicio      write SetPerexercicio;
      property Idplano           : TCmDbField   read FIdplano           write SetIdplano;
      property Idpatro           : TCmDbField   read FIdpatro           write SetIdpatro;
      property Idcotacotacao     : TCmDbField   read FIdcotacotacao     write SetIdcotacotacao;
      property Idativocota       : TCmDbField   read FIdativocota       write SetIdativocota;
      property Data              : TCmDbField   read FData              write SetData;
      property Origem            : TCmDbField   read FOrigem            write SetOrigem;
      // Lucas Barth Pacini - 10/03/2005
      property DataIni           : TCmDbField   read FDataIni           write SetDataIni;

      constructor Create(Aowner: TCmCustomCdbObject); override;

      function Insert :Boolean; override;

   end;



implementation
{ TDbCotacotacao }

constructor TDbCotacotacao.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;

   ErrorIfNoRowsAffected := False;

   TableName := 'COTACOTACAO';

   fVlrpatrimonio    := CreateCmDbField('VLRPATRIMONIO',    ftfloat,    False,   False,   False,   True, 'Valor do Patrimônio');
   fVlrcotizado      := CreateCmDbField('VLRCOTIZADO',      ftfloat,    False,   False,   False,   True, 'Valor Cotizado');
   fVlrrentabilizado := CreateCmDbField('VLRRENTABILIZADO', ftfloat,    False,   False,   False,   True, 'Valor Rentabilizado');
   fVlrcota          := CreateCmDbField('VLRCOTA',          ftfloat,    False,   False,   False,   True, 'Valor da Cota');
   fQtdcota          := CreateCmDbField('QTDCOTA',          ftfloat,    False,   False,   False,   True, 'Quantidade de Cotas');
   fPernumero        := CreateCmDbField('PERNUMERO',        ftfloat,    False,   False,   False,   True, 'Período');
   fPerexercicio     := CreateCmDbField('PEREXERCICIO',     ftfloat,    False,   False,   False,   True, 'Exercício');
   fIdplano          := CreateCmDbField('IDPLANO',          ftfloat,    False,   False,   False,   True, 'Plano Contábil');
   fIdpatro          := CreateCmDbField('IDPATRO',          ftfloat,    False,   False,   False,   True, 'Patrocinadora');
   fIdcotacotacao    := CreateCmDbField('IDCOTACOTACAO',    ftfloat,    True,    True,    False,   True, 'ID da Cotação');
   fIdativocota      := CreateCmDbField('IDATIVOCOTA',      ftfloat,    False,   False,   False,   True, 'ID do Ativo');
   fData             := CreateCmDbField('DATA',             ftDateTime, False,   False,   False,   True, 'Data da Cotação');
   fOrigem           := CreateCmDbField('ORIGEM',           ftfloat,    False,   False,   False,   True, 'Origem');
   // Lucas Barth Pacini - 10/03/2005
   fDataIni          := CreateCmDbField('DATAINI',          ftDateTime, False,   False,   False,   True, 'Data Inicial');
end;



function TDbCotacotacao.Insert: Boolean;
begin
   fIdcotacotacao.AsFloat := GetSequence('COTACOTACAO');

   Result := inherited Insert;
end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
procedure TDbCotacotacao.SetData(const Value: TCmDbField);
begin
  FData := Value;
end;

procedure TDbCotacotacao.SetDataIni(const Value: TCmDbField);
begin
  FDataIni := Value;
end;

procedure TDbCotacotacao.SetIdativocota(const Value: TCmDbField);
begin
  FIdativocota := Value;
end;

procedure TDbCotacotacao.SetIdcotacotacao(const Value: TCmDbField);
begin
  FIdcotacotacao := Value;
end;

procedure TDbCotacotacao.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbCotacotacao.SetIdplano(const Value: TCmDbField);
begin
  FIdplano := Value;
end;

procedure TDbCotacotacao.SetOrigem(const Value: TCmDbField);
begin
  FOrigem := Value;
end;

procedure TDbCotacotacao.SetPerexercicio(const Value: TCmDbField);
begin
  FPerexercicio := Value;
end;

procedure TDbCotacotacao.SetPernumero(const Value: TCmDbField);
begin
  FPernumero := Value;
end;

procedure TDbCotacotacao.SetQtdcota(const Value: TCmDbField);
begin
  FQtdcota := Value;
end;

procedure TDbCotacotacao.SetVlrcota(const Value: TCmDbField);
begin
  FVlrcota := Value;
end;

procedure TDbCotacotacao.SetVlrcotizado(const Value: TCmDbField);
begin
  FVlrcotizado := Value;
end;

procedure TDbCotacotacao.SetVlrpatrimonio(const Value: TCmDbField);
begin
   FVlrpatrimonio := Value;
end;

procedure TDbCotacotacao.SetVlrrentabilizado(const Value: TCmDbField);
begin
   FVlrrentabilizado := Value;
end;
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------




end.
