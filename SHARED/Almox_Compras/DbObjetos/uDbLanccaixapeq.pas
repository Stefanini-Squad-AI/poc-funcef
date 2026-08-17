{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 08/09/2002                             }
{                                                       }
{*******************************************************}

{
-----------------------------------------------------------------------------
Nº SOL: 224628-16384
Nº PPM: 475900
Data da Alteração: 25/09/2014
Responsável: Helio Lima Custodio
Descrição: Incluir fornecedor no cadastro de lancamentos de caixa pequeno.
-----------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
}

unit uDbLanccaixapeq;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbLanccaixapeq = class(TCmDbObject)

  private
    FNodocumento: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FVlrlanc: TCmDbField;
    FDatalanc: TCmDbField;
    FIdlanccxpeq: TCmDbField;
    FHistlancamento: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdcaixapequeno: TCmDbField;
    FIditemsoli: TCmDbField;
    FRecpag: TCmDbField;
    FCodsubconta: TCmDbField;
    FIdempresa: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FPlano: TCmDbField;
    FUnidnegoc: TCmDbField;
    FIdborderocxpeq: TCmDbField;
    FPlaconta: TCmDbField;
    FIdprograma: TCmDbField;
    FIdReservaOrcamen: TCmDbField;
    FIDDESPESAORC: TCmDbField;
    FIdFornecedor: TCmDbField; //Helio - SOL Nº 224628-16384 PPM Nº 475900
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetDatalanc(const Value: TCmDbField);
    procedure SetHistlancamento(const Value: TCmDbField);
    procedure SetIdborderocxpeq(const Value: TCmDbField);
    procedure SetIdcaixapequeno(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIditemsoli(const Value: TCmDbField);
    procedure SetIdlanccxpeq(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNodocumento(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetVlrlanc(const Value: TCmDbField);
    procedure SetIdprograma(const Value: TCmDbField);
    procedure SetIdReservaOrcamen(const Value: TCmDbField);
    procedure SetIDDESPESAORC(const Value: TCmDbField);
    procedure SetIdFornecedor(const Value: TCmDbField); //Helio - SOL Nº 224628-16384 PPM Nº 475900

  public

     Property Vlrlanc: TCmDbField read FVlrlanc write SetVlrlanc;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Nodocumento: TCmDbField read FNodocumento write SetNodocumento;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idlanccxpeq: TCmDbField read FIdlanccxpeq write SetIdlanccxpeq;
     Property Iditemsoli: TCmDbField read FIditemsoli write SetIditemsoli;
     Property Idprograma: TCmDbField read FIdprograma write SetIdprograma;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idcaixapequeno: TCmDbField read FIdcaixapequeno write SetIdcaixapequeno;
     Property Idborderocxpeq: TCmDbField read FIdborderocxpeq write SetIdborderocxpeq;
     Property Histlancamento: TCmDbField read FHistlancamento write SetHistlancamento;
     Property Datalanc: TCmDbField read FDatalanc write SetDatalanc;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property IdReservaOrcamen: TCmDbField read FIdReservaOrcamen write SetIdReservaOrcamen;
     //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
     Property IDDESPESAORC: TCmDbField read FIDDESPESAORC write SetIDDESPESAORC;

     //Helio - SOL Nº 224628-16384 PPM Nº 475900
     Property IdFornecedor: TCmDbField read FIdFornecedor write SetIdFornecedor;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbLanccaixapeq }

constructor TDbLanccaixapeq.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LANCCAIXAPEQ';

   fVlrlanc := CreateCmDbField('VLRLANC',ftfloat,False,False,False,True,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlaconta := CreateCmDbField('PLACONTA',ftString,False,False,False,True,'');
   fNodocumento := CreateCmDbField('NODOCUMENTO',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdlanccxpeq := CreateCmDbField('IDLANCCXPEQ',ftfloat,True,True,False,True,'');
   fIditemsoli := CreateCmDbField('IDITEMSOLI',ftfloat,False,False,False,True,'');
   fIdPrograma := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIdcaixapequeno := CreateCmDbField('IDCAIXAPEQUENO',ftfloat,False,False,False,True,'');
   fIdborderocxpeq := CreateCmDbField('IDBORDEROCXPEQ',ftfloat,False,False,False,True,'');
   fHistlancamento := CreateCmDbField('HISTLANCAMENTO',ftString,False,False,False,True,'');
   fDatalanc := CreateCmDbField('DATALANC',ftDateTime,False,False,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   fIdReservaOrcamen := CreateCmDbField('IDRESERVAORCAMEN',ftString,False,False,False,True,'');

   //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
   fIDDESPESAORC := CreateCmDbField('IDDESPESAORC',ftfloat,False,False,False,True,'');

   //Helio - SOL Nº 224628-16384 PPM Nº 475900
   FIdFornecedor := CreateCmDbField('IDFORNECEDOR',ftString,False,False,False,True,'');

end;

function TDbLanccaixapeq.Insert: Boolean;
begin

   fIdlanccxpeq.AsFloat := GetSequence('LANCCAIXAPEQ');
   Result := Inherited Insert;

end;


procedure TDbLanccaixapeq.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbLanccaixapeq.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbLanccaixapeq.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbLanccaixapeq.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbLanccaixapeq.SetDatalanc(const Value: TCmDbField);
begin
  FDatalanc := Value;
end;

procedure TDbLanccaixapeq.SetHistlancamento(const Value: TCmDbField);
begin
  FHistlancamento := Value;
end;

procedure TDbLanccaixapeq.SetIdborderocxpeq(const Value: TCmDbField);
begin
  FIdborderocxpeq := Value;
end;

procedure TDbLanccaixapeq.SetIdcaixapequeno(const Value: TCmDbField);
begin
  FIdcaixapequeno := Value;
end;

procedure TDbLanccaixapeq.SetIDDESPESAORC(const Value: TCmDbField);
begin
  FIDDESPESAORC := Value;
end;

procedure TDbLanccaixapeq.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbLanccaixapeq.SetIditemsoli(const Value: TCmDbField);
begin
  FIditemsoli := Value;
end;

procedure TDbLanccaixapeq.SetIdlanccxpeq(const Value: TCmDbField);
begin
  FIdlanccxpeq := Value;
end;

procedure TDbLanccaixapeq.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbLanccaixapeq.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

procedure TDbLanccaixapeq.SetIdReservaOrcamen(const Value: TCmDbField);
begin
  FIdReservaOrcamen := Value;
end;

procedure TDbLanccaixapeq.SetNodocumento(const Value: TCmDbField);
begin
  FNodocumento := Value;
end;

procedure TDbLanccaixapeq.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbLanccaixapeq.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbLanccaixapeq.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDbLanccaixapeq.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbLanccaixapeq.SetVlrlanc(const Value: TCmDbField);
begin
  FVlrlanc := Value;
end;

//Helio - SOL Nº 224628-16384 PPM Nº 475900
procedure TDbLanccaixapeq.SetIdFornecedor(const Value: TCmDbField);
begin
  FIdFornecedor := Value;
end;

end.



