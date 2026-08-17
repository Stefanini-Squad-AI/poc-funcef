{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 13/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbContratoXImovel;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbContratoXImovel = class(TCmDbObject)

  private
    FIdcontratoimovel: TCmDbField;
    FFlgrateio: TCmDbField;
    FCimpercentrateio: TCmDbField;
    FCimvlraluguel: TCmDbField;
    FFlgorigvlralug: TCmDbField;
    FCimvlrajustado: TCmDbField;
    FVlrcontabil: TCmDbField;
    FVlrvenda: TCmDbField;
    FIdimovel: TCmDbField;
    FCimdescricao: TCmDbField;
    FCimDtFim: TCmDbField;
    FCimDtIni: TCmDbField;

    procedure SetCimdescricao(const Value: TCmDbField);
    procedure SetCimpercentrateio(const Value: TCmDbField);
    procedure SetCimvlrajustado(const Value: TCmDbField);
    procedure SetCimvlraluguel(const Value: TCmDbField);
    procedure SetFlgorigvlralug(const Value: TCmDbField);
    procedure SetFlgrateio(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetVlrcontabil(const Value: TCmDbField);
    procedure SetVlrvenda(const Value: TCmDbField);
    procedure SetCimDtFim(const Value: TCmDbField);
    procedure SetCimDtIni(const Value: TCmDbField);

  public

     Property Vlrvenda: TCmDbField         read FVlrvenda         write SetVlrvenda;
     Property Vlrcontabil: TCmDbField      read FVlrcontabil      write SetVlrcontabil;
     Property Idimovel: TCmDbField         read FIdimovel         write SetIdimovel;
     Property Idcontratoimovel: TCmDbField read FIdcontratoimovel write SetIdcontratoimovel;
     Property Flgrateio: TCmDbField        read FFlgrateio        write SetFlgrateio;
     Property Flgorigvlralug: TCmDbField   read FFlgorigvlralug   write SetFlgorigvlralug;
     Property Cimvlraluguel: TCmDbField    read FCimvlraluguel    write SetCimvlraluguel;
     Property Cimvlrajustado: TCmDbField   read FCimvlrajustado   write SetCimvlrajustado;
     Property Cimpercentrateio: TCmDbField read FCimpercentrateio write SetCimpercentrateio;
     Property Cimdescricao: TCmDbField     read FCimdescricao     write SetCimdescricao;
     Property CimDtIni: TCmDbField         read FCimDtIni         write SetCimDtIni;
     Property CimDtFim: TCmDbField         read FCimDtFim         write SetCimDtFim;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbContratoXImovel }

constructor TDbContratoXImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  // Daniel - 24159
  _UpdateKeyFields      := True;

  TableName := 'CONTRATOXIMOVEL';

   fVlrvenda := CreateCmDbField('VLRVENDA',ftfloat,False,False,False,True,'Vlr de Alienação do Imóvel');
   fVlrcontabil := CreateCmDbField('VLRCONTABIL',ftfloat,False,False,False,True,'Vlr Contábil do Imóvel na Alienação');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,True,True,False,True,'ID do Imóvel');
   fIdcontratoimovel := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,True,True,False,True,'ID do ContratoImovel');
   fFlgrateio := CreateCmDbField('FLGRATEIO',ftfloat,False,False,False,False,'Flag de Aluguel Rateado');
   fFlgorigvlralug := CreateCmDbField('FLGORIGVLRALUG',ftfloat,False,False,False,False,'Orig.do Valor para Alienação');
   fCimvlraluguel := CreateCmDbField('CIMVLRALUGUEL',ftfloat,False,False,False,False,'Valor anterior de Aluguel');
   fCimvlrajustado := CreateCmDbField('CIMVLRAJUSTADO',ftfloat,False,False,False,False,'Valor atual de Aluguel');
   fCimpercentrateio := CreateCmDbField('CIMPERCENTRATEIO',ftfloat,False,False,False,False,'Perc. de Rateio do Aluguel');
   fCimdescricao := CreateCmDbField('CIMDESCRICAO',ftString,False,False,False,True,'Descrição do Contrato');
   FCimDtIni := CreateCmDbField('CIMDTINI',ftDateTime,False,False,False,True,'Data do Início da Vigência');
   FCimDtfim := CreateCmDbField('CIMDTFIM',ftDateTime,False,False,False,True,'Data do Fim da Vigência');
end;

function TDbContratoXImovel.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbContratoXImovel.SetCimdescricao(const Value: TCmDbField);
begin
  FCimdescricao := Value;
end;

procedure TDbContratoXImovel.SetCimDtFim(const Value: TCmDbField);
begin
  FCimDtFim := Value;
end;

procedure TDbContratoXImovel.SetCimDtIni(const Value: TCmDbField);
begin
  FCimDtIni := Value;
end;

procedure TDbContratoXImovel.SetCimpercentrateio(const Value: TCmDbField);
begin
  FCimpercentrateio := Value;
end;

procedure TDbContratoXImovel.SetCimvlrajustado(const Value: TCmDbField);
begin
  FCimvlrajustado := Value;
end;

procedure TDbContratoXImovel.SetCimvlraluguel(const Value: TCmDbField);
begin
  FCimvlraluguel := Value;
end;

procedure TDbContratoXImovel.SetFlgorigvlralug(const Value: TCmDbField);
begin
  FFlgorigvlralug := Value;
end;

procedure TDbContratoXImovel.SetFlgrateio(const Value: TCmDbField);
begin
  FFlgrateio := Value;
end;

procedure TDbContratoXImovel.SetIdcontratoimovel(const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

procedure TDbContratoXImovel.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbContratoXImovel.SetVlrcontabil(const Value: TCmDbField);
begin
  FVlrcontabil := Value;
end;

procedure TDbContratoXImovel.SetVlrvenda(const Value: TCmDbField);
begin
  FVlrvenda := Value;
end;

end.



