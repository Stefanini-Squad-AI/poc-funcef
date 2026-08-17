{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbCtrlinterface;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCtrlinterface = class(TCmDbObject)

  private
    FDatapagamento: TCmDbField;
    FDescricao: TCmDbField;
    FIdreferencia: TCmDbField;
    FFlgemitiucc: TCmDbField;
    FFlgpreparado: TCmDbField;
    FFlgatrasodevol: TCmDbField;
    FDataidainterface: TCmDbField;
    FDatavoltainterfa: TCmDbField;
    FVlrtotal: TCmDbField;
    FIdlote: TCmDbField;
    FFlgidainterface: TCmDbField;
    FMesreferencia: TCmDbField;
    FDatavoltatmp: TCmDbField;
    FFlgvoltainterface: TCmDbField;
    FNumreg: TCmDbField;
    FFlgtipofolha: TCmDbField;
    FTipo: TCmDbField;
    FFlgestado: TCmDbField;
    FDatapreparo: TCmDbField;
    FIdpessoa: TCmDbField;
    FFlgincluimesconc: TCmDbField;
    FFlgconcessao: TCmDbField;
    FFlgidatmp: TCmDbField;
    FDataidatmp: TCmDbField;
    FFlgtratado: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FDataemitiucc: TCmDbField;
    FFlgvoltatmp: TCmDbField;
    FCodportforma: TCmDbField;
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetDataemitiucc(const Value: TCmDbField);
    procedure SetDataidainterface(const Value: TCmDbField);
    procedure SetDataidatmp(const Value: TCmDbField);
    procedure SetDatapagamento(const Value: TCmDbField);
    procedure SetDatapreparo(const Value: TCmDbField);
    procedure SetDatavoltainterfa(const Value: TCmDbField);
    procedure SetDatavoltatmp(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgatrasodevol(const Value: TCmDbField);
    procedure SetFlgconcessao(const Value: TCmDbField);
    procedure SetFlgemitiucc(const Value: TCmDbField);
    procedure SetFlgestado(const Value: TCmDbField);
    procedure SetFlgidainterface(const Value: TCmDbField);
    procedure SetFlgidatmp(const Value: TCmDbField);
    procedure SetFlgincluimesconc(const Value: TCmDbField);
    procedure SetFlgpreparado(const Value: TCmDbField);
    procedure SetFlgtipofolha(const Value: TCmDbField);
    procedure SetFlgtratado(const Value: TCmDbField);
    procedure SetFlgvoltainterface(const Value: TCmDbField);
    procedure SetFlgvoltatmp(const Value: TCmDbField);
    procedure SetIdlote(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdreferencia(const Value: TCmDbField);
    procedure SetMesreferencia(const Value: TCmDbField);
    procedure SetNumreg(const Value: TCmDbField);
    procedure SetTipo(const Value: TCmDbField);
    procedure SetVlrtotal(const Value: TCmDbField);

  public

     Property Vlrtotal: TCmDbField read FVlrtotal write SetVlrtotal;
     Property Tipo: TCmDbField read FTipo write SetTipo;
     Property Numreg: TCmDbField read FNumreg write SetNumreg;
     Property Mesreferencia: TCmDbField read FMesreferencia write SetMesreferencia;
     Property Idreferencia: TCmDbField read FIdreferencia write SetIdreferencia;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idlote: TCmDbField read FIdlote write SetIdlote;
     Property Flgvoltatmp: TCmDbField read FFlgvoltatmp write SetFlgvoltatmp;
     Property Flgvoltainterface: TCmDbField read FFlgvoltainterface write SetFlgvoltainterface;
     Property Flgtratado: TCmDbField read FFlgtratado write SetFlgtratado;
     Property Flgtipofolha: TCmDbField read FFlgtipofolha write SetFlgtipofolha;
     Property Flgpreparado: TCmDbField read FFlgpreparado write SetFlgpreparado;
     Property Flgincluimesconc: TCmDbField read FFlgincluimesconc write SetFlgincluimesconc;
     Property Flgidatmp: TCmDbField read FFlgidatmp write SetFlgidatmp;
     Property Flgidainterface: TCmDbField read FFlgidainterface write SetFlgidainterface;
     Property Flgestado: TCmDbField read FFlgestado write SetFlgestado;
     Property Flgemitiucc: TCmDbField read FFlgemitiucc write SetFlgemitiucc;
     Property Flgconcessao: TCmDbField read FFlgconcessao write SetFlgconcessao;
     Property Flgatrasodevol: TCmDbField read FFlgatrasodevol write SetFlgatrasodevol;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Datavoltatmp: TCmDbField read FDatavoltatmp write SetDatavoltatmp;
     Property Datavoltainterfa: TCmDbField read FDatavoltainterfa write SetDatavoltainterfa;
     Property Datapreparo: TCmDbField read FDatapreparo write SetDatapreparo;
     Property Datapagamento: TCmDbField read FDatapagamento write SetDatapagamento;
     Property Dataidatmp: TCmDbField read FDataidatmp write SetDataidatmp;
     Property Dataidainterface: TCmDbField read FDataidainterface write SetDataidainterface;
     Property Dataemitiucc: TCmDbField read FDataemitiucc write SetDataemitiucc;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCtrlinterface }

constructor TDbCtrlinterface.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CTRLINTERFACE';

   fVlrtotal := CreateCmDbField('VLRTOTAL',ftfloat,False,False,False,True,'');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fTipo := CreateCmDbField('TIPO',ftString,False,False,False,True,'');
   fNumreg := CreateCmDbField('NUMREG',ftfloat,False,False,False,True,'');
   fMesreferencia := CreateCmDbField('MESREFERENCIA',ftString,False,False,False,True,'');
   fIdreferencia := CreateCmDbField('IDREFERENCIA',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdlote := CreateCmDbField('IDLOTE',ftfloat,True,True,False,True,'');
   fFlgvoltatmp := CreateCmDbField('FLGVOLTATMP',ftfloat,False,False,False,True,'');
   fFlgvoltainterface := CreateCmDbField('FLGVOLTAINTERFACE',ftfloat,False,False,False,True,'');
   fFlgtratado := CreateCmDbField('FLGTRATADO',ftfloat,False,False,False,True,'');
   fFlgtipofolha := CreateCmDbField('FLGTIPOFOLHA',ftfloat,False,False,False,True,'');
   fFlgpreparado := CreateCmDbField('FLGPREPARADO',ftfloat,False,False,False,True,'');
   fFlgincluimesconc := CreateCmDbField('FLGINCLUIMESCONC',ftfloat,False,False,False,True,'');
   fFlgidatmp := CreateCmDbField('FLGIDATMP',ftfloat,False,False,False,True,'');
   fFlgidainterface := CreateCmDbField('FLGIDAINTERFACE',ftfloat,False,False,False,True,'');
   fFlgestado := CreateCmDbField('FLGESTADO',ftfloat,False,False,False,True,'');
   fFlgemitiucc := CreateCmDbField('FLGEMITIUCC',ftfloat,False,False,False,True,'');
   fFlgconcessao := CreateCmDbField('FLGCONCESSAO',ftfloat,False,False,False,True,'');
   fFlgatrasodevol := CreateCmDbField('FLGATRASODEVOL',ftString,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fDatavoltatmp := CreateCmDbField('DATAVOLTATMP',ftDateTime,False,False,False,True,'');
   fDatavoltainterfa := CreateCmDbField('DATAVOLTAINTERFA',ftDateTime,False,False,False,True,'');
   fDatapreparo := CreateCmDbField('DATAPREPARO',ftDateTime,False,False,False,True,'');
   fDatapagamento := CreateCmDbField('DATAPAGAMENTO',ftDateTime,False,False,False,True,'');
   fDataidatmp := CreateCmDbField('DATAIDATMP',ftDateTime,False,False,False,True,'');
   fDataidainterface := CreateCmDbField('DATAIDAINTERFACE',ftDateTime,False,False,False,True,'');
   fDataemitiucc := CreateCmDbField('DATAEMITIUCC',ftDateTime,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
end;

function TDbCtrlinterface.Insert: Boolean;
begin

   fIdlote.AsFloat := GetSequence('CTRLINTERFACE');
   Result := Inherited Insert;

end;


procedure TDbCtrlinterface.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbCtrlinterface.SetDataemitiucc(const Value: TCmDbField);
begin
  FDataemitiucc := Value;
end;

procedure TDbCtrlinterface.SetDataidainterface(const Value: TCmDbField);
begin
  FDataidainterface := Value;
end;

procedure TDbCtrlinterface.SetDataidatmp(const Value: TCmDbField);
begin
  FDataidatmp := Value;
end;

procedure TDbCtrlinterface.SetDatapagamento(const Value: TCmDbField);
begin
  FDatapagamento := Value;
end;

procedure TDbCtrlinterface.SetDatapreparo(const Value: TCmDbField);
begin
  FDatapreparo := Value;
end;

procedure TDbCtrlinterface.SetDatavoltainterfa(const Value: TCmDbField);
begin
  FDatavoltainterfa := Value;
end;

procedure TDbCtrlinterface.SetDatavoltatmp(const Value: TCmDbField);
begin
  FDatavoltatmp := Value;
end;

procedure TDbCtrlinterface.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbCtrlinterface.SetFlgatrasodevol(const Value: TCmDbField);
begin
  FFlgatrasodevol := Value;
end;

procedure TDbCtrlinterface.SetFlgconcessao(const Value: TCmDbField);
begin
  FFlgconcessao := Value;
end;

procedure TDbCtrlinterface.SetFlgemitiucc(const Value: TCmDbField);
begin
  FFlgemitiucc := Value;
end;

procedure TDbCtrlinterface.SetFlgestado(const Value: TCmDbField);
begin
  FFlgestado := Value;
end;

procedure TDbCtrlinterface.SetFlgidainterface(const Value: TCmDbField);
begin
  FFlgidainterface := Value;
end;

procedure TDbCtrlinterface.SetFlgidatmp(const Value: TCmDbField);
begin
  FFlgidatmp := Value;
end;

procedure TDbCtrlinterface.SetFlgincluimesconc(const Value: TCmDbField);
begin
  FFlgincluimesconc := Value;
end;

procedure TDbCtrlinterface.SetFlgpreparado(const Value: TCmDbField);
begin
  FFlgpreparado := Value;
end;

procedure TDbCtrlinterface.SetFlgtipofolha(const Value: TCmDbField);
begin
  FFlgtipofolha := Value;
end;

procedure TDbCtrlinterface.SetFlgtratado(const Value: TCmDbField);
begin
  FFlgtratado := Value;
end;

procedure TDbCtrlinterface.SetFlgvoltainterface(const Value: TCmDbField);
begin
  FFlgvoltainterface := Value;
end;

procedure TDbCtrlinterface.SetFlgvoltatmp(const Value: TCmDbField);
begin
  FFlgvoltatmp := Value;
end;

procedure TDbCtrlinterface.SetIdlote(const Value: TCmDbField);
begin
  FIdlote := Value;
end;

procedure TDbCtrlinterface.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbCtrlinterface.SetIdreferencia(const Value: TCmDbField);
begin
  FIdreferencia := Value;
end;

procedure TDbCtrlinterface.SetMesreferencia(const Value: TCmDbField);
begin
  FMesreferencia := Value;
end;

procedure TDbCtrlinterface.SetNumreg(const Value: TCmDbField);
begin
  FNumreg := Value;
end;

procedure TDbCtrlinterface.SetTipo(const Value: TCmDbField);
begin
  FTipo := Value;
end;


procedure TDbCtrlinterface.SetVlrtotal(const Value: TCmDbField);
begin
  FVlrtotal := Value;
end;

end.



