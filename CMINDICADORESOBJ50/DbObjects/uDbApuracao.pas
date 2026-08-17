{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbApuracao;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbApuracao = class(TCmDbObject)

  private
    FVlrapuracaonum: TCmDbField;
    FVlrapuracaostr: TCmDbField;
    FIdgrpapuracao: TCmDbField;
    FDataapuracao: TCmDbField;
    FAnocompetencia: TCmDbField;
    FMescompetencia: TCmDbField;
    FIdapuracao: TCmDbField;
    FIdindicador: TCmDbField;
    FIdimovel: TCmDbField;
    FVlrapuracaodat: TCmDbField;
    FTipolanca: TCmDbField;
    FTipoinclusao: TCmDbField;
    FDatainclusao: TCmDbField;
    FIdsubgrpapuracao: TCmDbField;
    FIdcontrato: TCmDbField;
    FFlgConciliado: TCmDbField;
    FObservacao: TCmDbField;
    FIdIndLote: TCmDbField;
    procedure SetAnocompetencia(const Value: TCmDbField);
    procedure SetDataapuracao(const Value: TCmDbField);
    procedure SetDatainclusao(const Value: TCmDbField);
    procedure SetIdapuracao(const Value: TCmDbField);
    procedure SetIdcontrato(const Value: TCmDbField);
    procedure SetIdgrpapuracao(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdindicador(const Value: TCmDbField);
    procedure SetIdsubgrpapuracao(const Value: TCmDbField);
    procedure SetMescompetencia(const Value: TCmDbField);
    procedure SetTipoinclusao(const Value: TCmDbField);
    procedure SetTipolanca(const Value: TCmDbField);
    procedure SetVlrapuracaodat(const Value: TCmDbField);
    procedure SetVlrapuracaonum(const Value: TCmDbField);
    procedure SetVlrapuracaostr(const Value: TCmDbField);
    procedure SetFlgConciliado(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetIdIndLote(const Value: TCmDbField);

  public

     Property Vlrapuracaostr: TCmDbField read FVlrapuracaostr write SetVlrapuracaostr;
     Property Vlrapuracaonum: TCmDbField read FVlrapuracaonum write SetVlrapuracaonum;
     Property Vlrapuracaodat: TCmDbField read FVlrapuracaodat write SetVlrapuracaodat;
     Property Tipolanca: TCmDbField read FTipolanca write SetTipolanca;
     Property Tipoinclusao: TCmDbField read FTipoinclusao write SetTipoinclusao;
     Property Mescompetencia: TCmDbField read FMescompetencia write SetMescompetencia;
     Property Idsubgrpapuracao: TCmDbField read FIdsubgrpapuracao write SetIdsubgrpapuracao;
     Property Idindicador: TCmDbField read FIdindicador write SetIdindicador;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Idgrpapuracao: TCmDbField read FIdgrpapuracao write SetIdgrpapuracao;
     Property Idcontrato: TCmDbField read FIdcontrato write SetIdcontrato;
     Property Idapuracao: TCmDbField read FIdapuracao write SetIdapuracao;
     Property Datainclusao: TCmDbField read FDatainclusao write SetDatainclusao;
     Property Dataapuracao: TCmDbField read FDataapuracao write SetDataapuracao;
     Property Anocompetencia: TCmDbField read FAnocompetencia write SetAnocompetencia;
     Property FlgConciliado: TCmDbField read FFlgConciliado write SetFlgConciliado;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property IdIndLote: TCmDbField read FIdIndLote write SetIdIndLote;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbApuracao }

constructor TDbApuracao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDAPURACAO';

   fVlrapuracaostr := CreateCmDbField('VLRAPURACAOSTR',ftString,False,False,False,True,'Valor Apurado ( Caracter )');
   fVlrapuracaonum := CreateCmDbField('VLRAPURACAONUM',ftfloat,False,False,False,True,'Valor Apurado ( Numérico )');
   fVlrapuracaodat := CreateCmDbField('VLRAPURACAODAT',ftDateTime,False,False,False,True,'Valor Apurado ( Data )');
   fTipolanca := CreateCmDbField('TIPOLANCA',ftString,True,False,False,True,'Tipo de Lançamento');
   fTipoinclusao := CreateCmDbField('TIPOINCLUSAO',ftString,True,False,False,True,'Tipo de Inclusão');
   fFlgConciliado := CreateCmDbField('FLGCONCILIADO',ftString,True,False,False,True,'Flag de Conciliação');
   fMescompetencia := CreateCmDbField('MESCOMPETENCIA',ftfloat,True,False,False,True,'Mês de Competência');
   fIdsubgrpapuracao := CreateCmDbField('IDSUBGRPAPURACAO',ftfloat,False,False,False,True,'Sub Grupo de Apuração');
   fIdindicador := CreateCmDbField('IDINDICADOR',ftfloat,True,False,False,True,'Indicador');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,False,False,False,True,'Imóvel');
   fIdgrpapuracao := CreateCmDbField('IDGRPAPURACAO',ftfloat,False,False,False,True,'Grupo de Apuração');
   fIdcontrato := CreateCmDbField('IDCONTRATO',ftfloat,False,False,False,True,'Contrato');
   fIdapuracao := CreateCmDbField('IDAPURACAO',ftfloat,True,True,False,True,'ID da Apuração');
   fDatainclusao := CreateCmDbField('DATAINCLUSAO',ftDateTime,True,False,False,True,'Data de Inclusão');
   fDataapuracao := CreateCmDbField('DATAAPURACAO',ftDateTime,True,False,False,True,'Data da Apuração');
   fAnocompetencia := CreateCmDbField('ANOCOMPETENCIA',ftfloat,True,False,False,True,'Ano de Competência');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,False,'Observação');
   fIdIndLote := CreateCmDbField('IdIndLote',ftfloat,False,False,False,True,'Lote');
end;

function TDbApuracao.Insert: Boolean;
begin
   fIdapuracao.AsFloat := GetSequence('INDAPURACAO');
   Result := Inherited Insert;
end;

function TDbApuracao.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbApuracao.SetAnocompetencia(const Value: TCmDbField);
begin
  FAnocompetencia := Value;
end;

procedure TDbApuracao.SetDataapuracao(const Value: TCmDbField);
begin
  FDataapuracao := Value;
end;

procedure TDbApuracao.SetDatainclusao(const Value: TCmDbField);
begin
  FDatainclusao := Value;
end;

procedure TDbApuracao.SetFlgConciliado(const Value: TCmDbField);
begin
  FFlgConciliado := Value;
end;

procedure TDbApuracao.SetIdapuracao(const Value: TCmDbField);
begin
  FIdapuracao := Value;
end;

procedure TDbApuracao.SetIdcontrato(const Value: TCmDbField);
begin
  FIdcontrato := Value;
end;

procedure TDbApuracao.SetIdgrpapuracao(const Value: TCmDbField);
begin
  FIdgrpapuracao := Value;
end;

procedure TDbApuracao.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbApuracao.SetIdindicador(const Value: TCmDbField);
begin
  FIdindicador := Value;
end;

procedure TDbApuracao.SetIdIndLote(const Value: TCmDbField);
begin
  FIdIndLote := Value;
end;

procedure TDbApuracao.SetIdsubgrpapuracao(const Value: TCmDbField);
begin
  FIdsubgrpapuracao := Value;
end;

procedure TDbApuracao.SetMescompetencia(const Value: TCmDbField);
begin
  FMescompetencia := Value;
end;

procedure TDbApuracao.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbApuracao.SetTipoinclusao(const Value: TCmDbField);
begin
  FTipoinclusao := Value;
end;

procedure TDbApuracao.SetTipolanca(const Value: TCmDbField);
begin
  FTipolanca := Value;
end;

procedure TDbApuracao.SetVlrapuracaodat(const Value: TCmDbField);
begin
  FVlrapuracaodat := Value;
end;

procedure TDbApuracao.SetVlrapuracaonum(const Value: TCmDbField);
begin
  FVlrapuracaonum := Value;
end;

procedure TDbApuracao.SetVlrapuracaostr(const Value: TCmDbField);
begin
  FVlrapuracaostr := Value;
end;

end.



