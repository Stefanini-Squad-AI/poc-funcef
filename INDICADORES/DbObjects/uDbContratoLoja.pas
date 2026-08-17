{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbContratoLoja;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbContratoLoja = class(TCmDbObject)

  private
    FIdatividade: TCmDbField;
    FDatultauditoria: TCmDbField;
    FPerreajuste: TCmDbField;
    FDatinicio: TCmDbField;
    FNomcontrato: TCmDbField;
    FIndicereajuste: TCmDbField;
    FDatproxreajuste: TCmDbField;
    FNumcontrato: TCmDbField;
    FIdmarca: TCmDbField;
    FVlralugmin: TCmDbField;
    FDescricao: TCmDbField;
    FIdcontrato: TCmDbField;
    FTipocontrato: TCmDbField;
    FLojas: TCmDbField;
    FPeralugvariavel: TCmDbField;
    FDatreajuste: TCmDbField;
    FIdimovel: TCmDbField;
    FDattermino: TCmDbField;
    FQtdeabl: TCmDbField;
    FFlgIndeterminado : TCmDbField;
    FFlgStatus: TCMDbField;
    FIdSitContImob: TCmDbField;
    FIdPrestador: TCmDbField;
    procedure SetDatinicio(const Value: TCmDbField);
    procedure SetDatproxreajuste(const Value: TCmDbField);
    procedure SetDatreajuste(const Value: TCmDbField);
    procedure SetDattermino(const Value: TCmDbField);
    procedure SetDatultauditoria(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdatividade(const Value: TCmDbField);
    procedure SetIdcontrato(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdmarca(const Value: TCmDbField);
    procedure SetIndicereajuste(const Value: TCmDbField);
    procedure SetLojas(const Value: TCmDbField);
    procedure SetNomcontrato(const Value: TCmDbField);
    procedure SetNumcontrato(const Value: TCmDbField);
    procedure SetPeralugvariavel(const Value: TCmDbField);
    procedure SetPerreajuste(const Value: TCmDbField);
    procedure SetTipocontrato(const Value: TCmDbField);
    procedure SetVlralugmin(const Value: TCmDbField);
    procedure SetQtdeabl(const Value: TCmDbField);
    procedure SetFlgIndeterminado(const Value: TCmDbField);
    procedure SetFlgStatus(const Value: TCMDbField);
    procedure SetIdSitContImob(const Value: TCmDbField);
    procedure SetIdPrestador(const Value: TCmDbField);

  public

     Property Vlralugmin: TCmDbField read FVlralugmin write SetVlralugmin;
     Property Tipocontrato: TCmDbField read FTipocontrato write SetTipocontrato;
     Property Perreajuste: TCmDbField read FPerreajuste write SetPerreajuste;
     Property Peralugvariavel: TCmDbField read FPeralugvariavel write SetPeralugvariavel;
     Property Numcontrato: TCmDbField read FNumcontrato write SetNumcontrato;
     Property Nomcontrato: TCmDbField read FNomcontrato write SetNomcontrato;
     Property Lojas: TCmDbField read FLojas write SetLojas;
     Property Indicereajuste: TCmDbField read FIndicereajuste write SetIndicereajuste;
     Property Idmarca: TCmDbField read FIdmarca write SetIdmarca;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Idcontrato: TCmDbField read FIdcontrato write SetIdcontrato;
     Property Idatividade: TCmDbField read FIdatividade write SetIdatividade;
     Property IdSitContImob: TCmDbField read FIdSitContImob write SetIdSitContImob;
     Property IdPrestador: TCmDbField read FIdPrestador write SetIdPrestador;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Datultauditoria: TCmDbField read FDatultauditoria write SetDatultauditoria;
     Property Dattermino: TCmDbField read FDattermino write SetDattermino;
     Property Datreajuste: TCmDbField read FDatreajuste write SetDatreajuste;
     Property Datproxreajuste: TCmDbField read FDatproxreajuste write SetDatproxreajuste;
     Property Datinicio: TCmDbField read FDatinicio write SetDatinicio;
     Property Qtdeabl: TCmDbField read FQtdeabl write SetQtdeabl;
     Property FlgIndeterminado: TCmDbField read FFlgIndeterminado write SetFlgIndeterminado;
     Property FlgStatus: TCMDbField read FFlgStatus write SetFlgStatus;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbContratoLoja }

constructor TDbContratoLoja.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDCONTRATOLOJA';

   fVlralugmin := CreateCmDbField('VLRALUGMIN',ftfloat,False,False,False,True,'Aluguel Mínimo');
   fTipocontrato := CreateCmDbField('TIPOCONTRATO',ftString,True,False,False,True,'Tipo de Contrato');
   fPerreajuste := CreateCmDbField('PERREAJUSTE',ftfloat,False,False,False,True,'Periodicidade do Reajuste');
   fPeralugvariavel := CreateCmDbField('PERALUGVARIAVEL',ftfloat,False,False,False,True,'Percentual de Aluguel Variável');
   fNumcontrato := CreateCmDbField('NUMCONTRATO',ftString,True,False,False,True,'Número do Contrato');
   fNomcontrato := CreateCmDbField('NOMCONTRATO',ftString,True,False,False,True,'Nome do Contrato');
   fLojas := CreateCmDbField('LOJAS',ftString,False,False,False,True,'Nome genérico das lojas');
   fIndicereajuste := CreateCmDbField('INDICEREAJUSTE',ftfloat,False,False,False,True,'Indice de Reajuste');
   fIdmarca := CreateCmDbField('IDMARCA',ftfloat,False,False,False,True,'ID da marca');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,True,False,False,True,'ID do imóvel');
   fIdcontrato := CreateCmDbField('IDCONTRATO',ftfloat,True,True,False,True,'ID do contrato');
   fIdprestador := CreateCmDbField('IDPRESTADOR',ftfloat,False,False,False,True,'ID do Prestador de Serviços');
   fIdatividade := CreateCmDbField('IDATIVIDADE',ftfloat,False,False,False,True,'ID da atividade');
   fIdSitContImob := CreateCmDbField('IDSITCONTIMOB',ftfloat,False,False,False,True,'ID da Situação Contratual');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'Observações');
   fDatultauditoria := CreateCmDbField('DATULTAUDITORIA',ftDateTime,False,False,False,True,'Data da última Auditoria');
   fDattermino := CreateCmDbField('DATTERMINO',ftDateTime,False,False,False,True,'Data de Término do Contrato');
   fDatreajuste := CreateCmDbField('DATREAJUSTE',ftDateTime,False,False,False,True,'Data base de Reajuste');
   fDatproxreajuste := CreateCmDbField('DATPROXREAJUSTE',ftDateTime,False,False,False,True,'Data do Próximo Reajuste');
   fDatinicio := CreateCmDbField('DATINICIO',ftDateTime,True,False,False,True,'Data de Início do Contrato');
   fQtdeabl := CreateCmDbField('QTDEABL',ftfloat,True,False,False,True,'Total de ABL do contrato');
   fFlgIndeterminado := CreateCmDbField('FLGINDETERMINADO',ftString,True,False,False,True,'Término Indeterminado');
   fFlgStatus := CreateCmDbField('FLGSTATUS',ftString,True,False,False,True,'Status do Contrato');
end;

function TDbContratoLoja.Insert: Boolean;
begin

   fIdcontrato.AsFloat := GetSequence('INDCONTRATOLOJA');
   Result := Inherited Insert;

end;

function TDbContratoLoja.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbContratoLoja.SetDatinicio(const Value: TCmDbField);
begin
  FDatinicio := Value;
end;

procedure TDbContratoLoja.SetDatproxreajuste(const Value: TCmDbField);
begin
  FDatproxreajuste := Value;
end;

procedure TDbContratoLoja.SetDatreajuste(const Value: TCmDbField);
begin
  FDatreajuste := Value;
end;

procedure TDbContratoLoja.SetDattermino(const Value: TCmDbField);
begin
  FDattermino := Value;
end;

procedure TDbContratoLoja.SetDatultauditoria(const Value: TCmDbField);
begin
  FDatultauditoria := Value;
end;

procedure TDbContratoLoja.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbContratoLoja.SetFlgIndeterminado(const Value: TCmDbField);
begin
  FFlgIndeterminado := Value;
end;

procedure TDbContratoLoja.SetFlgStatus(const Value: TCMDbField);
begin
  FFlgStatus := Value;
end;

procedure TDbContratoLoja.SetIdatividade(const Value: TCmDbField);
begin
  FIdatividade := Value;
end;

procedure TDbContratoLoja.SetIdcontrato(const Value: TCmDbField);
begin
  FIdcontrato := Value;
end;

procedure TDbContratoLoja.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbContratoLoja.SetIdmarca(const Value: TCmDbField);
begin
  FIdmarca := Value;
end;

procedure TDbContratoLoja.SetIdPrestador(const Value: TCmDbField);
begin
  FIdPrestador := Value;
end;

procedure TDbContratoLoja.SetIdSitContImob(const Value: TCmDbField);
begin
  FIdSitContImob := Value;
end;

procedure TDbContratoLoja.SetIndicereajuste(const Value: TCmDbField);
begin
  FIndicereajuste := Value;
end;

procedure TDbContratoLoja.SetLojas(const Value: TCmDbField);
begin
  FLojas := Value;
end;

procedure TDbContratoLoja.SetNomcontrato(const Value: TCmDbField);
begin
  FNomcontrato := Value;
end;

procedure TDbContratoLoja.SetNumcontrato(const Value: TCmDbField);
begin
  FNumcontrato := Value;
end;

procedure TDbContratoLoja.SetPeralugvariavel(const Value: TCmDbField);
begin
  FPeralugvariavel := Value;
end;

procedure TDbContratoLoja.SetPerreajuste(const Value: TCmDbField);
begin
  FPerreajuste := Value;
end;

procedure TDbContratoLoja.SetQtdeabl(const Value: TCmDbField);
begin
  FQtdeabl := Value;
end;

procedure TDbContratoLoja.SetTipocontrato(const Value: TCmDbField);
begin
  FTipocontrato := Value;
end;

procedure TDbContratoLoja.SetVlralugmin(const Value: TCmDbField);
begin
  FVlralugmin := Value;
end;

end.



