{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 29/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbDarf;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbDarf = class(TCmDbObject)

  private
    FIdpatro: TCmDbField;
    FVlrtotal: TCmDbField;
    FDatapagtodarf: TCmDbField;
    FNumdocumento: TCmDbField;
    FNumlancjuros: TCmDbField;
    FVlrjuros: TCmDbField;
    FProcesso: TCmDbField;
    FObsdarf: TCmDbField;
    FDataemisdarf: TCmDbField;
    FDatavencdarf: TCmDbField;
    FVlrbasecalculo: TCmDbField;
    FDatainiapuracao: TCmDbField;
    FFlgimpresso: TCmDbField;
    FDatafinalapuracao: TCmDbField;
    FVara: TCmDbField;
    FIdpessoa: TCmDbField;
    FReferencia: TCmDbField;
    FIddarf: TCmDbField;
    FPercirrf: TCmDbField;
    FIdprograma: TCmDbField;
    FMedidajudicial: TCmDbField;
    FCodnatureza: TCmDbField;
    FCoddocumento: TCmDbField;
    FTipoprocesso: TCmDbField;
    FIdcidades: TCmDbField;
    FIdplanoprev: TCmDbField;
    FVlrirrf: TCmDbField;
    FNumlancmulta: TCmDbField;
    FVlrmulta: TCmDbField;
    FVlrDesconto: TcmDbField;
    FNumLancDesconto: TcmDbField;
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetCodnatureza(const Value: TCmDbField);
    procedure SetDataemisdarf(const Value: TCmDbField);
    procedure SetDatafinalapuracao(const Value: TCmDbField);
    procedure SetDatainiapuracao(const Value: TCmDbField);
    procedure SetDatapagtodarf(const Value: TCmDbField);
    procedure SetDatavencdarf(const Value: TCmDbField);
    procedure SetFlgimpresso(const Value: TCmDbField);
    procedure SetIdcidades(const Value: TCmDbField);
    procedure SetIddarf(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdprograma(const Value: TCmDbField);
    procedure SetMedidajudicial(const Value: TCmDbField);
    procedure SetNumdocumento(const Value: TCmDbField);
    procedure SetNumlancjuros(const Value: TCmDbField);
    procedure SetNumlancmulta(const Value: TCmDbField);
    procedure SetObsdarf(const Value: TCmDbField);
    procedure SetPercirrf(const Value: TCmDbField);
    procedure SetProcesso(const Value: TCmDbField);
    procedure SetReferencia(const Value: TCmDbField);
    procedure SetTipoprocesso(const Value: TCmDbField);
    procedure SetVara(const Value: TCmDbField);
    procedure SetVlrbasecalculo(const Value: TCmDbField);
    procedure SetVlrirrf(const Value: TCmDbField);
    procedure SetVlrjuros(const Value: TCmDbField);
    procedure SetVlrmulta(const Value: TCmDbField);
    procedure SetVlrtotal(const Value: TCmDbField);
    procedure SetVlrDesconto(const Value: TcmDbField);
    procedure SetNumLancDesconto(const Value: TcmDbField);

  public

     Property Vlrtotal: TCmDbField read FVlrtotal write SetVlrtotal;
     Property Vlrmulta: TCmDbField read FVlrmulta write SetVlrmulta;
     Property Vlrjuros: TCmDbField read FVlrjuros write SetVlrjuros;
     Property Vlrirrf: TCmDbField read FVlrirrf write SetVlrirrf;
     Property Vlrbasecalculo: TCmDbField read FVlrbasecalculo write SetVlrbasecalculo;
     Property Vara: TCmDbField read FVara write SetVara;
     Property Tipoprocesso: TCmDbField read FTipoprocesso write SetTipoprocesso;
     Property Referencia: TCmDbField read FReferencia write SetReferencia;
     Property Processo: TCmDbField read FProcesso write SetProcesso;
     Property Percirrf: TCmDbField read FPercirrf write SetPercirrf;
     Property Obsdarf: TCmDbField read FObsdarf write SetObsdarf;
     Property Numlancmulta: TCmDbField read FNumlancmulta write SetNumlancmulta;
     Property Numlancjuros: TCmDbField read FNumlancjuros write SetNumlancjuros;
     Property Numdocumento: TCmDbField read FNumdocumento write SetNumdocumento;
     Property Medidajudicial: TCmDbField read FMedidajudicial write SetMedidajudicial;
     Property Idprograma: TCmDbField read FIdprograma write SetIdprograma;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Iddarf: TCmDbField read FIddarf write SetIddarf;
     Property Idcidades: TCmDbField read FIdcidades write SetIdcidades;
     Property Flgimpresso: TCmDbField read FFlgimpresso write SetFlgimpresso;
     Property Datavencdarf: TCmDbField read FDatavencdarf write SetDatavencdarf;
     Property Datapagtodarf: TCmDbField read FDatapagtodarf write SetDatapagtodarf;
     Property Datainiapuracao: TCmDbField read FDatainiapuracao write SetDatainiapuracao;
     Property Datafinalapuracao: TCmDbField read FDatafinalapuracao write SetDatafinalapuracao;
     Property Dataemisdarf: TCmDbField read FDataemisdarf write SetDataemisdarf;
     Property Codnatureza: TCmDbField read FCodnatureza write SetCodnatureza;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;
     Property VlrDesconto : TcmDbField read FVlrDesconto write SetVlrDesconto;
     Property NumLancDesconto : TcmDbField read FNumLancDesconto write SetNumLancDesconto;
     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbDarf }

constructor TDbDarf.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DARF';

   fVlrtotal := CreateCmDbField('VLRTOTAL',ftfloat,False,False,False,True,'');
   fVlrmulta := CreateCmDbField('VLRMULTA',ftfloat,False,False,False,True,'');
   fVlrjuros := CreateCmDbField('VLRJUROS',ftfloat,False,False,False,True,'');
   fVlrirrf := CreateCmDbField('VLRIRRF',ftfloat,False,False,False,True,'');
   fVlrbasecalculo := CreateCmDbField('VLRBASECALCULO',ftfloat,False,False,False,True,'');
   fVara := CreateCmDbField('VARA',ftString,False,False,False,True,'');
   fTipoprocesso := CreateCmDbField('TIPOPROCESSO',ftString,False,False,False,True,'');
   fReferencia := CreateCmDbField('REFERENCIA',ftString,False,False,False,True,'');
   fProcesso := CreateCmDbField('PROCESSO',ftString,False,False,False,True,'');
   fPercirrf := CreateCmDbField('PERCIRRF',ftfloat,False,False,False,True,'');
   fObsdarf := CreateCmDbField('OBSDARF',ftString,False,False,False,True,'');
   fNumlancmulta := CreateCmDbField('NUMLANCMULTA',ftfloat,False,False,False,True,'');
   fNumlancjuros := CreateCmDbField('NUMLANCJUROS',ftfloat,False,False,False,True,'');
   fNumdocumento := CreateCmDbField('NUMDOCUMENTO',ftString,False,False,False,True,'');
   fMedidajudicial := CreateCmDbField('MEDIDAJUDICIAL',ftString,False,False,False,True,'');
   fIdprograma := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIddarf := CreateCmDbField('IDDARF',ftfloat,True,True,False,True,'');
   fIdcidades := CreateCmDbField('IDCIDADES',ftfloat,False,False,False,True,'');
   fFlgimpresso := CreateCmDbField('FLGIMPRESSO',ftString,False,False,False,True,'');
   fDatavencdarf := CreateCmDbField('DATAVENCDARF',ftDateTime,False,False,False,True,'');
   fDatapagtodarf := CreateCmDbField('DATAPAGTODARF',ftDateTime,False,False,False,True,'');
   fDatainiapuracao := CreateCmDbField('DATAINIAPURACAO',ftDateTime,False,False,False,True,'');
   fDatafinalapuracao := CreateCmDbField('DATAFINALAPURACAO',ftDateTime,False,False,False,True,'');
   fDataemisdarf := CreateCmDbField('DATAEMISDARF',ftDateTime,False,False,False,True,'');
   fCodnatureza := CreateCmDbField('CODNATUREZA',ftString,False,False,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'');
   FvlrDesconto := CreateCmDbField('VLRDESCONTO',ftfloat,False,False,False,True,'');
   FNumLancDesconto := CreateCmDbField('NUMLANCDESCONTO',ftfloat,False,False,False,True,'');
end;

function TDbDarf.Insert: Boolean;
begin

   fIddarf.AsFloat := GetSequence('DARF');
   Result := Inherited Insert;

end;

function TDbDarf.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbDarf.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbDarf.SetCodnatureza(const Value: TCmDbField);
begin
  FCodnatureza := Value;
end;

procedure TDbDarf.SetDataemisdarf(const Value: TCmDbField);
begin
  FDataemisdarf := Value;
end;

procedure TDbDarf.SetDatafinalapuracao(const Value: TCmDbField);
begin
  FDatafinalapuracao := Value;
end;

procedure TDbDarf.SetDatainiapuracao(const Value: TCmDbField);
begin
  FDatainiapuracao := Value;
end;

procedure TDbDarf.SetDatapagtodarf(const Value: TCmDbField);
begin
  FDatapagtodarf := Value;
end;

procedure TDbDarf.SetDatavencdarf(const Value: TCmDbField);
begin
  FDatavencdarf := Value;
end;

procedure TDbDarf.SetFlgimpresso(const Value: TCmDbField);
begin
  FFlgimpresso := Value;
end;

procedure TDbDarf.SetIdcidades(const Value: TCmDbField);
begin
  FIdcidades := Value;
end;

procedure TDbDarf.SetIddarf(const Value: TCmDbField);
begin
  FIddarf := Value;
end;

procedure TDbDarf.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbDarf.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbDarf.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbDarf.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

procedure TDbDarf.SetMedidajudicial(const Value: TCmDbField);
begin
  FMedidajudicial := Value;
end;

procedure TDbDarf.SetNumdocumento(const Value: TCmDbField);
begin
  FNumdocumento := Value;
end;

procedure TDbDarf.SetNumLancDesconto(const Value: TcmDbField);
begin
  FNumLancDesconto := Value;
end;

procedure TDbDarf.SetNumlancjuros(const Value: TCmDbField);
begin
  FNumlancjuros := Value;
end;

procedure TDbDarf.SetNumlancmulta(const Value: TCmDbField);
begin
  FNumlancmulta := Value;
end;

procedure TDbDarf.SetObsdarf(const Value: TCmDbField);
begin
  FObsdarf := Value;
end;

procedure TDbDarf.SetPercirrf(const Value: TCmDbField);
begin
  FPercirrf := Value;
end;

procedure TDbDarf.SetProcesso(const Value: TCmDbField);
begin
  FProcesso := Value;
end;

procedure TDbDarf.SetReferencia(const Value: TCmDbField);
begin
  FReferencia := Value;
end;

procedure TDbDarf.SetTipoprocesso(const Value: TCmDbField);
begin
  FTipoprocesso := Value;
end;

procedure TDbDarf.SetVara(const Value: TCmDbField);
begin
  FVara := Value;
end;

procedure TDbDarf.SetVlrbasecalculo(const Value: TCmDbField);
begin
  FVlrbasecalculo := Value;
end;

procedure TDbDarf.SetVlrDesconto(const Value: TcmDbField);
begin
  FVlrDesconto := Value;
end;

procedure TDbDarf.SetVlrirrf(const Value: TCmDbField);
begin
  FVlrirrf := Value;
end;

procedure TDbDarf.SetVlrjuros(const Value: TCmDbField);
begin
  FVlrjuros := Value;
end;

procedure TDbDarf.SetVlrmulta(const Value: TCmDbField);
begin
  FVlrmulta := Value;
end;

procedure TDbDarf.SetVlrtotal(const Value: TCmDbField);
begin
  FVlrtotal := Value;
end;

end.



